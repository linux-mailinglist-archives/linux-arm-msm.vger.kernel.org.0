Return-Path: <linux-arm-msm+bounces-80762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC223C3FB80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 12:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 474881882C12
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 11:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15AA6320CA6;
	Fri,  7 Nov 2025 11:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="znqkUCDQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1488F308F0C
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 11:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762514600; cv=none; b=oF1qEYzlIiR8WHcx+lBdVgmKkcQYfUgrvvKq8IMZ1Uw9KFKPzEOuL37CfqocDbW/NnTQ+aAJVWk5Rix4SoT1Imvl/S3Q2RJsi6NP5Mg8MTIq+gZmRKoXNiLF1PAjds7H7BPQj/CAfyQl+41WPVo+RwQCqozLb7SI/I4YUY5gUSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762514600; c=relaxed/simple;
	bh=hIRq1hBV/Vkm950YcOMj5joE3yzYwWC3jRnL3QIu1co=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=uB0kIpn+6UOgWoHSPLCKEdLqr/MOhbA5VLTjPZHkfWvxv/n/hPUPkcemHFf2mtIkTqJod0LiIi3loN0VXRjAnKFVXOlrpyMdUnJ4cmLIxaUjVxfiGd4bYD0/mIMTI2t/606CsFVjXdsyCI0RzHvWQdrCysOgjKM3JvAeivCt/dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=znqkUCDQ; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-429bccca1e8so351480f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 03:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762514596; x=1763119396; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VtAgMzQLUEkWjhbFNDOre6KPF58LB5AVVftjd0cwizQ=;
        b=znqkUCDQLSWxn/zRRI8tJAE6+ovbPzdcdiExcTCmBWZ7QMMKP8g/UnTooL50B7BGMJ
         lkDpP8i9xc8ftmkfK5Vf9A6g37rlUeaMFAJbu9SBgoy+zNnfrPMA/7Q3kkeyuL7d9a5w
         E2In1UX6Ii6uHo/TvyWgjdcXo2YXzwKNxcvjAkXa2Oz4o9xRMiIDTSKi27RIkiyBEBZT
         Pwqr2ZKVjGtTkpoYoETranZM/7z5bACrkF8vvPuEWRHISswJ2VkNZsUcJ/yIrtr8oLm/
         UXz31fQgI5Wpg3pT6IdwwJajKS/yiCbFa78PNzd+yDKw/PyHsDVm9ydjen3mXUKBKb0B
         eh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762514596; x=1763119396;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VtAgMzQLUEkWjhbFNDOre6KPF58LB5AVVftjd0cwizQ=;
        b=EvHSsuFsybezXNiw5hn24kI5THg2cFnDnXFYv475UgHukyKrDsXaJW+i7HPDPo0H/S
         gFTjB8D9yIli3Xd6FpS/awnqGukJrQHZfeLjhBtoP2ZFX+05BCBEaoEpb7hbUmfr7AGd
         zh5/Y76EJ+lyRBrJnXo6gcgxTxdZxusKTAHSz33Ve05jIeQsD5ccTUE5X+yzIabDHqkP
         pfA7x/mEpnWMrzBo2myfzh2c5EGNu0GkGP3SO5nd6zBMISbJTVOZa8vqbCxa/C+1ZHiU
         USXxUdTyAvUUdPzgZDBfZdK8hTeS0PMokAFdFjpOlwvOadw3JeUGbiW0cKzsWXqFm4NM
         Xcxw==
X-Forwarded-Encrypted: i=1; AJvYcCVByCRwC8DCM9YtGSJDrcJ72lhW6+vRzjBIOhTWsAj4iy1mQDiYsyMxzDgDR3VN4SfIbGtYIBX7nfLUKWjb@vger.kernel.org
X-Gm-Message-State: AOJu0YwvWr0pSIUj5SYOMypxqIC7nLnrOU8P6SZP50Wy8GBmzLoZunFx
	f7yDWnZjTLB47mawZnhkEkbwVR+Wtfgb6hHx+OADiRIcrX95RgjV5zRYXwNW7VztIZ8=
X-Gm-Gg: ASbGncswzTeegwM213cjtX0K7GRMc2jZQcltZNUlRhT9Qph8zF48C6h8BqHm5hE/wWZ
	qWFZAmTcMAFJHfe0fz2u/oVGIv6Z7GFNdY/eeA8ebbMYXXUwrtVIWcDodUpG8EzMKDVdKqL1S45
	8verawvM73o+4W3OyKULz3ECPEb1Pdc2E6Yfh1BJLeD3ZQbtXfWte+NTaQvtsZli7Wt2DJyzhk9
	LKUprpN7GZwPVkgUF0QIKMB3fctyzFMYCJTii/X2Se1YsB6MuJJ3N9l2vOPj7IeucXKxIWJOhhr
	gRrkwzZeWFLqZYohEb7eQpLKme1sJeuMGBoEFLLwwiqFSpUxX0ymbW6BmbzcQ3GbYlFlEdral5H
	F+fhLhya7eHbE5NyfzutbNjdbBPLMS22VDyk8WjXsuHja7L+kOcc2o8kr1i+1X0bNvwUQ66llau
	ojNhBXIyx4SNcnlQh52zu23Ao8JljQ29g1PgtfRpeozd/J
X-Google-Smtp-Source: AGHT+IFC6PS8CD4thOKnMt/0x6DHF4pMfb9zQG3hVlwbO9wPH+DcI/MNv2cBuknKQz9EdnzfI0iTFw==
X-Received: by 2002:a05:6000:458f:b0:429:d66b:508f with SMTP id ffacd0b85a97d-42ae5ac408fmr1620035f8f.30.1762514596332;
        Fri, 07 Nov 2025 03:23:16 -0800 (PST)
Received: from [192.168.27.65] (home.rastines.starnux.net. [82.64.67.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac67921c3sm4745735f8f.40.2025.11.07.03.23.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 03:23:15 -0800 (PST)
Message-ID: <be1b6e34-40ab-4587-8dbe-84e08bf83dcb@linaro.org>
Date: Fri, 7 Nov 2025 12:23:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 01/12] dt-bindings: panel: Add Samsung SOFEF00 DDIC with
 panel
To: Krzysztof Kozlowski <krzk@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
 <20251104-sofef00-rebuild-v1-1-dfcfa17eb176@ixit.cz>
 <20251106-enlightened-centipede-of-tempering-3cfa50@kuoka>
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
In-Reply-To: <20251106-enlightened-centipede-of-tempering-3cfa50@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/25 09:48, Krzysztof Kozlowski wrote:
> On Tue, Nov 04, 2025 at 11:16:09PM +0100, David Heidelberg wrote:
>> Basic description for S6E3FC2X01 DDIC with attached panels
>>
>>   - Samsung AMS601NT22 6.01 inch, 1080x2160 pixels, 18:9 ratio
>>   - Samsung AMS628NW01 6.28 inch, 1080x2280 pixels, 19:9 ratio
>>
>> This panel has three supplies, while panel-simple-dsi is limited to one.
>> There is no user of this compatible, nor the compatible make sense.
> 
> There are. git grep samsung,sofef00, gives me two users.

Hmm, on -next I only see a single one:

$ grep samsung,sofef00 arch/*/boot/dts/ -R
arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts:  compatible = "samsung,sofef00";

> 
>> Remove it from simple DSI panel definitions.

Can't you mark is deprecated at first ?

>>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
> 
> ..
> 
>>   additionalProperties: false
>>   
>>   required:
>>     - compatible
>> +  - power-supply
>>     - reg
>>   
>>   examples:
>> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,sofef00.yaml b/Documentation/devicetree/bindings/display/panel/samsung,sofef00.yaml
>> new file mode 100644
>> index 0000000000000..527a10e3b798e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/samsung,sofef00.yaml
>> @@ -0,0 +1,83 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/samsung,sofef00.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Samsung SOFEF00 AMOLED DDIC
>> +
>> +description: The SOFEF00 is display driver IC with connected panel.
> 
> Description goes below maintainers, see example-schema.
> 
>> +
>> +maintainers:
>> +  - David Heidelberg <david@ixit.cz>
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +            # Samsung 6.01 inch, 1080x2160 pixels, 18:9 ratio
>> +          - samsung,sofef00-ams601nt22
>> +            # Samsung 6.28 inch, 1080x2280 pixels, 19:9 ratio
>> +          - samsung,sofef00-ams628nw01
> 
> These were not in the old binding, so please explain in the commit msg
> reasons for adding new front compatibles.
> 
>> +      - const: samsung,sofef00
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  reset-gpios: true
> 
> Drop, not needed. It can stay required, though.
> 
>> +
>> +  port: true
> 
> Drop
> 
>> +
>> +  vddio-supply:
>> +    description: VDD regulator
>> +
>> +  vci-supply:
>> +    description: VCI regulator
>> +
>> +  poc-supply:
>> +    description: POC regulator
> 
> 1st poc, then vci then vddio to keep it more-or-less sorted. Same in
> required list.
> 
>> +
>> +required:
>> +  - compatible
>> +  - reset-gpios
>> +  - vddio-supply
>> +  - vci-supply
>> +  - poc-supply
>> +
>> +unevaluatedProperties: false
> 
> Best regards,
> Krzysztof
> 


