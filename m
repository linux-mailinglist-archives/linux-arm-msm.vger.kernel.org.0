Return-Path: <linux-arm-msm+bounces-48957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B32E0A3FB57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 17:32:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA776189F9ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADFDA1DF73A;
	Fri, 21 Feb 2025 16:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WH0rQvea"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C781A1D798E
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 16:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740155183; cv=none; b=njLp2CXtfmbhBATDUcQysjdV37a3N7TImUIBwrwauT1czfOSAMHlxGWeR0O60SvJw0mAiWMEscyEHU+ZulnyMFyaAJcv7Bdw9yUvp5Zysae/RxMLt7tvGxkaBXGXckM0bTDE2gPeQzGXzIG/n8qWTUvQ56KNYfyaYsnHIYQEmR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740155183; c=relaxed/simple;
	bh=sUJGDV0444vBYzd10XMCRP2yozVGS5BHshZAiO3ClcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YcffgRAmr+1awbcGJAJckWTWL/0FG60alPHv3Ccmw1WpYbYBM0p+OuZ2q5SjsLvd+fMWcbtH4Zgf4R9errlE0ONKTfF7oGrihIiP6r3HGLt9cG/vB56S8zYyoJeFTjxkmYt65hh8SnI2iQI6HXNE6hHBY/vuGTqVM+WDnu6XH68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WH0rQvea; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-543e47e93a3so2611619e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 08:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740155180; x=1740759980; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xjL5HnyHIkjOW/V091xA7OYPeED0xOIXslkPMlUBUug=;
        b=WH0rQveaqBoIBU8Y+UcS00X+xyibjRIPzhiLQnFS2+lnsZiUm7flhIFJoObLlei5q3
         IjdQ5HWZbIoc2R2GjZCCJtqLoFEZ9AMIXPwz7VK8EJZBRoafwBcIQbnpfDQR9cD8W+qz
         +rffsymLzxC9+uFObFdq+/i60sNPSm2BAoZ+kaIPklnZXSSuSXE0Ugg6JZkUJDKZJyDR
         Uu9V+jbTjKRBvbhIgecfyXg+fk2QSOyj+0LkU75rLC4iil9iB8bUcLONHQtuid92xCQD
         fkWqdqx/gflamomxA8D87anYSJpXF9j+BnmLEwyd2mhmM/F5yI8bCVN3yEQkZi3EatKl
         GTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740155180; x=1740759980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjL5HnyHIkjOW/V091xA7OYPeED0xOIXslkPMlUBUug=;
        b=vR+APPYoyRFa5tSEl08+WuWCPnOka/PSDmqecTrefls71CWoZuWP/GyYSXq1TDzZfW
         0+b5V4v4D/7S7JK3pi7p+5GJ0iQl3PsRtJmgLL/wvHnqX+Lpf1o0nPbTJbWUSPWURY3h
         6LX7ZOBzoH+EvhXEHsE8pVW2ydSX0zkYn+s4HTcp2DIy95rW6ldxfcNntYD6prF/783S
         YDKqM96zstn9QGcuED25bUioy0S238tfDHhS7sMyMH717FHVe6BiuPyzOpKQVsntB4lh
         IdqAz0OvPoRZlasUwg6bTPP8rfUr05Y9wteHj47gog4RTOBLhStMqWfQYFGHyy3SuY7i
         2tqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWApZXc6t5DhEN8Q7X3QyV79/hCxCBg2Y2ekQnUyoyLaC6VOJpVS+2RQro7CHBCfjDSII3aV8b/44CbO2fc@vger.kernel.org
X-Gm-Message-State: AOJu0Yzow6i47pYD4iwADUfxuMrNwmJrOKMQknWQ2MHKF+1MZQ5d5RFA
	ilidelxSiVwdMvfxrF4WQWoWiRbKLK4SxqxvaC85of+QAnCabewJ15yXia5R4uQ=
X-Gm-Gg: ASbGncvZFjUiJR9Otnb34Zlay+N5/4ds3uS3RkS3WCtxx6JmQ1iEPw8bnFhEy3alAzO
	jZW9sqM6MPo59SXjz998p7hi/ELaS4NlL7H6PKHk/b/X5GlEyDkvZHTAqzkx6Qhd6z94h6wOktu
	fGjDux5phIR7DPWV5E855DRCpyCuA7lIgdqCV7vsDxB0z66dp9yEKKw4wNbRoNpJbb7nZd52qcG
	afwr4BXONh0JCe9qlI0XcCeilqhG07JqPPxB1iobEvm/cll6nqEP7fo+CCPN7mTXUN5rspuxTCo
	lmJdwvip+i6giVdSqATtqBcGdQJ3wfVWPhRnV0dhP4WRYNbVrqKKMxgobVTjtUBnsAemNhdoTqt
	TDplY/A==
X-Google-Smtp-Source: AGHT+IGFPBqQwJN5a48M/xNQBTDNxvZTEjIAW3PFsBL+6h3O4OdEk1slnuoUOVeOHEYt968uLpwuBg==
X-Received: by 2002:a05:6512:31cf:b0:545:a5e:b4ef with SMTP id 2adb3069b0e04-5483913ae13mr1829559e87.16.1740155179895;
        Fri, 21 Feb 2025 08:26:19 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30921a593f6sm25579171fa.65.2025.02.21.08.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:26:18 -0800 (PST)
Date: Fri, 21 Feb 2025 18:26:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v3 19/21] drm/msm/dpu: Implement CTL_PIPE_ACTIVE for
 v12.0 DPU
Message-ID: <5rlcxx7pcu32hz3r4qufqcq2jzk2z4g2ep7reecpm2kksttwyi@66p2u4nwfzx6>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
 <20250221-b4-sm8750-display-v3-19-3ea95b1630ea@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-b4-sm8750-display-v3-19-3ea95b1630ea@linaro.org>

On Fri, Feb 21, 2025 at 04:24:29PM +0100, Krzysztof Kozlowski wrote:
> v12.0 DPU on SM8750 comes with new CTL_PIPE_ACTIVE register for
> selective activation of pipes, which replaces earlier
> dpu_hw_ctl_setup_blendstage() code path for newer devices.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v3:
> 1. New patch, split from previous big DPU v12.0.
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  9 +++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  3 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  | 29 +++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  |  8 ++++++++
>  4 files changed, 47 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Minot nit below

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 43a254cf57da571e2ec8aad38028477652f9283c..3e0bdd1100ebb0d302a852ceeaf8af86835e69a1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -40,6 +40,7 @@
>  #define   CTL_INTF_FLUSH                0x110
>  #define   CTL_CDM_FLUSH                0x114
>  #define   CTL_PERIPH_FLUSH              0x128
> +#define   CTL_PIPE_ACTIVE               0x12C

lowercase hex, please.

>  #define   CTL_INTF_MASTER               0x134
>  #define   CTL_DSPP_n_FLUSH(n)           ((0x13C) + ((n) * 4))
>  

-- 
With best wishes
Dmitry

