Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AACA21BC36
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 19:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbgGJR3g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 13:29:36 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:60566 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726925AbgGJR3g (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 13:29:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594402175; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=z7xyehWwvZAwmwo9L22CYZ3U7u55HWB00cITqfpNM9o=; b=b+KXbc3d8qkjHhC59Pj4jSy/dPhXuEJC9Junaq4rhbp95qHQjITo7vgeWdJPs/b1Idf+5hfA
 sALaohnVCeFRMVkDla9FqI+zr0e7EsFBC0AZGrxHZobbpVTxb9SJ0l0E7Z741QNiR4+wnGn5
 60ls8y+27UwNavyQOv/FMPfK+ok=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n19.prod.us-west-2.postgun.com with SMTP id
 5f08a55cc9bd2efa2e767b8e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 10 Jul 2020 17:29:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A2253C433A1; Fri, 10 Jul 2020 17:28:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9FE1AC433C6;
        Fri, 10 Jul 2020 17:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9FE1AC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Fri, 10 Jul 2020 11:28:54 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/a6xx: fix crashstate capture for A650
Message-ID: <20200710172854.GD21059@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Jonathan Marek <jonathan@marek.ca>,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200630001010.15194-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630001010.15194-1-jonathan@marek.ca>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 29, 2020 at 08:10:06PM -0400, Jonathan Marek wrote:
> A650 has a separate RSCC region, so dump RSCC registers separately, reading
> them from the RSCC base. Without this change a GPU hang will cause a system
> reset if CONFIG_DEV_COREDUMP is enabled.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h       |  5 +++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 25 +++++++++++++++------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h | 12 ++++++----
>  3 files changed, 31 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index 47df4745db50..c6d2bced8e5d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -127,6 +127,11 @@ static inline u64 gmu_read64(struct a6xx_gmu *gmu, u32 lo, u32 hi)
>  	readl_poll_timeout((gmu)->mmio + ((addr) << 2), val, cond, \
>  		interval, timeout)
>  
> +static inline u32 gmu_read_rscc(struct a6xx_gmu *gmu, u32 offset)
> +{
> +	return msm_readl(gmu->rscc + (offset << 2));
> +}
> +
>  static inline void gmu_write_rscc(struct a6xx_gmu *gmu, u32 offset, u32 value)
>  {
>  	return msm_writel(value, gmu->rscc + (offset << 2));
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index d6023ba8033c..959656ad6987 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -736,7 +736,8 @@ static void a6xx_get_ahb_gpu_registers(struct msm_gpu *gpu,
>  static void _a6xx_get_gmu_registers(struct msm_gpu *gpu,
>  		struct a6xx_gpu_state *a6xx_state,
>  		const struct a6xx_registers *regs,
> -		struct a6xx_gpu_state_obj *obj)
> +		struct a6xx_gpu_state_obj *obj,
> +		bool rscc)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> @@ -755,9 +756,17 @@ static void _a6xx_get_gmu_registers(struct msm_gpu *gpu,
>  		u32 count = RANGE(regs->registers, i);
>  		int j;
>  
> -		for (j = 0; j < count; j++)
> -			obj->data[index++] = gmu_read(gmu,
> -				regs->registers[i] + j);
> +		for (j = 0; j < count; j++) {
> +			u32 offset = regs->registers[i] + j;
> +			u32 val;
> +
> +			if (rscc)
> +				val = gmu_read_rscc(gmu, offset);
> +			else
> +				val = gmu_read(gmu, offset);
> +
> +			obj->data[index++] = val;
> +		}
>  	}
>  }
>  
> @@ -777,7 +786,9 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
>  
>  	/* Get the CX GMU registers from AHB */
>  	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[0],
> -		&a6xx_state->gmu_registers[0]);
> +		&a6xx_state->gmu_registers[0], false);
> +	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[1],
> +		&a6xx_state->gmu_registers[1], true);
>  
>  	if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
>  		return;
> @@ -785,8 +796,8 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
>  	/* Set the fence to ALLOW mode so we can access the registers */
>  	gpu_write(gpu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
>  
> -	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[1],
> -		&a6xx_state->gmu_registers[1]);
> +	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[2],
> +		&a6xx_state->gmu_registers[2], false);
>  }
>  
>  #define A6XX_GBIF_REGLIST_SIZE   1
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
> index 24c974c293e5..846fd5b54c23 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
> @@ -341,10 +341,6 @@ static const u32 a6xx_gmu_cx_registers[] = {
>  	0x5157, 0x5158, 0x515d, 0x515d, 0x5162, 0x5162, 0x5164, 0x5165,
>  	0x5180, 0x5186, 0x5190, 0x519e, 0x51c0, 0x51c0, 0x51c5, 0x51cc,
>  	0x51e0, 0x51e2, 0x51f0, 0x51f0, 0x5200, 0x5201,
> -	/* GPU RSCC */
> -	0x8c8c, 0x8c8c, 0x8d01, 0x8d02, 0x8f40, 0x8f42, 0x8f44, 0x8f47,
> -	0x8f4c, 0x8f87, 0x8fec, 0x8fef, 0x8ff4, 0x902f, 0x9094, 0x9097,
> -	0x909c, 0x90d7, 0x913c, 0x913f, 0x9144, 0x917f,
>  	/* GMU AO */
>  	0x9300, 0x9316, 0x9400, 0x9400,
>  	/* GPU CC */
> @@ -357,8 +353,16 @@ static const u32 a6xx_gmu_cx_registers[] = {
>  	0xbc00, 0xbc16, 0xbc20, 0xbc27,
>  };
>  
> +static const u32 a6xx_gmu_cx_rscc_registers[] = {
> +	/* GPU RSCC */
> +	0x008c, 0x008c, 0x0101, 0x0102, 0x0340, 0x0342, 0x0344, 0x0347,
> +	0x034c, 0x0387, 0x03ec, 0x03ef, 0x03f4, 0x042f, 0x0494, 0x0497,
> +	0x049c, 0x04d7, 0x053c, 0x053f, 0x0544, 0x057f,
> +};
> +
>  static const struct a6xx_registers a6xx_gmu_reglist[] = {
>  	REGS(a6xx_gmu_cx_registers, 0, 0),
> +	REGS(a6xx_gmu_cx_rscc_registers, 0, 0),
>  	REGS(a6xx_gmu_gx_registers, 0, 0),
>  };
>  
> -- 
> 2.26.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
