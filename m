Return-Path: <linux-arm-msm+bounces-45214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C93EA13437
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 08:46:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70591165487
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 07:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B71195FEC;
	Thu, 16 Jan 2025 07:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lb2A0TtL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3EC194AC7
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 07:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737013534; cv=none; b=A1ZT1YMteZJV2T8WIrd12uZMVXchqpl8eTc6vQq2DD8W6oXpNiaa4ib9T9iAIcvwsxKg4m29udGs9oK4hWJoi+RlMwifIBv3FlermyFT64YmvM8FKV1iajzzzEYXFWAEpKIdWCRE9PUsU09xls/F14id2Oi84CCHfw1amTEle4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737013534; c=relaxed/simple;
	bh=C4KOt0QfwjaPK4coWJaqb8aiPhjxTEXCezzRj17TBjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCcYfs9M8b+bNB3VrcRWlC01oI0mNO7Dl9yd+dd7PUrmeqxGN5pHIzbtmJKqzZNk1FI4xAhv8WSAJhmnYcva5ozSoMVN4rrryre6aoJ+H+yBWE5odc+wZTsgLQOgnGRKxRr0J747eQbi2KjpvUL2hwKTYOt6zNcx+VbPiefBSr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lb2A0TtL; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53e3a37ae07so749674e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 23:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737013531; x=1737618331; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SF4kJSME40b8HtlbDBsx+ifq4mTDH36yRswbkqZsxSo=;
        b=lb2A0TtLt1LxYVuQBtvdEucfK9OMsTz37P+YI7JCSc+plAfZ+p/pH61tS55cUnchQe
         Pi7BoWb1KoKP7+x6ASWY//X4Qoja7ORv9x83g9Trt/yG12iMgB6HByE4MwfGgn7BqFLq
         YanPSW+7zh0yj/BWo66xOeeci7MzsdAu8mTAQ/2ufJ/PCnv8Ak2iLCwyGMq4tTrNpxWL
         5cl/fNuu2u6Na7vIX3XPLRo5AqJoqkKK/xGX0Inmi0ma7CtlKqs/Bbdolq7UV4q/3/CE
         zfN+924kdZEqjhAxQSemikSwvvCvqy6utwD5OoKBYAm6jExgTVEVZJTbVj8WfusCy1Cl
         1RkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737013531; x=1737618331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SF4kJSME40b8HtlbDBsx+ifq4mTDH36yRswbkqZsxSo=;
        b=lev9l6W6V2mG5/KTxdOul7fyoMgXy4uvldRkmfi8teQKHZuiyLs5qvXq05179K73Be
         ZW1Ce/v9f8GDnY889iAOw4d/onME5KlS/i9XkmSpiJLGdrQnMjsM4vdGTy7njP68UCdu
         HqleEcbmMttvwxHXZJhgRLz6O3alhBDuCA6vNA4fcGLxB7zrsOcg64NEbUC+M7yQUXhw
         z5awsc2CPwBZFS5VdABbYP1G2qYpbC7GL3Jg7I5fx8NGPEIK/G98ukrgrkTKQz8JMG/R
         dTJF0iPd3UGWG66buV/myhzPNJadTv/Zq8dBrVkBsvwsWgm3GNWj2+vYu4FiWwTxF+u0
         aeoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhHSqJV7snKZn+rC0/j2bDEoILMhEkkRiwF0y/0pwzE37qZpH/Fnb+MrSe5mbtQJaexa1lx9B/h+Tzx3ia@vger.kernel.org
X-Gm-Message-State: AOJu0YyBDKgdvWfqM7oyPa3I0lfTTAfYZqDid7ihf7bbTPMX6A/zmiI2
	cdwFiP5NGAk+TbuRjqI4SxMS+bLBcB/ziWpP7/8JVkqNM8joK2gMV3CyUpZJSnk=
X-Gm-Gg: ASbGncuu4IxbucQFIUl1c0HQRzrkQ2zkvvtF4NoA+Sa/tLmofGDZbwQI9al1dqmRywS
	HSraxhfER2hxHVyBBYMyR1ZTWE+3maU0JjBaDb1BlN3HOmkgjXXtv2BPvEzksM6QzrU1G5SZJ2E
	Ua1ufBqYJ4dmy6J9w09i7vkrcj0xJBTUC0R45IVwl1oB4Enumzo5fVjAJTosiSgBHsxWrkfW+lA
	kMPKZNGHo+dtEnK3qdngtJmtzfEVcbO18FWh5Cn1l68vvl8k168A3D0wLy61HOJxw4VVBrwGyF5
	qEH5yqp4GViaA9SraU0h2oN3Upyjk1dnignb
X-Google-Smtp-Source: AGHT+IF16iTWm/Ux1y1yeoWpVsxtYCCgAEvfeQgL8CcjHyHteM6fc3KbQL2N2YDTvHojx/4UlsRhOg==
X-Received: by 2002:a05:6512:10cd:b0:542:1bdd:748d with SMTP id 2adb3069b0e04-542845bcce9mr10097421e87.13.1737013530854;
        Wed, 15 Jan 2025 23:45:30 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428beaaa1bsm2219099e87.170.2025.01.15.23.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 23:45:29 -0800 (PST)
Date: Thu, 16 Jan 2025 09:45:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 02/16] drm/msm/dpu: Do not fix number of DSC
Message-ID: <3ea3cus4mgruw52r3mqbhpzj5afgr5762izdm7jqdyhsikhpjx@klo7sce74jxr>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-2-74749c6eba33@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-2-74749c6eba33@linaro.org>

On Thu, Jan 16, 2025 at 03:25:51PM +0800, Jun Nie wrote:
> Currently, if DSC is enabled, only 2 DSC engines are supported so far.
> More usage cases will be added, such as 4 DSC in 4:4:2 topology. So
> get the real number of DSCs to decide whether DSC merging is needed.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

