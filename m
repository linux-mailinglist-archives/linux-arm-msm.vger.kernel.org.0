Return-Path: <linux-arm-msm+bounces-77697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B0DBE6E7C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 09:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5106735A8EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 07:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE05C14F125;
	Fri, 17 Oct 2025 07:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xy4csbes"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019FB1519A6
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 07:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760685373; cv=none; b=GJ4kqHuRf2svnxj/gUjnetwcPCcyXiLT1AihOpLHj0Yfa/JMQuo9T4jFGfBm35Z4wR63MwIrXJiKUh8nc3NpMPxMFkXuS+VqXGGUn1gA6MPFnMX8L/UN0jqb0GVGJTlf0eAcTOEvmUCgC7uFOhXTD5JrmKFtsJlfdGKKTsond3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760685373; c=relaxed/simple;
	bh=31nASrMlEYhjgquLurvUbraovx4gJmOk1TIzPuG4tJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=opGyNsov1MfJUBylhlk31rvTaAPUt2niIvRaJcN+F84ycMda6imlueK0j723Ss6HHt/5xiW0mtid5ulXBoTc3z0goZ5UUw4md2N4Te0Z7wlEaMeSJ7N0JdVQRxBu1fmCFKNb0CxXe7Uye4C6+hGZ2KuPfC1mbuD+EiDf3e+Gzqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xy4csbes; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4711825a02bso4840045e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 00:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760685369; x=1761290169; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AVXbG5CCxVfM6hnx09YFhTKic442YEoyyW/cetRSyDM=;
        b=xy4csbeslMAdKa9FtqLMz5JyNJNRMOtOh3lgbzuXjVgHZyFyaHQRJjbxmRMuk0zjk7
         x17Rxf0CAIP2FUXNEdi5wDGv8y3MJz+2T0ckf5s5kDiVkCC3fdWwohe3egyeS+NFtPKo
         wuRjlUzO+oOZtV8nhI+nkHwzmcHKhdLgdusL3s+QXAU1+c+vMUQzMT9c0AMVZ6ab97Bn
         Lm6jNur2MxWz3svGBBCZDdRU3Ax85tnKChmql+RunzLgyPhWWOh5iFfgr1W36uJEW+mB
         Y91UqH4JXe/0f8LocOs3nWrJNZtp0G1hmynHvaS1+SXf1BOCPTJjVTXm9n+a6noov4fR
         UQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760685369; x=1761290169;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AVXbG5CCxVfM6hnx09YFhTKic442YEoyyW/cetRSyDM=;
        b=YoOPY5QzSVbghCaNhU54AMaUElB+s+bAcp1zlxUnMhHjp6WxvoQiB6F0su7b3ASWWw
         VoabGUAqtTVX5ksuOWhFTNQG7GdaEFyqLU2s/cnIrCCjlvLlphTVeYkPwvd4r29s9XQp
         DIhrtn1emNvmlsYt+hEXa3oL6sDhGyDc5qtmcXmo/q2RpSkoOY6yViteIUDTF5dNtsq6
         mxmVs02ttGaYHZ05ORvwwPEh+XwIm6Im3uk9lR4zSsvs25ugqvVzFdkTfFgLdEjRE3xZ
         U4sC81r7lu+H6Tp7le/Fo1x7Qm2EtJnTAEh444GajVgoZsJeTt9ilIE9xRAdS3LSLZGp
         yskA==
X-Forwarded-Encrypted: i=1; AJvYcCX6kC9UzjviFgmjDHMLpnyEs7uJMIdXP1ytrZaJmYxwubE/fakpr9HYnbuhawHBD3kTZomCXcOa/n5UPa05@vger.kernel.org
X-Gm-Message-State: AOJu0YxqbXdd+nfDArgNT7bYuXi4IOLa4rL5Vb+cf7Ispd7PINEV/WEj
	Suo5/Sbpkh0Q6DfK2CdtRNgbVDpW4KcPU7fvJW5QmsRKhkboqXbD37s2EMcdtn7TkYo4pBxALx2
	vYKrY7bk=
X-Gm-Gg: ASbGncvv4tr8UB9pBDM9byZ+9i6vt1UmEqwHObUOqw1QvVAdrtxTA+5VsfQEeN3/aY+
	mi512FrHci5CrVvyzWgnIhL0tgfqD7lc+341agRrx4I9XVVH8ny0rLO7zcSLw5xjJx2xHZqgxnv
	qO1X1jhfUVCi54WERgc55sB/TriVb2yqTFFiBduaXJ9Dxwx72ekoecj3nSuIHyuyU2Dm49+7Z6s
	1//G9NU4cMUlDeVwh1Qdnm8Pg8uAp4pO5uoO9TGCy0hx8gqUep5CW8wTCC8iZa+PXQ1wmSghLkQ
	jl7CSKtzIjHI6pe+Q/Gr3qfepIfx9TYHwb+GDB2CC9VyRj+ZHOJp0chY25dkRMc6kaybkTvcsCu
	ghiP3FYionlKOEVp8GfcCrlTYTMQibhBzyjaeX4Tiv96z5qZFDo3um6lVd3GNcXeyGPSKG533wC
	JBufVRGP+ojxu33VZWzqeJ2oQOIegGUcOfjSjF4RX1Pxh8sPOdisWFewdAqmzIdE9vuYJzoQ93y
	A==
X-Google-Smtp-Source: AGHT+IFkD17oo+usX5kpsOF/sHUM1VRDulZyCLwFUAsMU9A/TQDJb3xLY6V6voxUAp7hqzT/TMO5XQ==
X-Received: by 2002:a05:600c:3b8d:b0:46d:27b7:e7e5 with SMTP id 5b1f17b1804b1-47117917572mr24984885e9.32.1760685369119;
        Fri, 17 Oct 2025 00:16:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:5849:4623:6b2a:2be9? ([2a01:e0a:3d9:2080:5849:4623:6b2a:2be9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144b5d48sm67532085e9.9.2025.10.17.00.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 00:16:08 -0700 (PDT)
Message-ID: <ff687b51-5f47-4edf-9611-d3730397c830@linaro.org>
Date: Fri, 17 Oct 2025 09:16:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/3] arm64: dts: qcom: sm8550: Enable S5K3M5 image sensor
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251013235500.1883847-1-vladimir.zapolskiy@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20251013235500.1883847-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/25 01:54, Vladimir Zapolskiy wrote:
> Enable Samsung S5K3M5 image sensor on SM8550-QRD and SM8550-HDK boards.
> 
> The compatible property of the S5K3M5 image sensor along with the driver
> is added in a recent changeset:
> * https://lore.kernel.org/linux-media/20251012231102.1797408-1-vladimir.zapolskiy@linaro.org
> 
> Vladimir Zapolskiy (3):
>    arm64: dts: qcom: sm8550: Add description of MCLK pins
>    arm64: dts: qcom: sm8550-qrd: Enable CAMSS and S5K3M5 camera sensor
>    arm64: dts: qcom: sm8550-hdk: Add SM8550-HDK Rear Camera Card overlay
> 
>   arch/arm64/boot/dts/qcom/Makefile             |   4 +
>   .../dts/qcom/sm8550-hdk-rear-camera-card.dtso |  91 +++++++++++
>   arch/arm64/boot/dts/qcom/sm8550-qrd.dts       |  46 ++++++
>   arch/arm64/boot/dts/qcom/sm8550.dtsi          | 144 ++++++++++++++++++
>   4 files changed, 285 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso
> 

For the serie:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

