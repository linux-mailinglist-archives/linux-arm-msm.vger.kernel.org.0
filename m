Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EEE1BB86F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2019 17:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728553AbfIWPtZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Sep 2019 11:49:25 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:57710 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728182AbfIWPtZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Sep 2019 11:49:25 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4CEAB61544; Mon, 23 Sep 2019 15:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569253763;
        bh=WPSdv62fEtN3KiP4dV+Hd84eoX9dUmVeQiMlHspMA/A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cLhcevi4F2NQ8algQHK2AJWd09YBmONg+DCbIfqyzOiviyibn2LwhiG5B+I/3jp3B
         gYkSpxLSXSguhm/CshoZ26G2xhiGzyPTHbkC0tSsykNOdPn8tF3xOhTO+h6mYWx1ae
         241bXhHwGEiHeIaO8PY2zHROK8VsYkQtDVh9YVco=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 62D8961359;
        Mon, 23 Sep 2019 15:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569253758;
        bh=WPSdv62fEtN3KiP4dV+Hd84eoX9dUmVeQiMlHspMA/A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TLANb1/xiMOUCM87qs9k84sO4Pob36dp6SVXF7zRh18xr/g1mubyGITwZeCePsyEr
         D598wN5/0UnuIARhEbwMEMuQdVHUMurQ1ONrFPAMLgyn8fdhqaIjkJy092D/9Mmnlq
         olIHMswWv+VGjkSsVC2VVZOj/ULbQ74CVYL1n9s8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 62D8961359
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 23 Sep 2019 09:49:15 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     kholk11@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, marijns95@gmail.com,
        robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com,
        tglx@linutronix.de, jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 5/5] drm/msm/adreno: Add support for Adreno 510 GPU
Message-ID: <20190923154915.GB14636@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: kholk11@gmail.com, linux-arm-msm@vger.kernel.org,
        marijns95@gmail.com, robdclark@gmail.com, sean@poorly.run,
        airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        mark.rutland@arm.com, tglx@linutronix.de, jonathan@marek.ca,
        bjorn.andersson@linaro.org, georgi.djakov@linaro.org,
        gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20190921100439.64402-1-kholk11@gmail.com>
 <20190921100439.64402-6-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190921100439.64402-6-kholk11@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Sep 21, 2019 at 12:04:39PM +0200, kholk11@gmail.com wrote:
> From: "Angelo G. Del Regno" <kholk11@gmail.com>
> 
> The Adreno 510 GPU is a stripped version of the Adreno 5xx,
> found in low-end SoCs like 8x56 and 8x76, which has 256K of
> GMEM, with no GPMU nor ZAP.
> Also, since the Adreno 5xx part of this driver seems to be
> developed with high-end Adreno GPUs in mind, and since this
> is a lower end one, add a comment making clear which GPUs
> which support is not implemented yet is not using the GPMU
> related hw init code, so that future developers will not go
> crazy with that.
> 
> By the way, the lower end Adreno GPUs with no GPMU are:
> A505/A506/A510 (no ZAP firmware)
> A508/A509/A512 (with ZAP firmware)

Thanks, just a few comments.  It is good to see some of these lower tier
parts start to make their way upstream.

> Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 87 +++++++++++++++++++---
>  drivers/gpu/drm/msm/adreno/a5xx_power.c    |  7 ++
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 15 ++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 ++
>  4 files changed, 102 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index e9c55d1d6c04..c3814a65ba2d 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -353,6 +353,9 @@ static int a5xx_me_init(struct msm_gpu *gpu)
>  		 * 2D mode 3 draw
>  		 */
>  		OUT_RING(ring, 0x0000000B);
> +	} else if (adreno_is_a510(adreno_gpu)) {
> +		/* Workaround for token and syncs */
> +		OUT_RING(ring, 0x00000001);
>  	} else {
>  		/* No workarounds enabled */
>  		OUT_RING(ring, 0x00000000);
> @@ -502,6 +505,8 @@ static int a5xx_zap_shader_init(struct msm_gpu *gpu)
>  static int a5xx_hw_init(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	u32 meq_thresh, merciu_sz, roq_thresh_1, roq_thresh_2, eco_cntl;
> +	u32 cur_eco_cnt;
>  	int ret;
>  
>  	gpu_write(gpu, REG_A5XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x00000003);
> @@ -568,15 +573,31 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>  		0x00100000 + adreno_gpu->gmem - 1);
>  	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MAX_HI, 0x00000000);
>  
> -	gpu_write(gpu, REG_A5XX_CP_MEQ_THRESHOLDS, 0x40);
> -	if (adreno_is_a530(adreno_gpu))
> -		gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x40);
> +	/* Values for the majority of the models */
> +	meq_thresh = 0x40;
> +	merciu_sz = 0x40;
> +	roq_thresh_2 = 0x80000060;
> +	roq_thresh_1 = 0x40201B16;
> +	eco_cntl = (0x400 << 11 | 0x300 << 22);
> +
> +	/* model specific overrides */
> +	if (adreno_is_a510(adreno_gpu)) {
> +		meq_thresh = 0x20;
> +		merciu_sz = 0x20;
> +		roq_thresh_2 = 0x40000030;
> +		roq_thresh_1 = 0x20100D0A;
> +		eco_cntl = (0x200 << 11 | 0x200 << 22);
> +	}
> +
>  	if (adreno_is_a540(adreno_gpu))
> -		gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x400);
> -	gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_2, 0x80000060);
> -	gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_1, 0x40201B16);
> +		merciu_sz = 0x400;
> +
> +	gpu_write(gpu, REG_A5XX_CP_MEQ_THRESHOLDS, meq_thresh);
> +	gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, merciu_sz);
> +	gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_2, roq_thresh_2);
> +	gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_1, roq_thresh_1);
>  
> -	gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL, (0x400 << 11 | 0x300 << 22));
> +	gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL, eco_cntl);

Personally, I am just fine with doing the direct register writes inside of
target specific if/else blocks instead of declaring variables and trying to
support "common" code.

>  
>  	if (adreno_gpu->info->quirks & ADRENO_QUIRK_TWO_PASS_USE_WFI)
>  		gpu_rmw(gpu, REG_A5XX_PC_DBG_ECO_CNTL, 0, (1 << 8));
> @@ -589,6 +610,22 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>  	/* Enable ME/PFP split notification */
>  	gpu_write(gpu, REG_A5XX_RBBM_AHB_CNTL1, 0xA6FFFFFF);
>  
> +	/*
> +	 *  In A5x, CCU can send context_done event of a particular context to
> +	 *  UCHE which ultimately reaches CP even when there is valid
> +	 *  transaction of that context inside CCU. This can let CP to program
> +	 *  config registers, which will make the "valid transaction" inside
> +	 *  CCU to be interpreted differently. This can cause gpu fault. This
> +	 *  bug is fixed in latest A510 revision. To enable this bug fix -
> +	 *  bit[11] of RB_DBG_ECO_CNTL need to be set to 0, default is 1
> +	 *  (disable). For older A510 version this bit is unused.
> +	 */
> +	if (adreno_is_a510(adreno_gpu)) {
> +		cur_eco_cnt = gpu_read(gpu, REG_A5XX_RB_DBG_ECO_CNTL);
> +		cur_eco_cnt &= ~(1 << 11);
> +		gpu_write(gpu, REG_A5XX_RB_DBG_ECO_CNTL, cur_eco_cnt);

We have a gpu_rmw() function for this very purpose.

> +	}
> +
>  	/* Enable HWCG */
>  	a5xx_set_hwcg(gpu, true);
>  
> @@ -635,7 +672,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>  	/* UCHE */
>  	gpu_write(gpu, REG_A5XX_CP_PROTECT(16), ADRENO_PROTECT_RW(0xE80, 16));
>  
> -	if (adreno_is_a530(adreno_gpu))
> +	if (adreno_is_a530(adreno_gpu) || adreno_is_a510(adreno_gpu))
>  		gpu_write(gpu, REG_A5XX_CP_PROTECT(17),
>  			ADRENO_PROTECT_RW(0x10000, 0x8000));
>  
> @@ -679,7 +716,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>  
>  	a5xx_preempt_hw_init(gpu);
>  
> -	a5xx_gpmu_ucode_init(gpu);
> +	if (!adreno_is_a510(adreno_gpu))
> +		a5xx_gpmu_ucode_init(gpu);

This works for now, but if we start adding other targets without GPMU it could
get messier. If that happens, perhaps a flag or a quirk would be a better
identifier.

>  	ret = a5xx_ucode_init(gpu);
>  	if (ret)
> @@ -712,12 +750,18 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>  	}
>  
>  	/*
> -	 * Try to load a zap shader into the secure world. If successful
> +	 * If the chip that we are using does support loading one, then
> +	 * try to load a zap shader into the secure world. If successful
>  	 * we can use the CP to switch out of secure mode. If not then we
>  	 * have no resource but to try to switch ourselves out manually. If we
>  	 * guessed wrong then access to the RBBM_SECVID_TRUST_CNTL register will
>  	 * be blocked and a permissions violation will soon follow.
>  	 */
> +	if (adreno_is_a510(adreno_gpu)) {
> +		gpu_write(gpu, REG_A5XX_RBBM_SECVID_TRUST_CNTL, 0x0);
> +		goto skip_zap;
> +	}
> +
>  	ret = a5xx_zap_shader_init(gpu);
>  	if (!ret) {
>  		OUT_PKT7(gpu->rb[0], CP_SET_SECURE_MODE, 1);
> @@ -733,6 +777,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>  		gpu_write(gpu, REG_A5XX_RBBM_SECVID_TRUST_CNTL, 0x0);
>  	}
>  
> +skip_zap:
>  	/* Last step - yield the ringbuffer */
>  	a5xx_preempt_start(gpu);
>  
> @@ -1066,6 +1111,7 @@ static void a5xx_dump(struct msm_gpu *gpu)
>  
>  static int a5xx_pm_resume(struct msm_gpu *gpu)
>  {
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	int ret;
>  
>  	/* Turn on the core power */
> @@ -1073,6 +1119,15 @@ static int a5xx_pm_resume(struct msm_gpu *gpu)
>  	if (ret)
>  		return ret;
>  
> +	if (adreno_is_a510(adreno_gpu)) {
> +		/* Halt the sp_input_clk at HM level */
> +		gpu_write(gpu, REG_A5XX_RBBM_CLOCK_CNTL, 0x00000055);
> +		a5xx_set_hwcg(gpu, true);
> +		/* Turn on sp_input_clk at HM level */
> +		gpu_rmw(gpu, REG_A5XX_RBBM_CLOCK_CNTL, 0xFF, 0);

Please use lower case hex.

> +		return 0;
> +	}
> +
>  	/* Turn the RBCCU domain first to limit the chances of voltage droop */
>  	gpu_write(gpu, REG_A5XX_GPMU_RBCCU_POWER_CNTL, 0x778000);
>  
> @@ -1101,9 +1156,17 @@ static int a5xx_pm_resume(struct msm_gpu *gpu)
>  
>  static int a5xx_pm_suspend(struct msm_gpu *gpu)
>  {
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	u32 xin_halt_ctrl0_mask = 0xF;

You don't need a crazy name here - just mask should do.  Please use lower case
hex.
> +
> +	/* A510 has 3 XIN ports in VBIF */
> +	if (adreno_is_a510(adreno_gpu))
> +		xin_halt_ctrl0_mask = 0x7;
> +
>  	/* Clear the VBIF pipe before shutting down */
> -	gpu_write(gpu, REG_A5XX_VBIF_XIN_HALT_CTRL0, 0xF);
> -	spin_until((gpu_read(gpu, REG_A5XX_VBIF_XIN_HALT_CTRL1) & 0xF) == 0xF);
> +	gpu_write(gpu, REG_A5XX_VBIF_XIN_HALT_CTRL0, xin_halt_ctrl0_mask);
> +	spin_until((gpu_read(gpu, REG_A5XX_VBIF_XIN_HALT_CTRL1) &
> +				xin_halt_ctrl0_mask) == xin_halt_ctrl0_mask);
>  
>  	gpu_write(gpu, REG_A5XX_VBIF_XIN_HALT_CTRL0, 0);
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_power.c b/drivers/gpu/drm/msm/adreno/a5xx_power.c
> index a3a06db675ba..58c374664c7f 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_power.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_power.c
> @@ -297,6 +297,10 @@ int a5xx_power_init(struct msm_gpu *gpu)
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	int ret;
>  
> +/* A505/A506/A510 (no ZAP) and A508/A509/A512 (w/ZAP) have no GPMU */

This is true, but if we don't support A505/A506/A508/A509 yet, we shouldn't
mention them. Otherwise the developer could  get confused.

> +	if (adreno_is_a510(adreno_gpu))
> +		return 0;
> +
>  	/* Set up the limits management */
>  	if (adreno_is_a530(adreno_gpu))
>  		a530_lm_setup(gpu);
> @@ -326,6 +330,9 @@ void a5xx_gpmu_ucode_init(struct msm_gpu *gpu)
>  	unsigned int *data, *ptr, *cmds;
>  	unsigned int cmds_size;
>  
> +	if (adreno_is_a510(adreno_gpu))
> +		return;
> +
>  	if (a5xx_gpu->gpmu_bo)
>  		return;
>  
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 40133a43960c..d0cd6bc0123b 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -114,6 +114,21 @@ static const struct adreno_info gpulist[] = {
>  		.gmem  = (SZ_1M + SZ_512K),
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.init  = a4xx_gpu_init,
> +	}, {
> +		.rev   = ADRENO_REV(5, 1, 0, ANY_ID),
> +		.revn = 510,
> +		.name = "A510",
> +		.fw = {
> +			[ADRENO_FW_PM4] = "a530_pm4.fw",
> +			[ADRENO_FW_PFP] = "a530_pfp.fw",
> +		},
> +		.gmem = SZ_256K,
> +		/*
> +		 * Increase inactive period to 250 to avoid bouncing
> +		 * the GDSC which appears to make it grumpy
> +		 */
> +		.inactive_period = 250,
> +		.init = a5xx_gpu_init,
>  	}, {
>  		.rev = ADRENO_REV(5, 3, 0, 2),
>  		.revn = 530,
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index c7441fb8313e..9f93916c8910 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -206,6 +206,11 @@ static inline int adreno_is_a430(struct adreno_gpu *gpu)
>         return gpu->revn == 430;
>  }
>  
> +static inline int adreno_is_a510(struct adreno_gpu *gpu)
> +{
> +	return gpu->revn == 510;
> +}
> +
>  static inline int adreno_is_a530(struct adreno_gpu *gpu)
>  {
>  	return gpu->revn == 530;
> -- 
> 2.21.0
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
