Return-Path: <linux-arm-msm+bounces-40741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E439E6A9F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 10:42:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A35B3285583
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 09:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A266E1B4129;
	Fri,  6 Dec 2024 09:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hCZMsQ0I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3271E130F
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 09:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733478149; cv=none; b=ApcqcvqA/OrU1JAYRu2eU0LRH5RNOcaUq3qBc8PwtrG7dXdcEMYZyzMw2tweByvfBWLAqXBjwGxzSAYaWiTg/14rhxJtJbei1UZ8+R92u6dJWvCnRxkZ7InAQSNWPyVt8vA18C8NuDNleLk5qgDUEHr4dBO9XhZFvfwi5eVIj+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733478149; c=relaxed/simple;
	bh=fnD8ZUeN3LHdllxutyGeLabN8SdYiuHEWMknGyQWBhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JfM8pHR/X77KUGBWwgHzc6dRbIwdGuFk6ZtsTvXBau5XgGxt5PWEV/1Dt4IKVE35RGti7P5u+ZaWwL0wXtgXLH7p7uU5oR9yQGcqnDb9FxXw54W1n9HbHjCAPO5dsx7zaS/QKu+z8pKAf0mPKv8xph8BohGZ6d271RVYayT50p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hCZMsQ0I; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53e2129be67so2167568e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 01:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733478145; x=1734082945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uUIRQbMczpjfL2wu8QV4pEN4I4ysbDGkQQGhfj0T2t4=;
        b=hCZMsQ0IqP2C55RV8sunKoXwVdRE4CMOB4aOleXM5o9OaCTxZXxLFQp8m7eaM4FVHm
         7zqPUpOzOVuFjcqeXzYyDZXeNXBNce+xMVkE/3WK+HYfwhFkZBAoffcjHXyX5YZMXC65
         VtmPnlQLrr+07s4YcNIFTrCK9u4k227jsQADiu1MIY/kxm34B5aaoWflRA0rVZIJZTue
         CwzTQQ5Jk/spUWNiihdyZLi6U4wplDbn4jbx8obJxMZeTI29ZyKH98svzqso7N3/4I2K
         /GUbwZNfS/RHqwbEUq3f/iYawSe05FzPjrani0R287sT2+oUZvIbeK4v7O+zonAqDUOb
         abrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733478145; x=1734082945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUIRQbMczpjfL2wu8QV4pEN4I4ysbDGkQQGhfj0T2t4=;
        b=nBOcxt9Hqo86ndU+Irzs3STjDjBdcRY8rOHqOhiGPZVbZTqRvk/epikwsua7nB8BoU
         Ic0LAoAPTXjuqpCGP8iG1D1p4xlJptXyaxr17NlDqpbY6PmCtas0DLOM8FAsE6MqENjK
         1CiokyjJZBnUJz717/BwPT8FlxjF+z6hj6ut7iW+1/cBAvRo3OA2r8Iby4qajy94qop6
         HW/doWn442tJTIwM2Z2aYGKG6stELYMXa3DjAxQvzoCaM2scp6InUCxvKF1wzZY+HYr9
         Mk6vbiDB+hnPKX/nhO64JYDOLzm5rWtrCDYdpNGb1L+2dstSbrhkE9VBfBopQvd57mLc
         aDpw==
X-Forwarded-Encrypted: i=1; AJvYcCVZi+1TbTxa7ceBECoHGBWSV/maqBZSKkm+pJ9nK+4P59Hyc+tO3DzOsboZEyn+jR29W/1Vlb1pZehVhX3y@vger.kernel.org
X-Gm-Message-State: AOJu0YzgBUtp1e2+P8iAa3GdecmO+ZH3AdznNRiCAVKIGDDgvPIkEbwp
	AypLxbKaIUv1e4mutEorU1eLmhD2e0LptEW3AXMbEBNZyjEwbEPr4ZAwkp988V8=
X-Gm-Gg: ASbGncuJguXdXCDXPhgS2ov81pQUAgi6bqFAfq7cQOZc1enLIpowThITOW7oDd71Smk
	8VEjwVRPyogPrpvDuvmeM4e1Z8GSrsFL9uDnN6JI+vkkMFesNHzw0v4E5RMpNVAQGwR7J3HMkqh
	mV5EqeTwtvXwZQ1QVPpHydNevqLgp85oN7bsw280sa+JmHfTDb/GCBe1IBsG8y7AKQAHK8vUtgc
	WbwSrnvo9WJJCVqIIOH1M5KMdJ8Qw8OFLBoyzEcJ+1mgQLLrIH0BeRqtEHLBl2l24usmeZ6VwsN
	BJ18MSwt5uF5fz0rExlzQEKVHwY+wg==
X-Google-Smtp-Source: AGHT+IH4esxK0uLXH9slo3btbx6QQTuIap6lMO09rzPOg/wiHUYCi6471yfGuoXePGv2SFTfDWGePw==
X-Received: by 2002:a05:6512:3092:b0:53d:ecfc:306d with SMTP id 2adb3069b0e04-53e2c2b575cmr685333e87.19.1733478144895;
        Fri, 06 Dec 2024 01:42:24 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e22975264sm450841e87.92.2024.12.06.01.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 01:42:23 -0800 (PST)
Date: Fri, 6 Dec 2024 11:42:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
	Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
	Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 16/45] drm/msm/dp: add support for programming p1
 register block
Message-ID: <ewwpuc3f7vqjeazgeebecc3ygrha4ujq5r7bg5cow56zzb564l@kef4v3bwo3bi>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-16-f8618d42a99a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-16-f8618d42a99a@quicinc.com>

On Thu, Dec 05, 2024 at 08:31:47PM -0800, Abhinav Kumar wrote:
> p1 register block is needed for the second mst stream.
> Add support in the catalog to be able to program this block.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> @@ -1137,6 +1160,12 @@ static int msm_dp_catalog_get_io(struct msm_dp_catalog_private *catalog)
>  			DRM_ERROR("unable to remap p0 region: %pe\n", dss->p0.base);
>  			return PTR_ERR(dss->p0.base);
>  		}
> +
> +		dss->p1.base = msm_dp_ioremap(pdev, 4, &dss->p1.len);
> +		if (IS_ERR(dss->p1.base)) {
> +			DRM_ERROR("unable to remap p1 region: %pe\n", dss->p1.base);
> +			return PTR_ERR(dss->p1.base);
> +		}

Forgot to mention, please also map p1 in the legacy bingdings branch in
this function.

>  	}
>  
>  	return 0;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

