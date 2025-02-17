Return-Path: <linux-arm-msm+bounces-48275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A0EA38BFC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 20:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 192897A37AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 19:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A648A236A66;
	Mon, 17 Feb 2025 19:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X6rpn9R4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63A4235BFF
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 19:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739819273; cv=none; b=FNCFLloIYOp3hVyRL8YpqTKyDyz4mrTvdSVcmxJ+32f7Kf7ZlrVKt2IN35Zowe52XE5b1Wv5uZMmB0krolxddkp8dvZ1jAk9/ldLi0mRytO3haMmzLWeuAS7EPDk+VHupE3HVkpQ47XQ0X46JFCViJ/rnUUP1tts8WeXgroAp1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739819273; c=relaxed/simple;
	bh=wDoCAtbEmJJG08E/A5bz+I3lGd68ANOK5k7c8qV1X0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=la+cOMi9WuhPafgKB+ayk7hXPrjLmKUF1KRiXJaw6SVnDBgMY7Q3y9FTr1Gc7b7fkLITwDdSRfK5lqixeKIzhv/s8qan6ziNJEYZLs4i9o/IYyCMVjZD8vUR2z9qeJJG+SSQoBTDzZH4WmiVM9/+OIB+DapThVqfFMrZkkHvC4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X6rpn9R4; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5461dab4bfdso1852766e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 11:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739819270; x=1740424070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9ObUne2yQMezeKiKaLoIvFCZpEHW3DUQ78CPgFXgb8A=;
        b=X6rpn9R49Vjpq0jaVvzteTRrIWYheZIL/LVbS2UfB9zQ8pi8rDFoC6JSqktjY+IFp4
         Luy71uKLqapYzFcqzFK0q7B+bxis4X4hyiWXPkcIfsflB3umIUnlU23i51mFiFRtI5vC
         pg8b17ivlV5CuxArz7DHTg+TSYdp/NXGCqvhB2gIJEmyFxVGRNHvJihkT1pDWpS8xYTq
         EuzkXE89kusFktslV+Sl04CPAgLmKxiKTq+Kbf9JYUjsWERTgQnJmoUgc8RVr1MoVX5X
         maqDs5+jjBI0BeFXL3QRG4ox1McyvqV2oryOh9ElOorijK7UOs+XSBQi0X8QeYUXbmRo
         ZnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739819270; x=1740424070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ObUne2yQMezeKiKaLoIvFCZpEHW3DUQ78CPgFXgb8A=;
        b=TMF/GL79FY3Zut8O2hMSkBS48MRWfacV7bgYQv/VcnTL9M+vwxCRR62Vzt60Av/BqQ
         XTDqHrZm/PXopWsz4Cns3//ppcwSz11zcJh8w76mU2c8+h7lKvta/9HlQFEAB5bAYkuH
         XkzOFjBbDekDpaQIPBVNZdnPlM6hQqWXyVjly1RQXCpAflneoOcHAAmB/MU/ZitTiPhY
         kZUDJ8DI2y01hX5x4Kvbgn6F35oEJcKIUYpS0E0hwLF4184w6MoHpqfukJjVh6pZ5O13
         WfvHPNg4HJFovYAHF6E52li9tHYeVPj9KXku7nyrAAuFRjGOO2Jr4XQYtEniBC9Gmcvi
         gOcw==
X-Forwarded-Encrypted: i=1; AJvYcCVZ6EcMhU0Ls1Bzp4k2RenNDLxeQN5LZ4l5EvLALNFXd+9yP5134juXtl9iBZJaxkiBDLoG42u/JCwEcc+Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3qMrfnDAQSoVt2SKwbY8EO4qPPu2a2CXlys1wcLUZjT2Iehho
	4mS4mycVyVGGS6HHFgx2FYwK1f8MIhxSWDpHW5Lc1zxnUQh9DDVuipxmv+HZ9KE=
X-Gm-Gg: ASbGncuZ5aJ0AKuL1HQfmvIPklxk76rdWdoOGTCvK1TyP2SU8apJ/hS7SChWAX8w0Ua
	8PmJGfG/sjWQ/0uSi1T+t8a25vRhKVVCMCevcWzKafY/Xq3PoFHU7ZDt25cChvdkb7xPPgkohuA
	9xL7wdxSloPkvj8XQdmCFDsgNfz0YDpIWuG1VnfQZFv4qOPF8b50/B5mT5QFy3O9QNGw5Q/7dPp
	cbrPtFPKSdIMTEZE0GPDPgTvWV4g0Q7tP3kIPq41waA98945OQ+yBTI0jApfGqjPyWix+a1z4Sn
	ARLMt5+LfeWtg99zs8ZWceHpVkaVIvQKeTqm7dkXi/tSwsT8GoEgX+E1qAZska26rpsHyyY=
X-Google-Smtp-Source: AGHT+IG9DynPxWNwdOmU6ii3AvcgWu++/3DPvh1LUYd7jp9CBTvIMdEBiRwbV324OAhQ4qab/et7NQ==
X-Received: by 2002:a05:6512:308b:b0:545:25c6:d6f5 with SMTP id 2adb3069b0e04-5452fe96673mr2812097e87.53.1739819269896;
        Mon, 17 Feb 2025 11:07:49 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5461ee8341fsm612141e87.133.2025.02.17.11.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 11:07:48 -0800 (PST)
Date: Mon, 17 Feb 2025 21:07:46 +0200
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
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 13/16] drm/msm/dpu: Add support for SM8750
Message-ID: <qfbynkd3d5uqlzcgvcsfoi3muoij4ap3kkkwug5yd3ggxbhiic@6epod27ux5ai>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-13-d201dcdda6a4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-13-d201dcdda6a4@linaro.org>

On Mon, Feb 17, 2025 at 05:41:34PM +0100, Krzysztof Kozlowski wrote:
> Add DPU version v12.0 support for the Qualcomm SM8750 platform.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Add CDM
> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    | 496 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  29 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 527 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

