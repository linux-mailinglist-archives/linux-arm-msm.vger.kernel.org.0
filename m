Return-Path: <linux-arm-msm+bounces-48053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C90FA36198
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 16:26:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E771D1892913
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 15:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9B115749C;
	Fri, 14 Feb 2025 15:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H0KQb9os"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EB01F92A
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 15:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739546712; cv=none; b=Np68n8aknmnT3dozlK/sP8DbNnNnGq4KrvqmwEwRJnmTg2AyWNVakw9vQDzqo3/t2DONaHdT64ITkh4TAqIhUPiuAu/lF8BZ875d9E/ywF+mkkmM49SHdsJHKDnnodnkdZkFcl8U3blPzDrJc5kayUfFr6BUZUBS570nvXZHzII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739546712; c=relaxed/simple;
	bh=sVHPC/lBcsgIEQI5v6LxtJLhqrzFn/Ov1rcgY7j58bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f8dMM5hsC8ONC9/DTix7efJS12fDt20owT68UlWT4ssTma26ODw4M7z+J78d+9FtTDPz7xAOdt2a49C/hp+eiKteh38d1CtXVHAE5He5uiAtW9fme/Cfacj97xi83xsi1vYiuSLkGGIbT7UawCi/fAaaaRaInzZqRXtcRTDz0gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H0KQb9os; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30737db1ab1so21637471fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 07:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739546709; x=1740151509; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0QV017oy9c2+67TXbcW6HEVWCD0Wca5ntOQ3G5XPdyw=;
        b=H0KQb9osSGyE0GqK/44oOM7crwOOvI3OrMa0NlR6CJu5OYu3fB22AA4BslvYcUJghv
         uWq2bZNp3L5RNLWmKQ5CX/rsgGQ6LvZv7eByv6u9pECVa7w/xYnpHugxAhvBO0Fj7QNb
         uJwl58x5tt76I8dm8Q9SfGWFp2aTyOxLECoJo7u/MzXdecA+iUpKt+VZdVSWkne9F2u8
         fQuU/4DQRim9NSp67cVbjSKq0GZZmfjqKnoAnxbraUWmjAOmhxEsEOkxY4zL4YSsUgLY
         8R/7OiArpCB+4TPeI0Fn59kuZMddunIyxtQXHmNwNmKRfvSY7VqTbmSQOfEpsPqtHj3Y
         ZKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739546709; x=1740151509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QV017oy9c2+67TXbcW6HEVWCD0Wca5ntOQ3G5XPdyw=;
        b=Uca9VDuhXSLEzRcesMvnalqMTN8Fp5GVDBqwxHUJrdx6hYjBZ82XojqSrleCFs6ZI6
         8pPAgaEy4h0hrWAdJt8AFrfd8s7N8BMO7+fCasQlrX6X3ERY+2NbOOegUYd1vlOQ2f8i
         j0IApt8qrYWADnGLE8TsTgCSz0ruA49KO7AyD2szpknGigqNfA3g837v5HS1e5N+zxyI
         5xy3ki4MHmwM6gFT3JloZ+N55Mm04GDl5a4rf6oJb3Veyu3FSs41OitDIlYmA3B5ylAI
         DNjR8Inhna4ZXS/r+sDKa6C0TldHD7lE4puKLx+zF0Zt9bRFKyG2Qg0qyBLqHGSDRQ4t
         wOGg==
X-Forwarded-Encrypted: i=1; AJvYcCUz8g/Qw36KmrwrPSBXaACOXQIJprlyyApd00NWlS3GrKfnwEgyfqfyGSkC02B7izSAyMz9R8At0sHBAFdG@vger.kernel.org
X-Gm-Message-State: AOJu0YzT5AXzqj9kdl7uhgjhD+pi4xbBibwwW0MT6Q4KsptBIniIkKBR
	OtXNX4OOCC3zDjTezErETKjZ2bd1oWkenAYm07bDXvpsg3lTvUu3f+gnAWJs9ts=
X-Gm-Gg: ASbGncs11yoSKMnHbe6Ibx+MBX92p0TI9yobiqShcnwfpjI4yyYg73e4ZEJr/Qj1LOQ
	kgZz56p7KRuTYyoLUHi7gaS858ba6SFaeRUG1Wu6M1oFtcTKbYDQj6gA/YDh9xxz3jRoJ4YjFR0
	S1YQNyWTfLNMKgEFmML0L1Y7v6e1Xm7+R67nDjYLQUjlkplkc2fdoqZcmRTQfVpwPst3nxILArI
	VkiMvq7Z4/2ZqSLiYe4MD1uwu5hwEVpGDXRQRqkhf6is29dg7mdy/trHlMEMLzR7/Sdmry+vZ0m
	K9q7WL4EcOVXQXn+cNsKzsJAGETpls+Nzik0a/EfGShLnYRabaIbuJnl4Yih4GKjr1UzzRk=
X-Google-Smtp-Source: AGHT+IFEbu/Es9QSrWtt2Yag3f1NkYdoImR5hqO/3iTeDk8yGy2fux53rC1a2Q7G+vsrvcqf91Iq6g==
X-Received: by 2002:a05:651c:b20:b0:307:af84:3e6 with SMTP id 38308e7fff4ca-309037abfb4mr33795161fa.6.1739546709373;
        Fri, 14 Feb 2025 07:25:09 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-309100effbasm5921531fa.29.2025.02.14.07.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 07:25:08 -0800 (PST)
Date: Fri, 14 Feb 2025 17:25:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/msm/dsi: Drop unnecessary -ENOMEM message
Message-ID: <ipmzsjejxpdtpknjbvhn3774nkkm722qtuwvhnv5njnl3afjei@p36q3euy5j37>
References: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
 <20250214-drm-msm-cleanups-v2-4-1bec50f37dc1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214-drm-msm-cleanups-v2-4-1bec50f37dc1@linaro.org>

On Fri, Feb 14, 2025 at 02:17:47PM +0100, Krzysztof Kozlowski wrote:
> Kernel core already prints detailed report about memory allocation
> failures, so drivers should not have their own error messages.
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

