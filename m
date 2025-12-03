Return-Path: <linux-arm-msm+bounces-84220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D25DC9EEE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 13:02:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A4D83A70C2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 12:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE9A284880;
	Wed,  3 Dec 2025 12:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="REK0Auuv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7122BE059
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 12:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764763334; cv=none; b=EpSTLz5jsw2ETzRCSVtOpeJLHsJho8aSdkEKCSwenEk/sMjXg4lo2cm5y6ft624CFMoxxiIaiVGmjJvFPYswI8LK72bxKf3Zei5nRgftwEN53hutdyUFGgYYl8ARNxCtak6Xt5tNgr6BZqmBC0qQ5kXsXFguV03r2EhtNE+Tslo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764763334; c=relaxed/simple;
	bh=M7pOBNlBvwEuEtzmMJqbSg9r3cWAn7G/00Z/yVHCxbs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=i4Vi7e/5QFs9ne7dFjPQ5FCJHJDB35GqosyULzWFEHK/zhWCvPAxUe+pEkxtfu4vxOFfjevm7Li21GRCoUQuTxvCtD2E5IKnZf7XdKrFmNshNWnuyRobhyrvd2KZ46TlIRqyvp3Yho13Vjoi02PecNtvybNPWnvG0ptUMMeHi5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=REK0Auuv; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso44041265e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 04:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764763330; x=1765368130; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CcGrXNB0QpTBnBRGs48XA92EnDcBTgYIPVqQfbDEykE=;
        b=REK0AuuvurOuFLXL9IQu2U/YpYYORP8JsT6g4RmzRKYXQlLQzPl6iOqCFYnqMtUlF8
         HJPkILbFYTdSTQpSiHsLosjeeCMCjsncmLUR0Xefqic7SNWwKIUbo7lYh0iKZ944U/Cw
         ABoL+5IBUIO6qw1BIYxrUjtvc+c70whHVq/kVL9v0SuQby51wyzfIlciQ0seW9vfj/T2
         UBBNILjBaaHeXU25igsTlkkAzElw/Kj75erwJdRK+yuGhUxPySZTNMc7eChBuJDzmT5N
         Rqx3llbWEmAPaMh5XTJsiDQf9IFZjrwaLJCuckeB0wJqqTTjK6HSObawnAuJCRI4rGU1
         7n8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764763330; x=1765368130;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CcGrXNB0QpTBnBRGs48XA92EnDcBTgYIPVqQfbDEykE=;
        b=EzeM2x8to5cqZqc0yxwB1veKOYLHS7iZgBWwJHZ6O79HaDN4HMfcxOTFNrY4/ug5Ll
         qshD35sSaQpx+Nnjx85ziZjzBUGlr/JDH/fIn8mwA3ATsGuRd18ymoLhPPN4X1JWoya3
         ZpkFFEFRQaRMoxNqRqwnathj54vTTi3Y3uVIefbBRIh0GE6CDKzmL5nmS7b7PY7Q29/s
         TJKus8Ykc3kMMnp+l8TcFQl6ZGWpcIEmbvxdmDhfafXseQ5C3r2eDZV288lfxDFy2v+R
         1p7WTbfCMfe1nnp8zOY9+nuRf+2CM1gPZoX7o78C0VaUAC0xh69eo5UL4fk6J/bKI1f1
         D0wQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtM0/q4BkfoND8lGQRAraNXlEhEpRYvAFh7bfdmnT6Njp8wvmJWdbGNIYb8U9hmVFo84lWr0oIYP8z1sT/@vger.kernel.org
X-Gm-Message-State: AOJu0YyNgO4Ox1ez/357JRLQqtQlJyDRnFVckiXGgt1q7tDMRHn4/iR9
	7t8o3toEQ/JNywWrsEmYpExwVkRJZ84xlzByZOhyP/xjyQX35LlLMjPbX+ZuH5c7Yj0=
X-Gm-Gg: ASbGncvb602Mb4gNsCek+noM52YNfpcQpVpOI6wuXPUILIrLUL0gmSWaDxuyyjmY0L+
	nUZyvJMD20P8dvpUE5rPpWnlMAWpD81drrYEfS+N1VGaoGGVym9rCo+W6Q6YFJ8rnCs5/sjqmAf
	QoxCIZBCXdnnAVmguJ6+o3UIHspzyOAvjnGp09fy1nXlRAqoCU+SAWQ5tFTQ+hYAU/nJZi91bsi
	qRT14nfiYPqocEeDjo8AynXgbNKCn6FpDFfmmW8bK7SXjE+U+kMXSZCQCMQjS3ZB+UfLd/VDEM9
	r2HL/y9ZbRqU+jg5oYGbzcYFWYeLh/yX11QyHyCp2FXw1IiW6Lp1nBZxsIYeV+v1ByET8XCNzoD
	CpN9pYFRl05AG0mGgJGyXbTCJnJ7TSTiGiS7nNbV19K/MsIAVnG2uN/zy993356C41Viq62Iy42
	KonPu3eLcCMo2OTXKY1MxKgFn+j9KPoZ8uAUNn3H5WnKdnuhJ+pGdNw7lVMFXDvOrmuHRl48xP3
	A==
X-Google-Smtp-Source: AGHT+IFz2MTHOJgrReqmTi5hgRcl6UI1YsGGIf7RQ802UfMw3sStRfOkPuol816rACNh4tHXOZ43zg==
X-Received: by 2002:a05:600c:3b26:b0:477:7f4a:44b4 with SMTP id 5b1f17b1804b1-4792aee39c5mr20575715e9.1.1764763330340;
        Wed, 03 Dec 2025 04:02:10 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:955c:3368:b15d:18c3? ([2a01:e0a:3d9:2080:955c:3368:b15d:18c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792b02e842sm14995815e9.1.2025.12.03.04.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 04:02:09 -0800 (PST)
Message-ID: <1e5562ad-a53c-4a06-9428-f7c010cac85c@linaro.org>
Date: Wed, 3 Dec 2025 13:02:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8550-hdk-rear-camera-card: move
 camss status property
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20251203040538.71119-1-vladimir.zapolskiy@linaro.org>
 <20251203040538.71119-7-vladimir.zapolskiy@linaro.org>
 <4149ccd0-0583-4d7b-a37a-df899b3e15fb@kernel.org>
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
In-Reply-To: <4149ccd0-0583-4d7b-a37a-df899b3e15fb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/3/25 09:32, Krzysztof Kozlowski wrote:
> On 03/12/2025 05:05, Vladimir Zapolskiy wrote:
>> Conventionally status property of device tree nodes is the last one in
>> the list, move it there.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso b/arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso
>> index 21bfba6a1182..544cec93353a 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso
>> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso
>> @@ -13,10 +13,9 @@
>>   /plugin/;
>>   
>>   &camss {
>> -	status = "okay";
>> -
>>   	vdda-phy-supply = <&vreg_l1e_0p88>;
>>   	vdda-pll-supply = <&vreg_l3e_1p2>;
>> +	status = "okay";
> 
> 
> NAK, making such changes in multiple patches is absolute churn.

While it may be a "churn" for you, the patch is perfectly valid
and a NAK is not appropriate since Konrad asked this to be changed
on the already merged original patchset.

While you're right we should group such changes, it happens that
he sm8650 files already have an unified and clean style, and it's
not a churn to keep the style unified.

Neil

> 
> Best regards,
> Krzysztof


