Return-Path: <linux-arm-msm+bounces-49156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A1AA41BC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 11:56:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 338F2189416A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 10:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89393257454;
	Mon, 24 Feb 2025 10:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lFgN5zLL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD381AD3E0
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 10:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740394510; cv=none; b=qyVVU5GmQi0skeqK6FBH6DtVMZU+lEcF6pZgiapoqocqyamL7N0tJy2sxEzP7tOSySg/P9jII26sRw2NxAQBDqXvJ/CpzvqeNmZoxBF8KH8+b7z6Z/k4CBI1nbMATYYjx7neZUL7QRJFk5xrjVkpyMGEFZBjlQct0C9MAWnN4p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740394510; c=relaxed/simple;
	bh=l0bNRcWw2GffP61aokgJT5WZ+wFeJ02jEdzQTThNDHY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KW7f9yssBQmCT+bqCTW6s6otxdxpdubiUAArFhEMLGLSU1CbGxDJUZUOxQEKCA5J5edaT0GlxQf38TThyV7y43dxCo7EUc6Am03Y16yYR9pZi68Jb+rtmVmOAT9gujM6SEHsSs9US9VDLV1mXVr9Uigd6Y6JAXkTA4LZusp7dw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lFgN5zLL; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38f3ee8a119so2036714f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 02:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740394506; x=1740999306; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Iot9I4h4jJMqZbR9/3Iio7a6IBbtlOgx6s1kh41LTE=;
        b=lFgN5zLLAaYUHc71SlmY2dJV91kfZxzOyLQDFd2AOaxZMHkBmlQx1pZN5V90bL44i7
         +b2sENSUIejUuW53MpR5UjSbHlmb6pc9DOeuYt22+fVmHV0YdFhQ8hgAVBJTDKlVA0y3
         PCb8QTBPOk9pO8wkfTgwONLXJtDts7OHUQG7hZdxTjTME15Hmst6vj1AYTR1zd5RwFvs
         qttIu90THniQLLTuiezTOtzd+iDvSM0jRuKWH+DlSYHaabB+X5tj73vQMT/ByX4tsvTM
         dQ/GYwAVAHQnhXoWiIKZDyJ/95MlLV6cTBiRZ8trHHOdLW2aw0DO/rDj2fxYF4RRtfGH
         r/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740394506; x=1740999306;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4Iot9I4h4jJMqZbR9/3Iio7a6IBbtlOgx6s1kh41LTE=;
        b=sLCWlLSnvDEYaGQcFJzL+ZWMwLAkkElbVvy0xkOpMPskfbinVUz7LBAo+5qjedC8G1
         o/1xGA5UBb4Tqelnjl6muBKXRfC9f5dyEbblhqR7WJ5eIUY1zJo+7oeswOQzi5+27i4c
         OlQzrFtb2GBxCo/EbMEYft75oTjs81+1FNzHR0Q5bis23a0n6FHBWb9OTU7FqiKPNBrO
         UB01Qk6tkM33TVkvVTmOQBgb1yS0cu4OK1zoM0QOpAz20cg7wIT98fxr6L2e86aMw1xx
         awdbUDsXJaX0jslbetr6Z+FU4nCMb99etLJBF09gHguOysLBGaLhHKx88jdyY5MLMqmi
         S26Q==
X-Forwarded-Encrypted: i=1; AJvYcCXCsHtbXlP+DdNRJVhGRdyMTQJNKzDyeWbHfEeVD5nfxRElmIHnpzJ8HElXbFtP1QY1aJRtf2jKoWvE0jwd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt3D/WfYl3Y5GQrwnTP2D3/xgdN+p+pPR5hpcLQ09PDFc17RPI
	63ksXXMKzRXo6yce12iQkGqmKdhqND+2+hWjDIVUEp9+HzzK6pyg8SVgGeApTCI=
X-Gm-Gg: ASbGnctaeqmULxfj664a24P45mUQ0iF8vP1FHw1WqPN9s8NaEV/Cd7qF2Nz7RlZPMpG
	Yhdid+AYZCsungUMT2Y41lWUV+3JWzp1c8uNHdrSIbpS0q04XJz3UkqiSfZWl1HVV5p3Fr1VEzP
	+J0lpjEx0Fw0kPYf+BM3RFRd0N2Us3cnEz/U7oONd5EBbN50uPOofCwKIAGIuvQCJmbqQnjE69F
	Y1eL3sE/4vhZF3p0wJLXqkKeZbia/4xl9TUK1LpA/g2bZi5ZiA+lLxpSzWg027GyGWwuy6lFcdW
	ODwmW7m6qy5zim6oxkUzs3BP7EnrqKdE3uwCApYHS0kseTCDjzX+wH3pFzG8A7OEgSj8k0AJsVr
	Qxc8=
X-Google-Smtp-Source: AGHT+IE4j4S+EDiD5wh2IMuUEhCY86d7JCH8Dc3GdjFV6vdXtjgVdXLV1ClcAd5tybFFKQM3S7o/Bw==
X-Received: by 2002:a5d:5985:0:b0:38f:4808:b9f with SMTP id ffacd0b85a97d-38f7085c617mr10519652f8f.47.1740394505896;
        Mon, 24 Feb 2025 02:55:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:825b:5392:ef70:cc0b? ([2a01:e0a:982:cbb0:825b:5392:ef70:cc0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f7979sm30904426f8f.83.2025.02.24.02.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 02:55:05 -0800 (PST)
Message-ID: <d3067b8e-38fe-48b0-b031-8aacd1aedca4@linaro.org>
Date: Mon, 24 Feb 2025 11:55:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 5/8] phy: phy-snps-eusb2: make repeater optional
To: Abel Vesa <abel.vesa@linaro.org>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-6-ivo.ivanov.ivanov1@gmail.com>
 <Z7xF66TctF2wuoGj@linaro.org>
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
In-Reply-To: <Z7xF66TctF2wuoGj@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/02/2025 11:11, Abel Vesa wrote:
> On 25-02-23 14:22:24, Ivaylo Ivanov wrote:
>> Some platforms initialize their eUSB2 to USB repeater in the previous
>> stage bootloader and leave it in a working state for linux. Make the
>> repeater optional in order to allow for reusing that state until
>> proper repeater drivers are introduced.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>   drivers/phy/phy-snps-eusb2.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
>> index 4e5914a76..dcc69c00a 100644
>> --- a/drivers/phy/phy-snps-eusb2.c
>> +++ b/drivers/phy/phy-snps-eusb2.c
>> @@ -461,7 +461,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
>>   		return dev_err_probe(dev, ret,
>>   				     "failed to get regulator supplies\n");
>>   
>> -	phy->repeater = devm_of_phy_get_by_index(dev, np, 0);
>> +	phy->repeater = devm_of_phy_optional_get(dev, np, 0);
> 
> Maybe make it optional based on compatible or something?

It's already optional in the bindings:
Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml

So it's:
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

> 
>>   	if (IS_ERR(phy->repeater))
>>   		return dev_err_probe(dev, PTR_ERR(phy->repeater),
>>   				     "failed to get repeater\n");
>> -- 
>> 2.43.0
>>
> 


