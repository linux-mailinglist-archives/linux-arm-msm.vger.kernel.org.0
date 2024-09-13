Return-Path: <linux-arm-msm+bounces-31778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB038978A7B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 23:17:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10EF91F249FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 21:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FBAF150994;
	Fri, 13 Sep 2024 21:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pnVY9CSU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B78A126C01
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Sep 2024 21:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726262222; cv=none; b=uIVayKC2bbqJQ+4bw5irSY0CagUmtV8rtMaJ+8SNM7w4z4zm33F2mr2Wswc1AMSg4eIFipkjw83JPxScIwjdidQltrIDOFXcRv5FGYZHvJqQrsAKxzqJP8q7zfHx+EuWxKJgdy/DSwHwVFQApcfJMNknyUO3ZaGeyDrhMvQty0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726262222; c=relaxed/simple;
	bh=w/Elow+OWxz+VjrfiS8IAeJ1SWQ3w/+4Sh/qw86l5v4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rwpGttVJbc9uERY8JrKmCKZbAON+8rx04x0GrhLOLT2i+67+VsTFesdT0BYsIGpVbKyaZic0srlNJAxhhw6vJLPfsgMtqkqoYh/gKqs5zzt6bgaIRSz1LPaQk9BuVkDd9a9pv7FiWzZ7Uuir5HHYgdQi7UJMDQnqZ6RpCPsDDMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pnVY9CSU; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c247dd0899so1980a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Sep 2024 14:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726262216; x=1726867016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+08wwpwS/PNM0U47PlbfaYiE/AUzVFWbBAPJT/Z2d2U=;
        b=pnVY9CSUkk96akAbSRtqifOnbJxcXHNmbr+qNTya2dLQ8Vt+Jn5LWRmeIcd65DyzDu
         +zRhqlLVOvBwmVnkHIuSCWqCjV/Swh0uS/Xe0LmJt9Di4nK/X7xKqhYybtWJcyvEHkI0
         9R3RJUlYqrphQ01XGI1scRFE2XPZRc/kVGlT68FMnRsGHOl4ldp9ifHxctf882d/otCT
         L1PvZo1LluWQDodup5/1ZZMnD2nBOIXuVQL2H+4f9v38a4Mo2SHogRBeODwkabpdTemI
         OS+/iyaQrL1P0HQhqJKu5qB+cs4/s/by+9ZTQHgU698k4k7mkASgHCNDMyAHmKvx6qUD
         quxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726262216; x=1726867016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+08wwpwS/PNM0U47PlbfaYiE/AUzVFWbBAPJT/Z2d2U=;
        b=NZeGx0xGmS2CijrlTdUUlt4KVt6vQdtinlwWdkbyBI/B7h4tG8WcKI9ni+sihKed6Q
         mgF6KaxasI5sEA2YluP83LjML0RvqwJz3XPGodHRiuGH1bl/FYvH8mBzwWMBoYlD8Cjm
         qfGRYirByO4WwRp8cKOo0xKEI7JWtkEyWO4fl0T3//Hlu3EzReUru9DpMefGwy1fiC2n
         PtkQWfgY6fv19sN4r895h95X63wQ5zOJz+NL1RMrGaecv99l/iliHw0f8czVkJmPTu2B
         mxF49RuUeOrIZtqH6CkxOa9XrstFNd5vny7VZNGao8WFC9kn40FwEwYIwAoDP7d3fxef
         hTkw==
X-Forwarded-Encrypted: i=1; AJvYcCWW+EN1sUqShE1nGZfch3imAXbO6TcRuQ5RJbxHBpWXw3+t492r9TpNGujcQNmYNC+TQfda7+IQifi1lt8m@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd8/f3tN19t5FyBxAeNtdY1R1mDMudLt+fON/RoGyHQqodpoDI
	YTdE5oVpqcAkidxF4NXPXcEPcfHsZ38OQmpPqcS+QoRLf2tpm3+XhsxOEETEYmnC9se78Ifi1pn
	68YINR92rc+wa98OJu749LzGr1cEzTvD8F3qL
X-Google-Smtp-Source: AGHT+IFQoIZwTn2QtKE5WSXK2C/1mtbE1kNTOWp6u9YEOwMOYr/5UHeqn3N1ryiDGqeF/Nr5P/S+4LXEQOE1OZyq8js=
X-Received: by 2002:a05:6402:5242:b0:5c2:2d47:2868 with SMTP id
 4fb4d7f45d1cf-5c414612b2emr1274974a12.6.1726262215786; Fri, 13 Sep 2024
 14:16:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <SEZPR03MB6786D45BE387F2B378E71A84B4642@SEZPR03MB6786.apcprd03.prod.outlook.com>
 <ZuNVqvVgXLjNXS5Y@google.com> <CANP3RGfez2onSLVT2wC1hsSmKGxD9aFdV3we3Zsngw0BgbeGyw@mail.gmail.com>
 <TYZPR03MB67922FFDE5C9C925D8274677B4652@TYZPR03MB6792.apcprd03.prod.outlook.com>
In-Reply-To: <TYZPR03MB67922FFDE5C9C925D8274677B4652@TYZPR03MB6792.apcprd03.prod.outlook.com>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Fri, 13 Sep 2024 14:16:40 -0700
Message-ID: <CANP3RGfwL1OigoSkhmnRFDy=y+sstabiRAREPxEbEiEfuDaweQ@mail.gmail.com>
Subject: Re: [External] Re: [RFC] Proposal: Static SECCOMP Policies
To: Maxwell Bland <mbland@motorola.com>
Cc: Neill Kapron <nkapron@google.com>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Andrew Wheeler <awheeler@motorola.com>, 
	=?UTF-8?B?U2FtbXkgQlMyIFF1ZSB8IOmYmeaWjOeUnw==?= <quebs2@motorola.com>, 
	Todd Kjos <tkjos@google.com>, Viktor Martensson <vmartensson@google.com>, 
	Andy Lutomirski <luto@amacapital.net>, "keescook@chromium.org" <keescook@chromium.org>, 
	Will Drewry <wad@chromium.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, 
	kernel-team <kernel-team@android.com>, "adelva@google.com" <adelva@google.com>, 
	"jeffv@google.com" <jeffv@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 10:07=E2=80=AFAM Maxwell Bland <mbland@motorola.com=
> wrote:
>
> OK, after spending three hours working on this email, I think I know what=
 to do
> here. Since Moto's code for this stuff is forced to be open source anyway=
s,
> I'll spoil the solution:
>
> Add a hook to seccomp which triggers/enables hooks in BPF's JIT to instru=
ment
> the output machine code  page so that EL2 can (1) invert the machine code=
 back
> to BPF then (2) check the BPF corresponds to a valid seccomp filter polic=
y.

If you care that deeply about this: you could simply turn of jit
compilation of cBPF (including seccomp) - but you'll take a
performance hit.
If you care about performance you could only jit compile *recognized*
cBPF programs.
Hell, instead of jit-ing them you could replace them with outright
(pre)compiled into the kernel native functions that accomplish the
same thing.
There's probably only somewhere <10 of these in common use / part of
the platform.
That said, you'd still pay a performance hit for (Chrome web browser
style) sandboxes since those policies *will* be updated without os
updates.  Similarly with the mainline shipped cBPF code (which does
process all packets) - you can't guarantee it won't change.

> It would need to be kept up to date with whatever seccomp decides to do, =
but I
> can see a world where the result guarantees the code page has not been mo=
dified
> in transit and corresponds to a reasonable seccomp policy.
>
> I will say, I'm not the biggest fan of this. I am a fan of SYS_seccomp
> implicitly compiling the filters at build-time, so I can just know immedi=
ately
> what the new code pages "should be".

We/you simply don't know what all of the filters are going to be at
kernel/platform build time - because they're provided from outside the
platform.

I guess for the mainline shipped cBPF programs we could technically
probably swap them for eBPF.  Taking a quick glance at uses of
BpfClassic.h in aosp I see 6 socket filter cBPF programs, of which
only 1 is dynamic (for matching clat IP addresses), so the remaining 5
are probably trivial to eBPF-ify (and thus hide behind selinux
restrictions).

Or I guess you could just exempt CAP_NET_ADMIN privileged code from
the don't jit cBPF exception.

> That said, I think my solution also
> resolves the issue of an adversary using the BRK instruction padding to
> generate a "valid" codepage at an invalid offset.
>
> I've included a few other responses just for kicks, since you should know=
 I've
> been working hard on this problem for more than a year, I'm not just emai=
ling
> things to sound cool and waste time (OK maybe a little of that, but this =
is
> also a serious, honest effort to understand the problem!). (-:
>
> > If you can prove it isn't
>
> To test it yourself, it is easiest to add a printk statement under
> bpf_int_jit_compile,

I didn't say this doesn't get called at runtime.

I said (that I believe that) it doesn't get called for eBPF, only for cBPF.
cBPF is much more limited in what you can do with it.
(obviously it does get called for eBPF during the boot process by the
bpfloader as well, but that's super duper privileged code running as
root with capabilities...)

> or try to implement a system for checking the integrity of
> page table updates, or add a print statment to the page table update code=
 in
> vmalloc. or enable the CONFIG_PTDUMP_DEBUGFS options. Use my patch here i=
f you
> want to see decent output.
> https://lore.kernel.org/all/2bcb3htsjhepxdybpw2bwot2jnuezl3p5mnj5rhjwgitl=
sufe7@xzhkyntridw3/
> or I've also attached a kernel module which is a part of this "OpenKP" pr=
oject
> I am working on, which should provide a larger, open-source framework and
> standard for the ARM community to provide hypervisor-enforced code integr=
ity on
> Android / QCOM chipsets, so you can see 2% of the work I've done over the=
 past
> 2 years and test it out yourself. Uncomment the part under "DEBUG" and re=
ad
> through it, test it out.
>
> I can submit a formal patch with printk statements for you to test out if=
 that
> is needed? Or just trust me, lol. I'm probably going to just go work on
> that instrumentation step I mentioned earlier. (-:
>
> >selinux
>
> Note this whole loading is outside the scope of SELinux, it is a side-eff=
ect of
> the SYS_Seccomp system call as used by privileged system services.
>
> >cBPF [classic BPF, internally the kernel translates this to eBPF] is sti=
ll
> >allowed,
>
> These programs will not print out using PTRACE and are difficult to audit
> without patching the seccomp calls yourself because the ptrace call to
> PTRACE_SECCOMP_GET_FILTER will fail. I believe (have not checked) because=
 they
> are not cBPF, and seccomp's logic makes prog->fprog evaluates to null des=
pite
> prog existing if it is cBPF, at least on Android 14. I spent a whole day
> getting frustrated with the failing ptrace call before finally ending up =
my
> patches (attached to the end) that instrument ptrace and can print the
> programs.
>
> >a net loss for security if you did lock it down / break it
>
> I am a fan of seccomp and I don't want to break it and I don't want to "l=
ock it
> down", I want to ask people nicely to provide the code pages they want in=
 the
> kernel!
>
> Thanks,
> Maxwell Bland
>
> As a P.S., maybe I should add context, though I don't know whether it is
> needed:
> Many, many exploits for the kernel over the past decade rely on write
> gadgets to modify kernel resources, such as the exploit I linked in my or=
iginal
> email, Project Zero's recent
> https://googleprojectzero.blogspot.com/2023/09/analyzing-modern-in-wild-a=
ndroid-exploit.html
> or the more recent https://pwning.tech/nftables/. We can't begin to make =
honest
> progress on the existing exploits until we nail down the basic rule that
> privileged executable pages are immutable in Android. My goal is to event=
ually
> make a standard framework for EL2-based kernel protection open source, th=
en we
> have a counter of the 29,000ish writable datastructures,and well defined
> mechanisms for preventing malicious modification via write gadgets (like =
we see
> with kworker queues, task cred structs back in the day, etc, etc). Once I=
've
> locked down 1 and 3 of 1) integrity of loaded code pages, 2) system contr=
ol
> register modifications such as TCR (this is a pain in the *** because
> snapdragon chipsets are a pain in the *** sometimes), and 3) writing a co=
uple
> of testcases to lock-down kworker queues and other data structures (e.g. =
fops)
> at EL2 and fix, among other exploits,
> https://github.blog/security/vulnerability-research/the-android-kernel-mi=
tigations-obstacle-race/,
> I will work with Moto's legal to try and open source the solution and sen=
d it
> to the ARM mailing list, since eventually these hacks should be polished =
and
> made into kconfigs as part of the GKI for Android's good.
>
> This is all "goals" though, but I figured I would plug the effort.
>
> main.c:
>
> // SPDX-License-Identifier: GPL-2.0
> /*
>  * Copyright (C) 2023 Motorola Mobility, Inc.
>  *
>  * This program is free software; you can redistribute it and/or modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation.
>  *
>  * This program is distributed in the hope that it will be useful,
>  * but WITHOUT ANY WARRANTY; without even the implied warranty of
>  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>  * GNU General Public License for more details.
>  *
>  * Kernel module that hooks the vmalloc infrastructure to ensure that cod=
e
>  * pages are not interleaved with data pages unless at a PMD level granul=
arity.
>  * Must be loaded prior to other kernel mechanisms leveraging code page
>  * allocation, e.g. BPF, EROFS fixmap.
>  */
>
>
> #include <linux/kernel.h>
> #include <linux/bpf.h>
> #include <linux/mutex.h>
> #include <linux/atomic.h>
> #include <linux/highmem.h>
> #include <linux/kprobes.h>
> #include <linux/list.h>
> #include <linux/mm_types.h>
> #include <linux/module.h>
> #include <linux/of.h>
> #include <linux/of_platform.h>
> #include <linux/pagewalk.h>
> #include <linux/types.h>
> #include <linux/moduleloader.h>
> #include <linux/vmalloc.h>
> #include <linux/gfp_types.h>
> #include <linux/seccomp.h>
> #include <asm/pgalloc.h>
> #include <asm/ptrace.h>
> #include <asm/patching.h>
> #include <asm/module.h>
> #include <asm/page.h>
> #include <asm/seccomp.h>
>
> #ifdef SECCOMP_ARCH_NATIVE
> /**
>  * struct action_cache - per-filter cache of seccomp actions per
>  * arch/syscall pair
>  *
>  * @allow_native: A bitmap where each bit represents whether the
>  *                filter will always allow the syscall, for the
>  *                native architecture.
>  * @allow_compat: A bitmap where each bit represents whether the
>  *                filter will always allow the syscall, for the
>  *                compat architecture.
>  */
> struct action_cache {
>         DECLARE_BITMAP(allow_native, SECCOMP_ARCH_NATIVE_NR);
> #ifdef SECCOMP_ARCH_COMPAT
>         DECLARE_BITMAP(allow_compat, SECCOMP_ARCH_COMPAT_NR);
> #endif
> };
> #else
> struct action_cache { };
> #endif
>
> struct seccomp_filter {
>         refcount_t refs;
>         refcount_t users;
>         bool log;
>         bool wait_killable_recv;
>         struct action_cache cache;
>         struct seccomp_filter *prev;
>         struct bpf_prog *prog;
>         struct notification *notif;
>         struct mutex notify_lock;
>         wait_queue_head_t wqh;
> };
>
>
>
> void print_bpf_prog_aux(struct bpf_prog_aux *aux) {
>         printk("BPF Program Aux Details:\n");
>         printk("Ref Count: %lld\n", atomic64_read(&aux->refcnt));
>         printk("Used Map Count: %u\n", aux->used_map_cnt);
>         printk("Used BTF Count: %u\n", aux->used_btf_cnt);
>         printk("Max Context Offset: %u\n", aux->max_ctx_offset);
>         printk("Max Packet Offset: %u\n", aux->max_pkt_offset);
>         printk("Max TP Access: %u\n", aux->max_tp_access);
>         printk("Stack Depth: %u\n", aux->stack_depth);
>         printk("ID: %u\n", aux->id);
>         printk("Function Count: %u\n", aux->func_cnt);
>         printk("Function Index: %u\n", aux->func_idx);
>         printk("Attach BTF ID: %u\n", aux->attach_btf_id);
>         printk("Context Arg Info Size: %u\n", aux->ctx_arg_info_size);
>         printk("Max Read-Only Access: %u\n", aux->max_rdonly_access);
>         printk("Max Read-Write Access: %u\n", aux->max_rdwr_access);
>         printk("Attach BTF: %p\n", aux->attach_btf);
>         printk("Context Arg Info: %p\n", aux->ctx_arg_info);
>         printk("DST Mutex: %p\n", &aux->dst_mutex);
>         printk("DST Program: %p\n", aux->dst_prog);
>         printk("DST Trampoline: %p\n", aux->dst_trampoline);
>         printk("Saved DST Program Type: %d\n", aux->saved_dst_prog_type);
>         printk("Saved DST Attach Type: %d\n", aux->saved_dst_attach_type)=
;
>         printk("Verifier Zero Extension: %u\n", aux->verifier_zext);
>         printk("Attach BTF Trace: %u\n", aux->attach_btf_trace);
>         printk("Function Proto Unreliable: %u\n", aux->func_proto_unrelia=
ble);
>         printk("Sleepable: %u\n", aux->sleepable);
>         printk("Tail Call Reachable: %u\n", aux->tail_call_reachable);
>         printk("XDP Has Frags: %u\n", aux->xdp_has_frags);
>         printk("Attach Func Proto: %p\n", aux->attach_func_proto);
>         printk("Attach Func Name: %s\n", aux->attach_func_name);
>         printk("Functions: %p\n", aux->func);
>         printk("JIT Data: %p\n", aux->jit_data);
>         printk("Poke Table: %p\n", aux->poke_tab);
>         printk("Kfunc Table: %p\n", aux->kfunc_tab);
>         printk("Kfunc BTF Table: %p\n", aux->kfunc_btf_tab);
>         printk("Size Poke Table: %u\n", aux->size_poke_tab);
>         printk("Ksym: %p\n", &aux->ksym);
>         printk("Operations: %p\n", aux->ops);
>         printk("Used Maps: %p\n", aux->used_maps);
>         printk("Used Maps Mutex: %p\n", &aux->used_maps_mutex);
>         printk("Used BTFs: %p\n", aux->used_btfs);
>         printk("Program: %p\n", aux->prog);
>         printk("User: %p\n", aux->user);
>         printk("Load Time: %llu\n", aux->load_time);
>         printk("Verified Instructions: %u\n", aux->verified_insns);
>         printk("Cgroup Attach Type: %d\n", aux->cgroup_atype);
>         printk("Cgroup Storage: %p\n", aux->cgroup_storage);
>         printk("Name: %s\n", aux->name);
> }
>
> void print_bpf_prog_insnsi(struct bpf_insn * insns, uint64_t len) {
>         int i;
>         for (i =3D 0; i < len; i++) {
>                 const struct bpf_insn *insn =3D &insns[i];
>                 printk("BPF INSN %016llx\n", *((uint64_t *)insn));
>         }
> }
>
> void print_bpf_prog(struct bpf_prog *prog) {
>         printk("BPF Program Details:\n");
>         printk("Pages: %u\n", prog->pages);
>         printk("JITed: %u\n", prog->jited);
>         printk("JIT Requested: %u\n", prog->jit_requested);
>         printk("GPL Compatible: %u\n", prog->gpl_compatible);
>         printk("Control Block Access: %u\n", prog->cb_access);
>         printk("DST Needed: %u\n", prog->dst_needed);
>         printk("Blinding Requested: %u\n", prog->blinding_requested);
>         printk("Blinded: %u\n", prog->blinded);
>         printk("Is Function: %u\n", prog->is_func);
>         printk("Kprobe Override: %u\n", prog->kprobe_override);
>         printk("Has Callchain Buffer: %u\n", prog->has_callchain_buf);
>         printk("Enforce Expected Attach Type: %u\n", prog->enforce_expect=
ed_attach_type);
>         printk("Call Get Stack: %u\n", prog->call_get_stack);
>         printk("Call Get Func IP: %u\n", prog->call_get_func_ip);
>         printk("Timestamp Type Access: %u\n", prog->tstamp_type_access);
>         printk("Type: %d\n", prog->type);
>         printk("Expected Attach Type: %d\n", prog->expected_attach_type);
>         printk("Length: %u\n", prog->len);
>         printk("JITed Length: %u\n", prog->jited_len);
>         printk("Tag: ");
>         for (int i =3D 0; i < BPF_TAG_SIZE; i++) {
>                 printk("%02x", prog->tag[i]);
>         }
>         printk("\n");
>         printk("Stats: %p\n", prog->stats);
>         printk("Active: %p\n", prog->active);
>         printk("AUX FIELDS:\n");
>         print_bpf_prog_aux(prog->aux);
>         print_bpf_prog_insnsi(prog->insnsi, prog->len);
> }
>
>
> /* Functions we need for patching dynamic code allocations */
> typedef void *(*module_alloc_t)(unsigned long size);
> module_alloc_t module_alloc_ind;
> typedef void (*module_memfree_t)(void *module_region);
> module_memfree_t module_memfree_ind;
>
> /* TODO: actually we could probably just include "net/bpf_jit.h" */
> typedef int (*aarch64_insn_patch_text_nosync_t)(void *addr, u32 insn);
> aarch64_insn_patch_text_nosync_t aarch64_insn_patch_text_nosync_ind;
> typedef u32 (*aarch64_insn_gen_branch_imm_t)(unsigned long pc,
>                                              unsigned long addr,
> enum aarch64_insn_branch_type type);
> aarch64_insn_gen_branch_imm_t aarch64_insn_gen_branch_imm_ind;
> typedef u32 (*aarch64_insn_gen_hint_t)(enum aarch64_insn_hint_cr_op op);
> aarch64_insn_gen_hint_t aarch64_insn_gen_hint_ind;
> typedef u32 (*aarch64_insn_gen_branch_reg_t)(
>         enum aarch64_insn_register reg, enum aarch64_insn_branch_type typ=
e);
> aarch64_insn_gen_branch_reg_t aarch64_insn_gen_branch_reg_ind;
> typedef void *(*__vmalloc_node_range_t)(unsigned long size, unsigned long=
 align,
>                                         unsigned long start, unsigned lon=
g end,
>                                         gfp_t gfp_mask, pgprot_t prot,
>                                         unsigned long vm_flags, int node,
> const void *caller);
> __vmalloc_node_range_t __vmalloc_node_range_ind;
>
> /* Used for reworking the kprobe allocator */
> typedef int (*collect_garbage_slots_t)(struct kprobe_insn_cache *c);
> collect_garbage_slots_t collect_garbage_slots_ind;
>
> static struct kprobe kallsyms_lookup_name_kp =3D { .symbol_name =3D
>         "kallsyms_lookup_name",
> .addr =3D 0 };
> typedef unsigned long (*kallsyms_lookup_name_t)(const char *name);
> kallsyms_lookup_name_t kallsyms_lookup_name_ind;
>
> /* Functions we are patching */
> static struct kprobe alloc_vmap_area_kp =3D { .symbol_name =3D "alloc_vma=
p_area",
> .addr =3D 0 };
>
> /* DEBUG: bpf allocation printing */
> // static struct kprobe bpf_int_jit_compile_kp =3D { .symbol_name =3D "bp=
f_int_jit_compile",
> // .addr =3D 0 };
> static struct kprobe ptrace_request_kp =3D { .symbol_name =3D "ptrace_req=
uest",
> .addr =3D 0 };
> /* END DEBUG */
>
> /* Static variables that must be manually accessed for definition */
> u64 module_alloc_base;
> struct kprobe_insn_cache *kprobe_insn_slots_ptr;
>
> /**
>  * get_kp_addr - TODO comment rest of file
>  */
> static __always_inline void *get_kp_addr(struct kprobe *kp)
> {
>         void *res =3D 0;
>         if (register_kprobe(kp)) {
>                 pr_err("Error: moto_org_mem failed to get kp addr for %s\=
n",
>                        kp->symbol_name);
>                 return 0;
>         }
>         res =3D kp->addr;
>         unregister_kprobe(kp);
>         return res;
> }
>
> static void *bpf_jit_alloc_exec_handler(unsigned long size)
> {
>         return module_alloc_ind(size);
> }
>
> static void bpf_jit_free_exec_handler(void *addr)
> {
>         module_memfree_ind(addr);
> }
>
> static u64 bpf_jit_alloc_exec_limit_handler(void)
> {
>         return MODULES_END - MODULES_VADDR;
> }
>
> static void *alloc_insn_page_handler(void)
> {
>         return __vmalloc_node_range_ind(PAGE_SIZE, 1, module_alloc_base,
>                                         module_alloc_base + SZ_2G, GFP_KE=
RNEL,
>                                         PAGE_KERNEL_ROX, VM_FLUSH_RESET_P=
ERMS,
>                                         NUMA_NO_NODE,
>         __builtin_return_address(0));
> }
>
> static bool allocation_balance =3D false;
>
> /**
>  * alloc_vmap_area_pre_handler - adjusts vstart, vend to not interleave c=
ode/data
>  *
>  * Right now, vmalloc infrastructure does the following:
>  * |<-----data----->||<-----code and data pages----->||<-----data----->|
>  * Maintainers likely do not want to touch vmalloc internals for fear of
>  * breaking everything, so we provide an open-source work-around with hop=
es
>  * that these fixes will make their way into the mainline kernel.
>  *
>  * We adjust the parameters to the call to avoid the code memory range by
>  * selecting the lower half, then in a separate post handler, we check wh=
ether
>  * the allocation failed, and if so, run the allocation with the upper ha=
lf.
>  *
>  * TODO: we need to remove the flip/flopping and properly segment the mem=
ory
>  * here, but it is not clear how to do this without modifying core vmallo=
c
>  * infrastructure. See upstream patch here:
>  * https://lore.kernel.org/all/20240423095843.446565600-1-mbland@motorola=
.com/#t
>  *
>  * Parameters are passed in the arm64 linux kernel following the AAPCS64 =
ABI
>  * convention, and thus it is safe to interpolate based upon the signatur=
e
>  * the location of the specific values for vstart and vend.
>  * https://github.com/ARM-software/abi-aa/blob/main/aapcs64/aapcs64.rst
>  */
> static int alloc_vmap_area_handler(struct kprobe *kp, struct pt_regs *reg=
s)
> {
>         unsigned long size;
>         unsigned long vstart;
>         size =3D regs->regs[0];
>         vstart =3D regs->regs[2];
>         if (vstart =3D=3D VMALLOC_START) { /* We are attempting to vmallo=
c data */
>                 /* Everything is fine, do nothing */
>                 if (module_alloc_base + SZ_2G <=3D VMALLOC_START ||
>                         module_alloc_base > VMALLOC_END)
>                 return 0;
>
>                 allocation_balance =3D !allocation_balance;
>
>                 /* Not enough room below, else if not enough room above *=
/
>                 if (module_alloc_base - VMALLOC_START < size)
>                         allocation_balance =3D true;
>                         else if (VMALLOC_END - module_alloc_base + SZ_2G =
< size)
>                         allocation_balance =3D false;
>
>                 /* Allocate from higher valued addresses or lower valued
>                  * address evenly. since these are virtual it does not
>                  * really matter */
>                 if (allocation_balance) {
>                         regs->regs[2] =3D module_alloc_base + SZ_2G;
>                 } else {
>                         regs->regs[3] =3D module_alloc_base;
>                 }
>         }
>
>         return 0;
> }
>
> /* DEBUG: Analyze allocated BPF programs */
> // static int bpf_int_jit_compile_handler(struct kprobe *kp, struct pt_re=
gs *regs)
> // {
> //         // struct bpf_prog *prog =3D (struct bpf_prog *)regs->regs[0];
> //         // print_bpf_prog(prog);
> //         return 0;
> // }
> //
> static int ptrace_request_handler(struct kprobe *kp, struct pt_regs *regs=
)
> {
>         struct task_struct *task =3D (struct task_struct *)regs->regs[0];
>         long request =3D regs->regs[1];
>         unsigned long addr =3D regs->regs[2];
>         struct seccomp_filter *filter;
>         if (request !=3D 0x420c) {
>                 return 0;
>         }
>         if (addr !=3D 13371337) {
>                 printk("waiting for regs ... %llx\n", regs->regs[1]);
>                 return 0;
>         }
>
>         if (!task)
>         {
>                 printk("ptrace_request_handler no task\n");
>                 return 0;
>         }
>
>         filter =3D READ_ONCE(task->seccomp.filter);
>         printk("TASK PID %d or %d\n", task->pid, pid_vnr(task_pgrp(task))=
);
>         if (!filter) {
>                 printk("ptrace_request_handler no filter\n");
>                 return 0;
>         }
>         if (filter->prog)
>                 print_bpf_prog(filter->prog);
>
>         return 0;
> }
> /* END DEBUG */
>
>
> void __always_inline patch_jump_to_handler(void *faddr, void *helper)
> {
>         u32 insn;
>         insn =3D aarch64_insn_gen_branch_imm_ind((unsigned long)faddr,
>                                                (unsigned long)helper,
>         AARCH64_INSN_BRANCH_NOLINK);
>         aarch64_insn_patch_text_nosync_ind(faddr, insn);
> }
>
> struct kprobe_insn_page {
>         struct list_head list;
>         kprobe_opcode_t *insns; /* Page of instruction slots */
>         struct kprobe_insn_cache *cache;
>         int nused;
>         int ngarbage;
>         char slot_used[];
> };
>
> void free_insn_pages(struct kprobe_insn_cache *kic)
> {
>         struct kprobe_insn_page *kip;
>         unsigned int i =3D 0;
>
>         /* TODO: Since the slot array is not protected by rcu, we need a =
mutex,
>          * but we are also should be the only thing running that is touch=
ing
>          * the kprobes */
>         list_for_each_entry_rcu (kip, &kic->pages, list) {
>                 for (i =3D 0; i < kip->nused; i++) {
>                         kip->slot_used[i] =3D 0;
>                         kip->nused--;
>                 }
>                 list_del_rcu(&kip->list);
>                 synchronize_rcu();
>                 kip->cache->free(kip->insns);
>                 kfree(kip);
>         }
> }
>
> /**
>  * mod_init - TODO
>  *
>  * TODO FAIL IF ANY OF THE BELOW FAILS
>  */
> static int __init mod_init(void)
> {
>         void *bpf_jit_alloc_exec_addr =3D 0;
>         void *bpf_jit_free_exec_addr =3D 0;
>         void *bpf_jit_alloc_exec_limit_addr =3D 0;
>         void *alloc_insn_page_addr =3D 0;
>         kallsyms_lookup_name_ind =3D
>                 (kallsyms_lookup_name_t)get_kp_addr(&kallsyms_lookup_name=
_kp);
>
>         module_alloc_ind =3D
>                 (module_alloc_t)kallsyms_lookup_name_ind("module_alloc");
>         module_memfree_ind =3D
>                 (module_memfree_t)kallsyms_lookup_name_ind("module_memfre=
e");
>         __vmalloc_node_range_ind =3D
>                 (__vmalloc_node_range_t)kallsyms_lookup_name_ind(
>                         "__vmalloc_node_range");
>         aarch64_insn_patch_text_nosync_ind =3D
>                 (aarch64_insn_patch_text_nosync_t)kallsyms_lookup_name_in=
d(
>                         "aarch64_insn_patch_text_nosync");
>         aarch64_insn_gen_branch_imm_ind =3D
>                 (aarch64_insn_gen_branch_imm_t)kallsyms_lookup_name_ind(
>                         "aarch64_insn_gen_branch_imm");
>         aarch64_insn_gen_hint_ind =3D
>                 (aarch64_insn_gen_hint_t)kallsyms_lookup_name_ind(
>                         "aarch64_insn_gen_hint");
>         aarch64_insn_gen_branch_reg_ind =3D
>                 (aarch64_insn_gen_branch_reg_t)kallsyms_lookup_name_ind(
>                         "aarch64_insn_gen_branch_reg");
>
>         collect_garbage_slots_ind =3D
>                 (collect_garbage_slots_t)kallsyms_lookup_name_ind(
>                         "collect_garbage_slots");
>
>         bpf_jit_alloc_exec_addr =3D
>                 (void *)kallsyms_lookup_name_ind("bpf_jit_alloc_exec");
>         bpf_jit_free_exec_addr =3D
>                 (void *)kallsyms_lookup_name_ind("bpf_jit_free_exec");
>         bpf_jit_alloc_exec_limit_addr =3D
>                 (void *)kallsyms_lookup_name_ind("bpf_jit_alloc_exec_limi=
t");
>         alloc_insn_page_addr =3D
>                 (void *)kallsyms_lookup_name_ind("alloc_insn_page");
>
>         module_alloc_base =3D
>                 *((u64 *)kallsyms_lookup_name_ind("module_alloc_base"));
>
>         patch_jump_to_handler(bpf_jit_alloc_exec_addr,
>                               bpf_jit_alloc_exec_handler);
>         patch_jump_to_handler(bpf_jit_free_exec_addr,
>                               bpf_jit_free_exec_handler);
>         patch_jump_to_handler(bpf_jit_alloc_exec_limit_addr,
>                               bpf_jit_alloc_exec_limit_handler);
>         patch_jump_to_handler(alloc_insn_page_addr, alloc_insn_page_handl=
er);
>
>         /*
>          * Under the hood, arm64 calls __get_insn_slot to generate memory=
 pages for
>          * kprobes, and these memory pages *supposedly* access an indirec=
t pointer to
>          * their allocation function through kprobe_insn_slots. Because w=
e allocated
>          * a kprobe in order to access kallsyms_lookup_name, one page is =
already allocated.
>          * However, even kprobe garbage collection cowardly refuses to ki=
ll the last page,
>          * so we have our own free routine that nixes that last survivor.
>          */
>         kprobe_insn_slots_ptr =3D
>                 (struct kprobe_insn_cache *)kallsyms_lookup_name_ind(
>         "kprobe_insn_slots");
>         free_insn_pages(kprobe_insn_slots_ptr);
>
>         alloc_vmap_area_kp.pre_handler =3D alloc_vmap_area_handler;
>         if (register_kprobe(&alloc_vmap_area_kp)) {
>                 pr_err("moto_org_mem.ko failed to hook alloc_vmap_area!\n=
");
>                 return -EACCES;
>         }
>
>         /* DEBUG */
>         // bpf_int_jit_compile_kp.pre_handler =3D bpf_int_jit_compile_han=
dler;
>         // if (register_kprobe(&bpf_int_jit_compile_kp)) {
>         //         pr_err("moto_org_mem.ko failed to hook bpf_int_jit_com=
pile!\n");
>         //         return -EACCES;
>         // }
>
>         ptrace_request_kp.pre_handler =3D ptrace_request_handler;
>         if (register_kprobe(&ptrace_request_kp)) {
>                 pr_err("moto_org_mem.ko failed to hook ptrace_request_kp!=
\n");
>                 return -EACCES;
>         }
>
>         /* END DEBUG */
>         pr_info("moto_org_mem loaded!\n");
>
>         return 0;
> }
>
> static void __exit mod_exit(void)
> {
> }
>
> module_init(mod_init);
> module_exit(mod_exit);
>
> MODULE_LICENSE("GPL v2");
> MODULE_AUTHOR("Maxwell Bland <mbland@motorola.com>");
> MODULE_DESCRIPTION("Organizes the vmalloc memory code pages are not inter=
leaved "
>                    "with data pages.");
>
>
>
> ________________________________________
> From: Maciej =C5=BBenczykowski <maze@google.com>
> Sent: Thursday, September 12, 2024 4:39 PM
> To: Neill Kapron
> Cc: Maxwell Bland; linux-arm-msm@vger.kernel.org; Andrew Wheeler; Sammy B=
S2 Que | =E9=98=99=E6=96=8C=E7=94=9F; Todd Kjos; Viktor Martensson; Andy Lu=
tomirski; keescook@chromium.org; Will Drewry; Andy Gross; Bjorn Andersson; =
Konrad Dybcio; kernel-team; adelva@google.com; jeffv@google.com
> Subject: [External] Re: [RFC] Proposal: Static SECCOMP Policies
>
> wrt. BPF on Android:
>
> (a) eBPF should already be locked down to just the bpfloader boot time pr=
ocess.
>
> If you can prove it isn't, please let us know, but as this is sepolicy
> around the bpf(BPF_PROG_LOAD) system call, it should be pretty
> airtight:
>
> allow bpfloader self:bpf { ... prog_load ... };
> ...
> neverallow { domain -bpfloader } *:bpf prog_load;
>
> (basically the only exception to the above is root/su on userdebug/eng
> builds, which runs sepolicy in permissive mode and thus doesn't
> enforce the above - but that obviously doesn't matter for user builds)
>
> (b) cBPF [classic BPF, internally the kernel translates this to eBPF]
> is still allowed, for both seccomp() and normal old style socket
> filters
>
> - bpf seccomp() is to the best of my knowledge used by normal play
> store updatable applications (including the chrome web browser) for
> sandboxing (of rendering processes), as such it would be basically
> impossible to lock it down (as apps update independently of the rest
> of the system) - and would probably be a net loss for security if you
> did lock it down / break it...
>
> If you wanted to pursue this you'd need to get agreement from Chrome &
> other applications and provide some 'better' alternative.  Likely some
> sort of hard coded seccomp version that blocks things that most
> sandboxing apps agree is beneficial to block...
>
> (bpf seccomp() is also used by the Android zygote itself to block
> various extra system calls from processes/apps it spawns, but as this
> list is hardcoded at build time, it's not actually a problem)
>
> - similarly old style BPF socket filters are 'normal' 'ancient'
> BSD/Unix/Linux API.  They're used in the (privileged) network stack
> itself (which is mainline updatable via the play store, including the
> cbpf code), but could also AFAIK be used by random play store
> applications - filtering on sockets is truly ancient api.
> https://www.tcpdump.org/papers/bpf-usenix93.pdf is from 1992
>
> -
>
> Is there some eBPF program loading API I'm not aware of that we thus
> haven't blocked?
>
> On Thu, Sep 12, 2024 at 1:57=E2=80=AFPM Neill Kapron <nkapron@google.com>=
 wrote:
> >
> > On Thu, Sep 12, 2024 at 04:02:53PM +0000, Maxwell Bland wrote:
> > > (Resending as plaintext for msm-kernel mailing list.
> > > Original message was intended for android kernel team
> > > though msm-kernel should be aware.)
> > >
> > > Hi Kernel Team,
> > >
> > > + Kees, Andy, and Will since their input may be valuable.
> > >
> > > It has been a while! (~9 months to be exact). This January, I sent ou=
t a small
> > > message on BPF code loading ("unprivileged BPF considered harmful" or=
 something
> > > like that). In it, I noted new BPF programs are compiled all the time=
 and
> > > thrown into the kernel. At the time, I did not know these programs we=
re just
> > > compiled seccomp filter policies, loaded in as new BPF programs conti=
nuously
> > > through the libminijail interface as well as direct syscall. As of tw=
o days
> > > ago, I now know this (and now you do too, if not already).
> > >
> > > OK, yes, syscall filtering is very important, but this is creating a =
catch-22
> > > issue. For one, see step (4) under "Exploitation overview" for
> > > https://www.qualys.com/2021/07/20/cve-2021-33909/sequoia-local-privil=
ege-escalation-linux.txt.
> > > Second, this minor lack of caching is adding load time to more than 9=
0
> > > binaries/services on the standard QCOM baseline=E2=80=94I'll admit, i=
t is probably
> > > negligible in the grand scheme of things (a quick approximation puts =
the data
> > > operated on around 0.1188 MB). But most importantly, third, without s=
ome degree
> > > of provenance, I have no way of telling if someone has injected malic=
ious code
> > > into the kernel, and unfortunately even knowing the correct bytes is =
still
> > > "iffy", as in order to prevent JIT spray attacks, each of these filte=
rs is
> > > offset by some random number of uint32_t's, making every 4-byte shift=
 of the
> > > filter a "valid" codepage to be loaded at runtime.
> > >
> > > You might be thinking, "but wait, bionic's libc only defines a couple=
 of
> > > restricted policies, primary and secondary for system and user apps
> > > respectively." I know! For the most part, apps fall into either what =
I presume
> > > is the default app/system policies, but there are lots of QCOM binari=
es and
> > > other magic programs (dolby dax) that are sending up these programs a=
s well.
> > > I'm seeing more than 20 different programs for around a minute's wort=
h of
> > > runtime. One example is attached at the end.
> > >
> > > So, the proposal: a "CONFIG_SECCOMMP_STATIC_POLICY" for seccomp. This
> > > would change the Android kernel's generic SYS_seccomp call, which tak=
es in a
> > > filter with an array of BPF instructions, to instead reference an ID =
which
> > > corresponds to a fixed file on /sys/bpf/seccomp or something like tha=
t. The
> > > sandboxing behavior of these apps should be known at compile-time, ev=
en if
> > > there are multiple "permission set types" that may need to be dispatc=
hed. User
> > > apps should always have a single, fixed policy. This way it is possib=
le to say
> > > for every code page loaded into the kernel where it came from and wha=
t it
> > > should look like.
> > >
> > > Unfortunately, I do not know Motorola has enough "weight" to convince=
 QCOM to
> > > do the right foundational thing here, or to "define" the seccomp APIs=
 for
> > > Android, so it would be good to have Google's buy in, know if there a=
re plans
> > > to fix this issue, or some discussion of how to best fix the problem?=
 If
> > > anything, a contact at QCOM that might be able to actually hunt down =
and
> > > document valid bytes for these policies?
> > >
> > > The end goal is simple: when we see a code page is allocated in the k=
ernel, we
> > > can be sure that (1) it isn't malicious and (2) has not been modified=
 in
> > > transit. I'm fine putting code where my mouth is, but right now that =
code
> > > would involve having to fingerprint the signatures loaded by Qualcomm
> > > components every time a new one is released, or pinging Google with a=
 huge
> > > patch changing how seccomp works with no idea of what requirements QC=
OM may
> > > have on seccomp policy generation.
> > >
> > > Thoughts? Is this doable, and if not, why? I'd also love help with th=
e code and
> > > adapting existing minijail code to use a new, more integrity-preservi=
ng
> > > interface. If I am mistaken and it is possible to grab out valid BPF =
policy
> > > code at compile time, please let me know how!
> > >
> > > Regards,
> > > Maxwell Bland
> > >
> > > Standard filter, (from, for example, com.google.android.gms)
> > > "ac00000000000000ac77000000000000bf160000000000006160040000000000b402=
0000b70000c01d20020000000000b4000000000000009500000000000000616000000000000=
055000200cb000000b40000000000ff7f95000000000000005500020019000000b400000000=
00ff7f950000000000000055000200ce000000b40000000000ff7f950000000000000055000=
200c6000000b40000000000ff7f95000000000000005500020042000000b40000000000ff7f=
950000000000000055000100de00000005007b000000000055000200d7000000b4000000000=
0ff7f950000000000000055000200d8000000b40000000000ff7f9500000000000000550001=
00e200000005008f000000000055000200a7000000b40000000000ff7f95000000000000005=
500020038000000b40000000000ff7f95000000000000005500020062000000b40000000000=
ff7f95000000000000005500020039000000b40000000000ff7f95000000000000005500020=
03f000000b40000000000ff7f95000000000000005500020040000000b40000000000ff7f95=
000000000000005500020050000000b40000000000ff7f9500000000000000550002004e000=
000b40000000000ff7f9500000000000000550002002c000000b40000000000ff7f95000000=
000000005500020043000000b40000000000ff7f9500000000000000550002001d000000b40=
000000000ff7f95000000000000005500020030000000b40000000000ff7f95000000000000=
005500020071000000b40000000000ff7f950000000000000055000200ae000000b40000000=
000ff7f950000000000000055000200a3000000b40000000000ff7f95000000000000005500=
020086000000b40000000000ff7f95000000000000005500020042000000b40000000000ff7=
f950000000000000055000200e9000000b40000000000ff7f9500000000000000550002003e=
000000b40000000000ff7f95000000000000005500020087000000b40000000000ff7f95000=
000000000005500020019000000b40000000000ff7f9500000000000000550002005c000000=
b40000000000ff7f95000000000000005500020016010000b40000000000ff7f95000000000=
0000055000200dc000000b40000000000ff7f95000000000000005500020060000000b40000=
000000ff7f950000000000000055000200dd000000b40000000000ff7f95000000000000005=
500020078000000b40000000000ff7f9500000000000000550002005e000000b40000000000=
ff7f9500000000000000550002008b000000b40000000000ff7f95000000000000005500020=
080000000b40000000000ff7f950000000000000055000200cb000000b40000000000ff7f95=
0000000000000055000100c600000005004c0000000000550002005d000000b40000000000f=
f7f950000000000000055000200ac000000b40000000000ff7f950000000000000055000200=
84000000b40000000000ff7f9500000000000000550002008c000000b40000000000ff7f950=
0000000000000550002003d000000b40000000000ff7f950000000000000055000200170000=
00b40000000000ff7f9500000000000000b4000000000003009500000000000000050000000=
00000006160200000000000630afcff000000006160240000000000630af8ff000000004500=
03000000000061a0fcff0000000045000100040000000500010000000000050001000000000=
005000e000000000005000000000000006160200000000000630afcff000000006160240000=
000000630af8ff00000000450003000000000061a0fcff00000000450001000200000005000=
10000000000050001000000000005000300000000000500000000000000b400000000000300=
95000000000000000500000000000000b40000000000ff7f950000000000000005000000000=
000006160200000000000630afcff000000006160240000000000630af8ff00000000450003=
000000000061a0fcff000000004500010004000000050001000000000005000100000000000=
5000e000000000005000000000000006160200000000000630afcff00000000616024000000=
0000630af8ff00000000450003000000000061a0fcff0000000045000100020000000500010=
000000000050001000000000005000300000000000500000000000000b40000000000030095=
000000000000000500000000000000b40000000000ff7f95000000000000000500000000000=
0006160100000000000630afcff000000006160140000000000630af8ff0000000055000200=
0000000061a0fcff00000000150001000100000005000100000000000500030000000000050=
0000000000000b40000000000030095000000000000000500000000000000b40000000000ff=
7f9500000000000000",
> > > Unknown filter (from QCOM's /vendor/bin/qesdk-secmanager)
> > >  "ac00000000000000ac77000000000000bf160000000000006160040000000000b40=
20000b70000c01d20020000000000b400000000000000950000000000000061600000000000=
0055000200cb000000b40000000000ff7f95000000000000005500020019000000b40000000=
000ff7f950000000000000055000200ce000000b40000000000ff7f95000000000000005500=
0200c6000000b40000000000ff7f95000000000000005500020042000000b40000000000ff7=
f950000000000000055000100de00000005007e000000000055000100e20000000500980000=
00000055000200d7000000b40000000000ff7f950000000000000055000200a7000000b4000=
0000000ff7f95000000000000005500020062000000b40000000000ff7f9500000000000000=
550002001d000000b40000000000ff7f95000000000000005500020038000000b4000000000=
0ff7f9500000000000000550002003f000000b40000000000ff7f9500000000000000550002=
0039000000b40000000000ff7f95000000000000005500020050000000b40000000000ff7f9=
500000000000000550002004e000000b40000000000ff7f9500000000000000550002004f00=
0000b40000000000ff7f950000000000000055000200d8000000b40000000000ff7f9500000=
0000000005500020043000000b40000000000ff7f9500000000000000550002002c000000b4=
0000000000ff7f95000000000000005500020087000000b40000000000ff7f9500000000000=
0005500020086000000b40000000000ff7f95000000000000005500020030000000b4000000=
0000ff7f950000000000000055000200ae000000b40000000000ff7f9500000000000000550=
0020016010000b40000000000ff7f95000000000000005500020019000000b40000000000ff=
7f95000000000000005500020042000000b40000000000ff7f950000000000000055000200d=
c000000b40000000000ff7f9500000000000000550002005e000000b40000000000ff7f9500=
000000000000550002007b000000b40000000000ff7f9500000000000000550002005d00000=
0b40000000000ff7f950000000000000055000200ac000000b40000000000ff7f9500000000=
0000005500020084000000b40000000000ff7f950000000000000055000200a3000000b4000=
0000000ff7f95000000000000005500020080000000b40000000000ff7f9500000000000000=
5500020078000000b40000000000ff7f950000000000000055000200dd000000b4000000000=
0ff7f950000000000000055000100c600000005005800000000005500020060000000b40000=
000000ff7f9500000000000000550002008b000000b40000000000ff7f95000000000000005=
5000200cb000000b40000000000ff7f95000000000000005500020071000000b40000000000=
ff7f95000000000000005500020040000000b40000000000ff7f95000000000000005500020=
03b000000b40000000000ff7f950000000000000055000200e9000000b40000000000ff7f95=
0000000000000055000200b2000000b40000000000ff7f9500000000000000550002008c000=
000b40000000000ff7f950000000000000055000200d8000000b40000000000ff7f95000000=
00000000b400000000000300950000000000000005000000000000006160200000000000630=
afcff000000006160240000000000630af8ff00000000450003000000000061a0fcff000000=
0045000100040000000500010000000000050001000000000005000e0000000000050000000=
00000006160200000000000630afcff000000006160240000000000630af8ff000000004500=
03000000000061a0fcff0000000045000100020000000500010000000000050001000000000=
005000300000000000500000000000000b40000000000030095000000000000000500000000=
000000b40000000000ff7f950000000000000005000000000000006160200000000000630af=
cff000000006160240000000000630af8ff00000000450003000000000061a0fcff00000000=
45000100040000000500010000000000050001000000000005000e000000000005000000000=
000006160200000000000630afcff000000006160240000000000630af8ff00000000450003=
000000000061a0fcff000000004500010002000000050001000000000005000100000000000=
5000300000000000500000000000000b4000000000003009500000000000000050000000000=
0000b40000000000ff7f950000000000000005000000000000006160100000000000630afcf=
f000000006160140000000000630af8ff00000000550002000000000061a0fcff0000000015=
00010001000000050001000000000005000300000000000500000000000000b400000000000=
30095000000000000000500000000000000b40000000000ff7f9500000000000000",
> > >
> > > List of services loading seccomp filters pulled from one run of the p=
hone:
> > > com.google.android.deskclock
> > > /vendor/bin/qesdk-secmanager
> > > media.hwcodec/vendor.qti.media.c2@1.0-service
> > > media.audio.qc.codec.qti.media.c2audio@1.0-service
> > > /vendor/bin/vendor.qti.qspmhal-service
> > > /vendor/bin/qsap_sensors
> > > media.extractoraextractor
> > > /system_ext/bin/perfservice
> > > /vendor/bin/wfdhdcphalservice
> > > /vendor/bin/wifidisplayhalservice
> > > /vendor/bin/qsap_dcfd
> > > /vendor/bin/qms
> > > /vendor/bin/qsap_location
> > > /vendor/bin/qsap_qapeservice
> > > /vendor/bin/wfdvndservice
> > > media.swcodecoid.media.swcodec/bin/mediaswcodec
> > > /vendor/bin/hw/qcrilNrd
> > > qsap_qms_13qms16
> > > qsap_qms_24qms17
> > > /vendor/bin/ATFWD-daemon
> > > /vendor/bin/hw/sxrservice
> > > /vendor/bin/hw/qcrilNrd-c2
> > > system_server
> > > /vendor/bin/qmi_motext_hook1013170
> > > /vendor/bin/qmi_motext_hook1013171
> > > /vendor/bin/ims_rtp_daemon
> > > com.android.systemui
> > > webview_zygote
> > > com.dolby.daxservice
> > > vendor.qti.qesdk.sysservice
> > > org.codeaurora.ims
> > > com.android.se
> > > com.android.phone
> > > com.qti.qcc
> > > com.google.android.ext.services
> > > com.google.android.gms
> > > com.google.android.euicc
> > > com.google.android.googlequicksearchbox:interactor
> > > com.google.android.apps.messaging:rcs
> > > com.android.nfc
> > > com.qualcomm.qti.workloadclassifier
> > > com.qualcomm.location
> > > com.google.android.gms.unstable
> > > com.thundercomm.ar.core
> > > com.android.vending:background
> > > com.android.vending:quick_launch
> > > com.android.dynsystem
> > > com.android.managedprovisioning
> > > com.android.shell
> >
> >
> > + Jeff, Alistair, and Maciej
> >
> > Maxwell,
> >
> > Thanks for the details on this, I have added several people who may be
> > better suited to comment on this.
> >
> > Neill

--
Maciej =C5=BBenczykowski, Kernel Networking Developer @ Google

