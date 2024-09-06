Return-Path: <linux-arm-msm+bounces-31083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F15BE96F088
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 11:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2874C1C21A03
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 09:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E41771C8FA5;
	Fri,  6 Sep 2024 09:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ISZ0rq76"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3657E1C9DD5
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Sep 2024 09:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725616539; cv=none; b=G3y+/DD7meQw6aL15oePFFA6R39FJYj01Zl2knmchyGZXo/CHavBcG/PR80YMG0wmg4OKxIp9WLxRDG0mMVhfxzYfZS09989WG8hUpt/SnMWTbqrr0rDoAlDSPYvo0WXv01IeeKEzuACpJZsg3+f1lLpA0F0F/+UfzLCjON+K5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725616539; c=relaxed/simple;
	bh=VqOJ93A0a6WVyrazrQoqpPbwhh2VgG2wv/lBNfvEmfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oB6DaK3uKHJZe8huyfCOTA9GQfGhwh+mHMPOkuwtBpdJPZbobN2Se876uAyyM6ER7PKYK5qmJObqhSDf+cNTDAigS1nkkD/ZdHX57o0lBCJkOk+6iXJq4jYQBVWmbsfpO2pjvdfVaCmpvW4zTs0AgDP/5tfN8aTiUg9jkVyr4C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ISZ0rq76; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53654e2ed93so1832377e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2024 02:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725616536; x=1726221336; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E0KxWIleE3u20+F+aCD6IZbLW7v8LcTSKTjCbUE1knk=;
        b=ISZ0rq76ns7j9PQ2dTsTFqPF3YeO+tw9TIWB47gM72S73NJS1h4h8MxwRwfaPCk6i8
         CfAWZQ+sfi3RW9+el/7gxo7ycKmfDGHtSTOxbkMb8eQgGOQ2gN4885PTd1S46heqAKwP
         HUyu/YE+swRoh5ECEYmj10NJYEi6QimSzLYB5jffTXKcEm8OGCI1mo/yabhEnBQF015Y
         wVXnVJIki3iMF+yjBP2kP3Y2EbM8OmcFaf9Z2kF6Wpsa8NODntvfPgIF9iyWo8Jj/prE
         CzsYZsoj6j6mKpPIMNz37big4y8VqB++L7VQqklCcHPEKy8S85QoyAvj65sC9Q+tyhSR
         nDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725616536; x=1726221336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0KxWIleE3u20+F+aCD6IZbLW7v8LcTSKTjCbUE1knk=;
        b=oFdSzAe1toLgQrfNEu/8L9O6TS9mOPtsvSCpMb8YdSudixCbWlqorKusmm9pwET34n
         phGgd0te783hodplc7+NTPdcI8FXWm53WJFkNTpCS9SFwt+NB2hc4CtA8M5SG/4I1V4E
         B445jmo0GpmvnQ1kmE6QmBvwFmh7j/SW0H2mxHvgnP092tSvkWOyn01orIzdIFOTS314
         1zsyAgwkEN+UQBz//V/QzsdVW/UhW/OOelWv8y+rS+8Ol5CTn4L8QsKiwqse75MctrrZ
         DkkErvhPpBFHG8l7nGyQIuXfI5qeJnhpzPjHjHWSrQXYl5ZlEBaYHtKLntRwewX2qrbo
         213A==
X-Forwarded-Encrypted: i=1; AJvYcCWfGPEIHK+IKB0E4BCEAtJRbvihOO2LavDtI0Bg52AGf2g1a4mwt6JbR7OYnI5LUFgdI/mrvxfYPaoc+ncw@vger.kernel.org
X-Gm-Message-State: AOJu0YzYGxAj/wDib+SkOl2U6ZbMAFlA1bTvdmXx+5WFtSFz5spsI8pv
	uk1ZYKtRni3GBPtNAcxY5Znbh5hVJuJIL/eFTSW/Bz/pSVzDJbqK4rTgSTLkf/s=
X-Google-Smtp-Source: AGHT+IHe6zEb04EsF0hZnI8DiBbVQp4TFTFoRxW/b4jeG49e40MhUMCQNyAhID2vjkNmhWuQrjfCRQ==
X-Received: by 2002:a05:6512:1250:b0:535:ea75:e913 with SMTP id 2adb3069b0e04-536587c6333mr1667237e87.33.1725616536233;
        Fri, 06 Sep 2024 02:55:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536592c2dfcsm120331e87.260.2024.09.06.02.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 02:55:35 -0700 (PDT)
Date: Fri, 6 Sep 2024 12:55:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	daniel@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, p.zabel@pengutronix.de, robdclark@gmail.com, 
	sean@poorly.run, konradybcio@kernel.org, quic_abhinavk@quicinc.com, 
	marijn.suijten@somainline.org, thierry.reding@gmail.com, mperttunen@nvidia.com, 
	jonathanh@nvidia.com, agx@sigxcpu.org, gregkh@linuxfoundation.org, 
	jordan@cosmicpenguin.net, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/5] drm/msm/adreno: Use IRQF_NO_AUTOEN flag in
 request_irq()
Message-ID: <5j626cfkrv5otd7v766r5ml6v5xtxrxe6ezp4m3agei27bvb4f@whi2rott2qrt>
References: <20240906082325.2677621-1-ruanjinjie@huawei.com>
 <20240906082325.2677621-6-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906082325.2677621-6-ruanjinjie@huawei.com>

On Fri, Sep 06, 2024 at 04:23:25PM GMT, Jinjie Ruan wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable when request IRQ.
> 
> Fixes: 4b565ca5a2cb ("drm/msm: Add A6XX device support")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

