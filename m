Return-Path: <linux-arm-msm+bounces-26092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9C29307F7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jul 2024 00:56:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 245F4281230
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jul 2024 22:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C342B14EC58;
	Sat, 13 Jul 2024 22:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sFbAZW2J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BC514B078
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jul 2024 22:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720911339; cv=none; b=VM4CXyCgW7ANv91FS3xHZJ/LDaTzRuOJkircifCDk67Mvlss3/6GoqbbWvQynu2Q2zOtzPUZjqS81q46D3FZ9ZYZuFZ9FFp4MgQDDKU95FLMzqYqT/QWFBjer5CowCywJmW2vipgwi8svArRvBAUm0uHdcvAyduQKWX4znyoyzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720911339; c=relaxed/simple;
	bh=OaF95Y3KK01YXpum7eYHBcI3ryjO8sJWgVjZqJgDRPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0F4I0ZrOHaX13RFLX4onsTVlU7l2kd92auaUpXKt27lLrb3aoo+sYXzDJhhNrvp6U7Xb4wq+i2QxVQ1WdOu4ZQ6P9gZx/2jwAxuWKHfk8FZAydXVCPQv/dbTbZQZSzXW2lS/+FByxevdBI4/4vvdhTMvHmWVjtCQiAqNGjgwDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sFbAZW2J; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52ea0f18500so3150955e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jul 2024 15:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720911336; x=1721516136; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1ncYPX+7Asq9PPYrO1DJYNdoPMBQuM8Zo8xSB8y/YwE=;
        b=sFbAZW2Jr+Q3eEEyWpaX55Lbe7JAysZvvFCG2ZIPF2QAxkHBQVyrpMb/cw+cV3rvWC
         ccEi6QoHisrwu1fsPhTDriqIpLcFa7YMqW3BlL2FvUKK/SLMd/UKYtOFA4WZPi3Ck7PG
         Ty+MgcRYLinOGo8uQLchhkDIcVLrK3S2zRuj7u4ZNN/sUjzkYkVJ9l6ES1lnHunKOlzn
         7iQ1PbsK44IJ/q5XwyCxtZ1sQ3zuO8aIa5ka5NLJ4u6vAqwPI92Lu8AIi2ZHetdP43wp
         h6+9m0iidDIFfTrPOYcZHCVHXsF7RZCEhqs/oRorgh6edJIqiCmQ+kHU3pp1pphEdl7c
         JRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720911336; x=1721516136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ncYPX+7Asq9PPYrO1DJYNdoPMBQuM8Zo8xSB8y/YwE=;
        b=X3RUP2ccc2TBnq5DrEi5Bv7LQwlEzB74fO+GQhwHrROQzL6fCruvK93zEpDxgFppzd
         xGOMP3IzOvavHBpn4CLp2DnBe0ioxTRHMqHz1yjyQKI+zCt18zfaJES8Q6ru0KwFvlN/
         Y5x6uOP3+F6DNJFqx00kx6VQDu6cPgVCe2EeGlYq7xq+7xxKh++K08rBQHjZs2xhrtUq
         gLOR5rNGiGfSfVWJtaiGbHhCNIi9lxcndn0yJq6Uw9Nkgg/o8XSDVLsrwgTdDAM8pzam
         CkBCkLDBSCZgK+X4zdBXcoWG9sEO0GtB51m+J8GG7rZfYbXZ9TWXBiEwiKx9b4z2SrWK
         8vkA==
X-Forwarded-Encrypted: i=1; AJvYcCVirpsYwP6ntw5QVtWOnvNJTuJnnFLXmwFCgftJvojopNpjTkGOTCMnpGFWfSnE1xm+CHWaKz9D1vU+SNV7b2uoYf1Jh8X2hFgVcGgUDg==
X-Gm-Message-State: AOJu0Ywn57AL4qPF7b+YfdyXNtP+O2BiG8v+0gs5ZWwjbH1qqp0/vvd1
	v66iO2aZj08sYpDs5MyqNM+AQxiuJWtFjCU41CrecxzmhTVVVSfIj9L7M+LnZ8g=
X-Google-Smtp-Source: AGHT+IEhwHVC3K0rEjJohPz1JS1RmLGBZWld5R1IufdJk0BRYdLg0pMSt+FKcRLiIV3Hgn5icbbQ6Q==
X-Received: by 2002:a05:6512:1384:b0:52e:be1f:bf7f with SMTP id 2adb3069b0e04-52ebe1fbfd5mr7917903e87.27.1720911334977;
        Sat, 13 Jul 2024 15:55:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed252d543sm308907e87.155.2024.07.13.15.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jul 2024 15:55:34 -0700 (PDT)
Date: Sun, 14 Jul 2024 01:55:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, swboyd@chromium.org, dianders@chromium.org, 
	neil.armstrong@linaro.org, andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: enable widebus on all relevant chipsets
Message-ID: <xmkcy7xjoaodxnyzbskjb7y5xne444qx4jdrtcgoqwh45aqjn2@4rnbkhr5uuby>
References: <20240711224850.1672662-1-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711224850.1672662-1-quic_abhinavk@quicinc.com>

On Thu, Jul 11, 2024 at 03:48:50PM GMT, Abhinav Kumar wrote:
> Hardware document indicates that widebus is recommended on DP on all
> MDSS chipsets starting version 5.x.x and above.
> 
> Follow the guideline and mark widebus support on all relevant
> chipsets for DP.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Although it doesn't seem to fix the 4k screen corruption, I think it's
still a proper patch (and we should be following hardware
documentation).

With the Fixes tags in place:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

