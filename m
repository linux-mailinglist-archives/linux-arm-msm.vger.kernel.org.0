Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F23E441E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 18:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731135AbfFMQRS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 12:17:18 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37844 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731196AbfFMQRN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 12:17:13 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id F368161BAA; Thu, 13 Jun 2019 16:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560442632;
        bh=NWtDk34xCBpqBlHurT9tuz/cXZ/cJLBBFbPswf2zQaQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MAN0iyalGFFNMHuF2f29LigqiX7wFp4TryXxX6wO0r9iUUN2/YmJFFrMwjeSt1KVJ
         OrB3y7DSKlhUbseiAUiRhI+thfD3h0vebcJ3AgXGNY9a96vwgaPjBWfatH8aEhXnn/
         79PKZgEiw5HLUdi48ctG/Y1IGaH2sMdqkSbeAuPc=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 25BC66170E;
        Thu, 13 Jun 2019 16:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560442626;
        bh=NWtDk34xCBpqBlHurT9tuz/cXZ/cJLBBFbPswf2zQaQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kW/o+Jpwj0mPtWw4SCMFgDxfrE8vWI5D6jt+p7I+MYB288hL2MbEcqWX18R0nckUC
         ctE2ytwVraRKAsqb2T/pWGTkgOHSmQzRi+kmE/Nmw9lffyL+5Fag4r6ve/ZNPqe5QS
         yQHZbeSoYluj2m2b/wAglA72XlHzQ9qE9j9qwAwY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 25BC66170E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Thu, 13 Jun 2019 10:17:03 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, marc.w.gonzalez@free.fr,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/adreno: Add A540 support
Message-ID: <20190613161702.GA17590@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, marc.w.gonzalez@free.fr,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20190611185400.14463-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611185400.14463-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 11, 2019 at 11:54:00AM -0700, Jeffrey Hugo wrote:
> The A540 is a derivative of the A530, and is found in the MSM8998 SoC.
> 
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

This looks correct and more importantly, it seems to work, so there is that.
Thanks for doing this; this fills in a sizable gap in coverage since there
seem to be more of these guys in the world than 8996.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
> v3:
> -Adjusted MERCIU for A540 for best performance.
> 
>  drivers/gpu/drm/msm/adreno/a5xx.xml.h      | 28 ++++----
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 26 +++++++-
>  drivers/gpu/drm/msm/adreno/a5xx_power.c    | 76 +++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 18 +++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  6 ++
>  5 files changed, 137 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx.xml.h b/drivers/gpu/drm/msm/adreno/a5xx.xml.h
> index cf4fe14ddd6e..4a61d4e72c98 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx.xml.h
> +++ b/drivers/gpu/drm/msm/adreno/a5xx.xml.h
> @@ -8,19 +8,19 @@ This file was generated by the rules-ng-ng headergen tool in this git repository
>  git clone https://github.com/freedreno/envytools.git
>  
>  The rules-ng-ng source files this header was generated from are:
> -- /home/robclark/src/envytools/rnndb/adreno.xml               (    501 bytes, from 2018-07-03 19:37:13)
> -- /home/robclark/src/envytools/rnndb/freedreno_copyright.xml  (   1572 bytes, from 2018-07-03 19:37:13)
> -- /home/robclark/src/envytools/rnndb/adreno/a2xx.xml          (  42463 bytes, from 2018-11-19 13:44:03)
> -- /home/robclark/src/envytools/rnndb/adreno/adreno_common.xml (  14201 bytes, from 2018-12-02 17:29:54)
> -- /home/robclark/src/envytools/rnndb/adreno/adreno_pm4.xml    (  43052 bytes, from 2018-12-02 17:29:54)
> -- /home/robclark/src/envytools/rnndb/adreno/a3xx.xml          (  83840 bytes, from 2018-07-03 19:37:13)
> -- /home/robclark/src/envytools/rnndb/adreno/a4xx.xml          ( 112086 bytes, from 2018-07-03 19:37:13)
> -- /home/robclark/src/envytools/rnndb/adreno/a5xx.xml          ( 147240 bytes, from 2018-12-02 17:29:54)
> -- /home/robclark/src/envytools/rnndb/adreno/a6xx.xml          ( 140790 bytes, from 2018-12-02 17:29:54)
> -- /home/robclark/src/envytools/rnndb/adreno/a6xx_gmu.xml      (  10431 bytes, from 2018-09-14 13:03:07)
> -- /home/robclark/src/envytools/rnndb/adreno/ocmem.xml         (   1773 bytes, from 2018-07-03 19:37:13)
> -
> -Copyright (C) 2013-2018 by the following authors:
> +- /home/ubuntu/envytools/envytools/rnndb/./adreno.xml             (    501 bytes, from 2019-05-29 01:28:15)
> +- /home/ubuntu/envytools/envytools/rnndb/freedreno_copyright.xml  (   1572 bytes, from 2019-05-29 01:28:15)
> +- /home/ubuntu/envytools/envytools/rnndb/adreno/a2xx.xml          (  79608 bytes, from 2019-05-29 01:28:15)
> +- /home/ubuntu/envytools/envytools/rnndb/adreno/adreno_common.xml (  14239 bytes, from 2019-05-29 01:28:15)
> +- /home/ubuntu/envytools/envytools/rnndb/adreno/adreno_pm4.xml    (  43155 bytes, from 2019-05-29 01:28:15)
> +- /home/ubuntu/envytools/envytools/rnndb/adreno/a3xx.xml          (  83840 bytes, from 2019-05-29 01:28:15)
> +- /home/ubuntu/envytools/envytools/rnndb/adreno/a4xx.xml          ( 112086 bytes, from 2019-05-29 01:28:15)
> +- /home/ubuntu/envytools/envytools/rnndb/adreno/a5xx.xml          ( 147291 bytes, from 2019-05-29 14:51:41)
> +- /home/ubuntu/envytools/envytools/rnndb/adreno/a6xx.xml          ( 148461 bytes, from 2019-05-29 01:28:15)
> +- /home/ubuntu/envytools/envytools/rnndb/adreno/a6xx_gmu.xml      (  10431 bytes, from 2019-05-29 01:28:15)
> +- /home/ubuntu/envytools/envytools/rnndb/adreno/ocmem.xml         (   1773 bytes, from 2019-05-29 01:28:15)
> +
> +Copyright (C) 2013-2019 by the following authors:
>  - Rob Clark <robdclark@gmail.com> (robclark)
>  - Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
>  
> @@ -2148,6 +2148,8 @@ static inline uint32_t A5XX_VSC_RESOLVE_CNTL_Y(uint32_t val)
>  
>  #define REG_A5XX_HLSQ_TIMEOUT_THRESHOLD_1			0x00000e01
>  
> +#define REG_A5XX_HLSQ_DBG_ECO_CNTL				0x00000e04
> +
>  #define REG_A5XX_HLSQ_ADDR_MODE_CNTL				0x00000e05
>  
>  #define REG_A5XX_HLSQ_MODE_CNTL					0x00000e06
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index e5fcefa49f19..556402f18908 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -318,12 +318,18 @@ static const struct {
>  
>  void a5xx_set_hwcg(struct msm_gpu *gpu, bool state)
>  {
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	unsigned int i;
>  
>  	for (i = 0; i < ARRAY_SIZE(a5xx_hwcg); i++)
>  		gpu_write(gpu, a5xx_hwcg[i].offset,
>  			state ? a5xx_hwcg[i].value : 0);
>  
> +	if (adreno_is_a540(adreno_gpu)) {
> +		gpu_write(gpu, REG_A5XX_RBBM_CLOCK_DELAY_GPMU, state ? 0x00000770 : 0);
> +		gpu_write(gpu, REG_A5XX_RBBM_CLOCK_HYST_GPMU, state ? 0x00000004 : 0);
> +	}
> +
>  	gpu_write(gpu, REG_A5XX_RBBM_CLOCK_CNTL, state ? 0xAAA8AA00 : 0);
>  	gpu_write(gpu, REG_A5XX_RBBM_ISDB_CNT, state ? 0x182 : 0x180);
>  }
> @@ -507,6 +513,9 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>  
>  	gpu_write(gpu, REG_A5XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x00000003);
>  
> +	if (adreno_is_a540(adreno_gpu))
> +		gpu_write(gpu, REG_A5XX_VBIF_GATE_OFF_WRREQ_EN, 0x00000009);
> +
>  	/* Make all blocks contribute to the GPU BUSY perf counter */
>  	gpu_write(gpu, REG_A5XX_RBBM_PERFCTR_GPU_BUSY_MASKED, 0xFFFFFFFF);
>  
> @@ -567,7 +576,10 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>  	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MAX_HI, 0x00000000);
>  
>  	gpu_write(gpu, REG_A5XX_CP_MEQ_THRESHOLDS, 0x40);
> -	gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x40);
> +	if (adreno_is_a530(adreno_gpu))
> +		gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x40);
> +	if (adreno_is_a540(adreno_gpu))
> +		gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x400);
>  	gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_2, 0x80000060);
>  	gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_1, 0x40201B16);
>  
> @@ -592,6 +604,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>  	/* Set the highest bank bit */
>  	gpu_write(gpu, REG_A5XX_TPL1_MODE_CNTL, 2 << 7);
>  	gpu_write(gpu, REG_A5XX_RB_MODE_CNTL, 2 << 1);
> +	if (adreno_is_a540(adreno_gpu))
> +		gpu_write(gpu, REG_A5XX_UCHE_DBG_ECO_CNTL_2, 2);
>  
>  	/* Protect registers from the CP */
>  	gpu_write(gpu, REG_A5XX_CP_PROTECT_CNTL, 0x00000007);
> @@ -642,6 +656,16 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>  		REG_A5XX_RBBM_SECVID_TSB_TRUSTED_BASE_HI, 0x00000000);
>  	gpu_write(gpu, REG_A5XX_RBBM_SECVID_TSB_TRUSTED_SIZE, 0x00000000);
>  
> +	/*
> +	 * VPC corner case with local memory load kill leads to corrupt
> +	 * internal state. Normal Disable does not work for all a5x chips.
> +	 * So do the following setting to disable it.
> +	 */
> +	if (adreno_gpu->info->quirks & ADRENO_QUIRK_LMLOADKILL_DISABLE) {
> +		gpu_rmw(gpu, REG_A5XX_VPC_DBG_ECO_CNTL, 0, BIT(23));
> +		gpu_rmw(gpu, REG_A5XX_HLSQ_DBG_ECO_CNTL, BIT(18), 0);
> +	}
> +
>  	ret = adreno_hw_init(gpu);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_power.c b/drivers/gpu/drm/msm/adreno/a5xx_power.c
> index 70e65c94e525..bf12c61f9331 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_power.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_power.c
> @@ -32,6 +32,18 @@
>  #define AGC_POWER_CONFIG_PRODUCTION_ID 1
>  #define AGC_INIT_MSG_VALUE 0xBABEFACE
>  
> +/* AGC_LM_CONFIG (A540+) */
> +#define AGC_LM_CONFIG (136/4)
> +#define AGC_LM_CONFIG_GPU_VERSION_SHIFT 17
> +#define AGC_LM_CONFIG_ENABLE_GPMU_ADAPTIVE 1
> +#define AGC_LM_CONFIG_THROTTLE_DISABLE (2 << 8)
> +#define AGC_LM_CONFIG_ISENSE_ENABLE (1 << 4)
> +#define AGC_LM_CONFIG_ENABLE_ERROR (3 << 4)
> +#define AGC_LM_CONFIG_LLM_ENABLED (1 << 16)
> +#define AGC_LM_CONFIG_BCL_DISABLED (1 << 24)
> +
> +#define AGC_LEVEL_CONFIG (140/4)
> +
>  static struct {
>  	uint32_t reg;
>  	uint32_t value;
> @@ -116,7 +128,7 @@ static inline uint32_t _get_mvolts(struct msm_gpu *gpu, uint32_t freq)
>  }
>  
>  /* Setup thermal limit management */
> -static void a5xx_lm_setup(struct msm_gpu *gpu)
> +static void a530_lm_setup(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
> @@ -165,6 +177,45 @@ static void a5xx_lm_setup(struct msm_gpu *gpu)
>  	gpu_write(gpu, AGC_INIT_MSG_MAGIC, AGC_INIT_MSG_VALUE);
>  }
>  
> +#define PAYLOAD_SIZE(_size) ((_size) * sizeof(u32))
> +#define LM_DCVS_LIMIT 1
> +#define LEVEL_CONFIG ~(0x303)
> +
> +static void a540_lm_setup(struct msm_gpu *gpu)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	u32 config;
> +
> +	/* The battery current limiter isn't enabled for A540 */
> +	config = AGC_LM_CONFIG_BCL_DISABLED;
> +	config |= adreno_gpu->rev.patchid << AGC_LM_CONFIG_GPU_VERSION_SHIFT;
> +
> +	/* For now disable GPMU side throttling */
> +	config |= AGC_LM_CONFIG_THROTTLE_DISABLE;
> +
> +	/* Until we get clock scaling 0 is always the active power level */
> +	gpu_write(gpu, REG_A5XX_GPMU_GPMU_VOLTAGE, 0x80000000 | 0);
> +
> +	/* Fixed at 6000 for now */
> +	gpu_write(gpu, REG_A5XX_GPMU_GPMU_PWR_THRESHOLD, 0x80000000 | 6000);
> +
> +	gpu_write(gpu, AGC_MSG_STATE, 0x80000001);
> +	gpu_write(gpu, AGC_MSG_COMMAND, AGC_POWER_CONFIG_PRODUCTION_ID);
> +
> +	gpu_write(gpu, AGC_MSG_PAYLOAD(0), 5448);
> +	gpu_write(gpu, AGC_MSG_PAYLOAD(1), 1);
> +
> +	gpu_write(gpu, AGC_MSG_PAYLOAD(2), _get_mvolts(gpu, gpu->fast_rate));
> +	gpu_write(gpu, AGC_MSG_PAYLOAD(3), gpu->fast_rate / 1000000);
> +
> +	gpu_write(gpu, AGC_MSG_PAYLOAD(AGC_LM_CONFIG), config);
> +	gpu_write(gpu, AGC_MSG_PAYLOAD(AGC_LEVEL_CONFIG), LEVEL_CONFIG);
> +	gpu_write(gpu, AGC_MSG_PAYLOAD_SIZE,
> +	PAYLOAD_SIZE(AGC_LEVEL_CONFIG + 1));
> +
> +	gpu_write(gpu, AGC_INIT_MSG_MAGIC, AGC_INIT_MSG_VALUE);
> +}
> +
>  /* Enable SP/TP cpower collapse */
>  static void a5xx_pc_init(struct msm_gpu *gpu)
>  {
> @@ -206,7 +257,8 @@ static int a5xx_gpmu_init(struct msm_gpu *gpu)
>  		return -EINVAL;
>  	}
>  
> -	gpu_write(gpu, REG_A5XX_GPMU_WFI_CONFIG, 0x4014);
> +	if (adreno_is_a530(adreno_gpu))
> +		gpu_write(gpu, REG_A5XX_GPMU_WFI_CONFIG, 0x4014);
>  
>  	/* Kick off the GPMU */
>  	gpu_write(gpu, REG_A5XX_GPMU_CM3_SYSRESET, 0x0);
> @@ -220,12 +272,26 @@ static int a5xx_gpmu_init(struct msm_gpu *gpu)
>  		DRM_ERROR("%s: GPMU firmware initialization timed out\n",
>  			gpu->name);
>  
> +	if (!adreno_is_a530(adreno_gpu)) {
> +		u32 val = gpu_read(gpu, REG_A5XX_GPMU_GENERAL_1);
> +
> +		if (val)
> +			DRM_ERROR("%s: GPMU firmware initialization failed: %d\n",
> +				  gpu->name, val);
> +	}
> +
>  	return 0;
>  }
>  
>  /* Enable limits management */
>  static void a5xx_lm_enable(struct msm_gpu *gpu)
>  {
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +
> +	/* This init sequence only applies to A530 */
> +	if (!adreno_is_a530(adreno_gpu))
> +		return;
> +
>  	gpu_write(gpu, REG_A5XX_GDPM_INT_MASK, 0x0);
>  	gpu_write(gpu, REG_A5XX_GDPM_INT_EN, 0x0A);
>  	gpu_write(gpu, REG_A5XX_GPMU_GPMU_VOLTAGE_INTR_EN_MASK, 0x01);
> @@ -237,10 +303,14 @@ static void a5xx_lm_enable(struct msm_gpu *gpu)
>  
>  int a5xx_power_init(struct msm_gpu *gpu)
>  {
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	int ret;
>  
>  	/* Set up the limits management */
> -	a5xx_lm_setup(gpu);
> +	if (adreno_is_a530(adreno_gpu))
> +		a530_lm_setup(gpu);
> +	else
> +		a540_lm_setup(gpu);
>  
>  	/* Set up SP/TP power collpase */
>  	a5xx_pc_init(gpu);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index b907245d3d96..cb7dadaf1669 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -144,6 +144,24 @@ static const struct adreno_info gpulist[] = {
>  			ADRENO_QUIRK_FAULT_DETECT_MASK,
>  		.init = a5xx_gpu_init,
>  		.zapfw = "a530_zap.mdt",
> +	}, {
> +		.rev = ADRENO_REV(5, 4, 0, 2),
> +		.revn = 540,
> +		.name = "A540",
> +		.fw = {
> +			[ADRENO_FW_PM4] = "a530_pm4.fw",
> +			[ADRENO_FW_PFP] = "a530_pfp.fw",
> +			[ADRENO_FW_GPMU] = "a540_gpmu.fw2",
> +		},
> +		.gmem = SZ_1M,
> +		/*
> +		 * Increase inactive period to 250 to avoid bouncing
> +		 * the GDSC which appears to make it grumpy
> +		 */
> +		.inactive_period = 250,
> +		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
> +		.init = a5xx_gpu_init,
> +		.zapfw = "a540_zap.mdt",
>  	}, {
>  		.rev = ADRENO_REV(6, 3, 0, ANY_ID),
>  		.revn = 630,
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 0925606ec9b5..d67c1a69c49a 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -61,6 +61,7 @@ enum {
>  enum adreno_quirks {
>  	ADRENO_QUIRK_TWO_PASS_USE_WFI = 1,
>  	ADRENO_QUIRK_FAULT_DETECT_MASK = 2,
> +	ADRENO_QUIRK_LMLOADKILL_DISABLE = 3,
>  };
>  
>  struct adreno_rev {
> @@ -221,6 +222,11 @@ static inline int adreno_is_a530(struct adreno_gpu *gpu)
>  	return gpu->revn == 530;
>  }
>  
> +static inline int adreno_is_a540(struct adreno_gpu *gpu)
> +{
> +	return gpu->revn == 540;
> +}
> +
>  int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value);
>  const struct firmware *adreno_request_fw(struct adreno_gpu *adreno_gpu,
>  		const char *fwname);
> -- 
> 2.17.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
