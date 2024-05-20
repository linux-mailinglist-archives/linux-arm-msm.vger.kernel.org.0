Return-Path: <linux-arm-msm+bounces-20054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE578C9BD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 13:03:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B27D1C21A0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 11:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D207F50286;
	Mon, 20 May 2024 11:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aCJqIUWi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DA21643A
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 11:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716203034; cv=none; b=GZHG31W55SECKYXkmOu0WXJmmU7/UIrSbmxjFazSoXUvHexqO5TH2UFlBB+gx14abx56AFYOk182cwhkvBNRWhL3q7UQv3X3ZW5wsIPg7ZYUUf1KHlJewm1TWg0iBarydYfc+TblEsrfm0XQBkncHdxflR8wQLfZBKhyBHvrDH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716203034; c=relaxed/simple;
	bh=f2GOS3i38CUol91F/tTOAP4Cj+v7450c+gpjTS0SyZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZdRoeZY7FBKZEkCKshViy00K+Pj29vtQsbU8Ay++RJV0K2BqjElNzCbFsNOiIDO8ERBbaMVDm7HvWAQ9XVvhP/6WXM2f6XBCd7jKaIsQ//T180Ep/GJ/eZKu0ZeuG2Ezxhdkvnw9IH860II2xkW1UXdy+d6GGO1wcICl0sirtsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aCJqIUWi; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2e2b468ea12so35698991fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 04:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716203031; x=1716807831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TrnpWE7dPEJmYiT/RDr1bXYldnFvFFfi6hz3R8sA0hI=;
        b=aCJqIUWi5e6c2b1NFY6t2Q6uYqJ3ET461rIg213VoJzRFsTA4088wyU1TRtUa/nXsr
         6j2NprnaEEAumSGWTCAaoKJvzUHjxJRGFB8K3XtHw6l/sR07GDBzJuyMA05+R9qytprC
         msfSsUXDrl1fFqRTnhyLDXkQRuEsUDLM3BkCQMaABKolpFB2tz4GbUKkzfvdblOGPnRJ
         VCFC2U03G2+NVf1CbVC6cpQiQxcte7gnTd3ZgvDpOgKd5a1/NVrOItJjiu+I6F8M3KWE
         hgwl8QRZW9HkkxjPdhhb2AI7cq0cvXduiKRiKLEOoEY5SVfcSt+pdZ2Z+TxdyP06KOZd
         qqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716203031; x=1716807831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrnpWE7dPEJmYiT/RDr1bXYldnFvFFfi6hz3R8sA0hI=;
        b=YTngKEMPSu2WUYu5ElN5bEClHtBj+J8o07avWP/RycEptnEHIFYgQWM2EkhOwrL0sz
         E192kyVcg+cAK4uZnbJ8csYNDd8Rlps6AsMgbvJxC/FEuUsXqqAtaGx0q5vh2R7awXqQ
         SE2EY2bmjuV9L/iS3VDERpMBDJq/u5WkYmHREbI0DbzvWkDHGAVTm/240scTGgIGVETa
         2aHp1m8iBJPecv/Q+rSH2Frxp4pNxfPbgUE/EuW0Lm1VYgfbX4fKu5YxuLzJb7rvBBcw
         Gih7kMptXIR1wDkM+A6tIBGj2q52Kbf+J6n8Y/+tJWFvvOj74V1iCs+d4hUfes2CBd9q
         IIdw==
X-Forwarded-Encrypted: i=1; AJvYcCXQhJ8pGOdPmqrf20l0FOdlXQV4mB3VPMYjuRAT8CwBzEusnjFOJyj2j6SdiQjy57wDW2zeiB5a07v4v9Oqx8g/PMM7Vbj3A1+loEzOtg==
X-Gm-Message-State: AOJu0YyagpLDzxXLRffzpWeahN79nRu1HH7lZFCQxsrKvdzhQyohVfsL
	myHKefHy8PQQ3wtOCOVbMVEvZthxa4VRtmxfqr4tBG/4kq1kNBwHU1pP6tph8Uo=
X-Google-Smtp-Source: AGHT+IHrPX1EE5HJbqIWKfZcM1kS0oKboB5I8XtzpfJrKSrhX0xiWZVBV8AXw8xry+E6Y03ekdH7bw==
X-Received: by 2002:a2e:9d8a:0:b0:2d8:611c:228a with SMTP id 38308e7fff4ca-2e71714cb85mr17078161fa.8.1716203031220;
        Mon, 20 May 2024 04:03:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e4d0ce30e1sm34354131fa.38.2024.05.20.04.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 04:03:50 -0700 (PDT)
Date: Mon, 20 May 2024 14:03:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	david.heidelberg@collabora.com, guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	mcanal@igalia.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] drm/ci: skip driver specific tests
Message-ID: <mxolwwmi5rjaevuwi7qy6rm5n62rhnpbi7hz4n7xbshmi2hoqq@5uzamkipouek>
References: <20240517092502.647420-1-vignesh.raman@collabora.com>
 <20240517092502.647420-6-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517092502.647420-6-vignesh.raman@collabora.com>

On Fri, May 17, 2024 at 02:55:01PM +0530, Vignesh Raman wrote:
> Skip driver specific tests and skip kms tests for
> panfrost driver since it is not a kms driver.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---

I didn't perform a through check, but generally looks good.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

