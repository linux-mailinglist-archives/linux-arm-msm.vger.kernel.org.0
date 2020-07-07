Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CCB9216ABD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2020 12:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728094AbgGGKsj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jul 2020 06:48:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728048AbgGGKsj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jul 2020 06:48:39 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4C41C08C5DB
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2020 03:48:38 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id dg28so37963817edb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2020 03:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OZw9WF+sLD7+S/P+7F6VJUju0c1b8KGkxnX1D6C0CBY=;
        b=VLodcZ+XVy6S8cm4qwMKpTFvUNqrFoZEbNt/c4CCapdXa7iXxB5CpvNSLzMPaFPdid
         LHVLihcWQ+Q2oZcjFMyUezBnO/uav7shIwwBtxbaIyBR/zcLXsQS3hdDHRtl1BwJhVyX
         KeCZh+yMfxSDW58BnTwMioYFGPuHU+T9iquLZmLY6QmsymaYnOtBvwmEIYQEQ+xRvPqJ
         Hm8Bi7plNgs/1ulVCD/3t3wD59OEGJ1ktz5X1+9/Rg5i4YrlUspH4ZnC3eTYsuIz9enK
         x0tUCUdT5vuKNswGw+11te2bqgOsOYOEGxaKk3OcG4qgEqfCgyzCD71pXavPIJ7HIoBp
         WgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OZw9WF+sLD7+S/P+7F6VJUju0c1b8KGkxnX1D6C0CBY=;
        b=auLZVU+eQX/EYV6hCKSmJXxZUHlOgBlIchsvk9tZuQ9bnESi2lSv3VRTJHW4CLE4Tp
         EXBfVSkfbQc5IMSbS+089JnzHXhOB0EieGKv3hILnXnBQVgF0pwdILhhz03Yr3T196m3
         Y/f350pfnyspXz8ch1T7lE9l/e7xBvkx8bB2T/SH8eIHjZwneCCIS3/lhnYQ6iYbbNbS
         724CD3as9wCLVx+ZLfbh0xCjjx7o24IcLb9wPxj3pTvKy5jrayz9x21f7jexH9tsG7Rf
         8hRPbcrhFkmdDvaOX2l2JXZuJqnMskGgKPHcppXFUcY3AWbhb7wv6Kqpinp5KyKrR5mk
         /HDw==
X-Gm-Message-State: AOAM530Tgektkp/M/HODR2kJdOli54S2TEV0SO8uJtTYh3U4VHMIXb4J
        nm+Id4UxCaCf3XEX5HOdr7g95w==
X-Google-Smtp-Source: ABdhPJxMCfYoXtG9EMvYyx83jtYoaHCy9ePgt3od0RIGDNDJYG7oY/Sdl2HKdoTPTHU2HCFZPmLE6A==
X-Received: by 2002:a05:6402:16db:: with SMTP id r27mr61765206edx.139.1594118917429;
        Tue, 07 Jul 2020 03:48:37 -0700 (PDT)
Received: from myrica ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id t25sm174229ejc.34.2020.07.07.03.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 03:48:36 -0700 (PDT)
Date:   Tue, 7 Jul 2020 12:48:25 +0200
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        John Stultz <john.stultz@linaro.org>,
        freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/6] iommu/arm-smmu: Add auxiliary domain support for
 arm-smmuv2
Message-ID: <20200707104825.GA159413@myrica>
References: <20200626200414.14382-1-jcrouse@codeaurora.org>
 <20200626200414.14382-2-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626200414.14382-2-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jordan,

On Fri, Jun 26, 2020 at 02:04:09PM -0600, Jordan Crouse wrote:
> Support auxiliary domains for arm-smmu-v2 to initialize and support
> multiple pagetables for a single SMMU context bank. Since the smmu-v2
> hardware doesn't have any built in support for switching the pagetable
> base it is left as an exercise to the caller to actually use the pagetable.
> 
> Aux domains are supported if split pagetable (TTBR1) support has been
> enabled on the master domain.  Each auxiliary domain will reuse the
> configuration of the master domain. By default the a domain with TTBR1
> support will have the TTBR0 region disabled so the first attached aux
> domain will enable the TTBR0 region in the hardware and conversely the
> last domain to be detached will disable TTBR0 translations.  All subsequent
> auxiliary domains create a pagetable but not touch the hardware.
> 
> The leaf driver will be able to query the physical address of the
> pagetable with the DOMAIN_ATTR_PTBASE attribute so that it can use the
> address with whatever means it has to switch the pagetable base.
> 
> Following is a pseudo code example of how a domain can be created
> 
>  /* Check to see if aux domains are supported */
>  if (iommu_dev_has_feature(dev, IOMMU_DEV_FEAT_AUX)) {
> 	 iommu = iommu_domain_alloc(...);
> 

The device driver should also call iommu_dev_enable_feature() before using
the AUX feature. I see that you implement them as NOPs and in this case
the GPU is tightly coupled with the SMMU so interoperability between
different IOMMU and device drivers doesn't matter much, but I think it's
still a good idea to follow the same patterns in all drivers to make
future work on the core IOMMU easier.

> 	 if (iommu_aux_attach_device(domain, dev))
> 		 return FAIL;
> 
> 	/* Save the base address of the pagetable for use by the driver
> 	iommu_domain_get_attr(domain, DOMAIN_ATTR_PTBASE, &ptbase);
>  }
> 
> Then 'domain' can be used like any other iommu domain to map and
> unmap iova addresses in the pagetable.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  drivers/iommu/arm-smmu.c | 219 ++++++++++++++++++++++++++++++++++++---
>  drivers/iommu/arm-smmu.h |   1 +
>  2 files changed, 204 insertions(+), 16 deletions(-)
[...]
> @@ -1653,6 +1836,10 @@ static struct iommu_ops arm_smmu_ops = {
>  	.get_resv_regions	= arm_smmu_get_resv_regions,
>  	.put_resv_regions	= generic_iommu_put_resv_regions,
>  	.def_domain_type	= arm_smmu_def_domain_type,
> +	.dev_has_feat		= arm_smmu_dev_has_feat,
> +	.dev_enable_feat	= arm_smmu_dev_enable_feat,
> +	.dev_disable_feat	= arm_smmu_dev_disable_feat,
> +	.aux_attach_dev		= arm_smmu_aux_attach_dev,

To be complete this also needs dev_feat_enabled() and aux_detach_dev() ops

Thanks,
Jean
