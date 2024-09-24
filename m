Return-Path: <linux-arm-msm+bounces-32381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E434F984F18
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 01:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 212461C22B27
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 23:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FA61188CD5;
	Tue, 24 Sep 2024 23:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E4PIyoFf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB651891D4
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 23:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727221492; cv=none; b=SPah8Caq+2yfpZ1vWqTtc9G//kzZONjXLU1+79eTm3PQPdOxOTx8kERGb9khPdx2j/eOTZcc3TAYavYOkdpFDFKUd4YxLOjcIyPrBDrSUzjNdS6Xicl1P5/LIQjRyNAeTupbt7JmW0F00+niPjrrPM03Lx2RKp40c8D6ohEcbHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727221492; c=relaxed/simple;
	bh=0i25XNsBDwe1ivygc1JspvhPQ32uh2UA3hYsa1c3VqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eju3GjikCoaGL+ke8fcSho5f0ssbSj8liganC3shRonx0hhNCgowgncOaTzJrDSa3AaFhnZd4kQW8YOqCZLiymrPgECSaq9eglo4p0Zz2hAcGbee0aOlB/wcsOiW0tV0nfMFOnMmEawQWQwgQJCIforlwRwLQdjIfHW7yYORwsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E4PIyoFf; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5365392cfafso6358260e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 16:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727221488; x=1727826288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NTnQcaz+QGqGQ+VZWuLMX82hxnpgAqAgeULVZprajdc=;
        b=E4PIyoFfkiZ58m+P8xdund/mCLCbosws1H6GBCYM2/gFRzmEdGU1ZJ/S5jDiNf2GYC
         EeYvXArDCNYDKg149m1c9eog4EqZFaB8nBhfl874EPXnrq6xNlB3jXNe/cA5vNiQA70w
         /yIZcjkYlzrZXifPCHPLwDfojWskk1ZPkzHa90tlUVnqkxei6W3nV+x9ysFNBXylMalV
         NdWtv8BG32zavRHRy9nxpGDwAcD7rVlYQb47X0ZwqrsYL6mbKf9/YX+wqeLuWqHRufFt
         glzhvmcGQ+btGMFpwt5Idt/5gMaiKnFaIhlDivuI3mZT6GocVCK1BndbEHM7QLnSRePf
         jWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727221488; x=1727826288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTnQcaz+QGqGQ+VZWuLMX82hxnpgAqAgeULVZprajdc=;
        b=Rq4CxFDMyvUtCNUf+x+MlLr2ypPa1uToVYQeZU56uQ3CDrGWQYNgBDSOvLZK+MhMB4
         H7zX60ctYoQIL/qUh81Syi3m/aptYUZuYjATud6Q452gGarLMNtwQ46QI8lpSV6j8EQn
         +Dr5knJIhiyLuL84u94bpHiGTEfhBMdspQ2J/Jy/gq4HSkIrR3Zajlveihu8/hMCVqzL
         2cIVx7LfBj33s1ewZH+APGNeWOLLaIHgpO2pb4r+3scnOZymJJI8VSgmwkBTX7Zye9U0
         qgy9D6SFZiOSSkZ9ZrIr7UYv23qYzsg3xqh859dbDNFYJnZvHVNOSDVopZqI9yoYB8sA
         rZpg==
X-Forwarded-Encrypted: i=1; AJvYcCVTd9rlyeJlZON4vKuAfXCIwBQh/hVQHCYyrPAxCib05gnHAEsc/U9IC+jJD705HRtkrjZ3He80ZHudI82M@vger.kernel.org
X-Gm-Message-State: AOJu0YxygVpgAKrEW1VpC4nThEDXRGBtOOo1CTMl0XOs2GkRB543Ngz3
	SlalkQmLElyq4FPTj9a+afHJDmQ6UF9T9MN/MQ4tp8xkjKqxIXS+yOixoovxkQ8=
X-Google-Smtp-Source: AGHT+IF6TG6ilcpWrQOEI+i8x0eM464ASRf7xWLlUBr7ne4UAlr4fYPfEfPSXmd2A/lIL6NquNGb7A==
X-Received: by 2002:a05:6512:e9a:b0:535:6935:7869 with SMTP id 2adb3069b0e04-53877565c58mr344952e87.55.1727221488560;
        Tue, 24 Sep 2024 16:44:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a85e12dbsm358681e87.58.2024.09.24.16.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 16:44:48 -0700 (PDT)
Date: Wed, 25 Sep 2024 02:44:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 22/22] drm/msm/dpu: Set possible clones for all
 encoders
Message-ID: <vvycrbbrxcjiplkfsvonqdvhxrlntbiavah3sr5ak4bcy5kb75@7cfud63zswfn>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-22-7849f900e863@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-concurrent-wb-v2-22-7849f900e863@quicinc.com>

On Tue, Sep 24, 2024 at 03:59:38PM GMT, Jessica Zhang wrote:
> Set writeback encoders as possible clones for non-writeback encoders and
> vice versa.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  7 +++++--
>  3 files changed, 39 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

