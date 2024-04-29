Return-Path: <linux-arm-msm+bounces-18848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F7E8B648F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 23:26:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 964A51C21A90
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 21:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1AD518410F;
	Mon, 29 Apr 2024 21:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ma4fsmPq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BB4184100
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 21:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714426005; cv=none; b=l8/PNFivS6nCoFbyPecW3E0LqkwWhU//TmXmPeMY41X4uPpWwrmYoFPrkenO6eZTeWl3FSRInJp7RoulpWaEegvw5uDZh2y2r85Nc64ZiH3XGx/m0rvQzP3Z7kBvuAfNFE+b4RRYj1mqdXoBnahd7rh3nhem3/atbCCZP4i/AyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714426005; c=relaxed/simple;
	bh=Dr1C3G4pbGiXPC5Ti/nKd6k7VSHbUcwlgdfOmEAfcuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rojOCqe2xxcw1B/VY5k8VHrs8B+vdAsD3FgA3rB4gSxNKIsF200YUdAsq06hpxBWoEhqVziJM65o185G6C3VLRZnIULWc7ZaPigY5RXb00NKDXHTHmkwYvcsqsxpxEsVSfKerOcVxxSLxMU4ZrG4577qrUXISVX7qsvF5TX1EjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ma4fsmPq; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dbed0710c74so4680980276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 14:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714426003; x=1715030803; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QU/Tws1Y+aFFVGVLoOklo9JtVUD/v/fzs2lzZlQCwNQ=;
        b=ma4fsmPqofCCJJ9JwoRipkbZJBsYoXJ6OJhIx+xK7xV6qkhkYhy9H8I4Wwm1V5xSGa
         OaZlx9gJbSLwB21m+AjcPPa+f9I2/z2WFaS5RsRkLaNL9Rrkm242cOpVWDJ38PGPf93v
         Qu80w3KEPHe5KxE7JFiTiCEExdleXOB+BT5E4eyB/2geEMxXPlEF82BDWHDiCdl75i7P
         r/1mqb05Vkra5AF91J2XX2rUbXwXwJPUzVsmWJkZp7Zo/O523xZGd57ue2TDEEZPFUEO
         fH4XN1i+5OVucg5EaJHUduAbRzg8D7HCJil7vTSWDx+7b4QLnQe8Iu/hP9Cg61nyNYla
         +grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714426003; x=1715030803;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QU/Tws1Y+aFFVGVLoOklo9JtVUD/v/fzs2lzZlQCwNQ=;
        b=ME6w4zekwhpYjmCn26BX81bpYR/EozyQ9i03bsVgjOeskID8akpZ5dWvDHl/r2xW+r
         NDp0xF5rdSzJn2zH+6V+lNmizH+2wM/0zyuozA/InSN59v0gCC9wi99sHPBOwwaW93Gi
         CEtP498vHVDa6N6cMH8PQXbezSnC7D2TZefWspD3hyibvsFptD+vMcQKWnIVOZwYHx4k
         AphKMKWwoGECbBQ0mrPT8Dd5dQO6x4G+BCyE19fxb9XusLOcQosyNpzhPTD/exxlZd3w
         a+9g13w1vOFL+A5UbbpUSKZUrvU0PIAHTp5sa3eU1suKmbuL/UbL0Gi5kYKuGOnXUcuX
         2Q6A==
X-Forwarded-Encrypted: i=1; AJvYcCWnFvMCjKPWtGFjNZtL4EsWj/k6encLOdtzUBntcDY0Z8piNNz9u5QyoVukjckHOhX+DZJohkci7cEcPoPxz8eaw2Wc4rhqidKcv+K/kA==
X-Gm-Message-State: AOJu0Yx/LRsVi3GfTeT7P2qSrgcJJTeHfzobGRAj09ydh3LTlfQOZ/fq
	UtmR5rq4tFEj8/X3uKZ/54Mw52LYULQFVbbMsr8yq0ZaZY6gdgUhlrSOKeSX+3LDDUVad2xxEWn
	ehSz25NwwS7PuYAtczYJbGRoZyIVuQ4Uz2IjwIw==
X-Google-Smtp-Source: AGHT+IGKK3YXyDU+4ECuqi3EgUuBK4bT+CVyxZ6dH/j0Bz4fVxCMiVvjkF3hOLG0ZcsUc7l0RWVJyvbD7ONlUCh2d6s=
X-Received: by 2002:a25:b910:0:b0:dcc:6112:f90d with SMTP id
 x16-20020a25b910000000b00dcc6112f90dmr10901148ybj.62.1714426003134; Mon, 29
 Apr 2024 14:26:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1713523152.git.robin.murphy@arm.com> <bebea331c1d688b34d9862eefd5ede47503961b8.1713523152.git.robin.murphy@arm.com>
 <Zi_LV28TR-P-PzXi@eriador.lumag.spb.ru>
In-Reply-To: <Zi_LV28TR-P-PzXi@eriador.lumag.spb.ru>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Apr 2024 00:26:31 +0300
Message-ID: <CAA8EJprL8NbNfOvp17hrHoVNkKBpD39xfeu+STm6m9VObF2n9Q@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] iommu/dma: Centralise iommu_setup_dma_ops()
To: Robin Murphy <robin.murphy@arm.com>, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Joerg Roedel <joro@8bytes.org>, Christoph Hellwig <hch@lst.de>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Niklas Schnelle <schnelle@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Apr 2024 at 19:31, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, Apr 19, 2024 at 05:54:45PM +0100, Robin Murphy wrote:
> > It's somewhat hard to see, but arm64's arch_setup_dma_ops() should only
> > ever call iommu_setup_dma_ops() after a successful iommu_probe_device(),
> > which means there should be no harm in achieving the same order of
> > operations by running it off the back of iommu_probe_device() itself.
> > This then puts it in line with the x86 and s390 .probe_finalize bodges,
> > letting us pull it all into the main flow properly. As a bonus this lets
> > us fold in and de-scope the PCI workaround setup as well.
> >
> > At this point we can also then pull the call up inside the group mutex,
> > and avoid having to think about whether iommu_group_store_type() could
> > theoretically race and free the domain if iommu_setup_dma_ops() ran just
> > *before* iommu_device_use_default_domain() claims it... Furthermore we
> > replace one .probe_finalize call completely, since the only remaining
> > implementations are now one which only needs to run once for the initial
> > boot-time probe, and two which themselves render that path unreachable.
> >
> > This leaves us a big step closer to realistically being able to unpick
> > the variety of different things that iommu_setup_dma_ops() has been
> > muddling together, and further streamline iommu-dma into core API flows
> > in future.
> >
> > Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com> # For Intel IOMMU
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > Tested-by: Hanjun Guo <guohanjun@huawei.com>
> > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > ---
> > v2: Shuffle around to make sure the iommu_group_do_probe_finalize() case
> >     is covered as well, with bonus side-effects as above.
> > v3: *Really* do that, remembering the other two probe_finalize sites too.
> > ---
> >  arch/arm64/mm/dma-mapping.c  |  2 --
> >  drivers/iommu/amd/iommu.c    |  8 --------
> >  drivers/iommu/dma-iommu.c    | 18 ++++++------------
> >  drivers/iommu/dma-iommu.h    | 14 ++++++--------
> >  drivers/iommu/intel/iommu.c  |  7 -------
> >  drivers/iommu/iommu.c        | 20 +++++++-------------
> >  drivers/iommu/s390-iommu.c   |  6 ------
> >  drivers/iommu/virtio-iommu.c | 10 ----------
> >  include/linux/iommu.h        |  7 -------
> >  9 files changed, 19 insertions(+), 73 deletions(-)
>
> This patch breaks UFS on Qualcomm SC8180X Primus platform:
>
>
> [    3.846856] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x1032db3e0, fsynr=0x130000, cbfrsynra=0x300, cb=4
> [    3.846880] ufshcd-qcom 1d84000.ufshc: ufshcd_check_errors: saved_err 0x20000 saved_uic_err 0x0
> [    3.846929] host_regs: 00000000: 1587031f 00000000 00000300 00000000
> [    3.846935] host_regs: 00000010: 01000000 00010217 00000000 00000000
> [    3.846941] host_regs: 00000020: 00000000 00070ef5 00000000 00000000
> [    3.846946] host_regs: 00000030: 0000000f 00000001 00000000 00000000
> [    3.846951] host_regs: 00000040: 00000000 00000000 00000000 00000000
> [    3.846956] host_regs: 00000050: 032db000 00000001 00000000 00000000
> [    3.846962] host_regs: 00000060: 00000000 80000000 00000000 00000000
> [    3.846967] host_regs: 00000070: 032dd000 00000001 00000000 00000000
> [    3.846972] host_regs: 00000080: 00000000 00000000 00000000 00000000
> [    3.846977] host_regs: 00000090: 00000016 00000000 00000000 0000000c
> [    3.847074] ufshcd-qcom 1d84000.ufshc: ufshcd_err_handler started; HBA state eh_fatal; powered 1; shutting down 0; saved_err = 131072; saved_uic_err = 0; force_reset = 0
> [    4.406550] ufshcd-qcom 1d84000.ufshc: ufshcd_verify_dev_init: NOP OUT failed -11
> [    4.417953] ufshcd-qcom 1d84000.ufshc: ufshcd_async_scan failed: -11

Just to confirm: reverting f091e93306e0 ("dma-mapping: Simplify
arch_setup_dma_ops()") and b67483b3c44e ("iommu/dma: Centralise
iommu_setup_dma_ops()" fixes the issue for me. Please ping me if you'd
like me to test a fix.


-- 
With best wishes
Dmitry

