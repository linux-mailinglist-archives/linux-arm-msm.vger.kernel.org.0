Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 856F31E274A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2020 18:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388591AbgEZQlE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 12:41:04 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:36163 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729286AbgEZQlD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 12:41:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590511262; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=bxNy9OVVcbUGXRZMeRrO1nMkFefTO00pUgSxEDv45l8=; b=akkKBc5PPLF9QcXbHZ1BxG0xBhGHrAG3DkCHHCcCt1anPlauNvia0q11vTs8Nymaa6oKPtBs
 UlpIm/iUHkJSEa9BIyNJJ0rMsnyJoYPnIC+r7vkf7i8bQERUbngrQi+79QASit7+x5+qyElr
 yCPYkLUbInMpQaXpTtIwFVw+0B4=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5ecd469db4f0a9ae220deb45 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 May 2020 16:41:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9DB0FC4339C; Tue, 26 May 2020 16:41:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C44A4C433C9;
        Tue, 26 May 2020 16:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C44A4C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Tue, 26 May 2020 10:40:57 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/a6xx: set ubwc config for A640 and A650
Message-ID: <20200526164057.GC20960@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Jonathan Marek <jonathan@marek.ca>,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200526032514.22198-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526032514.22198-1-jonathan@marek.ca>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 25, 2020 at 11:25:13PM -0400, Jonathan Marek wrote:
> This is required for A640 and A650 to be able to share UBWC-compressed
> images with other HW such as display, which expect this configuration.

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 38 ++++++++++++++++++++++-----
>  1 file changed, 32 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 6f335ae179c8..aa004a261277 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -289,6 +289,37 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>  	gpu_write(gpu, REG_A6XX_RBBM_CLOCK_CNTL, state ? 0x8aa8aa02 : 0);
>  }
>  
> +static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	u32 lower_bit = 2;
> +	u32 amsbc = 0;
> +	u32 rgb565_predicator = 0;
> +	u32 uavflagprd_inv = 0;
> +

This hardware design has the amazing ability to make me sad every time I see it.

> +	/* a618 is using the hw default values */
> +	if (adreno_is_a618(adreno_gpu))
> +		return;
> +
I've been a recent convert to the cult of <linux/bitfields.h> and FIELD_PREP()
could help, maybe?

if (adreno_is_a640(adreno_gpu)) {
	rb_ncmode = FIELD_PREP(REG_A6XX_RB_NC_MODE_CNTL_AMSBC, 1);
	rb_ncmode |= FIELD_PREP(REG_A6XX_RB_NC_MODE_CNTL_HBB, 2);

	tpl1_ncmode  = FIELD_PREP(REG_A6XX_TPL1_NC_MODE_HBB, 2);

	sp_ncmode  = FIELD_PREP(REG_A6XX_TPL1_NC_MODE_HBB, 2);

	uchemode  = FIELD_PREP(REG_A6XX_UCHE_MODE_CNTL_HBB, 2);
} else if adreno_is_a650(adreno_gpu)) {
	rb_ncmode = FIELD_PREP(REG_A6XX_RB_NC_MODE_CNTL_AMSBC, 1);
	rb_ncmode |= FIELD_PREP(REG_A6XX_RB_NC_MODE_CNTL_HBB, 3);
	rb_ncmode |= FIELD_PREP(REG_A6XX_RB_NC_MODE_CNTL_RGB565, 1);

	tpl1_ncmode  = FIELD_PREP(REG_A6XX_TPL1_NC_MODE_HBB, 3);

	sp_ncmode  = FIELD_PREP(REG_A6XX_TPL1_NC_MODE_HBB, 3);
	sp_ncmode  |= FIELD_PREP(REG_A6XX_TPL1_NC_MODE_UAVFLAGPRD_INV, 2);

	uchemode  = FIELD_PREP(REG_A6XX_UCHE_MODE_CNTL_HBB, 2);
}

I'm not sure if that is any clearer or not. Perhaps this is a problem for the
next person to add a new target. Regardless the code is programming the
hardware correctly so...

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>


> +	if (adreno_is_a640(adreno_gpu))
> +		amsbc = 1;
> +
> +	if (adreno_is_a650(adreno_gpu)) {
> +		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
> +		lower_bit = 3;
> +		amsbc = 1;
> +		rgb565_predicator = 1;
> +		uavflagprd_inv = 2;
> +	}
> +
> +	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
> +		rgb565_predicator << 11 | amsbc << 4 | lower_bit << 1);
> +	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, lower_bit << 1);
> +	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
> +		uavflagprd_inv >> 4 | lower_bit << 1);
> +	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, lower_bit << 21);
> +}
> +
>  static int a6xx_cp_init(struct msm_gpu *gpu)
>  {
>  	struct msm_ringbuffer *ring = gpu->rb[0];
> @@ -478,12 +509,7 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>  	/* Select CP0 to always count cycles */
>  	gpu_write(gpu, REG_A6XX_CP_PERFCTR_CP_SEL_0, PERF_CP_ALWAYS_COUNT);
>  
> -	if (adreno_is_a630(adreno_gpu)) {
> -		gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL, 2 << 1);
> -		gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, 2 << 1);
> -		gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, 2 << 1);
> -		gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, 2 << 21);
> -	}
> +	a6xx_set_ubwc_config(gpu);
>  
>  	/* Enable fault detection */
>  	gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL,
> -- 
> 2.26.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
