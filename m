Return-Path: <linux-arm-msm+bounces-83387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD68C8890A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 032504E0539
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 08:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A14A61BBBE5;
	Wed, 26 Nov 2025 08:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X62FEvvS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B504025A2DE
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764144538; cv=none; b=CzhSpZDaMK2TxgYxW8ThQED0WWRh44g7aGFLOlLsUvArmbIW444Q7jRiXAvzxblNLKIDYnqNtwu6kHGkc0OY/pVE5p/joXJHx++mBKxrTa7MTBQQN/RqqUTOYUbCuVigzZ4l3FCZ7aTZxcT22FuSZegTPX4uE6sMts4dW7q7e4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764144538; c=relaxed/simple;
	bh=X0NWeEhDxK9c1xtZIo2p5JDK25WwhdJ5wrKMuEgrB8Q=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Zi/MUthKyr9xfXioRjcb086XU55eA5Q009dBQ5bOUIsJSCN/neinqe7Tu+hGh72y8Rev/2Wkh/yu6KO6/zV0Rmv2HOJzfWfxJyOcrUKeKzO16h1V2tN0rVpB4x6LAp9lNRCwhDHyNvnpC7dw+C76Qgedgsi2VRKCoHbiUdqM1uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X62FEvvS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4775ae77516so60401575e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764144535; x=1764749335; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=huhO2YIPo41zzEaxkYEEM3ehuUiUGjkMfld84whkRq8=;
        b=X62FEvvS7Z8LqNoBduMblhXYf4piCWy2MwaEx7xANM56+1N6O5sRHuPHi3M4NL28+m
         FSKTBCV31nNp6CTDQtm4QYb9eX5RSn6+zYJvfCkB8DOmd8e1OxY2yJLKO9sFYS0ss8uS
         072sVTAOHWTC471siOEH4i+D3n9A/yPUKE/tZQkKOrmvkmAoLlPQO8WPJMIS6OrRZMDC
         POIsAz5tshJS4uvbSZAwG7sttThStSl27xrjvywzNYpVk9smdecoSDkP5+rUha98o7po
         F7p3WZHoCpkGPaqeKzHV3LGTjjtpmCZ6cZGLjiX/HUZNm+ifz1SXiFK+1KuTE2iZdWlz
         MxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764144535; x=1764749335;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huhO2YIPo41zzEaxkYEEM3ehuUiUGjkMfld84whkRq8=;
        b=j3PLUNWLyAeuNU5jVld6THNJATfGht9ymSfg0kRFr/uy3IHaRoDMeFCdHy0mZDGqhZ
         igMLtkGgSyMRernVkjICSm0f3c0L0KE16ttqy8CIHwpCKa0htTQVJd6FyeDs95YpI79L
         pLOliaYloCq5tfFA/B/KwAIPUK5jOKV7TOrSsyLiiNAHz53ORWpiKJK8147/EMRQvWXx
         lrmr9H6D/79hkBHc/6bgs071PuoPKvhlR+EL7y6UdHxQPE08MNRMxn/HPLP6nc/DSrqn
         aUwCvm7GwHKnINdklVblIcKvEfrsnqZRSS8NBvGz/81FGU0tVeF7hPmmbarL4s545qxq
         /vwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUELRAhCTRtXxtWwxDlv0Wxu0kZeqU5itWapi3OeGw8ZEctRoUPwXwQkA5+ddsL37XaZ8hRkQFG/6oDgPXq@vger.kernel.org
X-Gm-Message-State: AOJu0Yx27Tf7O7goPenq6CczrYLG4ZSmV/Zj/a0xW8B7bTC85V1xtVAf
	9c4B0DHZ14C2DdEOwkm01j8v8wAvV+FXq+T17b9qjW+W0zkRcOZQofj3JabsCV0OVVI=
X-Gm-Gg: ASbGncuWCHBzlKFHR4EA1MCZNM54GPHXSpVOyZMtxBR+oyJkYSxm53zUxq16pMCf0Wu
	hmfdpkIhaoh7sm0/eP7mQ4/7eBbZcw6REWFc7LqOORW9lO5aq2dPoV2Tg7Bxr6epOpJZzuv19UC
	pEjHgwaQB6tiG9uqR3eltFC5RQCKf+6aYebWjC2ZZKKab2HrrjgEUQphjdCf5v5kfdlqtFXkmdz
	rnN8NgBKFfJQIzEwMxD7gXiOw/0uUAbCak9RjvvevpWvGHO+4XEeFrRyFF+I6AtLrINb3TLdzj2
	K8gqmFTWmAO6sa0re2I/Tqwdy+b7zK99/I5L4evKHixVfuMUGrufl57JVTbQFgfYjIraokPPjYj
	CF0Mkp70Lkg1KZOe0sB3YRMOtvamkmC7FWdcGk48UpzhyRONpQUQ1LKQFZmo0StBOV6ECc8SCRQ
	weQpsOIPYseNRR64hEgQq3KptJ0PFH062rFbjlFmg4r1alYWrKr2A81MOUdS6k
X-Google-Smtp-Source: AGHT+IEnfjN5AbXdgd40xNV3sgvMmB5Jn7VKAGKbgb0nLhgYOBbRpYb2YSDALVx+LTgXRCwr4fUJnQ==
X-Received: by 2002:a05:600c:35d1:b0:477:fcb:2267 with SMTP id 5b1f17b1804b1-477c10d6e76mr198027485e9.8.1764144534848;
        Wed, 26 Nov 2025 00:08:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:91ba:3a5e:334:4534? ([2a01:e0a:3d9:2080:91ba:3a5e:334:4534])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790b0cc39csm29227245e9.14.2025.11.26.00.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 00:08:54 -0800 (PST)
Message-ID: <3a640992-77df-44bf-8003-5aa741c68b58@linaro.org>
Date: Wed, 26 Nov 2025 09:08:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8650: Enable UHS-I SDR50 and
 SDR104 SD card modes
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20251126012043.3764567-1-vladimir.zapolskiy@linaro.org>
 <20251126012043.3764567-4-vladimir.zapolskiy@linaro.org>
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
In-Reply-To: <20251126012043.3764567-4-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/25 02:20, Vladimir Zapolskiy wrote:
> The restriction on UHS-I speed modes was added to all SM8650 platforms
> by copying it from SM8450 and SM8550 dtsi files, and it was an actually
> reproducible problem due to the overclocking of SD cards. Since the latter
> issue has been fixed in the SM8650 GCC driver, UHS-I speed modes are
> working fine on SM8650 boards, below is the test performed on SM8650-HDK:
> 
> SDR50 speed mode:
> 
>      mmc0: new UHS-I speed SDR50 SDHC card at address 0001
>      mmcblk0: mmc0:0001 00000 14.6 GiB
>       mmcblk0: p1
> 
>      % dd if=/dev/mmcblk0p1 of=/dev/null bs=1M count=1024
>      1024+0 records in
>      1024+0 records out
>      1073741824 bytes (1.1 GB, 1.0 GiB) copied, 24.8086 s, 43.3 MB/s
> 
>      SDR104 speed mode:
> 
>      mmc0: new UHS-I speed SDR104 SDHC card at address 59b4
>      mmcblk0: mmc0:59b4 USDU1 28.3 GiB
>       mmcblk0: p1
> 
>      % dd if=/dev/mmcblk0p1 of=/dev/null bs=1M count=1024
>      1024+0 records in
>      1024+0 records out
>      1073741824 bytes (1.1 GB, 1.0 GiB) copied, 12.9448 s, 82.9 MB/s
> 
> Unset the UHS-I speed mode restrictions from the SM8550 platform dtsi
> file, there is no indication that the SDHC controller is broken.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index ebf1971b1bfb..1be709204cae 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -4939,9 +4939,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>   
>   			bus-width = <4>;
>   
> -			/* Forbid SDR104/SDR50 - broken hw! */
> -			sdhci-caps-mask = <0x3 0>;
> -
>   			qcom,dll-config = <0x0007642c>;
>   			qcom,ddr-config = <0x80040868>;
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

