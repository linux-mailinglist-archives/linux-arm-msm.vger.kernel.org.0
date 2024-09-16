Return-Path: <linux-arm-msm+bounces-31866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ED397A91E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 00:18:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AEDDB22392
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 22:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005B126286;
	Mon, 16 Sep 2024 22:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=motorola.com header.i=@motorola.com header.b="ijqjK3Nl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093005258
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Sep 2024 22:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.152.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726525101; cv=none; b=eN99hC+DboGF0Z9iK9xVPqJtBqpwsya0nvKcB67ECjUTnJ9c00GX4y8K7X76mvnLvG8RuYFvU8RMzN+HpxbriNita9CLuTizriDKWIB+7bDAq0vGp11n/gBP2Y307mclHwuaSNZpJVSMGgXw2/UvH+AvMVDxhn+3LhiaoiAIW0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726525101; c=relaxed/simple;
	bh=M6E6nQZoPOkQ5usAvmKbyxQOceyLA30mVHxnZahugFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=apDY6daf5yIunt48iegsLx+QGmHbakHt/EoehntaIA3vY8s+T/SE1quwSC7e7zhiZDvHO2L/HnMeI0iJmRW77P96CGJy2B7wzWHVcDYdQHUEvcwz8ojFHAkBwaImXLmvyfKcHTB2nqNPoJ/mB8Z23beotqfvLmNeRO1GU+v7OlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motorola.com; spf=pass smtp.mailfrom=motorola.com; dkim=pass (2048-bit key) header.d=motorola.com header.i=@motorola.com header.b=ijqjK3Nl; arc=none smtp.client-ip=148.163.152.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motorola.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motorola.com
Received: from pps.filterd (m0355090.ppops.net [127.0.0.1])
	by m0355090.ppops.net (8.18.1.2/8.18.1.2) with ESMTP id 48GIFa6P022935;
	Mon, 16 Sep 2024 22:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorola.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM202306;
	 bh=0O459K/YDhRXQjUN0des85qKjrf5rS3HBCVuqSevm+M=; b=ijqjK3Nl+IR+
	zDFaBXxw8S/cPiXOm+1ONLzE8faOa6pz/tLIjIfJmfHNy1U4wTBMX/BEMo5DKPEi
	ft00wqWZcjxtentGzZY/v44egsXHIkCo05OUZ9Pq08gI07rWxZEhMKCbIZHYhOgp
	AI0yjEQjqMl+t6USrEolGpfLm61CnkP0pAVke68NXMOee4K6HTUjW39ehRkXvdYm
	EG8USt01xdENaqfHy28yfwHAmz6CaowGKDdc3K5SH47EHCz9YJ3Te5fxHu/SkhgN
	AnVADQ40/w7IsxlxXQY5itoxIu+p8OWqcc8dVZa/SRxDplq/0fgn47oV8QOHQYTM
	IoVaOxSjaA==
Received: from iadlppfpol2.lenovo.com ([104.232.228.81])
	by m0355090.ppops.net (PPS) with ESMTPS id 41nntsavjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 22:17:57 +0000 (GMT)
Received: from va32lmmrp01.lenovo.com (unknown [10.62.177.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by iadlppfpol2.lenovo.com (Postfix) with ESMTPS id 4X6znH66MSzYkjd6;
	Mon, 16 Sep 2024 22:17:55 +0000 (UTC)
Received: from ilclasset02 (ilclasset02.mot.com [100.64.11.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mbland)
	by va32lmmrp01.lenovo.com (Postfix) with ESMTPSA id 4X6znH6bxnz2VZ16;
	Mon, 16 Sep 2024 22:17:55 +0000 (UTC)
Date: Mon, 16 Sep 2024 17:17:54 -0500
From: Maxwell Bland <mbland@motorola.com>
To: Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>
Cc: Neill Kapron <nkapron@google.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Andrew Wheeler <awheeler@motorola.com>,
        Sammy BS2 Que | =?utf-8?B?6ZiZ5paM55Sf?= <quebs2@motorola.com>,
        Todd Kjos <tkjos@google.com>,
        Viktor Martensson <vmartensson@google.com>,
        Andy Lutomirski <luto@amacapital.net>,
        "keescook@chromium.org" <keescook@chromium.org>,
        Will Drewry <wad@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        kernel-team <kernel-team@android.com>,
        "adelva@google.com" <adelva@google.com>,
        "jeffv@google.com" <jeffv@google.com>
Subject: Re: [RFC] Proposal: Static SECCOMP Policies
Message-ID: <rlgx2zq3s6vs6t26fut3ez6bix5jphvofyuw2amnbdpyb6c55m@kxzqput2rry5>
References: <SEZPR03MB6786D45BE387F2B378E71A84B4642@SEZPR03MB6786.apcprd03.prod.outlook.com>
 <ZuNVqvVgXLjNXS5Y@google.com>
 <CANP3RGfez2onSLVT2wC1hsSmKGxD9aFdV3we3Zsngw0BgbeGyw@mail.gmail.com>
 <TYZPR03MB67922FFDE5C9C925D8274677B4652@TYZPR03MB6792.apcprd03.prod.outlook.com>
 <CANP3RGfwL1OigoSkhmnRFDy=y+sstabiRAREPxEbEiEfuDaweQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANP3RGfwL1OigoSkhmnRFDy=y+sstabiRAREPxEbEiEfuDaweQ@mail.gmail.com>
X-Proofpoint-GUID: KboCdjZyOZvV29hz7_Yq04qBxoJWNbYo
X-Proofpoint-ORIG-GUID: KboCdjZyOZvV29hz7_Yq04qBxoJWNbYo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409160151

Another long email follows. The TL;DR is considering the related issues
such as changes in cBPF and some interesting thoughts regarding Google's
maintenance of seccomp inside Android, Android maintainers should make
the decision to "use minijail" or "use bionic's tools" for compiling
policies to BPF. Is there any reason multiple seccomp policy to BPF
program compilers need to exist in the AOSP (or even, maybe, Linux's use
of seccomp)? The shift to a single project for policy compilation to BPF
would remove duplicate effort in maintaining seccomp policy to BPF
compilers, solve the code page integrity issue, and lower potential
sources of policy compiler errors. See below.

On Fri, Sep 13, 2024 at 02:16:40PM GMT, Maciej Żenczykowski wrote:
> On Fri, Sep 13, 2024 at 10:07 AM Maxwell Bland <mbland@motorola.com> wrote:
> > Add a hook to seccomp which triggers/enables hooks in BPF's JIT to instrument
> > the output machine code  page so that EL2 can (1) invert the machine code back
> > to BPF then (2) check the BPF corresponds to a valid seccomp filter policy.
>
> If you care that deeply about this: you could simply turn of jit
> compilation of cBPF (including seccomp) - but you'll take a
> performance hit.
> If you care about performance you could only jit compile *recognized*
> cBPF programs.
> Hell, instead of jit-ing them you could replace them with outright
> (pre)compiled into the kernel native functions that accomplish the
> same thing.
> There's probably only somewhere <10 of these in common use / part of
> the platform.
> That said, you'd still pay a performance hit for (Chrome web browser
> style) sandboxes since those policies *will* be updated without os
> updates.  Similarly with the mainline shipped cBPF code (which does
> process all packets) - you can't guarantee it won't change.

I am hesistant with opting to turn off JIT, as a few months ago I got a
warning from Alexei Starovoitov about this approach:
https://lore.kernel.org/all/CAADnVQJCxFt2R=fbqx1T_03UioAsBO4UXYGh58kJaYHDpMHyxw@mail.gmail.com/

I would be hesitant for Moto (or anyone) to maintain a dynamic list of
acceptable code pages for each AOSP (or subpackage) release, and the
list will only grow with time. It would be really difficult, as well,
for me to even begin to figure out if I have "caught" all of them, since
Qualcomm services use seccomp and I have no idea if I am testing every
edge condition in the phone while developing this.

In lieu of knowing exactly what these code pages will be and the dangers
or growing lack of support for the BPF interpreter: the current
SYS_Seccomp user environment, e.g. libminijail or bionic's libc or
whatever Qualcomm is using, ends up being the de dacto specification of
the seccomp BPF "language", rather than a translation layer to a
standard policy file format which uniformly gets translated to BPF for
the kernel's consumption. The disconnect is that the current seccomp.c
semantics _only_ encode the cBPF operations and some sensibility
checking for the ranges of referenced memory, but seccomp.c is currently
not sufficient to provide an EL2-enforcable or Android-enforceable
contract on the integrity of the desired policy.

For example, I took some measurements today on-device, and the three
programs that were triggering EL2-level code page integrity failures in
the basic case follow the same general structure:

- Load systemcall _NR_ definition values
- Generate "priority" JEQ statements (opcode 0x15)
- Generate additional jump statements (opcode 0xa5, 0x35, etc)
- Standard(ish) suffix consisting of loads/movs/exits (opcode 0x61,0xb4,0x95)

But there's nothing to guarantee that this is what will happen in for
arbitrary programs with SYS_seccomp permission, as they could be using
different generators for their BPF. For example,
compile_seccomp_policy.py under the minijail project and genseccomp.py
under the bionic libc project solve this same problem in two different
ways, though they both generate a couple of _NR_ checks and jump
statements, but with different python code.

Can Android just say "use minijail" or "use bionic's tools" and call it
a day, similar to the intent system, or binder, or any number of the
ecosystem "hard rules"? That way, Google also does not have to maintain
the two separate projects doing the same thing, we can figure out what
the heck Qualcomm is doing, and I can sleep better at night. Seccomp is
not C, there's not the fight over clang vs gcc: system call numbers are
baked into struct seccomp_data, why bother with multiple (potentially
buggy and differing in flexibility) ways of compiling the desired policy
into BPF. Maybe this is too opinionated, but the nice world we would get
as a result is every single code page in Android's kernel would be
verifiable (and, if it was adopted in Linux generally) most ARM systems.

Regardless, the clear hack, to me, is that when EL2 gets a code page
integrity failure on one of these seccomp pages, for now I do some
simple binary analysis to check that the code page consists only of what
is effectively a giant case statement. Over time, this needs to be
refined to ensure the adversary has not mucked with the policy in a
valid way, like seccomp_check_filter in kernel/seccomp.c but better.

> I guess for the mainline shipped cBPF programs we could technically
> probably swap them for eBPF.  Taking a quick glance at uses of
> BpfClassic.h in aosp I see 6 socket filter cBPF programs, of which
> only 1 is dynamic (for matching clat IP addresses), so the remaining 5
> are probably trivial to eBPF-ify (and thus hide behind selinux
> restrictions).

clatd, netd, gpuWork, and others turned out to not be an issue (or I
have not run into any code page errors) yet, maybe because I'm running
drivers for the kernel protection at the book-ends of the kernel boot
process: one prior to any memory allocation so that it can ensure pages
get allocated in regions permissible for the Snapdragon chipset's
performance constraints on EL2 write checks, and the second after the
allocation of all boot-time kernel modules and BPF program loads, since
at that point I can check the allocated pages w.r.t. SHA256 hashes
computed (considering holes for self-patching and static_keys) at build
time using the .ko files, only because I am paranoid someone will
circumvent the existing verified boot routines.

As mentioned, I will work with Motorola see if I can figure out a
permissive license for the EL2 components for this part, especially
considering I have seen ... questionable promises ... regarding this
subject in my research and a apparent lack of acknowledgement of issues
like dynamic datastructures and seccomp filters from others (not Google)
promising hypervisor-enforced code integrity. Thankfully, due to GPL-2.0
the EL1 drivers will be open source. I will share them once they are
ready with testcases of existing exploits for page table modification,
code page modification, system control register modification, kworker
queue manipulation, BPF page manipulation, like the below:

#define MODIFY_KERNEL_CODE                                                     \
	do {                                                                   \
		fake_je = (struct jump_entry *)kallsyms_lookup_name_ind(       \
			"spectre_bhb_state");                                  \
		attack_addr = kallsyms_lookup_name_ind("udp_recvmsg");         \
		if (register_kprobe(&kp2)) {                                   \
			return -1;                                             \
		}                                                              \
		arch_jump_label_transform =                                    \
			(arch_jump_label_transform_t)kp2.addr;                 \
		fake_je->code = attack_addr - (unsigned long)&(fake_je->code); \
		fake_je->target = stext - (unsigned long)&(fake_je->target);   \
		arch_jump_label_transform(fake_je, JUMP_LABEL_JMP);            \
		return 0;                                                      \
	} while (0)

