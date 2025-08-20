Return-Path: <linux-arm-msm+bounces-69980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6C3B2DE00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 15:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E60DF7A30CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 13:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E82731B13C;
	Wed, 20 Aug 2025 13:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o+naG4JV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7922236FC
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 13:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755697160; cv=none; b=kcI/9HYvQO4g/dk3tehnaatOKfHtvgKMB460x6zXGHlEKb+LfDFuHG7KBxrmRPghOtMnhgyPXNGHslX07M398QTXOHa2vQg6TECtD/5T8Ii0lUSBpHVZyVYYlDnj8S3Nte/erHOcixViKGh/EpWbnY4EAs4uxIuU1ld2ueknc/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755697160; c=relaxed/simple;
	bh=M3i6uVRggCi8xPqmo+LsulXVbLuHnrRWwTmZHmguz5Y=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COd0YaVBibbfFhRnPOJPGaDINOtBa/7L6+1EjYIm6EDCbpf2xI7lj7d1MLJVHq3kL3deC7SNY82VRWZQ3dJd8MAyxmb3gLIHCCe3r0H3Wet1XIAUzh/EPX+i+TPN8qWR9PoITi7/KI2CPbS6NYI0r7u+wzMae0yYmXIM06q5tcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o+naG4JV; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b0b2d21so34031045e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 06:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755697157; x=1756301957; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=segv7OcEqGHmpPDWsxKxZ/1ElsEUtAJ0AJPdIZbwX7s=;
        b=o+naG4JVXSgUFF74b6Bde+aDL2K040v45vxrUN5D7VblNfNZ79HLnOXI2MN/WCfdIA
         Uz0OThHykYHLg7MqqqvgiAO0FXLnKkK2UiBxJ3qGJLzqDp0qu5kL8frJhPY//fnBzWoq
         k/SDpqc2T45BIJ5dsJ2gtQIqhLxUBxJ4iPthGaxV3/uExpJEkUFooKKAIQOzqE6rK/G5
         db4nqM2eVpfIxeWHapXCp4SE+cC8i/1MscKCIULwvWxqhwCnpPhYlnzShkdAzaMwxMn6
         XgI5eup9UGTiQZ2fvN4aDuZj3rj2THYEq5KX30ziH/s7tKdxdQ6C2Z8OivYz1sf9b6Bm
         9BWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755697157; x=1756301957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=segv7OcEqGHmpPDWsxKxZ/1ElsEUtAJ0AJPdIZbwX7s=;
        b=YVaBjYG5v0L7EGX7SG8XQkpqA6nHYnTCSkFkOyzt2bOgaAPYpYGNxNEtuQA9GGPbY5
         bM6sVGkvrB7VzDeVvDCYaMfODiEuGyozafHoGLqWCXC3B6awfKUlxayj32fp1G2cxHup
         cQkaw1TTI2js62r7+ZYFGiugRBt6AuArU0WacbAgSlElVS7CaM+aJ0M3PR0NrBtINKXF
         V8qKX3tiGKkdE7+6NQLppTVVvRsihxwmf9Njc/aJ++j88TO3CYN18eqvq5Tt2YE7dP8s
         YZq7DrEPybMpNRgoSRMJZ/fLq+TlORtPaKWEFedzdkLfZ/jf3EeeGF1VSZ8Scdrnkqhv
         9VEA==
X-Forwarded-Encrypted: i=1; AJvYcCUHugQC+PHWIagLg3EoQsfxR+aizMv+JJy2Ebe/83lnLU9BRGDodPNFmB3H3I7vd3FBwwAUKoY5MNaEIRr4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy04DGgrhbP8q9vKhgjzhWjXX9TuHoGtKP/qrJbI5kDLkKFjVTz
	B8GAH+Hus+ay/3GWlRKWs72R+RCPT5GXt7j8HRJTkJAhYK5aPMvSzBGgv+6KUK7sEQM=
X-Gm-Gg: ASbGncuNQbLkfAo6rWJfvfpDOAVI/OduO9PZrvaiPrcCLugPUW4LLhY0Ms8xMBWBZJZ
	yoiqM0o4YKXKu2wklNqVa2kywXftRCa9yJf76xvqB4179N8Cur1wLSiCU/efCyNOJEbYpjakD7v
	0Btl1j/69Bd6ZkM3N0EFOrO7w9GTyBj6WT/LJ4oBPbAODTND62We4YJuRjBAoPzmpcLPlApzq2U
	nQiVZbiczjk0Fj+6pc4DfBFw3JGVeaIPAUHTbeatOYXd0F83L9crSJi6Td1OjSwh0u8Dyin9MwC
	K0QTiNJQmQ04Fe2Buin6u8EffWcri8ojYOttC3g2MHXFx66QDPG6N/V/F31MOTw7+01rsRGOokr
	usnuHSkuv/ueN1HfadGdRISP3cCPSkVqQHec=
X-Google-Smtp-Source: AGHT+IET1hYOiPzdOS4fElfyldDhjsRo9Aa7YSrYd670tHhX8unbUDX2n3Pg/GTb2q9YAmWKlueOhw==
X-Received: by 2002:a05:600c:4706:b0:440:6a79:6df0 with SMTP id 5b1f17b1804b1-45b479e2750mr20204605e9.22.1755697156732;
        Wed, 20 Aug 2025 06:39:16 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:d9eb:6295:cf25:b839])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47c31327sm33198815e9.8.2025.08.20.06.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 06:39:16 -0700 (PDT)
Date: Wed, 20 Aug 2025 15:39:14 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 11/11] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <aKXQAoXZyR6SRPAA@linaro.org>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-12-mukesh.ojha@oss.qualcomm.com>
 <aKWLZwYVPJBABhRI@linaro.org>
 <20250820115659.kkngraove46wemxv@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820115659.kkngraove46wemxv@hu-mojha-hyd.qualcomm.com>

On Wed, Aug 20, 2025 at 05:26:59PM +0530, Mukesh Ojha wrote:
> On Wed, Aug 20, 2025 at 10:46:31AM +0200, Stephan Gerhold wrote:
> > On Tue, Aug 19, 2025 at 10:24:46PM +0530, Mukesh Ojha wrote:
> > > Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
> > > or QHEE), which typically handles IOMMU configuration. This includes
> > > mapping memory regions and device memory resources for remote processors
> > > by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
> > > later removed during teardown. Additionally, SHM bridge setup is required
> > > to enable memory protection for both remoteproc metadata and its memory
> > > regions.
> > > 
> > > When the hypervisor is absent, the operating system must perform these
> > > configurations instead.
> > > 
> > > Support for handling IOMMU and SHM setup in the absence of a hypervisor
> > > is now in place. Extend the Iris driver to enable this functionality on
> > > platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).
> > > 
> > > Additionally, the Iris driver must map the firmware and its required
> > > resources to the firmware SID, which is now specified via the device tree.
> > > 
> > > Co-developed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> > > Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > ---
> > >  drivers/media/platform/qcom/iris/iris_core.c  |   9 +-
> > >  drivers/media/platform/qcom/iris/iris_core.h  |   6 +
> > >  .../media/platform/qcom/iris/iris_firmware.c  | 156 ++++++++++++++++--
> > >  .../media/platform/qcom/iris/iris_firmware.h  |   2 +
> > >  4 files changed, 155 insertions(+), 18 deletions(-)
> > > 
> > > [...]
> > > diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> > > index f1b5cd56db32..e3f2fe5c9d7a 100644
> > > --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> > > +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> > > @@ -3,10 +3,18 @@
> > >   * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> > >   */
> > >  
> > > +#include <linux/device.h>
> > >  #include <linux/firmware.h>
> > > -#include <linux/firmware/qcom/qcom_scm.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/iommu.h>
> > > +#include <linux/io.h>
> > > +#include <linux/of.h>
> > >  #include <linux/of_address.h>
> > >  #include <linux/of_reserved_mem.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/of_device.h>
> > > +#include <linux/firmware/qcom/qcom_scm.h>
> > > +#include <linux/sizes.h>
> > >  #include <linux/soc/qcom/mdt_loader.h>
> > >  
> > >  #include "iris_core.h"
> > > @@ -17,15 +25,14 @@
> > >  static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
> > >  {
> > >  	u32 pas_id = core->iris_platform_data->pas_id;
> > > +	struct qcom_scm_pas_ctx *ctx;
> > >  	const struct firmware *firmware = NULL;
> > >  	struct device *dev = core->dev;
> > > -	struct reserved_mem *rmem;
> > > -	struct device_node *node;
> > > -	phys_addr_t mem_phys;
> > > -	size_t res_size;
> > > -	ssize_t fw_size;
> > > -	void *mem_virt;
> > > -	int ret;
> > > +	struct reserved_mem *rmem = NULL;
> > > +	struct device_node *node = NULL;
> > > +	ssize_t fw_size = 0;
> > > +	void *mem_virt = NULL;
> > > +	int ret = 0;
> > >  
> > >  	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
> > >  		return -EINVAL;
> > > @@ -39,36 +46,64 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
> > >  	if (!rmem)
> > >  		return -EINVAL;
> > >  
> > > -	mem_phys = rmem->base;
> > > -	res_size = rmem->size;
> > > +	if (core->has_iommu)
> > > +		dev = core->fw.dev;
> > >  
> > > +	ctx = qcom_scm_pas_ctx_init(dev, pas_id, rmem->base, rmem->size, false);
> > > +	if (!ctx)
> > > +		return -ENOMEM;
> > > +
> > > +	ctx->has_iommu = core->has_iommu;
> > >  	ret = request_firmware(&firmware, fw_name, dev);
> > >  	if (ret)
> > >  		return ret;
> > >  
> > >  	fw_size = qcom_mdt_get_size(firmware);
> > > -	if (fw_size < 0 || res_size < (size_t)fw_size) {
> > > +	if (fw_size < 0 || rmem->size < (size_t)fw_size) {
> > >  		ret = -EINVAL;
> > >  		goto err_release_fw;
> > >  	}
> > >  
> > > -	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
> > > +	mem_virt = memremap(rmem->base, rmem->size, MEMREMAP_WC);
> > >  	if (!mem_virt) {
> > >  		ret = -ENOMEM;
> > >  		goto err_release_fw;
> > >  	}
> > >  
> > > -	ret = qcom_mdt_load(dev, firmware, fw_name,
> > > -			    pas_id, mem_virt, mem_phys, res_size, NULL);
> > > +	ret = qcom_mdt_pas_load(ctx, firmware, fw_name, mem_virt, NULL);
> > >  	if (ret)
> > >  		goto err_mem_unmap;
> > >  
> > > -	ret = qcom_scm_pas_auth_and_reset(pas_id);
> > > +	if (core->has_iommu) {
> > > +		ret = iommu_map(core->fw.iommu_domain, 0, rmem->base, rmem->size,
> > > +				IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV, GFP_KERNEL);
> > 
> > What is the use case for IOMMU_PRIV here? You don't have this flag for
> > the qcom_q6v5_pas change.
> 
> This is there for historic regions, I may not have complete information about why
> is it required but the reference is taken from venus support for chrome.
> 

Setting IOMMU_PRIV results in omitting the ARM_LPAE_PTE_AP_UNPRIV bit in
the IOMMU page tables - have you checked if QHEE sets this? Ideally we
want to do the same QHEE would normally do.

Also, please add a define for the 0 numbere here similar to

#define VENUS_FW_START_ADDR		0x0

It's quite hard to see that this is not an identity-mapping like for
qcom_q6v5_pas.

>  
> > > +		if (ret)
> > > +			goto err_mem_unmap;
> > > +
> > > +		/*
> > > +		 * Firmware has no support for resource table for now, so, lets
> > > +		 * pass NULL and zero for input resource table and input resource
> > > +		 * table respectively.
> > > +		 */
> > > +		ret = qcom_mdt_pas_map_devmem_rscs(ctx, core->fw.iommu_domain, NULL, 0);
> > > +		if (ret)
> > > +			goto err_unmap_carveout;
> > > +	}
> > > +
> > > +	ret = qcom_scm_pas_prepare_and_auth_reset(ctx);
> > >  	if (ret)
> > > -		goto err_mem_unmap;
> > > +		goto err_unmap_devmem_rscs;
> > > +
> > > +	core->fw.ctx = ctx;
> > >  
> > >  	return ret;
> > >  
> > > +err_unmap_devmem_rscs:
> > > +	if (core->has_iommu)
> > > +		qcom_mdt_pas_unmap_devmem_rscs(ctx, core->fw.iommu_domain);
> > > +err_unmap_carveout:
> > > +	if (core->has_iommu)
> > > +		iommu_unmap(core->fw.iommu_domain, 0, rmem->size);
> > >  err_mem_unmap:
> > >  	memunmap(mem_virt);
> > >  err_release_fw:
> > > @@ -109,10 +144,97 @@ int iris_fw_load(struct iris_core *core)
> > >  
> > >  int iris_fw_unload(struct iris_core *core)
> > >  {
> > > -	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> > > +	struct qcom_scm_pas_ctx *ctx;
> > > +	int ret;
> > > +
> > > +	ctx = core->fw.ctx;
> > > +	ret = qcom_scm_pas_shutdown(ctx->peripheral);
> > > +	if (core->has_iommu) {
> > > +		iommu_unmap(core->fw.iommu_domain, 0, ctx->mem_size);
> > > +		qcom_mdt_pas_unmap_devmem_rscs(ctx, core->fw.iommu_domain);
> > > +	}
> > > +
> > > +	return ret;
> > >  }
> > >  
> > >  int iris_set_hw_state(struct iris_core *core, bool resume)
> > >  {
> > >  	return qcom_scm_set_remote_state(resume, 0);
> > >  }
> > > +
> > > +int iris_fw_init(struct iris_core *core)
> > > +{
> > > +	struct platform_device_info info;
> > > +	struct iommu_domain *iommu_dom;
> > > +	struct platform_device *pdev;
> > > +	struct device_node *np;
> > > +	int ret;
> > > +
> > > +	np = of_get_child_by_name(core->dev->of_node, "video-firmware");
> > > +	if (!np)
> > > +		return 0;
> > 
> > You need a dt-bindings change for this as well. This is documented only
> > for Venus.
> 
> You are right, wanted to send device tree and binding support separately.
> But if required, will add with the series in the next version.
> 

You can send device tree changes separately, but dt-binding changes
always need to come before the driver changes.

Thanks,
Stephan

