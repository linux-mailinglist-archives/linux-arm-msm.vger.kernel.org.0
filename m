Return-Path: <linux-arm-msm+bounces-12241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 153A7860444
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 22:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEA871F259BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 21:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2726AFBC;
	Thu, 22 Feb 2024 21:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tyupwmMg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A139710A05
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 21:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708635622; cv=none; b=bcZKrD5hSjkbkn6M/86tF9BLXJAclhedkYB/dCVkXxZEMcJeqqL/wHQRU587++st/Ajlp63nseIkk0Uq6EDaWO/T2N+hnfzaH9b7nS79LbuMfkySEeE9rzqv7OHdWk1HM3btsC+R5LPL86J6IwXRVyEEcZoX4jOks+Yl4VqIDLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708635622; c=relaxed/simple;
	bh=HFx919FoBoatQ0QsWPsYN4OR0O/n414ORi4Ge3ph5Q4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nM8tauyczieWg/9SPwvcBUEbJS226jcioGMHa1N4/wxQ6yHhcTtyIaADXsFLjYWT1U372fO8gmI4IzPh5HWoHJTaDHyVEwDudKyi7krkYyfnlNMmf6DZIhj7bGMAs//FiazLiHPoL5hNalkRRhyoxX8FsKbG+WHuJ7RCn/yhOLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tyupwmMg; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dcc71031680so127396276.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 13:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708635619; x=1709240419; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dmvjj7fhOobzTivUlelD//oyOg39L8TaqEJkHM6CbjU=;
        b=tyupwmMgbdwGS1cp/Ek63vQhmqjDH9Ux5eZfR1JfKBmiID2zkGljsHX9TgPpJVqR3u
         E9ZsJ2eneLV5Lm+LJN06G3j2N/ZieEGXF6rs+hi9RrKewv6sORYoKhvYifFIfxEgacoI
         /p3b3ZJtJvRW2I68jvEDOJAc60zc6IcoqyX8tpgef3TFwlxvXMxHU7xkOZdPnEkyrHIo
         HIUCJbRBsJp8JFLGT8ANy8VUpK3Y5cHQCRE7L3jxlRbbm9u39Pb7bkbJf4b5iYzdeIJ8
         Hkvwty/42rwICyhj0mVZs4KLm1PM9h0ET1Ed4/fX3LuamhOBAjY5Q+NZXEJtOeDa8NgE
         o67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708635619; x=1709240419;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dmvjj7fhOobzTivUlelD//oyOg39L8TaqEJkHM6CbjU=;
        b=l97fFMmNa500tz4sxux5nTsWVTKdhffZTMf5kyY/TNDfORsSSAvMt3PxdraZk2TjRA
         oqLnJ8YFHyGGbr4d1q5DmQ5WxZJnkmui4XxDfu9S6Yukp9utQ58TFBSbAec9et95lPKF
         +CUmbFmq35IzXbtVpv+sEit0nxN8NuSCPwuV8jzaheI2eJ5Ox2duTblw8xcjKBrQNwjr
         XztoDqxaZvZntRC+3gAMs1aUkhrHkovwVqIEFWIRoO+KdNy3V6AP33P8rKpx/sNgl6c+
         R/DSV3F6bkMhiguM25ee8jguaRvmCP2To7zEYPkhb8lVQsBGQXNkkBmmHNcA+TMnzwNc
         4gkA==
X-Forwarded-Encrypted: i=1; AJvYcCWm1qRSTl4yZ91AuacfL1NAmZ/68zKTV4iMIstFV4YWN62APjJXbcDbMgCY/msaO0xWmpscbRySjAVZ0l6SWPUR0fMTBz8QgRqrfXCXIA==
X-Gm-Message-State: AOJu0YzWidPJBZhyFnS8EPdVAIZSXuRE2UrBbMHOWMxIZNkepVUwWPdb
	MCAdyAr75VaZzlkeKIq38akcUquwvOo7/PGe03U8FRLbfYntJ5m/xGuhPZIxLtmFqNHGpfTFz0o
	7Dw4Bf5aMrClWvVQaFOeoDYzXpT9V3ki+V6NapY6WMtpus8kK14o=
X-Google-Smtp-Source: AGHT+IFdnFEXZ/1Ob2Rd+e7Qs1/dnY3m9z+vfb8chmIF2GjOTnC5mGKNn2WgjovOSKHSnuhiBw7HcB/7y1Jd6eekJXs=
X-Received: by 2002:a5b:d05:0:b0:dcc:8aaa:3ed3 with SMTP id
 y5-20020a5b0d05000000b00dcc8aaa3ed3mr303376ybp.16.1708635619664; Thu, 22 Feb
 2024 13:00:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217150228.5788-1-johan+linaro@kernel.org> <20240217150228.5788-2-johan+linaro@kernel.org>
In-Reply-To: <20240217150228.5788-2-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 23:00:08 +0200
Message-ID: <CAA8EJprBs8ASwZMAHFMQUEg7NN67rzRtUX--8h72-7F9R_=o6Q@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm/bridge: aux-hpd: fix OF node leaks
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Vinod Koul <vkoul@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Feb 2024 at 17:03, Johan Hovold <johan+linaro@kernel.org> wrote:
>
> The two device node references taken during allocation need to be
> dropped when the auxiliary device is freed.
>
> Fixes: 6914968a0b52 ("drm/bridge: properly refcount DT nodes in aux bridge drivers")
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/bridge/aux-hpd-bridge.c | 3 +++
>  1 file changed, 3 insertions(+)


-- 
With best wishes
Dmitry

