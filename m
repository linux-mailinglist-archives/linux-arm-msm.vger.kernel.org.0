Return-Path: <linux-arm-msm+bounces-43640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC0C9FE69F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 14:43:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D60CA161D7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 13:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0677FBA2;
	Mon, 30 Dec 2024 13:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nlrPD2DT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019491A3BD8
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 13:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735566202; cv=none; b=Dwo2ruiaH/WkCeo6YKPJvwlJuE5HIKzXOpW+0TpwcBAo5lOqko800dXN7w3zxHqYyEYxi1m6leyvzM5C5bjudAmcJKs+DLUHj3pMAglzjhna99q5wuoM/y4ENOfwtBkSR6bYxiEWrlPzrkgjzcU1b5cKWnBDFqoo2xvPbf/yA7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735566202; c=relaxed/simple;
	bh=m6hU27TBEEhcaTE7+Rqk+okx4JmGPQlDtKTwf0UXu7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qn4EsHRUQ7rLbYIloDVPXtKtG36MScGAToDAVrEDk2oSeNq+GkakS/lOZR6VCr5wxJthrEbUS38oIuywDyM4V6v/4ogN8LrUokjWTQO+glRnmdB+4ByObAUphkEW+nogZ7+6l9ruYHc64NoeACTdyFZiEvMSYyorjxB4a0GCYR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nlrPD2DT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU9Kj0G024446
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 13:43:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WwwDGBMgOXIZ8xtI34NEI5uYC8sWbdLnPMjigTlmeR4=; b=nlrPD2DT9+ZlNJLm
	5XL83PG7q64RD5ORvvlKPWbkkValeyS6EO3afGv5TwI33E83bWbQURW4b92pv+q4
	fvms88LHgzIOSjUaB8SNCkfztRsddAhthDUlXmGQfe3vvvdcTtns2pcBBc0IeBz9
	huyzeM3mlmq99+Zq6RrAP7kOwHRsBavR9QjwRfTkZJRDc3NLQ0MZcvULDsz2ypTZ
	B5y1Jee/4VWpdzd43Fv/nhepX2ZBEXca5EymYJme5KauAM/X6tOmJaror3JeXcgs
	r+m4jkP2HIkDhn2hXw5/7EMY++MKSD6S7Xkae0srA9/W4UVWy8Lr5ygQ2KpiuuQu
	97//0w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43urt88h40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 13:43:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-467a97dec51so6228071cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 05:43:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735566198; x=1736170998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WwwDGBMgOXIZ8xtI34NEI5uYC8sWbdLnPMjigTlmeR4=;
        b=vRDEOAHUAyQ5qBfLcssHQjcw1EU5OZxWv7teVkxrOHbFaLmc9B64QGQYan9+74uyx8
         52Nemi8NL9YH0urtNn/Ye8nJ8ZHdzDUwrZ2xRWZbj/Q/xF44RP741LTJyRNitZVUcBtR
         bLWRUme+0kyXgzSgspFoG4KmUpAiUrb7cCzdg/6VR60UfGKHnObxg7Wf6uM003fKTtRe
         Q/LCwnfve2CWRSS2xEDoTFNvtE6v6Drzxiwfbg5bryQf4XoDc04HqA3V0/UoR31hUh3Q
         LGovIGoy/yuWFwvWyyQZZqaavO16F7MxfsxJh7KEJ4AP2iAMTbCOAxvSwGFht1sii2kd
         nEWA==
X-Forwarded-Encrypted: i=1; AJvYcCVfXJFByjo5U54a5VIo+7EFIQz1M98VBP8TSihzzw9fZlkC9N+RaAb7W8JQlm/DG3MrP1FzGs9sdCjyguno@vger.kernel.org
X-Gm-Message-State: AOJu0YxZgGqeRN20GGdQ9uufg6hrNKcQHxDPekQ7gg7xGSlGtGNjTXDA
	mFFYonVF4HF1MpUnN2/T2wsOwIpVRPDyiO5Y8EgnmaoVkYwXWI1cnXN5g3PXWRDJIz74+Z+qW41
	yWsI0F+GLcp591D2GfRFrh7aMYQYXsHnd2WVuZZ0xSRDcWl1KWE5ZdIFrrrMErfa0
X-Gm-Gg: ASbGnctJjjw7oCU6XrdLFJlgU9Kvj4LwEUKVQEDGXcQTu+24Rh4p8ng9Nv9qIDuS804
	0nMsg1EHo5tcPEoCrRtjPXLG8M0nZhllbfNaL1+Xv8CxwIgPcw/SZfkG9KJfanluGpLi+LKTVJD
	FPSNyGqICwAaGwFXu5HAHPIk+V4GvHOAm+Hi6a3n4VUywvHKJ2e+K8DAn0xLkIXPK72cePSq1En
	yjRsscsERY9AbrmDyT00v54zfcpbd0YPK4HqtvkaBAzV3vzSU3O7ojRUlE+VgcFyAT/LrE9dEln
	aWqd097uJQQfoiEn3xVftcAIvDAqnbkhnz8=
X-Received: by 2002:a05:622a:164d:b0:467:6092:841c with SMTP id d75a77b69052e-46a4a68fa8emr187744021cf.0.1735566197765;
        Mon, 30 Dec 2024 05:43:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAjRoiWof2jJBR8zSK4dTRGmDsgvTNhJFdCqLpQJ/+Ct+IbHJY+8yv7jzELs/t4O5Vr5Jn7A==
X-Received: by 2002:a05:622a:164d:b0:467:6092:841c with SMTP id d75a77b69052e-46a4a68fa8emr187743771cf.0.1735566197247;
        Mon, 30 Dec 2024 05:43:17 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aae8b7de1cesm1287944566b.23.2024.12.30.05.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 05:43:16 -0800 (PST)
Message-ID: <c20485a0-1f0a-473a-afd9-8c6db855279b@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 14:43:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: opp: Add v2-qcom-adreno vendor
 bindings
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <mz4zpcr4tqh2w7vt75f4ofxjzfve54ozzgpdbi2jjzk5pdxbk7@t36tlt3mmprt>
 <d858dadb-4098-4c9f-b4f0-393dc988db5f@quicinc.com>
 <4426b4kybtac6rc4twa5pgm3hvlegofemvqjcrvh6ni7f5z2h6@5dnlv3hgywh5>
 <c5e868e1-2dae-466c-a6fc-ef0f247fa0ce@quicinc.com>
 <278e62e1-02a4-4e33-8592-fb4fafcedf7e@quicinc.com>
 <CAA8EJprgshjbNqNErOb06jqV__LmbWvocsK5eD8PQqL+FaLb1g@mail.gmail.com>
 <f67c72c3-7393-47b0-9b9c-1bfadce13110@quicinc.com>
 <CAA8EJppy+V9m-t_qPEJh2iTkC7tyDcf2y8wD9vYoHtFSp=HrkQ@mail.gmail.com>
 <982686bb-0ddd-45a2-b620-564af4f01800@quicinc.com>
 <16e1145c-6ef4-4274-a8f9-966f0edef9fe@oss.qualcomm.com>
 <rzhm6lkryxfqepgejpgmu4mr2z5qlzcvuptmmxhhndafc4kwlo@uw6eiw4cqlmd>
 <f1cf95be-af6c-45d9-8e26-2b978327260f@quicinc.com>
 <8d2092a6-e0c3-49ab-8a3e-64eb9051d353@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8d2092a6-e0c3-49ab-8a3e-64eb9051d353@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LZrfChG2uZe00-e6L6qXXMaKdsOj_xkm
X-Proofpoint-ORIG-GUID: LZrfChG2uZe00-e6L6qXXMaKdsOj_xkm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412300119

On 24.12.2024 9:51 AM, Krzysztof Kozlowski wrote:
> On 23/12/2024 22:31, Akhil P Oommen wrote:
>> On 12/23/2024 5:24 PM, Dmitry Baryshkov wrote:
>>> On Mon, Dec 23, 2024 at 12:31:27PM +0100, Konrad Dybcio wrote:
>>>> On 4.12.2024 7:18 PM, Akhil P Oommen wrote:
>>>>> On 11/16/2024 1:17 AM, Dmitry Baryshkov wrote:
>>>>>> On Fri, 15 Nov 2024 at 19:54, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>>
>>>>>>> On 11/15/2024 3:54 AM, Dmitry Baryshkov wrote:
>>>>>>>> Hello Akhil,
>>>>>>>>
>>>>>>>> On Thu, 14 Nov 2024 at 20:50, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>>>>
>>>>>>>>> On 11/1/2024 9:54 PM, Akhil P Oommen wrote:
>>>>>>>>>> On 10/25/2024 11:58 AM, Dmitry Baryshkov wrote:
>>>>>>>>>>> On Thu, Oct 24, 2024 at 12:56:58AM +0530, Akhil P Oommen wrote:
>>>>>>>>>>>> On 10/22/2024 11:19 AM, Krzysztof Kozlowski wrote:
>>>>>>>>>>>>> On Mon, Oct 21, 2024 at 05:23:43PM +0530, Akhil P Oommen wrote:
>>>>>>>>>>>>>> Add a new schema which extends opp-v2 to support a new vendor specific
>>>>>>>>>>>>>> property required for Adreno GPUs found in Qualcomm's SoCs. The new
>>>>>>>>>>>>>> property called "qcom,opp-acd-level" carries a u32 value recommended
>>>>>>>>>>>>>> for each opp needs to be shared to GMU during runtime.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Cc: Rob Clark <robdclark@gmail.com>
>>>>>>>>>>>>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>  .../bindings/opp/opp-v2-qcom-adreno.yaml           | 96 ++++++++++++++++++++++
>>>>>>>>>>>>>>  1 file changed, 96 insertions(+)
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
>>>>>>>>>>>>>> new file mode 100644
>>>>>>>>>>>>>> index 000000000000..6d50c0405ef8
>>>>>>>>>>>>>> --- /dev/null
>>>>>>>>>>>>>> +++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
>>>>>>>>>>>>>> @@ -0,0 +1,96 @@
>>>>>>>>>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>>>>>>>>>>> +%YAML 1.2
>>>>>>>>>>>>>> +---
>>>>>>>>>>>>>> +$id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>>>>>>>>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +title: Qualcomm Adreno compatible OPP supply
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +description:
>>>>>>>>>>>>>> +  Adreno GPUs present in Qualcomm's Snapdragon chipsets uses an OPP specific
>>>>>>>>>>>>>> +  ACD related information tailored for the specific chipset. This binding
>>>>>>>>>>>>>> +  provides the information needed to describe such a hardware value.
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +maintainers:
>>>>>>>>>>>>>> +  - Rob Clark <robdclark@gmail.com>
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +allOf:
>>>>>>>>>>>>>> +  - $ref: opp-v2-base.yaml#
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +properties:
>>>>>>>>>>>>>> +  compatible:
>>>>>>>>>>>>>> +    items:
>>>>>>>>>>>>>> +      - const: operating-points-v2-adreno
>>>>>>>>>>>>>> +      - const: operating-points-v2
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +patternProperties:
>>>>>>>>>>>>>> +  '^opp-?[0-9]+$':
>>>>>>>>>>>>>
>>>>>>>>>>>>> '-' should not be optional. opp1 is not expected name.
>>>>>>>>>>>>
>>>>>>>>>>>> Agree. Will change this to '^opp-[0-9]+$'
>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>>> +    type: object
>>>>>>>>>>>>>> +    additionalProperties: false
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +    properties:
>>>>>>>>>>>>>> +      opp-hz: true
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +      opp-level: true
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +      opp-peak-kBps: true
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +      opp-supported-hw: true
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +      qcom,opp-acd-level:
>>>>>>>>>>>>>> +        description: |
>>>>>>>>>>>>>> +          A positive value representing the ACD (Adaptive Clock Distribution,
>>>>>>>>>>>>>> +          a fancy name for clk throttling during voltage droop) level associated
>>>>>>>>>>>>>> +          with this OPP node. This value is shared to a co-processor inside GPU
>>>>>>>>>>>>>> +          (called Graphics Management Unit a.k.a GMU) during wake up. It may not
>>>>>>>>>>>>>> +          be present for some OPPs and GMU will disable ACD while transitioning
>>>>>>>>>>>>>> +          to that OPP. This value encodes a voltage threshold and few other knobs
>>>>>>>>>>>>>> +          which are identified by characterization of the SoC. So, it doesn't have
>>>>>>>>>>>>>> +          any unit.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Thanks for explanation and other updates. I am still not happy with this
>>>>>>>>>>>>> property. I do not see reason why DT should encode magic values in a
>>>>>>>>>>>>> quite generic piece of code. This creates poor ABI, difficult to
>>>>>>>>>>>>> maintain or understand.
>>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> Configuring GPU ACD block with its respective value is a requirement for each OPP.
>>>>>>>>>>>> So OPP node seems like the natural place for this data.
>>>>>>>>>>>>
>>>>>>>>>>>> If it helps to resolve your concerns, I can elaborate the documentation with
>>>>>>>>>>>> details on the GMU HFI interface where this value should be passed on to the
>>>>>>>>>>>> hardware. Also replace "few other knobs" with "Delay cycles & Calibration margin"
>>>>>>>>>>>> in the above doc.
>>>>>>>>>>>
>>>>>>>>>>> Usually the preference for DT is to specify data in a sensible way
>>>>>>>>>>> rather than just the values being programmed to the register. Is it
>>>>>>>>>>> possible to implement this approach for ACD values?
>>>>>>>>>
>>>>>>>>> Krzysztof/Dmitry,
>>>>>>>>>
>>>>>>>>> BIT(0)-BIT(15) are static configurations which doesn't change between
>>>>>>>>> OPPs. We can move it to driver.
>>>>>>>>>
>>>>>>>>> BIT(16)-BIT(31) indicates a threshold margin which triggers ACD. We can
>>>>>>>>> keep this in the devicetree. And the driver can construct the final
>>>>>>>>> value from both data and send it to GMU.
>>>>>>>>>
>>>>>>>>> If this is acceptable, I will send the v3 revision.
>>>>>>>>
>>>>>>>> Can the upper bitfield have a sensible representation in DT (like uV
>>>>>>>> or something similar)?
>>>>>>>
>>>>>>> Closest approximation is quantized voltage steps. So, unit-less.
>>>>>>> Converting it to the exact voltage requires identifying the pmic voltage
>>>>>>> steps and other stuffs which are outside of my expertise.
>>>>>>>
>>>>>>> It is convenient if we can abstract it as an integer which correlates
>>>>>>> with the voltage margin that should be maintained for each regulator corner.
>>>>>
>>>>> Krzysztof,
>>>>>
>>>>> Could you please confirm if this approach would be acceptable?
>>>>>
>>>>> To reiterate, move the lower 16 bits which is same across OPPs to the
>>>>> driver. Abstract the higher 16 bits as number of quantized voltage
>>>>> margin when ACD mitigation gets triggered.
>>>>
>>>> I know I'm not Krzysztof, but given this is ultimately a magic value
>>>> passed to the firmware, I'm a bit lukewarm on decomposing it and would
>>>> rather see the entire 32b passed in a property, so that if a future
>>>> target needs a different constant in the lower word, we don't have to
>>>> pull our hair out again, trying to add more spaghetti logic to account
>>>> for that.
> 
> I can also imagine future SoC not respecting existing interface and
> switching to something new, duplicating the effort. All this is "driven
> by downstream" approach... but sure, let's go with existing approach.

Yeah I'd much rather have the firmware contain borderline-blob data,
but I guess the sw architecture accounts for easier DVFS table
replacement instead

Konrad

