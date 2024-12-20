Return-Path: <linux-arm-msm+bounces-42900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C9F9F8BF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 06:44:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12FEA1892349
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 05:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12FB78634F;
	Fri, 20 Dec 2024 05:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wDQmR4DA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361247083C
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 05:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734673454; cv=none; b=VrEaK31sQdbJ46yFjmXwNxvjqeoCivwCrTs4Z1puTbveE6lqLhXfjIjMrlY6SCfIPXcaNCTg6qvK/i5QG1bDUvCJeo+UfMdPEbkJ/BtEaKPmpFn0Crsc8P4uziAID46YuWkvmaoQk+CgdeI6CGpVrOPJDVUBhrXz69jz7ZiwlZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734673454; c=relaxed/simple;
	bh=gDUm49D0wRprqo4eRC5Baf3VgFsH+qRupsmHs2Mrc2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wlaa2JeU/Ts2iHX8QLkFQN2VGskWLYzXv61g5MUSjLiiXSsOQRxFfnrnzbUwxGTyuChvLev0hqRCqy1Xh1LnOP8j+RWRNecpzBAfEQN1kRabLU9/qeqgUG+Ncr57rDqflEvbhiDuKs85yJBlaqOxQHx6Vzbb/iPDtFHZar7s+7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wDQmR4DA; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5401ab97206so1459175e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 21:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734673450; x=1735278250; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SFCI50HxO0YjIkrdRDdASpuN36VkzFYj3QrjgcaAwJg=;
        b=wDQmR4DAvxrLbsO2Z3KIztUX/dwcG4zEfcAJZVLMUV4VsEXtAp51IZPGuCykrQQhTc
         7utGRKZHT8Nx5t+koZlAavz5K6IKOvQnMENx2GyWY2ep+N6Bpv36deGQsj3rX5mw/5sq
         X663ZlZ8X/cYAVqIOwwezks0lC3ZBQc9frVHsIPg2c96Yl0TXiU4jAN14ExeOsSl2QrS
         S6QpurtvLyUH0bb8/REQblxBz1ekDdn0K4xG2iHgmHd3yV1FKnT1KZRY3x7L3t6BLsex
         6VJH4wrWb9xJHWOjzVtT/XFzS10yvdFppefdvVBJ/pzlXxgVw6bEvOd8WFljaKhqOU64
         WicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734673450; x=1735278250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFCI50HxO0YjIkrdRDdASpuN36VkzFYj3QrjgcaAwJg=;
        b=o0vfWNGC6rEESA0ALRpZcPlSMilN6Vc/bp6AJJ496dcdmnfBgDtjra040gIj1IYMBt
         c0cSEuMKoaETL55lD4i404sfIETE19poFOrT2uyU1ayhWUWRFelnYQxHGf04OftmrGP5
         cNABG1MHhxKvV1HpJQ49mZF7jHEkSoJ8Ht/ze+9Do2fcskjGezLhivfRiSJ7qkrGGeMO
         pGQWCtvPQSVy6RZCBP52h491WdpGhKB8pDcxeRjpzX4CARJ5arcZPE1KuyGqzzKJVpvc
         JAsTyTiqBI/rYQyDqjdRNLbpxccoISlJzF1gXq73A+tHtk/d/oo8Ar7RBILLk0znq4U7
         z1SQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHiJrSofOusjBPRqQWaGFyDXYbECSd5fF/SKXoQ39Fhlx4onBlRXN6NchSlP21rNt6RJTe8vqaMHELNJTR@vger.kernel.org
X-Gm-Message-State: AOJu0YxAiugukpe1sKtWHPdrjztp+cPSXMdLeA5nW7pI8RB3iKsQDH/g
	YIWHJlLe2Lvv91RTn/Q8AI8DAZUf54IrDnEq8Hv+j/5z4H3Ci+ja2M1KSLM/mjc=
X-Gm-Gg: ASbGncuKvSKYfw13PZeT4S60CUrHQx83/xf8CqFRa3Zer4RW3CnQ8f187iKvTr0SdAA
	6smOeWdhxGNSpM+qqC3qbHNf3dZCZOv4i+mvgQNFdrmf5ccEAgjhiuvQf9i7093YAzcLnreMYmM
	o4bi/bO9Snuc+OZIRKsSg6OHx3SfVhMN9ab6a0PGJGrGzhkJSN8Oo4BSaRwfA79491lUozQZ9P2
	Q4aFJbiBAbvRZ7ih0cvbyiiepqU5YrVrMIwloxqkuRTSBJhGsLGUGkiloapQFWQirgwfrP9QYN8
	GppowCyCaHL3PipCXP5DkA7Xso8aOCM43oHc
X-Google-Smtp-Source: AGHT+IG1bm19MGRUcfrW96Z6d6TtKC4b/8GqwGpE6HtAltw9S1z+lUZCzMntZDup7UjIvLEdtD1Wjw==
X-Received: by 2002:a05:6512:334e:b0:542:218a:343 with SMTP id 2adb3069b0e04-542295989femr303192e87.52.1734673450312;
        Thu, 19 Dec 2024 21:44:10 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238215f2sm377633e87.199.2024.12.19.21.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 21:44:09 -0800 (PST)
Date: Fri, 20 Dec 2024 07:44:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
	quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 17/25] drm/msm/dpu: Fail atomic_check if CWB and CDM
 are enabled
Message-ID: <qpy3yjnrq7ljsj7a2b2avbnd6cptyfr6vzxhm733dyaiso5lwg@txhr5zwjqtt7>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-17-fe220297a7f0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-concurrent-wb-v4-17-fe220297a7f0@quicinc.com>

On Mon, Dec 16, 2024 at 04:43:28PM -0800, Jessica Zhang wrote:
> We cannot support both CWB and CDM simultaneously as this would require
> 2 CDM blocks and currently our hardware only supports 1 CDM block at
> most.

Why would CWB require a second CDM block? I think that YUV output over
DP (needs_cdm = true) and RGB output over WB (cwb_enabled = true) should
work. Am I wrong?

> 
> Thus return an error if both CWB and CDM are enabled.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 9bb920d28bae2706b3892c167fe2bec3fd8857f4..a6372eee916e8aba702bbefc3615d8882ddcaad9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1261,6 +1261,10 @@ static int dpu_crtc_assign_resources(struct drm_crtc *crtc, struct drm_crtc_stat
>  		return 0;
>  
>  	topology = dpu_crtc_get_topology(crtc, dpu_kms, crtc_state);
> +
> +	if (topology.cwb_enabled && topology.needs_cdm)
> +		return -EINVAL;
> +
>  	ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
>  			     crtc, &topology);
>  	if (ret)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

