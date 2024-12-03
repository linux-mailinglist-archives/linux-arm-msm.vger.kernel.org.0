Return-Path: <linux-arm-msm+bounces-40096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C3F9E1E48
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 14:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 483E716694D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 13:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B6FE1EF0AA;
	Tue,  3 Dec 2024 13:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j4OUOuw6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7FC1EE01F
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 13:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733234028; cv=none; b=GmVa1PARzQ9uLSk+6HpHPofD3n6JoqhaJKYdl3Zq9FTwpCH/fKuVSvOnNrzKB5xSEx3X9dXsvWGaRkq0HQuU2B82n2IOp4PLWqPtHYOuzT3orXQjbRlfnj5jY1Ba/cHpzZy9wl/ir3G2ND6ogDtKRu6B3xXugpufgEeCfsYp9yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733234028; c=relaxed/simple;
	bh=DA64ehn//zeTBKlYUQ53cR41weimzLlJQgddArr3+Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XmbTZy/YhDmmyenb39IDrGMDoQFucm434+HoNTM1zHH0gAKS+rERpjq/S8RCKDjWarQM3xRZlYE0ru8LBdnlv88qUN3WlIv5rPT2kJZfugBtm2UtsxFyrGxPsKUZVh9FeLkk63Cxcn0c+/A+GF5nCNh5CldeKehiYDHFv3qpp7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j4OUOuw6; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53df6322ea7so9588964e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 05:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733234024; x=1733838824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2z7Lw9AnAApn3+Fq4NPDiMReJ0TWjBn2iXkUvuhnlA=;
        b=j4OUOuw6duTfN/eDMorKluh8guvV1BtfjVRivZVJqiEOKj8gfJUZw1Ix45tOzOwBZ8
         Hjqkxku6j5inK/22XtRiwf6eAS4EEIXzEihxd9quE5xcxkKwjoUtOXMtprX69wM7C5MT
         XrpmXQQELPfk3X7uFT3UrSiqG+M+VqRaP0/49mMnVZVEHXANdibShwnatuxUnGn7ijwM
         dRE/FbaMh6nWNPBfKZ/VYDRg2QHsx3xQ/gCLNzNw8GwvBOKaicpwPX39Rkf02p3g3Ig1
         MtQBbHLZL2XEB6IkmzRg7jp8ucwok/OoB1GwHUzUkdEzVgwuzhp/s97LWLUxy7/x0PJf
         hh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733234024; x=1733838824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2z7Lw9AnAApn3+Fq4NPDiMReJ0TWjBn2iXkUvuhnlA=;
        b=FuHG9OjQwz1vawGP7mVV4AH3MAp8QnwkCqmqmKq95TWUYj9q8jV6P9uoy7aiYA1nMI
         x+UAM3PpBOPYOpGQ51PIqd2sKGmiFGGbyhJT73TSQgYqJ3KvsMeIWcDkl/AzMev0HIGl
         GTntYO+OVOh9/ObSpihm1+SGLj1sYi7LlRgySkAlUTd5Wn7Z2SOx7yxPS4hntLyAogCD
         1DYOGaL2wVzsM9Zf4k8LT+JfSYMN68J6bx2fdIBxKgZMAOo2a6o9cVcupBYMh7qzaDs9
         mmW5GcZrO2nps7LqzwnitykQfE/nEXCTbX4nVT8EsApQ/Urli4rvbJMk/v8JFJ5LQhBX
         +9rA==
X-Forwarded-Encrypted: i=1; AJvYcCWK9BBIJsU7Nid1nLdUIYkMHICCRplYyS5NeGTTFpWrhc7IeG4I8bVmQO1NW8W3QR/dR3TglNZkOynlIx3u@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2yaCkQyW/tjXM6Lj6bVRTDNY7D7qgAJljLhY12Vb/gIfTxR6z
	VKT5Gmgp5jlTjv5JPq2yXQwBm3JLeE/Kocwi1rqBpQROe1BTWf8MojfWvV2v8o8=
X-Gm-Gg: ASbGncu3zSNvGgYYlPscV5y1W5WheQ1OUPZR/ZCVkE9U/nUv0K0jiCTgeza1/tkAARK
	NJI12DugXYMpykYvIt+deX2fEcB5rHiyFtpNTyTg2pz6Rv4oGHuA5GWQu9OaklyVZSvwijgDI7S
	oEskeJgIN3ISshENPOSkUkTT6Dx4rplVHaF86GYgewjEOsVsRli1MFETzQeF4Q2fHVDOVAhLifD
	LPO0M5E+bqF05VSFucyXxypENFVQL9CUsMqAk/tUuKMDbJRpgCOgWob3qab8wpYPSzRsT4f/d50
	SlJXGih+c8aXN6O3pCV5zkIGUwu5ZQ==
X-Google-Smtp-Source: AGHT+IGIVJilF847DUoQ5IIjS97Q02Ms+T6DT7oFUW5dd74axuuCY4gvMyDsqnLd1Arq5x+/ERo8Kw==
X-Received: by 2002:a05:6512:b14:b0:53d:e7b6:c701 with SMTP id 2adb3069b0e04-53e12a06d37mr2329892e87.33.1733234024535;
        Tue, 03 Dec 2024 05:53:44 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e0d4dff67sm562441e87.10.2024.12.03.05.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:53:44 -0800 (PST)
Date: Tue, 3 Dec 2024 15:53:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>, 
	Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 3/4] drm/msm/dp: replace ST_DISPLAY_OFF with power_on in
 msm_dp_hpd_unplug_handle()
Message-ID: <lcr5i4s7it5goppdi5at6jplnrvb5xl4cmv22n5jtjdnlbda43@54z7afarengg>
References: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
 <20241202-hpd_display_off-v1-3-8d0551847753@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-hpd_display_off-v1-3-8d0551847753@quicinc.com>

On Mon, Dec 02, 2024 at 04:39:02PM -0800, Abhinav Kumar wrote:
> msm_dp_hpd_unplug_handle() checks if the display was already disabled and if
> so does not transition to ST_DISCONNECT_PENDING state and goes directly to
> ST_DISCONNECTED. The same result can be achieved with the !power_on check.
> 
> Replace ST_DISPLAY_OFF with !power_on to achieve the same outcome.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

