-- Run in your Supabase project's SQL editor before enabling sync.
create table if not exists public.wildcard_profiles (
 user_id uuid primary key references auth.users(id) on delete cascade,
 payload jsonb not null default '{}'::jsonb,
 updated_at timestamptz not null default now()
);
alter table public.wildcard_profiles enable row level security;
revoke all on public.wildcard_profiles from anon;
grant select, insert, update, delete on public.wildcard_profiles to authenticated;
drop policy if exists "Owner can read" on public.wildcard_profiles;
drop policy if exists "Owner can insert" on public.wildcard_profiles;
drop policy if exists "Owner can update" on public.wildcard_profiles;
create policy "Owner can read" on public.wildcard_profiles for select to authenticated using ((select auth.uid()) = user_id);
create policy "Owner can insert" on public.wildcard_profiles for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "Owner can update" on public.wildcard_profiles for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
