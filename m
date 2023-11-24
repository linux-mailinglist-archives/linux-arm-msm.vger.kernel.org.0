Return-Path: <linux-arm-msm+bounces-1796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD817F6E3B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 09:33:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C2DCB20BBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 08:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 824AD2F39;
	Fri, 24 Nov 2023 08:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qIBV6BfF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6633CD48
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Nov 2023 00:33:24 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50943ccbbaeso2247446e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Nov 2023 00:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700814802; x=1701419602; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IVRC0zmRyp43W4q3MRWR+VBca239RoOPT5L46Kgcx/I=;
        b=qIBV6BfFc3SpjnN3BCfcblfrp0nqhYUnPc+DWSkhSz/38hx3fPHQc4Eja5jVKmAGSu
         nxcY17iTPJUuZfb9pUk0pnQOUIX31EKYEi6PpbCdA3KqeUv0VhoiNSH3ImhupK6eY87z
         ahwc7oFTQpIuvjTHn4lh4SQu6CQBl6aOlr4Dku8ILkB7Yu41wPMQGbJF0/YYHXpZqJDW
         xOggcrU0yn/dqe3YtREW/WJGPD23AFTsbbm0LNT+p91RbFdTuZoRuVtahja83O/Q6owM
         BpuckpFOyThoxY7KMzFVy6+nAwuc96yQXqG01Me57fVt5HwtTYwGXCsATMwA8WwjVBSY
         Rkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700814802; x=1701419602;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IVRC0zmRyp43W4q3MRWR+VBca239RoOPT5L46Kgcx/I=;
        b=oXC0h3GqA9SfF1BAK8t4aOCXHRO/qUz+BmbSJ2qx699oEDnWbzmtWVM7mjqqBhgsE2
         oqAzlBytcd+iSO3kdEsvdJn2FfdEK1W7VHsQ7HSeNa7MmVUcu030jFB59dknr+rU5IPi
         po2/Y0H9DQ9tSwZ7gkca5DibjzE9hI+G9KC/ZdyC2ExI3UZJlDr5XtO7ywHTuy7Cr8hN
         b9R3sQvts5stLFEBqv7dQttfPDCCNjZT6KRybbN7M6W2Cz0PadJ/sFVyGxoPw0drNXes
         NSZux13cSoXSdBcFBhrH/pTDcLiPjwKTv6x4M1nREwLIZxCDRmeRK0iWWb/2CmHUHf0Y
         pyDA==
X-Gm-Message-State: AOJu0YzMm3zam9O1xH8PTNHdCpE2u62tRa3T0NnGWXrFBH0Bo50y18cj
	VYWbKIIykbcoY822jlEt2CuJow==
X-Google-Smtp-Source: AGHT+IHyEWpOXy+wjpDhxzy7qj32CzoZVgpuF4BaHV6SCcxwB3sl+hSfmBUyobobcf4Zy4NpyI1ZFQ==
X-Received: by 2002:ac2:488d:0:b0:509:7915:a1d6 with SMTP id x13-20020ac2488d000000b005097915a1d6mr1195666lfc.58.1700814802599;
        Fri, 24 Nov 2023 00:33:22 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.100])
        by smtp.gmail.com with ESMTPSA id lv23-20020a170906bc9700b009f28db2b702sm1774296ejb.209.2023.11.24.00.33.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 00:33:22 -0800 (PST)
Message-ID: <160fc6c4-b07d-49c5-976b-aa0fa35e4f0f@linaro.org>
Date: Fri, 24 Nov 2023 09:33:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] ASoC: dt-bindings: document WCD939x Audio Codec
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231123-topic-sm8650-upstream-wcd939x-codec-v1-0-21d4ad9276de@linaro.org>
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-2-21d4ad9276de@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231123-topic-sm8650-upstream-wcd939x-codec-v1-2-21d4ad9276de@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/11/2023 15:49, Neil Armstrong wrote:

> +  Qualcomm WCD9390/WCD9395 Codec is a standalone Hi-Fi audio codec IC.
> +  It has RX and TX Soundwire slave devices.
> +  The WCD9390/WCD9395 IC has a functionally separate USB-C Mux subsystem
> +  accessible over an I2C interface.
> +  The Audio Headphone and Microphone data path between the Codec and the USB-C Mux
> +  subsystems are external to the IC, thus requiring DT port-endpoint graph description
> +  to handle USB-C altmode & orientation switching for Audio Accessory Mode.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +  - $ref: qcom,wcd93xx-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,wcd9390-codec
> +      - qcom,wcd9395-codec

9395 should be compatible with 9390, so please express it with a list
using fallback. I know that earlier wcd93xx do not follow that concept,
but maybe we will fix them some point as well.

> +
> +  mode-switch:
> +    description: Flag the port as possible handle of altmode switching
> +    type: boolean
> +
> +  orientation-switch:
> +    description: Flag the port as possible handler of orientation switching
> +    type: boolean
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      A port node to link the WCD939x Codec node to USB MUX subsystems for the
> +      purpose of handling altmode muxing and orientation switching to detecte and
> +      enable Audio Accessory Mode.
> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    codec {
> +        compatible = "qcom,wcd9390-codec";
> +        reset-gpios = <&tlmm 32 0>;

Please define for the GPIO flag.

> +        #sound-dai-cells = <1>;
> +        qcom,tx-device = <&wcd939x_tx>;
> +        qcom,rx-device = <&wcd939x_rx>;
> +        qcom,micbias1-microvolt = <1800000>;
> +        qcom,micbias2-microvolt = <1800000>;
> +        qcom,micbias3-microvolt = <1800000>;
> +        qcom,micbias4-microvolt = <1800000>;
> +        qcom,hphl-jack-type-normally-closed;
> +        qcom,ground-jack-type-normally-closed;
> +        qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
> +        qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
> +    };
> +
> +    /* ... */
> +
> +    soundwire@3210000 {
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +        reg = <0x03210000 0x2000>;
> +        wcd939x_rx: codec@0,4 {
> +            compatible = "sdw20217010e00";
> +            reg  = <0 4>;

Just one space before '='

> +            qcom,rx-port-mapping = <1 2 3 4 5 6>;
> +        };
> +    };
> +
> +    soundwire@3230000 {
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +        reg = <0x03230000 0x2000>;
> +        wcd938x_tx: codec@0,3 {
> +            compatible = "sdw20217010e00";
> +            reg  = <0 3>;

Ditto


Best regards,
Krzysztof


