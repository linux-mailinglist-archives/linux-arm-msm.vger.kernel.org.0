Return-Path: <linux-arm-msm+bounces-62405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B7BAE7EA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 12:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F3E0170414
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 10:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012652BD028;
	Wed, 25 Jun 2025 10:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XUJ8xRxC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACAC2BCF75
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 10:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750846135; cv=none; b=flDoWJSUsCMG4IdFXNaODGysKf/AHsmMLcpM47EL6Jj8IsJnfHClZ5IgP2bV88vhjXGjzzRY5tcTE35I23mZf5jjXyJ3fxCIhFs9PvtiF4um5LfJ1jxf971DjGoGTZxOe1U8nORD3BAKldmGmgaXn6L0f9Ex+QpAjkRwOF1cv5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750846135; c=relaxed/simple;
	bh=mibwjvXWkICAj+vwkb1PpjhKmioX5JKsmZ6lo8UyaBs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UQsDgnvLwI9NIeRbtgbHDFY7PhQbxMsuHZzf79mQ3AWw/VZbQsgvDH6BSkDDjrqfZbhzMdHBRsTVuXfRNrIBPcjTNagT+OXOSSoGUMnLPPE/aaNYu3AyKRQpiQXepA9t/ckq21SX1yeLbliq2+kpwqtOgEJflqi2oMZDjK1n/EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XUJ8xRxC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451d3f72391so57005695e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 03:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750846132; x=1751450932; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J2a8kk6PcZkE03rGmBEJWejxQtEjJ7yXfgEnoE7M2mA=;
        b=XUJ8xRxCTAvOqsfssmT7WH+ikFnFRqDhsSZsQmbGiDkNl3rJkLU4VZ7dPHhZmkA7NV
         Ma0URgGv+6/HueM7M302frj3Li2nKOqrP2gds512MyhdWnbNCO4aEDolTA4HdxzYIfNq
         09OJ27d/AiJ/Dd/UOKx5xB6e/SuNeHfE1w0/ChIx6ojIGvm/eu26sCe5HJWb9tlW5XqZ
         toguA6D9Zq9GG4hS0a0qLLfs9yqWH7Nw1q5ijtHdO/QRiAiRGzQ1ebBQczMBLGc4GUT3
         nqL5TiSujTRleoZcA4UOcz+glKIBH/8xY6S4PhUTLbEWGdWmZcBlDksGcDhIIWrgQELD
         znsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750846132; x=1751450932;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J2a8kk6PcZkE03rGmBEJWejxQtEjJ7yXfgEnoE7M2mA=;
        b=sQxF22pEFZjBcf+0uaFEJBE7h+Q5bSw3crAH1tgwR1bqTfb0ffK66mGMUWj/1zR9r/
         iBxMEQKNhWIvho/tmWLWhjUni/OMGQRStyAm5fKSD+6lY7bOroCvpcbEDDYzX8hV4LbU
         x9TRgtgCLZnvwMoHJ0o3OHCx95XVZaF8LJA6ihHebaIF4BIhPBg0xr7IXmwvU2Y75oqS
         OgJqEgC9k3dOll4gKB6QBWtelsMR8QLSeimk93ZlkJzpv+9lvQB5yloZ/zqFGrw7pCcC
         gbzwKjr66h3XYz5efwYLTOcOvsVt3l673V0/tyNAo7PjkoaoHK8g3OC/hjkyLj3zTtQc
         XV/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjMzu5RbXU8LQp7Z3RYjTUiqKxIhNxm6lRnDWG/g6wYp26NNP7E1LOFwdS6kLRE32tR6YIzAdUWu/ThcKb@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr+XQB5oyS/8DrbI+tftlDt+dBEBFBxiR71zwLNWUAuMcK6Vg0
	q0yq0zS4KApdJY3hHhsCkZz1+Cq/aue84FmNZQKhKlBYbOLgPgJG/OgXBBmSweMKvng=
X-Gm-Gg: ASbGnctRd5+M/xStD8TDHblQnL60IFPAaew3LaOS9npw7osar6lBzJV2WEoxM7aXSet
	DYjCqkwtLT9Xf1GLrHCqhGispVPfSe1d3/T76EKcqhlSVQ3PFQRkWc+G7weNFJmPx/XCbxFYVRo
	CP3JqEcBQeI12788eB6mw29CVU0lowsVqoW99UgK7hgHRRpB61FYSQ1X8QwlOJf2gkVT5lJUO3T
	1TQnjiJ7odrykYTBVL2qCv7yYkJxwZi0tkHjrBiJg1TaS78nA+rjMoIg4huya3vVtwn3tiyDazl
	w6Xs+yfshbCRoIi+gv8Lj8JNdEwMUta0Jktoog+WBXQS8IBvTa8ByTBwn95LZOYpI8vaBhaUKF3
	m/cGUqnMwKVsNYtQPYE2YS8rmYt1Xcm7jigiz
X-Google-Smtp-Source: AGHT+IFJiC0S9QOgaQ2ScQ4U+1EQS39LaD4dPukyAK+89YpzNHu/8nXo31VXa8/vKLOYfbh15deE2A==
X-Received: by 2002:a05:600c:154e:b0:44a:b478:1387 with SMTP id 5b1f17b1804b1-45381ae3576mr25646825e9.17.1750846132470;
        Wed, 25 Jun 2025 03:08:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b3df:bee7:215:e1a4? ([2a01:e0a:3d9:2080:b3df:bee7:215:e1a4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8068fd0sm4309576f8f.38.2025.06.25.03.08.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 03:08:52 -0700 (PDT)
Message-ID: <d923b289-1e4b-4c7c-9bec-7d0c2cbf8b86@linaro.org>
Date: Wed, 25 Jun 2025 12:08:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/4] phy: qualcomm: phy-qcom-eusb2-repeater: Support
 tune-res-fsdif prop
To: Luca Weiss <luca.weiss@fairphone.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
 <20250625-sm7635-eusb-repeater-v1-2-19d85541eb4c@fairphone.com>
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
In-Reply-To: <20250625-sm7635-eusb-repeater-v1-2-19d85541eb4c@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/06/2025 11:14, Luca Weiss wrote:
> Support reading the FS Differential TX Output Resistance Tuning from
> devicetree and writing the register, as required on some boards.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
> index d7493c2294ef23e37e484019a49ddf7b3d6a6a46..61594739e5b12706775622e1f76af6ad5d2d29bf 100644
> --- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
> +++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
> @@ -136,6 +136,9 @@ static int eusb2_repeater_init(struct phy *phy)
>   	if (!of_property_read_u8(np, "qcom,tune-usb2-preem", &val))
>   		regmap_write(regmap, base + EUSB2_TUNE_IUSB2, val);
>   
> +	if (!of_property_read_u8(np, "qcom,tune-res-fsdif", &val))
> +		regmap_write(regmap, base + EUSB2_TUNE_RES_FSDIF, val);
> +
>   	/* Wait for status OK */
>   	ret = regmap_read_poll_timeout(regmap, base + EUSB2_RPTR_STATUS, poll_val,
>   				       poll_val & RPTR_OK, 10, 5);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

