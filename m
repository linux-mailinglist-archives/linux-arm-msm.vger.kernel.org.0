Return-Path: <linux-arm-msm+bounces-2505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4C17FDADE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 16:12:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C9B51C20912
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 15:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A50F3717E;
	Wed, 29 Nov 2023 15:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wOCTXhZm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2333FD5D
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 07:12:22 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40b4734b975so27434885e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 07:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701270740; x=1701875540; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Hdd64HNUK0tSK3Da+oWNy4zZpaQIUo/ssbLKmavYcU=;
        b=wOCTXhZmv+Wgg/kv0IJ87WkSTqjpyt9/xcvDfmCtM5kCEvMvgo+j+noueUdhMH98zO
         QKyavS+gpxJfyMeOAS/+YszBE0yzY0/vDbGDoyiw2p4wB1R1h+bKxykiwIjrzTpOA31I
         k71UaOXdLYVOOxIv66zY4tnnh4ZMqiDEHwZOnqeHhKR39BgXSdrmb40c/dme2eRwA91t
         Mk3rEB+p1iDLWzIrYUYXWe8fUKr/DGpP2F+iqr31PFBfL91EwhdkwzF/PdDv60ZpgibK
         r8qwyBDhr8JPFfwpK5NAL07Wz7VN738yswNraqj9WKxWNbPVJG30WXZRbdyG4cQXmy+J
         C53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701270740; x=1701875540;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9Hdd64HNUK0tSK3Da+oWNy4zZpaQIUo/ssbLKmavYcU=;
        b=unIoCrEl8SG/u+5F9Qo8xa9c3uatIRRHubOhyvjrk1TTjB37Ch/+obqmfzB/QO/WSg
         FBoj5t4qKcAvr/r4MphKfCYlLQeOGiIGJ50JmkVVvH9QfX6Vs/PA/wqaQuymTfZpjNo/
         FkhBEpv7Aj0ty70B3GkUPxBFkNeu8qcHlQi/nU48QBriUBQAkq4Qz5nCb2VYNXB4BGmg
         frtAxJYT2U23+EndxCGRH/jkn8HaQlno6An9JY7xgueT+aQWdKJ/YWHlia4pivVNjRz7
         4V30iOa8envtrId92njOUthphoguW3x/ZKVqQTqUgwENtetc2SyKc56jGpqJXUXOvPLp
         xvbQ==
X-Gm-Message-State: AOJu0Yy05DC65IlrsYdu+Af2ECGV+SYs4bbvPLLNOMQoTTX56JZm0Giq
	VDcwSxzxE0U5WP1PReHS6kESBw==
X-Google-Smtp-Source: AGHT+IF6BSoAaomITr4Z8xFOaHR6UtekVxTvNoVtk5sxQ+zoAVT/1BIogKnQKPJoVioojJENj2zBmQ==
X-Received: by 2002:a05:600c:4f42:b0:40a:28b1:70f8 with SMTP id m2-20020a05600c4f4200b0040a28b170f8mr14698978wmq.21.1701270740436;
        Wed, 29 Nov 2023 07:12:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:31d3:eea3:8f97:6a2c? ([2a01:e0a:982:cbb0:31d3:eea3:8f97:6a2c])
        by smtp.gmail.com with ESMTPSA id j11-20020a05600c190b00b0040b47c69d08sm2531225wmq.18.2023.11.29.07.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 07:12:20 -0800 (PST)
Message-ID: <0140f49d-c463-4011-8159-f4e56466e6bd@linaro.org>
Date: Wed, 29 Nov 2023 16:12:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 5/5] ASoC: codecs: Add WCD939x Codec driver
Content-Language: en-US, fr
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231123-topic-sm8650-upstream-wcd939x-codec-v1-0-21d4ad9276de@linaro.org>
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-5-21d4ad9276de@linaro.org>
 <ad9a7c4b-82f4-4347-b4dd-a394e4ba95f0@linaro.org>
 <42a6f6e0-2846-4cdc-8702-493fadbafb98@linaro.org>
 <eaa034cb-06e8-4204-befa-4389bcb7d9e8@linaro.org>
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
In-Reply-To: <eaa034cb-06e8-4204-befa-4389bcb7d9e8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/11/2023 14:46, Konrad Dybcio wrote:
> On 28.11.2023 16:01, Neil Armstrong wrote:
>> On 25/11/2023 13:07, Konrad Dybcio wrote:
>>
>> <snip>
>>
>>>> +
>>>> +static int wcd939x_io_init(struct snd_soc_component *component)
>>>> +{
>>>> +    snd_soc_component_write_field(component, WCD939X_ANA_BIAS,
>>>> +                      WCD939X_BIAS_ANALOG_BIAS_EN, 1);
>>> All of these values are BIT()s or 2-4 ORed BIT()s, can you check what they
>>> mean?
>>>
>>> Same for almost all other snd_soc_component_ write/modify functions
>>
>> It uses snd_soc_component_write_field() with is the same as
>> regmap_write_bits(REGISTER, REGISTER_MASK,
>>                    FIELD_PREP(REGISTER_MASK, value);
>>
>> So the 1 mean write in enable mask in this case, and mask is single bit,
>> read it exactly like if it was using FIELD_PREP(), but even for BITs.
>>
>> I did check every single snd_soc_component_write_field() so far to check
>> it matches.
>>
>> Or it's another question ?
> What I wanted to ask is whether it's possible to #define these magic
> values within these fields

OK, so most of writes are to boolean enable bits, I can use true/false
instead of 0 & 1 for those, would it be more readable ?

For the rest, those a integer values to a field, those are not bitmasks
and I do not have the definition of the values.

I did a full cleanup and tried to define as much as possible,
there were still lot of places where not defined bitmasks we used,
but there's still some integer values, but I think it's acceptable.

Neil

> 
> Konrad


