Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2902E1C45DA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2020 20:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730839AbgEDS1y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 May 2020 14:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730903AbgEDS1y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 May 2020 14:27:54 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E77DCC0610D5
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2020 11:27:53 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id x6so73595plv.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2020 11:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nNG0LdDMqhgoNOsYJtqodOSWFHeIBtvo/8trfMubmmI=;
        b=l1z9nxVQOCSfy94Afw1Uy11I/u7eFSYpN2RP/fNFVUCBQ66CkXzNxP0dmnLSm5vSy9
         kgQzrEUmn2Z8f0r+GfX2Ov+oFmOKMsi2lbh0nx2WWXs0xuD1SuIIW/jrxDnRRtRuJMJG
         OKCPDD6drFQiiF7mQIS7tSWDeVGGGL4BeVQgpHiXyhL2Mkv8RzHd/479D3TcBNVDLJ97
         6mPohZITWb+Z0XAIpgYRFflCD5EP2gp8892Y7cfm4LLBx/+AofWqKcowBi+qTLexBXWK
         7jg8OcFWRTqzFIJR1e9SvyADZYJjnSJ/Xbsz9K90LYmp94Z8mf+ZvDMI8ctmeuYPPjIp
         6DOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nNG0LdDMqhgoNOsYJtqodOSWFHeIBtvo/8trfMubmmI=;
        b=ksu9vRpxkwSRRB567OCiOMGLopPrYB5MAOYjbsTWyj/Qiq7tyOhgvS5M1S106H5WPc
         eFRaZbNYFBvvq9ks+HXPL6JG4a4N/rZtV5sv7ii5XgAd+pCYhdiMlpwmTtw4lvVDiMGf
         XRqWsgoZS1axJQwVt7V8GKrqAk5ThorLX8yYPRgjlv0/3HtxFUoobI2ReK+Npf5FBGaw
         uKAM3eFPSJU8I+uEZf6VohF+HkhTevwlLPmRKjMMQyfOVziqvMSff5GYkZJGw0EFAE4d
         6HrNp84GmQPBDAPAGS7aZMLBuUnp7VTnliuTuMhY/6XmBCgETjaWNI2c7ziSw7w/I0Y/
         h37w==
X-Gm-Message-State: AGi0PuZVpVce1qKerCaDMVidbJOHFhlbHr3CgtcMaxE3BCzXDtx+w8Vl
        V7sAY/fSizIsFfWcVV+EiDq6vQ==
X-Google-Smtp-Source: APiQypJWzYTt4TwZ/qA7F3EWZokRUkdG2JpMjsFX+GZrUyPGCSa3XwwUZnYR5pCPtQCkhEkhCo4hTg==
X-Received: by 2002:a17:90a:d917:: with SMTP id c23mr332348pjv.192.1588616873082;
        Mon, 04 May 2020 11:27:53 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 71sm9489750pfw.111.2020.05.04.11.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 11:27:52 -0700 (PDT)
Date:   Mon, 4 May 2020 11:28:36 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     davem@davemloft.net, evgreen@chromium.org, subashab@codeaurora.org,
        cpratapa@codeaurora.org, agross@kernel.org, robh+dt@kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 3/4] net: ipa: define IMEM memory region for
 IPA
Message-ID: <20200504182836.GC20625@builder.lan>
References: <20200504175859.22606-1-elder@linaro.org>
 <20200504175859.22606-4-elder@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200504175859.22606-4-elder@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 04 May 10:58 PDT 2020, Alex Elder wrote:

> Define a region of IMEM memory available for use by IPA in the
> platform configuration data.  Initialize it from ipa_mem_init().
> The memory must be mapped for access through an SMMU.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Alex Elder <elder@linaro.org>
> ---
>  drivers/net/ipa/ipa.h             |  5 ++
>  drivers/net/ipa/ipa_data-sc7180.c |  2 +
>  drivers/net/ipa/ipa_data-sdm845.c |  2 +
>  drivers/net/ipa/ipa_data.h        |  6 ++-
>  drivers/net/ipa/ipa_mem.c         | 84 +++++++++++++++++++++++++++++++
>  5 files changed, 98 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ipa/ipa.h b/drivers/net/ipa/ipa.h
> index 23fb29889e5a..32f6dfafdb05 100644
> --- a/drivers/net/ipa/ipa.h
> +++ b/drivers/net/ipa/ipa.h
> @@ -47,6 +47,8 @@ struct ipa_interrupt;
>   * @mem_offset:		Offset from @mem_virt used for access to IPA memory
>   * @mem_size:		Total size (bytes) of memory at @mem_virt
>   * @mem:		Array of IPA-local memory region descriptors
> + * @imem_iova:		I/O virtual address of IPA region in IMEM
> + * @imem_size;		Size of IMEM region
>   * @zero_addr:		DMA address of preallocated zero-filled memory
>   * @zero_virt:		Virtual address of preallocated zero-filled memory
>   * @zero_size:		Size (bytes) of preallocated zero-filled memory
> @@ -88,6 +90,9 @@ struct ipa {
>  	u32 mem_size;
>  	const struct ipa_mem *mem;
>  
> +	unsigned long imem_iova;
> +	size_t imem_size;
> +
>  	dma_addr_t zero_addr;
>  	void *zero_virt;
>  	size_t zero_size;
> diff --git a/drivers/net/ipa/ipa_data-sc7180.c b/drivers/net/ipa/ipa_data-sc7180.c
> index f97e7e4e61c1..e9007d151c68 100644
> --- a/drivers/net/ipa/ipa_data-sc7180.c
> +++ b/drivers/net/ipa/ipa_data-sc7180.c
> @@ -299,6 +299,8 @@ static const struct ipa_mem ipa_mem_local_data[] = {
>  static struct ipa_mem_data ipa_mem_data = {
>  	.local_count	= ARRAY_SIZE(ipa_mem_local_data),
>  	.local		= ipa_mem_local_data,
> +	.imem_addr	= 0x146a8000,
> +	.imem_size	= 0x00002000,
>  };
>  
>  /* Configuration data for the SC7180 SoC. */
> diff --git a/drivers/net/ipa/ipa_data-sdm845.c b/drivers/net/ipa/ipa_data-sdm845.c
> index c55507e94559..c0e207085550 100644
> --- a/drivers/net/ipa/ipa_data-sdm845.c
> +++ b/drivers/net/ipa/ipa_data-sdm845.c
> @@ -321,6 +321,8 @@ static const struct ipa_mem ipa_mem_local_data[] = {
>  static struct ipa_mem_data ipa_mem_data = {
>  	.local_count	= ARRAY_SIZE(ipa_mem_local_data),
>  	.local		= ipa_mem_local_data,
> +	.imem_addr	= 0x146bd000,
> +	.imem_size	= 0x00002000,
>  };
>  
>  /* Configuration data for the SDM845 SoC. */
> diff --git a/drivers/net/ipa/ipa_data.h b/drivers/net/ipa/ipa_data.h
> index 51d8e5a6f23a..69957af56ccd 100644
> --- a/drivers/net/ipa/ipa_data.h
> +++ b/drivers/net/ipa/ipa_data.h
> @@ -245,13 +245,17 @@ struct ipa_resource_data {
>  };
>  
>  /**
> - * struct ipa_mem - IPA-local memory region description
> + * struct ipa_mem - description of IPA memory regions
>   * @local_count:	number of regions defined in the local[] array
>   * @local:		array of IPA-local memory region descriptors
> + * @imem_addr:		physical address of IPA region within IMEM
> + * @imem_size:		size in bytes of IPA IMEM region
>   */
>  struct ipa_mem_data {
>  	u32 local_count;
>  	const struct ipa_mem *local;
> +	u32 imem_addr;
> +	u32 imem_size;
>  };
>  
>  /**
> diff --git a/drivers/net/ipa/ipa_mem.c b/drivers/net/ipa/ipa_mem.c
> index fb4de2a12796..3c0916597fe1 100644
> --- a/drivers/net/ipa/ipa_mem.c
> +++ b/drivers/net/ipa/ipa_mem.c
> @@ -8,6 +8,7 @@
>  #include <linux/bitfield.h>
>  #include <linux/bug.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/iommu.h>
>  #include <linux/io.h>
>  
>  #include "ipa.h"
> @@ -266,6 +267,79 @@ int ipa_mem_zero_modem(struct ipa *ipa)
>  	return 0;
>  }
>  
> +/**
> + * ipa_imem_init() - Initialize IMEM memory used by the IPA
> + * @ipa:	IPA pointer
> + * @addr:	Physical address of the IPA region in IMEM
> + * @size:	Size (bytes) of the IPA region in IMEM
> + *
> + * IMEM is a block of shared memory separate from system DRAM, and
> + * a portion of this memory is available for the IPA to use.  The
> + * modem accesses this memory directly, but the IPA accesses it
> + * via the IOMMU, using the AP's credentials.
> + *
> + * If this region exists (size > 0) we map it for read/write access
> + * through the IOMMU using the IPA device.
> + *
> + * Note: @addr and @size are not guaranteed to be page-aligned.
> + */
> +static int ipa_imem_init(struct ipa *ipa, unsigned long addr, size_t size)
> +{
> +	struct device *dev = &ipa->pdev->dev;
> +	struct iommu_domain *domain;
> +	unsigned long iova;
> +	phys_addr_t phys;
> +	int ret;
> +
> +	if (!size)
> +		return 0;	/* IMEM memory not used */
> +
> +	domain = iommu_get_domain_for_dev(dev);
> +	if (!domain) {
> +		dev_err(dev, "no IOMMU domain found for IMEM\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Align the address down and the size up to page boundaries */
> +	phys = addr & PAGE_MASK;
> +	size = PAGE_ALIGN(size + addr - phys);
> +	iova = phys;	/* We just want a direct mapping */
> +
> +	ret = iommu_map(domain, iova, phys, size, IOMMU_READ | IOMMU_WRITE);
> +	if (ret)
> +		return ret;
> +
> +	ipa->imem_iova = iova;
> +	ipa->imem_size = size;
> +
> +	return 0;
> +}
> +
> +static void ipa_imem_exit(struct ipa *ipa)
> +{
> +	struct iommu_domain *domain;
> +	struct device *dev;
> +
> +	if (!ipa->imem_size)
> +		return;
> +
> +	dev = &ipa->pdev->dev;
> +	domain = iommu_get_domain_for_dev(dev);
> +	if (domain) {
> +		size_t size;
> +
> +		size = iommu_unmap(domain, ipa->imem_iova, ipa->imem_size);
> +		if (size != ipa->imem_size)
> +			dev_warn(dev, "unmapped %zu IMEM bytes, expected %lu\n",
> +				 size, ipa->imem_size);
> +	} else {
> +		dev_err(dev, "couldn't get IPA IOMMU domain for IMEM\n");
> +	}
> +
> +	ipa->imem_size = 0;
> +	ipa->imem_iova = 0;
> +}
> +
>  /* Perform memory region-related initialization */
>  int ipa_mem_init(struct ipa *ipa, const struct ipa_mem_data *mem_data)
>  {
> @@ -305,11 +379,21 @@ int ipa_mem_init(struct ipa *ipa, const struct ipa_mem_data *mem_data)
>  	/* The ipa->mem[] array is indexed by enum ipa_mem_id values */
>  	ipa->mem = mem_data->local;
>  
> +	ret = ipa_imem_init(ipa, mem_data->imem_addr, mem_data->imem_size);
> +	if (ret)
> +		goto err_unmap;
> +
>  	return 0;
> +
> +err_unmap:
> +	memunmap(ipa->mem_virt);
> +
> +	return ret;
>  }
>  
>  /* Inverse of ipa_mem_init() */
>  void ipa_mem_exit(struct ipa *ipa)
>  {
> +	ipa_imem_exit(ipa);
>  	memunmap(ipa->mem_virt);
>  }
> -- 
> 2.20.1
> 
