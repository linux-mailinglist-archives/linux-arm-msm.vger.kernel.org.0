Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F33F2E9F5F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 22:13:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbhADVMT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 16:12:19 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:28515 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbhADVMS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 16:12:18 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1609794712; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=SxYhreFDurE32zowaC/ojf+ypHTOFxwG+tjqvQX4SIU=; b=l069FL2cTnC6/QTvzxj7Suj9Ohtk97LU/DxD1KMRfCnXEE/b/2Gdtqw34OZWbbJrUJO2zbNm
 0YfHLX9NRY+KlOpfZtw7REAmsxOHwK/N1lYtX1egjfQuHWgPuFHD9V4qFLeYijNe5uP2fWCq
 a7syEFe8oWgtKmR1vIvJ28mio/s=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5ff38478584481b01bdeaeb6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 04 Jan 2021 21:11:20
 GMT
Sender: jcrouse=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7238DC433C6; Mon,  4 Jan 2021 21:11:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6FBF7C433C6;
        Mon,  4 Jan 2021 21:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6FBF7C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 4 Jan 2021 14:11:13 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dave Airlie <airlied@redhat.com>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Only enable A6xx LLCC code on A6xx
Message-ID: <20210104211113.GA29638@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Konrad Dybcio <konrad.dybcio@somainline.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dave Airlie <airlied@redhat.com>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210104193044.80591-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210104193044.80591-1-konrad.dybcio@somainline.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 04, 2021 at 08:30:41PM +0100, Konrad Dybcio wrote:
> Using this code on A5xx (and probably older too) causes a
> smmu bug.
> 
> Fixes: 474dadb8b0d5 ("drm/msm/a6xx: Add support for using system cache(LLC)")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Yep, I can see how this would be not ideal.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 21 ++++++++++++---------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 +++++
>  2 files changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 6cf9975e951e..f09175698827 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -191,8 +191,6 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
>  		struct platform_device *pdev)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> -	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> -	struct io_pgtable_domain_attr pgtbl_cfg;
>  	struct iommu_domain *iommu;
>  	struct msm_mmu *mmu;
>  	struct msm_gem_address_space *aspace;
> @@ -202,13 +200,18 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
>  	if (!iommu)
>  		return NULL;
>  
> -	/*
> -	 * This allows GPU to set the bus attributes required to use system
> -	 * cache on behalf of the iommu page table walker.
> -	 */
> -	if (!IS_ERR(a6xx_gpu->htw_llc_slice)) {
> -		pgtbl_cfg.quirks = IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
> -		iommu_domain_set_attr(iommu, DOMAIN_ATTR_IO_PGTABLE_CFG, &pgtbl_cfg);
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
> +			iommu_domain_set_attr(iommu, DOMAIN_ATTR_IO_PGTABLE_CFG, &pgtbl_cfg);
> +		}
>  	}
>  
>  	mmu = msm_iommu_new(&pdev->dev, iommu);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 4574d85c5680..08421fa54a50 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -226,6 +226,11 @@ static inline int adreno_is_a540(struct adreno_gpu *gpu)
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
> -- 
> 2.29.2
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
