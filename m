Return-Path: <linux-arm-msm+bounces-47065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A10FFA2B766
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 01:58:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1ED743A6FC3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 00:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8D131A89;
	Fri,  7 Feb 2025 00:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mTCiW6xh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3B822EE5
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Feb 2025 00:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738889881; cv=none; b=FVEFXAZ3yvSn4xfwEAs3HDsdHJJvDtLRQhicTxMAWIwnFqzeLdzSiKAq+alZDN3hT/B2xx5E8nCzHW939p9y7veNJZSx2+fsq8fnRlNvW5zqCOC7nqET/nrm4hby6QCmRr1XESJjzXvhfpa4sXXxkIUsyqerw0HyVaz2iEO187Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738889881; c=relaxed/simple;
	bh=DyRPOhqc4W2rMI3vNL/F2NkcghrCHGEoKNEPy44TDh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wl/REjCXWLUFWq6Le9MPX0egl2ypMFVR4BU4XgsNmnQn8FiL6m45nCTn3BdcbmeW6KM5tEOCZJ4oiiAF0YC/5S1S4rg3xtTFwqcmn2ORmtmuqgAYC3rcm7yB1VxrF21gHpZnvFtt3hyRApnXaxEZW55GPDkD2FcLC3AoQ4f51m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mTCiW6xh; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54021daa6cbso1669568e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2025 16:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738889877; x=1739494677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ug1cHKYkHOI5SE4G5i310J6mOL4B8HpmJ/dr1AHs9PU=;
        b=mTCiW6xhCcD4HDlI019EajX1wDPzZuiFOLYxUj9PmWSqN2Bp3fuQZibpM6qbQ9m0u0
         k8/KZgCRgriw7m6+c67Xk1DpkpVW51dX2msULfaRbohvBZm+BTDL+skvdUONAxmTdO2V
         pO2kpHF7eYMFHpxnBG+IczW9WgiLbf1ZhoyPf29nVItZHWF6gTxgiwkvGcL9t5GnE0h0
         yUPUUqKSWz9tZJA7ukfJf1KKaawLN+FP02XMOz6nkiD/pbORxLt8LhIjbySfO3c33vOY
         0MnSkZNPGrjLzALMmZKUXEIJiijZ/MtlA8LX7jXVzfemK8vdl29EjvJrfhjBa/3XGPSk
         wUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738889877; x=1739494677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ug1cHKYkHOI5SE4G5i310J6mOL4B8HpmJ/dr1AHs9PU=;
        b=PwCITch7ZlO4YoK5Jv/VlQAfjwI1+mKmE4twlVbh7XFa533sUWRLF08kq1m53ySE7b
         jmYvn9+RITCQLDLqgVoIPADFLKmMZKA3YQW56yCVbizhi3kpckOhT0mmYIRNdjPCWtcX
         pC9Ej/ImDcTlIlzEdN0p6ZdHzuPCARGiM3lk4reLjurgRXnpeq3J78w7iwK1qvY9ER70
         Iq7AbE2coWXKrmsdl16R7XqbnUSORto1m9wCIWC7xEKhToY/wMgMxYS73FrNUYK1tP8k
         BVlPg0tqKGHaI3QVBUT+ImmHTg0wEa5Jw4HGxRqQEPVM2/Z+xl5ey7f6tWgt528p1eJi
         r5oA==
X-Forwarded-Encrypted: i=1; AJvYcCXy/MvA1UaGWIEPxZslGtzH9rimWM/1Q0JHN9CR+hZAALowK4bZ9SYjbIzoThedUrK5Zi05kKzcroRM+wVi@vger.kernel.org
X-Gm-Message-State: AOJu0YxPVftKQI8zZYA0yVNw8QhxSo4hwNg5F/YwhjlDrxp3fDl/EKn/
	Aw0QU3AweQZfTrAamZVyLAANRaTxpy5dlsK9SampIf4dSm6YSCfizj8LSnJ0lF0=
X-Gm-Gg: ASbGncsL4DAe7CTEaphJgVIGjDdqFH2y4Wreu3yOOexEZVj5xPy1lIOzlEWp4FEQnH4
	aiIpg7tDYilMRqEXcCx3FE1OZIqd5YNPxr15cGN8xEdCC0JjEFGozCIERLwbhqcRX0IHn1NQFcv
	oidTE6QFzvGSnBO22rYg4/38PbPfip33uMh70u2SxQx3lFqiA6uQx/0ZLlvHhGrSo7GI0eBuRhc
	yUUstL3UC9M1WXZ7CZZgvt/fhcDAeD9px5H/Kzj6VPZy5a+bA+qD+zHS05IANsm//YMYcY0bV/M
	lJ1/DF8JWLAI2RhuxHoO0Pg1uR8tXMgI+Uuc47XiK0royhOlJrJ0pv+3IsynhBTbH+Epou4=
X-Google-Smtp-Source: AGHT+IGx2wRNt1b93pnywaXmYh85b7plMQz/H56Gv8K9JriphvzOJ7iTLmi1YOxkbvURlnH6S1mo4g==
X-Received: by 2002:a05:6512:b8a:b0:540:1e7e:ca80 with SMTP id 2adb3069b0e04-54414aa87f8mr253956e87.30.1738889877278;
        Thu, 06 Feb 2025 16:57:57 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54410555751sm279982e87.85.2025.02.06.16.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 16:57:56 -0800 (PST)
Date: Fri, 7 Feb 2025 02:57:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Stephen Boyd <swboyd@chromium.org>, Paloma Arellano <quic_parellan@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dp: account for widebus and yuv420 during
 mode validation
Message-ID: <yjpb5byscw7tfy2zz676j42uwavnn6rjszn7sag6mqietq3i3a@fdynfqqolvwe>
References: <20250206-dp-widebus-fix-v2-1-cb89a0313286@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-dp-widebus-fix-v2-1-cb89a0313286@quicinc.com>

On Thu, Feb 06, 2025 at 11:46:36AM -0800, Abhinav Kumar wrote:
> Widebus allows the DP controller to operate in 2 pixel per clock mode.
> The mode validation logic validates the mode->clock against the max
> DP pixel clock. However the max DP pixel clock limit assumes widebus
> is already enabled. Adjust the mode validation logic to only compare
> the adjusted pixel clock which accounts for widebus against the max DP
> pixel clock. Also fix the mode validation logic for YUV420 modes as in
> that case as well, only half the pixel clock is needed.
> 
> Fixes: 757a2f36ab09 ("drm/msm/dp: enable widebus feature for display port")
> Fixes: 6db6e5606576 ("drm/msm/dp: change clock related programming for YUV420 over DP")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> Changes in v2:
> - move msm_dp_wide_bus_available() to the next line
> - Link to v1: https://lore.kernel.org/r/20250128-dp-widebus-fix-v1-1-b66d2265596b@quicinc.com
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 11 ++++++-----
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  5 ++++-
>  2 files changed, 10 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

