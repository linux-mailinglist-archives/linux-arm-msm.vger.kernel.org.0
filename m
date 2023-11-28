Return-Path: <linux-arm-msm+bounces-2233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D777FB57D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 10:19:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63D89281E7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 09:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0702545BF0;
	Tue, 28 Nov 2023 09:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ll1tKu3b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80FE01B8
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Nov 2023 01:19:15 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-332fd78fa9dso1367926f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Nov 2023 01:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701163154; x=1701767954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJ3V0q0kN4dcJ19Ow1ceuBEQfKiUYtgJ8KZQRLu90zA=;
        b=Ll1tKu3b9mBSOigmYdrVu9XXX0V5bFef3nrRDHyct+FCyFypmRHJpA1Ay18kQj36RN
         3uXBTSdfsyxJmveFi06DvIc/YOoaasYqpXnW5QmTucfVCXRVA84B7vcyHEl5/CPe3Wdx
         zMOog2MkfCeIRdRVNyUe6+yWKEsWVnI/DiAkVvqLLbs0Jh1XuRlmO2tkp/vf3InKUvgb
         M0lZMVuRIdTjobpQxQj93QAk6DuMjFj+TtyiAYWMWwJMMc7JUH4pT2Kk6u6llky6Q3vW
         R9hkQLy+rB3ZHUbop36UIAxwNkI9qX44wCi2EjbbVDJ1k2mexc2lpMHT/v70YvIy8qRo
         3CUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701163154; x=1701767954;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BJ3V0q0kN4dcJ19Ow1ceuBEQfKiUYtgJ8KZQRLu90zA=;
        b=ojdKRb8RCaPIgjupAzLhRlKThnzEAQVap3Gyq8E4oczDNXKDJfrgUhHTSuyZntaa3Q
         isIbiN5T45Q7J3LoSaR9hU7DerSOEvJFOa+Gh4h3G5jw+rBDauGR785bt5brZDI51/Ti
         FRRbpkfb/E/7P1p57cJZplTzmpiIY9vEnV1DEHMi0Ye8APgV6yvzfW4j05NGObQiV7fY
         moF3V0tDAea21cxAeyptfNNkjJjaIqH6KxzdzBIwUzWJY71ZItNDJQoXAr3+VBgDqHNB
         xQCdASxO+mZ1O8bKgltf84R7K94vt3PJu2sUzn6UV5JjNGbO3R7qSiAMGuysRBRoV8qX
         Z+8w==
X-Gm-Message-State: AOJu0YzvCqFxNhRtPgZk2Mni1IOGq95wHNSg8BxEQEXXW5PiHOhYjSkU
	3+He4Y50ySJJitSZ/bwnRpqF+A==
X-Google-Smtp-Source: AGHT+IHOfqxAei4iLmLAMcsBFKePLmqMHOvd2JuyfofyNDEoVDltsc/kP1OjmEoERRPKcIoS7BlNaQ==
X-Received: by 2002:adf:f387:0:b0:332:e61d:4b84 with SMTP id m7-20020adff387000000b00332e61d4b84mr7953763wro.21.1701163153992;
        Tue, 28 Nov 2023 01:19:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe? ([2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe])
        by smtp.gmail.com with ESMTPSA id d15-20020adff84f000000b00333097fc050sm1872064wrq.1.2023.11.28.01.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 01:19:13 -0800 (PST)
Message-ID: <4729f36a-2cf8-423d-87e1-1733a9062bd4@linaro.org>
Date: Tue, 28 Nov 2023 10:19:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/5] ASoC: dt-bindings: document WCD939x Audio Codec
Content-Language: en-US, fr
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
 <160fc6c4-b07d-49c5-976b-aa0fa35e4f0f@linaro.org>
 <b637c287-93e5-4214-9275-80fac3c6181b@linaro.org>
 <60c9ba5d-a2b8-43cd-8b8d-2c709b8e5d04@linaro.org>
 <752f5347-703a-4b38-b2b1-3493d270389c@linaro.org>
 <91528bf4-c971-415e-afb4-51791c6dfc91@linaro.org>
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
Organization: Linaro Developer Services
In-Reply-To: <91528bf4-c971-415e-afb4-51791c6dfc91@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/11/2023 10:17, Krzysztof Kozlowski wrote:
> On 28/11/2023 10:14, neil.armstrong@linaro.org wrote:
>>>
>>> Here the device exposes its version in registers, so you can easily rely
>>> on the compatibility. That's also the case multiple times talked on the
>>> mailing lists.
>>
>> ... you're right here version can be determined at runtime.
>>
>> But, since both are compatible, there's no primary part number, right?
>>
>> so why use "qcom,wcd9395-codec", "qcom,wcd9390-codec"
> 
> This one, please.

Ok

> 
>> when "qcom,wcd9390-codec", "qcom,wcd9395-codec" should
>> also be valid, so in this can why not use :
> 
> Could be valid, sure, but we are humans and we treat higher number as
> something newer or bigger, thus previous one feels more natural. There
> are examples of this way, though.
> 
> 
>> "qcom,wcd9390-codec", "qcom,wcd939x-codec"
>> or
>> "qcom,wcd9395-codec", "qcom,wcd939x-codec"
> 
> This not, because wildcards are not allowed in the compatibles. In the
> past there were examples how a wildcard stopped being wild, so guideline
> is: just don't use them.
> 
> Best regards,
> Krzysztof
> 

Thanks,
Neil

