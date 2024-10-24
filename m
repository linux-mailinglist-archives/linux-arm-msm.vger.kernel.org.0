Return-Path: <linux-arm-msm+bounces-35708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A4F9AEB07
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 17:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFAA71C21B92
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 15:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522B11F4FCA;
	Thu, 24 Oct 2024 15:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DNnfcoFH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288DF1E0B6F
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 15:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729784950; cv=none; b=rTyJaNsKCsetUPYV7dGrepS7SZ0nA9Bct/R3QylyqMgyv/sprI6HzYwmo9Wtlv+r83/sf414UKZl1Z/x14Da66dbaAImbZDRaGxzcI5kgoEb9LEfhu9nrU8akkNA2Q/jKV/6ewN2H4HWSmrV5goDOSUnIlvGbJkh/nuI17Lzlck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729784950; c=relaxed/simple;
	bh=vgVvpewAMbmcyjF0eSzY8JeXopWO++3oaFfos5J5nXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjBHgn64lhoRlW2sdAm3pnirpk2ugPWWuiNDB8nYe0eD1LZvmi77AGD7cL2+uBkTPcEHcpyFwRwURw7yHS1h9gCS1vZG1Skak+PAOijPE8/2oqduy25W1nhlqXBOQkgOK0Z7hCeUQ4ekHKQnl8asvi/8mgYjZGDajHPQotptkCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DNnfcoFH; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539f84907caso1237392e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 08:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729784946; x=1730389746; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=296p0H1Vg2Rj5TTzmKs46/UNrkxr+6q9tiB7yK0RNAQ=;
        b=DNnfcoFHkStOj5jz86Mq0r64dpJFlhnWeKgpT1QLdSFTgjls+fX8k/R45RX8C//3Eo
         gs65eSjzQ+rvtjGgTGhx6NnDxxlz3SxrEvPZytqpPIeYRXtzCR50JAHPSeHFYtxfKQ6v
         jUHq5B8xooz/UmFJhyM6byRjSQgSuVbSyrjdYN8HVjW/Aaxn+NIrmpYi7DRZOwaQX0b2
         DHfa42mzq+bxLVZYFuSsW3dWzZP8q9gRb0UriQNZ0cOMw75AN4iz1W1GqN4uP/KGwdcO
         mEWKG9Gyvd4JgRZPowjVK8ZFGFF6ZieSPY2Vq1gibQXDxmy7T5DbgU+baZ9mIAI9ewfp
         GtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729784946; x=1730389746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=296p0H1Vg2Rj5TTzmKs46/UNrkxr+6q9tiB7yK0RNAQ=;
        b=CKQOCW0FO3sD+LMlvxtCEMSGnBK5hQcW80eeme0wx5vW29LCUhT6IMh+9SGZ7hB4sm
         65onO7zAB67nyXQmHVQjQvTv+X40Z7sSRlJ7ZygIpGuKVJucB9olZhaK+xFfhq2UNvN6
         UCQvIJi3CXfOmDk7V9jG70b/srbROjHdfSYVdRy/e1H0Ft1WJhaRrUmWY7p7UxhwsD7g
         3i84pgPv8Cm9heePbqRYaECaMmvpzuvOu2m4cSar02BQH4dO7uO6TXIW99wKKqZxUesD
         lOoomly3jVdagNcmjESMR7qiJCDXWADQuvTGXvtc7c4Tt2de0fZJugfjoxb0mSNF5ldo
         06Ew==
X-Forwarded-Encrypted: i=1; AJvYcCVwIrK0yGI6O7Fg+jn72/DWoWklv4AuSl+srranRNyDcDsdHEHGRZXxwRKfF9A+NRJStyPDFZRAvqSRLm8/@vger.kernel.org
X-Gm-Message-State: AOJu0YxUn9tbLByI3VdqSbihKoVygB6sAjOppXK+fDgKwgvMP3UeMu3A
	aw0kI9NYQ63u9WvO0d413WAFgEsEDS4bFCgmIc4Qo4LhAvaXsNUEyZj0TtlDjbo=
X-Google-Smtp-Source: AGHT+IHdsryVFnNHDvLRD43FvHMGTM2ITuF16eHf56R4P8i8A4ALesN7EP9WtQa5wv2YRSvHbm32qA==
X-Received: by 2002:a05:6512:6c3:b0:533:46cc:a71e with SMTP id 2adb3069b0e04-53b23e9d2e4mr1860939e87.54.1729784946007;
        Thu, 24 Oct 2024 08:49:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a2243eb09sm1402372e87.245.2024.10.24.08.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 08:49:04 -0700 (PDT)
Date: Thu, 24 Oct 2024 18:49:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Kalle Valo <kvalo@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v6 6/6] arm64: dts: qcom: sm8450-hdk: model the PMU of
 the on-board wcn6855
Message-ID: <c3yzrhf5ev5fvu42mr6qe55odha4v6mjzjauskkq2u4rzqd5qm@o7csb6pdhppo>
References: <20241018-sc8280xp-pwrseq-v6-0-8da8310d9564@linaro.org>
 <20241018-sc8280xp-pwrseq-v6-6-8da8310d9564@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018-sc8280xp-pwrseq-v6-6-8da8310d9564@linaro.org>

On Fri, Oct 18, 2024 at 02:49:16PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add nodes for the WCN6855 PMU, the WLAN and BT modules and relevant
> regulators and pin functions to fully describe how the wifi is actually
> wired on this platform.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 157 ++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8450.dtsi    |   2 +-
>  2 files changed, 158 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

