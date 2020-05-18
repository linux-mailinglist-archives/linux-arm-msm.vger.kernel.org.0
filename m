Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA87C1D7B63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 16:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbgEROit (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 10:38:49 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:43264 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726918AbgEROiq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 10:38:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589812724; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=3jVQXLzS5PJPwz3uBBdwOaWCIbfx2OWYegKT20Bvp3w=; b=aTCc9QLpZMczBI/96R4flviI4po9D+uT2ytcrCEjYjD0Vjbv7DYsSZmqxSYGFlVMv0bRDe+R
 ZjGj1SI6VZRJanE292S/Pju5Ose415HmO51oIOOHBMZFAQWyjFE+rOG1LWQMVk8OaAPlOt/q
 0b7ZEys/NnmD6SHfMr+/K7o+KaY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec29df4.7f257815dca8-smtp-out-n01;
 Mon, 18 May 2020 14:38:44 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E2A79C432C2; Mon, 18 May 2020 14:38:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 59E58C433F2;
        Mon, 18 May 2020 14:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 59E58C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 18 May 2020 08:38:40 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Brian Masney <masneyb@onstation.org>,
        Konrad Dybcio <konradybcio@gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/a4xx: add adreno a405 support
Message-ID: <20200518143840.GA3915@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Shawn Guo <shawn.guo@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Brian Masney <masneyb@onstation.org>,
        Konrad Dybcio <konradybcio@gmail.com>
References: <20200509123846.27932-1-shawn.guo@linaro.org>
 <20200509123846.27932-2-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200509123846.27932-2-shawn.guo@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, May 09, 2020 at 08:38:45PM +0800, Shawn Guo wrote:
> It adds support for adreno a405 found on MSM8939.  The adreno_is_a430()
> check in adreno_submit() needs an extension to cover a405.  The
> downstream driver suggests it should cover the whole a4xx generation.
> That's why it gets changed to adreno_is_a4xx(), while a420 is not
> tested though.

This looks good to me and if it boots then that's the best test of all.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c      | 29 +++++++++++++---------
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 11 ++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 ++++
>  4 files changed, 34 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> index 253d8d85daad..70de59751188 100644
> --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> @@ -66,19 +66,22 @@ static void a4xx_enable_hwcg(struct msm_gpu *gpu)
>  		}
>  	}
>  
> -	for (i = 0; i < 4; i++) {
> -		gpu_write(gpu, REG_A4XX_RBBM_CLOCK_CTL_MARB_CCU(i),
> -				0x00000922);
> -	}
> +	/* No CCU for A405 */
> +	if (!adreno_is_a405(adreno_gpu)) {
> +		for (i = 0; i < 4; i++) {
> +			gpu_write(gpu, REG_A4XX_RBBM_CLOCK_CTL_MARB_CCU(i),
> +					0x00000922);
> +		}
>  
> -	for (i = 0; i < 4; i++) {
> -		gpu_write(gpu, REG_A4XX_RBBM_CLOCK_HYST_RB_MARB_CCU(i),
> -				0x00000000);
> -	}
> +		for (i = 0; i < 4; i++) {
> +			gpu_write(gpu, REG_A4XX_RBBM_CLOCK_HYST_RB_MARB_CCU(i),
> +					0x00000000);
> +		}
>  
> -	for (i = 0; i < 4; i++) {
> -		gpu_write(gpu, REG_A4XX_RBBM_CLOCK_DELAY_RB_MARB_CCU_L1(i),
> -				0x00000001);
> +		for (i = 0; i < 4; i++) {
> +			gpu_write(gpu, REG_A4XX_RBBM_CLOCK_DELAY_RB_MARB_CCU_L1(i),
> +					0x00000001);
> +		}
>  	}
>  
>  	gpu_write(gpu, REG_A4XX_RBBM_CLOCK_MODE_GPC, 0x02222222);
> @@ -137,7 +140,9 @@ static int a4xx_hw_init(struct msm_gpu *gpu)
>  	uint32_t *ptr, len;
>  	int i, ret;
>  
> -	if (adreno_is_a420(adreno_gpu)) {
> +	if (adreno_is_a405(adreno_gpu)) {
> +		gpu_write(gpu, REG_A4XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x00000003);
> +	} else if (adreno_is_a420(adreno_gpu)) {
>  		gpu_write(gpu, REG_A4XX_VBIF_ABIT_SORT, 0x0001001F);
>  		gpu_write(gpu, REG_A4XX_VBIF_ABIT_SORT_CONF, 0x000000A4);
>  		gpu_write(gpu, REG_A4XX_VBIF_GATE_OFF_WRREQ_EN, 0x00000001);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index cb3a6e597d76..b69757383965 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -92,6 +92,17 @@ static const struct adreno_info gpulist[] = {
>  		.gmem  = SZ_1M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.init  = a3xx_gpu_init,
> +	}, {
> +		.rev   = ADRENO_REV(4, 0, 5, ANY_ID),
> +		.revn  = 405,
> +		.name  = "A405",
> +		.fw = {
> +			[ADRENO_FW_PM4] = "a420_pm4.fw",
> +			[ADRENO_FW_PFP] = "a420_pfp.fw",
> +		},
> +		.gmem  = SZ_256K,
> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.init  = a4xx_gpu_init,
>  	}, {
>  		.rev   = ADRENO_REV(4, 2, 0, ANY_ID),
>  		.revn  = 420,
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 1d5c43c22269..3ddbf507941c 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -459,7 +459,7 @@ void adreno_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
>  				break;
>  			/* fall-thru */
>  		case MSM_SUBMIT_CMD_BUF:
> -			OUT_PKT3(ring, adreno_is_a430(adreno_gpu) ?
> +			OUT_PKT3(ring, adreno_is_a4xx(adreno_gpu) ?
>  				CP_INDIRECT_BUFFER_PFE : CP_INDIRECT_BUFFER_PFD, 2);
>  			OUT_RING(ring, lower_32_bits(submit->cmd[i].iova));
>  			OUT_RING(ring, submit->cmd[i].size);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 9ff4e550e7bd..35f744834ea9 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -202,6 +202,11 @@ static inline bool adreno_is_a4xx(struct adreno_gpu *gpu)
>  	return (gpu->revn >= 400) && (gpu->revn < 500);
>  }
>  
> +static inline int adreno_is_a405(struct adreno_gpu *gpu)
> +{
> +	return gpu->revn == 405;
> +}
> +
>  static inline int adreno_is_a420(struct adreno_gpu *gpu)
>  {
>  	return gpu->revn == 420;
> -- 
> 2.17.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
