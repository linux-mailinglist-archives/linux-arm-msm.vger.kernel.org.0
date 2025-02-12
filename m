Return-Path: <linux-arm-msm+bounces-47748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44369A324B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 12:20:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFB2016579F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 11:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5128720A5DB;
	Wed, 12 Feb 2025 11:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HuxGHPUH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CB81F2365
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 11:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739359208; cv=none; b=Su7uCDfEuyxZYN5QT3nptGUQNd5v3pSsNJ1WOG0sPzkE8Cfi9fqzesq+jOl2rEnlF4L9uEj4IQCSzyDr/58dfIqwY+f0Q+97SZWZ2B8c8vGbKkEzB+vUyIR9T8/eIkSQgowVnSAHbvQmD9P70DQOIMzUr1fnDGbBDwNV1+VXfwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739359208; c=relaxed/simple;
	bh=R7SXFF5xZBvaqgymZWePikKLlqhrCZfQBN+7ls2UueA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BUIIdAoX981UAx3bwse5FbLCc+OWXn7lcNTvBVpwyfszSsZohpvoVfHubt0hskR/jvkLoBS+qU4XStiEr8VmyNwqTMnwR3s7/srUVTVqGk8eUXMR77KS/McgtENex94crbTO2FnlH40lyS8qMCn8BoDlI4oeJ9ycH0QnFcv+18M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HuxGHPUH; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5450f38393aso2610150e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 03:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739359204; x=1739964004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MRZ92fMzGnVasOx4w5jeLJUvN4okvRK9mTCYHy/vUF8=;
        b=HuxGHPUHG7FVF1JBwm2wZBN4A3EjeaD8njr+w7Tyfb5JYdhZnmoq5FSow5V2wJ9Cyr
         OPT7Al3vkMufrZN0x436cb+HUmScHqyA5Ygd0Y1VipUfKaTSlDQLoHxlDruzpdBO55AY
         Bu9iZS2P5d8GTDmtTsecqbEkKCVxNy3VKtqTAlos+wdJ61im37g+oFec+TRIDun07CJC
         UNcl+o7gGQOZZJfEwK/fz7KFhLTrpPmKoUlnMHDPcaOCBNoQbw14aoSZCa7G/bqMmrFP
         k72p7e7hS1EKAqgKypzuaUTU9pjV44PedTWbn2LHomYRAqD4XJ1xTqUFcsSgty81FMAq
         PZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359204; x=1739964004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRZ92fMzGnVasOx4w5jeLJUvN4okvRK9mTCYHy/vUF8=;
        b=CvUOTcFIv+D6v6unYK/ja5Q+x23C9QFPN3E67ZjNi+SnSt47hv0xJcy/zVXht4iRl2
         r846HEp2igx6h6JYC4bJ3+bDNZViTmh2hGtAzjTvvjdSztsn/8pNug4yH50iJQiZ/5KX
         e6uyyT9wtz/wGxTvl0f8IaXKzvJz/mWGz6muIpjf3CPBNnu7kjQzKo2duilulAXpUZ0i
         m4Xgr7In6ykadEg9BvksPZ5CdzNASsXdtdvX/h7pKB4sCdrwegKGjepzCIJfv67o1JQv
         Nd2L7XAtrYY2j6z46ovgVBh4PBChwKX9orARzAHmD1KCKmCYGnRJqz8JPiKHg1ZPGyk0
         D2iA==
X-Gm-Message-State: AOJu0Yz0h/Gir0/lzkcqBDzmfg6BlKn39cbIhcMdxXQQJ6/NxprMPQQz
	R8caoaAbUPvdEnlt+BDS/vVpPzp3XVEIpgduiUMaNCrI0s1mzFxVqJZ04ryilxc=
X-Gm-Gg: ASbGncuhGCfmSTaYKUh5h47DGLncybejODN8W9wGF5GDqYI0Gw4/IR4HiXTsK++4WIk
	fqGdnybjZQCgOvSpcc6TMqSXjFbs+pdXjiWBq0NQeWEc/3dzyyQJmd/CZ4eZLCujIJPN72/bmyY
	HR8itPoz4gpmPACNIV9Pd3lGbKjhQ2HBoRevEdmnzME+ZNBgGYRgHAQjI42rQCt0GTCOLlPfa+q
	FnKX8KtcOGYue0ze7vpaqkbZTC618BrczASjewpjcKe5jkV1f3yzBEPPCwVHimEviUrz4oDy0XK
	t36+6yP1r7cZHnfQ0VW3m1gnMi6yKhLYEt7B09ea4QGG8YmZkciQmmjPlLA38ESywc8W8DE=
X-Google-Smtp-Source: AGHT+IFJgGK8ZLouL/AWBGo/S7q0LDko4RL8Ud8msbJQTLEZRaJgYviwJwVP9yImY07L4CtWYdBbWw==
X-Received: by 2002:a05:6512:39c8:b0:545:f9c:a81f with SMTP id 2adb3069b0e04-5451826ea22mr878271e87.6.1739359203971;
        Wed, 12 Feb 2025 03:20:03 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5450e09e9dbsm823644e87.120.2025.02.12.03.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:20:03 -0800 (PST)
Date: Wed, 12 Feb 2025 13:20:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "James A. MacInnes" <james.a.macinnes@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
	marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch
Subject: Re: [PATCH 0/2] drm/msm/dp: Fix Type-C Timing
Message-ID: <yle4tv3rhxkygvxvq56pls2u4muzmuxlzg5mp6ibckkyhbaycm@mv4hmom2e46c>
References: <20250212034225.2565069-1-james.a.macinnes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212034225.2565069-1-james.a.macinnes@gmail.com>

On Tue, Feb 11, 2025 at 07:42:23PM -0800, James A. MacInnes wrote:
> SDM845 DisplayPort output inop on DP Monitor and tears on HDMI.
> 
> Fixed
>  - SDM845 does not support wide mode.
>  - SDM845 does not need porch shift.
> 
> Verified functionality on SDM845.

Please use ./scripts/get_maintainer.pl to get the To / Cc lists. Your
messages missed several mailing lists and maybe some of maintainers.

> 
> James A. MacInnes (2):
>   drm/msm/dp: Disable wide bus support for SDM845
>   drm/msm/disp: Correct porch timing for SDM845
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 8 ++++----
>  drivers/gpu/drm/msm/dp/dp_display.c                  | 7 ++++++-
>  2 files changed, 10 insertions(+), 5 deletions(-)
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

