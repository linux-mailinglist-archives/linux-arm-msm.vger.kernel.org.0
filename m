Return-Path: <linux-arm-msm+bounces-84454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC60ACA77E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 13:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5728C3062216
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 12:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E429D32F757;
	Fri,  5 Dec 2025 12:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I9VjNx5d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BamKPl1P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A042D6E4D
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 12:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764936055; cv=none; b=XdRr2UrAQgckmCqZ8szgyjfx9bDNOg0GL0yznLQ4v0tab/vumxvnLe/9Mw+ZVdcbgbFdKww23IvCwL5Qs893nlAgt19Wi/OhNAf9j4IHaTvjFtA2s2mQi47Dzp/jzneT0KKJPMNjnEkMJhqFVhOjWwiU0nUJGJ21sOWDsZmDLPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764936055; c=relaxed/simple;
	bh=5GJYnPeEXYloCmknrlsTIN+1ez280CnAJeaeZAgoVMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IkxfAmRm7ml2di4U+h3IAb2P8Ju5S05XLGAYZWyBpK7x8YiktmcrGNiRRzuwekRhLP57Tv/52XFsBHKWIc312KFqdlaDvhQWN01KLSptfIo14gwVnt3uFV6A/F3QB2sDBVHC2k0vPDZGrwCkFiKUegDdfSiUyHPCHkRN1Oo3AwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I9VjNx5d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BamKPl1P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5AORR7067633
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 12:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3+9AN/HxdHG5JU3qIa6IofBm9MTQMtmCFXG7ehrSIBg=; b=I9VjNx5dktPJBIbH
	SGP4LpsRexqizAUcMPmmDNz10KZg5qRv9xGwWoQXC4N1kXrKcaeT4HaqT9Mu79my
	fHGi/Mox9vu1t34j1EZcnwN/9ZgutyeDJZlyTmPCsvp8kO69fkmgmerFkCrWd4nP
	XHsX9TLflro50QaLUtw4kFLKHxWAzmQR1xlFfxlB/45+scf4eoatbhcSZgkBsvxo
	42eGE7jn2l9ePivBF3WMUAenGHCG5rAjvLbl+WohVton3y03SXXD8/HOcAESQBBn
	ULQpvpnAgKlvSwvE0IFdJIfQjci5FybWfMjRqZgMlTwlme9tlasC87T/NLbPzdRF
	+DTLlA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auwm4g82t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 12:00:49 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-882384d1cc2so6476486d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 04:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764936049; x=1765540849; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3+9AN/HxdHG5JU3qIa6IofBm9MTQMtmCFXG7ehrSIBg=;
        b=BamKPl1Pw4Yq3NXVM36PvfqmlyJUid/6cut3XAC9YKUFR1YhSgun/9ExT750PZ/KZc
         ud1ROISEr6bz2aYG7457YLbnRf/4hCOcweJ1Isql0H9GGlz2jfQDEBG0gEL9fs6nxrIG
         eg/4XlbePzUOItR7yh73SQF38D7gujn0POH0aGPOT03YuIy3JT3f9uPA/X6XUs4w/+LK
         bC4tUo9qpyQ9hY3gQ5CmzRkUkunq/g+ZM6KwXaORcwj6HF+XBsDycw4cY0lxd2IsELQe
         LHT677jynpcUBG1kATas202UKMoXAQKx/hg4pDZX1VSjO59WnIMubzKJcZ6n4eumtReV
         /bCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764936049; x=1765540849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+9AN/HxdHG5JU3qIa6IofBm9MTQMtmCFXG7ehrSIBg=;
        b=ikSeOvWr+kCD/YtEFI2sDCaszRnZyaMElfE0cOzu+h5LlWF8eLpR0ajnRjp+PqF5me
         y7Gn3cThf0QfCHFyYIsCoM9ofhSvU0aq9Fv4jZUOr1elfKj+/Ze2wT6SBlxnNK5pB0nH
         rO4dsd52hgpaOCWafRvHZTv0PC5oFCgwMB2M43E3FIFpNhdJO2UhT9V8+GAZN4rOpbA3
         qq8SrtNiOG+TRFHdXxuO5Ldemo2xgNwr24EipO5yzzXL3xurYmfWp/+jU+/+4c4CrwF5
         SAJTZGfmqfj4kXWf44sVKc5H4GCBo8Gn3pMMuHMgIWJjeQHgTbimbOJtQiz8TOxcNWXw
         ypJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY6kd7jv/MSuNEQxLAKrS4zPh37lLzvcbonA/oao9IEHu5YVGzN3jDRx7j5I9Sg6XmmkhreG3KPFVQ83Sg@vger.kernel.org
X-Gm-Message-State: AOJu0YxhDz5Jtf5prv1sBdYOKzyUxSZt7hsV+n6Ao2rkZ83Zf5hmRTRk
	fLejKqyyXfcHEha39S90UXwkfBkdr47Bv2eph0qjMf8f6PiJahB8i72kD8eoMg3diilobdMWLaj
	1/OPvECSH9acw1u1RStIY89w6NKP2I2keZ4SAFqx0qm3e0DMSiGriPUbeyTmDyYX045Xm
X-Gm-Gg: ASbGncvDTdSmSlGzjI/HT/RP9hTVJn5FsKanyw0XnmumsOd8EXp2krGKY9O4qD8b4jz
	x5dgHjrRnOerNAIAyogM+KK6SU0fUZ8qnjVdUP2INjlM8flNBOwG32tOxS9Dieqh1u9GNq1CdWO
	XrGFAAwbtVu445wYdRAKaPnhX7ZiKmGoTM488ENhMKrnHbLeIDpZRo8s0WrS4uosSC/ek1UvUnb
	KNXw/vDMwyZQY1u/OlSt0FSmbG0FKvSMyuRvVQnnAoiZjrwAHN5FlQ2V6QQuGOvJA8g88QK4qzJ
	Wu+vdG/8w1WHtI1kauqfF4oip0OLYLN8Ty5VIgql9kL9c78Dbwkz7IlxSLEmWyPzdyWIOR1gW8i
	jBh5soUELzmyBAjNbWoTK7tly/Gy69x3kmCKfdJoOfsicGylm+H1MXkJSaaO0NwMoKQ==
X-Received: by 2002:a05:620a:448e:b0:8a1:a5c5:ef18 with SMTP id af79cd13be357-8b5f94f51d0mr796613085a.7.1764936047328;
        Fri, 05 Dec 2025 04:00:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4YCoMEsE/aEBJ2TvQLIePmhNsDzgggaoMgJ7OsQXvHMsZAMZDO44pmTESXMg5rtykjNpNsA==
X-Received: by 2002:a05:620a:448e:b0:8a1:a5c5:ef18 with SMTP id af79cd13be357-8b5f94f51d0mr796600285a.7.1764936045678;
        Fri, 05 Dec 2025 04:00:45 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2c5575fsm3700985a12.0.2025.12.05.04.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 04:00:44 -0800 (PST)
Message-ID: <f04d27a2-88c9-44ac-b4fa-33059a9806b2@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 13:00:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v2 5/8] media: qcom: camss: csiphy-3ph: Add Gen2 v1.1
 MIPI CSI-2 CPHY init
To: David Heidelberg <david@ixit.cz>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Petr Hodina <phodina@protonmail.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz>
 <20251204-qcom-cphy-v2-5-6b35ef8b071e@ixit.cz>
 <b7fac86c-15fd-400b-955a-c331c8bc681d@oss.qualcomm.com>
 <03c137aa-bd31-43d7-aea8-489ec0102ab3@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <03c137aa-bd31-43d7-aea8-489ec0102ab3@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T92BjvKQ c=1 sm=1 tr=0 ts=6932c971 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=LQYBDm9UNitWhpxzWCUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: wIqF38C0Xy6rJOEfsM6bIvrSVoMv6ODN
X-Proofpoint-ORIG-GUID: wIqF38C0Xy6rJOEfsM6bIvrSVoMv6ODN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA4NiBTYWx0ZWRfX1NVVT0SIfvJA
 WiAx/aO40HHiYGzDAXV9ApJwaps77Fj4NIb4SXmfCeR5zCg0lTAUt1Wf3IWO7hJ0p64JM9xEVbp
 TatXwnMc79Exva1RU59SMY577wcCZQRjuLuXKblYSMerHqyAfXYqpgBuINQW8gv+Hob892Pwep9
 z4YVBGVP+fPpGPz63xgG5vjuW8pHuwU2zNblZ4LhTDdu//5q0ul53G6bKB2Y5EVFOuJ6ntyGCjE
 7N+ScZaAqBkuls7HLNjQM/dbFqUUlvwZKouLIMq7MY3nT4NoLQbgjhZR8N+3DAdihhxCLXJcZ2w
 PhOqxJlSSuwX9d0c0nHafyV3JM4EU4/K3KTZiH4ghsRudA+StIuZbEHbtowQ6tuilQ7Yir3rqVa
 jNtYll7KG3BsLYedNOusFzAdpYvNDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050086

On 12/5/25 12:56 PM, David Heidelberg wrote:
> On 05/12/2025 10:54, Konrad Dybcio wrote:
>> On 12/4/25 5:32 PM, David Heidelberg via B4 Relay wrote:
>>> From: Casey Connolly <casey.connolly@linaro.org>
>>>
>>> Add a PHY configuration sequence for the sdm845 which uses a Qualcomm
>>> Gen 2 version 1.1 CSI-2 PHY.
>>>
>>> The PHY can be configured as two phase or three phase in C-PHY or D-PHY
>>> mode. This configuration supports three-phase C-PHY mode.
>>>
>>> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
>>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Co-developed-by: David Heidelberg <david@ixit.cz>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 74 +++++++++++++++++++++-
>>>   1 file changed, 72 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>> index 3d30cdce33f96..7121aa97a19c4 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>> @@ -145,6 +145,7 @@ csiphy_lane_regs lane_regs_sa8775p[] = {
>>>   };
>>>     /* GEN2 1.0 2PH */
>>> +/* 5 entries: clock + 4 lanes */
>>>   static const struct
>>>   csiphy_lane_regs lane_regs_sdm845[] = {
>>>       {0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> @@ -219,6 +220,69 @@ csiphy_lane_regs lane_regs_sdm845[] = {
>>>       {0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>   };
>>>   +/* GEN2 1.0 3PH */
>>> +/* 3 entries: 3 lanes (C-PHY) */
>>> +static const struct
>>> +csiphy_lane_regs lane_regs_sdm845_3ph[] = {
>>
>> Here's a downstream snippet which seems to have more up-to-date settings
>> (checked against a doc and it seems to have changes made at the time of
>> the last edit of the doc)
>>
>> You'll notice it's split into 3 arrays of register sets - that's because
>> it applies setting for each lane.. something to keep in mind we could
>> optimize upstream data storage for (they are identical per lane in this
>> instance) one day
> 
> see 87c2c2716523 ("media: qcom: camss: csiphy-3ph: Remove redundant PHY init sequence control loop")
> 
> for the reason to flatten the regs array (thou outside the scope of this patchset).
> 
> Regarding to the different value, I can test them, can you point to docs regarding why these regs has been changed and what the values means?
> 
> I thought it's some default seq, but as you show there is multiple versions, it make sense to properly document what these regs do.

I'll make that point to the relevant folks when they get around to refreshing
this driver, I'm not sure I can just tell you what all the magic sequences do..

The high-level description for all post-release PHY sequence updates is pretty
much always improves robustness as a result of "more better" electrical tuning.
It's also the case this time around.

Konrad

