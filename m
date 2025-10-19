Return-Path: <linux-arm-msm+bounces-77901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AD1BEE264
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 11:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F05DC4E114C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 09:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1C02E2822;
	Sun, 19 Oct 2025 09:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="mwB3Lsqh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FED23371B;
	Sun, 19 Oct 2025 09:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760866533; cv=none; b=R32wCps3+QDKV85ojd055E+K17Pmtjy2gZ+epDVsZcrsnrWJE237p8oxHOFALOuhR3Q03qHuqOdKJZNfI8Uex0k3kQP2KZEwR4RDAUnF+nODfVzmienH92G/+pzG6vDUy0GPlmH7+tsfAOkdFYx1qGOpUvDlhrUpwKpFqf6tfZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760866533; c=relaxed/simple;
	bh=I7swA7Kt4/jMt+Zzvms1ZaGrKcdm/2I2tslhysy+6OE=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:To:Cc:
	 In-Reply-To:Content-Type; b=M5dTk5dYWO7qLEVlkE2NJGsEiPdDModTM9insf0Sd+XXKpQwqOcI2eOhjpeeasM5UHSmTzpNknib7Qwz/gkB6cRky3+IAcp7UtTTLuk6WSqj55EL6Rdn3omPtj4m6yhiTtCa9IkCngGOZVv2HOfu+U6lxK1+cKi5DVg8HBgKUNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=mwB3Lsqh; arc=none smtp.client-ip=80.12.242.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id APouva5KKnE4gAPouvkY2J; Sun, 19 Oct 2025 11:35:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1760866523;
	bh=QYUchmJA4dda+MYsvmqTYxjZthKW6suHT9ouFeAZf80=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=mwB3LsqhkmNftbKCmNY/ha8dkzSi/b9ZFDd3uKU2alAS6MEbtEvJ8tS289RxHl70M
	 0V6dDjBaAtXoHi/0DQZccUMrbQWnM674Ky6OdIpQwkniMkyJDDYPnczWsR47SmMCcV
	 XeHiPpkeeOgSyQQ+pU3f5I2fAo+7QXUnwK+eVTAP1RpTUd0zhI+ugFnFJM2xB7ZAc5
	 mKxiWuNyt4EoMu1lQbkrQYrn8ePag0AQYXNDO1Mceqa1v5j5eFR6vF0hHThzfS1axI
	 SnHvkb7CemnTbzK+k6po6w2WtyFkWq+OycQZBrwpLS23oSbOWv1WZzdaZ4fAkBur0N
	 caKHAdTHMSiDQ==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sun, 19 Oct 2025 11:35:23 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <d18e8155-fa2a-4976-a3c1-7327117148d7@wanadoo.fr>
Date: Sun, 19 Oct 2025 11:35:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT
 DRM property
References: <20251019-dpu-add-dspp-gc-driver-v2-1-30c8cb79cb17@izzo.pro>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
To: devnull+federico.izzo.pro@kernel.org
Cc: abhinav.kumar@linux.dev, agx@sigxcpu.org, airlied@gmail.com,
 david@ixit.cz, dri-devel@lists.freedesktop.org, federico@izzo.pro,
 freedreno@lists.freedesktop.org, jesszhan0024@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 lumag@kernel.org, marijn.suijten@somainline.org, nicola@corna.info,
 phone-devel@vger.kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
 simona@ffwll.ch, ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <20251019-dpu-add-dspp-gc-driver-v2-1-30c8cb79cb17@izzo.pro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 19/10/2025 à 11:16, Federico Amedeo Izzo via B4 Relay a écrit :
> From: Federico Amedeo Izzo <federico-3FKkmSgw/TI@public.gmane.org>
> 
> Add support for DSPP GC block in DPU driver for Qualcomm SoCs.
> Expose the GAMMA_LUT DRM property, which is needed to enable
> night light and basic screen color calibration.
> 
> I used LineageOS downstream kernel as a reference and found the LUT
> format by trial-and-error on OnePlus 6.
> 
> Tested on oneplus-enchilada (sdm845-mainline 6.16-dev) and xiaomi-tissot
> (msm8953-mainline 6.12/main).
> 
> Tested-by: David Heidelberg <david-W22tF5X+A20@public.gmane.org>  # Pixel 3 (next-20251018)
> Tested-by: Guido Günther <agx-wGvLLbajjwFAfugRpC6u6w@public.gmane.org> # on sdm845-shift-axolotl
> Signed-off-by: Federico Amedeo Izzo <federico-3FKkmSgw/TI@public.gmane.org>
> ---
> DRM GAMMA_LUT support was missing on sdm845 and other Qualcomm SoCs using
> DPU for CRTC. This is needed in userspace to enable features like Night
> Light or basic color calibration.
> 
> I wrote this driver to enable Night Light on OnePlus 6, and after the
> driver was working I found out it applies to the 29 different Qualcomm SoCs
> that use the DPU display engine, including X1E for laptops.
> 
> I used the LineageOS downstream kernel as reference and found the correct
> LUT format by trial-and-error on OnePlus 6.
> 
> This was my first Linux driver and it's been a great learning
> experience.
> 
> The patch was reviewed by postmarketOS contributors here:
> https://gitlab.com/sdm845-mainline/linux/-/merge_requests/137
> During review the patch was tested successfully on hamoa (X1E).
> ---

Hi,

...

> @@ -830,19 +862,40 @@ static void _dpu_crtc_setup_cp_blocks(struct drm_crtc *crtc)
>   		ctl = mixer[i].lm_ctl;
>   		dspp = mixer[i].hw_dspp;
>   
> -		if (!dspp || !dspp->ops.setup_pcc)
> +		if (!dspp)
>   			continue;
>   
> -		if (!state->ctm) {
> -			dspp->ops.setup_pcc(dspp, NULL);
> -		} else {
> -			_dpu_crtc_get_pcc_coeff(state, &cfg);
> -			dspp->ops.setup_pcc(dspp, &cfg);
> +		if (dspp->ops.setup_pcc) {
> +			if (!state->ctm) {
> +				dspp->ops.setup_pcc(dspp, NULL);
> +			} else {
> +				_dpu_crtc_get_pcc_coeff(state, &cfg);
> +				dspp->ops.setup_pcc(dspp, &cfg);
> +			}
> +
> +			/* stage config flush mask */
> +			ctl->ops.update_pending_flush_dspp(ctl,
> +				mixer[i].hw_dspp->idx, DPU_DSPP_PCC);
>   		}
>   
> -		/* stage config flush mask */
> -		ctl->ops.update_pending_flush_dspp(ctl,
> -			mixer[i].hw_dspp->idx, DPU_DSPP_PCC);
> +		if (dspp->ops.setup_gc) {
> +			if (!state->gamma_lut) {
> +				dspp->ops.setup_gc(dspp, NULL);
> +			} else {
> +				gc_lut = kzalloc(sizeof(*gc_lut), GFP_KERNEL);

The memory is already cleared in _dpu_crtc_get_gc_lut().
Eiher this could be changed into kmalloc(), or the memset in 
_dpu_crtc_get_gc_lut() could be removed.

> +				if (!gc_lut) {
> +					DRM_ERROR("failed to allocate gc_lut\n");

usually,message related to memory allocation errors are not needed, 
because things are already verbose in such a case.

> +					continue;
> +				}
> +				_dpu_crtc_get_gc_lut(state, gc_lut);
> +				dspp->ops.setup_gc(dspp, gc_lut);
> +				kfree(gc_lut);
> +			}
> +
> +			/* stage config flush mask */
> +			ctl->ops.update_pending_flush_dspp(ctl,
> +				mixer[i].hw_dspp->idx, DPU_DSPP_GC);
> +		}
>   	}
>   }

...

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> index 54b20faa0b69..7ebe7d8a5382 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c

...

> @@ -63,6 +75,47 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
>   	DPU_REG_WRITE(&ctx->hw, base, PCC_EN);
>   }
>   
> +static void dpu_setup_dspp_gc(struct dpu_hw_dspp *ctx,
> +		struct dpu_hw_gc_lut *gc_lut)
> +{
> +	int i = 0;
> +	u32 base, reg;
> +
> +	if (!ctx) {
> +		DRM_ERROR("invalid ctx %pK\n", ctx);

ctx is known to be NULL here. So the message can be simplified.

> +		return;
> +	}
> +
> +	base = ctx->cap->sblk->gc.base;
> +
> +	if (!base) {
> +		DRM_ERROR("invalid ctx %pK gc base 0x%x\n", ctx, base);

base is known to be NULL here. So the message can be simplified.

> +		return;
> +	}
> +
> +	if (!gc_lut) {
> +		DRM_DEBUG_DRIVER("disable gc feature\n");
> +		DPU_REG_WRITE(&ctx->hw, base, GC_DIS);
> +		return;
> +	}
> +
> +	reg = 0;
> +	DPU_REG_WRITE(&ctx->hw, base + GC_C0_INDEX_OFF, reg);
> +	DPU_REG_WRITE(&ctx->hw, base + GC_C1_INDEX_OFF, reg);
> +	DPU_REG_WRITE(&ctx->hw, base + GC_C2_INDEX_OFF, reg);

Why not using 0 explicitly, instead of using reg here?

> +
> +	for (i = 0; i < PGC_TBL_LEN; i++) {
> +		DPU_REG_WRITE(&ctx->hw, base + GC_C0_OFF, gc_lut->c0[i]);
> +		DPU_REG_WRITE(&ctx->hw, base + GC_C1_OFF, gc_lut->c1[i]);
> +		DPU_REG_WRITE(&ctx->hw, base + GC_C2_OFF, gc_lut->c2[i]);
> +	}
> +
> +	DPU_REG_WRITE(&ctx->hw, base + GC_LUT_SWAP_OFF, BIT(0));
> +
> +	reg = GC_EN | ((gc_lut->flags & PGC_8B_ROUND) ? GC_8B_ROUND_EN : 0);
> +	DPU_REG_WRITE(&ctx->hw, base, reg);
> +}

...

CJ

