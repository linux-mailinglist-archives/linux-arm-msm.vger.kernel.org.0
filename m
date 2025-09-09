Return-Path: <linux-arm-msm+bounces-72691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C198B4A337
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 09:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43014189EF80
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 07:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9404D305972;
	Tue,  9 Sep 2025 07:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jr/RtKVJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999B9305969
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 07:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757402094; cv=none; b=N5E+ZEiK7UqJ0/jido6fiTnc9xtTTaVVJl1pWaNSdUPKLe9GJBUMzGfY25C2pcnbqIG1pngLzM9HEyesiXBPD+iWGSK/D7etE9XOazNM0z9Yqs2r353IbhY39Z197IcmqTtkBu2pDH2PTLzBYCd8BKU1/e/fZckp6GmhtaM9Zbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757402094; c=relaxed/simple;
	bh=9dVVNx/h90xGBmZ9GP1bORyxACMN7Z78SNx1epZhFTc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lEvG55VzSGu+xVCMYY1EQd1ghyFHSJ8HEaPstVPEIg1MUVPjdxVJ6wwKoc9Nga8vr5W/89wr9EAysuO1xrSPdZ7k1nf9DvKP/LUZvCMro+c8P8AFSx+0gg0QCCYAwNhF2Co6xmVSd38jRqvr9COTPGxxZs+72BzPSpchFMWClP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jr/RtKVJ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45dcff2f313so31614805e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 00:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757402091; x=1758006891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u43LsNqSG6uTnlGTyebiOi+xWFLG+LJs5tbBGdtkIVo=;
        b=Jr/RtKVJOT4ONZ1h9ocK6f0MOYZGNkBfsw9DsjNG+rQ4+aD7lxx1aRbJAJfkZ28lpK
         cIyT8G6lKJU6OvzsBbAmHpsnm2+cYWYr0V9gA6xs87vFtTo1LTiPbie5nlHe1qwhRqU+
         Tq81fI0z+0R/8JoAGl5iuKyWCG6e6xoX2Mk/wswn3muoOiB/UulioM67gS7r2bKjIYxl
         aB4bL30vErUAZRo5tCYOee+48eTA9xRje/YfpJ6OlEgLdOgJYlUzBsOyOHed2VpC44U+
         gbyuc0wYMVmBHjYoeQj6BbcFULokahC3xWgHz3HtIFfqSGa84MGLldU0Ng9TEFPGvfWx
         7ShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757402091; x=1758006891;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u43LsNqSG6uTnlGTyebiOi+xWFLG+LJs5tbBGdtkIVo=;
        b=KxXlF2mZP7Cp4iVvH7/+l9Mkk9OWQ3snOsc584FK2uMRGKmE8XcOBYCpADdaSH9bqI
         uNStr+hjiCudorSm/BLTROg+k97iTl649Y2zfPrSy8MLXAJ7m2FPBgglb8fxEdAZjVa2
         J8ZRBWNmfSRJbVgjd7Obiumzn3VS2aY5xeAL5tm5IphcWF8cGjBDkEiMtyGjZ65tBXu2
         oGMGDi51j4Q728t1KwX65LOMDH1YMvD4wvKFBF5WeoJBU+qz8QgBVH+KzToEq+Jsod2G
         uk4AV0DqVWo9KHxpInm/KSeNKeD+ZdnrsRCG76Zmxh12swUPE/ddfACXqyw2iwvWnpOz
         sZ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1hluhgUk5IJHPYaTYvfIYZhEA8jdo6UzKjqIUBXhXllFxwaLx7NORDZS/mIefQxy3HdAhNxrZM9R2AXwR@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ8e7hPMBYe3f6Xq9lSZcSoLNboRrAjKSIdcPeVC7WdO0XTVnI
	l/4/K3DjKIP92fouJZu7gqV/HRKwbfERdsmoSRWud9zpYeixDwO0Lqt0gB60gO2MGnE=
X-Gm-Gg: ASbGncuuGx4fjAuXO0YLkK33bc6q73oolAps49wLpe6rX//620yOLZgSryGv8pG7koI
	ez9nDh3Om1Dm6iLPc7SVpjfoGW4epx/FR/av7pUgG5ldCQpspxsuHxQc5VuWA3fJMMtt1qNXlb3
	YsjMZcdKpGZtRP9jn3gpnun2wUsE0jh9IzSgDLhqG6p//RIXD3JdV+/uH5PumUt8h/b4qHNzw4u
	1XEWOCE9RBtTk3YEMfaR7WEkCME0nauryufhVYODSCx+KY9wCbpv7Iiqeuihtq069O6pXMcmTOx
	YDVksmbildsjBGCU/W+M+lE847qaLv2fjD+UOTTIqcDamfUtqmRiNBC19buP0Q3g+ff+Am1vFNf
	EcTu//s7odf2mPTC35Vtl9CF8rMPQXRlXGq0l5uz5C/8cFfFibark/AT9VzmiGXqbD95aAkwIHm
	YLo2aE44U=
X-Google-Smtp-Source: AGHT+IEiUd+2pdrNRG2SkooH6CfbYUmcRiXoBKNVsWbVXETjB3YdpcCJB24m0SOcXf7I7DkX77PWmw==
X-Received: by 2002:a05:600c:6488:b0:45d:e0c5:7850 with SMTP id 5b1f17b1804b1-45de0c57d85mr68897435e9.35.1757402090873;
        Tue, 09 Sep 2025 00:14:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:25ab:4e12:265b:4b6? ([2a01:e0a:3d9:2080:25ab:4e12:265b:4b6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd5098292sm193009005e9.1.2025.09.09.00.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 00:14:50 -0700 (PDT)
Message-ID: <14d58c6d-ca20-4349-8031-9906a4539fef@linaro.org>
Date: Tue, 9 Sep 2025 09:14:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 3/5] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document lanes mapping when not using in USB-C complex
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
References: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
 <20250908-topic-x1e80100-hdmi-v3-3-c53b0f2bc2fb@linaro.org>
 <7dzfcuvr45h4iailtjutqjev7lofoqu7w6ob77gehgmy7mctpk@k7oob4wj3c7a>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <7dzfcuvr45h4iailtjutqjev7lofoqu7w6ob77gehgmy7mctpk@k7oob4wj3c7a>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/09/2025 23:14, Dmitry Baryshkov wrote:
> On Mon, Sep 08, 2025 at 03:04:20PM +0200, Neil Armstrong wrote:
>> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
>> of a combo glue to route either lanes to the 4 shared physical lanes.
>>
>> The routing of the lanes can be:
>> - 2 DP + 2 USB3
>> - 4 DP
>> - 2 USB3
>>
>> The layout of the lanes was designed to be mapped and swapped
>> related to the USB-C Power Delivery negociation, so it supports
>> a finite set of mappings inherited by the USB-C Altmode layouts.
>>
>> Nevertheless those QMP Comby PHY can be used to drive a DisplayPort
>> connector, DP->HDMI bridge, USB3 A Connector, etc... without
>> an USB-C connector and no PD events.
>>
>> Document the data-lanes on numbered port@0 out endpoints,
>> allowing us to document the lanes mapping to DisplayPort
>> and/or USB3 connectors/peripherals.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 59 +++++++++++++++++++++-
>>   1 file changed, 58 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> index 5005514d7c3a1e4a8893883497fd204bc04e12be..51e0d0983091af0b8a5170ac34a05ab0acc435a3 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> @@ -81,10 +81,67 @@ properties:
>>   
>>     ports:
>>       $ref: /schemas/graph.yaml#/properties/ports
>> +
>>       properties:
>>         port@0:
>> -        $ref: /schemas/graph.yaml#/properties/port
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>           description: Output endpoint of the PHY
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
>> +            unevaluatedProperties: false
>> +
>> +          endpoint@0:
>> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
>> +            description: Display Port Output lanes of the PHY when used with static mapping
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              data-lanes:
>> +                $ref: /schemas/types.yaml#/definitions/uint32-array
>> +                minItems: 2
> 
> Nit: DP can work in a 1-lane mode. Do we nned to support that in the PHY?

So the PHY already supports 1-lane, but the QMP Combo only supports
mapping 2+2 or 4, but nevetheless we can still decscribe 1 lane in DT
int both in & out endpoint and still should work fine.

Do you think this should be done now ?

Neil

> 
>> +                maxItems: 4
>> +                oneOf:
>> +                  - items: # DisplayPort 2 lanes, normal orientation
>> +                      - const: 0
>> +                      - const: 1
>> +                  - items: # DisplayPort 2 lanes, flipped orientation
>> +                      - const: 3
>> +                      - const: 2
>> +                  - items: # DisplayPort 4 lanes, normal orientation
>> +                      - const: 0
>> +                      - const: 1
>> +                      - const: 2
>> +                      - const: 3
>> +                  - items: # DisplayPort 4 lanes, flipped orientation
>> +                      - const: 3
>> +                      - const: 2
>> +                      - const: 1
>> +                      - const: 0
>> +            required:
>> +              - data-lanes
>> +
>> +          endpoint@1:
>> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
>> +            description: USB Output lanes of the PHY when used with static mapping
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              data-lanes:
>> +                $ref: /schemas/types.yaml#/definitions/uint32-array
>> +                minItems: 2
>> +                oneOf:
>> +                  - items: # USB3, normal orientation
>> +                      - const: 1
>> +                      - const: 0
>> +                  - items: # USB3, flipped orientation
>> +                      - const: 2
>> +                      - const: 3
>> +
>> +            required:
>> +              - data-lanes
>>   
>>         port@1:
>>           $ref: /schemas/graph.yaml#/properties/port
>>
>> -- 
>> 2.34.1
>>
> 


