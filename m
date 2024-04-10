Return-Path: <linux-arm-msm+bounces-17018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8830289F147
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 13:50:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CBDF280DD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 11:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E940B15D5B8;
	Wed, 10 Apr 2024 11:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h0JB/dcV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD73C15CD53
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 11:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712749735; cv=none; b=RFd2TVXg5yEMb9g3/RfdJspMq7ZTlXELVBFF6mJkrpauitnWEnL27qkJSHDQyq1zX/rW32hX9s/ELsB/aeDm/vo/11YjzroWmqKjwNATVaK2Dkpyn8iolyd2+H83KtGhf/CZPu421LcF3ho/zPAGj6TNinpK69M04g3OYtQ2HTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712749735; c=relaxed/simple;
	bh=myi9U7wB4BUbL3pin+KhvH9AT1V1Zn09oII1Q4p24U0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u1YpGf8DrydTwaWEYVaMnAlwgTp0WANLHwAHpRszw4pnsgG/+1j8RoBw/VNruEXTLEX3ZnFqBp4im7JMcd5p+3d8K+5L5Q4KvSOfOJHq7jYBnuAPwNa4RFAdzhOOx0xMujjgap+NC8aieT46cxDW6No8m4I+NEB8nMDudyOSR2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h0JB/dcV; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-516d16db927so6957475e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 04:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712749732; x=1713354532; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bvWJuPB+EMC9QSE+1kd/WQJdyM++QYTKwh52aBZPDZ0=;
        b=h0JB/dcVtFu5CCzo0KKg96B+8oogEwnSokXpA6BsrsSTzNFl2T+KIbBBpiqYz+fvf5
         FzKfLcVJlNN+OnDewLW3s9DBkEAiPeRyFB7s6LpIaNGUkSvhrJZu6OyljXQ1vskvt70E
         e7+jBMjUaTRbTrflwjzZnENb2DhjvQEm9dIPWRoThAfiCvcR3LvNM2KjSsHE4CVxlxoH
         jqac/xKwEL3/C+zDHu7yxVhF92epgHTO88wfEKlIO6MX86C6gVkRmjTsHrnjCSdg/i5g
         l9QwadqdU9NS0fFuxvPGsqkR+3KF2HIWmp4hjwLtFNJEct6Apda36crt+Y2AmGonQdnZ
         tIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712749732; x=1713354532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bvWJuPB+EMC9QSE+1kd/WQJdyM++QYTKwh52aBZPDZ0=;
        b=AuuEpRHNcupJxsVlhMaqg41byQIf5PczwhHy1M6cpSAGi/DJw09YBhguI3zKwgIG0C
         yAGwwbxjDmqiD+R6xKQU5+GVoF1f0y8dgMCZtKq6QVxlc4aSSYihfYK9m1GH59F9Fk//
         8ByXUyGrWUCMTkNB6wQDqjPIISkh7/BIsp5fjKO9L2kwsyq+cUuzzBhqjqqpZV6adZsD
         uTfyX3IcgQ0EDxc4ehGJQhunJRQoAPRoE0rhAmNONZQ5/E0SWB5UasFc/dObR5zkNGkN
         TTN5rqlk4kqR4VGsDcTM4D3hJMhnn1plRA7eJWypgxkH+eL5EIm7raFquaffe1Yg/9h1
         d1aw==
X-Forwarded-Encrypted: i=1; AJvYcCXq3MURiqusQyfXvhvCvbkcwKU/tHw6VAt3KqGAjVSQ521sgNQHcrzPfSpA0bDqhIMHKRHB1asC5PKmdblt718A6EygmTxtnaEVP5QByw==
X-Gm-Message-State: AOJu0YzG36PDA1JTgkuVN2RrM+RXkgo7ZDTa6EEQyaACvjar1MCabQXu
	Tsrem2OBl0zG9tc5eFTSBEdmQg1fn12z2BfHhRKDuqPv7dXTjzpmv+xJRLCyU6E=
X-Google-Smtp-Source: AGHT+IELJcOLaCy4WWHYnaIRXwaIpbQNeikSYwqHReAreNMpcp3CH+Ay1sPOtZnpQWwZ2fwaRaclHQ==
X-Received: by 2002:a05:6512:282a:b0:516:c51c:979c with SMTP id cf42-20020a056512282a00b00516c51c979cmr1562831lfb.26.1712749731930;
        Wed, 10 Apr 2024 04:48:51 -0700 (PDT)
Received: from [172.30.204.89] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id q12-20020ac2514c000000b0051774e4fa42sm112165lfd.65.2024.04.10.04.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 04:48:51 -0700 (PDT)
Message-ID: <f1b0d280-6986-4055-a611-2caceb15867d@linaro.org>
Date: Wed, 10 Apr 2024 13:48:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] dt-bindings: interconnect: Add Qualcomm IPQ9574
 support
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, djakov@kernel.org,
 dmitry.baryshkov@linaro.org, quic_anusha@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20240403104220.1092431-1-quic_varada@quicinc.com>
 <20240403104220.1092431-2-quic_varada@quicinc.com>
 <58c9b754-b9a7-444d-9545-9e6648010630@kernel.org>
 <Zg5q6mnWtK6hmPBT@hu-varada-blr.qualcomm.com>
 <ZhTxFVDH0xTSkw7r@hu-varada-blr.qualcomm.com>
 <1ec401be-11cb-416a-9eae-d72ea8acf06f@kernel.org>
 <ZhUghsa5Do5m7wrX@hu-varada-blr.qualcomm.com>
 <a0173a13-5f20-4e24-8417-afce5fdbda0e@kernel.org>
 <ZhZjuCkJrtPbwtS/@hu-varada-blr.qualcomm.com>
 <70d0afa7-4990-4180-8dfa-cdf267e4c7a2@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <70d0afa7-4990-4180-8dfa-cdf267e4c7a2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/10/24 13:15, Krzysztof Kozlowski wrote:
> On 10/04/2024 12:02, Varadarajan Narayanan wrote:
>>> Okay, so what happens if icc-clk way of generating them changes a bit?
>>> It can change, why not, driver implementation is not an ABI.
>>>
>>>>
>>>> 	2. These auto-generated id-numbers have to be correctly
>>>> 	   tied to the DT nodes. Else, the relevant clocks may
>>>> 	   not get enabled.
>>>
>>> Sorry, I don't get, how auto generated ID number is tied to DT node.
>>> What DT node?
>>
>> I meant the following usage for the 'interconnects' entry of the
>> consumer peripheral's node.
>>
>> 	interconnects = <&gcc MASTER_ANOC_PCIE0 &gcc SLAVE_ANOC_PCIE0>,
>> 			      ^^^^^^^^^^^^^^^^^      ^^^^^^^^^^^^^^^^
>> 			<&gcc MASTER_SNOC_PCIE0 &gcc SLAVE_SNOC_PCIE0>;
>> 			      ^^^^^^^^^^^^^^^^^      ^^^^^^^^^^^^^^^^
>>
>>>> Since ICC-CLK creates two ids per clock entry (one MASTER_xxx and
>>>> one SLAVE_xxx), using those MASTER/SLAVE_xxx macros as indices in
>>>> the below array would create holes.
>>>>
>>>> 	static int icc_ipq9574_hws[] = {
>>>> 		[MASTER_ANOC_PCIE0] = GCC_ANOC_PCIE0_1LANE_M_CLK,
>>>> 		[MASTER_SNOC_PCIE0] = GCC_SNOC_PCIE0_1LANE_S_CLK,
>>>> 		[MASTER_ANOC_PCIE1] = GCC_ANOC_PCIE1_1LANE_M_CLK,
>>>> 		[MASTER_SNOC_PCIE1] = GCC_SNOC_PCIE1_1LANE_S_CLK,
>>>> 		. . .
>>>> 	};
>>>>
>>>> Other Qualcomm drivers don't have this issue and they can
>>>> directly use the MASTER/SLAVE_xxx macros.
>>>
>>> I understand, thanks, yet your last patch keeps adding fake IDs, means
>>> IDs which are not part of ABI.
>>>
>>>>
>>>> As the MASTER_xxx macros cannot be used, have to define a new set
>>>> of macros that can be used for indices in the above array. This
>>>> is the reason for the ICC_BINDING_NAME macros.
>>>
>>> Then maybe fix the driver, instead of adding something which is not an
>>> ABI to bindings and completely skipping the actual ABI.
>>
>> Will remove the ICC_xxx defines from the header. And in the
>> driver will change the declaration as follows. Will that be
>> acceptable?
>>
>> 	static int icc_ipq9574_hws[] = {
>> 		[MASTER_ANOC_PCIE0 / 2] = GCC_ANOC_PCIE0_1LANE_M_CLK,
> 
> What is the binding in such case? What exactly do you bind between
> driver and DTS?

I think what Krzysztof is trying to say here is "the icc-clk API is tragic"
and the best solution would be to make it such that the interconnect indices
are set explicitly, instead of (master, slave), (master, slave) etc.

Does that sound good, Krzysztof?

Konrad

