Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD7932EC99B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jan 2021 05:51:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbhAGEvQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jan 2021 23:51:16 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:20713 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726705AbhAGEvQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jan 2021 23:51:16 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1609995051; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=/idK/qn/qYwK24YxIeFblcenK6sv0rtJO1umkF2y1L0=;
 b=riUeGWZC5LG1kx/v5tS7vc/BIfLgKldeaKWBOm+FHaeIf9VPgBeLG4/jWUg85Wh88OC6Zv6h
 nisz2YSakgc3tPEhq+UwtC1z2oc62e+7iJ5lxNu6OVjCc2jB6E0EBdXjCNIDSkyj67Wv4+Tu
 mTP+6q8sZWp04F87+SISwUuKh5w=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5ff69308661021aa28e06231 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 07 Jan 2021 04:50:16
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7FD9DC43468; Thu,  7 Jan 2021 04:50:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 12866C433CA;
        Thu,  7 Jan 2021 04:50:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 07 Jan 2021 10:20:14 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dave Airlie <airlied@redhat.com>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Only enable A6xx LLCC code on A6xx
In-Reply-To: <20210104193044.80591-1-konrad.dybcio@somainline.org>
References: <20210104193044.80591-1-konrad.dybcio@somainline.org>
Message-ID: <8847b190c9d03afd731881689d9b28d3@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-01-05 01:00, Konrad Dybcio wrote:
> Using this code on A5xx (and probably older too) causes a
> smmu bug.
> 
> Fixes: 474dadb8b0d5 ("drm/msm/a6xx: Add support for using system 
> cache(LLC)")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Tested-by: AngeloGioacchino Del Regno 
> <angelogioacchino.delregno@somainline.org>
> ---

Reviewed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 21 ++++++++++++---------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 +++++
>  2 files changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 6cf9975e951e..f09175698827 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -191,8 +191,6 @@ adreno_iommu_create_address_space(struct msm_gpu 
> *gpu,
>  		struct platform_device *pdev)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> -	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> -	struct io_pgtable_domain_attr pgtbl_cfg;
>  	struct iommu_domain *iommu;
>  	struct msm_mmu *mmu;
>  	struct msm_gem_address_space *aspace;
> @@ -202,13 +200,18 @@ adreno_iommu_create_address_space(struct msm_gpu 
> *gpu,
>  	if (!iommu)
>  		return NULL;
> 
> -	/*
> -	 * This allows GPU to set the bus attributes required to use system
> -	 * cache on behalf of the iommu page table walker.
> -	 */
> -	if (!IS_ERR(a6xx_gpu->htw_llc_slice)) {
> -		pgtbl_cfg.quirks = IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
> -		iommu_domain_set_attr(iommu, DOMAIN_ATTR_IO_PGTABLE_CFG, 
> &pgtbl_cfg);
> +
> +	if (adreno_is_a6xx(adreno_gpu)) {
> +		struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +		struct io_pgtable_domain_attr pgtbl_cfg;
> +		/*
> +		* This allows GPU to set the bus attributes required to use system
> +		* cache on behalf of the iommu page table walker.
> +		*/
> +		if (!IS_ERR(a6xx_gpu->htw_llc_slice)) {
> +			pgtbl_cfg.quirks = IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
> +			iommu_domain_set_attr(iommu, DOMAIN_ATTR_IO_PGTABLE_CFG, 
> &pgtbl_cfg);
> +		}
>  	}
> 
>  	mmu = msm_iommu_new(&pdev->dev, iommu);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 4574d85c5680..08421fa54a50 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -226,6 +226,11 @@ static inline int adreno_is_a540(struct adreno_gpu 
> *gpu)
>  	return gpu->revn == 540;
>  }
> 
> +static inline bool adreno_is_a6xx(struct adreno_gpu *gpu)
> +{
> +	return ((gpu->revn < 700 && gpu->revn > 599));
> +}
> +
>  static inline int adreno_is_a618(struct adreno_gpu *gpu)
>  {
>         return gpu->revn == 618;

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
