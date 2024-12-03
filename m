Return-Path: <linux-arm-msm+bounces-40086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2089E1E17
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 14:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 681B4161112
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 13:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25091B395E;
	Tue,  3 Dec 2024 13:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fv2sSowq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E791EE024
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 13:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733233540; cv=none; b=hCoUY4L0ArGCzdqDN1wBqrw7gsxU2fJlP0ft4lo0+Dyfcr63fYpQJe2I8xQX3Kd9/RpB3TcVgYxceg3CRvhbKlbg+IRA6KI0SxSo9MgQeGW+yKNxK2kyRfq57hRe5vH/JB8PtXLl1BYndys620pVNVlX4JVjw7q0WwUHnSz34/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733233540; c=relaxed/simple;
	bh=Cf7a3s8arYqpqQkOPmYBTwl7up1xoJycAuvrn/vhXEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mP3Qkuf+isZMkcW1cHybKgzwaWA7JEQy7MhnZMNTckw/ata9qUYQSXYjXAtmXeuxXZvv/RoULnvJw1vRmr/zW1IcWbW1ICFuQ6cq+U8otzm979XrPBQ24T/VfVap72snM618jcpsQxArqJKy2+5Lt7p0g+d2Aq+dEg6hl6FL1WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fv2sSowq; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ffe4569fbeso49179051fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 05:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733233537; x=1733838337; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h7CuYR8KvWJReWOTnCLxKMKX9kriMN+zYqjEqTbxeIk=;
        b=fv2sSowqa1XCFOWh7/+Exy0QrolBUSmRULo1aX9ljEcM9jprTvItTL5Fg7eZLPhRdN
         ryhb8vHpiOdoCetwUWrhuuzKLFTBDnOGrt3nniXjnK4Z1rLYM3RWZc3Tui1m7wIJBrMm
         ahsnzSw+mwm3hzB7uY0KJp3cy6tC2daajNoYx4BEJ5lvX/jD6k1xPgkWIhFUnwchrcCO
         XPQCXCtFXJNar5xeS2d/NLee7omXkLHD9qb4w5SBbXl9rtufhkyXA3Yo8zbSHp89ZyPr
         GBkkF9oydxEkGD5mYl+rmC9fsew7/R1K0TwP+4ZWc+0hKkRLUys/X81w55mWjLIWqBGe
         7mHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733233537; x=1733838337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7CuYR8KvWJReWOTnCLxKMKX9kriMN+zYqjEqTbxeIk=;
        b=LSFpFOHV+B/A+ltSi4yeGvSV/NjYhftrtFX7VzP+r8T7kCG29pAgM2K6d84+co1M+G
         balPugYW0Apa9vGlBsytrkfsMYr+SaqLmjl1Vqv38odHFiPj21T2HWHC+d/neq3abEkL
         ySdaS+/K0zlki6at8qnxGCQLK1u9yKshBL1qIPH7G5+VON8lFLHmc4DLQvn68vTyZn8L
         xBuFAKqSTBpaTL7haXYYqMBLjxdqQN4mzM++ieO1qmVLN0iOQ5r7UyIliZ/bhn5jIHtP
         +vdDcDUKWduGPQ0dhcZlpcl1pi4rbvMpPMyObONykT5lfi65LjLqzLYvojxhKm0QklkE
         LDUg==
X-Forwarded-Encrypted: i=1; AJvYcCUBi4ZVe1Hoj1H3jo5IEEtfj7Jv40GkCAQnDEaiPTpb7Q0PlnsKXo6qrcisrrYA7IDcZaWpuDzBrsyD2bXH@vger.kernel.org
X-Gm-Message-State: AOJu0YwkaXgqiaDLpWiqctFtsAAIjxTrheK3SA6g+iZA4aczCTtQNNSf
	GiAujINNqFWjmHw4TfyKM+poDS8/tioItKLcIMN9zwMjndqbPY7AdRtwgOaEJug=
X-Gm-Gg: ASbGncuDOlhuJDOofdZcDn3c8hWwhD5DWjX/3JucGF6okQh6rzP01wUL8uC8q/LPJNl
	MM6z8MjV1cfKcI07FZgFril8URsgGtUPE3asR02btu2w80IPlHURZfRntTuC1CZbLzeSIq4VcmA
	BZdEjawynKbqES9WnLOqsuGHxfd3NSJhKLlipXfAKbPdhAiFBR+y4pvPsZAcKU9qYKrse2yIl4E
	ok6WY9Ec/4El6HV9TxdZg330CcTBFzKO/MMrtArh6bA+W5RyWFiN8Itx8EgbyOHYjDSu9VEBiK6
	z1KOCxKOiE9hfQi72W9BBySKKpY4Dw==
X-Google-Smtp-Source: AGHT+IEQO2NjaeNHOLixDzUv5WxZZEQUwkB4QYOykvSvxBbAYeu3SAKM3mDIg44l5ud5IGEEf6uCAA==
X-Received: by 2002:a05:651c:21a:b0:2ff:de64:c44f with SMTP id 38308e7fff4ca-2ffde64c57emr59876511fa.1.1733233536627;
        Tue, 03 Dec 2024 05:45:36 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30009665bf3sm2615041fa.113.2024.12.03.05.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:45:35 -0800 (PST)
Date: Tue, 3 Dec 2024 15:45:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>, 
	Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 0/4] drm/msm/dp: ST_DISPLAY_OFF hpd cleanup
Message-ID: <pzj44gbpadhmfbausv2swkzvh6fhbwxj5a6uw6f3orstjqcmnq@jpdhvdthfkju>
References: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>

On Mon, Dec 02, 2024 at 04:38:59PM -0800, Abhinav Kumar wrote:
> HPD state machine in msm dp display driver manages the state transitions
> between various HPD events and the expected state of driver to make sure
> both match up.
> 
> Although originally done with the intent of managing userspace interactions
> and interactions with compliance equipment, over period of time,
> changes to this piece of code has become quite difficult to manage.
> 
> Although, unwinding this logic will take some time and will be spread over
> various changes, to start things, this series tries to get rid of the
> ST_DISPLAY_OFF state as firstly, its really not an hpd state but a state
> of the display overall. Coupled with this, there are quite a few checks
> in the current code, the origins of which need to be re-visited OR are unclear
> which seem unlikely or redundant. With DP controller on newer chipsets supporting
> multiple streams, this has become increasingly difficult to work with.
> 
> This series removes the redundant state checks and simplifies the logic as an
> attempt to get rid of this ST_DISPLAY_OFF state.
> 
> Note: This series has been tested with sa8775p and sc7180 devices with multiple
> monitors and also multiple dongles with no noticeable regressions.
> Both of these devices use native DP PHY though. Hence, if this series can
> be verified on some devices with USBC-DP combo PHY with the help of the other
> developers, that will be great.

Don't you also have an RB5 (for pmic-typec) and SM83(?)50-HDK for
pmic-glink?

What kind of userspace were you testing with? Have you tested pure fbcon
/ drm_client?

> 
> To: Rob Clark <robdclark@gmail.com>
> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> To: Sean Paul <sean@poorly.run>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> Abhinav Kumar (4):
>       drm/msm/dp: remove redundant checks related to ST_DISPLAY_OFF in plug/irq_ipd handlers
>       drm/msm/dp: remove redundant ST_DISPLAY_OFF checks in msm_dp_bridge_atomic_enable()
>       drm/msm/dp: replace ST_DISPLAY_OFF with power_on in msm_dp_hpd_unplug_handle()
>       drm/msm/dp: remove ST_DISPLAY_OFF as a hpd_state
> 
>  drivers/gpu/drm/msm/dp/dp_display.c | 23 ++---------------------
>  1 file changed, 2 insertions(+), 21 deletions(-)
> ---
> base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b
> change-id: 20241202-hpd_display_off-6051aa510f23
> 
> Best regards,
> -- 
> Abhinav Kumar <quic_abhinavk@quicinc.com>
> 

-- 
With best wishes
Dmitry

