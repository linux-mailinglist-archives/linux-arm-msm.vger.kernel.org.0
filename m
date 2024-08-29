Return-Path: <linux-arm-msm+bounces-29955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCFF9640E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B3D71F211EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 10:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2ECB18CC1E;
	Thu, 29 Aug 2024 10:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vzb61wKO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C397C4A00
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 10:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724926022; cv=none; b=iZZ5es5UARqgAg2cw2XaDZvSEpGEgteVmxaldCgKu5us/4Xcn1QXs4GmTA/VFA5HVXprfa72vdqg1jBJOflj3XIjybPfFVVls8TVqx2tyPp/RSyfepSjVxO0ZjqVfYg4xQGRSYcLx2WuZcFGkalY+u45+XkIlhe2n/+hfq5Uc5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724926022; c=relaxed/simple;
	bh=ZuoDD44tNeycvKn5O9iVYZj0plCcUDqFpueY5KbJbX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRdnnKIpMhdsUQPuRhg+/gGIzPTO7CjNKNsK1eOnLwrheWBEfzl7kFkva1pCDrospqBp41YcL+h0ofrMw8EDeG07vnYAjwL2zp9cAtvGTrErkU1JkzCW2p9V+e1nPltO3x/EtF5McsdQa+LA5VRqiHr1860IZ+XNT9wrGuuIfQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vzb61wKO; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53438aa64a4so517632e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 03:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724926019; x=1725530819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p4m4sFOZMDTMX82iw7f1HhdQ6KEhLtr+hrPhztMpqLI=;
        b=vzb61wKOL/tdMQ+oG9V7e/Ya+sqvSsHLuVzdIV+gMVyKUOC2AAuhKfdLxNou49sabT
         DvALHBVLEnz5jIeLV4zBX4f8j4mHTM5P3KPBLqmnKI88tU9i8lGdGvvdMDM7dxqNcgUU
         dvw5ZzgsAjEZ6dt5xy3K+hhfZmIWIW6w1nwVimre2gd4J7X+L0gQAANTY0HHwQkE/FRF
         PIusHC1dC7+pQSYyQNaYy4DrOQfubvvQUDQP5pMTvOtRhn+QiyLbhBzy3usvbG/jT/b6
         a4lbykPtpBytW6ISMNcqBIfYn/1gD0Oc5yca40CZsDGRxOoPW0p0+zcdfiI0KAzkMWlt
         vl7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724926019; x=1725530819;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4m4sFOZMDTMX82iw7f1HhdQ6KEhLtr+hrPhztMpqLI=;
        b=uEvV1fBID65jql3nd1gpc4s0hGKOdGHAckCGYqk7KiO794iTFoPQgIJ0I+9nJrxQ8y
         yAGgfeRNSR6NgQQOrNenJAnc7Ev4nQ+oWn9hFe5oPfmPP0hy3IKO6j4CKRzHRIWZzPgm
         qvZp+WhkxyglPZPk71id84lnADBbvutmWvfQtXZ3JdoqLihoPw0l1MpQzObyo9UPVEsI
         /hk0PTZW9sWdoZsirb96IDKKcHybJz2ikHNzZQfRS7ko4h0oBt0ZqIUHkxC08awOnAZA
         Xzt0T3XveUtKJEFAbNrPn+VTObnCusfe/Or8PIFpQtg7sAM6KmWKw7GTYYXDkudzRSiz
         Q4uA==
X-Forwarded-Encrypted: i=1; AJvYcCUTrmt3OhlG/IuhAciD1xsosFfmG95r6TIVNXdhmd7gzvAqS+aGjNUUnTGo86eQravFHtBPR0XcwB0CQum9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4uM+R6GpN+EfMjO+uv3ApgchJDhoeVUWF9OwJsCJt9L2oE1zR
	luyTCxcHxgGlp4epdOBAK6NQQIO9pqPBpqe+JE9KZMbTDqwxqwk5jbMCRNL9mCQ=
X-Google-Smtp-Source: AGHT+IEAyzzgG0+l2SSqg3XbyWi54g9EJHgJyEiWmSeAfTXoSsLIi75kAP68EXftAzwcFS197Ifz8Q==
X-Received: by 2002:a05:6512:3f0a:b0:533:460c:e42f with SMTP id 2adb3069b0e04-5353e5449b2mr1408030e87.4.1724926018326;
        Thu, 29 Aug 2024 03:06:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535408593d5sm112334e87.306.2024.08.29.03.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 03:06:57 -0700 (PDT)
Date: Thu, 29 Aug 2024 13:06:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
	marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] drm/msm: Use
 devm_platform_ioremap_resource_byname()
Message-ID: <6k6hghic2ay277jg5tddihqal2i2fta2aam2du6dbjqq4whcjh@lilojqbwgnsx>
References: <20240828084849.2527115-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828084849.2527115-1-ruanjinjie@huawei.com>

On Wed, Aug 28, 2024 at 04:48:49PM GMT, Jinjie Ruan wrote:
> platform_get_resource_byname() and devm_ioremap_resource() can be
> replaced by devm_platform_ioremap_resource_byname(), which can
> simplify the code logic a bit, No functional change here.

NAK.

platform_get_resource_byname gets mdss_pdev, while devm_ function
uses pdev->dev. Passing mdss_pdev to
devm_platform_ioremap_resource_byname() means that the resource will get
lifetime management attached to the lifecycle of the other driver.

> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/msm/msm_io_utils.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
> index afedd61c3e28..6f7933f01ae6 100644
> --- a/drivers/gpu/drm/msm/msm_io_utils.c
> +++ b/drivers/gpu/drm/msm/msm_io_utils.c
> @@ -54,13 +54,7 @@ void __iomem *msm_ioremap_mdss(struct platform_device *mdss_pdev,
>  			       struct platform_device *pdev,
>  			       const char *name)
>  {
> -	struct resource *res;
> -
> -	res = platform_get_resource_byname(mdss_pdev, IORESOURCE_MEM, name);
> -	if (!res)
> -		return ERR_PTR(-EINVAL);
> -
> -	return devm_ioremap_resource(&pdev->dev, res);
> +	return devm_platform_ioremap_resource_byname(mdss_pdev, name);
>  }
>  
>  static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

