Return-Path: <linux-arm-msm+bounces-18797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D138B591C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 14:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38F77282A10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 12:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A8355C2E;
	Mon, 29 Apr 2024 12:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dolx0Et2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734267CF29
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714395073; cv=none; b=CjnU9NGUdPO0/ejA50I1G/J6NSos54kKPEq7Pa5K8HyI4QRJbBHI+JGVEqAD1BiJJa/+ozM2wD67bxjm5sNUa3hs781+UiDKPSI0HY3yhV4m37TMDdw/yvjPui59ECwtYCBZ81RGF5oAP4efJatsjuv83TMSHI0Ow/VrGt27msY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714395073; c=relaxed/simple;
	bh=pe8G9p+5P17X+6aAHDkyKKC/MlCpHCHV2awoLfH+sa0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nM7cl/8EjOn7kt6Yitk2Lurqt+UHAMr8hmObkwrnOlfcCvkaPz7UjZhceHRCRMHkZWqtLXNFoODACLw4U62XA4cPhNud6ZM4B6ubQKUxfaNXk5YRUNpJjySMjR07tAKBRnwBJxH/bd4x9I77y3JozcVQ2PWOz+4yww4uZsi3ltg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dolx0Et2; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-41ba1ba5591so20390245e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 05:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714395070; x=1714999870; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eN5fY6zvwHqNicRZDwZ/+hgP7ChQx+W9f+XFS8SdjD8=;
        b=dolx0Et2UucO4RfgxxnK/1LC1vt/Js3d3ROWAL1tap7eLyjbBn/fhgq32Nazul04EA
         ZwoGh1+01deDVQkcJJACnrYErFB8sJD8Og2cW7jq1nRffqkQUP3VwtQ900CmE269VrCj
         kxJnZugf/iPNevdfqqRcaS00I8+Y/dPUY0WHF/rVk3Fn3kVhK/3KoxjXbs2jFHn3scv9
         yON18c0LMcp+Ap9m1kmnoNgSGJ/bM/kf1R99mdGH0/OJiclNkvvEpdobExFvvH8wAQne
         GzWYfe3QC9HpIX02nUBfSX9usAI1wXT1BFVLCnuBhBUVatN9muEwxbnMRrZ37SyaulkO
         Jzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714395070; x=1714999870;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eN5fY6zvwHqNicRZDwZ/+hgP7ChQx+W9f+XFS8SdjD8=;
        b=nRo1+dEJS9P9n91H6P9XOY8w9IVrePReoDNTZ+RtkDNefh/J4rnaYzEZxkScMhcnQ7
         ZE36I27VtGaQGkxi6GFneWdi8GyUSIwcU2HPwnHiZ21OQDEZcr3y8C19X3sBd7KOFRl0
         DkO/ehOJB64PJPersQBfgwpK6LW0thFfmGAawDh+MHjUQkCLeh9w7Y7qHd3slw33NihY
         mVEdnpgMlA24e+pYDNP3qltSTqlUV9nhf9LXFmm819PbF4r+vxuoJ1Hws+pzQxfvF/1T
         pyzKEVyoLdOU/1XzReg54IZQiVyznbVwzw1BbH2dWqJ11UsB7Xmnp6OnQOduT10xpZuZ
         JWzg==
X-Gm-Message-State: AOJu0Yz3hbFI3TWGe8+Bu0HXU07dmN6yNfiBZobL4jNHOkQHaYikveTF
	NgaNVowuLT6+HrTT1I68UlmVK8tdh1cv8BxkGAajiviZ8voh+1sJTyQxWQ2xft0=
X-Google-Smtp-Source: AGHT+IHnCz6LZx0FNyxSdv4FcPNxpY/R+tbn+duWjJcyrChNRsNL9i18Zpr8P2NmF05VLLvhALBvOg==
X-Received: by 2002:a05:600c:470d:b0:41a:1b3f:b465 with SMTP id v13-20020a05600c470d00b0041a1b3fb465mr5769257wmo.26.1714395069514;
        Mon, 29 Apr 2024 05:51:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:d72:4b40:65fa:89e6? ([2a01:e0a:cad:2140:d72:4b40:65fa:89e6])
        by smtp.gmail.com with ESMTPSA id z9-20020a05600c0a0900b00418916f5848sm40849583wmp.43.2024.04.29.05.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 05:51:09 -0700 (PDT)
Message-ID: <d3367636-6a67-4199-af37-d76cc75f5484@linaro.org>
Date: Mon, 29 Apr 2024 14:51:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 08/12] arm64: dts: qcom: sm8550: move PHY's
 orientation-switch to SoC dtsi
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240429-usb-link-dtsi-v1-0-87c341b55cdf@linaro.org>
 <20240429-usb-link-dtsi-v1-8-87c341b55cdf@linaro.org>
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
In-Reply-To: <20240429-usb-link-dtsi-v1-8-87c341b55cdf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/04/2024 14:43, Dmitry Baryshkov wrote:
> The orientation-switch of the USB+DP QMP PHY is not a property of the
> board, it is a design property of the QMP PHY itself. Move the property
> from board DTS to SoC DTSI.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8550-hdk.dts                     | 2 --
>   arch/arm64/boot/dts/qcom/sm8550-mtp.dts                     | 2 --
>   arch/arm64/boot/dts/qcom/sm8550-qrd.dts                     | 2 --
>   arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts | 1 -
>   arch/arm64/boot/dts/qcom/sm8550.dtsi                        | 2 ++
>   5 files changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> index f786d9114936..98934e4a81b2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> @@ -1279,8 +1279,6 @@ &usb_dp_qmpphy {
>   	vdda-phy-supply = <&vreg_l3e_1p2>;
>   	vdda-pll-supply = <&vreg_l3f_0p88>;
>   
> -	orientation-switch;
> -
>   	status = "okay";
>   };
>   
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> index 56800ab903a1..d3fd00176233 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> @@ -972,8 +972,6 @@ &usb_dp_qmpphy {
>   	vdda-phy-supply = <&vreg_l3e_1p2>;
>   	vdda-pll-supply = <&vreg_l3f_0p91>;
>   
> -	orientation-switch;
> -
>   	status = "okay";
>   };
>   
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> index d0b373da39d4..1d487c42a39b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> @@ -1156,8 +1156,6 @@ &usb_dp_qmpphy {
>   	vdda-phy-supply = <&vreg_l3e_1p2>;
>   	vdda-pll-supply = <&vreg_l3f_0p88>;
>   
> -	orientation-switch;
> -
>   	status = "okay";
>   };
>   
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
> index 7a8d5c34e9e6..92a88fb05609 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
> @@ -757,7 +757,6 @@ &usb_1_hsphy {
>   &usb_dp_qmpphy {
>   	vdda-phy-supply = <&pm8550vs_2_l3>;
>   	vdda-pll-supply = <&pm8550ve_l3>;
> -	orientation-switch;
>   
>   	status = "okay";
>   };
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 3ada5a30ecb7..9980504f66db 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -3170,6 +3170,8 @@ usb_dp_qmpphy: phy@88e8000 {
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

