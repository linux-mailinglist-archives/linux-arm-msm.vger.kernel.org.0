Return-Path: <linux-arm-msm+bounces-4162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CE280C370
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 09:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5BA41F20FE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 08:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35DE820DE6;
	Mon, 11 Dec 2023 08:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xmWdoWxJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06CA7C5
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 00:40:45 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-54c846da5e9so3919456a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 00:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702284043; x=1702888843; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8WHfXsMSBzIil3vhzGR0vYJMqSWAgjj/PiuOMlAKQdE=;
        b=xmWdoWxJb7NcmQORf3mhRyqp5fBwD9vB7+jLYofpaa7TMazRbQb4myuLuqqvYenTsZ
         r7ou58xrwdVn8MZ7QJUBKLW5C6g7WbpFcmWRoRkXNZvQebDa52/PtvS83fbsc9Izs4tL
         ojUb3eSWsS1VITxKkViHRfFniEzoeJQ5nyzyyO5iHa34bBCiIZOCoZim5BLTERfIdKO1
         J9pxYhwq1+RCfrhDckvEnMaIM5rBF+bFhrBNq5EES0tx29+x4Yli63N81aK3nW5NQYPt
         6hMnEDVlAnrDFCftqH3wDPChmKmdcEUMivZCimkJ/dcpzGFxd6cgQjdbnFy4K3sfrfPw
         hcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702284043; x=1702888843;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8WHfXsMSBzIil3vhzGR0vYJMqSWAgjj/PiuOMlAKQdE=;
        b=Fk4qoDYjJFn7kViR5R4aj+vckZV12+VSdvbrNF0LZtviGeHf+xGw6IWhM+0u9jmtNp
         KU+UsZzIciN4wvCJ7mOpnuye0jv5izSwQPgNxoSFGDiEgPRnhWGggei0GMGiOg1NxIW1
         ZzBRtpxy0t8VycXCRcwkHXjAwP1qjrAhMCuFpeXQPlqA0DS3zhMQlt8RF5F+4r4Hl1D5
         sxQrVwoXJRlloaXQVQSoEXtAE2KqpV/6VsiWUR8DLKPutv4ZuIkTCACvcI5ewf5Ig5xq
         XA6encTQd02xky952+MaysY2P8Muz5v4RzY3U5/5uKui2G8s4ALmoqblUryC3sFZ5HZh
         KBjw==
X-Gm-Message-State: AOJu0Yz63m+78W/0XS9ozHmm3bN1I9+dPLIlxTZ1JVo9gUshWFmc84QP
	teoDL0oRCiqPPgVVyBz38UceIw==
X-Google-Smtp-Source: AGHT+IF64K0QJF6TSoo0bL/zIfLzd/TJ4LUK6Q16W4r6xL17AU4KXSPEjd3vvv3X3QBo0csjqxoprg==
X-Received: by 2002:a50:9e2d:0:b0:54c:5e18:50e6 with SMTP id z42-20020a509e2d000000b0054c5e1850e6mr2346907ede.42.1702284043366;
        Mon, 11 Dec 2023 00:40:43 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id cx14-20020a05640222ae00b0054cb07a17ebsm3395959edb.31.2023.12.11.00.40.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 00:40:42 -0800 (PST)
Message-ID: <4e032b2c-eed8-475b-ba10-5fdb2156e4d0@linaro.org>
Date: Mon, 11 Dec 2023 09:40:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: qcom: ipq8074: add MicroSD node
Content-Language: en-US
To: Chukun Pan <amadeus@jmu.edu.cn>, Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231210152015.2243310-1-amadeus@jmu.edu.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231210152015.2243310-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/12/2023 16:20, Chukun Pan wrote:
> Enable MicroSD card found on ipq8074 devices.
> Tested fine when SD card IO voltage is 3.3v.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> index a4f7ae35be27..4f23c4459112 100644
> --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> @@ -422,6 +422,26 @@ sdhc_1: mmc@7824900 {
>  			status = "disabled";
>  		};
>  
> +		sdhc_2: mmc@7864900 {
> +			compatible = "qcom,sdhci-msm-v4";

That's deprecated.

> +			reg = <0x7864900 0x500>, <0x7864000 0x800>;
> +			reg-names = "hc", "core";
> +
> +			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq", "pwr_irq";
> +
> +			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
> +				 <&gcc GCC_SDCC2_APPS_CLK>,
> +				 <&xo>;
> +			clock-names = "iface", "core", "xo";
> +			resets = <&gcc GCC_SDCC2_BCR>;
> +			max-frequency = <192000000>;
> +			bus-width = <4>;
> +
> +			status = "disabled";

No board users?

Best regards,
Krzysztof


