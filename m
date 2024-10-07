Return-Path: <linux-arm-msm+bounces-33358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A92BF992B67
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5429B1F2483B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 12:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CAF1D26FE;
	Mon,  7 Oct 2024 12:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lhl0lRpz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4803D1D2226
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 12:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728303493; cv=none; b=lfxcOg1AGJiHA5TWCls2e8N//H3XuI9vMIqn91KLS6pf2Tffnurn9NvKqqRrI9Lcd9r7JEIg2y+KFzE1uRGhAx3Xlgh4wvtJBssJVWDgoakKcDMAvrYxPL6MiGLN3kJ3VnpdiycAWDvj8HWL7a9n8/rTVMr9ijcc0xqMelquUzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728303493; c=relaxed/simple;
	bh=GigVtFfk/2fgkZeSPc6JpOrI1qWQxJvVJJEpj1HnNYg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=uBRfcls+psN4OunML2Z4uyXhqA0ZtuHw2EPdc+zm2dQl0ftymINwRjYUjo8evMVm9NG07NpYlo/hJTba3OjsNPLNc0UoZ0ubasd1P8DJ2Oqi/Y9XD9vWyGn7faWXit3rXa6tGO3qZ2BCgzD9+AYVKWJsOTnNAn1IpFGarTtvZC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lhl0lRpz; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37ccd81de57so2864692f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 05:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728303489; x=1728908289; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQMY55kgpoJcK6EPBzBisyh8vDa6LNf5m/LH5NecMRg=;
        b=Lhl0lRpzPLF4ftfl1tpE9LCmUuC0rX/wfjHFaEgL99Y6NU0SYt2zJ4uvd5Wj8bauvp
         BNz95tess7Cj07gZ8uuF00o3aoypMGucTgSH1y9RoGHmHOppcIzSquXv6XGsX2IVP8em
         FL2NUkPFHxyDSw20ZPIPSgBbwgzkl580W8Q0/qU3bzWYCWFmd+Sb7MnXDSFuh+hmoRMm
         z+g2v4b/fzyNAlnK/IH+2m36ouUO2kg6ngzZ3glGv86TjlkEit5XbB1hLibLymOerN7g
         CmpwDQlir8jTzq9+lUlkNSmmNDYI3NufcMv8N7AkqzyarMW63/j03TIaCxiFP+tjH86L
         mvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728303489; x=1728908289;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SQMY55kgpoJcK6EPBzBisyh8vDa6LNf5m/LH5NecMRg=;
        b=XyYAhdWEasf5ruRAYrS3qCQyUClG3IlxdJwOhH0r/+yfjCDVthdigRyCEW3Vs+EU+u
         xdp+ZhdDf6asEQREPIzwsrzuC/xg1rIsn3bROnMVYcKmEilX5qPI35enCbRwkB7zlarG
         0NL/HhtpzHLC9Kc2nLQ29/gCdqY3aFBhoxbNd2I7UTa+hHk0Xz80lszRae2uWjVk9Zzn
         79jj832HAhkbrkIdnk/STuiFl/Tvs1FD5bXFdjv99T9nlfHGOpKUw7CYAaDcwAzUrSyZ
         /MJ0alDQeM1jxmlTePEMiY/rX2VRv5kHrYrqyNTrQcIXsOdr350qETAUj5KqX61sCqtx
         0dpA==
X-Gm-Message-State: AOJu0YwflL1Yw0ME45daJ5bJ2eucBBWGpgAxEqqGvfEARROB4hhB0eYI
	0vut5AcYQS0bPumC+J2aal4Qr1hUp5kR2UPCYrHG9JwSYqvYvFw4sVSwXF+dEic=
X-Google-Smtp-Source: AGHT+IEX3nb/Sk0bgeAI3WN1XsuDP4LlrGoUtTQAqatI700kLa0PbxydgUWnVzuZhq5beUoqBnd1gg==
X-Received: by 2002:a05:6000:1884:b0:37c:cce8:4acc with SMTP id ffacd0b85a97d-37d049ea723mr11723832f8f.13.1728303489356;
        Mon, 07 Oct 2024 05:18:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a99f:3c24:fa3b:1e7? ([2a01:e0a:982:cbb0:a99f:3c24:fa3b:1e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1690f0bdsm5594131f8f.15.2024.10.07.05.18.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 05:18:09 -0700 (PDT)
Message-ID: <61207002-2c4f-4070-b233-01b92ba16400@linaro.org>
Date: Mon, 7 Oct 2024 14:18:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8450 fix PIPE clock specification for
 pcie1
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241006-fix-sm8450-pcie1-v1-1-4f227c9082ed@linaro.org>
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
In-Reply-To: <20241006-fix-sm8450-pcie1-v1-1-4f227c9082ed@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/10/2024 18:47, Dmitry Baryshkov wrote:
> For historical reasons on SM8450 the second PCIe host (pcie1) also keeps
> a reference to the PIPE clock coming from the PHY. Commit e76862840660
> ("arm64: dts: qcom: sm8450: correct pcie1 phy clocks inputs to gcc") has
> updated the PHY to use #clock-cells = <1>, making just <&pcie1_phy>
> clock specification invalid. Update corresponding clock entry in the
> PCIe1 host node.
> 
>   /soc@0/pcie@1c08000: Failed to get clk index: 2 ret: -22
>   qcom-pcie 1c08000.pcie: Failed to get clocks
>   qcom-pcie 1c08000.pcie: probe with driver qcom-pcie failed with error -22
> 
> Fixes: e76862840660 ("arm64: dts: qcom: sm8450: correct pcie1 phy clocks inputs to gcc")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 9bafb3b350ff..38cb524cc568 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -1973,7 +1973,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>   
>   			clocks = <&gcc GCC_PCIE_1_PIPE_CLK>,
>   				 <&gcc GCC_PCIE_1_PIPE_CLK_SRC>,
> -				 <&pcie1_phy>,
> +				 <&pcie1_phy QMP_PCIE_PIPE_CLK>,
>   				 <&rpmhcc RPMH_CXO_CLK>,
>   				 <&gcc GCC_PCIE_1_AUX_CLK>,
>   				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
> 
> ---
> base-commit: 58ca61c1a866bfdaa5e19fb19a2416764f847d75
> change-id: 20241006-fix-sm8450-pcie1-4be23e8bf156
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

