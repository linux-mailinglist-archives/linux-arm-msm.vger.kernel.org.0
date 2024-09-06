Return-Path: <linux-arm-msm+bounces-31084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBC296F09D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 11:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5B931C21E70
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 09:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 032DE1CB13C;
	Fri,  6 Sep 2024 09:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kObCcCaH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398401C9EDE
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Sep 2024 09:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725616597; cv=none; b=YvCPXB0t3Cvp8EWYD39AkzUNLw/ofXRs7nfB7WVi/VRHWqIOoc5t+UqgML8IcLNnk7q8SfJF5QCHbIb1VeAAAvSZuawHO7Li3lBhRNH7zUveJ6R7InNu3yK5Z+G2Fq1bqGbEV/kn1RU2UG5W9Scb9MJwJ23jv214xgPs3Ko7zhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725616597; c=relaxed/simple;
	bh=CWG5M//CcpbxjWAbYqhipng8zW0m8WVrV/G90iI9XIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UAFEaFHgb375CH3TugVbaVgz/MOMogaokPdCvYh3UxX/R0ut4ywH20MMAOB9EoztxCIJ7YS6rcn3ewDSZxwiVEKmqhgpKFjHZuxMwVdx5mHdemVHcsA+GZIBvOxBVYvirgvON4rWRcWQOB9iGfwaGAFVOrB48phl8ooXzaKm8x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kObCcCaH; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5365aa568ceso307650e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2024 02:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725616594; x=1726221394; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v9FCxUIgBt78ivuRYf8E0aPqYHoOPKfCvJFGhphZooY=;
        b=kObCcCaHY/uMN41q+oeQhS/yUVDOJCbThnO9dgm2cLFxOWM92vimxeO2rddsUrh2Bd
         4G6y+c6VX4PZIsZwUFHKhfQJBYGj/hbd3twiy3Jzg7pg3QwdPDtAmFbJKcrx1jYUlYqh
         yQu2sDq3yTYVikpRhIn9eooVlozpHmrn+kS2/B1YFFqm18eqBiqpLis61pMr3WfowTif
         M1OUS58k5RiR1b1EphFjdkAEc8Qb+jym0whBwPO81gXY2l0XedmPEa11ivCr/x4erDoA
         OZ6w8av1s0MnVZ6RbKmAdnJrHRewgaYVVimSitUq6MA4dhE2Y1GUOcA7xsl7C32uu6fn
         l2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725616594; x=1726221394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9FCxUIgBt78ivuRYf8E0aPqYHoOPKfCvJFGhphZooY=;
        b=e2czVpeamcx8hre3/75nYkQsq5QvP9OfOTCfrsq58gQGgQqvQpkBggycToJBKcfVQf
         wOhMBJf5rGL0jbMVkWUszXQnDI258/Znjsyu7OseJ+LxnwY7/rJC8Y5W9SZutBr1rL6Q
         Q39BDKvY+6+v2fcK/S/9zjVHJhrAmUMr4my1ZUmxeq39TsQpHGJGL3mBTtnK3MwvSF39
         jdxXO7hR02Nk/uUbtyOQ+d7YakBCg15CUge19CxUwLeSZD03Hh7w3WcS9b/rAVvCo4Pd
         x2juKyKf5CA/ZmHuV4bbQH3bj7O1e5oKuZ744PH3ZsGB+WXsdzSVJziHHY84vLgB6fA8
         grNA==
X-Forwarded-Encrypted: i=1; AJvYcCXOeBK99ScfcgN2AG+xVkShvEFBHTOKSmZtXY5tgsAY+EbO9Fm6kUAIZVNSvgu+e8uKLIK1MdqM9TernI6J@vger.kernel.org
X-Gm-Message-State: AOJu0YzD5LfPv76fIF9lgjjq00UIWp1ULqMbu0L1XrqymX+BFXmJ+csk
	w14NPLfQIW3vI1/HvvYE/1XShc9tbupbHl3VbCAxP4Za5qkw2/jyEbRZGEJIB6s=
X-Google-Smtp-Source: AGHT+IG4NjSKk9CJsxL7X661oGVWb4dJGK9kAqeeKA2OE5R1RdOgN5Xic7eEYM/SdgbXf1sQD+KCfA==
X-Received: by 2002:a05:6512:3ca2:b0:533:45c9:67fe with SMTP id 2adb3069b0e04-5365880bbbemr1607806e87.48.1725616593689;
        Fri, 06 Sep 2024 02:56:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5354084edc5sm2826881e87.279.2024.09.06.02.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 02:56:33 -0700 (PDT)
Date: Fri, 6 Sep 2024 12:56:31 +0300
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
Subject: Re: [PATCH 2/5] drm/imx/dcss: Use IRQF_NO_AUTOEN flag in
 request_irq()
Message-ID: <dgrmcsmqjqukta226byebvbdopcxqapq6kaf62nmttbbgcb4vk@ptkkp3672v5k>
References: <20240906082325.2677621-1-ruanjinjie@huawei.com>
 <20240906082325.2677621-3-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906082325.2677621-3-ruanjinjie@huawei.com>

On Fri, Sep 06, 2024 at 04:23:22PM GMT, Jinjie Ruan wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable when request IRQ.
> 
> Fixes: 9021c317b770 ("drm/imx: Add initial support for DCSS on iMX8MQ")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/imx/dcss/dcss-dtg.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

