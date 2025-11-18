Return-Path: <linux-arm-msm+bounces-82180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 31456C674B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 05:49:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1A3A3357B88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 04:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E66C02BD586;
	Tue, 18 Nov 2025 04:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OfFQJBsx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GN9xW2eb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26988254AF5
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 04:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763441336; cv=none; b=mFlcqYBim29KtPi+p+8RQcloOLt8K3BTb/K7F7AE2tgUJ6AW/DordZVDdTkGjWhn1ZOYj/ZFfVEcHow208kwUZ1sn8ekcy3gf5fP9qvrrLAajA7JGU4RWeDxOv10Ww459lmRCFUnzcWImkbHoSGGF0VGEkbmXQmtMXxCjtniLEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763441336; c=relaxed/simple;
	bh=iIFQHjofGlzBMdAV/7VJaucvzmg9LLWDEE3IRoLoW2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Az7lDMAaqmvDqf62oNGqzM0+jFOwbRRuCOla7gpg9RF6crPfo4kko/Je20Moi4t1BUP+lqhnhsb2mc74w29dopnPxaaAJeP0B5PgrX4mrwbE9jQUqARSdDi4xVJKOd0vR5M7vBrsoU9S+SmP8pmbNJk+VHvXva7AtTJAa9LbvTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OfFQJBsx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GN9xW2eb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI4f6Hp3932626
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 04:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6EWfBA1U81NlKI70VVXPQFaenMKF6YCLlfEM2N9rP5c=; b=OfFQJBsxtXWvNmGr
	bYHHE9YmuzTjkQY0CIR25Q/Zy2aJ0qt33pJ3wAlmInz49rKGqzi2uEsU2ctAEgmq
	E1VCOyy4RXKHiOjdqFOfD5XNA45zSpk0+V5HOOZ/JCgVci6bHdhn92nPL8uhymrx
	xS86LYLy6HYyZ5hsj/JqVv9GB2KBSQpEUXEKrAxRsqA+eGTVLU3nGMoBdRD5+m5q
	6PPsDI9W3eUqbGssB++7sjEKrXJMwwZjNR1h0FgOdWPZSF9saoUZWWwXPzTe+1AY
	vrRyR/sxTXh/4ScRVPSbHLDE97gKvbLuYU1m9HVxLXHQgoTpkzmSDaiZtNxNtaAO
	SqcInA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag1v92tjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 04:48:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-341aec498fdso8293359a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 20:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763441332; x=1764046132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6EWfBA1U81NlKI70VVXPQFaenMKF6YCLlfEM2N9rP5c=;
        b=GN9xW2ebfYI3fohtCLDFnDeed9jcf3A5K8UkeSIeCjyk2Eby1TRU4pjm0C/woID5m1
         /px0GAfLrUQ+jOs9Xd3wfJK6ZG7IybzkQiM72znhdoENtyGdhRM0TmC9XpaKuSDPznPN
         aQSGCIwBgrIf9GZWGZpocPNmJD16A+/U5YIwFOgot2n7cT8poUsu26cj2NMZikBk2krP
         /f5iAHloXmao0Awix7lN9pKoP0NT47XP6VzLmHuYm9AUA4h6a/IDoVOQADAJ6rHH82LE
         CVZ1P7Pto1Pdu9HYFv1IPrzZXdzSROyDkNuD87hrEcdB8I0K3HQstub+t7PCymLwqOfj
         JYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763441332; x=1764046132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6EWfBA1U81NlKI70VVXPQFaenMKF6YCLlfEM2N9rP5c=;
        b=ToRuO80bnd/kXebLWw3LRPHmdc5uCZJ/5zJdhuYu7HZH/XsjKkcs89MmN38ML9kyMG
         B0wGgFyVLUkptAKScJ6UapRtkpf7vSF/zQROVaWb6oRvAb37Rv0aonD7rrWF9MYz45yt
         zEntlTqyPm/72B5EWm81FhkGpC2dMqnQ37uxbBKyJ0ltfNeA5JBT5Hl9DuVZ17TYr0bH
         PZN0k84jC+H4RC+cvrYl1WAfkGl1QiCgXa8mTgZCmgy1ELsEgZjfFWyQTzeVIuDEZmlQ
         +AoNRY++QlaZCgrg//2hvPSVkRdz5KUI7RUrHz0V37fVNoLQaQiQPUAAfJ5iC1FLvqOa
         LCzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCM/r8qRexgb25ir8bpR+ZDfdqQxr1qb01Pm9UTpbA0ZK9g0sV4S58uufll1Gwd7dHmWMRU5eHRuwNfaT9@vger.kernel.org
X-Gm-Message-State: AOJu0YwciYncnY5fCEKNfjfOZi9AlesGryLea4kIvrT54MUoHJLjgUia
	qjMJoTt27zDPimQ9htag0g5ZYPtafKlJrUzu4SQOGXnhzBJ2iv2r8AEjbG+gZJs12xBcuVH5d7z
	LbCwavmN4VHfotS4OGymd1KDX0vYG7j6miiKcQbH75FnBfeu0m1BiIZK4Q/X9SmZqVeb8
X-Gm-Gg: ASbGncudCGMroKvH0cpGhOYtjdrmcbteaYcESZVDQNGYS9in/YvKtd8I3MHSc/S1sfD
	lleixCE7A26VSlRbXXD/eRDeq+WVGTTPgZg+2kV8SJZXAN1IkKAQyczHSxExSXEeRUJP4YQDOp3
	DKS1uGiujChUAjzrbpPuqt9eutPyYI85wC4vZg6AuPsKu0hZsLiPKrhS930Tv+BMOSBgydntCjO
	unojkzuPkXsRBXpCJLVy3Eo6Bp+/dPTanZaA7+/iP8SAGSD4Nj4xo9nZDKyfjiv6dWDCO+hXZe0
	i2MLVJfwMYpPTxXOtQl9Zbee/28PPTx5geYK7ouO219ueIZLlmodW9STqtp9qf57KxaCPWCQiuo
	oA2GudyRDFOrZni/03CpFN39/dKfB0lw76S27MQ==
X-Received: by 2002:a17:90b:2ccc:b0:340:ba29:d3b6 with SMTP id 98e67ed59e1d1-343f9e92724mr16204366a91.6.1763441331915;
        Mon, 17 Nov 2025 20:48:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGx0fVzlAnUq4dpOWrVnMfPjWnKeWw+SIEXnH5mFBLo1+TOoZKSzxI6/PYJd2KildgZH1jJZA==
X-Received: by 2002:a17:90b:2ccc:b0:340:ba29:d3b6 with SMTP id 98e67ed59e1d1-343f9e92724mr16204340a91.6.1763441331437;
        Mon, 17 Nov 2025 20:48:51 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e0794e56sm20397887a91.10.2025.11.17.20.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 20:48:50 -0800 (PST)
Message-ID: <ec54cc7b-b0ee-4aa3-b9ee-276e5b3b5c05@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 10:18:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] clk: qcom: rpmh: Add support for Kaanapali rpmh
 clocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, jingyi.wang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
 <20251030-gcc_kaanapali-v2-v2-4-a774a587af6f@oss.qualcomm.com>
 <swma6lyjfmyhl5ookdzvpjn5qresgsze5wptg45jfgj7ub6a4t@bdgfstw6gzoq>
 <380aa79f-f334-44db-9527-85247f9735af@oss.qualcomm.com>
 <2jfvrt4r7ddagh2ztbad7qnjpcvulcrtr3ekul6i26qg6zcd44@dxfhl3265okx>
 <cdbfe200-314b-4185-bb58-d528ed317610@oss.qualcomm.com>
 <j2fwz5vgzydi4dvtzegmwz25rukazf2clk5ga7ikvv5umm2jcw@edgrznbv24hq>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <j2fwz5vgzydi4dvtzegmwz25rukazf2clk5ga7ikvv5umm2jcw@edgrznbv24hq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Fy09XpjNZw188GhWv8lpnOdxcalEJFBd
X-Proofpoint-GUID: Fy09XpjNZw188GhWv8lpnOdxcalEJFBd
X-Authority-Analysis: v=2.4 cv=acVsXBot c=1 sm=1 tr=0 ts=691bfab5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=A39G7UXKOQFEQjqAOJYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDAzNSBTYWx0ZWRfX1E0D65iU+jv3
 tehNw6iGhICZpks+C8X5lhVzp8az3zdUPVUHTTW/YKtY2d01KDP9fhbTaw6trZbDveqYS4zUUAn
 0Z8xA18R/bCdTV7doQjuBn7PJmua7hi61SU3H/hX4+OrbSM0agthRaU+vCRt8oV/0AAYhP2WwIA
 /jujet2dc1IKjuhIA9ddzmt4/TfckvLak7vREq5hGiT7VcaaYEjr1VrWyB/uwYfWCWvhT/o9Icy
 /fynV5szEKWacXeUoSU+7Ln6mX3rZObSdvG88X+uhdSQQnFS5gE+CBfDHzHsQX0p6fr65i7Jf//
 s0Srhx4TXYVFMyy/MvsQiQxf3jAKJWlKTbjzwl0EsUuw5PJRj52in1xgiVjYu2yX5boncci6EPT
 1wo3OKzC0/ktYmv6+3Eyu1YSQTEenw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180035



On 11/18/2025 10:04 AM, Dmitry Baryshkov wrote:
> On Mon, Nov 17, 2025 at 01:28:46PM +0530, Taniya Das wrote:
>>
>>
>> On 11/14/2025 4:38 PM, Dmitry Baryshkov wrote:
>>> On Fri, Nov 14, 2025 at 02:13:49PM +0530, Taniya Das wrote:
>>>>
>>>>
>>>> On 11/11/2025 4:16 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, Oct 30, 2025 at 04:39:07PM +0530, Taniya Das wrote:
>>>>>> Add the RPMH clocks present in Kaanapali SoC.
>>>>>>
>>>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>>>> ---
>>>>>>  drivers/clk/qcom/clk-rpmh.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>>>>>>  1 file changed, 42 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
>>>>>> index 1a98b3a0c528c24b600326e6b951b2edb6dcadd7..fd0fe312a7f2830a27e6effc0c0bd905d9d5ebed 100644
>>>>>> --- a/drivers/clk/qcom/clk-rpmh.c
>>>>>> +++ b/drivers/clk/qcom/clk-rpmh.c
>>>>>> @@ -395,6 +395,19 @@ DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
>>>>>>  DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
>>>>>>  DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
>>>>>>  
>>>>>> +DEFINE_CLK_RPMH_VRM(ln_bb_clk1, _a2_e0, "C6A_E0", 2);
>>>>>> +DEFINE_CLK_RPMH_VRM(ln_bb_clk2, _a2_e0, "C7A_E0", 2);
>>>>>> +DEFINE_CLK_RPMH_VRM(ln_bb_clk3, _a2_e0, "C8A_E0", 2);
>>>>>> +
>>>>>> +DEFINE_CLK_RPMH_VRM(rf_clk1, _a_e0, "C1A_E0", 1);
>>>>>> +DEFINE_CLK_RPMH_VRM(rf_clk2, _a_e0, "C2A_E0", 1);
>>>>>
>>>>> What is the difference between these clocks and clk[3458] defined few
>>>>> lines above? Why are they named differently? If the other name is
>>>>> incorrect, please fix it.
>>>>>
>>>>
>>>> Dmitry, my intention was to make a clear distinction between the ‘rf’
>>>> clocks and the ‘ln’ clocks. Since there could be overlap in the
>>>> numbering, I added prefixes for clarity. I should have applied the same
>>>> approach to clk[3458] as well. I will add the fix-up for the same.
>>>
>>> Why do we need to distinguish between them here? The resources in CMD-DB
>>> don't have such a difference. You'll select whether the clock is RF or
>>> LN when describing the platform data.
>>>
>>
>> It is more for readibility and maintain a direct mapping with the PMIC
>> clock grid. This way we can immediately identify the clock type without
>> cross-referencing desc as the clock mapping here would indicate the type
>> of clock. Yes, the CMD-DB name does not reflect anything with the names
>> here. Please do let me know your suggestion.
> 
> I'd prefer if variables reflect CMD-DB resource names rather than the
> actual clock usage. In the end, platform data does exactly that - it
> maps usage to CMD-DB resources.
> 

Actually the grid does not reflect the cmd-db resource name at all, so I
do not think that is the right approach. Let me move to completely
remove the 'ln' and 'rf' references and refer them to 'clkN'.

> Also, if we follow your proposal, we will end up with ln_bb_clk and
> rf_clk referencing exactly the same resource, causing possible
> confusion.
> 

Sure, Dmitry, I will move to use clkN and remove the suffixes.

-- 
Thanks,
Taniya Das


