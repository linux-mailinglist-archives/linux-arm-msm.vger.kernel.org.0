Return-Path: <linux-arm-msm+bounces-32744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE56989CBA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 10:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DECD282E7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 08:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C566D4204B;
	Mon, 30 Sep 2024 08:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y6pgiQmL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D903F178383
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Sep 2024 08:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727684742; cv=none; b=QVdZ9ZDSf8IvusxxuwlZw6vtQXbGv4kK7BAx3hRFY7fRBm0sBFtpcuLFQT3aCHjX/7qy0PBTtPsY2RV3GiVvKOQXTaM1AuCFQId0Shh/pCBtRk1zjvZyOjUNTDRvf6M2LzAYTYVanafU26k+qhkWK+xPB1jJkDtgmPZQV0x1xKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727684742; c=relaxed/simple;
	bh=Zr7orhctD7M9/TlGR/E8hSvSZE12tYsaG6S3gzIrCs0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=EdedQdqSM2uDMBuV95jXsriWv/Fljj9j+R3A1mk3LtQ1700gzVqoe97ULfJP+L7EuavSH4+jKaBoxEJN6BI2FzdqMlmlx+aJmxTokr84bTse7f5amf7BCbsnq/HcU44iW8iz81e0ykVMaMgs7dfY6DQTQw7S37M3kHbSEtoQVa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y6pgiQmL; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37ce18b042fso1123469f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Sep 2024 01:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727684738; x=1728289538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yac4GW2g0k4dYTb7g4bjBXpJSvIBYL7Rvyf4vBYAEXs=;
        b=Y6pgiQmLCixgzUrMC53ZjRqJOh/TCNcM8X0qIpVrmz8zKNYSeQgXqD5An/q0NKmbe+
         kwCEUv5YLv8UFZP2hGqnk7n13E4X9eLQ4PGraseRzxhDPeqd1obCCdKfrM51LnjbkXzu
         BnK8fQY68c2zF9O/W8tEoCeHNy1Z4pO0sdBLqUozQQpvzjiygyTSOia19bzhG/gnJH/O
         uJk1D1YhsXnJF+fOAWXR9XWpvfDJMvY6OoAcYp15Nmv7G6blER1D4R4WWvpRxIHacJXk
         oJpkWYWGyhHphyVacEgHJh+AvAtELIDeULl0fBz6LPf5t1yU9B9tYvuVlMSdgcdLO2Gb
         LOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727684738; x=1728289538;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yac4GW2g0k4dYTb7g4bjBXpJSvIBYL7Rvyf4vBYAEXs=;
        b=kCA1wBXRPDCnl/ZoZJCGk75G9zcKSrOPxZleCg4VXz5hCpdhrv1JmRCzaGmVzX/XgV
         Ol+VfinIZQ7fuKLlnM+0o2uDsYMcfXevxj42cZfuHqff5ZoMnbVdybYEPCFU3OwzMq8t
         u8CttdkSma/TD2mLOEEOnCjkiCJdPycipRw+XQ+5wqIACsJpifIsnH64XN24eXHjJDcs
         jH5JkBmE6tc4qLOkuJVBUOQ+XSjZ0s4jv9MhX7R/7OEGyrCyamXAYCX4z2Itn9b6UaV9
         caT3KWnu5tn4Y8GcfMzQzjqUFYnKLQRri3CjKqoDzP4nDbNVvmeHnZ0qIk7GIOkUm363
         XrRA==
X-Forwarded-Encrypted: i=1; AJvYcCUGEADyGQarc3H2Qp35KRBcNjiRoTygqgRvTInGXFAv2Vr6iwp7L3J60WjB5qIbWIkpV5T7Lwbm82cHTXvB@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh2uPG8sGF7uPmezGWJ4mxZYlnUhu3bcq9HRzoWQH2oqtlHhF8
	WgcU2i2k2EtKuSFZQj3fTeV4eQF5VQFUFGn7oBTAPWtOb7eyUy/7TEDacUpTRI8=
X-Google-Smtp-Source: AGHT+IElXAn4b+IL3xsgEHvSG3QM1Kk+8D0xaIFMT3PV0VWDXtxm5CKTIVZwkG3JRlrv6fCi0nS/gQ==
X-Received: by 2002:a5d:4ac6:0:b0:37c:cd38:c51e with SMTP id ffacd0b85a97d-37cd5a83093mr7362768f8f.1.1727684738181;
        Mon, 30 Sep 2024 01:25:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:bdc6:abc9:5047:7828? ([2a01:e0a:982:cbb0:bdc6:abc9:5047:7828])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd5730fc6sm8384809f8f.76.2024.09.30.01.25.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 01:25:37 -0700 (PDT)
Message-ID: <0d0e0cb4-b2ff-49b4-9e07-5127680c2c60@linaro.org>
Date: Mon, 30 Sep 2024 10:25:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 8/9] arm64: dts: qcom: sm8650-mtp: remove status property
 from dispcc device tree node
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240924100602.3813725-1-vladimir.zapolskiy@linaro.org>
 <20240924100602.3813725-9-vladimir.zapolskiy@linaro.org>
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
In-Reply-To: <20240924100602.3813725-9-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/09/2024 12:06, Vladimir Zapolskiy wrote:
> After a change enabling display clock controller for all Qualcomm SM8650
> powered board by default there is no more need to set a status property
> of dispcc on SM8650-MTP board.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8650-mtp.dts | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> index c63822f5b127..0db2cb03f252 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> @@ -585,10 +585,6 @@ vreg_l7n_3p3: ldo7 {
>   	};
>   };
>   
> -&dispcc {
> -	status = "okay";
> -};
> -
>   &lpass_tlmm {
>   	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
>   		pins = "gpio21";

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

