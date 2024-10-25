Return-Path: <linux-arm-msm+bounces-35796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEF69AF999
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 08:09:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE11B1F22251
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 06:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E029218DF97;
	Fri, 25 Oct 2024 06:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EnEFtAc0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFD518C030
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 06:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729836588; cv=none; b=Im8SMjwawvQSU+BsjGv886gInHPskaDM4krzo6JVrSYmgzbxxp0YrKuVPLnlwJPJwKw0QjE08ulTJKWNfNjU4NLQKWP7ZxCFGRaCVT1Pkq6//AsitHLfLwlWi3oKiMeCH7EUC83OmHKi8gXQW5vHqZBwZFd8SaeAK/ffo8dsGAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729836588; c=relaxed/simple;
	bh=VKgOuDEd4K0E7JpJ6DvceT83rJrIPW/PLFYrcwLMdFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tzwmO7YWTaHZsibG34LESNOidZWT8g2sfH9iY5NVoN7KPs8AeLROJ1cavUZftLgajEAYZseEEWJ74EycDdVfMACWg6NODkQoMUB6qCJrzYmDKipnaH+4ShBiRKN2lxrdDms1P/TizJ4tB4toHrCVZmSECEBm4QEU/P7ieGmQrxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EnEFtAc0; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539fb49c64aso2917574e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 23:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729836585; x=1730441385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WGSwOfNTwBF1RVfw0bMgmzFOpa40Rq4a6Ot02SFfHkk=;
        b=EnEFtAc03jVWECQr6qj66CkBj0G512t672ermJog1U/2pWwVBWK7gosukv7wEDVijp
         Ta1Ah3xWmcuDT2ZlAFloU0imFdldCeXQI/e2yNQwtnZ9YEO/kb+tOkDGMS6BdM+mSONB
         IcvQECQ9vhau6cSU2uXVIeVyGZjb+V3AOym8bUXhm6RopSKMcO4iRQbJmTcx55KYWiee
         gEscLtkzi3xg9pajlndhurcog0DXfRfaBRGqP47ASOjoPrmaHOnEU9ZOkJ+ww6TwrS7H
         2nX13Q1quuKtvubEIF8CwG9cZ6WoA99jkPRvHiYNTo5SrmxCVxjcL3Zv6dM+dhEQrj/5
         sYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729836585; x=1730441385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WGSwOfNTwBF1RVfw0bMgmzFOpa40Rq4a6Ot02SFfHkk=;
        b=dZxSeT1MHoLaUYlZIiAxHxIQwDAdSvIVz/qu6IAN/wRCQ51yBDmBfJzc4oy2FegX+3
         o7oqdUWeADEmmvMmDsKnGI7HhY+9fLr4RMlG8Pm0vQ59SWxG2MrZoLAJuoZSG9+amtIV
         muNNb5pf916NvpFH0Dp0iXQ+zzgNrGmHQ3f8U4ic6p5zEmFrhVofHa/puIIMpdzCnilr
         Me0033ECmntONQMoqLfqQciXuiCLtaXLiCoDZoQAE/i96bY663bMj+yDC6U8p+n+9F8O
         +bpeNX4GyCu46MghwO/g+azduvlOYEiwjofQDeXoXtnYLXLWDs608w3wBdIRUotPqNHQ
         W8Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWmCyKByMbcUjL1ThnsU2v8PpSUOv9OKRRYhjGGo0d05yKnsReaZKAqK3An7ZxpMOXkPSN9jqb9tCVOlG6x@vger.kernel.org
X-Gm-Message-State: AOJu0YwsgFD3BZI/hZBwZUGsTJrAeqHIwAo/Z5wIyTwOUyqmumd2qiXl
	q8F531/i9lnJksEkxUz1nkHhCQxVnGRZOPqvgIOEH0vtKaaHyDrgAQPcjlr15y8=
X-Google-Smtp-Source: AGHT+IH4kY+TfZ1uw4oFVFJNs6S8ff7aK9mZHUyqqpe7W5BmQI8FuCowWenPXdGmTodC/EhUEC9URw==
X-Received: by 2002:a05:6512:258c:b0:53b:1e9b:b073 with SMTP id 2adb3069b0e04-53b1e9bb2d6mr7381629e87.3.1729836585041;
        Thu, 24 Oct 2024 23:09:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a915sm64598e87.12.2024.10.24.23.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 23:09:43 -0700 (PDT)
Date: Fri, 25 Oct 2024 09:09:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
Message-ID: <tg3jxbw4dqafaikl3yfvbl6jwou4ow2t2dnknmm2xpvbkjejrb@7yg76ykbxjns>
References: <20241022-a663-gpu-support-v2-0-38da38234697@quicinc.com>
 <20241022-a663-gpu-support-v2-3-38da38234697@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022-a663-gpu-support-v2-3-38da38234697@quicinc.com>

On Tue, Oct 22, 2024 at 03:16:05AM +0530, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> 
> Add gpu and gmu nodes for sa8775p chipset. As of now all
> SKUs have the same GPU fmax, so there is no requirement of
> speed bin support.
> 
> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 94 +++++++++++++++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

