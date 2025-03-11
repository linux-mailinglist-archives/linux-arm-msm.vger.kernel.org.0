Return-Path: <linux-arm-msm+bounces-50955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 731D4A5C08E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 13:19:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E79213AD53A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 12:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9719A256C87;
	Tue, 11 Mar 2025 12:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P81ZsbtE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7178256C8F
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 12:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741695059; cv=none; b=Tc00GhrmD8MFwQKJ4EsxAoPvjCzeHqMFtGCz8qYGYPFktHblrVheX8oz3WwfMmzuG7NZZks93Kmqj4hxpvU2Lb9Pd3/GMMDGdxXsGMzOBS0SDikG1ajufeL9UgnIQjG9WhCBc9SRqcoPlVljszZZjRVvu2oVR3/vQKFamJjfXOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741695059; c=relaxed/simple;
	bh=zSPwxXlU8zKoR89yCExd+rmcWFjM6s7206Ph0rFGYxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fgmFV7H2S5zinR1sP/utbIdPrkroG0/z2q53OPFU+Hhp0qcfPz79cUQccmUaWdOReii6ZoQqlMX1OmBgf6Iic/sJKGmPwBDpViCZq+TmwrTA03f+fjEqEoz2EU9gajHoNn67Qoj8qPVWBJHym63MxWri4OkJG3qwtbSOylVgx64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P81ZsbtE; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac289147833so436223666b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 05:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741695055; x=1742299855; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YpSRq2NhGx61IXcChX3O1OuFIQ+cWb4jvdaEjASRrWg=;
        b=P81ZsbtEk7no/75QuS3gtdwkbY1wNkAiNf6mXZCHVfVN3cefBJJBpKFSWT6HodgyX3
         Z0Vl9FyLYjTuml//dDN5jEGGGYlv2rik+eS2EMj+2OzKBBSa9sp/sD40JW9cNisWGNkf
         j+zNmKd/uRoHCgWfsSG+rJEEiceXRwcdxsaqJ/pJZ2MhDeFcFGOyGswaS5nr0Mwp6PVx
         vVbn2bMH18rGqcfG5zcUGbQnfOkFLKHyKG/j2hKX6lEj6eCkPiGtM4BystLmL5pZczH/
         15kUUPbh7D9OWnOeR0a+CnA3QrMLf+oqBI8LN/ySKmBqDhosn7GOgdKQkCA9nYNBtV8s
         td/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741695055; x=1742299855;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YpSRq2NhGx61IXcChX3O1OuFIQ+cWb4jvdaEjASRrWg=;
        b=rnygmSjjBeu0bZlXGdFZrVVV7XfWvd5nbxt1d/mKwKL1/A3j89n6OxgI6yyPzRd/Ra
         EKJjpe8NAC8HIQKupvpcc1enWeSamj9q+ExPmTIO2nmECfE3lBT9dduZZY8ywIUHayXy
         ypTwjtuJLWmyzKmrHk0eljaWhhC8rf6TZa+Fy04ABAk32DXmlztPHoTOoNRNrP8mnp1c
         dYlr1s4O9LVyqHYT55Z5gyGD2AdRT/V5khgIsX2BP2Kh32EIRZNSufPxCrTEh5aKVN7B
         Wg/Dltl2Uqele9YbHSqhhHbUEDcO6VXGEXXPxpUNdE2CAjHKcshETQhWbHUnLj1v4Gds
         lOrg==
X-Forwarded-Encrypted: i=1; AJvYcCUd6ScpVIfbbBxrYKVvQfht3fzyeJK+2t0DqBLjt/LkwgFZr/qEFDsifnWIxPVrtWprXaSqhgDPpBdK99fr@vger.kernel.org
X-Gm-Message-State: AOJu0YwPaAakkIyxuMUl9HnSeDbQW0EgipuaWuCF3mxjlSkN8zytoj+f
	aWIanlhPRP5oGA2OAnGzEoPDJww4D1FVNglW8jTxTn3p5/8bIPHVqFDHlF2WmGc=
X-Gm-Gg: ASbGnctgX7FsSV++2owRKoxYb65f6VSlpufqcygsAPQTPgeA+pANqTi/cAKBCUNkaxL
	+qd1fbGXV8L9HEaakq0UDowYt0te3RS4m7NqBS6Jmrmg+MzA/so6hRwH15UDs+HkefgbJ5EMd62
	1muWrw4zFQBmlZgbvOp1hn3bGeX1b5KwhKTYUSHWMndGyQQpuTv8bTN0FL2mfvwV/84cpeTzSgz
	duJ9hL/k5p/seAhGC2PeAJZ5mmgPuzfs/UdiBhyMEJcKYukWLHWP2WdGlaG4V6wf0LF1DHxVJBs
	lb8B00crC1sLHkxClg96AP4XUtf/3wEt9Pxjhdu/xuMfGjdQZVamiRN+78DlQFJRleCHEAtQdC2
	yNY3wOfDzUQgnU5bPz6yW
X-Google-Smtp-Source: AGHT+IH6Ya7/iCUCKClbjsY4uNuhgYuKstLNpNY8OIGUfaJ0U+i2tVi/bJHr3Ky/JoXqb2hyREP3nA==
X-Received: by 2002:a17:907:3f2a:b0:ac1:d91e:5596 with SMTP id a640c23a62f3a-ac25265915cmr1973198766b.23.1741695053409;
        Tue, 11 Mar 2025 05:10:53 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a843884sm823958566b.102.2025.03.11.05.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 05:10:52 -0700 (PDT)
Message-ID: <9e6fdcfe-3c6d-44c7-95a3-7652c0650bf4@linaro.org>
Date: Tue, 11 Mar 2025 12:10:51 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] clk: qcom: Add support to attach multiple power
 domains in cc probe
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <CMTYKKilQJYeHUYYKvlqnwv4Q2P-58Ic1v1ndS9HQ8Yhq2xpHuNThibFDjXDEQ1PyNbx__f9BVBr0peoTUdvPg==@protonmail.internalid>
 <20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com>
 <5a45fd25-74ed-46e3-b0e3-5adf92b5e9f7@linaro.org>
 <46d4f090-3e31-414f-abfc-3d1018913c56@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <46d4f090-3e31-414f-abfc-3d1018913c56@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/03/2025 10:12, Vladimir Zapolskiy wrote:
> On 3/11/25 11:52, Bryan O'Donoghue wrote:
>> On 06/03/2025 08:55, Jagadeesh Kona wrote:
>>> In some of the recent chipsets, PLLs require more than one power domain
>>> to be kept ON to configure the PLL. But the current code doesn't enable
>>> all the required power domains while configuring the PLLs, this leads
>>> to functional issues due to suboptimal settings of PLLs.
>>>
>>> To address this, add support for handling runtime power management,
>>> configuring plls and enabling critical clocks from qcom_cc_really_probe.
>>> The clock controller can specify PLLs, critical clocks, and runtime PM
>>> requirements in the descriptor data. The code in qcom_cc_really_probe()
>>> ensures all necessary power domains are enabled before configuring PLLs
>>> or critical clocks.
>>>
>>> This series updates SM8450 & SM8550 videocc drivers to handle rpm,
>>> configure PLLs and enable critical clocks from within 
>>> qcom_cc_really_probe()
>>> using above support, so video PLLs are configured properly.
>>>
>>> This series fixes the below warning reported in SM8550 venus testing due
>>> to video_cc_pll0 not properly getting configured during videocc probe
>>>
>>> [   46.535132] Lucid PLL latch failed. Output may be unstable!
>>>
>>> The patch adding support to configure the PLLs from common code is
>>> picked from below series and updated it.
>>> https://lore.kernel.org/all/20250113-support-pll-reconfigure- 
>>> v1-0-1fae6bc1062d@quicinc.com/
>>>
>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>> ---
>>> Changes in v2:
>>>    - Added support to handle rpm, PLL configuration and enable critical
>>>      clocks from qcom_cc_really_probe() in common code as per v1 
>>> commments
>>>      from Bryan, Konrad and Dmitry
>>>    - Added patches to configure PLLs from common code
>>>    - Updated the SM8450, SM8550 videocc patches to use the newly
>>>      added support to handle rpm, configure PLLs from common code
>>>    - Split the DT change for each target separately as per
>>>      Dmitry comments
>>>    - Added R-By and A-By tags received on v1
>>> - Link to v1: https://lore.kernel.org/r/20250218-videocc-pll-multi- 
>>> pd-voting-v1-0-cfe6289ea29b@quicinc.com
>>>
>>> ---
>>> Jagadeesh Kona (7):
>>>         dt-bindings: clock: qcom,sm8450-videocc: Add MXC power domain
>>>         clk: qcom: common: Manage rpm, configure PLLs & AON clks in 
>>> really probe
>>>         clk: qcom: videocc-sm8450: Move PLL & clk configuration to 
>>> really probe
>>>         clk: qcom: videocc-sm8550: Move PLL & clk configuration to 
>>> really probe
>>>         arm64: dts: qcom: Add MXC power domain to videocc node on SM8450
>>>         arm64: dts: qcom: Add MXC power domain to videocc node on SM8550
>>>         arm64: dts: qcom: Add MXC power domain to videocc node on SM8650
>>>
>> This list looks sparse.
>>
>> - camcc is missing
>> - x1e is missing
>> - sm8650 and sm8750 and both also missing
>>
> 
> Since there are concerns about DT bindings ABI change of CAMCC given by
> Krzysztof, likely CAMCC changes shall not be inserted into this series.
> 
> -- 
> Best wishes,
> Vladimir

drivers/clk/qcom/camcc-sm8650.c
drivers/clk/qcom/camcc-x1e80100.c

In fact we appear to be amending the dts but not the driver for the 8650 
here.

@Jagadeesh please follow up.

---
bod

