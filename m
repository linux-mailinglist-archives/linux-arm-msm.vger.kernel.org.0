Return-Path: <linux-arm-msm+bounces-18335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC748AF4CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 19:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45085B23264
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 17:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E5513DDAF;
	Tue, 23 Apr 2024 17:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r3n6swNb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215E113D8BA
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 17:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713891721; cv=none; b=t8RISuWINvUdv4ZESmr367Api96p0Z1ocdykigErtF+FRA4sd0hT79RI3qq648HeRQJGydkvhM2AiCy6ngjP8wKxnbZ0D3/zNBlCiA04AcKwBIIhj32SU8Ek8/ukaS8Vlmh2OlBdEU1KlbQOH35hzQu7b/rfGPyW81hRugrotvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713891721; c=relaxed/simple;
	bh=cC+dErYbmnokudp3GhDMHIAy+gc8yV+HfdxgXByLeSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ojX2/NGUeRJw0KhhTVALD65RIl+lBRpuZLfZYe70TH4gVHS3AQv4y8SoRF+asABVP8bzFo7PyGGvyKOUqFve4z5I5laiO8bGdG70u90U3mfC28eufagWLrGN88+t3qnXHj44cMwG+NZTctFRpLYZpaN9oGXldsxN0RgyAb1/84Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r3n6swNb; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-518931f8d23so6396796e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 10:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713891716; x=1714496516; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z9xHbZYIG5Mw8Eh9K4eptlqfJVILD/D23wlU1wrlp58=;
        b=r3n6swNbxTyErIdOJHqK7cJ7IVAu/yw2jzhLaKK6mIt8PBSgA2KJ2ahI4olOgv8oTd
         DzVbBeAOfMvs6OXytFCyTdOsRfZg/WFhhtr+3R3RhhhUOh8bc5/0M5FiuZ0jw/VUc2+1
         wKBk+LPTrfrRbq3KYBdwAqhHvNzlRYw2TJsflB191P6h4Z7fEyUmNn+GZRegXhNpXXs8
         aNpFKKYPkVgfmj1hBHdH19fQKVo4bqcB33CRD1jPcBBCxuCL6t7fIllO0/tH1/qQByba
         c5N9sBC5o3lhfUIlaALjFqbzW8c02QTWZRVa8aW5/Q8kT+Z4XIYet5lw6ptd6UdWNjTy
         QZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713891716; x=1714496516;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z9xHbZYIG5Mw8Eh9K4eptlqfJVILD/D23wlU1wrlp58=;
        b=bVAP4bpzjEIMX9pyyWoYzHDuWzRlnL147Jd34pXFjlar4GEWzZH6FxRkeflCqnGXQx
         8e+QCZ0Vx88/RVq0NioQrpwvunbqaC2vspP3hQO0q+SGB5PgCQPBQkS1pcyb+tdmrQIp
         MLRZo85GkS+kT0AeWbuujia1/yrytvVPQDNWhc/4AvuCdNE0mNNpVeYZKALivd+BeGe1
         qy6FLKcbvU1KMm7LaPBXcXipoQGIFyFR3w8uyvVJIeIjsX2rF84lxnHCk0o+OA78xUgk
         JJw8fHkJhFYU5oMuI/i2sgbHg0eUET5U+UPZAot1gbUHnHotXjHcoigytAkyIvd8+Hqj
         IQjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3JtMZGEwl1z0KPCmcCZTDMRQoZFtLK7ToqFZOemgZfsYS4r2JVt1ilT9mP/206MQiGGwxNbiC8OBYWmWGGfjg+UAwSqyi6F6+8EQwmw==
X-Gm-Message-State: AOJu0Yz96DeeUNcdNvmp6utLgM0UhObfBuJsX2jYrLGcBNOy7nyrxpGN
	uEAzOc6OUh+t55E/aaKwme5oAuvSC+OCc04mCCLuzNylebzUKhGe8bbHZVOdGgE=
X-Google-Smtp-Source: AGHT+IFFgAqRTu0OiAHoCmMWpJsWpTFKQENMZbvbVW68Tnv0kqgDei+xKSGXPHh9KPd5kq4AudXVJA==
X-Received: by 2002:ac2:58cf:0:b0:516:7738:bd5c with SMTP id u15-20020ac258cf000000b005167738bd5cmr102879lfo.4.1713891715686;
        Tue, 23 Apr 2024 10:01:55 -0700 (PDT)
Received: from [172.30.205.0] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id e17-20020ac24e11000000b0051bbb1031dfsm150689lfr.182.2024.04.23.10.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 10:01:55 -0700 (PDT)
Message-ID: <a6936f38-78d8-458b-8864-543a923ad1a1@linaro.org>
Date: Tue, 23 Apr 2024 19:01:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: msm8976: Add WCNSS node
To: Adam Skladowski <a39.skl@gmail.com>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240413170317.34553-1-a39.skl@gmail.com>
 <20240413170317.34553-5-a39.skl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240413170317.34553-5-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/13/24 19:03, Adam Skladowski wrote:
> Add node describing wireless connectivity subsystem.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---

[...]

> +					wcnss_wifi: wifi {
> +						compatible = "qcom,wcnss-wlan";
> +
> +						interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
> +							     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
> +						interrupt-names = "tx", "rx";
> +
> +						qcom,smem-states = <&apps_smsm 10>, <&apps_smsm 9>;
> +						qcom,smem-state-names = "tx-enable",
> +									"tx-rings-empty";

Since you're already going to resend, please keep one entry per line,
this fragment is very inconsistent

looks good otherwise

Konrad

