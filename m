Return-Path: <linux-arm-msm+bounces-34951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E969A3DBC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 14:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EFF41F22CE7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 12:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D17129A1;
	Fri, 18 Oct 2024 12:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YLLbEkmO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C303CAD39
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 12:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729252950; cv=none; b=tW4sA24H+4I7DigbT1yC3P5AE+H0BBLeFu/XOIxokENCH8o9WD25QG2jCWM5tVjFPICG8mVbDFnS2oKWG9BEua/liTDHZbe4pVcx0nof/KYs5h74w5DMTd5PVubG2AsuZQvUnpswFf3KRQcX6kuoIRQX/DIRPRtm3+LaylzwTVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729252950; c=relaxed/simple;
	bh=TB1dGvfKO/U3vZiiQabzt22yY3ju7VJ8RJY1p7st6Hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xc8ALjAxNwBi7QoyHeZ7sG/GKRE/rvvp8nG9KLg90hyo4SJqBwTW4ylTkHKaU5nLtjHOtqHDgCMdA5SL/Izzpq8+MCtq1D4q/fdi8XN6sW88aV5zKR/+cNoWidzOsIDdBlaYx/KOGtAO1l4CkbkkMxh5SIQaUHej1LpGNxWe35s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YLLbEkmO; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539f53973fdso1577993e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 05:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729252947; x=1729857747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vAbv6XsDmwAo2jyC998ue0W9E4DrCSE3SereVqz2R1I=;
        b=YLLbEkmOoUE0oFoCAXRlUDTsm/mNzE4NjhkTXzr+01PKYr4FqiTV32JTA8/7LkZQoQ
         lYpMRb/JKnv0pgvU4SXsKMbSQej/eib2JVFX+UEhQREQoKYZdta5wGlpiRCKhxPkZ4NU
         RB6lX2+Weitj8y8Qjjx7/1rwU5i66VIXy+PF1ZadyNrID+sZXgLYf3+zHcER68n0kduB
         CQAPjNZrLS3QGBudLVe4F8HJwsp4esR/19KOsOOOw1KsBeQJR218ldDzi5xOvzcNyiH5
         /Gpxl+8jrIBp/ekengcGRmNj8RikDHyROplJSuYIvJYPUCDZ3qtVUcEyol+LnT4Wmz5z
         q0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729252947; x=1729857747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAbv6XsDmwAo2jyC998ue0W9E4DrCSE3SereVqz2R1I=;
        b=OTMoh0pXs2JuTVZ9bnN6rGZmS0Ko1SUfpIcVFa43+wHjRxFwhNy9druwei3NvZba0t
         MvpfM2Mao76zWsjqPQ9Jn/vXyrotRV8Az6LjVILiiW+Lkxl8cBOWguIQkYJ8dOziQkdJ
         z90l3nPMeRCwJE1GM3fRMXWN0VR8/9sJPlxtRr/a9oQCcVul5V3mJ2/+lidEIxgEkFzj
         HeRfZSla5QUXTMjoku1v/A92BAJXN5mE3QYlZ11JTia3pYsYMQbZXdGSqhxRoSl8du9q
         akythtuM1mrHrrVtCO7WaakyIIvA0X5GPCe6ox/cfmCJsvmkBmcSMjS4hatlntIPalMN
         aZxg==
X-Forwarded-Encrypted: i=1; AJvYcCUzwapaT+zI0Zjqt5SqShEhgMbWsQiELhfjcja1jWI/X7eWjWxsFP5vRmmhFJhz1irVrFhWJK65hRHjXHzx@vger.kernel.org
X-Gm-Message-State: AOJu0YzvwoUZEoq4tWx69uSjQ2ML3E4otoRwVFNUM6s9bAWWZ/CNKnQp
	9dOvILFaS+w4CQxKGakkkCHOGNN4ytOCE6ExtE2wyg+nAxOx0jofk+nTZIp50KU=
X-Google-Smtp-Source: AGHT+IHCFo+NNLfp0lSvn5YXtWignyK0C2gw+49g51E6ZF+fUhL3qAV0HflJP7w5Uvo/44V70tVY0Q==
X-Received: by 2002:a05:6512:124e:b0:539:a2e0:4e94 with SMTP id 2adb3069b0e04-53a15b9f2f2mr578807e87.30.1729252946842;
        Fri, 18 Oct 2024 05:02:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a152044a2sm202120e87.227.2024.10.18.05.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 05:02:26 -0700 (PDT)
Date: Fri, 18 Oct 2024 15:02:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, robdclark@gmail.com, 
	sean@poorly.run, konradybcio@kernel.org, quic_abhinavk@quicinc.com, 
	marijn.suijten@somainline.org, airlied@gmail.com
Subject: Re: [PATCH] drm/msm/gpu: Check the status of registration to PM QoS
Message-ID: <dpwmookr5owd43efowmnoxbtbzstvezgczpbzwxb5rwu3h3zaf@luim5srcbo6f>
References: <20241018111811.3534385-1-lukasz.luba@arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018111811.3534385-1-lukasz.luba@arm.com>

On Fri, Oct 18, 2024 at 12:18:11PM +0100, Lukasz Luba wrote:
> There is a need to check the returned value of the registration function.

Why?

> In case of returned error, print that and stop the init process.
> 
> Fixes: 7c0ffcd40b16 ("drm/msm/gpu: Respect PM QoS constraints")
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry

