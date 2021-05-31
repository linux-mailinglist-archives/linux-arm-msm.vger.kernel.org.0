Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06E0539635E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 17:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbhEaPOr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 11:14:47 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:37782 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232395AbhEaPMa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 11:12:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622473851; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=RDPiykZKxUArsqfr+HyfBzTx4txXnTuaKCrbS8HsMz0=; b=Lwai6ijLsi/qV95k3amMBb3hUpogk6/dSEp4ydo49DGaizbHgh0q+NGhT+xlKHNVY1da0K1m
 eJ/uhu3FbCnDt2i6+adeKl6MkaovCy/ERApGF2d+HqLtGKUPfrbw/MUWUN4JHGJcpMGCaIly
 /72BwR5RHA3YZLCUcGygCzySzoQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60b4fc64265e7370f7114859 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 31 May 2021 15:10:28
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C0BDEC43151; Mon, 31 May 2021 15:10:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.105] (unknown [117.210.184.158])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6DA67C433D3;
        Mon, 31 May 2021 15:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6DA67C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH v2 8/8] drm/msm/a6xx: add a660 hwcg table
To:     Jonathan Marek <jonathan@marek.ca>, freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Shawn Guo <shawn.guo@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210513171431.18632-1-jonathan@marek.ca>
 <20210513171431.18632-9-jonathan@marek.ca>
From:   Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <9c87a69d-3af4-db3d-3481-7dc158d1b380@codeaurora.org>
Date:   Mon, 31 May 2021 20:40:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210513171431.18632-9-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/13/2021 10:44 PM, Jonathan Marek wrote:
> Add a660 hwcg table, ported over from downstream.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 53 ++++++++++++++++++++++
>   drivers/gpu/drm/msm/adreno/adreno_device.c |  1 +
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  2 +-
>   3 files changed, 55 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index ec66a24fc37e..2713f69e916d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -427,6 +427,59 @@ const struct adreno_reglist a650_hwcg[] = {
>   	{},
>   };
>   
> +const struct adreno_reglist a660_hwcg[] = {
> +	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
> +	{REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000F3CF},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111},
> +	{REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111},
> +	{REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111},
> +	{REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111},
> +	{REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777},
> +	{REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777},
> +	{REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777},
> +	{REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01002222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220},
> +	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040F00},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x25222022},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011},
> +	{REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222},
> +	{REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222},
> +	{REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x00222222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002},
> +	{REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004},
> +	{REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_TEX_FCHE, 0x00000222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_TEX_FCHE, 0x00000111},
> +	{REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002},
> +	{REG_A6XX_RBBM_ISDB_CNT, 0x00000182},
> +	{REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000},
> +	{REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
> +	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
> +	{},
> +};
> +
>   static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>   {
>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index e4db0683d381..6dad8015c9a1 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -299,6 +299,7 @@ static const struct adreno_info gpulist[] = {
>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>   		.init = a6xx_gpu_init,
>   		.zapfw = "a660_zap.mdt",
> +		.hwcg = a660_hwcg,
>   	},
>   };
>   
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 63c050919d85..e6b11e6ec82d 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -55,7 +55,7 @@ struct adreno_reglist {
>   	u32 value;
>   };
>   
> -extern const struct adreno_reglist a630_hwcg[], a640_hwcg[], a650_hwcg[];
> +extern const struct adreno_reglist a630_hwcg[], a640_hwcg[], a650_hwcg[], a660_hwcg[];
>   
>   struct adreno_info {
>   	struct adreno_rev rev;
> 
squash with previous one?

-Akhil
