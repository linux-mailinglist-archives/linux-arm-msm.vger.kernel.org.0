Return-Path: <linux-arm-msm+bounces-85163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A7271CBB523
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Dec 2025 01:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0779B300DA75
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Dec 2025 00:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5021758B;
	Sun, 14 Dec 2025 00:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N+GfDfPZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0203B8D78
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Dec 2025 00:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765670975; cv=none; b=r8/MZ2AVE81uBDp5kTZM7r6tdsltVn84wqOVlgRdkHIF0ZIRc4ArsMO55j1NCnD7hLs7LjeBTD3FW5931E4JK9bQ3WUxYnrEq74rgrzuWDjYqFzyH3PhhRiTwaFgQOjGqlvrAdUpkOtGOfJ0OT+FSNeXz437aHnisXS9WkJIbe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765670975; c=relaxed/simple;
	bh=sgNSVyUVIlQGl+4yq6gFL7+dAkwlztttag9JjuKcAB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iTmVkeXJlAlvCnH798KNx8iR/Z0aovPxGdsG0EGGLT56q9RoxlTig/StHEucRuniWuDLGRcYadVGQfEfRkAEqvTnhKXx/fTy2tpJ37xSHQnAL2XNYizCGw8oxYC0u/xpcyKGRzxRGDxmQwujH0M04eOdocpSilVVu2HPfKLhgWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N+GfDfPZ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59474f1308cso228839e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 16:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765670971; x=1766275771; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLbZpeVWxhUiA9xdv2yvpF5kwmnyurNX54Ve7q/okuU=;
        b=N+GfDfPZ87JYzoR59zM/+8WfSjy6WI1X/m+CBQAkxW4lS8KmXuwjgzu/fYI26l7zuX
         jBbdwEIqsNeqL/WR5gBE8iPXBG1vATlGosqrrorghFnDk0grJo3Apn4UTA/yasAtlhZc
         tZ823kTOA7XjwITOE8/TacFEp+Jnkyu/BSRPR7C64cPc2zTBzHGnj9ZzvWJuJqH2EHY+
         wcHZrbGluVeoIMLrknyj4XhVa+Gj7E3K+RVIhjgWkMgW2VuELUm2iP9P2bCdktgCYeml
         dXX+q9zYbNDJbRdrItlmjlE22mp/z9dPEUEvOyvLvyN+vUGius4u7Fxw9aus2xx92VQz
         yILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765670971; x=1766275771;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YLbZpeVWxhUiA9xdv2yvpF5kwmnyurNX54Ve7q/okuU=;
        b=Y7PkAXCX5EM4xhAqr+5RfCk2FF1P0CmZiJMJ2X4+r9QN1142cUcxS8T4M4nBDKAsBu
         GSB8Co8ReKHKAhiUjpJxsqxHYQVZPAQxy6ndXfR1EuOrg4dBeW20pbdwEALrIett+dzx
         iDaSwFjlR1cw+tik36/uu3qjwZGMOlrJTArz4BIco3kYyVOoPNFHSbJRZycRwuDNxt3I
         IexbeDJxtELKxK/HC0On3ARh19MIBuH7hk4pS4ZoaWerEDxPO3pdJ0LdnobjtK5kI2mK
         YY0ekMqHdkTsO5PmXB/+j2nEYB1RqeszGkDMPveeYTpXAnNY29WVpsmWXym0m8ZDoE5r
         k4Mg==
X-Gm-Message-State: AOJu0YzHdxCi+Xn9WhphdIHmPHqE6MEitvZ9fLUrYTJrC0hM9UmUrNWl
	hnfSFeBYZzRz6cq/bvSNZXsqhqDalaHP+C0xPQ2ZmbAkwvJZJ06Fpsm8U5YojlQuIY0u85goxgI
	dVuPC
X-Gm-Gg: AY/fxX7fNHz1NferOlqG0cXbw5XoFSaAz/IPxlywrIPeHBEuQXd1OPuqq6Xy07TKJim
	b+VXfntzZDyv7Dq8pdplml39s2rScNg6let64hdTnQBeROBoIxMTJAC00vT187f02GV83foI/sz
	bq4GDJSTiCeGW0saRlF5TNgaLeXH1akRuyGCoGR2NB7bT6xpTf8ot54RadDUPu6C56KCKpDz4D1
	5YPUGffo7iDWrDosL2rK1y6sj4a/hXje6LEjCxe/+2LuEQWbEH1hN4/Kuv3LdGmkYdAnc68qOuv
	EMlRwM/wL6ITJnLHMaB5af/sq8pLsNqD32fI1/sncHAP05Y+B3huseuUgvWtEsVjaQraQeJGJmu
	JYrsQtwEXtp2BKDO3NfVbhAKYP5qOyb6tHXqqzZBz24Y7j2iarHfDONc3CCIbtYw6DYXvY1j81N
	GbU4KSzAita0L4Z749AmL8rGMUr4hS9TC6wYbc/EqH6tjTbZMYAOOPXq15jQnGcaVMaw==
X-Google-Smtp-Source: AGHT+IGa33buz/rmba0bIG4qV9RX3OHMcGRTnZkr8Mbi7xgjdbVEw2xZ+1nY7hVGxnE3RNPMJLjOOg==
X-Received: by 2002:a05:6512:3d1b:b0:597:d7d6:398d with SMTP id 2adb3069b0e04-598faa01850mr1324255e87.2.1765670970598;
        Sat, 13 Dec 2025 16:09:30 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f3194dbcsm3464122e87.78.2025.12.13.16.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Dec 2025 16:09:28 -0800 (PST)
Message-ID: <2cb8c5ce-ea80-4cb6-9bef-f526eb433d96@linaro.org>
Date: Sun, 14 Dec 2025 02:09:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: qcom: sdm845: Introduce camera master clock
 pinctrl
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251213-sdm845-mclk-v1-0-197bc947d4c6@ixit.cz>
 <20251213-sdm845-mclk-v1-1-197bc947d4c6@ixit.cz>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251213-sdm845-mclk-v1-1-197bc947d4c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/25 14:00, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> There are shared for the whole architecture, so let's define these in
> proper place.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 43 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index bf2f9c04adba7..97bd9513b011b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -2805,6 +2805,49 @@ tlmm: pinctrl@3400000 {
>   			gpio-ranges = <&tlmm 0 0 151>;
>   			wakeup-parent = <&pdc_intc>;
>   
> +			cam_mclk0_default: cam-mclk0-default-state {
> +				pins = "gpio13";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk0_sleep: cam-mclk0-sleep-state {
> +				pins = "gpio13";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
> +			cam_mclk1_default: cam-mclk1-default-state {
> +				pins = "gpio14";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk1_sleep: cam-mclk1-sleep-state {
> +				pins = "gpio14";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
> +			cam_mclk2_default: cam-mclk2-default-state {
> +				pins = "gpio15";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk2_sleep: cam-mclk2-sleep-state {
> +				pins = "gpio15";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
> +

Please remove an excessive blank line.

>   			cci0_default: cci0-default-state {
>   				/* SDA, SCL */
>   				pins = "gpio17", "gpio18";
> 

Please add mclk3 to the list, it's one of the gpio16 pad functions.

After adding that

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

