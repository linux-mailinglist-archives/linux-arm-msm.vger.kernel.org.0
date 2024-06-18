Return-Path: <linux-arm-msm+bounces-22975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 506C190C720
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 12:35:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5E1AB225E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 10:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 593361AB8E8;
	Tue, 18 Jun 2024 08:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sc8Q8mm+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D10214BFAB
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 08:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718699326; cv=none; b=joCDcIMynTx949JI89IhTb1dpzOIukkG6Oiu5Y5AOpEKPMJ+Hv1EzckDNr5UNZmogNOUVfzkZCZNsDvFKYYRZOFerO+SJpbkuMZd1GLO6CX9YmvITLJJnTaWB7JVvzURzOE1WPiGu4lv3IBEcRzHrAalubQPqf31Zbazflpx7gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718699326; c=relaxed/simple;
	bh=J7Ubp8bWtL9MUA5mJeU224tE13X5WxGju7ElxE2/nnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QI0cK9gilsXbYNxXyay3BBva8FZgWBZJ5pvKPBCObUumfkQL0c+sFqEENg4nFw2I1G2iSSxtA7veKMlApRTwxDNA8M0mGmqCQHitaywcWoS993M1aW2T9F8ZdnABvZ0g3Sw6LoCtuIJWcsMmPySanzIZN/XwkzWTSJf3mVbX9lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sc8Q8mm+; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ebec2f11b7so50807951fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 01:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718699321; x=1719304121; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bYZjAGpgEt4oOgf7LT/jfEKyned/wQxFG9qSD5B+G2c=;
        b=Sc8Q8mm+DIk1cJDvXMdlrDhYlT3dCmzSbWhtCjXyEyFOVzdxWXFx7mAppiYwcJmu0+
         VV6PxTYonpHYfMylsVwX+BSkKStbOCTiPkH0ABj9DvMUIs5v+lx9K9tbiRXTLswQoV8o
         JVfvpeFz8h2ANI4D7VsmwZ3VWP1p0MN+El1CxLOWO5VzE/eFfusYVrTql76kR4EazwIk
         eRkp4Vleub+SV05JvqgsoVRhec9/vmMK4folP+bWEa1MjKaatbjVXQ7ee5sv/z9CVIky
         s1Jw16p4GS/mEEz8lSSaKg8qLf4af97eJZUMtoWIk61UsbLmTQKiYHdFa3ZZw6Yr6+P2
         /v/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718699321; x=1719304121;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYZjAGpgEt4oOgf7LT/jfEKyned/wQxFG9qSD5B+G2c=;
        b=ALjxM/Yo1YsjL9DHHmkSwNihA5RJLeRMqFmxe5RvHpK7Ir6KzoMm+zSz/NL1XJ9+iv
         o5JbaPNLm/8x5emxQxdgplPigYyojsEGk73DwOwCtcM0AshvA1oDgBmw7eISvZO9QpYT
         Rub61OfdBllWTM2BA1Xw7pOPiGYRXo+RFaFM18mXyzx1JasCAKRtvj+zMwmFmM2HXHXd
         +jxufDJVh06QcAq577eKppA80XIEnHgF1ZljBN4n+JFhblS65spL7ajUV5AF7UiBwacQ
         RTjqhkhBhM6YYj18IzC9fKu02iCwFxhlda5T8i9RD5nNXLM0uukwPqJiyHOpbA8Px7LT
         BuiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBQdni13dEflT/nVaHmu4/8DwJGEFRBMMFQw4sL3tqcaeZXmie9Gii7QBG/OhrUZixPTdjNjHKXK/2Xa4Urh6yKXw6r/G7oxaBVlmmOA==
X-Gm-Message-State: AOJu0Ywk03wpxzRLBVL7N9AdaGa5E3dXKhFxA/He0D/+GCA8kNm5ga4p
	WCx88XdCjSkIJsrSC2XXeg6PkvW0ywYDeWvaUPZVcBUPYczaHmWlHlTRXjaKOe0=
X-Google-Smtp-Source: AGHT+IEwq8nhRRqn9q5YxuzIXR5AcAtlRS1/gJNxZ9ufr0fPbu7ispovCsrRMZxqawaZ5SghogxRog==
X-Received: by 2002:a05:651c:b14:b0:2ec:f68:51d2 with SMTP id 38308e7fff4ca-2ec0f685646mr85838011fa.11.1718699321178;
        Tue, 18 Jun 2024 01:28:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c7813dsm16388561fa.76.2024.06.18.01.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 01:28:40 -0700 (PDT)
Date: Tue, 18 Jun 2024 11:28:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 5/5] drm/msm/adreno: Move CP_PROTECT settings to hw
 catalog
Message-ID: <eob2zex45yckr2ufuq5deerpuiwhcyfpzxrqj56zoc3t7w4uye@kwvr23fxhvex>
References: <20240617225127.23476-1-robdclark@gmail.com>
 <20240617225127.23476-6-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617225127.23476-6-robdclark@gmail.com>

On Mon, Jun 17, 2024 at 03:51:15PM GMT, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Move the CP_PROTECT settings into the hw catalog.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 247 +++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 257 +---------------------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |   2 +
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  13 ++
>  4 files changed, 268 insertions(+), 251 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

