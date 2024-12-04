Return-Path: <linux-arm-msm+bounces-40221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 852E39E386E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 12:11:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B2CF285364
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 11:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D50A1B5ED0;
	Wed,  4 Dec 2024 11:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NH5lT/dO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D0218A6C4
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 11:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733310497; cv=none; b=Q23V6S5r2ZqqGSTxPmq8aXEVL43tN8M4xHgHcUv8L8OCMpWdYQVoGoWo1gG/fJU4gkJNGrBEEbVNSvyCKgB7wPPEu00iOPWegEI4XOCC2WxohOUdt7HIEV/GSTuPDR2iCQSKF6y8CYSXFWwxvDJn/AV7Q/SIAu2YcDQkogk0TaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733310497; c=relaxed/simple;
	bh=+RY6ohi9sFPlxkhpxwJXOS/UxS/f9iEvJNG9RSPIfkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o1oxBEcVG42UUbwlSu1lfQbNJ1h5DOCpzmDFE2+9xoz7tECynUxVQKp2j9RG9gYzafzjbz3G8BvST84cZdsxy0djgW+giogqbOi5OIZ8KZ6pMAe+HkZU8wF26kT84Oliam8ek18pfcG/zQ7+pn3HKqhsvx1sFbPUPPTZ1io+RQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NH5lT/dO; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53de6b7da14so6496202e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 03:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733310493; x=1733915293; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hYzXxKS9pvS6m9YWg7f10P9BUeef0GzPwC4VorO/deo=;
        b=NH5lT/dOKvi5ckfHYGJ1XqYv7R4uMwQBtmJ2mNwzG5f+x4dxpKE+6zBNLfcWCReo3J
         r5ehmIqxGL/xKgIrhwtPskZ71S8doVO++UH0rCdCs4ZdAnXWsGXrQrsC9IdXHfelgVM0
         hJpgJ3vRF0wRY87QXMo8KARMOaZSgCVHaXICXQoVQQUWxOYHOjW7xjDtlVKVXbaPz+sr
         F27oKZ2ngNWzOf/vyU3QiKirhwKeUX2p9Mt0uYrix3Es7En6C1s6vWrfaEcNNUrO+T5h
         is+sLRERCjy5HMD/LdAx5YLaGjXRtbsTlJyqfzLEQk8WcZlCCuiraODsQTCD/qc7NM3s
         aY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733310493; x=1733915293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYzXxKS9pvS6m9YWg7f10P9BUeef0GzPwC4VorO/deo=;
        b=pmIJJjSuhChrhnyYd33xYsZKRq9fuiaESxoS7Hq2+PuGsr/VXr3KrG22xnK+EE7zn0
         C4EggLydczTk4wNevAZIht05xiIeUJlwLfAk/lNefUzb2iAhJIkSGRXHpoEH1YlFe1us
         ZYHK8TN9mPpdb0OySSmqsZW/rLzsICAXHnrLP2lahVTlLx/0IkJS+nlnU/zXwDf3l/oX
         RYXNklWTpofv+cLs62v/xExrK7gjsesY78CJBAScfo0vYIaZbVvLNY97Yw0XE1UVXPoC
         2r5YQzzpk34wLWlLiEkW1aYyfKiwXhlrmaoU403A7+1s2ym88S9fMC91tvLOnmPxf30m
         WVaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7a/+OZAJpoZalkAi8FBTRzQwIK02U855+QMBbiHLGxqOFFRC/rUXydAouZ3YoAsGE3UzYsLGTq9oCNoZp@vger.kernel.org
X-Gm-Message-State: AOJu0YyW8vN4JK3UuzVMb6fhDwVdPOQldSuT+U3IrQTCX7AHveN9uQwO
	uPqU1z1Dl2yec8b7XAUko8qaT0SvruVR1LkBh7Hh2Jwd68PS1S4nOQ5mzVpBrd67+53XsvrLpQ4
	f
X-Gm-Gg: ASbGncu02b5GfWXboprYrODF146uuaOyg6UYs0ayFLFIL/Qb3sKtMDNHkyFvuNIAZ4/
	U9tpKUfUvNeGbzJ0iPrT07j+i+xitqpgc37N6M48tw7jrZTO5jo1I4r5fNLXYVSWqDt9Vie0RWu
	Ic6O3yp2xrO2APDy4vQ2cSrb3o4XKZpL6B8siVDu4eIWj6WuGPnILN4LbbY6F4BHM/8DLpCAMwf
	vJvG2PmK4eYV6Oh9Mi4g4CguHZ3cPWonJHlsH+IyRLQ19RurHaH0ydcXJkthH9IhwHlzJwfkE24
	AjPvLFWo9V3+gT39FKV0RvJ9hLBqEA==
X-Google-Smtp-Source: AGHT+IGELuEbjRgnVDODbB41rhvdxo1vdb+kOa96jTHi0iriMuN3VSziSI0b2CaPZwJDkoAtxZYX/Q==
X-Received: by 2002:a05:6512:1107:b0:53d:d210:4060 with SMTP id 2adb3069b0e04-53e1b8c1a94mr1283260e87.53.1733310493137;
        Wed, 04 Dec 2024 03:08:13 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1bff42b1sm283793e87.177.2024.12.04.03.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 03:08:11 -0800 (PST)
Date: Wed, 4 Dec 2024 13:08:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sc7180: fix psci power domain node
 names
Message-ID: <f7pivzwjn3wmybdm3pgue6azi2jb7afc26pj6vyyfixspumpsx@cwjrgxojcr2o>
References: <20241204-topic-misc-dt-fixes-v1-0-6d320b6454e6@linaro.org>
 <20241204-topic-misc-dt-fixes-v1-5-6d320b6454e6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204-topic-misc-dt-fixes-v1-5-6d320b6454e6@linaro.org>

On Wed, Dec 04, 2024 at 11:56:57AM +0100, Neil Armstrong wrote:
> Rename the psci power domain node names to match the bindings.
> 
> This Fixes:
> sc7180-acer-aspire1.dts: psci: 'cpu-cluster0', 'cpu0', 'cpu1', 'cpu2', 'cpu3', 'cpu4', 'cpu5', 'cpu6', 'cpu7' do not match any of the regexes: '^power-domain-', 'pinctrl-[0-9]+'
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry

