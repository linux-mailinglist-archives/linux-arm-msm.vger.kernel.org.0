Return-Path: <linux-arm-msm+bounces-10825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AD0852A46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 08:52:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 770E41C20A3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 07:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0774C175A4;
	Tue, 13 Feb 2024 07:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QfnIaPZl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B632617983
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 07:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707810733; cv=none; b=qwKol6N1jZShfZPuE9nAgakpIE/dm7Ktz7Rg6V6uVzZCjdV2MN5uQlRt6GQLHJqMzEVUCZg07AsdPMv0h+4M16fcOnPTu/kK8QbE+7mWrhLoWaOmoofXp4FvTZY3Jax1HTYslydFGMtml9O1LkqlWvho13Oa4s65Rv4JMJxh71M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707810733; c=relaxed/simple;
	bh=FwtQu1HKst+o7tJQrEQdGhvoGt5oOCxgVwh0l0QblZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uaDlYeTySAHwagGspoXzCpxVeQ0cfMhnBtoxz942NCfY7Gh3qGvR6v/DjcSx8yjRcApBR+Q4PxSzcvLiGUn/KdOltuQbPDuPyrz9r//rXHZLLXU8cjowP602e/DxjUmVenOi5pt4OD09jTDkbhIeyqJ7OjxBXREWzohSI39Mj3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QfnIaPZl; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcbef31a9dbso705381276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 23:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707810729; x=1708415529; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lMNMGi2JtNB4fN9KO+/VkfBMZZ7dATTClDQbBwRerqM=;
        b=QfnIaPZldiIUY2ATbIjbtrE7adEMs05NFsEIrZTKKR+F1c6+nr8qnW3L/gV9jXaOK+
         TwcU+BgtVejdQUrseDDnCq83HX6yMaeOcqvvNrPpkVTcUQ0Ehl2zYv+i8Qy4hvGh8VdT
         UlNvkXE70tsR5WwEgMYpTb+Raz63jBL1fiJPO4lN/CxI49DFgaXYrO2K0GqjjT2mNl/J
         x+rq4Px+rbS16xqM+KlZLrBS+D0ryN1XtHQUbZZfuEzARvQjyCjqApCJqTHMKk/OMxCW
         SpFmcfoLFzv0y/48uMOfLBF6FulJqH2iNF/e7w8OqLdJirdkaUpdJoe4bI6foM7OmbGH
         Sgbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707810729; x=1708415529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMNMGi2JtNB4fN9KO+/VkfBMZZ7dATTClDQbBwRerqM=;
        b=Ny770Sz7+kmsVwe4hAAlwF9ftaJWeEkSVVJNRg6AFRcowN28r/PTKCrT9M19Rvgter
         48oCD+cz+VFQ/1+un0+TLk4rOy1O5ec+3WG6rgGYGuuDGuTxiFVSTKOx4ZBh/FSkb18F
         V/cXV1JzCBuYY/EPx9cWuV0x/yHxN2XddFHHNiqd1Gk6sDwj/VPcjx3ieXPoF4zLLq7s
         MvFcP6NQF4LKEMLd056fQZ6f7EVBqy/W57aB41IYiRyqb38ywSjiIMJL4hLdCJXSEMdq
         hTmO+uMIcQPEJj35JjbAOSjCPSR+IquBGE97PLIUzBYRHH6XRnbfxH5SAW4vmtDcDWsG
         rEaw==
X-Forwarded-Encrypted: i=1; AJvYcCWQfeVbjeoR+tSdIBNmJaDDQW3UdApazFWew+Y5qgi8NAgWpA29w7PFLLcjRMkwMJRNv956k7VHCFp9NLuQxBe881jQ3Nh/IBXK0qu1Nw==
X-Gm-Message-State: AOJu0YzWnW/+a4tPDuQzhEWnoG864o/iqhxnSEXqCuFJKzVQRvrrZvXp
	AKRvrW8++iOl/R5UMXesNyhCekJdq/lQvk7QFUK7abWTfUPen84bqxMy58H1HvVnyXLFjROCykv
	7bzGk9hRR9aww4VFXO/xo8mY/90c2iLzVmV/qQA==
X-Google-Smtp-Source: AGHT+IHBXtskgofkiap78lxBRyhjlOb1BTZGPnL1Bc/zPwkKwHpI7HM/52duyJRT+Yxnh3xhPxgIuh+xarZixpTWmgc=
X-Received: by 2002:a25:9207:0:b0:dcb:fb49:cb93 with SMTP id
 b7-20020a259207000000b00dcbfb49cb93mr2312903ybo.45.1707810729633; Mon, 12 Feb
 2024 23:52:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5-v2-c86cc8c2230e+160bb-smmu_newapi_jgg@nvidia.com>
 <20240209200538.917366-1-dmitry.baryshkov@linaro.org> <20240209222349.GA923780@nvidia.com>
In-Reply-To: <20240209222349.GA923780@nvidia.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 13 Feb 2024 09:51:58 +0200
Message-ID: <CAA8EJpp1wuMgawaUPnQWnhz1k023n8Q-k0_sO6P9p7ixntrCJQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] iommu/arm-smmu: Convert to domain_alloc_paging()
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, joro@8bytes.org, 
	linux-arm-kernel@lists.infradead.org, nicolinc@nvidia.com, 
	robin.murphy@arm.com, will@kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Feb 2024 at 00:23, Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Fri, Feb 09, 2024 at 10:05:38PM +0200, Dmitry Baryshkov wrote:
> > On Tue, 17 Oct 2023 Jason Gunthorpe <jgg@nvidia.com> wrote:
> > > Now that the BLOCKED and IDENTITY behaviors are managed with their own
> > > domains change to the domain_alloc_paging() op.
> > >
> > > The check for using_legacy_binding is now redundant,
> > > arm_smmu_def_domain_type() always returns IOMMU_DOMAIN_IDENTITY for this
> > > mode, so the core code will never attempt to create a DMA domain in the
> > > first place.
> > >
> > > Since commit a4fdd9762272 ("iommu: Use flush queue capability") the core
> > > code only passes in IDENTITY/BLOCKED/UNMANAGED/DMA domain types. It will
> > > not pass in IDENTITY or BLOCKED if the global statics exist, so the test
> > > for DMA is also redundant now too.
> > >
> > > Call arm_smmu_init_domain_context() early if a dev is available.
> > >
> > > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > > ---
> > >  drivers/iommu/arm/arm-smmu/arm-smmu.c | 21 +++++++++++++++------
> > >  1 file changed, 15 insertions(+), 6 deletions(-)
> >
> > For some reason this patch breaks booting of the APQ8096 Dragonboard820c
> > (qcom/apq8096-db820c.dts). Dispbling display subsystem (mdss) and venus
> > devices makes the board boot in most of the cases. Most frequently the
> > last parts of the log loog in a following way:
>
> It is surprising we tested this patch on some tegra systems with this
> iommu and didn't hit anything..
>
> The only real functional thing this changes is to move the domain
> initialization up in time, potentially a lot in time in some
> cases. That function does alot of things including touching HW so
> possibly there is some surprising interaction with something else.

I should not be debugging strange platforms at 1 a.m. I forgot that
there was another patch to revert. So after reverting the MPM patch,
I'm getting the following results:

>
> So, I would expect this to not WARN_ON and to make it work the same as
> before the patch:

No warnings, the platform now boots up to the point of actually
bringing up the venus device:


[   11.906514] ath10k_pci 0000:01:00.0: qca6174 hw3.2 target
0x05030000 chip_id 0x00340aff sub 0000:0000
[   11.907119] ath10k_pci 0000:01:00.0: kconfig debug 1 debugfs 0
tracing 0 dfs 0 testmode 0
[   11.915881] ath10k_pci 0000:01:00.0: firmware ver
WLAN.RM.4.4.1-00288- api 6 features wowlan,ignore-otp,mfp crc32
bf907c7c
[   11.979972] Console: switching to colour frame buffer device 320x90
[   11.990756] ath10k_pci 0000:01:00.0: board_file api 2 bmi_id 0:1
crc32 d2863f91
[   12.060834] msm_mdp 901000.display-controller: [drm] fb0: msmdrmfb
frame buffer device
[   12.096203] qcom-pcie 608000.pcie: Phy link never came up
[   12.103785] qcom-pcie 608000.pcie: PCI host bridge to bus 0001:00
[   12.103970] qcom-venus c00000.video-codec: Adding to iommu group 3

Format: Log Type - Time(microsec) - Message - Optional Info
Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
S - QC_IMAGE_VERSION_STRING=BOOT.XF.1.0-00301
S - IMAGE_VARIANT_STRING=M8996LAB
S - OEM_IMAGE_VERSION_STRING=crm-ubuntu68
S - Boot Interface: UFS

>
> Then I'd ask you to remove the comment and do:
>
> @@ -878,7 +878,9 @@ static struct iommu_domain *arm_smmu_domain_alloc_paging(struct device *dev)
>         if (dev) {
>                 struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
>
> +               WARN_ON(true);
>                 if (arm_smmu_init_domain_context(smmu_domain, cfg->smmu, dev)) {
> +                       printk("Allocation failure in arm_smmu_domain_alloc_paging()\n");
>                         kfree(smmu_domain);
>                         return NULL;
>                 }
>
>
> And then we may get a clue from the backtraces it generates. I only
> saw one iommu group reported in your log so I'd expect one trace?

I added dev_info + mdelays() around the arm_smmu_init_domain_context()
and I can see that it crashes within that function.

[   29.819624] qcom-venus c00000.video-codec: Adding to iommu group 1
[   29.833181] ------------[ cut here ]------------
[   29.839198] WARNING: CPU: 1 PID: 35 at
drivers/iommu/arm/arm-smmu/arm-smmu.c:883
arm_smmu_domain_alloc_paging+0x80/0x174
[   29.843980] Modules linked in:
[   29.854824] CPU: 1 PID: 35 Comm: kworker/u18:0 Tainted: G     U
        6.8.0-rc3-next-20240208-05495-g20708c29957d-dirty #1739
[   29.857694] Hardware name: Qualcomm Technologies, Inc. DB820c (DT)
[   29.869410] Workqueue: events_unbound deferred_probe_work_func
[   29.875658] pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   29.881474] pc : arm_smmu_domain_alloc_paging+0x80/0x174
[   29.888331] lr : arm_smmu_domain_alloc_paging+0x68/0x174
[   29.893885] sp : ffff8000830338c0
[   29.899179] x29: ffff8000830338c0 x28: 0000000000000000 x27: ffff800081e72000
[   29.902396] x26: ffff00008034ee48 x25: ffff000080b24810 x24: 0000000000000000
[   29.909513] x23: ffff800081e73000 x22: ffff000080b24810 x21: ffff800082e23258
[   29.916633] x20: ffff00008389a700 x19: ffff00008034f600 x18: ffffffffffffffff
[   29.918788] usb 1-1: new high-speed USB device number 2 using xhci-hcd
[   29.923746] x17: 0000000c0000000b x16: 0000000900000008 x15: 0000000000000000
[   29.923765] x14: 000000000000b0af x13: 0000000000000000 x12: 0000000000000166
[   29.923783] x11: 0000000000000001 x10: 0000000000001410 x9 : 0000000000000000
[   29.923801] x8 : ffff00008034f800 x7 : 0000000000000000 x6 : 0000000000000000
[   29.923819] x5 : 0000000000000000 x4 : 0000000000000002 x3 : 0000000000000000
[   29.923837] x2 : ffff800082e23290 x1 : dead4ead00000000 x0 : 0000000000000000
[   29.923855] Call trace:
[   29.923861]  arm_smmu_domain_alloc_paging+0x80/0x174
[   29.923872]  __iommu_domain_alloc+0xcc/0xf4
[   29.923884]  iommu_setup_default_domain+0x294/0x554
[   29.938567] Bluetooth: hci0: Frame reassembly failed (-84)
[   29.944494]  __iommu_probe_device+0x418/0x43c
[   29.944508]  iommu_probe_device+0x3c/0x80
[   29.944519]  of_iommu_configure+0x124/0x1b4
[   29.944529]  of_dma_configure_id+0x170/0x2f4
[   29.969874] mmc0: new ultra high speed SDR104 SDHC card at address 5048
[   29.972966]  platform_dma_configure+0xa8/0xb4
[   29.972983]  really_probe+0x70/0x2ac
[   29.972992]  __driver_probe_device+0x78/0x12c
[   29.973001]  driver_probe_device+0xd8/0x160
[   29.973010]  __device_attach_driver+0xb8/0x138
[   29.973019]  bus_for_each_drv+0x80/0xdc
[   29.973027]  __device_attach+0x9c/0x188
[   29.973037]  device_initial_probe+0x14/0x20
[   29.973046]  bus_probe_device+0xac/0xb0
[   29.973055]  deferred_probe_work_func+0x8c/0xc8
[   29.973064]  process_one_work+0x210/0x5e4
[   29.983596] mmcblk0: mmc0:5048 SD32G 28.8 GiB
[   29.987546]  worker_thread+0x1bc/0x38c
[   29.987558]  kthread+0x120/0x124
[   29.987568]  ret_from_fork+0x10/0x20
[   29.987579] irq event stamp: 109977
[   29.987584] hardirqs last  enabled at (109977):
[<ffff800080fbbc48>] _raw_spin_unlock_irqrestore+0x6c/0x70
[   29.987600] hardirqs last disabled at (109976):
[<ffff800080fbb0a8>] _raw_spin_lock_irqsave+0x84/0x88
[   29.987610] softirqs last  enabled at (109966):
[<ffff800080090680>] __do_softirq+0x498/0x4e0
[   29.987619] softirqs last disabled at (109961):
[<ffff800080096184>] ____do_softirq+0x10/0x1c
[   30.006747]  mmcblk0: p1
[   30.010291] ---[ end trace 0000000000000000 ]---
[   30.018630] remoteproc remoteproc1: remote processor
9300000.remoteproc is now up
[   30.024525] qcom-pcie 600000.pcie: iATU: unroll F, 32 ob, 8 ib,
align 4K, limit 4G
[   30.044747] qcom,apr remoteproc1:smd-edge.apr_audio_svc.-1.-1:
Adding APR/GPR dev: aprsvc:service:4:3
[   30.046118] qcom-pcie 600000.pcie: Invalid eDMA IRQs found
[   30.051718] qcom,apr remoteproc1:smd-edge.apr_audio_svc.-1.-1:
Adding APR/GPR dev: aprsvc:service:4:4
[   30.066435] Bluetooth: hci0: QCA Downloading qca/nvm_00440302.bin
[   30.130736] hub 1-1:1.0: USB hub found
[   30.150390] qcom-pcie 600000.pcie: PCIe Gen.1 x1 link up
[   30.156394] hub 1-1:1.0: 4 ports detected
[   30.161837] qcom-pcie 600000.pcie: PCI host bridge to bus 0000:00
[   30.189583] pci_bus 0000:00: root bus resource [bus 00-ff]
[   30.195652] pci_bus 0000:00: root bus resource [io  0x0000-0xfffff]
[   30.201035] pci_bus 0000:00: root bus resource [mem 0x0c300000-0x0cffffff]
[   30.205424] Bluetooth: hci0: QCA setup on UART is completed
[   30.207262] pci 0000:00:00.0: [17cb:0104] type 01 class 0x060400
PCIe Root Port
[   30.214380] usb 2-1: new SuperSpeed USB device number 2 using xhci-hcd
[   30.219636] qcom-venus c00000.video-codec: Allocating domain
[   30.221503] pci 0000:00:00.0: BAR 0 [mem 0x00000000-0x00000fff]
[   30.221680] pci 0000:00:00.0: PCI bridge to [bus 01-ff]
[   30.221772] pci 0000:00:00.0:   bridge window [io  0x0000-0x0fff]
[   30.221832] pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff]
[   30.221945] pci 0000:00:00.0:   bridge window [mem
0x00000000-0x000fffff 64bit pref]
[   30.222617] pci 0000:00:00.0: PME# supported from D0 D3hot
[   30.273673] hub 2-1:1.0: USB hub found
[   30.276567] hub 2-1:1.0: 4 ports detected

Format: Log Type - Time(microsec) - Message - Optional Info
Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
S - QC_IMAGE_VERSION_STRING=BOOT.XF.1.0-00301
S - IMAGE_VARIANT_STRING=M8996LAB
S - OEM_IMAGE_VERSION_STRING=crm-ubuntu68
S - Boot Interface: UFS

I traced this further, it crashes during arm_smmu_write_context_bank().



--
With best wishes
Dmitry

