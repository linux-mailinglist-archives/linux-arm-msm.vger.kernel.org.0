Return-Path: <linux-arm-msm+bounces-88133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EF2D05526
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 19:04:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9E6BF3040E04
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 18:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE902EC561;
	Thu,  8 Jan 2026 18:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KmC+qQSK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41FD2F6192
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 18:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767895238; cv=none; b=pCdpLY/F68TZzsZHN6QxeNp81C1bP/1LMEgCc0fQKAt86Ju74YGO3ZelFqO1dnNWaBpzP1S+DRPnz5+YEtpMjOKjBHFU9T7twwZ6jZLzH3BmKMVbYbM5WjqudIAqw8KTHM3i2xWuW8Spp8AAPqD7ausAJ01Svfkf4urjva61E7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767895238; c=relaxed/simple;
	bh=4q2hThg3werotHLfpC+sN5348fUBtSIP6idFDs0Fz7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S2C4BKbt7t98P334CdA48qKiaQI4qEYA2prj1sPaGH5YDT0WFvVR2lzcgcbfO6HyGtFfbuhFAYKnho/iuryNGpWw7avoRJ64iayeqC/RlVWejVKx8U4w2AfjMy9ZapkKaRelHePxHx0yAAGwSJYjask1J+Rp6ydCh/nSMHv52yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KmC+qQSK; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-382fa1044f1so2549961fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 10:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767895230; x=1768500030; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhlnaInJi2Ti1nW4JiAtuSVV6JnSluHX6A1lu+ska9g=;
        b=KmC+qQSK3t9FNovOcC4kQXWiU5VX0+FwY1tF7Wxi0JAvPG1mKj/xoDrW88K39yRFB+
         kfes+YrD+4CXUd7DBsJEAe3WVJ/ei8LgxwonKbZvi5HDiiZKYhP2yLDxEBuQhZgYZuiR
         bxe/zJka9+4E+9pNoMLtZoW2X/+MGVwbc2/smvHyF2+Gu/nxxnUql9Bh6faaF+sVaSdT
         i78urWI8405e/IrLCrjz3idxuXsGZy1nZ0pmTZYtn/gYKrAJtqPT/hNi8JVrqya5Iw/z
         jp+cY3arGMSSfr/SIv4rUHnjr1H71yF9tySiBP6/sIoOW1in/qcoC+iEgXMj2Q0xxfI5
         xcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767895230; x=1768500030;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mhlnaInJi2Ti1nW4JiAtuSVV6JnSluHX6A1lu+ska9g=;
        b=ofP8EsOnlaUyiJhjIT9BS32/sjnPZy9CJwe85oS+xUmsQqimaOUYoafRXLa3f8K8Iq
         I48uQP5hP5b9g0Wi6sB+AIphMJVwPi6cDMYIr+l3T5MSjz46aMLcQUpA/lZUpF3GxeBz
         hwSsmSNe6U3f/oN+n+A7oYOEOEEocI4nBlR0tU8wHt/4o2uyQCcF7mWwbwbmapHhi2dV
         lkVSbBTlySoEU+PeLxsj+FYUH83lkUay+SdWlfbmid2ljtP42919ofFRLzyWD1MDry4c
         J75HXbybE4K4sVixXL08/1/SI1XRmLt2DpZG27YtUJVsP6QI20zYyJ+z0M13wSQbm/vr
         10CQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5ehjb8EFbl6++K53/BestWCvKeOOIJFwSccQREKeX3Kr5pCguCm0GRZukjSXNVTuRM9Q4Mdb7xiDMLlFY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9+EUNiLLu0FdDHcmDgFeRbtcuhx911OneWGHheblKuFX4keRz
	bFFg442CBFljLlRCggsxYXe4FTnNG+K2iWf8rj8WKTzpYxTRPJmzMYTo8iB7POYysFs=
X-Gm-Gg: AY/fxX7jpq9ZPMA4HHyH6yjqTV7ITtzWC4tHByqyf/AHKhMuvZnO+Zsy+iqbk9xoiMi
	MbDdeey5pfYstvZpWL47DK049PQ9whwwPhImhgXEPKwiROkVqxOgWLww7MHZIteXgIpNDZoe4lW
	XUeZ2Qa5Qt3H0WzkTCBZihPAfpB99NKmxTi/liuAQti5ULMLRAnQRfQxkzOC7TRshMghv2wIeGN
	cwP55en3FuLHNVjCBfgkTnKV94FHstMG6t/89lL+kqgU9Xet5aHSrdXJ9IHpmRXTsUPP4DpFBtR
	u54BmaoudwwnPfuG5JLBYdk5HDO7Jsi23ucMG/bhUvCU6uX8E6MhTqC8tm47S2bLxoIleFpkt5+
	rIuJ228M8JfVeQjRglO05DxwTlS9ofA7q6xqX9Zr9UXB6FFOindtR09dpqYf1c+dI0sDC6zqpb0
	E3qPPAKEgDeMnkVC45+9Pjyem2/i6uCbRzaT3OyZwCppIAHdFheBcNodJzgiUUY0zGCw==
X-Google-Smtp-Source: AGHT+IHHX3wRzfUoaUEmzNOgRLptj1H7TP64m5XcjU9ZX7xNCiPigAevIKuejkX3sv+AYgSzIo5gIA==
X-Received: by 2002:a05:651c:2228:b0:37f:c5e6:7ab2 with SMTP id 38308e7fff4ca-382ff87a949mr10487561fa.7.1767895229544;
        Thu, 08 Jan 2026 10:00:29 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb39fc5bsm17905471fa.1.2026.01.08.10.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 10:00:29 -0800 (PST)
Message-ID: <a69b577c-dc3c-4fa2-94cd-4aaafeeb8240@linaro.org>
Date: Thu, 8 Jan 2026 20:00:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] arm64: dts: qcom: qcm2290: Add pin configuration
 for mclks
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
 konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260108170550.359968-1-loic.poulain@oss.qualcomm.com>
 <20260108170550.359968-2-loic.poulain@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260108170550.359968-2-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/8/26 19:05, Loic Poulain wrote:
> Add pinctrl configuration for the four available camera master clocks.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/agatti.dtsi | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
> index 992a157c571f..7815ece261ea 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -604,6 +604,34 @@ cci1_default: cci1-default-state {
>   				bias-disable;
>   			};
>   
> +			mclk0_default: mclk0-default-state {
> +				pins = "gpio20";
> +				function = "cam_mclk";
> +				drive-strength = <16>;
> +				bias-disable;
> +			};
> +
> +			mclk1_default: mclk1-default-state {
> +				pins = "gpio21";
> +				function = "cam_mclk";
> +				drive-strength = <16>;
> +				bias-disable;
> +			};
> +
> +			mclk2_default: mclk2-default-state {
> +				pins = "gpio27";
> +				function = "cam_mclk";
> +				drive-strength = <16>;
> +				bias-disable;
> +			};
> +
> +			mclk3_default: mclk3-default-state {
> +				pins = "gpio28";
> +				function = "cam_mclk";
> +				drive-strength = <16>;
> +				bias-disable;
> +			};
> +
>   			sdc1_state_on: sdc1-on-state {
>   				clk-pins {
>   					pins = "sdc1_clk";

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

