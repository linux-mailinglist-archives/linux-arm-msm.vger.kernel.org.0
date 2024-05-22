Return-Path: <linux-arm-msm+bounces-20230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4758CC1C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 15:06:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8DEE1F244FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 13:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C02D13DDB5;
	Wed, 22 May 2024 13:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P3OtvXoW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD07E1CFAF
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 13:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716383205; cv=none; b=ct6sG8UdUjf7rRtU7WQ4jleyksRnJNoytiM5wbN26w8idnZh+WzSxAay6zPnSCqkKZ3RTtGGQlSzzBPE+p9Nh9a4PKIzLLUDkfj4LGgKYSQzn5jfCY0WeEXCcjV7W9zFqywQrD6NtUIEX4S0fQiXTprLIgV6ZiqF2JG/Kwt3q4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716383205; c=relaxed/simple;
	bh=eCw2iXIxZvZ4hdXnwCeU0//1RJ8cFUohcuV/vFYGTmE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lI0ZsoNuvrBGEewjMgGPKl2/YPZQ+7WWJOFCkIa8G/oj82SmfcPyPX2Bmh4gBQIVbxei3SwsySmO1sYiCouWiZqxNTb142/wc8nbHZFBygJWW9X9XGy3+rR13wN6zpbq+brhDFkV3tySOMGi4soM7FCrjFvfDsXPQ4NyRFvIKCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P3OtvXoW; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51f71e4970bso7992351e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 06:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716383201; x=1716988001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHQs81pS5e/M8Ft067yAZNFQ01IZ5xjkXQeMA4zm/pc=;
        b=P3OtvXoWEagyM1xLMdbHscmyw5lRg3JAAbhkBOe1DICZ7xuGM+8GANu7Mik53jl6tc
         7mYeubiJrhAOItWBBsyovysAw5Jbo04+iugxoXQsipxHWcRDL7sd7R9GWCrXhtxwWR4u
         8AeWC31JLpEWCQ/wzVVqdxG/nC1zlypzCBrycwyKsAVMxPAi2L9tk85QxLZu6d1YZFjZ
         +Gelq6DavPXDmNKiyhK6YASi+67iCjqgNtxBKDZxdVPkAiK3tNebNON4b+jwRkQ/g/Vp
         azDIfLVbSE2gLDKz/dAvJbxNGM2DLYomRsCkN87cFn9zLJ/fniS82QZOnISv5BDRKH6R
         cYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716383201; x=1716988001;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IHQs81pS5e/M8Ft067yAZNFQ01IZ5xjkXQeMA4zm/pc=;
        b=sB9IQWEam+0nyKMk8xAvlEXLThi88y/L8mFpYrMXfxIyes8KKHqAb1oM8AyfAuBS/G
         KLqJ2Pe/oPiGEKnbANCkFHZaKcBgYgQn5G0/AT++zVwVgxggyODGkvpj/3UIS3YkD49W
         Qxff8/k0dJBLoroospHFqQ+XHT94zEuzxqCZDAwUpa8i6rd5OM7CwwRSi94GHXOhRGNC
         7TQYYdnhYjnTKplJELGFI606wksvqRFM3vSeiC6dZV5SLzKKvWydu/0HlU92ZnbxtGuQ
         YwaUvyxUjfNC14u3MzjM8QE/z1k0M4FMPVVe1rA84NB0YN5TxfelgRKyW3O2I2v6jw4q
         3Fzw==
X-Forwarded-Encrypted: i=1; AJvYcCXdXtixoBaVRbadXn9OC9aoIBwqusmOgl5MQ4JCigZtAwt9rDv+YT8UXQGtDTzCeu3biiizjhVE1yhd4I69hItfAYTVXsoGuVjH4ZdPnw==
X-Gm-Message-State: AOJu0YwWC9OxTAOKEEpkszu5diLQleOOUFZEuBPVYjgLRGDssezepywX
	UGFKNEaD5mtAUNRli7VR4wABqUV/e3LrLlhSiWVSwDYZRdNGuAUuV+Tcy63Jzl0=
X-Google-Smtp-Source: AGHT+IF5qKv7UruRy7oBLP8sQOBvZCH9oB3wHTijgo+xIDX3Mq8ff5or65N1qYLdZ5YnzEz5rE/e5g==
X-Received: by 2002:ac2:5548:0:b0:51d:9808:6645 with SMTP id 2adb3069b0e04-526c0a68dd6mr1569386e87.50.1716383200660;
        Wed, 22 May 2024 06:06:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8b9d:52bd:4757:6b10? ([2a01:e0a:982:cbb0:8b9d:52bd:4757:6b10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7d2bsm1759195266b.120.2024.05.22.06.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 06:06:40 -0700 (PDT)
Message-ID: <42ba8472-9d63-4125-b538-39d8090203b4@linaro.org>
Date: Wed, 22 May 2024 15:06:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/5] dt-bindings: remoteproc: qcom,sm8550-pas: Document
 the SA8775p ADSP, CDSP and GPDSP
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tengfei Fan <quic_tengfan@quicinc.com>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Alex Elder <elder@kernel.org>
References: <20240522-topic-lemans-iot-remoteproc-v1-0-af9fab7b27f0@linaro.org>
 <20240522-topic-lemans-iot-remoteproc-v1-1-af9fab7b27f0@linaro.org>
 <e89c3270-e51f-4d5b-87db-09ff8f0961e6@linaro.org>
 <CAMRc=MczvfcXnEae__LJh47T=vCTbCz9EHOrNP+QmpTDvdarZw@mail.gmail.com>
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
In-Reply-To: <CAMRc=MczvfcXnEae__LJh47T=vCTbCz9EHOrNP+QmpTDvdarZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/05/2024 15:04, Bartosz Golaszewski wrote:
> On Wed, May 22, 2024 at 2:42 PM <neil.armstrong@linaro.org> wrote:
>>
>> On 22/05/2024 14:08, Bartosz Golaszewski wrote:
>>> From: Tengfei Fan <quic_tengfan@quicinc.com>
>>>
>>> Document the compatibles for the components used to boot the ADSP, CDSP0,
>>> CDSP1, GPDSP0 and GPDSP1 on the SA8775p SoC.
>>>
>>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>>> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> ---
>>>    .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 76 +++++++++++++++++++++-
>>>    1 file changed, 75 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>> index 73fda7565cd1..9d3a862c39e1 100644
>>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>> @@ -16,6 +16,11 @@ description:
>>>    properties:
>>>      compatible:
>>>        enum:
>>> +      - qcom,sa8775p-adsp-pas
>>> +      - qcom,sa8775p-cdsp0-pas
>>> +      - qcom,sa8775p-cdsp1-pas
>>> +      - qcom,sa8775p-gpdsp0-pas
>>> +      - qcom,sa8775p-gpdsp1-pas
>>>          - qcom,sm8550-adsp-pas
>>>          - qcom,sm8550-cdsp-pas
>>>          - qcom,sm8550-mpss-pas
>>> @@ -44,12 +49,13 @@ properties:
>>>
>>>      firmware-name:
>>>        $ref: /schemas/types.yaml#/definitions/string-array
>>> +    minItems: 1
>>
>> This will allow a single firmware name for all compatible,
>> which is wrong
>>
> 
> So increasing the limit from the default under allOf doesn't seem to
> work, should I instead keep this and make the lower limit stricter for
> all other models?

Yes add minItems in all the allOf:if: and add the missing allOf:if: for
the new compatibles to set the minItems, same for memory-region.

Or you may simply spin off a new yaml, this one is getting quite large.

Neil

> 
> Bart
> 
>>>        items:
>>>          - description: Firmware name of the Hexagon core
>>>          - description: Firmware name of the Hexagon Devicetree
>>>
>>>      memory-region:
>>> -    minItems: 2
>>> +    minItems: 1
>>
>> Same here
>>
>>>        items:
>>>          - description: Memory region for main Firmware authentication
>>>          - description: Memory region for Devicetree Firmware authentication
>>> @@ -81,6 +87,21 @@ allOf:
>>>              maxItems: 5
>>>            memory-region:
>>>              maxItems: 2
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          enum:
>>> +            - qcom,sa8775p-adsp-pas
>>> +            - qcom,sa8775p-cdsp0-pas
>>> +            - qcom,sa8775p-cdsp1-pas
>>> +            - qcom,sa8775p-gpdsp0-pas
>>> +            - qcom,sa8775p-gpdsp1-pas
>>> +    then:
>>> +      properties:
>>> +        interrupts:
>>> +          maxItems: 5
>>> +        interrupt-names:
>>> +          maxItems: 5
>>>      - if:
>>>          properties:
>>>            compatible:
>>> @@ -128,6 +149,7 @@ allOf:
>>>          properties:
>>>            compatible:
>>>              enum:
>>> +            - qcom,sa8775p-adsp-pas
>>>                - qcom,sm8550-adsp-pas
>>>                - qcom,sm8650-adsp-pas
>>>                - qcom,x1e80100-adsp-pas
>>> @@ -177,6 +199,58 @@ allOf:
>>>                - const: cx
>>>                - const: mxc
>>>                - const: nsp
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          enum:
>>> +            - qcom,sa8775p-cdsp-pas
>>> +    then:
>>> +      properties:
>>> +        power-domains:
>>> +          items:
>>> +            - description: CX power domain
>>> +            - description: MXC power domain
>>> +            - description: NSP0 power domain
>>> +        power-domain-names:
>>> +          items:
>>> +            - const: cx
>>> +            - const: mxc
>>> +            - const: nsp0
>>> +
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          enum:
>>> +            - qcom,sa8775p-cdsp1-pas
>>> +    then:
>>> +      properties:
>>> +        power-domains:
>>> +          items:
>>> +            - description: CX power domain
>>> +            - description: MXC power domain
>>> +            - description: NSP1 power domain
>>> +        power-domain-names:
>>> +          items:
>>> +            - const: cx
>>> +            - const: mxc
>>> +            - const: nsp1
>>> +
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          enum:
>>> +            - qcom,sa8775p-gpdsp0-pas
>>> +            - qcom,sa8775p-gpdsp1-pas
>>> +    then:
>>> +      properties:
>>> +        power-domains:
>>> +          items:
>>> +            - description: CX power domain
>>> +            - description: MXC power domain
>>> +        power-domain-names:
>>> +          items:
>>> +            - const: cx
>>> +            - const: mxc
>>>
>>>    unevaluatedProperties: false
>>>
>>>
>>


