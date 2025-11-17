Return-Path: <linux-arm-msm+bounces-82126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3139AC649FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 15:22:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0F67C34FE16
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 14:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3DB33343E;
	Mon, 17 Nov 2025 14:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Df9AxnG6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K1VgBz/s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EB3645
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 14:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763389031; cv=none; b=roS1jo63wTPDSvr/P7ET35fvz9Q6oezK8RXj2kj52vSRxjrsyiK6O104YQ6rJI9FwZ/2k3qZyYFACZXBNVGYErpWhmiNcAknNOEnZnRrCjS689Dm3kpF3EBjfQ8KLKUNQOhbV/JTyhy6KO2aHXd00eqYa7egm1XKsGONwSYvEvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763389031; c=relaxed/simple;
	bh=LVZusJLdrZ552ACuRCrV4kkE+GCDGhsWXPBDhH/Ag9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dettzBBX2ui+Mhhf46vZRH57Fexv/l9aLg0Oa/2u3pl0IeQhRlEF4Qv7Kmq+GEh31cClJUhMTzXEkD1bgE2MkDwMeFIR2X8Vik67SjRdxzz8/ln4fPtonBpnNh5J7fUtVFQw7YhTzTjXvWsR4a2504J32NuvAX9QKBtsL04/9Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Df9AxnG6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K1VgBz/s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHED2E4375054
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 14:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LVZusJLdrZ552ACuRCrV4kkE+GCDGhsWXPBDhH/Ag9Q=; b=Df9AxnG6p6gKQ2cS
	3KebPaAxXVph3KakdELHfHWZn5bLh6LKYTu/lpxz8HDPIPNe3sUSzUkQX3HRqiUw
	zVn0hrSMV3a4tLPikSzsps5IjC24d+GzZdM6gyoWPUpFK5bJG5Yj8Fxw+j+YcukX
	sOC4leGXCe3lA9mMZiQW0qyFcp+2B47fzagtFmVRZ3+YfcJElcnufgJsbPrpQzfl
	zvksFd3muRogOCZO7xmRNHOIbDP/bpmzcLLYYBqwddV8iHpquV+al8LPHnZRejL/
	8mIMcIiO6dHlDU6ws33N1iVMByhIX45lVqDn7v85dC6MMXOWYHyepwKb3riOtElI
	v5zTjg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag59980f5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 14:17:08 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5e167b739d8so268250137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 06:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763389028; x=1763993828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LVZusJLdrZ552ACuRCrV4kkE+GCDGhsWXPBDhH/Ag9Q=;
        b=K1VgBz/sOp8BHlfenV/UzZmzuIWgMwgjjvk7pRt+XorpVMbq3kQ4+fb1qPLjbMZ6go
         9KcjRLRCeGpSD8DoQQUCC0443KkaB3HXqtHGh27H6nqXDxLAVa9dZmX0rFyZTtn71HtZ
         8/ZBcoWPwAiw0hbrOhvq+IVsTyCSRltKoiwtlxG1WjiQfBvN2ahivzfWqAEYa82RvWgS
         +kvQYf1Ub9m+dYwbtaU1ZinIRVgUveVmYu3Q49hccekM5aLUcDyx6giW3zXI9s9aZz/C
         MGwopZaZKwYsKK8iVBfcM/+cukabO3MX0V3dpULmAakoeBCWF++sVRaBBFPeaCaazkX6
         KQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763389028; x=1763993828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LVZusJLdrZ552ACuRCrV4kkE+GCDGhsWXPBDhH/Ag9Q=;
        b=eACXVVwCA+aV+Tv46BnGV7Xbi5lDOpSnjrXlydH78S6B6dDRM/6c82v+WSTwwIiAjf
         SD38QA4MaFTL7nyZMShMa6+0zxH0HWux8UgJizWiWLvScJ1SSuxxZ+AHORcOpUXN6lKU
         gubsTcsiD3nErXUrgA7HyHiS1fG4vHRIndsR7p+oEEUuq+5ptlRjvMThogRtC3Ns4B6c
         5LOHRzmqRlBFzVFswGDkxCvEpo2Tz/u5aMFcI0hwz2D4KmvdxxGzNp5d5JzfbVeBVxNn
         ObWSLXgvJ6E01RnqKXXen8Tiw7rFVaMqkZz9u0ZXcqMa2ybH3yzt5wdnqSak6qx2+AkY
         R18Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3SmhkIYZxpW2PLXRRNrgkSS5ex3T9XwO3t8/Huw6gmed4zl7Pd/+bZJa8M7TVvpqQ4rbmzzup4bA7LH2o@vger.kernel.org
X-Gm-Message-State: AOJu0YzNYkuX5Gh/HjPS1P5DZk/ZogIPo+LQTTcybR/s5AiErp2zn50t
	RJj3sJwseoPO6Kteo3IaiykkVbo/JoD6ju2aFafB8d/PE/YKnqufRIpAQ45UIArbCV8od0d9MFK
	Et3oB7nHIW+TzvvtI3TOU6pwF+R/Aw3WPe5oHYWRc0Qdv63UMHILxfFI5IrOwD6XD937r
X-Gm-Gg: ASbGncv6cq46cjA2IpY0422z8Qq5YqDt+zoM1n+PEm3e989I0GN1xFO6V6F2bj+RdhT
	zGJvB3CSIJonpziB2T1f2OMge9xQ0VeTNRdcq5a+YjornAm3rkoyHtsa+WHcOOwrC6ak9lH/bux
	7xxEbfrsO8Xg65j/lAxWv8acE/DLOTdWTH99lBPStfXJ6GcqkHUuo23/UNf2MS4uGCPW7an7+7a
	q8s1tETgV7S40YnfUC71uF2IxB3rCUIILYaTYJn8MgHiqKWTXQJF/xi/cnWKJBwcxxGtwp2Holk
	eB7Hr/ma95cd5KJ5xjx6uODTBjC/eS7THizKC3voI3Z0a/wJYA8A/PTVd8urOLBPzBjxccyh2f0
	sut0mcdtD4HelhIpf+W1l01UZDKlFzHcBcj8tkr1HO2zWGou41AO5KzT/
X-Received: by 2002:a05:6102:509f:b0:5db:d7a5:ba2e with SMTP id ada2fe7eead31-5dfc5b95e2dmr2146690137.8.1763389027925;
        Mon, 17 Nov 2025 06:17:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnHQ2pTUpIqXgwhIDGJLeBfApSQspfnNAKAssZ9B4ZXxU2WBgY34QQwbBf2kb+Hir5x8goLw==
X-Received: by 2002:a05:6102:509f:b0:5db:d7a5:ba2e with SMTP id ada2fe7eead31-5dfc5b95e2dmr2146667137.8.1763389027473;
        Mon, 17 Nov 2025 06:17:07 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd80841sm1098302866b.41.2025.11.17.06.17.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 06:17:06 -0800 (PST)
Message-ID: <2220aea0-6139-4534-8c42-1331a642ab62@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 15:17:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: gcc: Add support for Global Clock
 controller found on MSM8940
To: barnabas.czeman@mainlining.org
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lanik <daniilt971@gmail.com>
References: <20251116-gcc-msm8940-sdm439-v1-0-7c0dc89c922c@mainlining.org>
 <20251116-gcc-msm8940-sdm439-v1-2-7c0dc89c922c@mainlining.org>
 <793d5039-0506-4104-b4ce-64bfa3cc00eb@oss.qualcomm.com>
 <5C7A10CF-910E-448A-8BFD-F2A46782D3B9@mainlining.org>
 <8faa0c8e-6f21-4025-bbdf-d4ec18eb7628@oss.qualcomm.com>
 <869028d628bad9e1c37c3d9ea8346ba0@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <869028d628bad9e1c37c3d9ea8346ba0@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fnzYh8p_LvnhZ7XojefoRgQ1aaYTYa4C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEyMSBTYWx0ZWRfXwaiHpzJ8cSgJ
 6bED5DcWYCsZ7hyAllnr3C/K3GTVz3l17UVqtO8TqVXnCLicr965xu9xDbEB3Kxa7Ratp59pFpu
 cOCk3aTlP5PtsV46fSnS5dj4j0ZLhJqS4y44z4EGUuEL68PGZC628Sf1v5Fwz3AnQSE0EfyaqBa
 /M8tfm2GqpmkIudwl3HKnIlgd9QMlNkPTycfuY9UBIaFazLMbb7GSWHp8PRTRrPTBakgOFTtNV/
 Vb2GYWnJMY5sbDEjyOSjNC7D7NZk+PFoRpkr4y8N0TjLjQc9hNmgtE4xUWpu6KhWXG0zVNhgYx5
 e5ZnohHLuiPBByAX5nAkqfmQI7i/EU705wVQ062Rx7BeSFqztVLRS5IRUnt+1g2SaGrO6k21EJ0
 KFuAC+8710RtNpiePMmu8dBd4/162A==
X-Authority-Analysis: v=2.4 cv=HaMZjyE8 c=1 sm=1 tr=0 ts=691b2e64 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=aXj3mySSvwvPpzEV93AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: fnzYh8p_LvnhZ7XojefoRgQ1aaYTYa4C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170121

On 11/17/25 3:02 PM, barnabas.czeman@mainlining.org wrote:
> On 2025-11-17 13:17, Konrad Dybcio wrote:
>> On 11/17/25 9:51 AM, Barnabás Czémán wrote:
>>>
>>>
>>> On 17 November 2025 09:03:53 CET, Taniya Das <taniya.das@oss.qualcomm.com> wrote:
>>>>
>>>>
>>>> On 11/17/2025 3:05 AM, Barnabás Czémán wrote:
>>>>>
>>>>> +static struct clk_branch gcc_ipa_tbu_clk = {
>>>>> +    .halt_reg = 0x120a0,
>>>>> +    .halt_check = BRANCH_VOTED,
>>>>> +    .clkr = {
>>>>> +        .enable_reg = 0x4500c,
>>>>> +        .enable_mask = BIT(16),
>>>>> +        .hw.init = &(struct clk_init_data){
>>>>> +            .name = "gcc_ipa_tbu_clk",
>>>>> +            .ops = &clk_branch2_ops,
>>>>> +        },
>>>>> +    },
>>>>> +};
>>>>> +
>>>>
>>>> Is the TBU clock used on 8940 by a SMMU driver?
>>> As far as I know no MSM8940 is using same smmu driver and bindings like MSM8937.
>>
>> On msm8939, the clock needed to be turned on for the GPU SMMU
> I have not got any qcom-iommu issues on 8940 but i think it could come when i try to add ipa2 driver
> for the SoC until i do not know where to check it.

I can't find a definitive answer, but it's most certainly going to be
necessary to turn it on

Konrad

