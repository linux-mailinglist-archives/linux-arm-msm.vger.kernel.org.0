Return-Path: <linux-arm-msm+bounces-12036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B6485D82F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 13:47:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E6E32835EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 12:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55AD69962;
	Wed, 21 Feb 2024 12:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r70fg2La"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41E2657AD
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 12:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708519598; cv=none; b=oP7xpVVygBAzbQdXqgBeidsX2NtUpvEpgCiygsKQEHunBc8Yr10VYl02OnLQh1KVSzZwAZjEUQh524uOIdhS6bmqFXi1/k+p9ZVmAn/yKhz8XddcDRYGDEbK9DMlFFT4Nz+KNQJqXQOCxtyZMvqBasXFQMdyauIquInN8K8OD9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708519598; c=relaxed/simple;
	bh=rmC+JPyaJaNGoCGsxwGFb8rYUkL+teE35ckCjgoiN8g=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=upIoqI3QoQ5DQidHAC/FJoszOwtbvwam3KtqOBD+ojfVDaEvehZvXTHfNNJrI9yFD6ECZGQJnwSD/hP7JL1HOBAyjOL5RNFXTMauW2wXIVUDndjvDP4dSJ85Fa/bdHi6gD6UKuNnMntRZp813DKDEzaD8Y1xjkNfyo6mFvzDP2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r70fg2La; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-512aafb3ca8so3731866e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 04:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708519595; x=1709124395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XHZrn5E2iSqgJ7TERch35NpDb/N0meA5fLJwZ5XQ+Mk=;
        b=r70fg2Lab/HolLt+SuY8FOtUbxdjERqyL2951L8zPTmvKdf1IfrYjIOEskEyvh4qWe
         JWAkKtdrya7VqLh6FPXeqtvtTPkNGy4HvixieEcKg8qriJTWe6QbcWajWLUKro8cQ2TA
         C+IL6MIYtuFUvsO8VulnDi2UyPqVolEZxmIpG/JGRnjFwYfUc7U5eEiZwEZOad47323E
         4jgjelcl12EBLburlZtYDObwhhoqsq+uCVDEr9a19l3Z76gnhvwchCLEpfZd34WGs2jn
         yMVX2UPE8zjE8RjNzRqTfizlYCaRNtclPaXb9rLMpQA1W3LfOrjancIswkj2NWb+pNUG
         Cz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708519595; x=1709124395;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XHZrn5E2iSqgJ7TERch35NpDb/N0meA5fLJwZ5XQ+Mk=;
        b=NopkMsABYz5aQqqkVnbVP5KRRGd54muKNgBBNTKan9sL5EeXcASvyxRH6kDaV6pgmV
         B6+BA7i8jATkt3WcTkM5CffbPl1zdJvyR2q4YTnxYEnWJ8ZX5Mq41PWJ4cvZClOm+OGG
         NFy3cWfvP/UNGS1s2QS3FeUdIHkCZx3o8dj4rpNrZe8JkmUuo/X2sguDaVFHN5PEDoN4
         whDake2UECqum7A/qe1rgtrs0zUYp87HqvOMOxBFtDBDQGlhSphlKwa9CXT7S+VNmlyo
         OukcUuBB/Ld+WD5GdZd67xjQE2XXhOcE+TPj0D74d0KeYtSkAQWQrhRfVJvhal2kOHw6
         ecKw==
X-Gm-Message-State: AOJu0Yz/ViGIIeU5Xmbk5NsBzBGJ7PzYI0uRleywgrwiNwbG+RAQh7l6
	DqdvSlAX+I2PvCQFOwLjAXFL22F3V5SmLUt3iPkxd3WSI0n5Tfoive2hTDjoknzXeVPekdZPhnV
	EeINdHQ==
X-Google-Smtp-Source: AGHT+IH5J0lVnzfJ+XA5nSZo5JRaaK++ucYrsbcEBu7Tx4Bf9KxtfBIq3tLRyBoxoT//xBXeXKptbQ==
X-Received: by 2002:a05:6512:402:b0:512:b24c:dba with SMTP id u2-20020a056512040200b00512b24c0dbamr5169139lfk.60.1708519594935;
        Wed, 21 Feb 2024 04:46:34 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:83fc:439c:6f36:ce5c? ([2a01:e0a:982:cbb0:83fc:439c:6f36:ce5c])
        by smtp.gmail.com with ESMTPSA id r17-20020a05600c459100b004124907f43fsm17468735wmo.12.2024.02.21.04.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 04:46:34 -0800 (PST)
Message-ID: <863b6e46-aef5-4340-8dfe-6741b57a2856@linaro.org>
Date: Wed, 21 Feb 2024 13:46:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 06/21] arm64: dts: qcom: sm8550: Add PCIe bridge node
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240221-pcie-qcom-bridge-dts-v1-0-6c6df0f9450d@linaro.org>
 <20240221-pcie-qcom-bridge-dts-v1-6-6c6df0f9450d@linaro.org>
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
In-Reply-To: <20240221-pcie-qcom-bridge-dts-v1-6-6c6df0f9450d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/02/2024 04:41, Manivannan Sadhasivam wrote:
> On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
> for each controller instance. Hence, add a node to represent the bridge.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index ee1ba5a8c8fc..3ee11311885f 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -1754,6 +1754,16 @@ pcie0: pcie@1c00000 {
>   			phy-names = "pciephy";
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
> @@ -1851,6 +1861,16 @@ pcie1: pcie@1c08000 {
>   			phy-names = "pciephy";
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

