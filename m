Return-Path: <linux-arm-msm+bounces-14356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E2A87E545
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 09:53:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1292D280E3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 08:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F88A28DCA;
	Mon, 18 Mar 2024 08:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uLTpZaC6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A49E28DBC
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 08:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710752008; cv=none; b=PN5Q4P8zqrB2vzfWjOdkT/SHu+02JeMJOi6GMG9MPMPZAV2VfeLwet41VDjGL2nCHcCxZ3HY0K+gyJYf7gT7HLrm16b7BoZCuuGEmlRy7xkrqdGQ3qAVYs9TW7oCmO71o+2jUVX5dYMkb4g/VaB2XPzqBCOC4sA9iuOAwANAlms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710752008; c=relaxed/simple;
	bh=IeCriGnHDiuzZ2xp1Qd2CEgIuo6HCVCELGtRINMfM9A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OXrRNVx/SPL2iOAisVr4A+skOaZEYO/phjCmUre8TQKL91o/nJN9AHu0VDv6Q/prDoymUI5j2xx+Oq/Rg1MNOG48ddiAs698DJkKWwpcxv3iOaaWonVHb5cdrlkQBi2GJdcWlDNydw0yOkw/c7Mx6Hosjzob75yk+KnJ2wPzaLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uLTpZaC6; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4140a9f25adso9139135e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 01:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710752005; x=1711356805; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e6RdvrF1nwywjuutN1RSGDtUcsbQUwWLcTgjf0q2ePc=;
        b=uLTpZaC6ja1nZmz8u3qTBVX7lpZFvZ7ZqVN0VkCq9Sw3pM8A74O1yOZEIERDXHPVDs
         skGxZngwC8YaJniQ7i3HsyPriwe6P7abKtWdBs0QE5yStDWwc8AmpTlKTtf+cYe1Rvkq
         esJRGtSWyLEoqil0Ircr0YF7ChC3EzZ2PIqgGdK+PmuDIqMrlJOkMUv53xMmBoHPl567
         H2EU9T4fGOSyzV17E1kH3AkKSm/r8ayxlBSBUYV7+NMFI3wzCyKGxFLxjyjBdYcRbswP
         xHslEX/32nCwtR8hIbI8CSFT6AQJlOfSpOdkC8D+vIjs89+Towh5BPxMSH6jF2t/Qn+h
         XbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710752005; x=1711356805;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e6RdvrF1nwywjuutN1RSGDtUcsbQUwWLcTgjf0q2ePc=;
        b=jp6k69O2dQ2f8VlgYa0UW40aDJVjcenkXizfdl4HyPFtXvjeXS2SkHi66Z1up3cWQx
         0xIsZjvU0xVROd7Z6bu6O6N+02rHojr8+YZdvzHZBdzglGSY6HihSar6u5PDCtiDfql7
         ymQWiuNzFvnc6/9DD+qf/C/9l55/DWSYue6lCUlld5DqySk6eF5l+6F/dNEMszPJgv0+
         dGuzXp/Xbqc3vEvEJQtedDtY/+ZTBhrQ/rjd527SemSoZyLy5R9xn7zVew6EgdGcZQ6P
         Ms155oLoCUkuj9EbhqDEsvUKDa8gSTrcEaP5gqQp3VpZvCef3tvgknye/9pGyxsjkFKp
         kpXA==
X-Gm-Message-State: AOJu0YydJd7P9WfpG2qsJHLYZYc4JZxZyLLIFKQMBDvTF42uWNt4K9s4
	0jx99s0AisZhPC/Q9FyVYSXYj1WA8EZZFppl/u8ZQ22dZNKUGfNXTcmam5ske4Q=
X-Google-Smtp-Source: AGHT+IFyeUI9pEaKgrAe5AfLGyKBZp3wyBmL6tQdtyQDCA7M/hfOqekkyKVCMKleXVorbC5ec8IeXg==
X-Received: by 2002:adf:fe0d:0:b0:33e:96c1:3da6 with SMTP id n13-20020adffe0d000000b0033e96c13da6mr7099752wrr.65.1710752004926;
        Mon, 18 Mar 2024 01:53:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ad2b:a316:59d9:3dbc? ([2a01:e0a:982:cbb0:ad2b:a316:59d9:3dbc])
        by smtp.gmail.com with ESMTPSA id i7-20020a5d5587000000b0033ec68dd3c3sm9289562wrv.96.2024.03.18.01.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 01:53:24 -0700 (PDT)
Message-ID: <eb78a288-e67a-45bf-8995-4e9f755575b1@linaro.org>
Date: Mon, 18 Mar 2024 09:53:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8450: Fix the msi-map entries
Content-Language: en-US, fr
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20240318-pci-bdf-sid-fix-v1-0-acca6c5d9cf1@linaro.org>
 <20240318-pci-bdf-sid-fix-v1-1-acca6c5d9cf1@linaro.org>
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
Organization: Linaro Developer Services
In-Reply-To: <20240318-pci-bdf-sid-fix-v1-1-acca6c5d9cf1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/03/2024 08:19, Manivannan Sadhasivam wrote:
> While adding the GIC ITS MSI support, it was found that the msi-map entries
> needed to be swapped to receive MSIs from the endpoint.
> 
> But later it was identified that the swapping was needed due to a bug in
> the Qualcomm PCIe controller driver. And since the bug is now fixed with
> commit bf79e33cdd89 ("PCI: qcom: Enable BDF to SID translation properly"),
> let's fix the msi-map entries also to reflect the actual mapping in the
> hardware.
> 
> Cc: <stable@vger.kernel.org> # 6.3: bf79e33cdd89 ("PCI: qcom: Enable BDF to SID translation properly")
> Fixes: ff384ab56f16 ("arm64: dts: qcom: sm8450: Use GIC-ITS for PCIe0 and PCIe1")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 16 ++++------------
>   1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index b86be34a912b..024d2653cc30 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -1777,12 +1777,8 @@ pcie0: pcie@1c00000 {
>   			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
>   				 <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x3d00000>;
>   
> -			/*
> -			 * MSIs for BDF (1:0.0) only works with Device ID 0x5980.
> -			 * Hence, the IDs are swapped.
> -			 */
> -			msi-map = <0x0 &gic_its 0x5981 0x1>,
> -				  <0x100 &gic_its 0x5980 0x1>;
> +			msi-map = <0x0 &gic_its 0x5980 0x1>,
> +				  <0x100 &gic_its 0x5981 0x1>;
>   			msi-map-mask = <0xff00>;
>   			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
> @@ -1900,12 +1896,8 @@ pcie1: pcie@1c08000 {
>   			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
>   				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
>   
> -			/*
> -			 * MSIs for BDF (1:0.0) only works with Device ID 0x5a00.
> -			 * Hence, the IDs are swapped.
> -			 */
> -			msi-map = <0x0 &gic_its 0x5a01 0x1>,
> -				  <0x100 &gic_its 0x5a00 0x1>;
> +			msi-map = <0x0 &gic_its 0x5a00 0x1>,
> +				  <0x100 &gic_its 0x5a01 0x1>;
>   			msi-map-mask = <0xff00>;
>   			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

