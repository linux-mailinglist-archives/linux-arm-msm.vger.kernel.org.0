Return-Path: <linux-arm-msm+bounces-57186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E235FAAE731
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 18:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E196F1C220B2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 16:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C656328BA9C;
	Wed,  7 May 2025 16:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pWJ4ibP+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F141B0F1E;
	Wed,  7 May 2025 16:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746636883; cv=none; b=bx6nO+EAJUPzJ9UOgeQSCubWi0fj8BQZktrwhE4nSw2XuFIPXNicYHtnlP6hPIMV4cUnCPEvmddn0GPNzdLSO2GkdyJDv37rApiik4wHchvsjSovTDJLnE5j3mj96cRaLClWMu6Cp6yTPH60Hji4TbGnAcb1BpDR+5jUlN+4tsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746636883; c=relaxed/simple;
	bh=axzbwV1fcdENoStQr7bqdWjWYmfudr/cPU89nWCc8pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A05+fElnHjvmJf1QfA0rqRh8q7d4x5r07+Ffq56ZGTy/ldngTU6QLl9CaVVMTKQa2+meXmGm2chEY6eRJ2JSAkGu4peGea+1OV/fpIaEqUib8wKEbSUaQanumgP/6du272ofg2AukfW11Mx7goyBLmWUhIriGnkpBRgF4dzeM8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pWJ4ibP+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E2EFC4CEE2;
	Wed,  7 May 2025 16:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746636882;
	bh=axzbwV1fcdENoStQr7bqdWjWYmfudr/cPU89nWCc8pw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pWJ4ibP+GFeQEQqqTTSKCuJRP5o9pGxOHvklQGsGBzxtrMrxonQjFpvNxSElrhLUE
	 NazsXZb9G6usBNi5eIXzagDH+V0YHp0h2bvYsLRu00UIVyrkRVDjPN/TO55mSVxBTi
	 Nw0F48wHNSzgMKzkbvtx93NQDTUb7nWDX6cs7CoIXb6NSPkwfzrqU0l9PgthELOfKX
	 6ZpElWKV31UkBK/Q1RyYWNogeXtIR2ObHKWVJrlNDGEtJckvfkofq0yBNZ+FjvtKLd
	 yhSxqfKXLINiWx1Jx0GR3E/fsPQOpVFz25VLTu9Mxw4lVo31ycWuVWZrx83+IxQAR6
	 6l/KSn8BSOy3A==
Date: Wed, 7 May 2025 09:54:39 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org, corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, 
	rostedt@goodmis.org, john.ogness@linutronix.de, senozhatsky@chromium.org, 
	pmladek@suse.com, peterz@infradead.org, mojha@qti.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, vincent.guittot@linaro.org, konradybcio@kernel.org, 
	dietmar.eggemann@arm.com, juri.lelli@redhat.com
Subject: Re: [RFC][PATCH 00/14] introduce kmemdump
Message-ID: <mtetvagzj2xltczutahqj7ijgpr3fy7ppbp5w6rmn2w2zmukux@tawhrkyoqjli>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>

On Tue, Apr 22, 2025 at 02:31:42PM +0300, Eugen Hristev wrote:
> kmemdump is a mechanism which allows the kernel to mark specific memory
> areas for dumping or specific backend usage.
> Once regions are marked, kmemdump keeps an internal list with the regions
> and registers them in the backend.
> Further, depending on the backend driver, these regions can be dumped using
> firmware or different hardware block.
> Regions being marked beforehand, when the system is up and running, there
> is no need nor dependency on a panic handler, or a working kernel that can
> dump the debug information.
> The kmemdump approach works when pstore, kdump, or another mechanism do not.
> Pstore relies on persistent storage, a dedicated RAM area or flash, which
> has the disadvantage of having the memory reserved all the time, or another
> specific non volatile memory. Some devices cannot keep the RAM contents on
> reboot so ramoops does not work. Some devices do not allow kexec to run
> another kernel to debug the crashed one.
> For such devices, that have another mechanism to help debugging, like
> firmware, kmemdump is a viable solution.
> 
> kmemdump can create a core image, similar with /proc/vmcore, with only
> the registered regions included. This can be loaded into crash tool/gdb and
> analyzed.
> To have this working, specific information from the kernel is registered,
> and this is done at kmemdump init time, no need for the kmemdump user to
> do anything.
> 
> The implementation is based on the initial Pstore/directly mapped zones
> published as an RFC here:
> https://lore.kernel.org/all/20250217101706.2104498-1-eugen.hristev@linaro.org/
> 
> The back-end implementation for qcom_smem is based on the minidump
> patch series and driver written by Mukesh Ojha, thanks:
> https://lore.kernel.org/lkml/20240131110837.14218-1-quic_mojha@quicinc.com/
> 
> I appreciate the feedback on this series, I know it is a longshot, and there
> is a lot to improve, but I hope I am on the right track.
> 
> Thanks,
> Eugen
> 
> PS. Here is how crash tool reports the dump:
> 
>      KERNEL: /home/eugen/linux-minidump/vmlinux  [TAINTED]
>     DUMPFILE: /home/eugen/eee

Can you please describe the steps taken to get acquire/generate this
file and how to invoke crash?

Regards,
Bjorn

>         CPUS: 8 [OFFLINE: 7]
>         DATE: Thu Jan  1 02:00:00 EET 1970
>       UPTIME: 00:00:28
>     NODENAME: qemuarm64
>      RELEASE: 6.14.0-rc5-next-20250303-00014-g011eb2aaf7b6-dirty
>      VERSION: #169 SMP PREEMPT Thu Apr 17 14:12:21 EEST 2025
>      MACHINE: aarch64  (unknown Mhz)
>       MEMORY: 0
>        PANIC: ""
> 
> crash> log
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd4b2]
> [    0.000000] Linux version 6.14.0-rc5-next-20250303-00014-g011eb2aaf7b6-dirty (eugen@eugen-station) (aarch64-none-linux-gnu-gcc (Arm GNU Toolchain 13.3.Rel1 (Build arm-13.24)) 13.3.1 20240614, GNU ld (Arm GNU Toolchain 13.3.Rel1 (Build arm-13.24)) 2.42.0.20240614) #169 SMP PREEMPT Thu Apr 17 14:12:21 EEST 2025
> [    0.000000] KASLR enabled
> [...]
> 
> Eugen Hristev (14):
>   Documentation: add kmemdump
>   kmemdump: introduce kmemdump
>   kmemdump: introduce qcom-md backend driver
>   soc: qcom: smem: add minidump device
>   Documentation: kmemdump: add section for coreimage ELF
>   kmemdump: add coreimage ELF layer
>   printk: add kmsg_kmemdump_register
>   kmemdump: coreimage: add kmsg registration
>   genirq: add irq_kmemdump_register
>   kmemdump: coreimage: add irq registration
>   panic: add panic_kmemdump_register
>   kmemdump: coreimage: add panic registration
>   sched: add sched_kmemdump_register
>   kmemdump: coreimage: add sched registration
> 
>  Documentation/debug/index.rst      |  17 ++
>  Documentation/debug/kmemdump.rst   |  83 +++++
>  drivers/Kconfig                    |   2 +
>  drivers/Makefile                   |   2 +
>  drivers/debug/Kconfig              |  39 +++
>  drivers/debug/Makefile             |   5 +
>  drivers/debug/kmemdump.c           | 197 ++++++++++++
>  drivers/debug/kmemdump_coreimage.c | 293 ++++++++++++++++++
>  drivers/debug/qcom_md.c            | 467 +++++++++++++++++++++++++++++
>  drivers/soc/qcom/smem.c            |  10 +
>  include/linux/irqnr.h              |   1 +
>  include/linux/kmemdump.h           |  77 +++++
>  include/linux/kmsg_dump.h          |   6 +
>  include/linux/panic.h              |   1 +
>  include/linux/sched.h              |   1 +
>  kernel/irq/irqdesc.c               |   7 +
>  kernel/panic.c                     |   8 +
>  kernel/printk/printk.c             |  13 +
>  kernel/sched/core.c                |   7 +
>  19 files changed, 1236 insertions(+)
>  create mode 100644 Documentation/debug/index.rst
>  create mode 100644 Documentation/debug/kmemdump.rst
>  create mode 100644 drivers/debug/Kconfig
>  create mode 100644 drivers/debug/Makefile
>  create mode 100644 drivers/debug/kmemdump.c
>  create mode 100644 drivers/debug/kmemdump_coreimage.c
>  create mode 100644 drivers/debug/qcom_md.c
>  create mode 100644 include/linux/kmemdump.h
> 
> -- 
> 2.43.0
> 

