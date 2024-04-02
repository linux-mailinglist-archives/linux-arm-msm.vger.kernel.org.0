Return-Path: <linux-arm-msm+bounces-16046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7540895005
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 12:27:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6C531C231D1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 10:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF535B694;
	Tue,  2 Apr 2024 10:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uVsEhz5X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACE85F54D
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Apr 2024 10:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712053625; cv=none; b=tMB6e5jgsLVWZsV/3AHbuAjiAMuzmggO+DvpgFxlpx+LkLfSkx77pXJIBH/XQmqSWfNHGSGrN3XL/c8KU0k45wmK0Qfjt1RzbRAkmNrZ2neq1pdEXVD7VWLCmNkqikVsN4sF9FK7ZfujeOHGJyTQH5qqet78dyu+CwSCQuNY4Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712053625; c=relaxed/simple;
	bh=2lcDfu4xW0bculdHZpac3g3St6ttxpCAMyiLiPfvz8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ROw1k38jRhUz6zAlGshGO6StJ6Fm7jmYLENv9opXyVnQf0tM/NveIYcTeY+GmfKuj55SYRjRsPLTSgdgaZmXUBc0vDxjl4pA21ZH91LyyaSTY7kkRSKmougZWvuVwT0/2BOg1Ku175M25lwjrhoUM/URyqXG+c6bn6kCJTpGvNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uVsEhz5X; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4161dae0c02so1388475e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Apr 2024 03:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712053620; x=1712658420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eOBZ55ixLA4dTfJhYr54OdUB1MaemoFEDKwq8GCXVLI=;
        b=uVsEhz5XacY3RYea9PvmYx/oTz3KUTCz8u7FvA7LXnsaRHtGxCUsLSYCitbHlM9EHp
         gSgAuZ5m1UG1TMdaS6XUjIE4gcBIp3aqdIu5w2qACLTn59b4V8rcU/NzSzPp448KOAsh
         UOjVNOPSUc08797K7jucOhxsboprQzqzv1SU3tTgklixn2Hj05ajsLP+whD2jArOuBOE
         GIyTsMkeGC1h4bvMm/EYcWMc0m+m7IUEwEfFOo7GK3aYy/9WDzFnJlUPrs1RCKy1gCSC
         Zsg5qL9RJBK+Q7STrxNh64Cz40pfnSAIKTdLKUccO1N/ioMLtQ9HRkD8MZeU31XQMPCp
         57iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712053620; x=1712658420;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eOBZ55ixLA4dTfJhYr54OdUB1MaemoFEDKwq8GCXVLI=;
        b=kbGWQIYWquCYuOqyb9G0FSIxDWg/NUKuO0qy3cip+8U0wJc2OjZFR0snSy/trYAfcL
         aiLudOGxMKvgPvsAqjOeE8j21OqNtjs/DOMxRSbOtGQftAGQFqMsSXC/JRpboR7CSK//
         U1ZqrzmReUxQKyLUDM4qJm9sl0aeKAQY+JTgpmCDB4SAlouP9ygpUdjVAzSpMhw952RA
         9YNxvr5LY2al3REV0tosX5cnXelIJYN5uVEL6yUmUZ8oFkQ22VLH5WMDwmjteoLdrW3P
         I81993L7Y25iWDqlkHgu6ytrVQH6pHde1b4PbVmsKUOYwiVJyLsUbwGaA1k5Z1Etsxaz
         VdHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkfC9ZzZTmbKJYjRCF0q22zyJvFMxbbbIkraSxejBMbjpu0Gydzg8ETncSw9GEvX0BsFkntksfZyVB5KP1dfgbJEcJQJ6oOL1eT+kKBg==
X-Gm-Message-State: AOJu0YwPTCMyMGNP4CRUmCfHH0ymHTG/+BTf2ZSeyhdmOSyRksTDZ4gP
	kn/wI/4mf44c1pxcxwDfo8Y9sY9bfJWOzURsbaWXXCYf9jGFzl6vaP8jTnWJsFU=
X-Google-Smtp-Source: AGHT+IFfOeEwE73Mr8ZZizbJEWLfCXdGOlKeaDZvpcz6sDnmAoZebGN8m3vt0uWalY87R2DUD/pxoA==
X-Received: by 2002:a05:600c:3549:b0:414:113b:36a6 with SMTP id i9-20020a05600c354900b00414113b36a6mr9267396wmq.25.1712053620231;
        Tue, 02 Apr 2024 03:27:00 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id v28-20020a5d591c000000b00341d4722a9asm13734949wrd.21.2024.04.02.03.26.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Apr 2024 03:26:59 -0700 (PDT)
Message-ID: <c4b34be0-ac1a-4816-8ad9-7091b2834762@linaro.org>
Date: Tue, 2 Apr 2024 11:26:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: msm8976: Add WCNSS node
Content-Language: en-US
To: Adam Skladowski <a39.skl@gmail.com>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240401172153.9231-1-a39.skl@gmail.com>
 <20240401172153.9231-5-a39.skl@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240401172153.9231-5-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2024 18:21, Adam Skladowski wrote:
> Add node describing wireless connectivity subsystem.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/msm8976.dtsi | 104 ++++++++++++++++++++++++++
>   1 file changed, 104 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> index 77670fce9b8f..41c748c78347 100644
> --- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> @@ -771,6 +771,36 @@ blsp2_i2c4_sleep: blsp2-i2c4-sleep-state {
>   				drive-strength = <2>;
>   				bias-disable;
>   			};
> +
> +			wcss_wlan_default: wcss-wlan-default-state  {
> +				wcss-wlan2-pins {
> +					pins = "gpio40";
> +					function = "wcss_wlan2";
> +					drive-strength = <6>;
> +					bias-pull-up;
> +				};
> +
> +				wcss-wlan1-pins {
> +					pins = "gpio41";
> +					function = "wcss_wlan1";
> +					drive-strength = <6>;
> +					bias-pull-up;
> +				};
> +
> +				wcss-wlan0-pins {
> +					pins = "gpio42";
> +					function = "wcss_wlan0";
> +					drive-strength = <6>;
> +					bias-pull-up;
> +				};
> +
> +				wcss-wlan-pins {
> +					pins = "gpio43", "gpio44";
> +					function = "wcss_wlan";
> +					drive-strength = <6>;
> +					bias-pull-up;
> +				};
> +			};
>   		};

Doesn't look right

arch/arm64/boot/dts/qcom/msm8916.dtsi
arch/arm64/boot/dts/qcom/msm8939.dtsi

wcss_wlan_default: wcss-wlan-default-state {
	pins = "gpio40", "gpio41", "gpio42", "gpio43", "gpio44";
	function = "wcss_wlan";
	drive-strength = <6>;
	bias-pull-up;
};


>   
>   		gcc: clock-controller@1800000 {
> @@ -1446,6 +1476,80 @@ blsp2_i2c4: i2c@7af8000 {
>   			status = "disabled";
>   		};
>   
> +		wcnss: remoteproc@a204000 {
> +			compatible = "qcom,pronto-v3-pil", "qcom,pronto";
> +			reg = <0x0a204000 0x2000>,
> +			      <0x0a202000 0x1000>,
> +			      <0x0a21b000 0x3000>;
> +			reg-names = "ccu",
> +				    "dxe",
> +				    "pmu";
> +
> +			memory-region = <&wcnss_fw_mem>;

For preference and consistency "wcnss_fw_mem" should be "wcnss_mem"

The ordering of the compatible/reg/interrupt is different to 8916/8939 too.

I'm not sure which is currently the preferred order of declaration but 
for V3 of this series would appreciate if you could find out and add the 
comment to your cover letter.

Otherwise LGTM.

Please CC me on V3.

---
bod

