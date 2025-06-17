Return-Path: <linux-arm-msm+bounces-61542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB31ADC484
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 10:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51B181888C78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 08:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F68E29290A;
	Tue, 17 Jun 2025 08:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hwL1srMU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAF2290BC8
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 08:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148415; cv=none; b=ixgKeUIBwk9T5UW7h7Qwbeb2hcxGZgDLixoMZz2YS6l1DvmDX0Rcy19604cT+WiDoKeqArrF7hhxXtXX1k/t/QJooIQvxJRp0tRn+GjW3S3/SXhWDIEhNq0UR7wddmx5Rt53/eC5cbooGRlyKC4bEKhatX8wGfxIjwMYPw4hums=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148415; c=relaxed/simple;
	bh=jfrHVPVwZuVj1ovd2L+ozV8XNY7vboPGx71pXYGp+TE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZCGNSrb1tSwnYSB6oOUmFV1Bga33EbYQ42RDaMfKUfODdVEkSzbUj2ZNXvDU98z7EBVEKNOos4Q2Gs62k7OkTQiMARWQsj41AA/cDz+8e3fYX6u7fApEvkMHk/bIqHinp3AJd1Cw7vaCRueGARE8k6rFqTKtn7WqS6I8mCIiOBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hwL1srMU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so46165625e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 01:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750148411; x=1750753211; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GkVwaOohG3MfzfFBPLux7z0WS8bc7+WHf5B4x4aLoAA=;
        b=hwL1srMU3nIlX/K8x/ohh4W1FK8euRKXX93tmOxstYXEJ7O8WSFzAKxvxJxeCGDlm0
         2O/yBJRoTWTD+i55gEamkltkC1xscL8flDY9RLXf0ZX2UtJ++eluq9dxAQiFkfesvWTM
         XrLAf8gbYrIesZb0VvP33htDxHeQRIl2X/0AI+AGFqqLXFw89lillnGrqLAB7GkibOUq
         Q8TLgQMNflSmlpR4HtbeQQxuj/dvUKfdG6PszZNM9OoN3ErJXZO5XlZFQOiP/75Pu9Jf
         GCveWDb7l4VjJF/xgO5fLKzUx5PWx+4OQAV/MjQqy1QcRDUNwZ8QEN+I0fccRONNGLGo
         lFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148411; x=1750753211;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GkVwaOohG3MfzfFBPLux7z0WS8bc7+WHf5B4x4aLoAA=;
        b=EndCVFZ9vBTX5WK2ZKluvGKHtnazgHRCSHwUxhqRTm32gmhbeXkHBWFysh1bNJvvxa
         yKlSmao9+pClLEYkmF0bcLQsGZA6jly001m6duHfYG1DYxJuuB50JI9eKDA2822fEzZ7
         QwDWgNPpA2forr3rrtNteWNW/3FWkk9djc8ADgcmEKrLvDk63IheZdht+HmT4PgEeH+W
         WPZHA6rJ6hL6UGV0VKCp9acC2YmTtZHS+mWFb1Alg4KTPWr1EcxqIH2wZ6wMp+NE9Qil
         OMr7nQdTezuoSDhK+FDgy3gYa7OMTyI4djkSfHwfp4acAWe7m2Zwl2P1bOxXHGUjfCfr
         oA/g==
X-Forwarded-Encrypted: i=1; AJvYcCVmZLn0CI1w7x06y99dba6pq8kCwqoobD5HnjvztDzDwe1P5y0S6ZP5Ql4Y9ch5UNjaF0N6hfwmwnj+4YGB@vger.kernel.org
X-Gm-Message-State: AOJu0YzWf20j1vQxhPKlM7w0CZS+eDHHpUC2zuyQhqa9eI6pSFvDbNi6
	kgimEbvBx8uv4pzOVaxDDkn7yAu6ghQqtNPNHJ+SekT2YNBsSebU936KuIlSAr9oAgc=
X-Gm-Gg: ASbGncsXc/SVWcJ2wtfICerkJgyaX6CcUf0GqrK+sP2usn6Hapu8HOR5LuBcjLuSvmB
	N3RlknZLe2LJuQBiw7ka/6WwEfxDFaE5xUZfIM2EhCpK2cgEaBsusAt9hI5fyJ1ghdNfNE7xuGO
	5xSHs608vnClciNSWyh5TD/wdPbpXrXPNbWrzuRXppSdFCJzKi+Afqj0F/x2ShimMbBfFj0Qm2O
	6Jsy7eTOu5DNmOAF72ZrgrIHAf+cybdHPAwoq9KcPLOhQZxyC5s7lVXb23IFZtUUIM8tmJkAoi1
	/xIkemzrLhKkBD31PX8YPIVcAcwuRTUlTCNVwBnIE6Xt3XSBoy9RzfubxB2IUDiDHKsqws/fywy
	F0UvgLNw54zveMpuTfYia+A4U/zmp9MkqAJP+r5c=
X-Google-Smtp-Source: AGHT+IEyBF145eH2dJ1PxI0G9a7I/RUJi+8WJK1aUMpDYBQovwrNcHxPiIYgLUElIHbiSAdNqIPEuw==
X-Received: by 2002:a05:6000:40cb:b0:3a5:2fe2:c9e1 with SMTP id ffacd0b85a97d-3a572e8243dmr8394556f8f.30.1750148410854;
        Tue, 17 Jun 2025 01:20:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3819:3250:4f73:db31? ([2a01:e0a:3d9:2080:3819:3250:4f73:db31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b74313sm13346954f8f.96.2025.06.17.01.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 01:20:10 -0700 (PDT)
Message-ID: <5aa6d6ee-0af5-4625-a616-868919ac36c7@linaro.org>
Date: Tue, 17 Jun 2025 10:20:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] phy: qcom: m31-eusb2: drop registration printk
To: Johan Hovold <johan+linaro@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Melody Olvera <melody.olvera@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250617080401.11147-1-johan+linaro@kernel.org>
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
In-Reply-To: <20250617080401.11147-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/06/2025 10:04, Johan Hovold wrote:
> Drivers should generally be quiet on successful probe so drop the
> registration printk from the recently added M31 EUSB2 driver.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> index 9f02b8a78f6e..9b987911fcdb 100644
> --- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> @@ -288,8 +288,6 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
>   				     "failed to get repeater\n");
>   
>   	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> -	if (!IS_ERR(phy_provider))
> -		dev_info(dev, "Registered M31 USB phy\n");
>   
>   	return PTR_ERR_OR_ZERO(phy_provider);
>   }

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

