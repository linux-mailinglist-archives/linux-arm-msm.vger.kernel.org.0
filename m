Return-Path: <linux-arm-msm+bounces-2591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BAC7FE2BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 23:09:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F5DB282210
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 22:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DECC4CB5C;
	Wed, 29 Nov 2023 22:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uR1+J9eN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1700DB6
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 14:09:29 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-54bf9a54fe3so103883a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 14:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701295767; x=1701900567; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8SYJPO3WANXfLrJT96QPXJOyEPmj0+YqiIB6d1PVgyw=;
        b=uR1+J9eN/VdCXJ8T/LaFR9/hBTt/xejL9ACeYf1Pz4XT7GlF9o1B9YXHjasKhHsg6d
         qma0pOiSXdO7zR96+C2rs4s1MokJWds5IsxrV82b516MFo+o6FBTHB6v0kvCwm+P8gr7
         pID8seGi4fyObRIKRPtv9f/efbeW8s7vJp06kw3OzFBKv+TZkdDSts3F5DQF0109O916
         U5M+XhuMlmBEl+ftFfFMvMcUaWv102e9tudUwTH3mbgO09yk+y4RM1spNqUYTTLFPHbG
         Vj8+kmRNgJTF4Xp2C42mNr2vzrOcOS2G/yRyNKSD7NMWEK3uuUAc3FePVazdK5B398ut
         Lk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701295767; x=1701900567;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8SYJPO3WANXfLrJT96QPXJOyEPmj0+YqiIB6d1PVgyw=;
        b=r6WovCyN0NfPkSl1WdGMrzw3YsY8eVsM2oq1av1pOr4fu2xH6Gdm+cR/SN1cdkGWTa
         NvqckpXM9YG8f70oT3VZtGy7jvYQhi+NGiRWSaZVsG/wNvrYu4jvUFWVCyTffjzEzibc
         NC5KQXMd3QQClyrguLJT6MqGun4nHbNzQzr00hi6OzD5Tjfb1/4lj9VfLB9btyQrITvc
         BeHUsbkOitPUBPL1f3NRSFp+s3JxOev3/Vh0REhCHrlNEVbavr2QqOQJvl/LFwnL81KW
         RZTlD38/Ez7wQH+5n49DQBWTT5kJyq0keKdIXfXJIYBE1imcl56mVan96pRRJV3nHmbk
         ZJsQ==
X-Gm-Message-State: AOJu0Yym6uikwwphfMp07PJ3xCEAT1e0eaxZrXCYSyqAOS2LWHSgCAL8
	4t/dNf8weoxhlfb3b9kIt5Kmgw==
X-Google-Smtp-Source: AGHT+IENx+OW2HpeiO1gNtCLT9v9Xg0hIOo5zRVhn9ogDaRMkWtj6jEgtM7O5wLu/1O3n5RNl3xvXQ==
X-Received: by 2002:a50:fb85:0:b0:54a:f1db:c2b3 with SMTP id e5-20020a50fb85000000b0054af1dbc2b3mr14729811edq.0.1701295767566;
        Wed, 29 Nov 2023 14:09:27 -0800 (PST)
Received: from [192.168.209.83] (178235187166.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.166])
        by smtp.gmail.com with ESMTPSA id w4-20020a056402268400b0054b2daa6654sm5165986edd.56.2023.11.29.14.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 14:09:27 -0800 (PST)
Message-ID: <498465c4-ddaf-4a90-be5f-2e3709777e62@linaro.org>
Date: Wed, 29 Nov 2023 23:09:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/15] clk: qcom: gpucc-sm6115: Unregister critical
 clocks
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230717-topic-branch_aon_cleanup-v2-0-2a583460ef26@linaro.org>
 <20230717-topic-branch_aon_cleanup-v2-6-2a583460ef26@linaro.org>
 <8318363a-7122-45f4-a42f-3f01b33457eb@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <8318363a-7122-45f4-a42f-3f01b33457eb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.11.2023 22:14, Bryan O'Donoghue wrote:
> On 29/11/2023 18:59, Konrad Dybcio wrote:
>> Some clocks need to be always-on, but we don't really do anything
>> with them, other than calling enable() once and telling Linux they're
>> enabled.
>>
>> Unregister them to save a couple of bytes and, perhaps more
>> importantly, allow for runtime suspend of the clock controller device,
>> as CLK_IS_CRITICAL prevents the latter.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
[...]


> 
> OTOH.
> 
> Seems a pity to remove these clocks - generally for the series I mean - from the debug view in /sys/kernel/debug/clk_summary.
> 
> In the ideal case we have pm runtime functional without dropping these clocks from the view in /sys/kernel/debug/clk_summary.
> 
> Certainly I've found that interface useful when launching a real product. It might be confusing to _not_ see the always-on clocks enumerated there.
> 
> ---
I have shared the very same concern in the past.. I did also however realize
that debugfs is not accurate, especially with funky clocks that need only be
enabled once (*even if you gate the e.g. MM subsystem*) and debugcc should be
used instead

Konrad

