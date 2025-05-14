Return-Path: <linux-arm-msm+bounces-57880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D84F5AB71A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 18:39:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E1878C768B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 16:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D0427C15A;
	Wed, 14 May 2025 16:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sW83iroB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4D427EC99
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 16:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747240732; cv=none; b=VILwnqMB43rMlxe92/AFFgAr7jdHzNlX3BdKSgGfo2Y/1lFI5RMnKp8puRdkaZTZRxK4HqxYtsj9JBgQIBkKPpjT5+8yHVPP5Xn4TwOU5tmKOWVeuR+0xZ3UYSEk7GgGYnvkCHk6HK5Mi1kfV94ZqopzeSaIAQfmGwghrCncD2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747240732; c=relaxed/simple;
	bh=dXpnZ6HRybe9ZHnb0gl+9DoZpwf4gIs/LTIwEUxBnN8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ulbuw6Kd9IzjzyVM6tP5UHn2dJzDdFfPyAOvlWkZ1eG2Fgy8GfT+upm1d0EQDYzbMkKJEES91EH3zAP+8NKvR96XgWqWJ2e56c6B15oHiqgjjfKrxLUXVSXv5h+PgLv+J4M6az2dUP07ZalTmRIiXPCR1vVbUmRyzcBmSPHP3P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sW83iroB; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so163115e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 09:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747240728; x=1747845528; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+dP5YcbeqpFYvCKe+8FnH1GIVDVz3AECYHXjeJJujU4=;
        b=sW83iroBO8TwjntS6U4g1IxbESl/D/U+yIzc7tCwt/esnNt5gAshkN4sFQESAg/lot
         b9LpVGGKMH3QYIel09Vb1W//cERBSDvzgxe3oz/u2+AS9uFY8Ydz7mMn2RWYEIPWLobp
         SeeKj2+MEREODg/0EeAiCDyGrdCvJW7zItqnLXlukzgBZunGCUsFGL8psYiacwcfawz9
         3T/efd6oE2Ay3or+cBzYyyuGMucbHxLgG1yuSejODhj5rtUTMkT9ojS6EjwLRkM7pZ1M
         xPnTAeVKjRqpZ3R4+dyyhBhkCrHF/WrwaPo14lYpD3qIkEgiDP9N/4Fq9iBGzZBMBiwa
         KS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747240728; x=1747845528;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+dP5YcbeqpFYvCKe+8FnH1GIVDVz3AECYHXjeJJujU4=;
        b=sjOvo6YvRCFhcLsPD6T0qvmeJsxcdlKfNYTtRRDrvRc/I57jde/KXvM6Pz1uuWnMJH
         6xCC6dE4Cr4oe5WcSLM+YcoZjg3EVLvdv0uVWF8G1563IeDKzwaQM0hoDaU7O393Gz65
         3C5G/W0MHfhGBe8CnKB9YtkLAYz63S+h3lFVtf4WfRnGFBUp7v9Kutsfx2UcHemf39iE
         K9vDGMvaImtG2rzRDGHsnB5LC5C22TDiMTUX41TAV5MAU6r4hCC3+jpBci6oRncZTU1f
         xyu2pLsWXSFxxeguNKYJ89q3QPtoptRdJCxHVfwd+UonldlVl41gwu46TOlaeG+bpsWo
         ENEw==
X-Forwarded-Encrypted: i=1; AJvYcCVHfKEvRFYdU4ePgEfY+4f22+70IU+Bi9Bv7O/Ql3VcLrOlwE+9vjorLBEIIUDWTqAAxPTE8xXV++3TJpRv@vger.kernel.org
X-Gm-Message-State: AOJu0YxPHSUJNKu30QkKr50nx9fwSTUlILVtqCunpGKlSOg/zbEH9zqg
	glg7DH9krYKhHpzP0S9lRqaCWSS5yKK06kRVZcxHqpUv+R4D0FNqECeAtqG2MeI=
X-Gm-Gg: ASbGnctnjRjJktS3ErJjNCJwL7eKcB1LXD5hmt5+u+WQdRWjc5Xfaz3Dqp2t75lp75H
	zNrWMiROMoevetEF8+bSMWHNTkRB06HXftZ0FjiR8P1H8wMQFiVP37In0S4//t6Vsv8NhGmzeIO
	+E7J2TJkMrXvMaJmyMvLxltX8OVbOVcf+2tsbZ6g7NMcyLXEXbrHvSaJboT9/fclRN4cv3OEpFc
	3BRDfyM+3X8QTY88rkHAGNZR8O/TY45B9lXkyAcyHGZtNRceacQYOSc5kIUHWrXMkpyxq3dWGXV
	T/1StAB8kdPMSqNY0K4r5M2Z22CGNeoc3+r9pd27V6qT5YC0cqaoU2Lir+2H59uXrYp6DifMeQc
	bkX6Uy7dgxz0X
X-Google-Smtp-Source: AGHT+IEAkwKKEEQ70f0VyhVcMUc6RQxJdEmZDC90di0ICcfqr62LT/lvi+L8lcGRQvc66pK/aI2j2Q==
X-Received: by 2002:a05:600c:1385:b0:43d:b32:40aa with SMTP id 5b1f17b1804b1-442f20baa06mr44937335e9.3.1747240728450;
        Wed, 14 May 2025 09:38:48 -0700 (PDT)
Received: from [10.61.1.139] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c76dsm20425558f8f.92.2025.05.14.09.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 09:38:48 -0700 (PDT)
Message-ID: <8ba99df8-012b-4883-af6a-970dd9f877f6@linaro.org>
Date: Wed, 14 May 2025 18:38:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sa8775p: Remove max link speed
 property for PCIe EP
To: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
 quic_nayiluri@quicinc.com, quic_ramkri@quicinc.com,
 quic_nitegupt@quicinc.com, Mrinmay Sarkar <quic_msarkar@quicinc.com>
References: <20250514-update_phy-v2-0-d4f319221474@quicinc.com>
 <20250514-update_phy-v2-2-d4f319221474@quicinc.com>
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
In-Reply-To: <20250514-update_phy-v2-2-d4f319221474@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2025 13:37, Mrinmay Sarkar wrote:
> From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> 
> The maximum link speed was previously restricted to Gen3 due to the
> absence of Gen4 equalization support in the driver.
> 
> Add change to remove max link speed property, Since Gen4 equalization
> support has already been added into the driver.

Which driver, PHY or Controller ? does this change depends on the patch 1 PHY settings update ?

> 
> Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 5bd0c03476b143444543c68cd1c1d475c3302555..b001e9a30e863d8964219c8bd61bc328be71b256 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -6462,7 +6462,6 @@ pcie0_ep: pcie-ep@1c00000 {
>   		power-domains = <&gcc PCIE_0_GDSC>;
>   		phys = <&pcie0_phy>;
>   		phy-names = "pciephy";
> -		max-link-speed = <3>; /* FIXME: Limiting the Gen speed due to stability issues */
>   		num-lanes = <2>;
>   		linux,pci-domain = <0>;
>   
> @@ -6620,7 +6619,6 @@ pcie1_ep: pcie-ep@1c10000 {
>   		power-domains = <&gcc PCIE_1_GDSC>;
>   		phys = <&pcie1_phy>;
>   		phy-names = "pciephy";
> -		max-link-speed = <3>; /* FIXME: Limiting the Gen speed due to stability issues */
>   		num-lanes = <4>;
>   		linux,pci-domain = <1>;
>   
> 


