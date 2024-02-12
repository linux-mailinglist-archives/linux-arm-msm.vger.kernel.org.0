Return-Path: <linux-arm-msm+bounces-10760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E455985225A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 00:18:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C22A284B1A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 23:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738684F5FE;
	Mon, 12 Feb 2024 23:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vG3kfOBK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8376B4EB2C
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 23:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707779918; cv=none; b=MevYjuC40pfjM50zxehcAqsQcBY63Su7A0Vxu0SMzC0DFJBWYr6SN/Oa+rTVaBdOFstHvwZ91Czr9sP2Jm/USTnW3RxtVDSz0mfCJMUVHaXp6EhB1SFCPF9PQunuXeD3T7+PuEVUfBtCo6bWgv9QZA2r6iydKm93dgFrRPPeG6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707779918; c=relaxed/simple;
	bh=B7pihwsjDfEm8UE0m/hFK9r9fK9HYujiQ7NXpc9fsmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bsf/jjXnqn7loTJ1NrKHU9rYj/oCJ8W+EfcBLz09AigDu0PlTMaNdFPYRh4qY/XHanxlQBn9UCUawy3POLu0PL9swAg7GVDV46JZwJYWaYGBJJwVK+/u7DWCmXPQ3wudUnUgEmpiWH3Ami6NytQ1OlDJ8JVjH1TKG2ZvToNvWqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vG3kfOBK; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dbed179f0faso3350801276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 15:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707779915; x=1708384715; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q2oUKZ9+k2fWUDVHdxmDEvSogLo9+LaOxnS10TKDJLQ=;
        b=vG3kfOBKhfmyb/ZIlfSWcmqIwa+XfI4GoPq/X8SrukjLHn0+VIa/+NwLmILMKZADYH
         D+OM2PNDLsvhaRiyyy3l1kF28fx8gezwH95NLjvB7m1LD2N4drfwVqowwXmj2QLXFpnh
         P31HAEwdbs3o/rAbBVKseTgFaUjFylunpGc8w+V7iaOuO0tcAqR8f6MaAtmoGRAosLoM
         sSbfv0LWiRx91Z4XGh8JSISaWzwcbpU+phGROY4yJKMuoEwH/NSF721IVQMr4AHWa0Yh
         qzTXWxyDgcnSltYs5Z6iQHVaocWbX9cwTAmv0zvN0dXc+xZl7lF98NjKzFY1aSxLSY4Z
         mvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707779915; x=1708384715;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q2oUKZ9+k2fWUDVHdxmDEvSogLo9+LaOxnS10TKDJLQ=;
        b=WwZHiYB3ITH1SB3GWxOlHfePrEX2GreYBTFiWHrQOvYOcaES80xRLYdRRMNLOrbaJo
         ZzV9G1C7BMN+deil7ygQ6LdL+GaIJ2Ienq9WyT6METCWvqGiO70djp8sekRaIzEjZIcZ
         cC0TjWegE18XtTj7g4fQJt3JZR9xGPljaTO+QYOV8Nn3H513EFj59baf3ZIOxO7d1707
         AZY0iYl9ygA/Vm5TAGQYss9JtQygO7aVmFTCJF0heSIaRpkmT7l1Dkw2qpgJ4YItVeud
         WJUDfUlWI7eAuaykG73jrzDrmcTJGbNRGjoctUlLI+/BUfcQO9uQXXCTpvxu8zMJxG2V
         k/Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXAgjRvLYZnuU+4z9YqmjbmMlFb0Ms72KoggB8gZ/zqRBPyvXzxas3XnaNmlkCMBl0hrWHZwDCCCnYHYEocO2p6tUPEkFsr2WElZsyvvw==
X-Gm-Message-State: AOJu0YzuBbNzsLouFlD0NDwTk9BC6ymDP5GYmGhJgdkQQooKuMuivF0C
	ZNnMfBVRrNVBPCl08dL7EJI2Rf02SYyfZ4Pu22z5gom6VW4g94jAQopuyNmLlzf72KufyYZG83L
	rb6q8CyNmElwq5ElGnzpyVCPLgXXyYANNCTNPFp+x3nPKuPvaFmY=
X-Google-Smtp-Source: AGHT+IE4eLVt2y/x1WM/Sg5v7ZT9w1e+rZDJpX22D6pGoEK1ybOMcLQRNaQPyX7zAEGSwC/QEyXmdBqfKqeNULg9klc=
X-Received: by 2002:a25:ac4e:0:b0:dc6:9d15:be3f with SMTP id
 r14-20020a25ac4e000000b00dc69d15be3fmr712809ybd.2.1707779915351; Mon, 12 Feb
 2024 15:18:35 -0800 (PST)
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
Date: Tue, 13 Feb 2024 01:18:24 +0200
Message-ID: <CAA8EJpqdc3nQmTaWYY4VDE7ChV0NjMgBK7Q0rDRTyKZoWtbreA@mail.gmail.com>
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
>
> So, I would expect this to not WARN_ON and to make it work the same as
> before the patch:
>
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -875,7 +875,9 @@ static struct iommu_domain *arm_smmu_domain_alloc_paging(struct device *dev)
>         mutex_init(&smmu_domain->init_mutex);
>         spin_lock_init(&smmu_domain->cb_lock);
>
> -       if (dev) {
> +       WARN_ON(using_legacy_binding);
> +
> +/*     if (dev) {
>                 struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
>
>                 if (arm_smmu_init_domain_context(smmu_domain, cfg->smmu, dev)) {
> @@ -883,7 +885,7 @@ static struct iommu_domain *arm_smmu_domain_alloc_paging(struct device *dev)
>                         return NULL;
>                 }
>         }
> -
> +*/
>         return &smmu_domain->domain;
>  }

With the full device tree, this crashed during the IOMMU probe, no warnings:

[   15.343477] bam-dma-engine 644000.dma-controller: num-channels
unspecified in dt
[   15.343675] bam-dma-engine 644000.dma-controller: num-ees unspecified in dt
[   15.394653] msm_serial 7570000.serial: msm_serial: detected port #2
[   15.395170] msm_serial 7570000.serial: uartclk = 19200000
[   15.401983] 7570000.serial: ttyMSM2 at MMIO 0x7570000 (irq = 37,
base_baud = 1200000) is a MSM
[   15.407549] serial serial0: tty port ttyMSM2 registered
[   15.421567] Bluetooth: hci0: setting up ROME/QCA6390
[   15.421728] arm-smmu b40000.iommu: probing hardware configuration...
[   15.425866] arm-smmu b40000.iommu: SMMUv2 with:
[   15.432153] arm-smmu b40000.iommu: stage 1 translation
[   15.436407] arm-smmu b40000.iommu: address translation ops
[   15.441580] arm-smmu b40000.iommu: non-coherent table walk
[   15.447136] arm-smmu b40000.iommu: (IDR0.CTTW overridden by FW configuration)
[   15.452750] arm-smmu b40000.iommu: stream matching with 2 register groups
[   15.460038] arm-smmu b40000.iommu: 2 context banks (0 stage-2 only)
[   15.466908] arm-smmu b40000.iommu: Supported page sizes: 0x63315000
[   15.473367] arm-smmu b40000.iommu: Stage-1: 48-bit VA -> 36-bit IPA
[   15.481638] arm-smmu b40000.iommu: preserved 0 boot mappings
[   15.491783] arm-smmu d00000.iommu: probing hardware configuration...
[   15.491955] arm-smmu d00000.iommu: SMMUv2 with:
[
Format: Log Type - Time(microsec) - Message - Optional Info
Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
S - QC_IMAGE_VERSION_STRING=BOOT.XF.1.0-00301


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

With the full device tree, same result:

[   12.319303] bam-dma-engine 644000.dma-controller: num-channels
unspecified in dt
[   12.319502] bam-dma-engine 644000.dma-controller: num-ees unspecified in dt
[   12.370379] msm_serial 7570000.serial: msm_serial: detected port #2
[   12.370895] msm_serial 7570000.serial: uartclk = 19200000
[   12.377773] 7570000.serial: ttyMSM2 at MMIO 0x7570000 (irq = 37,
base_baud = 1200000) is a MSM
[   12.383228] serial serial0: tty port ttyMSM2 registered
[   12.397263] arm-smmu b40000.iommu: probing hardware configuration...
[   12.397441] arm-smmu b40000.iommu: SMMUv2 with:
[   12.398072] Bluetooth: hci0: setting up ROME/QCA6390
[   12.402779] arm-smmu b40000.iommu: stage 1 translation
[   12.402817] arm-smmu b40000.iommu: address translation ops
[   12.402832] arm-smmu b40000.iommu: non-coherent table walk
[   12.402848] arm-smmu b40000.iommu: (IDR0.CTTW overridden by FW configuration)
[   12.402881] arm-smmu b40000.iommu: stream matching with 2 register groups
[   12.402943] arm-smmu b40000.iommu: 2 context banks (0 stage-2 only)
[   12.402987] arm-smmu b40000.iommu: Supported page sizes: 0x63315000
[   12.403004] arm-smmu b40000.iommu: Stage-1: 48-bit VA -> 36-bit IPA
[   12.404941] arm-smmu b40000.iommu: preserved 0 boot mappings
[   12.467015] arm-smmu d00000.iommu: probing hardware configuration...
[   12.467318] arm-smmu d0
Format: Log Type - Time(microsec) - Message - Optional Info
Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
S - QC_IMAGE_VERSION_STRING=BOOT.XF.1.0-00301

Even with disabling display-subsystem and venus, it crashes at the
same place, I don't seem to be able to get past it anymore.

-- 
With best wishes
Dmitry

