Return-Path: <linux-arm-msm+bounces-49353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A45A44991
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 19:07:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C380319C57B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 18:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D1420E01C;
	Tue, 25 Feb 2025 18:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vkmQ7jAk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EED20CCCD
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 18:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740506614; cv=none; b=q5S9wYPUcsxrkYzUGrFHyuqyfK6GbSCBoWKR5fEu9TKHye3/K25o+tOOzic+PDyYVUAodxunMoIgt9L3sqy77u+EyNV3NNtxcph7XSxwoO53RpjIUtRekEa1gAS4vkVRif40V+LzHubCv5QPiKzOXGB9/1ObQHuI0OdarKPPKrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740506614; c=relaxed/simple;
	bh=S0vGc2fxgTl4TxHz9pfDkbgBvrLucJN6TxhxE7gqfBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wo5hx3+hCDUfyN31LFS5INa/Yqqgh2jojTkLOX07Zai1DQF8HLSrP/I6ksc0Oi+V2td/zvlOqDrQQYg3grr2uXMhSLbQ0T5OeCFiO1UMY/MHjgdfZMfCG1iZn1Uy5cKZlrX1Uk6aZspiG24AVoazoWHub0as0B+XG+0+CDjQox0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vkmQ7jAk; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5452ca02bdbso5535454e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 10:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740506609; x=1741111409; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8O4HWot5EUMVzTxv5rN66ccO0MtiNkXIqoN+/YVntbU=;
        b=vkmQ7jAkN/gYQOO/5PmGlbB38HvpHUF3j2ctzKvtglnij1M+kLRqO4oLONj46WY8sL
         sClSzi7xzDdbeqiDx3V9DJMsgMxkiJ3wSunK8xSsjIHWeddQL6T1Je4bVG9SvDh2/vIC
         azBqLO65ZNsfY6OkEChuajieEB99xb1Sjf0p0ABi7tznhF057mmCf8Cmpr+tUFwpF/MQ
         tlSLnSilpjDIqsT9rxlErVlDtyQnuyTS53VYFTyQCA+OlC8ucnFPyi56h7vfi580DBlT
         xCCOW6chyEwdeY5XHksc5ZoP2SF4BBV0C9wMSUvGpsLGpaXsVYB1L2TPQA6CGzInwHeH
         02Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740506609; x=1741111409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8O4HWot5EUMVzTxv5rN66ccO0MtiNkXIqoN+/YVntbU=;
        b=PiFmZAk7lnY/Dm1xSbnljHXzYUGM/6dKFlzRuRwmTE037QHZ6pRr77DihAa/lQqEEg
         5168S2FYrl+KDkZQMPHF7cNjBCbruhzehfgTk5ku3indzAvJO/juSJJM7S36ypQeKeHL
         +jXOHoiI1n5eEwGdes3LvUR7EvtvsUZR5ssB1Bx5x/nTYS6/oWiMzG9uBG8oIqnIgKgM
         6N9DjDY5e+wm7RGb7YZI3w4hrdftDWPSjv+okG5nTdbRwYaB641H1Pm5BsQYraAjzsCV
         8R01CsLGMNx9JVh2RJzss/vNuBbEtTiZDJvmAgXt2vIgTrlzGcxPdu4a1psxzKvLE/MV
         0gQQ==
X-Gm-Message-State: AOJu0Yw207EkS+ty02K0zbHW5ycWGx26odhjZLLj3c/3udvV63gI9V15
	dyW0xOT1jkA9eta7UiuKyT+4J61yKWcxpF4IdskFypDwLCjcLIbchUsDml1zi3k=
X-Gm-Gg: ASbGncvFSssSlrHHNe4jQA6+zWuRheTS7nV9B+/T4NoX6qiLaV2XWmCmuWC166i/cze
	okjTAq54lfz8Ydm7to1ITNz5MaOJ41gyADeKE/Q4W8+kpw6F+9/cQ6qR8SnW772EwKskkIpt4se
	6AJV234lHax//Rj67YSiYon73W07hlqXjnx1xuvWRYO4ucHKurnhWLlqgz4QZTeiMcJ+EbEBEg1
	0zasLA+7NbknJlhQrIRVMn1gvlzRMIFXWRXeWNR5l8+GpaB5tuVkBjyKxhmWvyBY+hkr0WmneV1
	wsupctOgFHy0dGCOBOO4s5A01ABsrtbXpho16iIrb6OcNIrzML7pfAtN+Btm4ztttOfXdVtaUJu
	hbDB8DA==
X-Google-Smtp-Source: AGHT+IG0Zc7wZsxG0nheOFfzzmCVwdzpAM4bFH1CEvsvsI0SU1fbCv6O1tOWiwsm5/goJ00WgZzfcA==
X-Received: by 2002:a05:6512:b05:b0:545:8c5:44cb with SMTP id 2adb3069b0e04-548510dc89emr2751908e87.31.1740506609286;
        Tue, 25 Feb 2025 10:03:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514fb084sm234263e87.221.2025.02.25.10.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 10:03:28 -0800 (PST)
Date: Tue, 25 Feb 2025 20:03:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org, 
	andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org, 
	konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com, 
	quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
Subject: Re: [PATCH 11/11] drm/bridge: anx7625: change the gpiod_set_value API
Message-ID: <rgdujikhrizof6p67cztu3oh4svy7do4okvowlgxg6rddeoqkq@hjc7pni57ilb>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-12-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225121824.3869719-12-quic_amakhija@quicinc.com>

On Tue, Feb 25, 2025 at 05:48:24PM +0530, Ayushi Makhija wrote:
> Use gpiod_set_value_cansleep() instead of gpiod_set_value()
> to fix the below call trace in the boot log:
> 
> [    5.690534] Call trace:
> [    5.690536]  gpiod_set_value+0x40/0xa4
> [    5.690540]  anx7625_runtime_pm_resume+0xa0/0x324 [anx7625]
> [    5.690545]  __rpm_callback+0x48/0x1d8
> [    5.690549]  rpm_callback+0x6c/0x78
> 
> Certain GPIO controllers require access via message-based buses
> such as I2C or SPI, which may cause the GPIOs to enter a sleep
> state. Therefore, use the gpiod_set_value_cansleep().
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

