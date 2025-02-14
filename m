Return-Path: <linux-arm-msm+bounces-48051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D72A36192
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 16:25:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E0B318903AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 15:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E1C266B72;
	Fri, 14 Feb 2025 15:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XMIc7Dg9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B61264A61
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 15:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739546633; cv=none; b=hynhzdNBZiFk3E2re2dm62R2yPrFVYajynXKXcKwz9IgWhQmvE8LGPDWDITBCNPzYsIefrf7WE8rKsD/dB4lcrQ27JB9VUFoola2xnlL7HMKiqrjMubS9mYVPLggNUem1ffJ4UCEtdCF8ZB8X1htFbwXMOo5KXd7nXcFdo1eNz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739546633; c=relaxed/simple;
	bh=OSD2cdfVTG+aYygmsNY8I461+agBuQLfxetkATo0Y88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V5dWOBU8F55EaxxI05gWt+9osBrorGd9XoSQZg2xZcV9fbznOMKl2K1Tp4DGJXr87uM4kgqkmMgwh2/z7zA25/XCvg6HLNGvOxvKUPtJIUiUnIXnHlm3BAJEkbYdy7T70IszvqJBmLykWftJ4NqpOAMyqe/qGsYnxQ/iQCwPRgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XMIc7Dg9; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5452ed5b5b2so281939e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 07:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739546628; x=1740151428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7K8BSTw7ta7yWsbqLgOVUyOnvRZYzOV19aJnHy0TwW4=;
        b=XMIc7Dg9I55PXCYZQQEr0SuC1yeFfV3yycqUkAA27VQQS5KJkQE/hKWlf1pH3iM/dA
         bwvsdeMeUR4DxFY8kFyOse5/j2iG03Hzdylo+5Gf4WL8GMkZ8XB4mVTXSGlCLf0uft3k
         5pI8rdZENaQSqPJnfgFxifB5Eov210taPPDGng0Y36v8bkjPF1zXRRDZISUVFpP7afhw
         y1e165Ear+UDeW9USS8E/ZmWonxb7kdDyoORl85/gDMvx41nk9AxJ9UWCHs1nFob2dSu
         +AtSXQfsKcZzfr8nZ8Lj8BexaUzZVjvl+g1lsbqiyyKVBxmQkCiiUA13D6V1MP7hSUIq
         9lUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739546628; x=1740151428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7K8BSTw7ta7yWsbqLgOVUyOnvRZYzOV19aJnHy0TwW4=;
        b=ZeJLY6VisUOVrRA42QBQEoi1u6HC4IukYgYfwO9ei1v68a5+v+qJBD7X1pLc/J/c7S
         zO4eYyPfyZ3v1wo1S1jsTSAjaqMEwMZIrnRFwL4HrKWfjdhy1tkan9aBJAp6i2dorFOK
         guIdI8fNELLY0BwuF8Zp8vk1ITlCKGXRSBY75R4NgqQnKwf8R8iz8G9Z6VZqgaUUE1tu
         FhNXhKIQumcRxD2GbnAsLVaNK6/T2nI83MjY5Os1W2nmTGzzPaX8fk+XPgDfAQk3iQGz
         lzboklxV19msCy1IGws3TM4qs5THIYbkjrsmaj7zrJeDyvN5VV9Z6iEQ3Hk5wkCHw9Mq
         JO9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLabkgR60xoUCdwd6M9JnZ/0XSEAdTjhOrphEWEcGgiNRCOyigAnTyZpiMMsNdXuvmGwruLNAltFFhS6Z2@vger.kernel.org
X-Gm-Message-State: AOJu0YzyNlx2Jhr/3PeAdkVLuxbbcKPFvnaQOBkwJDgp1fawNNM2UybN
	cCHquv1lM3jueqgL6nFT+a2/ZdQIa/5t7xGzIreqqu4C9VYIAcxNi3JG0k6fSbc=
X-Gm-Gg: ASbGncva+ye5SyePBJNB8Z18mAP2GHptGYrGFYntsdtdf0c7gSYe1ZfEOtye/xLm0NQ
	HoBN1jqqQfzXhxA3BwGa1zsfdCpSb7vjJ6nsevdH5aCyaZIhBsPWjzjE9t/olVpFUkb2PKEgL5U
	02WENRHdxe+Vj5yXZi2DzAnNcwvlPjTF1Gb3KNAwqbsGdJ8QS7j3Xp9Rp5OA7gp88anauNF2xgV
	Yu87sBUmaKQNNLIjKeEPSgPPqPao6U3Nhvt6If/xpGW3FliDDQe7dg/BQ1E0vtTVslpyjI2P32B
	k7LECNhdeou026JYj6XVi+dQEUP8xe9h5vdS+xLbc+kJXfGVNjHhP9iv53CTBYV+JGo1SUE=
X-Google-Smtp-Source: AGHT+IGALhJWUcXuaBCuFD7xYR2u6KjGzOjmwJRF/DL2JlsD9cMVL8yeOcM9QHBZZp3Db4bqrZQnzw==
X-Received: by 2002:a05:6512:1250:b0:545:6fa:bf60 with SMTP id 2adb3069b0e04-5451dd8fd27mr3053085e87.19.1739546628171;
        Fri, 14 Feb 2025 07:23:48 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54526ecd59bsm299535e87.31.2025.02.14.07.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 07:23:47 -0800 (PST)
Date: Fri, 14 Feb 2025 17:23:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] drm/msm/dsi: Simplify with dev_err_probe()
Message-ID: <26p4fibtwqoiagzce7r46dumwzwe3swyjyy7wddreeksz5kg4i@sbys6hoqye5a>
References: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
 <20250214-drm-msm-cleanups-v2-2-1bec50f37dc1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214-drm-msm-cleanups-v2-2-1bec50f37dc1@linaro.org>

On Fri, Feb 14, 2025 at 02:17:45PM +0100, Krzysztof Kozlowski wrote:
> dsi_get_config(), dsi_clk_init() and msm_dsi_host_init() are called only
> from platform driver probe function, so using dev_err_probe() is both
> appropriate and beneficial:
>  - Properly marks device deferred probe status,
>  - Avoids dmesg flood on probe deferrals,
>  - Already incorporates printing ERR value,
>  - Shows device name (in contrast to pr_err()),
>  - Makes code smaller and simpler.
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Update commit msg
> 2. Tags
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 100 +++++++++++++++----------------------
>  1 file changed, 41 insertions(+), 59 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

