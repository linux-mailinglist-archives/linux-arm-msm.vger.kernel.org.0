Return-Path: <linux-arm-msm+bounces-61543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F979ADC49A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 10:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E273161DAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 08:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E2229AB05;
	Tue, 17 Jun 2025 08:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ybOdJdyu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF62298996
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 08:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148430; cv=none; b=lCviZMjffK0ka3ag8O80wW7Q6ODDYKptgwrF0k1OJcleHZRot8V00OHSkoJarM5TImQPp/cvCcnRrViXighQnPrJrOPLx7+fto1Oz0KlSpchRypQlTksQLWXODEuL4y3OF3hqrqjQ5zszsmV2SuVFFHehX7VdbbRfEZ6Hom7LgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148430; c=relaxed/simple;
	bh=/WQbHnfRtWRIQdeI3JmHziVIp79qdv/zvvBmBI3l+1E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QiUc47twxtsG9EhFwO0QjVSYzwYIN6gq1MzjRh++n8HdjCgey9lqeqO4oQvHdH6w84/3B6G6V8rvh5ef2YArSlS3pdVFtUP1uXiOmtAo7ZLcTNJJtTZAn+Fn5FI9pNtBeCWy8N39L2i5eIwbczabGVrK+j5sDhQn2XPHu8sWV8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ybOdJdyu; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a361b8a664so5395847f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 01:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750148426; x=1750753226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rRutXZGiZkOK4IPQRRMmCzuE+5vrVS6DYaoEnbP08XU=;
        b=ybOdJdyuZMD2fRIELjfaJYkQEeC0b0FTf+KKPTGHTdoyvUCND82s8eqpVHuuBjVCUv
         Snj3dG3OWEgoeBdartElATKsUPQXauMXR6kc0Jxo+MYCX87Dp9mE6Y8+Ny+3Qz01kBVt
         /DrQ4BjdggovMVpISBWH4zwfwJMs8KLlMSUqx2MLpzsXhjNo/ncHxD2qWB4GyBWxcrCy
         TuIaQ2ffKh1LZM6sVOsvUdihln9EkgxddP/DZYS5AjLoLpk2WDQSaJXBSTV+tLmhDmhK
         tzbmQ9MBabQZeQBw0sB7bnYv8glIrB1Kvw///G9yO5r4FWD3L5EU42AItoq+7TjMZGP+
         wIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148426; x=1750753226;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rRutXZGiZkOK4IPQRRMmCzuE+5vrVS6DYaoEnbP08XU=;
        b=wjZljY/X7Or4EdDmVa+GsXHIE/ootGygXnI6hM2+zYeI5B3EmNg9Dzw8F7xz5529NH
         G4UhTtLNaFRXwPFb3x0q8SxORsVFNKPv3H4Xsg6h2puSdjP9JsS4yzjHEYhZ9XjsflFn
         3KzXetdwVvcfB61GRKUk59aVWY51b2Et50Ev6vs/QpXK8T5Z43Og0h6hgQOLs8s/ZnRG
         aN1BRy/yPxanVn2qepKqvwIa2I2sJGTVlavkiv4D1FY3VdsXisYiHAN5Fg0V5U0JfEuS
         VRYPMhE3qS7H+DVmDd3a+bPetO+61RhFfLzFX5FOYBoL+G6EXIDd2gs1S91clvntem2D
         pvnA==
X-Forwarded-Encrypted: i=1; AJvYcCUznT6yn3gkMNhWpA52tO1ZvlCdLJqzLhFr8D7Ih2d5h0CeD4iM81oM5sQQwEMvs1DNUKxmw1ZNovFLAkxf@vger.kernel.org
X-Gm-Message-State: AOJu0YyPG+IYCTiMrJuHyrW1Z78F+ZOmqS4A3zzLwoBZbxj2K4AQ/EbG
	gqg5uU/8QkvsxknBKzPSglubq/seEgHnpBKGPhZT/7HQhGC2iqxu4kMjlZJXnmHvp3w=
X-Gm-Gg: ASbGncsSgGwEsu1y02ELPlzuRoU8m541mTgJfj9Q7bluN3C/u3Qrdem3Q/JCcXrDmFE
	B5EUzN3AtQvz5un9wrGSv015S3fl38oO97n/+4i8Bl0kk4kRIvODRmYVFMqt+CsYY1X4cz/H+L4
	IYuNwhvh5uzbiOEbT4wlHwBSkB5v1xkGCANLACdT7GtYlq9e7CZgZm4Hg/IMTYqm9Xy62bhEhv1
	g/ElY7vgzv1LP7bfmAP0AC5B0zuvLRuYQ826N5kHCVEPGurAr6KT5pKZj38QCgBzi/zCGC/5lHl
	jo+ocv1NP7jegOgI54GmvOlY8iUTu8vXVib66vt1Qim+AUj0t2v8N7UR8wzDmJ5ren+mxWDRYuI
	arvxbUKEG5ji/XmH+Q/oDkRI7sW/27zttACGIbzZBKVP9y8nSNA==
X-Google-Smtp-Source: AGHT+IFEN/PY92LwnlT1UIgo+2I6xRqQ1JxYeqAwOpj11+y0e6KjDrQEgfFE+cFB2pOIqzh1vYyHiA==
X-Received: by 2002:a05:6000:2486:b0:3a5:52d4:5b39 with SMTP id ffacd0b85a97d-3a572398ea5mr10039548f8f.8.1750148426115;
        Tue, 17 Jun 2025 01:20:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3819:3250:4f73:db31? ([2a01:e0a:3d9:2080:3819:3250:4f73:db31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e268de2sm168241545e9.40.2025.06.17.01.20.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 01:20:25 -0700 (PDT)
Message-ID: <b56ae254-2b13-4a28-bd97-c815ee773abb@linaro.org>
Date: Tue, 17 Jun 2025 10:20:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] phy: qcom: m31-eusb2: fix match data santity check
To: Johan Hovold <johan+linaro@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Melody Olvera <melody.olvera@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250617080503.11262-1-johan+linaro@kernel.org>
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
In-Reply-To: <20250617080503.11262-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/06/2025 10:05, Johan Hovold wrote:
> The device_get_match_data() helper returns NULL if a new entry is ever
> added without corresponding match data.
> 
> Fixes: 9c8504861cc4 ("phy: qcom: Add M31 based eUSB2 PHY driver")
> Cc: Wesley Cheng <quic_wcheng@quicinc.com>
> Cc: Melody Olvera <melody.olvera@oss.qualcomm.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> index 9b987911fcdb..9ad7af503baa 100644
> --- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> @@ -252,7 +252,7 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	data = device_get_match_data(dev);
> -	if (IS_ERR(data))
> +	if (!data)
>   		return -EINVAL;
>   	phy->data = data;
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

