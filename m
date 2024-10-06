Return-Path: <linux-arm-msm+bounces-33288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47947992165
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 22:51:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72BBE1C2084F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 20:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08ED71482E2;
	Sun,  6 Oct 2024 20:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UcLeFDnY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575F874C08
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 20:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728247891; cv=none; b=lIl1pZUm0BjVkD+iTvER3yfNUY16bsg9iloCY6KzMBv+uP7Yb7xLiBDjojlWTVOlj/Axe/cGsZ+bYHaHlviBFbSFtPK32ULq2jPIIsB0nol+VbRhUooAEJTO7rHmJREuOuysahGpzdrG1Napuqlnj4J2v+PBf3wtuiQgzwzZmWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728247891; c=relaxed/simple;
	bh=Y4euoWfGpYuL7CIb4aRqwSq4rDz5rFpsaNHU1dEcCyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rsco3golov6Jfo73KeuslFUgDhri+AmeHn0YZ5cOhQtHCc13g+uGSHlXIyXbDMl6asdkyzhcRqd7z1ALvaJvuCkiGL2muY6j45CcTTC6padDXe4oykpDM2KDL6ktEEr4pk5MZGvZohc36EfJGFld5FpYeSHFApmqEOZyshkRarE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UcLeFDnY; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fad5024b8dso41425381fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 13:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728247888; x=1728852688; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3HiBKSVX75LHHDNbaC77fS8s37J8jrwJ4P99mtP4pG4=;
        b=UcLeFDnYRvSomFvkdVAOUWJtSgUHVVtBufCUaccAcdR4NQlLERiRXOz/dvXuAgqw7r
         VNhQGT/K5vtOMllmoITF2fSMcYsTxTxXhUFH7buKUkMXeeRKwEfIanOZ2adU5NX/Hjwf
         hnz/xB7zYP2DQaT8HdFgOM5vQEN+EPRhpcO+KBsAuJNV23SnSQXTY2r1D0KhNZ+XicMo
         yIE7jvwm8j0akfCrBzZl3JKpBQwbKaRfwv7I4rz1uHPuGROPTUmXqfdTgMjMa0v8jqaw
         FCdkai5Gd2sdkvoJ8utmEB7Wh8pcAfRDwI32dsp8QNMEpr39vnHKP0MFrlNmVV0OLs/2
         2Bew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728247888; x=1728852688;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3HiBKSVX75LHHDNbaC77fS8s37J8jrwJ4P99mtP4pG4=;
        b=lPwzFixgzqcaspjmgxHq0d4wFDbv3LdZbQaOyvds4kROCEYIltB/GE4Jm3+n4nW690
         hXNFUWkLq8QjH2eNK3FxMFmCjirGjx7WNEeQtX2p/IwZg8LR5fAoXsLjxg47fHm7QvIw
         4ChmnrMaZyPzf6261rleU64l51v0wGinieVZ3MSYDrH///Yy9gFDp9a45x4EM18gsq/b
         ENU86Nn63Fh6z+e9t87s/X5+3AQJzv54ttFjIFW4b+f/arOeoJF9bjZIz1XHKCD7KA9B
         cV2YAkf8YTh0q6dcURktTDuWHYWRUTn3CzdpVjwJ/LbzNeE9/uJC4EUrWeEpDG4x/Gp5
         MZNA==
X-Forwarded-Encrypted: i=1; AJvYcCXk+WyEMfDrpjgBajwqGVj6HNWsztHOaMZihZIXZtXogmCkMiQ/8WH8L4Wkq6r6k6YsuoIRJYE6/BVWi9o/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1PkUpIDb5N/YUpoI47PQNwx5P45gSEOsNOi+DfWvF3i5KXXvu
	5skyVcHuXjpy0pC6wffqt/TgL48e6gTJVig0oDaaV9ukuYeZKOwyeJpwDFc7bEo=
X-Google-Smtp-Source: AGHT+IFYj5QIPKepGYx8O1cYCz5bguaSXuH74kBNDjDjaFAC/MHye9Vyl7Zez82XTrTQRF7q0Etevw==
X-Received: by 2002:a05:6512:230c:b0:52c:df51:20bc with SMTP id 2adb3069b0e04-539ab858874mr4118687e87.16.1728247888476;
        Sun, 06 Oct 2024 13:51:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff23334sm604877e87.184.2024.10.06.13.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 13:51:28 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:51:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v2 1/4] drm/msm/dpu: Add support for MSM8996
Message-ID: <c3fbm76ei3phw5y3nq76q76zkxcytiivdboe2nwifndguz7vun@pt3u6rzqxf77>
References: <20240930-dpu-msm8953-msm8996-v2-0-594c3e3190b4@mainlining.org>
 <20240930-dpu-msm8953-msm8996-v2-1-594c3e3190b4@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240930-dpu-msm8953-msm8996-v2-1-594c3e3190b4@mainlining.org>

On Mon, Sep 30, 2024 at 08:35:56PM GMT, Barnabás Czémán wrote:
> From: Konrad Dybcio <konradybcio@kernel.org>
> 
> Add support for MSM8996, which - fun fact - was the SoC that this driver
> (or rather SDE, its downstream origin) was meant for and first tested on.
> 
> It has some hardware that differs from the modern SoCs, so not a lot of
> current structs could have been reused. It's also seemingly the only SoC
> supported by DPU that uses RGB pipes.
> 
> Note, by default this platform is still handled by the MDP5 driver
> unless the `msm.prefer_mdp5=false' parameter is provided.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> [DB: rebased on top of sblk changes, add dpu_rgb_sblk]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> [Removed intr_start from CTLs config, removed LM_3 and LM_4]
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    | 338 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  94 ++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  drivers/gpu/drm/msm/msm_drv.c                      |   1 +
>  5 files changed, 435 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

