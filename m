Return-Path: <linux-arm-msm+bounces-18796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B36F8B591B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 14:53:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7449281888
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 12:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9FDD6A359;
	Mon, 29 Apr 2024 12:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OL5HXIwx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0241C548F3
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 12:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714395059; cv=none; b=HmUDAcdkCOzaz+mzhS/yS8nXwVY7mqqXoJWQtkAnnfjrqBAC9GSkFRwBEWbwYhFLysMfbVM3U5w1JQHPmTlfLDWJmgjUWz9JGPefYYpf9S9wkqvwlRCYGAmudTM7Res3UmAyQziie9iHqx62krZoB0OxYvWgfvdW6NABw/nai2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714395059; c=relaxed/simple;
	bh=Q/n8MfFKrWNP33DkOJ6Xv++diH3GrJ11n9LhjBaX2wg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MELebCCmJypdfV3KSjzR2inHjHPqL6XUzIsu/2dVnhahf5x0nm8PtwuJA7bnYgoQBNRjwplab9uxXfBJDiq5juUB+AhvA2KyvjzK8iEPWPJNVeQaLni8yMNEFo2S75mhCecDUVbQzqGDcHQZHNxDMfQefAo5cl/EL9x1zLumUYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OL5HXIwx; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-349545c3eb8so3027959f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 05:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714395056; x=1714999856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AA8Wnhnd2h9AIkFPnW/qgu9YDhSqFrPxytoNRCePneg=;
        b=OL5HXIwxUCFg8xnUnMQu5dStaND2cHhPjFyWhkt4V1dL5HWL/D6sfkUUNFeqwEtFGy
         qM94pvWjoUVLlbTUrMcuOsKIS+87KlecHbjJI/uJslD9oFpnhCLwctQCvM8wiuOw4sWm
         +8Y6hTbm15NfUYkkAkhBrrydG3njkRgYvbYqQYCK+YVb7ueBPB/dqf23JWbgTZYy9mA4
         TlMR8UXZOioP/+SxmlrkEziAp/ta5OWZ9UWsRh9hRJf7hDSPUZOv2G1Q1F0hdXPIhU30
         uj1IbxUdEQR+bxBh7XviFzlSWKI/wIAeZ0g84hwftUur/SItFRulQnnTTQalCokdNXuv
         c38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714395056; x=1714999856;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AA8Wnhnd2h9AIkFPnW/qgu9YDhSqFrPxytoNRCePneg=;
        b=Pi7Rj0ilOzQePKHpY1sV1tH/xwfBuY1b3RwoNhRM4mTrOmvrzc55rC/YJy7KRyDil8
         aWJIQHMuqCr+RFMtJsZWR3KNsPTZDgbTCwVu9+C7mFA6Q/QUi/WdeYJVXTdbKqAO9FQ5
         YcZYFvJPUTFCN+vvc/WqR68piXaqhPg5kH8lSmqG0Ej6agouKlzbEhKH285kaTjoYVNU
         pJl+xjKzTYSUQlwuf+ZPvPieRu2kBhvbanyDVbCfKV24pIrkaQliPBtl0xvOW+d7x0zd
         YEl2tC2bDl+yLi77YIy+vP4nO2ERY125/lvKSorwpGcZcLf+Pk6tprgp/sWICtQ2hS+h
         VNUg==
X-Gm-Message-State: AOJu0Yy6IDYXsSsa26Ns9VF4dNnIcjfsZENUWUSfCFIrtf4Bn6OJ5xNx
	bBLJjodrB/fVxdac93Z6tTl6VVxwWChCedTwcsBEYqO9PrscDX+ix/VaD+8SaaI=
X-Google-Smtp-Source: AGHT+IEEq7lEnzH6sgqanAD/D/n9q/1O0O8UpYp8nAQiO9ag/ZJ5EaG2BzJxFdMlOO/w23lHUScG3A==
X-Received: by 2002:a05:6000:1786:b0:33e:800d:e87a with SMTP id e6-20020a056000178600b0033e800de87amr6941241wrg.34.1714395056325;
        Mon, 29 Apr 2024 05:50:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:d72:4b40:65fa:89e6? ([2a01:e0a:cad:2140:d72:4b40:65fa:89e6])
        by smtp.gmail.com with ESMTPSA id f15-20020a5d4dcf000000b0034ccf959d6asm4539608wru.74.2024.04.29.05.50.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 05:50:55 -0700 (PDT)
Message-ID: <9f68e310-9cf6-4f62-affe-44ebbf93db97@linaro.org>
Date: Mon, 29 Apr 2024 14:50:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 09/12] arm64: dts: qcom: sm8650: move PHY's
 orientation-switch to SoC dtsi
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240429-usb-link-dtsi-v1-0-87c341b55cdf@linaro.org>
 <20240429-usb-link-dtsi-v1-9-87c341b55cdf@linaro.org>
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
In-Reply-To: <20240429-usb-link-dtsi-v1-9-87c341b55cdf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/04/2024 14:43, Dmitry Baryshkov wrote:
> The orientation-switch of the USB+DP QMP PHY is not a property of the
> board, it is a design property of the QMP PHY itself. Move the property
> from board DTS to SoC DTSI.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 2 --
>   arch/arm64/boot/dts/qcom/sm8650.dtsi    | 2 ++
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> index 65ee00db5622..f93de21a26ad 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> @@ -1223,8 +1223,6 @@ &usb_dp_qmpphy {
>   	vdda-phy-supply = <&vreg_l3i_1p2>;
>   	vdda-pll-supply = <&vreg_l3g_0p91>;
>   
> -	orientation-switch;
> -
>   	status = "okay";
>   };
>   
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 4624ea4906d9..9dd66c28c588 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -3751,6 +3751,8 @@ usb_dp_qmpphy: phy@88e8000 {
>   			#clock-cells = <1>;
>   			#phy-cells = <1>;
>   
> +			orientation-switch;
> +
>   			status = "disabled";
>   
>   			ports {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

