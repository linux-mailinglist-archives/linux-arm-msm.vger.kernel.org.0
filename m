Return-Path: <linux-arm-msm+bounces-12037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF98685D832
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 13:48:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57D3E1F22D49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 12:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D96469D15;
	Wed, 21 Feb 2024 12:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FxHrCYuv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735C269D30
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708519610; cv=none; b=bVUw0gR02T9+I5PpQjy7jU084YNp/lxwpAzASFBsMu4OeZs7jtgEbc8aauyJYAUCIAamWOLEAwhbJbQeWxIrOqbwHIPUm+6hJIi7QPcfWxBsGoIv1cKd2SuBmd4jwmNvU7yLZhJ58VlTHwuLL+1bZIT7dm76ywYYwamXa9R/NFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708519610; c=relaxed/simple;
	bh=z3HEJ6S2AMndq0bseExYFbEybm/HilEkhjj9IMrNfjI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fHJBB7RdZwcmoADxYx761jWBsPv6eECn8aX3DjEp4LUut5Hh/I8i4MqNASDVVdiyU98yDADLxyIhUVzyJ8r3BxOeLtL0BE53PiRQr1kZ85+A6q7jRAOe3NP1b6gT3sDfM047xty6yDY4Q16J8kw75jXmjR0gq7yG0czGxSN9u6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FxHrCYuv; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-41275d2edbcso4438885e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 04:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708519606; x=1709124406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2crl62am3tR1iEEzxCYJzpOeewoyy8ABE6QxXXM9PqE=;
        b=FxHrCYuvOpbYQC1HIUFivlnrxiusgBGnh3KYehP/bA5ahlBh42uhs/SXC8Di0mss2h
         tpQC9lwUr685eQg2Ir2pfEJ7erDit5vztHMYyQtDd3aXpLdOCSVHMsvlg9FxqRqkjq0s
         /Ci7OLrM/Lzxb8vgzfiMvknm3iUhS0oVgjwCRtKJyzkL7qFuZIOqPkXLyTA5ypUqea0+
         OC/3lWC857mMNzt/DICXIecOLJgBYVJ0/rDOn4NwwvGehMrMWv4ocw1ZysrkUuwy6ZFj
         8/3yJwSoHEy/CliffAcRa3m1WKLscRn8NHuy1yQ81GpI3zCFHdlHuSuRv/WOgVy2IFkn
         urQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708519606; x=1709124406;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2crl62am3tR1iEEzxCYJzpOeewoyy8ABE6QxXXM9PqE=;
        b=BgCwJNfVEVsMqrpsov4gDM99uNkLNUICBCtiprRph72fQ10l5qZgGPDXBvP0NBBdLD
         hfHC4YEQfyB0S1YSQe2+vhCiifXOihv6l7b5PBw2R0pW9HddAg6EQpYR9XQPvOBEZV4b
         rld7p2DBT0SpNNtwf9ENx/rKpTBMY36+YMofh0lGLdlUjweetLUq7QVGb9iLbBG/TzVP
         gFhI19E77YJ3zrRQ013MmTA4zxzFlC5TbHj3zFadhuqLIfydZPJnN5LwC+sYn5SSN5Qa
         +QsdZ08eDE+irEBuYoGnEPjyMrHQQgWEZO5WR3Nlu6ErqOQ/6iH4Lyj/sIVrt/smbejU
         VUsA==
X-Gm-Message-State: AOJu0YyHATsGYhX7ig/9J5rv026OI9iPcqPZJgGHDUl9U3a9d/rspPiE
	Ve/w+4aqYQHAv4Ntb993FLvY6gC4QxftCCJuBr1doVDwfuteQb+J7W91EdZf+TE=
X-Google-Smtp-Source: AGHT+IFFN3TaC/aG5VVgZwwQfXnpWlMm0V32BHUK/RgBw9hM2zIhuoUDFM8gRmRsDnGehYtBWJahrg==
X-Received: by 2002:a05:600c:3545:b0:412:65e7:3639 with SMTP id i5-20020a05600c354500b0041265e73639mr6381970wmq.27.1708519605732;
        Wed, 21 Feb 2024 04:46:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:83fc:439c:6f36:ce5c? ([2a01:e0a:982:cbb0:83fc:439c:6f36:ce5c])
        by smtp.gmail.com with ESMTPSA id r17-20020a05600c459100b004124907f43fsm17468735wmo.12.2024.02.21.04.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 04:46:45 -0800 (PST)
Message-ID: <42bd1a2c-9ab4-40ce-9b5a-1e5b28ec550e@linaro.org>
Date: Wed, 21 Feb 2024 13:46:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 07/21] arm64: dts: qcom: sm8650: Add PCIe bridge node
Content-Language: en-US, fr
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240221-pcie-qcom-bridge-dts-v1-0-6c6df0f9450d@linaro.org>
 <20240221-pcie-qcom-bridge-dts-v1-7-6c6df0f9450d@linaro.org>
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
In-Reply-To: <20240221-pcie-qcom-bridge-dts-v1-7-6c6df0f9450d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/02/2024 04:41, Manivannan Sadhasivam wrote:
> On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
> for each controller instance. Hence, add a node to represent the bridge.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 2df77123a8c7..57a1ea84aa59 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -2270,6 +2270,16 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>   			dma-coherent;
>   
>   			status = "disabled";
> +
> +			pcie@0 {
> +				device_type = "pci";
> +				reg = <0x0 0x0 0x0 0x0 0x0>;
> +				bus-range = <0x01 0xff>;
> +
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				ranges;
> +			};
>   		};
>   
>   		pcie0_phy: phy@1c06000 {
> @@ -2379,6 +2389,16 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>   				 <0x02000000 0 0x40300000 0 0x40300000 0 0x1fd00000>;
>   
>   			status = "disabled";
> +
> +			pcie@0 {
> +				device_type = "pci";
> +				reg = <0x0 0x0 0x0 0x0 0x0>;
> +				bus-range = <0x01 0xff>;
> +
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				ranges;
> +			};
>   		};
>   
>   		pcie1_phy: phy@1c0e000 {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

