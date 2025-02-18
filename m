Return-Path: <linux-arm-msm+bounces-48392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8072AA3A184
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 16:41:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7ECC71893EF1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 15:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FEB526D5DC;
	Tue, 18 Feb 2025 15:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="z1zSPrkR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853B52500BF
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 15:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739893272; cv=none; b=ESoAAteM+v3KMysAWQxf7lqGmw7DbwJG6DPtoWgyKXzlUGDvI/ewM62rr+/owrusu6+o6r0NvHxcVWR5/QPeyFQ4+u/OiZwOrTTyngdYL46cBgLKKe7OxPlzWwBYsnYh7igvakDIjZwiB6ot2GVo1GLCLpeWKqAe5vtd5U6siWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739893272; c=relaxed/simple;
	bh=2lp8XQ80q8YzfZF+FMF8cPlkqzqEkoCXL7zcnd5prZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qrv2fdHGvegJhlfzOoIT3IpJsG+ZQh0B2YL+gCzuGn+lIOnrv3ZmwsOMVN3fhqJVOoqXexuv7CiADIghoZ1jcLPg+eWPyvSGD8F6OiOJCu8uYbNUDpmK8uXD/DNFKWLLEDBzCv7X8AJqWcz4GengsxTi4vU+uIKO6+thhl9TWsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie; spf=none smtp.mailfrom=nexus-software.ie; dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b=z1zSPrkR; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4394a823036so59006825e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 07:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1739893268; x=1740498068; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Q30dDgKfgVMd6trtVKX22J5bpFlivRbZkay2aGYd+k=;
        b=z1zSPrkR826ZNcLA/4xd8KolRGXCF0HWxsyHcOKLSP9YqAJkV8wWuCWVR30KXoLBsl
         24/wUZmXzbFUb9C1MJqa+zsPpHb/0hIr7b/hOWabK5wLxFZUJPJvlYQjZ/N/h64Qx4jV
         kVT3BXo01H0mdXrGtC9LIl/pruabPD170d08KTht+dqXzo8pf9DblPLDjiWN7z6IrcE4
         2yBMFiwwmkrxF+/qy9oVpYXduSNqRoWaaEznHZVLFBJf+I3N6luf/Y+SKmOc/qm+gR4l
         KWL7nNjug9xUY88BD7p2jHIoWFC6RVznjzge+OQvR4dbauBVJgzeuD8mJZOyQxD/3IuY
         gr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739893268; x=1740498068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Q30dDgKfgVMd6trtVKX22J5bpFlivRbZkay2aGYd+k=;
        b=GOzdFQkJ/5xLJWkYeNgOaEU1CR9SSdNhPEcThpQsiLFB8Fd9nk1aGtqEHgQBybdco4
         Z2iGBNA0um8sgEVA4Pwk4rWQUDd51P/RnisM5YNO4yVd0fAAktw0e6kzOF9ZRKznHwnv
         uaViYkvkQqVAr+u083i/45rifYShsnf2wkKP1JRLOLKb28IVP9kgw89dBdaUvX/C4UF1
         lIMKbgtlXHSB7FbgpxIFvAIE9XuN7rjVYU+SKjqDNMLMX8bq47K0wwN0uK8xqbtgfxQ0
         /udSDUgUzRjBRMoOvu390alT7l0ZHtjMf5KMIh3rbsw4nXEQ+mzS2Wyn0396+EkhrWQI
         QoYA==
X-Forwarded-Encrypted: i=1; AJvYcCUZkQw2Y5FWw6p/FOdw4cGgZR5r01LJK7kuGN4iiXJXGjfeVl+kFPCbsevaL14Mvz4XB9pHl10yboaTNZY3@vger.kernel.org
X-Gm-Message-State: AOJu0YzdhPultBUAjDYHrJMX63tkjwSKTQt5Y6z+V6d97wO8Gw6AP8/b
	X+stLGG6fmgrrr9900Bo9HDiy+UvgXammUG4qGW22bY2aT6wwlhMOIX8z99EihUyMo0KP7pW9Ld
	o//Y=
X-Gm-Gg: ASbGncuYu4mWgZZTvmpH0/DBausv/85mC6Om1S0iI4UFn22ObIqMx0ZVSltclgGhgIz
	oReKnzSflIjdedTLRJDmMBCbFubYtKWTZ1Uaxz/dvSbSf0vMDE33X26h9gbfpNkYP/c/KiU14RK
	yN0EIyujjUm+8Wutykvnn1buBKTG4nrx1FvL74BY5RWS5Hb3+0bG+1QdvViKIt6fbWuRiZV3LfQ
	cRt17PeKuZVFgYU8J2P8+XQ/hY4L+fYqeEBonaPfJN4PGO0HQG0Cb4RCQWhTus8JTr5OZBTrSRB
	i/FXz17z2P4OejyqFc/Zdpk8RsipKegN1D8YEX5VI5Z6W6MGaSJO9K3e/28=
X-Google-Smtp-Source: AGHT+IFgVQ/HTJovzYkHnF+vnnWUMuB0Qc49CucuSwBa0CgxZYS3J4v1QXbcy58eSkagjvpjaclFuw==
X-Received: by 2002:a05:600c:1d95:b0:439:8829:aa69 with SMTP id 5b1f17b1804b1-4398829abd0mr61277115e9.17.1739893267405;
        Tue, 18 Feb 2025 07:41:07 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25915785sm15777430f8f.58.2025.02.18.07.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 07:41:06 -0800 (PST)
Message-ID: <72c01aae-33d1-45f8-94ce-b0fcfe4fec00@nexus-software.ie>
Date: Tue, 18 Feb 2025 15:41:05 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Add MXC power domain to videocc
 nodes
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
 <20250218-videocc-pll-multi-pd-voting-v1-5-cfe6289ea29b@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20250218-videocc-pll-multi-pd-voting-v1-5-cfe6289ea29b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/02/2025 14:26, Jagadeesh Kona wrote:
> Videocc requires both MMCX and MXC rails to be powered ON
> to configure the video PLLs on SM8450, SM8550 and SM8650
> platforms. Hence add MXC power domain to videocc node on
> these platforms.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 3 ++-
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 3 ++-
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 3 ++-
>   3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 9c809fc5fa45a98ff5441a0b6809931588897243..4f8dca8fc64212191780067c5d8815e3a2bb137f 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -3136,7 +3136,8 @@ videocc: clock-controller@aaf0000 {
>   			reg = <0 0x0aaf0000 0 0x10000>;
>   			clocks = <&rpmhcc RPMH_CXO_CLK>,
>   				 <&gcc GCC_VIDEO_AHB_CLK>;
> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
>   			required-opps = <&rpmhpd_opp_low_svs>;
>   			#clock-cells = <1>;
>   			#reset-cells = <1>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index eac8de4005d82f246bc50f64f09515631d895c99..a039ae71e1b7bba8124128d19de5e00c65217770 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -2889,7 +2889,8 @@ videocc: clock-controller@aaf0000 {
>   			reg = <0 0x0aaf0000 0 0x10000>;
>   			clocks = <&bi_tcxo_div2>,
>   				 <&gcc GCC_VIDEO_AHB_CLK>;
> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
>   			required-opps = <&rpmhpd_opp_low_svs>;
>   			#clock-cells = <1>;
>   			#reset-cells = <1>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 86684cb9a9325618ddb74458621cf4bbdc1cc0d1..32af2a0f7a0030f155b7d8c93faeffa384a42768 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -3524,7 +3524,8 @@ videocc: clock-controller@aaf0000 {
>   			reg = <0 0x0aaf0000 0 0x10000>;
>   			clocks = <&bi_tcxo_div2>,
>   				 <&gcc GCC_VIDEO_AHB_CLK>;
> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
>   			#clock-cells = <1>;
>   			#reset-cells = <1>;
>   			#power-domain-cells = <1>;
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

