Return-Path: <linux-arm-msm+bounces-88691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B067DD17367
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:11:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5EB9F3008796
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 08:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8479E3793A0;
	Tue, 13 Jan 2026 08:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tLFG8wjL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C57E30FC03
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768291861; cv=none; b=tEn57gHv3SuC1TfkQsa7yOuCcWOVykC9xwVRUbf4zUuvEkZM6MJgE+PhKyT4pIahvc3uBBliNm2vB+T8vnRVjtYCOENHmd9Jcs48QrBbaGAS6gYD7qzfaWrLp5hTCaoKZ5qW9nuLILkBn+1nyUbzcvBzLtA7zG44NPeswejxp+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768291861; c=relaxed/simple;
	bh=awFrvdugpRSWBPPFDwN9LrXRF+GIj550SIcZ6bTMTWU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=m3n7WTESlxrIbtvG208zAW52d9bOQmUYT77XgYvLBezlmJUp2svGNsIpimDNlt2CxFsm44dl9WK/8YfLmd210JG3q69QJ1kAu229f0qyrhT2AXxFXfD7Xeh9jwqygZ93UBcKUNipg34XO3HsyV4wEn552d1L+WpSF+rnffOVjr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tLFG8wjL; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4775895d69cso35812965e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 00:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768291858; x=1768896658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bwW+ygfqdK5UYdKdlacSQmA5THvQFOrd2NY1OQuLwqQ=;
        b=tLFG8wjL2YlzdoFl2tKoBy7Yo7dmp1RGnGvbAjeyGDpDnLxen4nD/571v+ERd7zZU6
         AvGnS9BwCkFtCt3QNar4kP45SBZgD/bBj5eW/Dj9DsAzjpm3uRcmuqm7S3V7XeZ+SbnI
         7EWjZpUbk9T301xs/t6AlO53Q/k9LAqkrGLls6a0WgSZHYhBsd2tJuC/QV1uznsDb6uE
         D+jvXGs1CaHzOTcOKYrKui3zD5OnmbgemKh2rxWEm2UyHT6TBGoVPPwmfZEc430nTN2m
         fyzrgQ9RL3PJ7gAl3rWtb2/h7xbT7t8AG70y/4WGlEOiDsnwwbnKkzCHkzkgdiW5kQSH
         gzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768291858; x=1768896658;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bwW+ygfqdK5UYdKdlacSQmA5THvQFOrd2NY1OQuLwqQ=;
        b=iR9Mofq2oNwqdxtxhqhAv8YrORc3RCNaEfrmaeJTdNRMOxrptrtfRBvYZG18Cs4tV6
         pVslPIHwqyy+Ht+nFWoSogHkJ0Bj3k/YeIbF6Ni7HD4hWdMEUqcsy7rlLJZqeHdHt/Ng
         kJ/lEWqXDKgXAH+HDdHO7aCGxAXXefl4PkvPInYsCII1uWHJnIa0Wh0SUW87D8Na7WGS
         1NuC8O0498HCEgIfqZ4UGi3kHPjHVYzUgOI2reRbpRv6dCn5knCWjKflnRTUR/w0YdmG
         /MlYI7/gD+w+xnSnko4Dzh7vXBprs+nx8fuHrx1I7gJbsvkfI9dCJX4RjBgY3LukjAVu
         xnJw==
X-Forwarded-Encrypted: i=1; AJvYcCVLeBg9m5Sk68LA9zJz2ADZzkH0SOmeO6mqRZLkwzBA7SskPlDm+S8nmDjHpUHXUs4ZavfDyKcZ6Xma3deJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg6Yb1zMbT1SsFwmjaq3jW663iMHQpgr2t7Utd8gCQmr7aJoIO
	R2ac9yvhFzKQ2Xm3uYGem30WSyq7or0fInh96aDe8pud9TKDD4t7YsX5qfUfSRUvbag=
X-Gm-Gg: AY/fxX7Ce/Acpu1vfd1twxKdouW9xRp8hnBU+V4OInw+31am4m89HCY2/pPQeyAIubY
	SEIAATirJX9jmGcmr6JxUF+vXQS9gV6i5BZqaHxk7xBQEXGQWHvyFIEfL7res+uOnHmL/fI1Yc8
	tCDnoPChZgDEmVJ6POHeR0eQQpwyRkVwXY2y8PDLJVeQAa7Fhytg9d9wN3sWq4TNqXo/Kgkouef
	er7sKMeY4pQNoTv2U6fRL42TnpQvZeE+9u174Jm8wNUHJbWGrzGFRodi6k5UxGjsnWgVhWVeEon
	L+gmf0oQAwaVSKgbq7lMwnSjKpBQn+Ne+rDW1P3QjdBaNmZcrTqp82f1DdSzbUuWXy5a97B7bDD
	KtaxJjNfeEh/8nLb0pxeldeWk+Co0hg2whA02Vh1PV1zKQalArXvMNV2/yreY7rV2lFoGZfpoqx
	KhkZRZFL2AwkfjAHu4YmidhduBrfTm3CwERh5rY/g=
X-Google-Smtp-Source: AGHT+IHVubdkYVXRdCYANXMR0ISA+TInCn3bu5ON04/WkSf5bxAVISHMRL30pKlB6Nx3R6Ym8XxdTQ==
X-Received: by 2002:a05:600c:3484:b0:479:2a0b:180d with SMTP id 5b1f17b1804b1-47d84b20fd7mr244456025e9.11.1768291858442;
        Tue, 13 Jan 2026 00:10:58 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080::fa42:7768? ([2a01:e0a:3d9:2080::fa42:7768])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47edc05b267sm16025705e9.15.2026.01.13.00.10.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 00:10:57 -0800 (PST)
Message-ID: <2d07b633-becc-4b79-adfa-932ae2847671@linaro.org>
Date: Tue, 13 Jan 2026 09:10:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] phy: qcom: edp: Fix NULL pointer dereference for phy
 v6 (x1e80100)
To: Val Packett <val@packett.cool>, Vinod Koul <vkoul@kernel.org>,
 Abel Vesa <abelvesa@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260111083317.604754-1-val@packett.cool>
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
In-Reply-To: <20260111083317.604754-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/11/26 09:25, Val Packett wrote:
> For Glymur SoC support, the com_clk_fwd_cfg callback was added, and a
> stub implementation was added for the v4 of the hardware. However it
> was omitted for the v6, causing a NULL pointer dereference oops on
> Hamoa/Purwa (X1E/X1P) SoC devices. Fix by adding the appropriate stub.
> 
> Fixes: add66a6673bc ("phy: qcom: edp: Add Glymur platform support")
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> v2: pull R-b, reuse v4 function as suggested by Konrad
> v1: https://lore.kernel.org/all/20260109045214.5983-1-val@packett.cool/
> 
>   drivers/phy/qualcomm/phy-qcom-edp.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index 13feab99feec..7372de05a0b8 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -758,6 +758,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
>   	.com_power_on		= qcom_edp_phy_power_on_v6,
>   	.com_resetsm_cntrl	= qcom_edp_phy_com_resetsm_cntrl_v6,
>   	.com_bias_en_clkbuflr	= qcom_edp_com_bias_en_clkbuflr_v6,
> +	.com_clk_fwd_cfg	= qcom_edp_com_clk_fwd_cfg_v4,
>   	.com_configure_pll	= qcom_edp_com_configure_pll_v6,
>   	.com_configure_ssc	= qcom_edp_com_configure_ssc_v6,
>   };

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

