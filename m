Return-Path: <linux-arm-msm+bounces-68814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AB8B22AE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 16:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD49617062E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 14:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583272EBBA3;
	Tue, 12 Aug 2025 14:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lEBq9h3N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5682E2DDA
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 14:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755009575; cv=none; b=AXTg0vcGDleqe6JeJi0SUC828M5xlVlWnE/EMb6nLiVNT9OK8w5Nzu/yPzQh+3ms4clD+R7TamR7PzbVhnm3SR3KrkLmo4Gn6ZrHNlzwuFLj6E6/CCLTC16MOAKJ29C1b6o8DehuKDUFXcCrUhNMdcbOX74BI7IKdQs5JSyhpUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755009575; c=relaxed/simple;
	bh=bs9h2krYimGHBRhdWNzTsStILlqiiqAf0nEm20wadXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nWnY9xPTb1ZZe9D1oEx0Nq4R5+vZrNBi4Nq7JOse2Ewtd/r9JDtfzsE+k9SAebSqhIIfW5KZvYEfywlREyecFSs7YLmbJ0sK++vfQt4QUPBXUM7h6f6PGjT2wR4pJivUjAdWzOll6kva/Mt+cw8lScueandRntb/mZTICozq4ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lEBq9h3N; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-af940717334so74058566b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 07:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755009572; x=1755614372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+GHP7xYbbI91uQJr7ucQdWhdh3ykzBIM0oSGZiOjI4U=;
        b=lEBq9h3NtO4vVzJc6HxB9lROmUeBh/bRiMINhb5tMkXJF09x5Aw8Y0rrw11YC4HdU1
         2mkhrjB44rohX5/PdLM54yzVA4aBsdP3Zeal7iVKsZNyJjaYj59LG6tXfCovwuYHzD3T
         ON8D13AZ2H6WRAFCwcEtqhxMVOBm00YVxOqcAo9E3lj8BOQuPuG6LQ8RL8mR5JGvPrmH
         8pymo9fnzzuR/A43183lWgAVzUYxQtNcrN2fcyj6hJsAepHpla5PD4pOWnSYb9mnjzOl
         3CNangc7Xx3AyBYf+vbli1Vp+3zUWI8ekMC4Lsfq1s+nkYO/tOKNGGGSHxtS2I/6TnKl
         G29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755009572; x=1755614372;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+GHP7xYbbI91uQJr7ucQdWhdh3ykzBIM0oSGZiOjI4U=;
        b=d2iQx2+t7ac+mwSrVOW0DPx+ah/RxStOLsNiSlQYeLJ7384PiLQ9VvFFW3IY1oS+L0
         TWhtdpUjXGhdrqSJi/C90HTtIuRApvyiWcCGsAnMtAscBMsXybBkTombKXrHK0lpbrSQ
         Z8hfUasscvKx/cpU9uKi35Px5qzDwrz5tSf82y7Eos3zRK4ifUA91RsIGdkOUpTKlBTk
         hExf2u8tOm5AiSToyVz36deCiKbTsBMDZoLYI8acvDQoyeQPVwXj1/G3oeKWS7hPRaEn
         W16mkA7TLq/O+smlnnQiukLCDh1NqHcajGJlUVmTPGZQLselGD9s2yHUuCevQ5Ezsg+Z
         vP4A==
X-Gm-Message-State: AOJu0Yx56BpwXLJkpaXIXuRUxN/DnnS95R6PjmGl4wlgJ8Y2OJH3xx5l
	ac8Uaa5iX0+1RoPKACyRTqYtQkRNuyTNnSR+6sFPMbDi9XztQHbpySffC1sYhiwOxGs=
X-Gm-Gg: ASbGncu3YeAcEEnEdTMcQhapOPE1HiQVE9bYP7aIuWu0Mvd0nURxAlG/ASfrmeDD64R
	RoYcxhEOUpFsyy3ohpbWU3xxk9D/0UpPcauifjJGPmkMy6mV4AGhXVRhlRvYX3VthWrf3g1uv0u
	Irnm/ebOR6LQKBSznDnJqk+Renh5dQNe2t2FmADMyiSwyZ0Z0v/BrPJIgRiCfv4sRLMc6L0awCK
	0qxyoqrfK/+kMyJhmW/9MaLQmepTdJInRNG12ZLEZqBoO6gg//W9pHn+FJU2UN67jCsPou5hP8z
	hhxfwtKc7x/Ul2nZyE0jur4cw1yAXE0+pUJAI/DfByFnfsBhLPfquL6ocBJnS/bqw4zwSZX6xW9
	pvtqzYs2cuMEl1o8ixf5Ct8bT6j8bh1KPsONdHj6XcRQ=
X-Google-Smtp-Source: AGHT+IHj19/81SuTdzPteXB8CPyOOlrMzsRut1YcxVSG8nxgf4Uq225zw2mLSAI9+vByDLEE2YBJUw==
X-Received: by 2002:a17:907:9728:b0:ae3:5118:96b3 with SMTP id a640c23a62f3a-afb7cd676a9mr65195866b.3.1755009571677;
        Tue, 12 Aug 2025 07:39:31 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21e44csm2194309266b.113.2025.08.12.07.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 07:39:30 -0700 (PDT)
Message-ID: <7798fa0f-4786-42d2-913b-b76af91c94bc@linaro.org>
Date: Tue, 12 Aug 2025 16:39:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/3] arm64: dts: qcom: sm8750: Add Iris VPU v3.5
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250806-b4-sm8750-iris-dts-v2-0-2ce197525eed@linaro.org>
 <20250806-b4-sm8750-iris-dts-v2-1-2ce197525eed@linaro.org>
 <e414163e-e171-466f-965d-afb9203d32fa@oss.qualcomm.com>
 <be5f18d9-a642-4b4e-bf69-e0108e988faf@kernel.org>
 <6ffa8d6f-d5fb-4a94-ab7c-1a923cae1332@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <6ffa8d6f-d5fb-4a94-ab7c-1a923cae1332@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/08/2025 16:26, Konrad Dybcio wrote:
> On 8/12/25 4:24 PM, Krzysztof Kozlowski wrote:
>> On 12/08/2025 16:21, Konrad Dybcio wrote:
>>> On 8/6/25 2:38 PM, Krzysztof Kozlowski wrote:
>>>> Add Iris video codec to SM8750 SoC, which comes with significantly
>>>> different powering up sequence than previous SM8650, thus different
>>>> clocks and resets.  For consistency keep existing clock and clock-names
>>>> naming, so the list shares common part.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>
>>>> ---
>>>
>>> [...]
>>>
>>>> +			iris_opp_table: opp-table {
>>>> +				compatible = "operating-points-v2";
>>>> +
>>>> +				opp-240000000 {
>>>> +					opp-hz = /bits/ 64 <240000000>;
>>>> +					required-opps = <&rpmhpd_opp_low_svs_d1>,
>>>> +							<&rpmhpd_opp_low_svs_d1>;
>>>> +				};
>>>> +
>>>> +				opp-338000000 {
>>>> +					opp-hz = /bits/ 64 <338000000>;
>>>> +					required-opps = <&rpmhpd_opp_low_svs>,
>>>> +							<&rpmhpd_opp_low_svs>;
>>>> +				};
>>>> +
>>>> +				opp-420000000 {
>>>> +					opp-hz = /bits/ 64 <420000000>;
>>>> +					required-opps = <&rpmhpd_opp_svs>,
>>>> +							<&rpmhpd_opp_svs>;
>>>> +				};
>>>> +
>>>> +				opp-444000000 {
>>>> +					opp-hz = /bits/ 64 <444000000>;
>>>> +					required-opps = <&rpmhpd_opp_svs_l1>,
>>>> +							<&rpmhpd_opp_svs_l1>;
>>>> +				};
>>>> +
>>>> +				opp-533333334 {
>>>> +					opp-hz = /bits/ 64 <533333334>;
>>>> +					required-opps = <&rpmhpd_opp_nom>,
>>>> +							<&rpmhpd_opp_nom>;
>>>> +				};
>>>
>>> There's an additional OPP: 570 MHz @ NOM_L1
>>>
>>> +Dmitry, Vikash, please make sure you're OK with the iommu entries
>>
>>
>> That opp has troubles with clock, so would need some fixed in videocc or
>> iris, AFAIK. Otherwise you will just PM OPP failures. I can add it
>> though, at the end  DTS should be independent of drivers. :)
> 
> Weird, there's an entry in the frequency table for it (well, * 3 the
> rate) and it comes out of the same PLL as other ones.. what sort of

You mean freq_tbl in P_VIDEO_CC_PLL0_OUT_MAIN? Yeah, I also saw that.

> opp failures do you see?

Only:

[    9.306006] qcom-iris aa00000.video-codec: dev_pm_opp_set_rate:
failed to find OPP for freq 630000000 (-34)
[    9.316078] qcom-iris aa00000.video-codec: power on failed
[    9.322001] qcom-iris aa00000.video-codec: core init failed


Best regards,
Krzysztof

