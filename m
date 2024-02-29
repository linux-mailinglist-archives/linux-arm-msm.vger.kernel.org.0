Return-Path: <linux-arm-msm+bounces-12972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9121086C9D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 14:11:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AED571C20D59
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 13:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C059E7E10D;
	Thu, 29 Feb 2024 13:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qmGpfaDq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E3E67C71
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 13:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709212289; cv=none; b=kY68AJo/cg/5xe74dbixXabzhxg+KjmdItBK1ZaSxAsjVbkekgViJSjTeAzJIuCqdqoqBw6wGGxJliQnE/WVDunGXvX4CK7hfdkTw9JEgkZ5zTH0+ngDBOO7EygMrL569MyAAiY6OLjzIS6Qbl53Zf5XMAFrDAKtPWwEJSgj8wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709212289; c=relaxed/simple;
	bh=4W3ISLSnRmIIwJ4j/bvjd4H/z6Bi6dU9b3/N/JESk0o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OW5xkAMgohdDgtigzXKUAxcdcS2jIbvqqnW4eEzcnPI8Zl3XylYbK49o7pvNoyoLrmF3bADZKhKWyt44HmTo6gwB1xDEJlnOeJ568b6dnf1BeklrXklNIEgr9lppIx5bNlyrY+Uyix/9owNzpvjbTex0Hwrhjrq7kAg7OoaO46w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qmGpfaDq; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-412b41a1294so6510895e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 05:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709212286; x=1709817086; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h6M8B4BfVBtOt+STshPGZoAe3kMEQJjnBG/nPTu0M2I=;
        b=qmGpfaDq8Z50tX8+hCyQWSiN4Z+4wcg3LnhMViIuiNrv0r3YPUruq78yN3EblWhLjW
         7++GFvh58wYhKjOZI4WA8J5R+89494j7ZXyTozud8rlUMYmmBxynsxhjO2y6M3IexHKu
         F31xYZNGUB3xKKtdgGWPnOiPS10PMejs+1XnMGKSDI9u6/kpGsdvVQIVVdB5Xla7rYCq
         yhLuo1rx3VDxRk0qxtCE/DswXYp63szGzzQzmpFdQqxmS8NIxWQEcrNjnPQFYgQxZwdA
         EhWG+49AKqGkuXQe5DTUpaArhehg1ygYh+9eFbTKBX5r2hCCAi/8ApSzUq4t4Cshfcs0
         ymyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709212286; x=1709817086;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h6M8B4BfVBtOt+STshPGZoAe3kMEQJjnBG/nPTu0M2I=;
        b=sR5aPCgWLTtCoyPesCk4V102scccnKm99kfV3+ssL5T+I30bv52gD8GNDb6xCmaOXy
         MJ3mLVNcB69wmUimCQEnQyb31t+ijP/7UP6eu3oHtDXYmWrQfxtVwNiHUehyWFVGENec
         1Z/NM9+aQG+WASg+CV0YxFxxY6k9mHxIlOOTsVl2xYObN6QlIP6CY8kRlegakegOXuVA
         brq1Ob4J1C0RqV5yqvfcmYYexD6H0wpHnDtj5HznQgkc7HtSeg6g3AqvZ5F8kogHEGCr
         Dnpbjgji1f7Y+hAXZlSZu3Trl9Ot1p5OvVCShypA1FDlPyGTgKszotBODUXUmG7wkHP4
         IoEQ==
X-Gm-Message-State: AOJu0Yyq69BC4dsqpBEMng+m+/3DRy+4BxZyLXiLRk5R7RcIGVdf/9zo
	tAPXJj8xo4KrsOh1U48HheKslP9FxEMNevReINnpMBGYwpGdYxSNQaHxkNFu3OA=
X-Google-Smtp-Source: AGHT+IEBAMt+2DVoMzLFB2ujBnCPkPwxCpwtsJYFq8Gh+tlnMzHg/PTvDQu0GO3Pn/Hbi9aHlCngRg==
X-Received: by 2002:a05:600c:4f51:b0:412:6dd7:1d44 with SMTP id m17-20020a05600c4f5100b004126dd71d44mr1651953wmq.17.1709212286296;
        Thu, 29 Feb 2024 05:11:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:651:5318:b12c:be82? ([2a01:e0a:982:cbb0:651:5318:b12c:be82])
        by smtp.gmail.com with ESMTPSA id hg14-20020a05600c538e00b0041228b2e179sm2046504wmb.39.2024.02.29.05.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 05:11:25 -0800 (PST)
Message-ID: <15239863-4e89-4322-8dc5-297661e22b40@linaro.org>
Date: Thu, 29 Feb 2024 14:11:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH RFT 7/7] arm64: dts: qcom-mode-switch: allow 4 lanes for
 DisplayPort and enable QMP PHY mode-switch
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-0-07e24a231840@linaro.org>
 <20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-7-07e24a231840@linaro.org>
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
Organization: Linaro Developer Services
In-Reply-To: <20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-7-07e24a231840@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Bad copy-pasta, subject should be:
[PATCH RFT 7/7] arm64: dts: wcom-sc8280xp-lenovo-thinkpad-x13: allow 4 lanes for DisplayPort and enable QMP PHY mode-switch

On 29/02/2024 14:07, Neil Armstrong wrote:
> Allow up to 4 lanes for the DisplayPort link from the PHYs to the Controllers
> and allow mode-switch events to the QMP Combo PHYs.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index a0fdef55a40a..6c73e0fc001f 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -556,7 +556,7 @@ &mdss0_dp0 {
>   };
>   
>   &mdss0_dp0_out {
> -	data-lanes = <0 1>;
> +	data-lanes = <0 1 2 3>;
>   	remote-endpoint = <&usb_0_qmpphy_dp_in>;
>   };
>   
> @@ -565,7 +565,7 @@ &mdss0_dp1 {
>   };
>   
>   &mdss0_dp1_out {
> -	data-lanes = <0 1>;
> +	data-lanes = <0 1 2 3>;
>   	remote-endpoint = <&usb_1_qmpphy_dp_in>;
>   };
>   
> @@ -1112,6 +1112,7 @@ &usb_0_qmpphy {
>   	vdda-phy-supply = <&vreg_l9d>;
>   	vdda-pll-supply = <&vreg_l4d>;
>   
> +	mode-switch;
>   	orientation-switch;
>   
>   	status = "okay";
> @@ -1149,6 +1150,7 @@ &usb_1_qmpphy {
>   	vdda-phy-supply = <&vreg_l4b>;
>   	vdda-pll-supply = <&vreg_l3b>;
>   
> +	mode-switch;
>   	orientation-switch;
>   
>   	status = "okay";
> 


