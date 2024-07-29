Return-Path: <linux-arm-msm+bounces-27325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05614940064
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 23:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC2E3283855
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 21:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2B118E744;
	Mon, 29 Jul 2024 21:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xOgYJwNz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF7518D4C9
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 21:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722288558; cv=none; b=IknD2ZjSDV2ekUlMRf7bfy7oj3FapLguKTCeswtZqn8t5ooQlj5QXNA26AlKaUD62XLaX9JKNO0eUrVN4fY+LEV+aS3cvUN27HoFAFaryqe1++LMQBr29KJRkLn5+1oDmZGl6Qc/rQup/vRKY9q+DjmZoQw9MUPj8LpeHugTTVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722288558; c=relaxed/simple;
	bh=TVFN/CXZ51tNyS9FDN34bX0XjUq6i+6bt6GMO8uJeCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R3RMBxFahVug4oN3BelG3iqDJoauLAQ2SL7EmEvusK037n1O9LFqV68+oMpTGaaWauCHOpEwF3fvryzIYTnnPoyK+GLxSQZvviL6LLpVmdWefxmR3px38s4JSR0ahyJgpKBqQggZ40t2IPGAYv1oeIDUPQpVPwQdSaaCyg5TLCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xOgYJwNz; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f0dfdc9e16so46640231fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 14:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722288554; x=1722893354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R3tBjhHkIyFqAEajxTJPjMrc5LRc364fGp0t/5OMkxw=;
        b=xOgYJwNzBKMtEUjIXPz5krdDzaDV47wLY4/Lt9lyvXX1O7W/S1EJha060cHAvm72Vg
         JNT0567w/zdDwAPF7dEwN+b/URq5ZhR6N9pxj8wWrsYUryKW5Oie+wtnwyi+TmO+2sY7
         Q4lvBnAYoiUNIkES5yHfdTJZkQB/54JigBewd80VCpu+XSKc6DsYCrnNU+u/8+3mYTez
         Kvrc+3I2dpFokM/vwodDa8V0iVQ+cUjSKqvG5dce7SrDKa40SmUGmz2LB2gfa+fcPfxL
         rEyD3rpDliLBm49gFVi1TdUb1PyHJB2Xne2JQLo1SVRhssRyI5a+QFt6nTpoe0iRS7x0
         O+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722288554; x=1722893354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3tBjhHkIyFqAEajxTJPjMrc5LRc364fGp0t/5OMkxw=;
        b=OPCWUC78tmaaQn3Kx6htbBoHhH6GMaSaNSNaqvW8pbGamYXtPa3q8dLfsMgvm0Ww/z
         olQyhKm4BgE9OTMcc3LaJVDD7mLhBO1FiPUmh1n1QptOQKqNAA2j8eB2sBkHzIF6Pcd9
         BO8CDJfO0KXfiLwPJBqAfgI38CbjAGwiLoMmgBf51V9J37BU8LAG7opboUi0sYwZThTq
         ns6oBM0Le46fPXx1u66awEnMKDLTIgtgnE3PhXGoz2g6ItzRxmB/dDAaptWC/MQvo3O4
         xAFvFH/Yv42+UmWAXMAm51zS8wR9077mqh+0hgqToZU5piL6Wc36nrOgAFGMp7lkGEpS
         /Mbg==
X-Forwarded-Encrypted: i=1; AJvYcCXHT3eMDUJ5D31ypu0Rok+PsopWIn+5kCmzLqCWqF/HccRVDdaoWLrlEx7/nrpXr1DYH76di6s7BMo6xqpkGMprR7wT1/bK2rbzwO0tJg==
X-Gm-Message-State: AOJu0YylrlpZOj/MMcVIDBjXBUYSHWI0hJ7b27zQL9N+yCUxvOUGdxTq
	jm49p7jGVcXq0z3CIsRQbo1KRAcPxV4049/NoWccp6MKk/YYUQiy3AzguYh4scY=
X-Google-Smtp-Source: AGHT+IHGXIrdh6i1p9LXgEyc3MwjtnVaZOQUxFLXA43PhKktUbIyS0XJQZwMOAUl5Oc4lX823qdsTQ==
X-Received: by 2002:a2e:95d4:0:b0:2ef:dd45:8755 with SMTP id 38308e7fff4ca-2f12edf7f37mr56827991fa.9.1722288553889;
        Mon, 29 Jul 2024 14:29:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03d04e138sm14669861fa.85.2024.07.29.14.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 14:29:13 -0700 (PDT)
Date: Tue, 30 Jul 2024 00:29:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, konrad.dybcio@linaro.org, rafael@kernel.org, 
	viresh.kumar@linaro.org, heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	kees@kernel.org, tony.luck@intel.com, gpiccoli@igalia.com, sudeep.holla@arm.com, 
	quic_rjendra@quicinc.com, andre.przywara@arm.com, ulf.hansson@linaro.org, 
	davidwronek@gmail.com, neil.armstrong@linaro.org, heiko.stuebner@cherry.de, 
	rafal@milecki.pl, macromorgan@hotmail.com, linus.walleij@linaro.org, 
	johan+linaro@kernel.org, javier.carrasco.cruz@gmail.com, quic_kriskura@quicinc.com, 
	lpieralisi@kernel.org, fekz115@gmail.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-hardening@vger.kernel.org, linux@mainlining.org
Subject: Re: [PATCH 06/11] usb: typec: ucsi: Add qcom,sm7325-pmic-glink as
 needing PDOS quirk
Message-ID: <vfo3bwozhf3f5bv6yipx6h3zgapiwzotw5l43he2q5h5ofpg5s@o34fxv3ly5ue>
References: <20240729201843.142918-1-danila@jiaxyga.com>
 <20240729201843.142918-7-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729201843.142918-7-danila@jiaxyga.com>

On Mon, Jul 29, 2024 at 11:18:13PM GMT, Danila Tikhonov wrote:
> The SM7325 Linux Android firmware needs this workaround as well. Add it
> to the list.

Which one? quirk_sc8280xp enables two workardounds: one for the firmware
crash on GET_PDOS command and another one for the empty PDOs being
returned unless there is PD-enabled partner.

> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index 16c328497e0b..80fb04473617 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -294,6 +294,7 @@ static const struct of_device_id pmic_glink_ucsi_of_quirks[] = {
>  	{ .compatible = "qcom,qcm6490-pmic-glink", .data = &quirk_sc8280xp, },
>  	{ .compatible = "qcom,sc8180x-pmic-glink", .data = &quirk_sc8180x, },
>  	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = &quirk_sc8280xp, },
> +	{ .compatible = "qcom,sm7325-pmic-glink", .data = &quirk_sc8280xp, },
>  	{ .compatible = "qcom,sm8350-pmic-glink", .data = &quirk_sc8180x, },
>  	{ .compatible = "qcom,sm8450-pmic-glink", .data = &quirk_sm8450, },
>  	{ .compatible = "qcom,sm8550-pmic-glink", .data = &quirk_sm8450, },
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

