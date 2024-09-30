Return-Path: <linux-arm-msm+bounces-32745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5571989CBB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 10:25:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60D481F22066
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 08:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 576AB4204B;
	Mon, 30 Sep 2024 08:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CKfgMaEG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C55175D25
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Sep 2024 08:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727684748; cv=none; b=qCtcExA08hONB3JfZURqafAICbZzU0mpaGmLlHJewE5GEL8S5oG4bkUuI5RZw8WBUvfOh0DylPedHq4QQmXfNlT19KWqZSHrecXdF87iKipnOHL5vfDf5lyEUV9XbkE9t9bQIU6Q0TL+xT4Wsp5hvyIXoluC3Ds1p4SBX9+dlpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727684748; c=relaxed/simple;
	bh=zsiP00ciwymr6Mqfn1SwKJ+phDk3RX0XvS24n2F0VnQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tdtqE469G+/qLl2dg2qd8zlkHwbt6aUq5GY5EUEHLDBDZAux471TUhLit95cK9FCQ+94KhJgtdSFp7+CluP/Ek65+KZmZktDhqBOYK8XSw9DaftY6SYZFIj37jB2B6y46XrtqtDN35wKAVl6r4YTkITjlrPWG5J8bq3UBuxFgFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CKfgMaEG; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37ce9644daaso550968f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Sep 2024 01:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727684745; x=1728289545; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1IWqcxTSUN/vBgbDaR32JO30SbzeonXFdKWKi6BQRCI=;
        b=CKfgMaEG+Yzsrac5JfMpq337Fc9jeiwdU1T30YUsp8QRLj+2jfj/PmDbFSKiJZKQp2
         6Dn/Lh+I+NdcLFxHoRWnmaT3sFgqtRiOswgGNfUHRxpSA+OT6XANnDRiZedMpYaZT2oK
         rm3sYqQKLSXXnEjxPwQCqfU0BX+J5wzb1ONArhljBsRxsjHw+I0BOJQXOuWyRxwtJ/Ee
         jNW9Q9+U86VWeuRrzjm2rLj56oykcykQN+oTro715zeP5cIln36tT3DoszMJReOT/8Bi
         +XeWt7OzxITaFtzota7pMTXWE8MAZebA1FJHe7//N03xDqbXmjM7VCi8C18hYR5uRxC5
         bcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727684745; x=1728289545;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1IWqcxTSUN/vBgbDaR32JO30SbzeonXFdKWKi6BQRCI=;
        b=iH1b6ooMssOkq/XACUiwhzjSY5irdK3ni/zu5A5kZaTLBQtUt9XM3fqd8wugSs+mhe
         rh29p+effEJjm3bZhPyDjzTPDEjDndfVcXbKC4fuRLieUF/9Sfhe0+vcp1Cuf8WduOzV
         U3e6Z6mGtjKQ+jVkp3LOnNqAWmXImDJKZKUxmTxH78sWFOOGT/bFdefPWOV0A/z/wOS1
         wyiJGKOZrBKk5S18kpUhyv78y3vFYAmIiled7VwxTLZMmaMpOJVJ35G3GvDqI0BDUjI2
         krZtrZ45UR50cBaVhODId1bOpTDVKlyn3MNf1o9AETE5AGJ2nwe7PP7nlQFzMNw2t6Aj
         ATDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4mp3Exr9d2zxUxyJMC0lKZixIVy2DHWCsAeyLnv1iSAhUd+5SWltnxhq0dLdmFPo4cvjgUSfRzu/fStO9@vger.kernel.org
X-Gm-Message-State: AOJu0YyHTQ/te7lL/TDNK8npVzeCdkeCCi+prZCx7Ktv+t/ztQrB8O/k
	t0zFk5zeFFZ25N6XZ8g8sVpmRCKcKEBlrijlNDlIemB/Tx9jiJXolm/tPclJ9Pc=
X-Google-Smtp-Source: AGHT+IFBn+s4YIPH5qH0fLfLhJ1YX7Gx/TD7UutN5ndNwz/BcsR4cyINziFxXLSPa+R68oEZh5okJA==
X-Received: by 2002:a5d:5145:0:b0:37c:ccc1:17d2 with SMTP id ffacd0b85a97d-37cd5a9d0b6mr5845985f8f.34.1727684744261;
        Mon, 30 Sep 2024 01:25:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:bdc6:abc9:5047:7828? ([2a01:e0a:982:cbb0:bdc6:abc9:5047:7828])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd5730fc6sm8384809f8f.76.2024.09.30.01.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 01:25:43 -0700 (PDT)
Message-ID: <8cd58a86-6cea-43e4-8491-0830f5f0e0d7@linaro.org>
Date: Mon, 30 Sep 2024 10:25:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 9/9] arm64: dts: qcom: sm8650-qrd: remove status property
 from dispcc device tree node
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240924100602.3813725-1-vladimir.zapolskiy@linaro.org>
 <20240924100602.3813725-10-vladimir.zapolskiy@linaro.org>
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
In-Reply-To: <20240924100602.3813725-10-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/09/2024 12:06, Vladimir Zapolskiy wrote:
> After a change enabling display clock controller for all Qualcomm SM8650
> powered board by default there is no more need to set a status property
> of dispcc on SM8650-QRD board.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> index 8ca0d28eba9b..c5e8c3c2df91 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> @@ -741,10 +741,6 @@ vreg_l7n_3p3: ldo7 {
>   	};
>   };
>   
> -&dispcc {
> -	status = "okay";
> -};
> -
>   &gpi_dma1 {
>   	status = "okay";
>   };

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

