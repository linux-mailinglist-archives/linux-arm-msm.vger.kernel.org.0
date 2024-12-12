Return-Path: <linux-arm-msm+bounces-41850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C79FF9EFD69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 21:26:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F656188E03D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 20:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A731AF0BF;
	Thu, 12 Dec 2024 20:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d13mGZIy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2106918FDA9
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 20:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734035181; cv=none; b=bFbwkd5YPAhIDoOBOXw1/Q05j58qVcNFQt4xMm6GQb8kMntl/jDG9rNoLvUbJP6IbkqPiiDECiAWPRxlOuZijauCbyFm2zRyPi6Gj0WqxH7m32Y5yErIlnylUq0CFx3sJV9VZXWiUnBnISgmrhby2ldp0kq3GRanPR6/+8iKLMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734035181; c=relaxed/simple;
	bh=NHTrlUxaL8vdfToHnmluTFj/u73SQePE/WFT8/rVGF4=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KaRARvuZw0U1fpKQfPNl4jsspKwECoZ0E4OAUou8lTsUPpwfKLvJ/covPIyUCPDOywl8Vz9JYgifwiyGVL5oTylWpsqkv5t6AMC2+aA89Lgyzh/dtim5chK0ka10vvHK4JttCgIeXaCQI+1kYzioVgoTGq8GHXu5WhxQgFd581M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=d13mGZIy; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e3d18886010so737647276.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 12:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734035178; x=1734639978; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NHTrlUxaL8vdfToHnmluTFj/u73SQePE/WFT8/rVGF4=;
        b=d13mGZIyUhL40Me3qOHRFB3+wVWS+fRI6TdoYJLgZRvBvHeJScNoYIdUTlODNrasgt
         zZzlxM45Su+vX5YfH5XODWivXwR/dZ85SzJpyI5oYU6iFM54vTBqgr0nRmA2/bcXv0oc
         r3Vu2falqooC7V6597HwEzqmHHKIOeUR71tHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734035178; x=1734639978;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHTrlUxaL8vdfToHnmluTFj/u73SQePE/WFT8/rVGF4=;
        b=RxycSkLHm+Qfvwn+3pD0dlqJSZxEaBZsL0xGHgY0ILLE1sj8vae80/vGVp5W0R2xLE
         9jm3/iRJ0KumPqFdstxUYRfZnmi+0KkkDYNcqjZhbMNrCv6a3PprPd8BgDlMLaR2KbLK
         Xo5H/vrYUrv+ZTbVgXuONhLfd7Y+6f1V7gmSXjy9lpWxRSJyiY7r/bV14frpdSKd6TWV
         ocifvrOwcq6ZD4vSqM49RhJWcMKsoT3Ppsp4b3iQyLtPLWYO2QTDnGwmW5ZHEKEOXv+d
         zN47qNed8cNBo4s9zhGYxzeqrY7ddzdcSQW3NJ265hkxlSdt6cC0/zkbB1R/dpd67b+d
         OBjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8Aon9dX4VZEzq0em4e9Jo8yCG8XWfrdy9jdxV1Vg60Xc4XNigGU69PZ0Awb8DAI2x2iptbVyIQ5RvyT09@vger.kernel.org
X-Gm-Message-State: AOJu0YxEugSaBVNOXFiKasqLYMJSoI7Jwd6ryS3PyU6Tb4wsM2/N1jwa
	93g9fiOf+H42snUz1wVXXJavfU3QF4xfy5X2QNKprE9qtk3XrfemreOYmALIY94XuEh5Qz5l13x
	UkJABMSv60lwg19Xwl7RAaBbhRTe4GivJYXtM
X-Gm-Gg: ASbGncubSkJ+MXDnHSDBfZ0nNjzqwFEyqqW+uGhO/yFkrCdhKKujSNzVaKjU/zpd6HW
	0DGC7C2j8dXSWtp447Bc0CnXRir1xFvI/rPiuShzRFXDTsW7IyfAH4s8dqfor/YcusA==
X-Google-Smtp-Source: AGHT+IGs4i6eqssuEGaehVKE7QOtcQ5CB1FUkhV3LRogQBH52O8B55VM3orOmTDcSA3soHh0ekrOCA9i5WdjzCvIzoI=
X-Received: by 2002:a05:6902:1692:b0:e38:b48b:5fc3 with SMTP id
 3f1490d57ef6-e4350ba9a5emr55975276.32.1734035178204; Thu, 12 Dec 2024
 12:26:18 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 12 Dec 2024 12:26:17 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241212-fd-dp-audio-fixup-v3-5-0b1c65e7dba3@linaro.org>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org> <20241212-fd-dp-audio-fixup-v3-5-0b1c65e7dba3@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Thu, 12 Dec 2024 12:26:17 -0800
Message-ID: <CAE-0n50N1m5f5vFD+ZP_DM8FbkTyBYP-VWy=yBNo+yd3_zgm0w@mail.gmail.com>
Subject: Re: [PATCH v3 05/14] drm/msm/dp: move I/O functions to global header
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Paloma Arellano <quic_parellan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Dmitry Baryshkov (2024-12-11 15:41:40)
> Move msm_dp_read()/msm_write_foo() functions to the dp_catalog.h,
> allowing other modules to access the data directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

