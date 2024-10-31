Return-Path: <linux-arm-msm+bounces-36577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 105919B8072
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 17:45:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC3CB283002
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 16:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DBAC1BD020;
	Thu, 31 Oct 2024 16:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DqXAIWwJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEE816BE1C
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 16:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730393103; cv=none; b=j9NO19+HBNgwG7n6/TIV+6+VEDFjJQi5SpgupGubym8QM21OpkAUB5Nz5sYX9zIEIfAbCd40DpkEP4XBEhgc4PW7GBYRTbwXlhQgpgWbnjOz6L+kkRzQmISmbArWHU/o6p6a2XmRUM0BB2GP+gYFgt8423UQdGnsqZ782EY9wPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730393103; c=relaxed/simple;
	bh=ZGo/bl0Pq3T0ozTkindgCHxfEg8M4xU32RHZwFIPUUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QGxdUOt7O8qZ43EXeWmtGIj0lnoiCJ3EkDUj1wFg3GuPDSQRYJZkouWsz8ycemuDDDEnbVvIcPL5D5QIlsPnRGU76aru9f57nV06X6ah4zJn5e0ntLWwtb0b2OxOBYJqzNY1kPGs/8UGdc1fI9IdqOhDjdUN6v+IaSE+jcfI+NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DqXAIWwJ; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso18062021fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 09:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730393099; x=1730997899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kt+ok40lFX13Yzdkxs+h8BxbfiG8swFfP1jVOHqPZHk=;
        b=DqXAIWwJtvvNri+IwRbhm2A5qbcZ7nR7PxjUkGKf7LKHQzjJMYmKKanPOixYn6Xnh5
         e5fkPC4bzrJch8NLtxGLjqmdJD7HV06InIhphbFoZTfStDUo+39iaJa8X3E82usRfnhx
         EQ2j8kulM7hpUcKgrMPSZCP9bWosDmiy73fcztCgZUErkrg5vYxyw/GnNStyIp20S7sL
         HwX0IGpl2clHfCgr59CbxIV6d6lKW03+Ua51K60xeMqi/XNJmp2HjhxM4RdI3SetPTff
         kzjcGGwWKdsul5ZIBAXHfPHerz9hO3/0ArkbC5bK6XhiQdZw7W7dKI8pOdUjBGfBg4hX
         m2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730393099; x=1730997899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kt+ok40lFX13Yzdkxs+h8BxbfiG8swFfP1jVOHqPZHk=;
        b=ScnGrcwdHWxv0R0y+juBxhRIh5/BaoEYYsOxsIuA0siv9o3gIpgmNDXiNPwhYHoOPM
         DOnYCV5yq8kjRZvdeZg2RtDrW8mo+nIiY6JaJ6z1iPo5zA+FFzu873YKMJfF1pN4xLgM
         uQeYkElGOO/dPakQF2OuSOVZY6XwhRmbhoK0DyRmmwXjvm0HtGJ5vJxUZskqIiZTYQWA
         /N/23hYju34COSMuSiUnHqJqi8Y+ivPORW+eiID9dGScPKQ8VN7LUjp2Ugs4gnvB7BYV
         fDMRXm1uVqwZIE73X1r1U4qbPScJULt40jneKVztVvTg2+1LrACaSWnbMVHsgW5+xzS0
         Jjnw==
X-Forwarded-Encrypted: i=1; AJvYcCXfo6bUQpK3pajyhramO70ro0P6xgd+EOFfifaNzey70b7QJOWiNTWwP65UoOw65Ut5VJMdvzC6by5jSPzu@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx0K4XLoaqk5qcJc1x1gygGaWHR8MEMXTpGwNV6UqVcIxT2zxY
	0Bt8aK9ePGDABga7pdgD2Dqdr0VlSmFql4aGHCJEj+Yzq+BYDCq+77gritw5olA=
X-Google-Smtp-Source: AGHT+IHRQwOGhSkkEBtHlVJ+MZMA/jBWeUH8G5Fmi2dhuQ2z772Z0F7QMIMohuXdOiHSqhRBM4/r/w==
X-Received: by 2002:a2e:bc27:0:b0:2fb:5bd:8ff2 with SMTP id 38308e7fff4ca-2fedb7a2d4fmr5016331fa.16.1730393098676;
        Thu, 31 Oct 2024 09:44:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef3bbea1sm2684791fa.24.2024.10.31.09.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 09:44:57 -0700 (PDT)
Date: Thu, 31 Oct 2024 18:44:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 2/4] drm/nouveau/dp: Use the generic helper to
 control LTTPR transparent mode
Message-ID: <hh26gzyjhygphlrmhh2zkskoz7vezkgdepbx7fnzgfch75simf@hmr5ezp4khwi>
References: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
 <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-2-cafbb9855f40@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-2-cafbb9855f40@linaro.org>

On Thu, Oct 31, 2024 at 05:12:46PM +0200, Abel Vesa wrote:
> LTTPRs operating modes are defined by the DisplayPort standard and the
> generic framework now provides a helper to switch between them.
> So use the drm generic helper instead as it makes the code a bit cleaner.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_dp.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
> index bcda0105160f1450df855281e0d932606a5095dd..80264e6186246903fa037861fe37493646de0c6e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dp.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
> @@ -80,15 +80,12 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
>  		int nr = drm_dp_lttpr_count(outp->dp.lttpr.caps);
>  
>  		if (nr) {
> -			drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
> -						DP_PHY_REPEATER_MODE_TRANSPARENT);
> +			drm_dp_lttpr_set_transparent_mode(aux, true);
>  
>  			if (nr > 0) {
> -				ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
> -							      DP_PHY_REPEATER_MODE_NON_TRANSPARENT);
> +				ret = drm_dp_lttpr_set_transparent_mode(aux, false);
>  				if (ret != 1) {
> -					drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
> -								DP_PHY_REPEATER_MODE_TRANSPARENT);
> +					drm_dp_lttpr_set_transparent_mode(aux, true);
>  				} else {
>  					outp->dp.lttpr.nr = nr;
>  				}

Could you please extract this true-false-true dance to a new helper too?
This way Intel driver can use the simple helper, the rest of the drivers
can benefit having the common code.

> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

