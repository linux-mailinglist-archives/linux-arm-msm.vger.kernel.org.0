Return-Path: <linux-arm-msm+bounces-54744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1FEA937C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 15:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA21C920F12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 13:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84D32C1A2;
	Fri, 18 Apr 2025 13:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I6DFeu4h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1640277003
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 13:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982407; cv=none; b=iy3Wr4n8se6UkIiE1Z4E3+KYAhcaLlRW+8ZI7TMgKbhUO+T4O/oLLaAn00q7PKdINpfBAWz1aa4cd0U0lD2vxXN845f88U6e3t3vPYpDyJWsxjSkvEbR8jpWegl11Ie/MarwPAwGUjWmFi1ZQ8oGZsmC0smiqKP3AvQEda8VIzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982407; c=relaxed/simple;
	bh=s6Ia6RSb0Elq1vaJp1Ehd0f9LVCYZBSpwsULWrlRZkU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=TbX8ScXFTViZEgARaS/ijyx01TF5CJsSXSjNTuxAEAv7lg6lSemDJ1ON00JfNih8WJkgFCdGgHJSWiDvI95EugwED92GGeny+J8nIneuVGaIOdFESi6ZKGclQZdwBgIfdJIm83pu8X8ycFurAD957VZIASQcdmjDWIH4CcRO/iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I6DFeu4h; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso1216248f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 06:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744982404; x=1745587204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6XC9anR+EppVKz2oYrkC737vBTrWrKDb8IXLSeYmgZw=;
        b=I6DFeu4hc/7M2idgmu/7/xBiN7H7ZZhn4jWNFYLWuxqJK+JXA2ti7iVwFcHa4qWhXd
         Re9vmooRpzk2RbCNZZnCZEffvYvhB0Uizare5/REk/r4ggG/CYTdaYl3mARcguMjJiPl
         DcE2VA5WD1Y+RuuBbW/x9q/P5/9lRXxE7OjZGAotd8/cCDQrZMHDvcE8dzSaOB7WzYy/
         4hM/R5b3X1fwhkYAYwHJVQ8R52GgndqIrjutM7h09xpyMel4Iog71gCNrOzZGpKRvsRC
         Zjt2/HxmZDgrG5upkzpQpk2QQMRqS3c2Nsb/9fgfMTFHoYYnccJtbPlKHwm39qKr0S21
         ag9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982404; x=1745587204;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6XC9anR+EppVKz2oYrkC737vBTrWrKDb8IXLSeYmgZw=;
        b=seRsTfQvKoHKQ1tKbp5sw243vRANtyWItYILAnJkgOJOF8p7L2xj465CLYdgIqJvgF
         BzTqjK2NIgEgrttjaqxQ0GDYpYoc/H/C+jSLXqcx4BSfO8oow9aH6Ow7zG0o+WTdNzsm
         NLpiaNr+b0DSWYlinzpJxq+XmR5se5TDRSJjyRNTG5ZNbKwTx52HxlLk70WjCw9cwD2v
         m1d6tv6xsYYHmLUfen9GlsNcvoE4ER49r0gEMOrqDuB0Q10QyiNXqQFtJePkjpXei1bb
         OZ8Kw7AwF8g9gEFamCqlj4+HZQ6iYy6i0Q+4Z3iCSlIaDa8oqnaNUn445CKjofpU0RyL
         i+Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUjXzObHOZ3dmgCj+mA+4zHuZZKpjgdssJHyylpyl7kdwCsVcX09FQWkklMc0Qij61E7D8j3vbZmBiGnoWM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz03dLwpVK7qhOkbXZC6sObet02Lbbzyjy33O5BvNLLtJJPKBhg
	DEU6fTdRhE+WLutvv5grPK36KAf/cDGnNK1FRtdB1cHuifuXNTsUdD7jfNBQvcI=
X-Gm-Gg: ASbGnctHI2CRa8YGuyZHhcSKFe7g70+iUwtU+TEfm0W3qkYEjNXcal+mun9RDFzKSQL
	SIghwwharPqaq/wAEm9EuMNr6/8nrHLvDqw1B6Uq1shUXGniBQaXVogbxPpK+BnLlgUzT/IGKu3
	N9sog0RenTivr8ExajBzvJg3a+X8aNUWfPW+wrTgcv/wPbwxIWHdoEOvjXdOane5GXzCpB2PTbK
	G8GLw6srwtmaxtNTxicFSrN+/vINreAxPVAJt/IsEGcTzpZzUquCD/Gn3aN/qr4eU+r2pNga+ay
	CdX9ZisKEMpDCFyuG65yOhJUnDaFUt2k+7bWht53QuhicFxUKN80zSqrCOgsCTId0ucQBe+9RzA
	Yew4qDT0mnn1Jz1KUmw==
X-Google-Smtp-Source: AGHT+IF3uK667SVfv4+jbLcCeN0nVt7EwHp6wzo6T+HAoP9oQoubIvGQlcSYsJrbzUTkPVBGi91MQQ==
X-Received: by 2002:a05:6000:2211:b0:391:3157:7717 with SMTP id ffacd0b85a97d-39efba856afmr1953193f8f.34.1744982403987;
        Fri, 18 Apr 2025 06:20:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f8ba:7c24:7066:d010? ([2a01:e0a:3d9:2080:f8ba:7c24:7066:d010])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4931acsm2759272f8f.72.2025.04.18.06.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 06:20:03 -0700 (PDT)
Message-ID: <c8094f0d-f0b3-46c1-93a3-4ad8c39d8a23@linaro.org>
Date: Fri, 18 Apr 2025 15:20:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/5] ASoC: qcom: sm8250: set card driver name from
 match data
To: Luca Weiss <luca.weiss@fairphone.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
 <20250418-fp5-dp-sound-v2-2-05d65f084b05@fairphone.com>
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
In-Reply-To: <20250418-fp5-dp-sound-v2-2-05d65f084b05@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/04/2025 15:13, Luca Weiss wrote:
> Sound machine drivers for Qualcomm SoCs can be reused across multiple
> SoCs. But user space ALSA UCM files depend on the card driver name which
> should be set per board/SoC.
> 
> Allow such customization by using driver match data as sound card driver
> name.
> 
> Also while we're already touching these lines, sort the compatibles
> alphabetically.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   sound/soc/qcom/sm8250.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index b70b2a5031dfbf69024666f8a1049c263efcde0a..e920b413b762c803cfcc4049f35deba828275478 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -16,7 +16,6 @@
>   #include "usb_offload_utils.h"
>   #include "sdw.h"
>   
> -#define DRIVER_NAME		"sm8250"
>   #define MI2S_BCLK_RATE		1536000
>   
>   struct sm8250_snd_data {
> @@ -200,15 +199,15 @@ static int sm8250_platform_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> -	card->driver_name = DRIVER_NAME;
> +	card->driver_name = of_device_get_match_data(dev);
>   	sm8250_add_be_ops(card);
>   	return devm_snd_soc_register_card(dev, card);
>   }
>   
>   static const struct of_device_id snd_sm8250_dt_match[] = {
> -	{.compatible = "qcom,sm8250-sndcard"},
> -	{.compatible = "qcom,qrb4210-rb2-sndcard"},
> -	{.compatible = "qcom,qrb5165-rb5-sndcard"},
> +	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm8250" },
> +	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
> +	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
>   	{}
>   };
>   
> 

Thanks :-)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

