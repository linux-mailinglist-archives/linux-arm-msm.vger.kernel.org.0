Return-Path: <linux-arm-msm+bounces-33864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AD1998746
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 15:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 373762817E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 13:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8451C8FC7;
	Thu, 10 Oct 2024 13:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pZpbwVFi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02D71C6F76
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 13:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728565939; cv=none; b=rx/9NrqGLuYV+KVl2yuNhKqwS58rq0Vn0NcCrhq0DVfL795fB44VHxHYgJlhOvEyquIDjWePBJnsnI7ksSBLLmlozqO758SKogZ26Cx/zw4wtc1Ww3/iK4FeCQgTIIhYwGqs7Z1S32opwUT/JPx0x6eKISlHFL0/7rIlm6bLxAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728565939; c=relaxed/simple;
	bh=SOVGQ0j1vHnuQ3KnCTLaMZr0IoVM1KBu/R1Xr3Ui2ZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TqtEPWM2Ilv5lzOAyUiBQQTxWNJRD1lTbSjLCYSv0BO1kMTWrOwYbNOXEojh8pRU9aTjUigtACBlOdgzfT4NAKAyM5HlWbRTqUggKpz8iCPZGTj91KpedqHAtd8fCQAs/rJY8ntOPN5gUFtUlzglCfsDC/m8Kuq7FEMFAF9dtus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pZpbwVFi; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fabe5c8c26so8507031fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 06:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728565936; x=1729170736; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8oQ6GD8MQZYcrXheM1dKv/EP5g/yYfuhywKE4ovWK+c=;
        b=pZpbwVFixyviTYVM0dRRtLCZl6mmWx3ON/XsQPYDWnMMiSyqGC5rQ3ZaRSwDvphXsN
         zMS5z9mUXNnmHHXVR5jS1pNBTh7x9ScvrLopyDOMMACA+aNtAmOE3ezlJQBBlET0Tjaw
         Q1NjPD/RoY1K4FTCuFI076bfZXpPjXmFZsx55XnJdAYvTOiDVCslu1QlT0umvsU5b9gZ
         2LL8fX7FF37Hw1eIUgFDmIcQZUm2bRJ8qVB+DA6lbqLWbBNOhOboGZjpxhW8Ky1QI+ED
         5RNIBFP5EWor1zNoN2M87XcDKU/mWe2RR5407tV8XarMXWtFlFZK3ZnQqvJZ/9XEOm2N
         Vd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728565936; x=1729170736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8oQ6GD8MQZYcrXheM1dKv/EP5g/yYfuhywKE4ovWK+c=;
        b=U7FWVCU/yMeTpHY8dVbSoxl2c7U/wYQW3ukfqRvkplxkICInxbXXH3HMxH4C6une4D
         ePw2DNN8D73ZWNdoH9rL6fXlIG+PWpBfMJD87mXi2ychlO6e5vDTAsxdIgcAiqYgVzN6
         f36SoaEJ1wbq69TOTs28T6TvRvvQ713toVzqonNSmUKudvxMK8l+wph0Yi2heL1B0jrQ
         u8ctvExn4XyJh6GLlVK8CtQd+W9So/Jp1b3LSDeUMXTkPxs4vOpSF5UujfbU/2fOUn9t
         JiPCB9glCBAOWswmSx3NVxoAonIqzaIS5GcR8kBLyqDbjaM/8T0OwwGNRuWdIjFpZFoU
         9B7g==
X-Forwarded-Encrypted: i=1; AJvYcCXt2P639GdKNFwXOWwpalGMPdp+qrVxtfW3l77YUU+KFxO06Xf4qu7FrAXfr07hVuJwv2zwt2EvgJIsXo8V@vger.kernel.org
X-Gm-Message-State: AOJu0YzrEIvie4nyYHJZF8XPt1W5wXYIg9icwpbsHAc/xdJM+0hqatR8
	RUGY+NUvZcyyhlCSfI68TDRDMJaBxAohidrUIlEuM5NNL7gxxu/++f3fD6VRS4I=
X-Google-Smtp-Source: AGHT+IF3He53CvkRJkxofe5tl8tnrXaXIeMvIqxCeWY4+8hdVEZb6tiIi6SGDk3CRN6Uet1MYDTxFg==
X-Received: by 2002:a2e:a985:0:b0:2f5:806:5d00 with SMTP id 38308e7fff4ca-2fb187be78bmr39711411fa.32.1728565935651;
        Thu, 10 Oct 2024 06:12:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb29fb4b61sm403631fa.128.2024.10.10.06.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 06:12:14 -0700 (PDT)
Date: Thu, 10 Oct 2024 16:12:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/14] drm/msm/dpu: update mixer number info earlier
Message-ID: <n7bkvvxph2wxaxf2s7vonj273ouonlb2nisl7n7ora6j5stnlv@tt3v3uawwh2q>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-8-76d4f5d413bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-8-76d4f5d413bf@linaro.org>

On Wed, Oct 09, 2024 at 04:50:21PM GMT, Jun Nie wrote:
> Update mixer number info earlier so that the plane nopipe check
> can have the info to clip the plane. Otherwise, the first nonpipe
> check will have mixer number as 0 and plane is not checked.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index dfe282c607933..68655c8817bf8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -638,6 +638,7 @@ static int dpu_encoder_virt_atomic_check(
>  	struct dpu_global_state *global_state;
>  	struct drm_framebuffer *fb;
>  	struct drm_dsc_config *dsc;
> +	struct dpu_crtc_state *cstate;
>  	int ret = 0;
>  
>  	if (!drm_enc || !crtc_state || !conn_state) {
> @@ -662,6 +663,8 @@ static int dpu_encoder_virt_atomic_check(
>  	dsc = dpu_encoder_get_dsc_config(drm_enc);
>  
>  	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
> +	cstate = to_dpu_crtc_state(crtc_state);
> +	cstate->num_mixers = topology.num_lm;
>  
>  	/*
>  	 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
> @@ -1170,7 +1173,13 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  	}
>  
>  	cstate->num_dscs = num_dsc;
> -	cstate->num_mixers = num_lm;
> +	if (cstate->num_mixers != num_lm) {
> +		if (!cstate->num_mixers)
> +			DPU_ERROR_ENC(dpu_enc,
> +				      "mixer number %d is not as expected %d\n",
> +				      num_lm, cstate->num_mixers);
> +		cstate->num_mixers = num_lm;
> +	}

Is it a possible case or just defensive coding?

>  	dpu_enc->connector = conn_state->connector;
>  
>  	/*
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

