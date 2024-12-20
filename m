Return-Path: <linux-arm-msm+bounces-42912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6E59F8C2E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 06:57:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C050D7A2946
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 05:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A3CB1304B0;
	Fri, 20 Dec 2024 05:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b0+P3io+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DCC15B554
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 05:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734674145; cv=none; b=ubo7LiCN1ts5nowFAiazvqdC+fouIFEwlfgFhWabxCDsLjptJg4ZTfwXG4QMNEKEBuKy6USoRACHfIZ8/ikhL5U1wpPDsT8AJ6kkCNgEwQKiK/oCZIhv+UqkUXEIz2IDv9cDhkzOWp/ug0LKpF7JqwMpugfrRcbkgo2ahxr7kbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734674145; c=relaxed/simple;
	bh=Cy9OqtQuGNGkEQgo1hco0Ctu78QBqh27qxQ356tuEDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vD3PkGEU4KR432pbB3pbHaa+8wS/DntV1fIJ9wICpCU+wSjc1AxpcC30aNlcDilibZvOTjEE6fwm8Em6yCx4g28bI3kK1PI0rz23PInC2Duny2vHQ285D05xSdlJK3XcWGWiPrFqtVjIcklyPFUvlfZC1JhX1PXCzvPHiCN7mes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b0+P3io+; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54024ecc33dso1755764e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 21:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734674141; x=1735278941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OJhpuoBbKLElyofoNozRR7fNdcqH/mOd7wB7B78IPAU=;
        b=b0+P3io+xPK5GJOjb0CrBVvltNAcqesaYRUIpKF7+8sSSB4YhUodFP1+RWtDDplKMS
         4wgTcGhECSl69z5XCkEet4rltA8AXcN86+ljxxGhuBS1t1WhA6quj4t5VP9RyygCTmXt
         2wRQDPAhkkGBLWBFt1sLH2B9NS2kUUoo7QWqmqDs+7mtYHmskrJPki7OucDB+jh3c93w
         8vFiiNSW1DuuxKxkJ9wUJPihU2Vve1abeZ8FVzlAswpLiO2p2U+zA6uYxXVpQvOehQa/
         uHKeQNr8wSJPm4sPgwrAz9rvgiMWKsr3cmTNPh7NFN+TqMwW4df8Iu+iFtPpGo9PL1IT
         S5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734674141; x=1735278941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJhpuoBbKLElyofoNozRR7fNdcqH/mOd7wB7B78IPAU=;
        b=NrjYyZAr8tnl5/M/PBai84wPRhZgxOxAN2aBCbaoHpF/XlajPJXBOlrlq0RcJw8nyc
         M0EYrlRbNEqESPFUeTAnL/6vGqrWTLzpvFPmUQlwLwatxTZtsEjnND2AEKCBtB6Vl5hv
         jm6PVz+tyDlHeIytKqdmhbI/6kLuHkzIKWZKXz7nIxzWsvwrZ4LR9ImSdVwgpb2AQbe9
         IgHO4DDmBQaD3b4/cgzIVJ0DhexELpO/KSKrhFS/bhysdUCsWcuDooqqdjTJIqSXtvOW
         70asPbPihqt5ALoxi9MS+qqRr+jFw5vwj6lNJSloQhnO5hw39kKcwSVEZRaul9URmpQX
         C/4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXdJ/xRDwqfEN520aLKQ0GpUjqYegwAmagPZyCC5CFJywTPuRdOGsi3nFQ6iHfyQ8mluwSGILU7n21nl/dc@vger.kernel.org
X-Gm-Message-State: AOJu0YwiA+28VhGAHbrubulb7AMJa4oHpEDok7HBdrOqtQLWmwj2BCLZ
	cCdLC1me4An0fQxUBI8P1Ly+JHI/WQZexprJTzLeUY1+srP/LyZDf2acslCg/eMGz9HrM8muUhW
	i
X-Gm-Gg: ASbGncvQnh0M9sy4o9vSGOqCk+7Bhg/r8Oi5xEvTmpVSJ5U1RddpVvFV1pqPOyupLnX
	rtBNZIXWclPgEE3iYDfQCEXnQzHOx8neBJOmBN+yQFMv9V5Jvy+2BmEcZnxkZfbRz17yD2WXubp
	qic0LD956mSZg4n3gszr7j0MS+PtSgCb/+TLzGAE00SWbFtqcJ0i2VlL1/Q2eXDoZ1+dUUEesho
	eihsnlUiKUJi/zfABIyjfbvn+5I6MmioTTIHNnCrj0Hd1DVAWJrDjPY6InRtzPBIKV+i09UqXjL
	nZ1hwb2BHKfepw2+VlkHzl/9BVxG3CHRz5aK
X-Google-Smtp-Source: AGHT+IETemAVTmQyZ9rbwPDBncgy1nlOXafMgvgGBZDfwJJZOMq7B3fJHMrkOYNfkHSOT4TqKqybDw==
X-Received: by 2002:a05:6512:350e:b0:542:2991:e984 with SMTP id 2adb3069b0e04-5422991e989mr241894e87.9.1734674141403;
        Thu, 19 Dec 2024 21:55:41 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f5f57sm386381e87.33.2024.12.19.21.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 21:55:41 -0800 (PST)
Date: Fri, 20 Dec 2024 07:55:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
	quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 19/25] drm/msm/dpu: Configure CWB in writeback encoder
Message-ID: <i6xj5p5jbn6hdu6uip5q3k4umz4b4daqmbwsgfuaw2guf23kjj@lkq42furh3sh>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-19-fe220297a7f0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-concurrent-wb-v4-19-fe220297a7f0@quicinc.com>

On Mon, Dec 16, 2024 at 04:43:30PM -0800, Jessica Zhang wrote:
> Cache the CWB block mask in the DPU virtual encoder and configure CWB
> according to the CWB block mask within the writeback phys encoder
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 75 +++++++++++++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  7 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  4 +-
>  3 files changed, 83 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

