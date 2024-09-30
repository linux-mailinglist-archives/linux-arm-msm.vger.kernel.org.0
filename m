Return-Path: <linux-arm-msm+bounces-32742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8313D989CB5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 10:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A47B51C219D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 08:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD970176AC5;
	Mon, 30 Sep 2024 08:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hjDw2DZd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0326F175D25
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Sep 2024 08:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727684725; cv=none; b=XOtsq3ZpAqtG842e/SiZkuHQQmkU+dQWNqVzx36ERtsSHQVftES38xzZlPfa/nTry7s1OPEEf5a1Y7zjQni5NTiSRlgoTai3z5C3b/k7x8q3h11EAzwg5qM/D/rDIPHL8dfN9Ag0EN5MvLuhmDRZbPn5AeG119tdA8BhAxYndKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727684725; c=relaxed/simple;
	bh=Y/RNunii3rVQV3VQX2yQ/2zYfpCv1APHMsLjJulVUjU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MTYT6fkWLYiwclQhGB0KjsJDachq2YRQTA0vWnXphbI+FnhTR6JX7XtAUYDdfu13+R1b77mcDwczHbJGwF67Mj1pKno37822yXn0XYdz7mmDY0mYLrCniKzutBfnqq+8F69oaWplH/n7rEtnD/udtBOleh3Mn25OePdy0LGu9HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hjDw2DZd; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cb6f3a5bcso50626915e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Sep 2024 01:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727684722; x=1728289522; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNSe7nHDNsF6xHuvZzvlBgr2nivSlxfJNTEMlMt3xn4=;
        b=hjDw2DZdizhbGP+lJIf+Lzd8sHmyqagj0LFMmfnmbT98Fe5y3QLcwz4jTElaXheNC4
         5r2dw2i6SO7GVRrcA9SiRmmnfumfG/E1XwldbKwTwK8NkeX3KJG6xwaGscbAb8gu8OND
         pXvCvo4q71cR4gcmHpUBZsoYTNaOdBlyJ5x+RvuR/YYZ2f7Xe8pHASpGnw6KZuP8iJtD
         TTJMRCC1/A/GBTfTp0Y4ownjmh22ShFzRsZX0lmy+TQ3sQShpHHM7bRBZXatXwggk7mJ
         pP7b/P0VgqG8Rl+VCuTdjPCPUlBjeXQyYEYhqc1SJDQSerCyhSQpUeZ/9rNwCJk306B+
         5YWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727684722; x=1728289522;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SNSe7nHDNsF6xHuvZzvlBgr2nivSlxfJNTEMlMt3xn4=;
        b=EqdmCOAEZ9WxGHyco5j0hcnVD0zRxycK343IaUjA6xxonmUIe1h5ZTchTw9sVlPnI2
         is51L4MSxpPbQLT6LkI2soYmkIzvVzcZNaJeXl8m//8KUQ9i7n9w44Y634VkIzMybepk
         UfjAksqXEgldmUdf3nNQm44mX25bz8ZUPlC6H+ZtyRrteghG9cZg17D9CwIlh2C7hmcu
         om4Gwkg69hTnW+8ZRN4t4Y2Qspz9B2v9xjfuKae7arQT8gc939DbC8C+JTD8/r3VF9r2
         MaRwKhZuLjeLcRI4xpeGX+HYuo2AGUlIk7yYXI+en537CV4kevUJncA5zYUP8ZAWJtOd
         HllQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKJs/pgY+vZftkxOnbWpfcDOQaTUANQOjmyrsHy248seTWSYEgTpu13KC3HUhxXX0fFyxqSv2Xz6/0R45u@vger.kernel.org
X-Gm-Message-State: AOJu0YxF2TnvCtAizs9B+yIuojrbfkeRpwKllBnZCpdg8D1bxUoajtp0
	gSaLXBvnwFsrLk21xfp7tp+HQGVTXq9VIpRNOWpJxNrDX4LsDa+E+IiTPwRN++U=
X-Google-Smtp-Source: AGHT+IGeOQmG5BUJ5/CrxgSLI45tVnOmcna0w9dgnQQb/rmXiDOTIUb9z2UIg/A92H04utV8bcIlUQ==
X-Received: by 2002:a05:600c:511a:b0:42c:b995:20db with SMTP id 5b1f17b1804b1-42f5840dd5bmr117362445e9.5.1727684722253;
        Mon, 30 Sep 2024 01:25:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:bdc6:abc9:5047:7828? ([2a01:e0a:982:cbb0:bdc6:abc9:5047:7828])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57e30621sm96602665e9.47.2024.09.30.01.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 01:25:21 -0700 (PDT)
Message-ID: <03b3f923-bf45-49a9-8c44-cad8865e2175@linaro.org>
Date: Mon, 30 Sep 2024 10:25:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 6/9] arm64: dts: qcom: sm8650: don't disable dispcc by
 default
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240924100602.3813725-1-vladimir.zapolskiy@linaro.org>
 <20240924100602.3813725-7-vladimir.zapolskiy@linaro.org>
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
In-Reply-To: <20240924100602.3813725-7-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/09/2024 12:05, Vladimir Zapolskiy wrote:
> Enable display clock controller for all Qualcomm SM8650 powered boards
> by default.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 01ac3769ffa6..173e092b15e2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -3841,8 +3841,6 @@ dispcc: clock-controller@af00000 {
>   			#clock-cells = <1>;
>   			#reset-cells = <1>;
>   			#power-domain-cells = <1>;
> -
> -			status = "disabled";
>   		};
>   
>   		usb_1_hsphy: phy@88e3000 {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

