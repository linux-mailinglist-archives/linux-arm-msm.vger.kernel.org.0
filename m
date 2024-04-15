Return-Path: <linux-arm-msm+bounces-17501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F138A5B62
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 21:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D4A9288812
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 19:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF4D3159200;
	Mon, 15 Apr 2024 19:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c4ECtoC7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DDB1591F9
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 19:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713210004; cv=none; b=bFRJSngBQpu/KUtmBApZyufnl0TdUDS1hgDM7BLTMYxMAH7XhavoIwT2bnLWbGGMxFpHGs7CGBOLLT5H247YnuPbskDL6tOE6fBFIlSWRDTygU4487T9llxPTpqQn617HGD6Gm6la/co2evu4a8awigxUKWCJjY3QlL0EazT2g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713210004; c=relaxed/simple;
	bh=oLw1Yo8/eaqjN1EPHHKDjW5h66jbiS/C8MlDodlUxck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XcZyQKk9IYskU3/luwf58mn+NxgWxtqvwoZNDAXLMmnwhCDhBVLAD92I1QgpxjzdVwwTLXYe/CxawITY8cSx+4mYFEPmPWbMJjplegJCR5hjt04SQ5+ABv+TBIusYUqHDlZIgiuvhQ4v00utrZc0syRMJ7odlK0Zdmzv9aL5BMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c4ECtoC7; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-518a56cdbcfso3690362e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 12:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713210001; x=1713814801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t7tsrnDTZbk4SPKL6+qy7+cpPN7/TAFHKqUJ8Ysh/C4=;
        b=c4ECtoC7zON9uvTdTS7SyksGYu/Uda1RIKjrsT6qdwIef9IWrfcvZ8oUVH5gaWP3mI
         ODKSRbVKn3Hq4Er7u4tUS0ljLA74BvQTy8CWbbMgvsg+u4upXPkVQfAdvNk7fpj3ZNc2
         g+6IrNX8EGIODFPcGlxaVPIw2nLCdW9pFMKoyr5I6IVitcI9p2emwTyiwGOXz4l3Bqbs
         Ojo0Sz79l75ROgrfSDIOlednW/iRF3AL80XFirkZKNg1geEenCjW8H3kdCviu0cV6Jbe
         nLK9R+IxOK9DODl6yHc4j+XuM7xk2kglDNQAIhCMvB1BoUUd3Ku/CMXGiyGwpjsKcALE
         6APA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713210001; x=1713814801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t7tsrnDTZbk4SPKL6+qy7+cpPN7/TAFHKqUJ8Ysh/C4=;
        b=nATpK2MKne3DUFewvMko2z8b8vWVzsgNx6vTIo8ao4B6qyJYADg6NfwL7pxTo+iz5h
         gVIkNYzdK+YVzuWaWaht0z+EXxD7BWv9xlcpCZYxC5C3m3JYcebOkqBfj/SwymhmJARP
         54FERQAVJEfMB+F7MEBxqAkERC92oepNR4xuud/NP5E9kjVOXMmKvOUPseAC43vv6Tfq
         DkNOb90Ziv3aOw5TAOCAfJy6nOjX0d9ecZaU0lxPd1gNytHR/8CNLU0F1ZdEy1sA1bLG
         ZvCs3rk2K8mRRNF0981tvxNiIfqNhi8hfCBE7SI6oq02x3RJvHGqjeZv6VK/eM1E5Xsu
         ePMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpZ5Me03tNtMpIbXUcorU3GazaEAh8LDXaI7MptL1pscOGbVQ5xqsILv/EoYfnGTRdT6lHS0qOOkKVfB+hpIrc6Ye7Sw9Jjp/ZNSo9cQ==
X-Gm-Message-State: AOJu0YxTYmtMzOSIuGGJZovXnPFe4+vz9MbAtfThWjYc7oV4Vb0cWigr
	lgNr6/JAjP3eTfRx27VmojqrSDLEoKVEsQ+dBwl3fVXwG0bZPes6eH1DzJu6Um0=
X-Google-Smtp-Source: AGHT+IEvWyaU3DDSHRGhHKAWLIUQW7NovoNH7LtXjxt2ZC08B71s/35oMI48FkGtZAuiQS+3TCw9ug==
X-Received: by 2002:a05:6512:2247:b0:515:d176:dfd1 with SMTP id i7-20020a056512224700b00515d176dfd1mr10519441lfu.56.1713210001060;
        Mon, 15 Apr 2024 12:40:01 -0700 (PDT)
Received: from [172.30.205.18] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id v23-20020a05651203b700b00515bad4cd0asm1332203lfp.155.2024.04.15.12.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 12:40:00 -0700 (PDT)
Message-ID: <90b9da5e-8a2b-4a0d-bee8-bb21c74cb355@linaro.org>
Date: Mon, 15 Apr 2024 21:39:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] firmware: psci: Read and use vendor reset types
To: Elliot Berman <quic_eberman@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Yan <andy.yan@rock-chips.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
 Melody Olvera <quic_molvera@quicinc.com>,
 Shivendra Pratap <quic_spratap@quicinc.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Florian Fainelli <florian.fainelli@broadcom.com>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240414-arm-psci-system_reset2-vendor-reboots-v2-0-da9a055a648f@quicinc.com>
 <20240414-arm-psci-system_reset2-vendor-reboots-v2-3-da9a055a648f@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240414-arm-psci-system_reset2-vendor-reboots-v2-3-da9a055a648f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/14/24 21:30, Elliot Berman wrote:
> SoC vendors have different types of resets and are controlled through
> various registers. For instance, Qualcomm chipsets can reboot to a
> "download mode" that allows a RAM dump to be collected. Another example
> is they also support writing a cookie that can be read by bootloader
> during next boot. PSCI offers a mechanism, SYSTEM_RESET2, for these
> vendor reset types to be implemented without requiring drivers for every
> register/cookie.
> 
> Add support in PSCI to statically map reboot mode commands from
> userspace to a vendor reset and cookie value using the device tree.
> 
> Reboot mode framework is close but doesn't quite fit with the
> design and requirements for PSCI SYSTEM_RESET2. Some of these issues can
> be solved but doesn't seem reasonable in sum:
>   1. reboot mode registers against the reboot_notifier_list, which is too
>      early to call SYSTEM_RESET2. PSCI would need to remember the reset
>      type from the reboot-mode framework callback and use it
>      psci_sys_reset.
>   2. reboot mode assumes only one cookie/parameter is described in the
>      device tree. SYSTEM_RESET2 uses 2: one for the type and one for
>      cookie.
>   3. psci cpuidle driver already registers a driver against the
>      arm,psci-1.0 compatible. Refactoring would be needed to have both a
>      cpuidle and reboot-mode driver.
> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---

[...]

> +arch_initcall(psci_init_system_reset2_modes);

Perhaps this could be called from \/

Konrad

> +
>   int __init psci_dt_init(void)
>   {
>   	struct device_node *np;
> 

