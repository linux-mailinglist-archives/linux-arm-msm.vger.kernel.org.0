Return-Path: <linux-arm-msm+bounces-40897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 994869E841F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 08:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 831BC1657A4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 07:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4061C13B58A;
	Sun,  8 Dec 2024 07:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JEx7td6/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DD138DF9
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Dec 2024 07:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733642388; cv=none; b=IuYBRPsPJcL9jB6w9Z4IBmbRZQZ84rFunOGDcg064z11Ny5cD0BuQRpu1WYoYRkFkYEk9lKAktHYNAr5Q0zHf7LoB0XQ8DvAZ7dN9CmglndM+82G6y9mEpba3mSLzRN5Xd+iwmBAhM0lV2NQdB1LtmtJgrwZMpQtWdPDEQjJYwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733642388; c=relaxed/simple;
	bh=XRKgqyiyOL+fKgAu3AbOpinI5S82IhpY1w8cIfsgVxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UaFhYUJ+mVwubEQYl4ZA24jf4pHGVFLddw7JoSzRSWgAHgTs2pgigpyxEhhOz0/kVoqMJLzxWaIxcJfpAUz6rD3rT5vfMl2x1tcXHFqFuK18ZLZmyTNy9SMEM6z+MyVETM4QaGjuHuWZ4++irq5aOWnIMJQptSH1113zKk4HzZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JEx7td6/; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so130229e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Dec 2024 23:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733642383; x=1734247183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BSavt2FoNM1mE39gFwCc/sD5iNrGSzjtWvCi1YPHoOQ=;
        b=JEx7td6/DW21udfLQKkjcDX1oIwvG9FU+6PTWdP8Z09q/V9USuK5DXpT35O4QEVFv4
         UAlq+MKhGDU4ikl+UaIy8CbQAex1tW7a5mvPoH8a3IvT+fxwnGQJHO18bcphE6VhK1d4
         1SronF2Cu9VIOkwPiQn0UhpSbhkipCqE58rYo5rDNuaFGghc8dU8S/Ouv9eQWtxdLd0Y
         P4dYL6sfI2XLyMPM9ODgtbiLaobgV4cbeLK5znBywEoHR8OyFyyvChMMCyWRPhgw3yTe
         9+ZltJJVWWuXVnJuvXz/6uc63Z9pcQ3/W9v39hCvOOII0+Yvp+dcJ158cRZ1FB4/6zB1
         5STw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733642383; x=1734247183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSavt2FoNM1mE39gFwCc/sD5iNrGSzjtWvCi1YPHoOQ=;
        b=g/8Z33WTGrAm4P4RAjfhNZVY4CQVhNSxFmkZlWptXh8dHfQOnIKh7edu6DYR86vYqv
         w8j4uUWv6JZQ1Wtqssr+QJrnoDvETA9v0nBwn72IiPTk5vWrWRjL66wt2omWr5+qQUwQ
         2KsPETQhatsrfLBLES2dTM08nMkzR+h66LBbPwIjHvRVRg4qNrjRfylabxoTo0tK7usG
         mP8qYVMmZqMm8bnwUmMxGOvUy6GKJrPC/hZJQM3iBwT/kupov4zuCX0ZNGmr6+cjOexw
         4QF+Qk4PSoaw/Jx/goMI0YyR/Do3WctGzerYliS0SVSkzn5faTRE0P+NQ9sEIpHnsvNI
         0X1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXJckhNiSZvKzjcMgrFM/8IE8vKP1QJZ216814dwG91QuGqT+BoDLsuovcR4IKBJLZaxoy3YzZIDOb+G1AT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2G/sgoWjyULrRbWgu26U6kFgSujhTVt/ZXLnBCbq5uO016/Ml
	Y+emQEt73EgtUCmXv92+NqToasHAAjgMKhVIdSlZWc9VfMCw8M0rNXwRjogstwY=
X-Gm-Gg: ASbGncuNYSoOI/G9IVk4x4fU+dwZ1Y/lknWPErohqQDSnQ/EJ/fRDFUWZMF4viNyR0N
	OZ5IacpXSB04KWRfeFvQkuXZgX8zKsDQS+lVUSCpC0eJZfOTbCCH9E/15PjhCkUGuiz2IrVGnKC
	VWkWhld+wJltmmxXSmoAkIBeUTCMnhkJPjLks/GAeMnL6q5juPmfD57MxhbRDobHrAg/ozM4ftG
	lsFE2+oBF+cvhpk4ePuHI002WOGqlCencixjEVFYag8F+DLmMXPZXa/Z/2/uMFsml88Qp+zD+Gk
	YXeVuhL72vMg5UVfuMGWbHpXsOaXAQ==
X-Google-Smtp-Source: AGHT+IGUWPi+aSZobVh5ZE44taMUpkK131X0xxiE4FJZcXmYsAwbDt66FDeOMwsglwz3FhulcHhd0Q==
X-Received: by 2002:a05:6512:2214:b0:53d:e41a:c182 with SMTP id 2adb3069b0e04-53e2c2c4b80mr2664237e87.31.1733642383294;
        Sat, 07 Dec 2024 23:19:43 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229ba9fcsm1015427e87.113.2024.12.07.23.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 23:19:41 -0800 (PST)
Date: Sun, 8 Dec 2024 09:19:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
	Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
	Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 31/45] drm/msm/dp: add dp_mst_drm to manage DP MST bridge
 operations
Message-ID: <pb5wve6gfqzvxxn3i4vafsw4dhhu5rq764gxqnrqhabhheotjm@rc2zxyyvlfup>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-31-f8618d42a99a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-31-f8618d42a99a@quicinc.com>

On Thu, Dec 05, 2024 at 08:32:02PM -0800, Abhinav Kumar wrote:
> Add a new file dp_mst_drm to manage the DP MST bridge operations
> similar to the dp_drm file which manages the SST bridge operations.
> Each MST encoder creates one bridge and each bridge is bound to its
> own dp_panel abstraction to manage the operations of its pipeline.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/Makefile        |   3 +-
>  drivers/gpu/drm/msm/dp/dp_display.h |   2 +
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 490 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h | 102 ++++++++
>  4 files changed, 596 insertions(+), 1 deletion(-)
> 

> +
> +struct msm_dp_mst_bridge {
> +	struct drm_bridge base;
> +	struct drm_private_obj obj;

it occured to me, while reviewing the next patch. Why do you need
another drm_private_obj???

> +	u32 id;
> +
> +	bool in_use;
> +
> +	struct msm_dp *display;
> +	struct drm_encoder *encoder;
> +
> +	struct drm_display_mode drm_mode;
> +	struct msm_dp_display_mode msm_dp_mode;
> +	struct drm_connector *connector;
> +	struct msm_dp_panel *msm_dp_panel;
> +
> +	int vcpi;
> +	int pbn;
> +	int num_slots;
> +	int start_slot;
> +};
-- 
With best wishes
Dmitry

