Return-Path: <linux-arm-msm+bounces-15602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE61B8908BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 19:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AB0A1F26657
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 18:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5366A1386DD;
	Thu, 28 Mar 2024 18:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eid96wV4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6371386DA
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 18:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711652138; cv=none; b=XwdXc62HRoMrcJjyfgujhMuwyyrz1HhJHIT17nPWDiNnxhtk/GRpVDXHXrPrwJK6pk4GiAOuYjSV/NyHtbR22A0wo+ivkwQ/o6rmmBEWnBp2n1Vk6ydoOfesBfn0RgyAOm2JypU/bqqXGPWp4dlSR6MhRTMWA624cdZGH7VC6k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711652138; c=relaxed/simple;
	bh=kIZAcqcCc64AzfGNpdwMAssCSfpGXSPCqhPqkGnKneY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G6WVcKFTvmzFCbftvwuiOnagocOQeLEXlIfCPm5btwomqNY8TTYa5HwKl2IthR5TynXio1v4j87zi1yI3dZXU91lv8+iJgQQpeYBzWTEOiP0yL2xnsTy6NPkBwQR+pYgzf/attdwH7a2VDPYfm1QmMZnzQV4f8c7mKGyVJmeKOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eid96wV4; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-515b69e8f38so1313483e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 11:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711652134; x=1712256934; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uob/MZYc0OD0EyNUfz/ojqgk51BMD4sYYZaxu/bWcVs=;
        b=eid96wV4oZNBantxMm2CdMyWBev2vbBjw6drSS/06tR5OuTs/ADQbsnXMSNX2VYtK/
         3guLJ7GMmpsQVNDLv78sjpLLrzPdjPGFT8rdviZlG7NOptI1jbScDI7LzgL0SUbue/rx
         U1IrMGiigaiM5Ey3SLj0OGY0r3oa0FIllsW1Ql1KncF/ZSiqUzb9HpDLhJtREq7MrnUp
         WXIJSLB6Yfxz9Z5O92VgWwSNoOGwhfIBy5jlScRaJgzSuR+ivy584Q3NW9dCpn+FlOku
         Wfb9LiHi/lt3v+gIuSHxBY8rRpWOXfwYhSp+S0lGfJh+lBFY3Up6l+S31SI5AOcIMmDN
         hWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711652134; x=1712256934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uob/MZYc0OD0EyNUfz/ojqgk51BMD4sYYZaxu/bWcVs=;
        b=FB7ulyk9om/gGqB2+/+z+Hh38INuwPdgWOhkuFJMxPyr9k8706nSCPHW+Z1WHTTvlB
         2TqVOMDhkdBiGRQC+Tw82TXzSLOWF2N3t9u/u/SADeiB+wT7RQNeU49u6vfApLaGLKP7
         OAi+6KA5vWO6ZxzoOhot3ZvpcStAFvOjCduYySWiR17tK0F8QmkDUIXzgmdJrAwdoE2F
         LAF7WmWOagcpeQS12CBRDDK0Wbfn3wbXfpVJBT0sGFeX/fk9Drj7Ot6TXjp9nJ5E5Nxb
         iNe9OlRW8c0/mzDbWqAz/G76K5Wkw8SVILJYLOPbFjQmsbJ3dA8W+hVfzIrkysxVT+KZ
         p/7w==
X-Forwarded-Encrypted: i=1; AJvYcCUamglsyw2EvlGNocJyPtCb9g93evvTnxOM4EX9uf2k0DZ7j/ppu64jfEP9O2AwnD4XECWFxUbvnNTowGQ5O/as3yaEnv7ISg23slqFgQ==
X-Gm-Message-State: AOJu0YzZe/nwbXA0S8ser3P9nls5zC+tLgcGNsQPUB+3s+m0og/PpFBH
	3aI1XpM2XixalfBdlC8pA2bNcdPRnL3tjA/KJ778PAz6xLLT+xthB2cYtZWiZu8zSnJUgW2ZKW6
	Hl0SadU8gKpoRvYDvwB79WOoeoInzrxKhSoJwEw==
X-Google-Smtp-Source: AGHT+IE1fGrIOwpblfRMOgnssI33pmohuX+vf53YceqfarZR+c7p+K9VhH/uMBhD8KcUrDMZigNV+1TYnCAU1AYH68U=
X-Received: by 2002:a05:6512:741:b0:515:c8fc:9d98 with SMTP id
 c1-20020a056512074100b00515c8fc9d98mr179445lfs.20.1711652134205; Thu, 28 Mar
 2024 11:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325100359.17001-1-brgl@bgdev.pl> <56e1c63a-4c09-4d92-9ef2-aad5390879cc@gmail.com>
In-Reply-To: <56e1c63a-4c09-4d92-9ef2-aad5390879cc@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Mar 2024 19:55:22 +0100
Message-ID: <CAMRc=Mf_pvrh2VMfTVE-ZTypyO010p=to-cd8Q745DzSDXLGFw@mail.gmail.com>
Subject: Re: [PATCH v9 00/13] firmware: qcom: qseecom: convert to using the TZ allocator
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Elliot Berman <quic_eberman@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Guru Das Srinagesh <quic_gurus@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>, 
	Alex Elder <elder@linaro.org>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 5:50=E2=80=AFPM Maximilian Luz <luzmaximilian@gmail=
.com> wrote:
>
> On 3/25/24 11:03 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > SCM calls that take memory buffers as arguments require that they be
> > page-aligned, physically continuous and non-cachable. The same
> > requirements apply to the buffer used to pass additional arguments to S=
CM
> > calls that take more than 4.
> >
> > To that end drivers typically use dma_alloc_coherent() to allocate memo=
ry
> > of suitable format which is slow and inefficient space-wise.
> >
> > SHM Bridge is a safety mechanism that - once enabled - will only allow
> > passing buffers to the TrustZone that have been explicitly marked as
> > shared. It improves the overall system safety with SCM calls and is
> > required by the upcoming scminvoke functionality.
> >
> > The end goal of this series is to enable SHM bridge support for those
> > architectures that support it but to that end we first need to unify th=
e
> > way memory for SCM calls is allocated. This in itself is beneficial as
> > the current approach of using dma_alloc_coherent() in most places is qu=
ite
> > slow.
> >
> > First let's add a new TZ Memory allocator that allows users to create
> > dynamic memory pools of format suitable for sharing with the TrustZone.
> > Make it ready for implementing multiple build-time modes.
> >
> > Convert all relevant drivers to using it. Add separate pools for SCM co=
re
> > and for qseecom.
> >
> > Finally add support for SHM bridge and make it the default mode of
> > operation with the generic allocator as fallback for the platforms that
> > don't support SHM bridge.
> >
> > Tested on db410c, RB5, sm8550-qrd. Previous iteration tested also on
> > sa8775p-ride and lenovo X13s (please do retest on those platforms if yo=
u
> > can).
>
> Not sure in which version things changed (I haven't really kept up with
> that, sorry), but this version (with the generic allocator selected in
> the config) fails reading EFI vars on my Surface Pro X (sc8180x):
>
> [    2.381020] BUG: scheduling while atomic: mount/258/0x00000002
> [    2.383356] Modules linked in:
> [    2.385669] Preemption disabled at:
> [    2.385672] [<ffff800080f7868c>] qcom_tzmem_alloc+0x7c/0x224
> [    2.390325] CPU: 1 PID: 258 Comm: mount Not tainted 6.8.0-1-surface-de=
v #2
> [    2.392632] Hardware name: Microsoft Corporation Surface Pro X/Surface=
 Pro X, BIOS 7.620.140 08/11/2023
> [    2.394955] Call trace:
> [    2.397269]  dump_backtrace+0x94/0x114
> [    2.399583]  show_stack+0x18/0x24
> [    2.401883]  dump_stack_lvl+0x48/0x60
> [    2.404181]  dump_stack+0x18/0x24
> [    2.406476]  __schedule_bug+0x84/0xa0
> [    2.408770]  __schedule+0x6f4/0x7fc
> [    2.411051]  schedule+0x30/0xf0
> [    2.413323]  synchronize_rcu_expedited+0x158/0x1ec
> [    2.415594]  lru_cache_disable+0x28/0x74
> [    2.417853]  __alloc_contig_migrate_range+0x68/0x210
> [    2.420122]  alloc_contig_range+0x140/0x280
> [    2.422384]  cma_alloc+0x128/0x404
> [    2.424643]  cma_alloc_aligned+0x44/0x6c
> [    2.426881]  dma_alloc_contiguous+0x30/0x44
> [    2.429111]  __dma_direct_alloc_pages.isra.0+0x60/0x20c
> [    2.431343]  dma_direct_alloc+0x6c/0x2ec
> [    2.433569]  dma_alloc_attrs+0x80/0xf4
> [    2.435786]  qcom_tzmem_pool_add_memory+0x8c/0x178
> [    2.438008]  qcom_tzmem_alloc+0xe8/0x224
> [    2.440232]  qsee_uefi_get_next_variable+0x78/0x2cc
> [    2.442443]  qcuefi_get_next_variable+0x50/0x94
> [    2.444643]  efivar_get_next_variable+0x20/0x2c
> [    2.446832]  efivar_init+0x8c/0x29c
> [    2.449009]  efivarfs_fill_super+0xd4/0xec
> [    2.451182]  get_tree_single+0x74/0xbc
> [    2.453349]  efivarfs_get_tree+0x18/0x24
> [    2.455513]  vfs_get_tree+0x28/0xe8
> [    2.457680]  vfs_cmd_create+0x5c/0xf4
> [    2.459840]  __do_sys_fsconfig+0x458/0x598
> [    2.461993]  __arm64_sys_fsconfig+0x24/0x30
> [    2.464143]  invoke_syscall+0x48/0x110
> [    2.466281]  el0_svc_common.constprop.0+0x40/0xe0
> [    2.468415]  do_el0_svc+0x1c/0x28
> [    2.470546]  el0_svc+0x34/0xb4
> [    2.472669]  el0t_64_sync_handler+0x120/0x12c
> [    2.474793]  el0t_64_sync+0x190/0x194
>
> and subsequently
>
> [    2.477613] DEBUG_LOCKS_WARN_ON(val > preempt_count())
> [    2.477618] WARNING: CPU: 4 PID: 258 at kernel/sched/core.c:5889 preem=
pt_count_sub+0x90/0xd4
> [    2.478682] Modules linked in:
> [    2.479214] CPU: 4 PID: 258 Comm: mount Tainted: G        W          6=
.8.0-1-surface-dev #2
> [    2.479752] Hardware name: Microsoft Corporation Surface Pro X/Surface=
 Pro X, BIOS 7.620.140 08/11/2023
> [    2.480296] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [    2.480839] pc : preempt_count_sub+0x90/0xd4
> [    2.481380] lr : preempt_count_sub+0x90/0xd4
> [    2.481917] sp : ffff8000857cbb00
> [    2.482450] x29: ffff8000857cbb00 x28: ffff8000806b759c x27: 800000000=
0000005
> [    2.482988] x26: 0000000000000000 x25: ffff0000802cbaa0 x24: ffff00008=
09228b0
> [    2.483525] x23: 0000000000000000 x22: ffff800082b462f0 x21: 000000000=
0001000
> [    2.484062] x20: ffff80008363d000 x19: ffff000080922880 x18: fffffffff=
ffc9660
> [    2.484600] x17: 0000000000000020 x16: 0000000000000000 x15: 000000000=
0000038
> [    2.485137] x14: 0000000000000000 x13: ffff800082649258 x12: 000000000=
00006db
> [    2.485674] x11: 0000000000000249 x10: ffff8000826fc930 x9 : ffff80008=
2649258
> [    2.486207] x8 : 00000000ffffdfff x7 : ffff8000826f9258 x6 : 000000000=
0000249
> [    2.486738] x5 : 0000000000000000 x4 : 40000000ffffe249 x3 : 000000000=
0000000
> [    2.487267] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00008=
41fa300
> [    2.487792] Call trace:
> [    2.488311]  preempt_count_sub+0x90/0xd4
> [    2.488831]  _raw_spin_unlock_irqrestore+0x1c/0x44
> [    2.489352]  qcom_tzmem_alloc+0x1cc/0x224
> [    2.489873]  qsee_uefi_get_next_variable+0x78/0x2cc
> [    2.490390]  qcuefi_get_next_variable+0x50/0x94
> [    2.490907]  efivar_get_next_variable+0x20/0x2c
> [    2.491420]  efivar_init+0x8c/0x29c
> [    2.491931]  efivarfs_fill_super+0xd4/0xec
> [    2.492440]  get_tree_single+0x74/0xbc
> [    2.492948]  efivarfs_get_tree+0x18/0x24
> [    2.493453]  vfs_get_tree+0x28/0xe8
> [    2.493957]  vfs_cmd_create+0x5c/0xf4
> [    2.494459]  __do_sys_fsconfig+0x458/0x598
> [    2.494963]  __arm64_sys_fsconfig+0x24/0x30
> [    2.495468]  invoke_syscall+0x48/0x110
> [    2.495972]  el0_svc_common.constprop.0+0x40/0xe0
> [    2.496475]  do_el0_svc+0x1c/0x28
> [    2.496976]  el0_svc+0x34/0xb4
> [    2.497475]  el0t_64_sync_handler+0x120/0x12c
> [    2.497975]  el0t_64_sync+0x190/0x194
> [    2.498466] ---[ end trace 0000000000000000 ]---
> [    2.507347] qcom_scm firmware:scm: qseecom: scm call failed with error=
 -22
> [    2.507813] efivars: get_next_variable: status=3D8000000000000007
>
> If I understand correctly, it enters an atomic section in
> qcom_tzmem_alloc() and then tries to schedule somewhere down the line.
> So this shouldn't be qseecom specific.
>
> I should probably also say that I'm currently testing this on a patched
> v6.8 kernel, so there's a chance that it's my fault. However, as far as
> I understand, it enters an atomic section in qcom_tzmem_alloc() and then
> later tries to expand the pool memory with dma_alloc_coherent(). Which
> AFAIK is allowed to sleep with GFP_KERNEL (and I guess that that's the
> issue here).
>
> I've also tried the shmem allocator option, but that seems to get stuck
> quite early at boot, before I even have usb-serial access to get any
> logs. If I can find some more time, I'll try to see if I can get some
> useful output for that.
>

Ah, I think it happens here:

+       guard(spinlock_irqsave)(&pool->lock);
+
+again:
+       vaddr =3D gen_pool_alloc(pool->genpool, size);
+       if (!vaddr) {
+               if (qcom_tzmem_try_grow_pool(pool, size, gfp))
+                       goto again;

We were called with GFP_KERNEL so this is what we pass on to
qcom_tzmem_try_grow_pool() but we're now holding the spinlock. I need
to revisit it. Thanks for the catch!

Bart

