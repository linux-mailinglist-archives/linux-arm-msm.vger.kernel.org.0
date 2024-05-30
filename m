Return-Path: <linux-arm-msm+bounces-21148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B94C8D5067
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 19:02:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFD651F226CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 17:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F05A433DD;
	Thu, 30 May 2024 17:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I/U5QU7Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B79C3FB94
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 17:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717088565; cv=none; b=BDVvgAKKRTt1HHvNMprvGz//iY04Do4KqBnxCqdLSGAopi8AgqGMaZ+Zv9JXaSkP/2kthX4tggmzGijIcIDK4PWO2U9N4E36/9NEfnEhFp21PEd8NxcQZciCxlX/MJEOJDfwLywSEBmXh2Ed1PHVmzIQZVjPqQD1j0rSXkgaDqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717088565; c=relaxed/simple;
	bh=NdeAZFb/TEcSPW596tqV59n63pD22xeumxgqmJWgrkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RdxAnpXMQIuuU1AW9k4CwLLIiBaMpJN+0YLpG1PShToQzj1sWgfa3NSg+9F1D5X7GhVZ0HquN+qKAYblRjJ4c7aF6gPl2VQr8lSYiHWigUmXsBhwV2LBo0NGOTmMIdZPNhHb0fPQHa59ANUJbLj68eEvOL8O0BGgYnaVULVci6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I/U5QU7Y; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52a6ef5e731so1756555e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 10:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717088561; x=1717693361; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xXYZN/m1C6PG6AKOiFq8myIP4DlpPrlE9EpwRqlB3rc=;
        b=I/U5QU7YBRAFFV1+xlZ4rHsPBF1WB5JG7G7PQ95yyFbphN6K/3HJ+cZE//1cRogBL5
         fGvhWxzSuXwoxA4eVBAau0Bh0JQG2554EmZBkroYkDFFCA7iTUcmnRRyUlRiewww/zVi
         kjrgTeTxAsed5DJjJQb8xpIePlE7eJ/Wn07CVP9Tvb0L2AoaRFnb6PxCD3jJapOjZlcm
         1dhqEHPAbH3/jntx0BfNUHIZipuWs4lHZKMy020r1eBacLvDLDW0+el/9A5k4HbQjBGt
         Oir76rXgC3DoqkFs0Ygy90lP+f3o2fDeZLynK12RNXBmIKHOPSrwEC4nonq1YAgWFv4h
         SzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717088561; x=1717693361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXYZN/m1C6PG6AKOiFq8myIP4DlpPrlE9EpwRqlB3rc=;
        b=LukYiHAaYA4r0weiblfJmfYg9ksE9UixWTmb3OeLBdHoUcYhEsPIvk7MKPvO+CFRdi
         Wr+d1mD3DzVEjDWgaVuiEw5BjUsGeNqMsFCfkbHascTqQYPn5NfZdgGcmByNO5k/5/j/
         cuteo3W4sgsfbKkWTSDKkQIPeOKLHuB8CMYsGkYMO0bymOAx2JRA+Dbs5MHpw18vTM+8
         3PcnIKIDmDWtxN1lXI46tQuHb8c3BJCjQSCfSmXCPddvWTVRMupZ2Riv/a5T2lsBstlW
         FMBAJ//j1pd/u+Tc4U5mUPhBuRQQtyUqRbBC+TRjfEhexT61Y9RIlia8Z2+RSls/FqPY
         vIeg==
X-Forwarded-Encrypted: i=1; AJvYcCXelc2D7sn9r6/4eUHJox8QTUEMmWpIK02OQqWTmBDdoEY08njYmx16tKfaJ5Ud0Xvc6IUIye35JjLrawxYMUWnimh0uLpeTwjlZUo62A==
X-Gm-Message-State: AOJu0Ywvf/GpaUxrZoUlx8Tw7I/TCq+nh/vka/ggm/Q2p+cWEJ0Z4A2q
	8eDu2VnvpceOBm0I0X1iFh3dw8KnSFoKImgaw5bIGp2Jv8pcB2/N1VkwaDXNuhc=
X-Google-Smtp-Source: AGHT+IGfsP4JlJIU3M/U8H0MbKgZB3+fSFpnjQllEv3/kyjSgbEmTlO5kxEjkv7SgLcb/drvXLwjlQ==
X-Received: by 2002:ac2:5594:0:b0:52a:1987:baf7 with SMTP id 2adb3069b0e04-52b7d428977mr1743551e87.26.1717088560648;
        Thu, 30 May 2024 10:02:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d8e413sm14912e87.285.2024.05.30.10.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 10:02:40 -0700 (PDT)
Date: Thu, 30 May 2024 20:02:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Enable
 USB role switching
Message-ID: <p2k7fyqew7u72yjv64cvbzacpgh2sf2lexb3heuvls65wu7whf@34bcxd7jbqna>
References: <20240530-fp4-tcpm-v3-0-612d4bbd5e09@fairphone.com>
 <20240530-fp4-tcpm-v3-3-612d4bbd5e09@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530-fp4-tcpm-v3-3-612d4bbd5e09@fairphone.com>

On Thu, May 30, 2024 at 05:05:49PM +0200, Luca Weiss wrote:
> Configure the Type-C and VBUS regulator on PM7250B and wire it up to the
> USB PHY, so that USB role and orientation switching works.
> 
> For now USB Power Delivery properties are skipped / disabled, so that
> the (presumably) bootloader-configured charger doesn't get messed with

From my understanding the no-pd, typec-power-opmode disable
PD negotiation over the USB-C. If a device gets connected to the power
supply, it will still negotiate something like 5V / 1.5A.

> and we can charge the phone with at least some amount of power.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    |  1 +
>  arch/arm64/boot/dts/qcom/sm6350.dtsi               | 50 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  | 58 +++++++++++++++++++++-
>  3 files changed, 108 insertions(+), 1 deletion(-)
> 

Usually the SoC changes come in a separate patch, but I won't insist on
that.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

