Return-Path: <linux-arm-msm+bounces-40105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FC19E1F35
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 15:32:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97A6F165DBF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 14:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28151F1313;
	Tue,  3 Dec 2024 14:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wjbbINYo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B931F707D
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 14:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733236280; cv=none; b=eq5E0vlyejJh2xtCCyCLlyPdd+pQl8IGNbF8opLNiZS45xLuV01pS58KomHChJlMyk2lfdkKHG8pGbilHX7hXisrw2Daw04vdR6LduBUNR2olAR4byPsI6Ho/dwNTfi8G0pXQtE0gsuJ6DF1INJvGHPwNUJkxnlRwPjLAgE4mSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733236280; c=relaxed/simple;
	bh=IdfdE4oGe59ktpRAQkGYROtaYHi9zupa6uXfpEHHnPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iowwExSBLMSOiOHJUvnZrPH3vLUHVA8UWwAfMI/QG7TGeQec+iOtZgxJzH6LZ2H42gcuQjcoCLUwYz6rUSWDR8imd7io0JhkILBheCPInSKrBqpBTh6De+3Kczr6mhaFFw3JXS3KI7fAmXv/ObH7CTR57p4K3DqPLnizU+vT+gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wjbbINYo; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53df1d1b726so6732475e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 06:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733236276; x=1733841076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ppjUCx+akaTFnajbfVQ++O9bxKq4WYvR9tllyJseno=;
        b=wjbbINYoKhwn6gzEjckSSf05gxJrHGtLpegFphu4wAPo10at+F3kvMdBQg1nfkNBIV
         6QhlzKVDTgl1an09B7XIv+9ntyeslTjxXaMylM3lQHwjLzj3FJQrlBvdgJhohqFevEZl
         iFWVF9MhuiHkhS4GVhFLd0qJHY45p8iT1NF4DWuhWa4VzKlzTRrzQrHDmHF8AarbAkYT
         GUDKIVlu8vNRwRfMXXKK2ZDEQwct9B0nOAS6DD2pwLwabpIzOXLnAj/WMpqwWH2rUuKE
         Qf6deASxq7HjU4DvHbhe9jxXBd/zVVdD1ca5f1O8Rq6tGZIQ6wOyoZfvEYKW/bcu8RAq
         KLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733236276; x=1733841076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ppjUCx+akaTFnajbfVQ++O9bxKq4WYvR9tllyJseno=;
        b=D/lFR1778FyW9Z4OELfJtpvJkFGGdZcw0G4DUGkoudn6jWItJgF1LPEF/tED447P+q
         ZnUDuAf6AQsgYDyfIdCvxlPFFnYwFYEPY+p9v32g+YLk5eHTcL+Mw0pR+WXcu5P5X55J
         BZODhUBqiS+G7dvYG81AQRJtz/gC6ocSPU1ZNHUP/dCQydv9pXEigiJKmsro/Ri7NAhf
         wtVn+5gtknJyNFKwA4C1XGv8OGJOQg/b8XSMAhCSl/+zZdGZY5AqnSsUuWwyZmmYc0mS
         ld+LDi0R99ttQ3WVmVYuTLKZy9EIMYOg9AUEQb1sQXTOUqY+AJmtjFCiXcnx+MmzMgfJ
         kjWA==
X-Forwarded-Encrypted: i=1; AJvYcCVG0QVfF5KCwtUptPZ6fVCtqqHiuVHlCBv5Qhx7xEuHtSRNjQiiiBGAjznoGtR3IvxTsA5WRw79pv62dmjH@vger.kernel.org
X-Gm-Message-State: AOJu0YzLMebNOa4dLoZELS9Lh20A/KD1pdt+pSpFiNn5wufxkFKPsQFo
	cJloccWvyehP0Bm+OHWfBHtAz5SgEZum5XRrluL5ZKkCn4O+tUkjRdlfdoowinJodt2hYkp+joR
	6
X-Gm-Gg: ASbGncuOufgpmR/31PEaK4KTfIv5y++rFeLCfTjgfmakbu/eHQXKnkFcaSs8YkjN98L
	FyoFlVTD0lZPbNZ5bp8AWzh/xBH64t3c89FddPJ8Tc/dw9BrJGTiHdFzHxUVx60AGCkZLeUdWSx
	qv2Xevs0BNFoPntXeLkDb0uwWiDlJ0WcoxsOn9/HeXxNRydznXGprxYTaLPfLc8yjas6YWD/Byp
	b4ka7Y1V2dWIaJ0F1Dz74XrsqX4rDoMKf4yllT6vPxqYVf2+gW8w2OQQOeoFhPU8nSZh8DTfPJx
	Yta8QaTxx7wxJ8bAxsl0VL+Mrrf/Vw==
X-Google-Smtp-Source: AGHT+IH+C+nsRz5D3FTagtbct/svuhNvAQpqymCZAx0WUlFs66GBL4uvVcP+kOsYG099fP8ZE7IRGQ==
X-Received: by 2002:a05:6512:3a93:b0:53d:e5fd:a44a with SMTP id 2adb3069b0e04-53e12a281f8mr1564355e87.54.1733236275798;
        Tue, 03 Dec 2024 06:31:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df64968cbsm1829701e87.212.2024.12.03.06.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 06:31:14 -0800 (PST)
Date: Tue, 3 Dec 2024 16:31:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH 0/3] drm/msm/dp: Fix and utilize TPG with a debugfs
Message-ID: <lpkhftx62hbnrftzoy6zprhvir7dffz5ynwo3kr5j5obc3dcle@73ljnmpdt7ts>
References: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>

On Mon, Dec 02, 2024 at 12:41:57PM -0800, Abhinav Kumar wrote:
> DP Test Patten Generator is a very useful tool to debug issues such
> as blank screen or corruption seen on the DP monitor by isolating it
> to whether the corruption is coming from further upstream such as DPU
> OR from the DP controller and below. It was noted in [1] that this API
> is unused. Rather than dropping the API, it should be fixed and used.
> 
> Hence, this series fixes the DP Test Patten Generator API and also utilizes
> it by adding a debugfs for it.
> 
> [1] : https://patchwork.freedesktop.org/patch/623508/?series=141074&rev=1

I'd prefer for this to be rebased on top of [2]. The series has been
posted a month ago.

[2] https://patchwork.freedesktop.org/series/141074/

> 
> To: Rob Clark <robdclark@gmail.com>
> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> To: Sean Paul <sean@poorly.run>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> To: Stephen Boyd <swboyd@chromium.org>
> To: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> Abhinav Kumar (3):
>       drm/msm/dp: account for widebus in msm_dp_catalog_panel_tpg_enable()
>       drm/msm/dp: do not touch the MMSS_DP_INTF_CONFIG for tpg
>       drm/msm/dp: add a debugfs node for using tpg
> 
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 15 +++++++--
>  drivers/gpu/drm/msm/dp/dp_debug.c   | 61 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  2 ++
>  3 files changed, 76 insertions(+), 2 deletions(-)
> ---
> base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b
> change-id: 20241202-tpg-3f7543c036ac
> 
> Best regards,
> -- 
> Abhinav Kumar <quic_abhinavk@quicinc.com>
> 

-- 
With best wishes
Dmitry

