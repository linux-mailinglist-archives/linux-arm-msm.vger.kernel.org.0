Return-Path: <linux-arm-msm+bounces-48958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3632DA3FB60
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 17:33:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 152201882044
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9FB1DDA24;
	Fri, 21 Feb 2025 16:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j1PtAYMQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368861ADC6F
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 16:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740155230; cv=none; b=DgPODuGNve46KrMkw8gm8okTrzbuExADsi9ykw/2gJe2KjQfbbwoFuKRNnp3DNwqgYDfBRQ80s38XsUHi+jkibfxLeLr4b24ogd5WHz0FEz2FfeUZvh1aK3RNa3pJbiso7key7xpsWxCF5lmBz0T6LfFKmexuA7PrcOSTTJL08s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740155230; c=relaxed/simple;
	bh=YGs1jvOkyQUxujqusT1Umrpr67kanG24i8Vx8K/iOac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QtHrk63S94H/b79AJDdrj6GPPazHZjlPcLB7L85mCZY7i+eWB7CrwtGHoR4yDjUYQDKHI+QzcfDtszR9W7d026xZCoWGU1OH19MC9EUDaZp9FBSenf7knijCTbZfkQeNZ6DPSsXkDURabA7g/4yAMYOCLZSAxNdcFZNsYzBggEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j1PtAYMQ; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-543e47e93a3so2612539e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 08:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740155227; x=1740760027; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RO/xULPiLg/cqk8vEEmcPFhJpvcf/cIfAW6O8KBIGk4=;
        b=j1PtAYMQZSlYvtvX/Gv5RIDeOuS2owiReqWora3Ej6Q9NkfkSx6Jj4xL3lGRe72SR7
         2oK8Lzfrnp0tfWGZFQAYiyXmnYyWcfkRiNGTMAao4Ta/Gv1YPbdecEJj+b7/6YP1gXvK
         RoW9RQ6XX+3v+7Dzei9utn/LEl9AQoxDVflQeW2BmLVY1KKbNHCkFFtdcxz1NJ1W7skm
         vd6wJWX0bwzojTP7iqfPQ4Qf+Zd/UqsrncWdhwdvo3GLBITKNSb/KZIh3k7sY1t+jk30
         Ae3J+W2e41lSXnnsQA60m4GtGHofrv8amSfKaTZfVpTgsopHxjvq58jRdJ2Y6hjza3il
         MZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740155227; x=1740760027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RO/xULPiLg/cqk8vEEmcPFhJpvcf/cIfAW6O8KBIGk4=;
        b=VmXvtUdFifIxmFVMI2Mz5tPf1kRwJfC+GxCVwi8WKBbMGVaxtE8e6ZiXskzscl6yZa
         yCwn0lSujQYhAxMlnj+zEiJA4vnzEEsn+gzWQmt32gx3WoCtuTPoIiXX0Ysf1R7hbmGh
         bRW3UPYSoUnhHjim6WDYB/jLRpP8k79TycsJpMQLYtYuZjNgRTNp0JLrB78kVxq1nZk5
         RkoOGerGWQt5VKy/b+ZE+FDQoljE76WU6umcEjzeklgiUP/vFEZa+koWnY5ab8VuHFIP
         3whdsAEUr30aEFxaQJ6vnx/DlTwRaHiHQDDkgwdZbcaCAy4dWOURCmpnvetTOLPVuRWX
         f3pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtGDm6yqqUXfd8cgcm1E9eQOtYRhrQjtf4s9YznxWVyp9GHDtPbwYwRYYciqoDXacnESruorLqkiQro8Z9@vger.kernel.org
X-Gm-Message-State: AOJu0YzwvUzLG4WugxhPY93yTOLNfsLbNN5J31FgfKz2bBLA3EEk9Sm5
	OBTdef26UxWzcyWtyIh3h1ATAHCCxc3poDxAd9pCPa6DCqtL2RRA2majcfKsSgg=
X-Gm-Gg: ASbGncv3QOYvFGsS1Y/hgBrIpsfPhy2IVu1grGEDaClmxkHVEzWvjNQ/f1pVHWi5bMi
	eBjL4xc4ssXWXhwr0z+OAbjooDV3Fm7w5mULv9lSgVt8qlNlPjq5MxnlM2TqFH+NteiLzzGF8RK
	oyRntTeb4u+DD0XiSfNxyO/H9Rw1dICS1/TIm2CvNUZezLB12ICc1r1+oLhGWBRSjRAcMsIoxr0
	hvDae3c64sfv87Ja49U5/3Rhnpz5uFNuoxPwo8xZ4/CVQR7rPFGH9ADjaQti5hBf6wOplI+s5qx
	WMz3D8dkQAMU7CEgN5OghMEh8CywHpgWO/ChNpWvfRL8pmp49d0aLCjbWMT6UxDgUjnzPgafy29
	y43HaHA==
X-Google-Smtp-Source: AGHT+IEMuaPFm2VqydkoNq2irXckzsYYhwuYOiNxJjx5gnYeCmDTClKpB1kOxjoJ7uto3x+2JhCDUw==
X-Received: by 2002:a05:6512:3e1b:b0:545:8cb:218d with SMTP id 2adb3069b0e04-54839268650mr1523943e87.41.1740155227153;
        Fri, 21 Feb 2025 08:27:07 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54531afdbdcsm1984161e87.247.2025.02.21.08.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:27:06 -0800 (PST)
Date: Fri, 21 Feb 2025 18:27:05 +0200
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
Subject: Re: [PATCH v3 20/21] drm/msm/dpu: Implement LM crossbar for v12.0 DPU
Message-ID: <vdayz63gfjnm7rwaamd36i5fbgtaedvpobuvp5u76iypdrwcsq@atgj263lo5g6>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
 <20250221-b4-sm8750-display-v3-20-3ea95b1630ea@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-b4-sm8750-display-v3-20-3ea95b1630ea@linaro.org>

On Fri, Feb 21, 2025 at 04:24:30PM +0100, Krzysztof Kozlowski wrote:
> v12.0 DPU on SM8750 comes with new LM crossbar that requires each pipe
> rectangle to be programmed separately in blend stage.  Implement support
> for this along with a new CTL_LAYER_ACTIVE register and setting the
> blend stage in layer mixer code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v3:
> 1. New patch, split from previous big DPU v12.0.
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  18 +++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |   6 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  |  27 +++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  |   9 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   | 126 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h   |  18 ++++
>  6 files changed, 201 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

