Return-Path: <linux-arm-msm+bounces-32370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 965C2984ECF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 01:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C71EC1C20E2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 23:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B944D15D5B7;
	Tue, 24 Sep 2024 23:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GgPI6o6o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA90E101DE
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 23:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727219857; cv=none; b=XUTqfrKS4iUO4fCtW3PcT+0Xb1FlIDl8akyeyEio3sIk9QRAClMC/4FxLHsKe1O8jCFo5CJ9EpI1CDak7eR00OW+mphAKDrVPL0pX59xTRTYpaoNqdnfbT8T9WjTxevL+uxo7SYprpDN5yhG0ifdECVMLRPfI5RgP9NqaUCGuZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727219857; c=relaxed/simple;
	bh=G63j1DY8HlwU4Tu1xMylD5RZKaHo6qN0VNLoEGsZKfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hLuqyUcHIjgd867IoQme/MVa//PomWlCov2WI3NO3kAIJezMcVU582Hf1auYljJwvdmyGizbCkK+dH/P1k4E13cJyc4sHuUHbo4B5Ed+326f2j9EW26Mq4QBKn9YCWBiecJATYw/TPzakU++5bG4Y3S8EHuiICAe5pHlDoqq4N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GgPI6o6o; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f75d044201so3688341fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 16:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727219853; x=1727824653; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kbz0tfiyQQErgbHsvyLtv8eq56ZM6ZrFXgSGtiFWYMA=;
        b=GgPI6o6o555ZHP0gu7H1gPxejg204q6xkrLJ/NpVs3WsLfCNr00+Iseyn6fMItjLlq
         0guTLWyFIt+OFdJh5S8hfiDhJQH0Js9bnVm6Wn1AReOITmBFLUc+nGiXJnN6IL5SDGei
         x49z5TlHmDbq8ZteoOyfciIBC9R5YbDGJTK0V5b/1XpNCDebCdNj5tW4btLGcnYWUtmx
         NS4qmI1D2m77v1N7Vx4q5okWCCO4CLTecBvDymSMkgpJ7FK/epuUEGriF5jZYfCWOgjL
         PSVY7KTSC9ZpAhTH4Mxb7K6WcSVqtrlcfL0HuIXJB9CKiML4r32o4oTSOTOgLGFNftzi
         SoAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727219853; x=1727824653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kbz0tfiyQQErgbHsvyLtv8eq56ZM6ZrFXgSGtiFWYMA=;
        b=Qg8hOKOzDWycHQnYebkfr4ZKL0km26Xgpo0qaPf6TZQiydHe9wfugxTUMUlAe6CXzx
         4JFaZsOJo2MrkGjdXcuzBfw3gVDfX2gODLpmUwItoJZNLdx6OpTUa7esKiZQim7uKkKZ
         Y/3zTihPL4TcB9SzWm8D4gvWFjx0aduN9kv5XqurF70laHopV+C7q6qHymMaAKrRp/S3
         giJ3bdCg2iLVdbFG/2f+inaGlABHDjNbGzj6szp4rFvdTJ2viXo2bfOjcBWBJtYtAaCT
         78HjV7WFU2zAL89bNg10EOfoo+Ki3aFvil1s7xMFxhMsh6CCfuyWG0PJR0HFY6BPwJ2/
         COTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeqGq7rWwELBttmVAyhJidouc9fBuLgQcLFOav85OQWMLUUz+sCadv+qQx6un9ruRF/MkbwW/X//dE3DJs@vger.kernel.org
X-Gm-Message-State: AOJu0YyTfxZCSz+j0rOaH+wgE2SUwk8chDWH0b3cP2rWHDsRsP615/Sv
	R5SXWeWNDjPOycV4D0sMRxMmt+CUaCaGuR2C+N561MDEn0Xegs43DM37wa0xWSg=
X-Google-Smtp-Source: AGHT+IEsDQBs1xHo+RHBnCa4F/NIYf+HbT4i9F6SK/oR1mhFSOVGTHMoA9OotkQDZtlvONDTI/XaLA==
X-Received: by 2002:a2e:f11:0:b0:2f3:f1cf:5314 with SMTP id 38308e7fff4ca-2f94d763343mr2025561fa.10.1727219852780;
        Tue, 24 Sep 2024 16:17:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f8d289ef2dsm3436881fa.124.2024.09.24.16.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 16:17:31 -0700 (PDT)
Date: Wed, 25 Sep 2024 02:17:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 08/22] drm/msm/dpu: Specify dedicated CWB pingpong
 blocks
Message-ID: <l5lfx7psxi3xmkgu3woea55txan4ib7kmvaix3h5b7q3fz43nl@r7umftxolsgq>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-8-7849f900e863@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-concurrent-wb-v2-8-7849f900e863@quicinc.com>

On Tue, Sep 24, 2024 at 03:59:24PM GMT, Jessica Zhang wrote:
> Change pingpong index and names to distinguish between general use
> pingpong blocks and pingpong blocks dedicated for concurrent writeback
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 8 ++++----
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h              | 8 ++++----
>  5 files changed, 14 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

