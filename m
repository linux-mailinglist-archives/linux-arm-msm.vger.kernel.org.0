Return-Path: <linux-arm-msm+bounces-21743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E468FCACD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 13:45:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 882EFB23D32
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 11:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BBAE1922E0;
	Wed,  5 Jun 2024 11:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XHrx8TH2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4009B14D433
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 11:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717587923; cv=none; b=mKST+qCRGKlviuSbVjpnu9JSlKr0VnQ44C8JAs2AdCtFx23BcYG7/4pcNviwAJ/fIaDZRvmz/lD3lLH/p2r7zLTteEqOVgL+wdgFm8voEdk86nzLRmuzzsze62iTijx/tBarVXqO4xgF3W58XuyY5ZhbyO9025P6sKSehxPKeQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717587923; c=relaxed/simple;
	bh=F8KvKlp9bavX/llL9E6gFKVG+DJ59VczQJj9wnu+J8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hpsj2o93zocPuHExjdXdfGYnnuOvxBKqYitAS3ZWIypBDZIQDC2zBm0jWJ3E14DA4c6iplY9m8DGrq4TQTmUlRlHoZDitaA3GGDc8LAZ1ahWBHh+jGU6LPinNIc6oqOggptncfbB9pAFHu17WRdtv+w/ls09UhAwMv6TNShyjHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XHrx8TH2; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-57a85cc2d96so2084832a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 04:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717587920; x=1718192720; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FIB7ujhSm4r4oHfWl29labezUCHSPo2rSBZvn+iBsPc=;
        b=XHrx8TH2k6q83iY625U8yXpQYcTBiAVEFQjCZHCtSYnU7Gwq/4Y0eoP8Lnjcg3NgTa
         5ccKQnqnZwn7jmCpzvztowLVib0f2vSHZBZjLTPGQ/DY5ot+y9cWEhXgDnr109yC6wzM
         x0C9R0s/UL0TOaSyJNDgCU4y7J5CNiHJIWSOiQ0ibCh2G/hojC4cShdM9D7E9iBdKq32
         1DqI5b4HRACmlp7dbwJ3V7jBRcr2NCo8AscFX73+eRFcSDllMP/EYIMO5VTd4RQcB/ej
         VZRvdaf3eMS+PUVmiofRfGhUQ2FNZZYWJCaw9ik5EDc1gp+9fpG6F1qDWE4mx82OkEHu
         02iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717587920; x=1718192720;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FIB7ujhSm4r4oHfWl29labezUCHSPo2rSBZvn+iBsPc=;
        b=PuhlcrYf4kHn2/nWpExnIjuIBZOr4+gdrxS/cb4EvsznARQY2SeEwFQ966HZqu++YR
         dontjYMyjxSFx0incbDrw11BO28xUr9z7Wv3hg4On0P24rTYxQjexrnEl+mNBwEQ2vZD
         O7Qc2l7JfLkd9XVo4XjF8yyIxxAxA91Tj2SGrivE0ajVGLDBJzW87KxrEhs+PD874HmO
         dM5TDnE5tlxQLMJ636trl/Ewu3PsSo15ceWjVMz3pEgJrjmC3ATisDOt6mt7iJaMqGng
         w3JZjT11qDRnxsYWs8ogmKH2ugUkUfdP443lCPZ5P2yU6MWLKsWQyosksaEHirqjoKXh
         07vA==
X-Forwarded-Encrypted: i=1; AJvYcCULxfa95ZAeShoJh81H6L0PnJdCiszKu2D2zInKALIUeYtyebFwjsWsk3zq1dtMXmMOprl3wJjuk+bLlgmlOJJM0PoAV9ndKAVAETZ39g==
X-Gm-Message-State: AOJu0Yx1G2efhRdEjJ1EQGMk2iV1WeAZvN56pr0WJIy08DDRF6w4N7qK
	CEIClWby6RnkIMuRqyQnbw6uNx1p3QU0b8F0ILLyMFMLoJUuvjz1Wkpdc/M+TGg=
X-Google-Smtp-Source: AGHT+IEQq6YNWa7x/qG2lhYwxS9LQL2TDlJNLLtmnR+0fXmuY9dNZ7lFwLOhObs5pdsHmSIE7eyCDA==
X-Received: by 2002:a17:906:fcc5:b0:a68:bae4:94d3 with SMTP id a640c23a62f3a-a699f680343mr167106966b.8.1717587920537;
        Wed, 05 Jun 2024 04:45:20 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::8090? ([2a02:8109:aa0d:be00::8090])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68fa49e66fsm491263966b.129.2024.06.05.04.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 04:45:20 -0700 (PDT)
Message-ID: <395ffca5-20b3-43fe-b443-7055eba574fc@linaro.org>
Date: Wed, 5 Jun 2024 13:45:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: qrb2210-rb1: switch I2C2 to
 i2c-gpio
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20240605-rb12-i2c2g-pio-v2-0-946f5d6b6948@linaro.org>
 <20240605-rb12-i2c2g-pio-v2-1-946f5d6b6948@linaro.org>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20240605-rb12-i2c2g-pio-v2-1-946f5d6b6948@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/06/2024 10:55, Dmitry Baryshkov wrote:
> On the Qualcomm RB1 platform the I2C bus connected to the LT9611UXC
> bridge under some circumstances can go into a state when all transfers
> timeout. This causes both issues with fetching of EDID and with
> updating of the bridge's firmware. While we are debugging the issue,
> switch corresponding I2C bus to use i2c-gpio driver. While using
> i2c-gpio no communication issues are observed.
> 
> This patch is asusmed to be a temporary fix, so it is implemented in a
> non-intrusive manner to simply reverting it later.
> 
> Fixes: 616eda24edd4 ("arm64: dts: qcom: qrb2210-rb1: Set up HDMI")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> index bb5191422660..8c27d52139a1 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> @@ -59,6 +59,17 @@ hdmi_con: endpoint {
>   		};
>   	};
>   
> +	i2c2_gpio: i2c {
> +		compatible = "i2c-gpio";
> +
> +		sda-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
> +		scl-gpios = <&tlmm 7 GPIO_ACTIVE_HIGH>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		status = "disabled";
> +	};
> +
>   	leds {
>   		compatible = "gpio-leds";
>   
> @@ -199,7 +210,7 @@ &gpi_dma0 {
>   	status = "okay";
>   };
>   
> -&i2c2 {
> +&i2c2_gpio {
>   	clock-frequency = <400000>;
>   	status = "okay";
>   
> 

-- 
// Caleb (they/them)

