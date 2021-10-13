Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCBBD42CE18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 00:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbhJMWc7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 18:32:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231623AbhJMWcd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 18:32:33 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2F21C06176A
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 15:30:28 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id 5so1481651iov.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 15:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LsEczdPkEsnbJ1dnB/+4ts+9TUj4vFxU0DaILYx11QI=;
        b=eM2Mpb/UF0KX8yu9A83o+DXc902Xkv2b3RhErTUeGyc1jd0nzOgIaIWvFagx+iBO42
         2TvRYJGWRQ0tDQGb+jgIsfnOSe1Ytnb1g1zcHmOPqoTbHnI3D91kizets39xVOA/5jWl
         ptPlZ18Xlk5MH4qt3owMdjb9qnCQwDKWHWtMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LsEczdPkEsnbJ1dnB/+4ts+9TUj4vFxU0DaILYx11QI=;
        b=Hd5g7v+Co0xcLfkUtdXlbrP51XGOGqHLNzKSQgkOmxAOCsqtC9afrXlks9WiGJGfRs
         ORsQRoAaflwcpVBut48GkStN3eqlGN2Q9mAS2KoTyyIQcoZ1OoLrhn4DWZHpma2yYZO2
         WWKy5ziBNFMt7fb49CZaVOarNzEo3Y6b8GkzlRI8cCK4Kyr55DdEYEU+qdqFU9kJoxfR
         AXrpHBVvVvCl4lX+mBH0DYneyDD7C0YfmCNdmXnu1Ndk8jyacw2kJZ/9OlEFZ8Rg2+Q0
         wXMfStUqqZYBWxNQUfXzJzZMb2VGF216e9Ev1sI+FURl4gs5Y7mTffhUNcSYuAhmQsQ+
         5u+w==
X-Gm-Message-State: AOAM530Fmvv0EbonGjpScAMzPRHQX+v1cwIpdwzEP3d6ERGJ++UggRpD
        aL5Qcp1s0btQ+Br4h/oHWsLn2A==
X-Google-Smtp-Source: ABdhPJxzTBf3ZiQDuYsNZ4nBXs4vS7MeBMn4iHP5+Cx1gQ1hivM/4Fp2gUJkwuv09mJ4AwLvM/Ov6A==
X-Received: by 2002:a05:6602:29c2:: with SMTP id z2mr1566167ioq.73.1634164228273;
        Wed, 13 Oct 2021 15:30:28 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id a4sm353806ild.52.2021.10.13.15.30.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Oct 2021 15:30:27 -0700 (PDT)
Subject: Re: [RFC PATCH 12/17] net: ipa: Add support for IPA v2.x memory map
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, elder@kernel.org
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
References: <20210920030811.57273-1-sireeshkodali1@gmail.com>
 <20210920030811.57273-13-sireeshkodali1@gmail.com>
From:   Alex Elder <elder@ieee.org>
Message-ID: <566b43c9-2893-09ac-1f27-513f0a6d767e@ieee.org>
Date:   Wed, 13 Oct 2021 17:30:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210920030811.57273-13-sireeshkodali1@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/19/21 10:08 PM, Sireesh Kodali wrote:
> IPA v2.6L has an extra region to handle compression/decompression
> acceleration. This region is used by some modems during modem init.

So it has to be initialized?  (I guess so.)

The memory size register apparently doesn't express things in
units of 8 bytes either.

					-Alex

> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
> ---
>   drivers/net/ipa/ipa_mem.c | 36 ++++++++++++++++++++++++++++++------
>   drivers/net/ipa/ipa_mem.h |  5 ++++-
>   2 files changed, 34 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/ipa/ipa_mem.c b/drivers/net/ipa/ipa_mem.c
> index 8acc88070a6f..bfcdc7e08de2 100644
> --- a/drivers/net/ipa/ipa_mem.c
> +++ b/drivers/net/ipa/ipa_mem.c
> @@ -84,7 +84,7 @@ int ipa_mem_setup(struct ipa *ipa)
>   	/* Get a transaction to define the header memory region and to zero
>   	 * the processing context and modem memory regions.
>   	 */
> -	trans = ipa_cmd_trans_alloc(ipa, 4);
> +	trans = ipa_cmd_trans_alloc(ipa, 5);
>   	if (!trans) {
>   		dev_err(&ipa->pdev->dev, "no transaction for memory setup\n");
>   		return -EBUSY;
> @@ -107,8 +107,14 @@ int ipa_mem_setup(struct ipa *ipa)
>   	ipa_mem_zero_region_add(trans, IPA_MEM_AP_PROC_CTX);
>   	ipa_mem_zero_region_add(trans, IPA_MEM_MODEM);
>   
> +	ipa_mem_zero_region_add(trans, IPA_MEM_ZIP);
> +
>   	ipa_trans_commit_wait(trans);
>   
> +	/* On IPA version <=2.6L (except 2.5) there is no PROC_CTX.  */
> +	if (ipa->version != IPA_VERSION_2_5 && ipa->version <= IPA_VERSION_2_6L)
> +		return 0;
> +
>   	/* Tell the hardware where the processing context area is located */
>   	mem = ipa_mem_find(ipa, IPA_MEM_MODEM_PROC_CTX);
>   	offset = ipa->mem_offset + mem->offset;
> @@ -147,6 +153,11 @@ static bool ipa_mem_id_valid(struct ipa *ipa, enum ipa_mem_id mem_id)
>   	case IPA_MEM_END_MARKER:	/* pseudo region */
>   		break;
>   
> +	case IPA_MEM_ZIP:
> +		if (version == IPA_VERSION_2_6L)
> +			return true;
> +		break;
> +
>   	case IPA_MEM_STATS_TETHERING:
>   	case IPA_MEM_STATS_DROP:
>   		if (version < IPA_VERSION_4_0)
> @@ -319,10 +330,15 @@ int ipa_mem_config(struct ipa *ipa)
>   	/* Check the advertised location and size of the shared memory area */
>   	val = ioread32(ipa->reg_virt + ipa_reg_shared_mem_size_offset(ipa->version));
>   
> -	/* The fields in the register are in 8 byte units */
> -	ipa->mem_offset = 8 * u32_get_bits(val, SHARED_MEM_BADDR_FMASK);
> -	/* Make sure the end is within the region's mapped space */
> -	mem_size = 8 * u32_get_bits(val, SHARED_MEM_SIZE_FMASK);
> +	if (IPA_VERSION_RANGE(ipa->version, 2_0, 2_6L)) {
> +		/* The fields in the register are in 8 byte units */
> +		ipa->mem_offset = 8 * u32_get_bits(val, SHARED_MEM_BADDR_FMASK);
> +		/* Make sure the end is within the region's mapped space */
> +		mem_size = 8 * u32_get_bits(val, SHARED_MEM_SIZE_FMASK);
> +	} else {
> +		ipa->mem_offset = u32_get_bits(val, SHARED_MEM_BADDR_FMASK);
> +		mem_size = u32_get_bits(val, SHARED_MEM_SIZE_FMASK);
> +	}
>   
>   	/* If the sizes don't match, issue a warning */
>   	if (ipa->mem_offset + mem_size < ipa->mem_size) {
> @@ -564,6 +580,10 @@ static int ipa_smem_init(struct ipa *ipa, u32 item, size_t size)
>   		return -EINVAL;
>   	}
>   
> +	/* IPA v2.6L does not use IOMMU */
> +	if (ipa->version <= IPA_VERSION_2_6L)
> +		return 0;
> +
>   	domain = iommu_get_domain_for_dev(dev);
>   	if (!domain) {
>   		dev_err(dev, "no IOMMU domain found for SMEM\n");
> @@ -591,6 +611,9 @@ static void ipa_smem_exit(struct ipa *ipa)
>   	struct device *dev = &ipa->pdev->dev;
>   	struct iommu_domain *domain;
>   
> +	if (ipa->version <= IPA_VERSION_2_6L)
> +		return;
> +
>   	domain = iommu_get_domain_for_dev(dev);
>   	if (domain) {
>   		size_t size;
> @@ -622,7 +645,8 @@ int ipa_mem_init(struct ipa *ipa, const struct ipa_mem_data *mem_data)
>   	ipa->mem_count = mem_data->local_count;
>   	ipa->mem = mem_data->local;
>   
> -	ret = dma_set_mask_and_coherent(&ipa->pdev->dev, DMA_BIT_MASK(64));
> +	ret = dma_set_mask_and_coherent(&ipa->pdev->dev, IPA_IS_64BIT(ipa->version) ?
> +					DMA_BIT_MASK(64) : DMA_BIT_MASK(32));
>   	if (ret) {
>   		dev_err(dev, "error %d setting DMA mask\n", ret);
>   		return ret;
> diff --git a/drivers/net/ipa/ipa_mem.h b/drivers/net/ipa/ipa_mem.h
> index 570bfdd99bff..be91cb38b6a8 100644
> --- a/drivers/net/ipa/ipa_mem.h
> +++ b/drivers/net/ipa/ipa_mem.h
> @@ -47,8 +47,10 @@ enum ipa_mem_id {
>   	IPA_MEM_UC_INFO,		/* 0 canaries */
>   	IPA_MEM_V4_FILTER_HASHED,	/* 2 canaries */
>   	IPA_MEM_V4_FILTER,		/* 2 canaries */
> +	IPA_MEM_V4_FILTER_AP,		/* 2 canaries (IPA v2.0) */
>   	IPA_MEM_V6_FILTER_HASHED,	/* 2 canaries */
>   	IPA_MEM_V6_FILTER,		/* 2 canaries */
> +	IPA_MEM_V6_FILTER_AP,		/* 0 canaries (IPA v2.0) */
>   	IPA_MEM_V4_ROUTE_HASHED,	/* 2 canaries */
>   	IPA_MEM_V4_ROUTE,		/* 2 canaries */
>   	IPA_MEM_V6_ROUTE_HASHED,	/* 2 canaries */
> @@ -57,7 +59,8 @@ enum ipa_mem_id {
>   	IPA_MEM_AP_HEADER,		/* 0 canaries, optional */
>   	IPA_MEM_MODEM_PROC_CTX,		/* 2 canaries */
>   	IPA_MEM_AP_PROC_CTX,		/* 0 canaries */
> -	IPA_MEM_MODEM,			/* 0/2 canaries */
> +	IPA_MEM_ZIP,			/* 1 canary (IPA v2.6L) */
> +	IPA_MEM_MODEM,			/* 0-2 canaries */
>   	IPA_MEM_UC_EVENT_RING,		/* 1 canary, optional */
>   	IPA_MEM_PDN_CONFIG,		/* 0/2 canaries (IPA v4.0+) */
>   	IPA_MEM_STATS_QUOTA_MODEM,	/* 2/4 canaries (IPA v4.0+) */
> 

