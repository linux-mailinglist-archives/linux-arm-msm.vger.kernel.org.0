Return-Path: <linux-arm-msm+bounces-19521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A308C037E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 19:43:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E811E289483
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 17:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596C912B14B;
	Wed,  8 May 2024 17:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="INisVFej"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F3D38F9A
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 May 2024 17:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715190229; cv=none; b=uaKoSDfF2GzQZwatkyBvtz2CJWUvqM/rDXsDjxh8+6LInL/UnfDMBSAY4j4rnISLyVK1EuDF0W8vSC+7WT7kNcaPTD1l1vXdpRCnxhLpD0TPxVw688S0vRN0OUqcJpZZxDi5tIJHSG1r78DvJ+icVmGyEXxwZ7srVGvkVIldVq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715190229; c=relaxed/simple;
	bh=31XmwO5nXS1nwEapBk2NNksodlmCulY6cmDlawgK3qs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dIy85waSdW6T9tYUT6NxjSEgdnB2z9fHqiHDremaRKTKUSwMZhtKFkKiUnWRpJyc9w9S0wPQ6UmbKenBPxeGxoV56w/kijboeuztBTtPHksmK3w9FSORf1vpSo/sXBCTKMwo039vhK9M0xHLtBnBwUM4Zk2bffmw04Q6VYuZEzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=INisVFej; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-41ebcf01013so350375e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 May 2024 10:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715190224; x=1715795024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=idEaMcbGFaK4BQgFvbB0b5BDKYmvMsNLNj6qCW0EDH0=;
        b=INisVFejlQ1rTtIijaKpKsCM5C1LOXcWblW7Bfb9xL147+SQECDaaNw61uoWiMfvfS
         /KmnYfmYLJNqwVQpMlEciNglye3xUFw77UEbWETf5tskPxn1EvidTyJQ9anvTf8A+J+Y
         mJSHELJ4eTpMmnHWvsj4JMYdlkMEsifxTMM3erwilUZYZ6QHg58KC7VV0hZk2fVcTcEQ
         9HuZMONxY+SDRFVSvVrOYFddpAO1h8oVsg49ewi03G902Uf+o34e7EOnbutFxORzXgzD
         MSk7bwpCdzqhRUvEYrXdiCH8TuQxFsthtpqIhJcyLXzoocv8lWS0cFG8XGxMC+MsDT6n
         TKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715190224; x=1715795024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=idEaMcbGFaK4BQgFvbB0b5BDKYmvMsNLNj6qCW0EDH0=;
        b=NrJECWUTDwvMhKff1wIej5mUxLGJLcVjsPYRSMPNWqqe61HVZgWsSa0qwwaVXp2aA3
         BtuC8jFatQOY1TTMx//MajEz5zOxew/SlJ/BG/IfNysfyWx3usGJQPFcW4Yv7qOSBYbt
         ymgO/PL7at7a26lm5QROIdCr/z7shmhz3PKhMGVBbLp7qUQQRlpqe9+gUiemxqLYJAAF
         oAJGgp2VBrwrJ3CTFNRDsgd5aYQ0cKQ27Dxr9sOaibeb0clOBxD8U7WMeFUliSQl24gg
         kia2AGFu6+G2d4BG5jhjSeibUmMLT1S0a6T6jJongI0gWFLBiYv6r2h3QluZJau+8vrA
         aggQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0XbmW4lsJ5mYhAP7RzVgD7Uumiv69HBh+AGmSb6vusr99uqNCkOkK6zxlZbMxN8CLAVZ02S8QV6Yts+8K97nhCRzK4ZUlxpVTwCKt/w==
X-Gm-Message-State: AOJu0YyQpQyaq3WdDGMVAbvoc1pNbbFHLpuGIDkBKsDrycxtRc+mYCGe
	iFoLTw+v7DSrjB+jO9UU7NQZk8sa0xrSokRs6HQB3WuHWJHmKfoElHpDV3h7s+E=
X-Google-Smtp-Source: AGHT+IEu1aW4a8E99d+7lWp9ZffFtuGe8/3woIj3ozR0DQZMe/xC4frcR0jBIUcfvK8mmbuAyGoGxQ==
X-Received: by 2002:a05:600c:1d05:b0:418:d3f4:677b with SMTP id 5b1f17b1804b1-41fbce7ddc9mr2866845e9.17.1715190224639;
        Wed, 08 May 2024 10:43:44 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f882086f0sm30355515e9.42.2024.05.08.10.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 10:43:44 -0700 (PDT)
Message-ID: <613657e3-0ddb-47f7-b66b-e1462b6a6282@linaro.org>
Date: Wed, 8 May 2024 18:43:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] pinctrl: qcom: spmi-gpio: drop broken pm8008
 support
To: Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Das Srinagesh <quic_gurus@quicinc.com>,
 Satya Priya <quic_c_skakit@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 stable@vger.kernel.org
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-10-johan+linaro@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240506150830.23709-10-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2024 16:08, Johan Hovold wrote:
> The SPMI GPIO driver assumes that the parent device is an SPMI device
> and accesses random data when backcasting the parent struct device
> pointer for non-SPMI devices.
> 
> Fortunately this does not seem to cause any issues currently when the
> parent device is an I2C client like the PM8008, but this could change if
> the structures are reorganised (e.g. using structure randomisation).
> 
> Notably the interrupt implementation is also broken for non-SPMI devices.
> 
> Also note that the two GPIO pins on PM8008 are used for interrupts and
> reset so their practical use should be limited.
> 
> Drop the broken GPIO support for PM8008 for now.
> 
> Fixes: ea119e5a482a ("pinctrl: qcom-pmic-gpio: Add support for pm8008")
> Cc: stable@vger.kernel.org	# 5.13
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index f4e2c88a7c82..e61be7d05494 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -1206,7 +1206,6 @@ static const struct of_device_id pmic_gpio_of_match[] = {
>   	{ .compatible = "qcom,pm7325-gpio", .data = (void *) 10 },
>   	{ .compatible = "qcom,pm7550ba-gpio", .data = (void *) 8},
>   	{ .compatible = "qcom,pm8005-gpio", .data = (void *) 4 },
> -	{ .compatible = "qcom,pm8008-gpio", .data = (void *) 2 },
>   	{ .compatible = "qcom,pm8019-gpio", .data = (void *) 6 },
>   	/* pm8150 has 10 GPIOs with holes on 2, 5, 7 and 8 */
>   	{ .compatible = "qcom,pm8150-gpio", .data = (void *) 10 },

Since there are no upstream dtsi users there's no harm in dropping and 
re-adding when i2c can be taken account of.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

