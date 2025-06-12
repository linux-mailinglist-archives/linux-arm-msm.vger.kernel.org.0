Return-Path: <linux-arm-msm+bounces-61113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59969AD6E59
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 12:53:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72BC717A6EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 10:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E933523A57F;
	Thu, 12 Jun 2025 10:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oSQqV7gI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8E123D283
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 10:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749725538; cv=none; b=hiq2TWngQR1pJAmBnl9EuE53IEr4rxw/8MTkqss6KrtcVScqCUZbt3uNiLqFjnDANQqaCkJHqOeOyW9aDBmg5TAAkPAdFwYmjF+KgJDUztr2KJv8/Mg2eFfkK/Th50b7cxLtq/boa4gBR/qqCiBRdSaE2k593P3iGQGAvTmvDEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749725538; c=relaxed/simple;
	bh=3q7KrM2yr9Qp5xOzjAGUah6k2lgFj7Ti8ba/dxXSz1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kzIcNpmprKwJ8gtJVKovdHyQbuljSi6B4SpFgH0mxyOX6WadIl7fV9ocUWKNGdPPPbS0tmwmRrGOtedWQJyPKKBX2twSz0p1vXLYac2mX1gb3aQfEJ/ktpouebguGDS2tXt4EPzMnP3d30+pPGGUnR+DrTE2XxOdorKI0WVdGe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oSQqV7gI; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a524caf77eso116115f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 03:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749725535; x=1750330335; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8o+4gAdaAZ3mryG31eBLn6EnhTDheXuGJ4iT2AxzWmI=;
        b=oSQqV7gIWZ02TdJOR82IlaCjwMklahhYQlhX4QVNa8x9kFqAV/2L7bxfDQqdY0JH45
         /tdyIx6Nqie/RWxumctgz/GqImtRTV9LUSxxq8bC0akIx0TrfzW4DuwiPfL95n4i69Lf
         yZhVbI4qHnxcKPPXaWiccNGnBbOC/2ujGKeqjlZ5jYFD9IMpHCcISAuqXR0vyxA/nBiZ
         BzSYVhEf6JPP60dcf1qfkwbz/Tp3G8hLspxBTIzXA+o7whZTan0Ca4cfmnOkSdgNaId0
         p7b4jpCGuC9yMx0Tkp6zlwMiaJyP/qq/R7ra9+EVKDyDSZLL68VBRgmaUzuwTlTDR++U
         RvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749725535; x=1750330335;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8o+4gAdaAZ3mryG31eBLn6EnhTDheXuGJ4iT2AxzWmI=;
        b=mt41a9oL+c6Uedk3YkVE2fGlKSx8ZfGvpzHbyZ089e9oz8PSjAE7LVWws8vrwI8YNH
         XkjQC0cf5sMfdJEzQaKaz5LGzge6g9p2cIBOGy01kIg8LFMj0SRAwK/fX8Y+dafYOU+G
         +2oILqpbXeZVFMg9f++IiPdIRGMkl3SJryAOl+5PZnkz2GaD4lu8qX0oxJIferj6NUyh
         ZFHxlJESVa9+gh+048Uc+JzxeNjJbd694/CqecyJQLEqDoxQvD5KNP1k02xSkiMa0AiN
         Uv0gc5xyGdbFuNyguAXQA9+LaXNyqZc87Runf+BN5YxC8vI+DwUtt2L55RVLpTcPYqLn
         FJiA==
X-Forwarded-Encrypted: i=1; AJvYcCUGBh73GOdyBCHjcsiI6TdN3RaCpISenISUXrQ0ETN1DInISjvDTMXc30pJ68wsOzJ15IpjZnElcfl7w4yv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8t/X4sa6ncmLHF4EeR7eguhUmMKslvpnsIHiuyccAcq2/5w4h
	le2Wa8ObquXCGvIw2bBiekhHJjtCgEaB0ioQ594MM5WymghsPnYKthm2TE/JZ/h+ZLk=
X-Gm-Gg: ASbGncthtKTknAF+d9oejo5Ua5Kuw5w5m/gDV0IDFycLBB7Ma8f4uTN7DZ55urRVpvo
	SzRQqI6OpyMry0kg19B7Y//yZcc9AU1rNuTLodsPLp9giySfymS+DwNHDD3WGky4m0Z4ZkCOov8
	RrlVfen204ZFZCboJL790k4x9MMKaY1olW5Kqy7IbOT238bk7PPuEeoRPbbwglt/BHBFlhq1Vnx
	sRCDl/RU5Fwg4Ose/zxLdGRvqC5LBD1q+Jozmq2awv+1NxjypKFndFHKPnJZHnEzWU5b7SQHgNb
	EkAjQyd2j0mkirrBKGCtFnn9/ecYsdpxaTq/IWdcZtXVHUAl9JTbxjBoKV1xxZWyqrvIBP45ito
	wCRHblmI=
X-Google-Smtp-Source: AGHT+IGa1ALw/a8BRBzg2LWcl5urXQ/xKDMV4zRDfhmzQSWXFyWDavOAUlvOxtW5OpAy1V96OWFxWQ==
X-Received: by 2002:a05:6000:430a:b0:3a4:eed9:753a with SMTP id ffacd0b85a97d-3a558823cd8mr2189896f8f.13.1749725535080;
        Thu, 12 Jun 2025 03:52:15 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e16e550sm16778845e9.35.2025.06.12.03.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 03:52:13 -0700 (PDT)
Message-ID: <91c11e62-b0d4-40e9-91a1-20da9973e415@linaro.org>
Date: Thu, 12 Jun 2025 12:52:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v5 00/18] clk: qcom: Add support to attach
 multiple power domains in cc probe
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com>
 <174970084192.547582.612305407582982706.b4-ty@kernel.org>
 <65828662-5352-449b-a892-7c09d488a1f4@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <65828662-5352-449b-a892-7c09d488a1f4@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/06/2025 12:03, Jagadeesh Kona wrote:
> 
> 
> On 6/12/2025 9:30 AM, Bjorn Andersson wrote:
>>
>> On Fri, 30 May 2025 18:50:45 +0530, Jagadeesh Kona wrote:
>>> In recent QCOM chipsets, PLLs require more than one power domain to be
>>> kept ON to configure the PLL. But the current code doesn't enable all
>>> the required power domains while configuring the PLLs, this leads to
>>> functional issues due to suboptimal settings of PLLs.
>>>
>>> To address this, add support for handling runtime power management,
>>> configuring plls and enabling critical clocks from qcom_cc_really_probe.
>>> The clock controller can specify PLLs, critical clocks, and runtime PM
>>> requirements using the descriptor data. The code in qcom_cc_really_probe()
>>> ensures all necessary power domains are enabled before configuring PLLs
>>> or critical clocks.
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [01/18] dt-bindings: clock: qcom,sm8450-videocc: Add MXC power domain
>>         commit: 1a42f4d4bb92ea961c58599bac837fb8b377a296
>> [02/18] dt-bindings: clock: qcom,sm8450-camcc: Allow to specify two power domains
>>         commit: a02a8f8cb7f6f54b077a6f9eb74ccd840b472416
>> [03/18] dt-bindings: clock: qcom,sm8450-camcc: Move sc8280xp camcc to sa8775p camcc
>>         commit: 842fa748291553d2f56410034991d0eb36b70900
>> [04/18] clk: qcom: clk-alpha-pll: Add support for common PLL configuration function
>>         commit: 0f698c16358ef300ed28a608368b89a4f6a8623a
>> [05/18] clk: qcom: common: Handle runtime power management in qcom_cc_really_probe
>>         commit: c0b6627369bcfec151ccbd091f9ff1cadb1d40c1
>> [06/18] clk: qcom: common: Add support to configure clk regs in qcom_cc_really_probe
>>         commit: 452ae64997dd1db1fe9bec2e7bd65b33338e7a6b
>> [07/18] clk: qcom: videocc-sm8450: Move PLL & clk configuration to really probe
>>         commit: 512af5bf312efe09698de0870e99c0cec4d13e21
>> [08/18] clk: qcom: videocc-sm8550: Move PLL & clk configuration to really probe
>>         commit: a9dc2cc7279a1967f37192a2f954e7111bfa61b7
>> [09/18] clk: qcom: camcc-sm8450: Move PLL & clk configuration to really probe
>>         commit: eb65d754eb5eaeab7db87ce7e64dab27b7d156d8
>> [10/18] clk: qcom: camcc-sm8550: Move PLL & clk configuration to really probe
>>         commit: adb50c762f3a513a363d91722dbd8d1b4afc5f10
>> [11/18] clk: qcom: camcc-sm8650: Move PLL & clk configuration to really probe
>>         commit: 3f8dd231e60b706fc9395edbf0186b7a0756f45d
>> [12/18] clk: qcom: camcc-x1e80100: Move PLL & clk configuration to really probe
>>         commit: d7eddaf0ed07e79ffdfd20acb2f6f2ca53e7851b
>>
>> Best regards,
> 
> 
> Hi Bjorn,
> 
> Thanks for picking these patches. However, the dt-bindings patches are closely linked with
> the DT patches in this series and needs to be picked together. The dt-bindings changes adds

DT bindings are the DT patches. What do you mean by DT? DTS? If so, then
you introduce regressions without explaining this at all in cover letter
or patches.

> multiple power domains support for clock controllers, and without the corresponding DT
> patches, dtbs_check will give warnings.
> 
> Can you please help to pick DT patches as well?

Please read soc maintainer profile explaining how DTS is being organized.


Best regards,
Krzysztof

