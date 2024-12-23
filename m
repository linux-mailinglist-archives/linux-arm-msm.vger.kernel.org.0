Return-Path: <linux-arm-msm+bounces-43119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 323599FADB5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 12:31:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 519AE188392C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 11:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05B4C193403;
	Mon, 23 Dec 2024 11:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L1Krs7a4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491F118BC3B
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 11:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734953494; cv=none; b=me1i3nlhccQe0kj1DejFOzrHcea7S2ViPsGLxM9emt7zj4kCTTYf7cnFP+rl2np7zhrPHY4iTIYcuxRxG1IAO4XsVrnHTXpOByjTo59z/ZTEo52pXdYvIOMCavLOqJcv1Qmw+T3DllAbpWWfx3Pf/GPKiKVPGHXaOYz4x4PepU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734953494; c=relaxed/simple;
	bh=yHVjdt4KlpYirn1OcUNUxpE7jjVfEKIzCx4CspOUxnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jVDqGaM65TkV/LNQ5qxPKTGU1vl/W6M0F02opMivQbLDL53OttMSRObY/ClZwLJRUeFe/p7d77AfrEE0S/fwx0FD3Vut8df0X7+ikOfIyFVjLt6cmBSRgsGY+Ddl89yIGyRWYs9TH2VagyOie3dtB6FlqOHAXe/blC8bP2WSQVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L1Krs7a4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN5rWH4018283
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 11:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	27LM7vBRwJrP/CtKAkZzLcFNepSTplUr8d45Ew5sahw=; b=L1Krs7a4wq9Pg9IR
	DMvL3U0/oWv3XTXo2aoYC4WiuWw37qi6quyA++/Awm7kIIgwjYyh9dT3qvS+ZMQz
	XX1cB+FT+NSpf0E+/EviXGWedMsQjjXtik0OXy2SPb7sGjdnnPw//JRUaORa4feW
	G1ltBsNbQwKCCbhg6ppmyEhKhAdqqbO7E3BkBW2/2KtbalHhfYEs8bLJmjAWcABp
	VLubOZ8zlgfrrzGGZ/2r/1d2pxCRBriy2gLbqfeNCWZ790Z+1X1SswO+ABGhEzKL
	0ZqVrSHSqec7oWGoXmUnYGQLK1iHuTRVAq+KAgN+9YJq/1qOeqTUwGPz/UU5kqKh
	a/5sfw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q24593qe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 11:31:32 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d88fe63f21so10336626d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 03:31:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734953491; x=1735558291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=27LM7vBRwJrP/CtKAkZzLcFNepSTplUr8d45Ew5sahw=;
        b=o9Q2Wh8e32k065h2c1Yyj2L7phi04DPRatHefbGTWyVVFGO9fuXuN3Cu3zD50YPwdK
         ne0ELi+nCVq9Tna6nkG3RYFmFicw1Cy5XKBgjAXqxLj+QVXD4scj24YJ9fmFfG6HaNlr
         Z2Cy7gKj2uBDeXq6L97QLz9DuSJtIRBZfNHD+1vo5pxYi1ljCXhB4AyQR/XGorh+Ef48
         REgQm+BOhMEG7T0MFnqeMuAL9PIUV0MTzl10g54ST1HHzGstztxOXcU2oM+qLg5mKz6/
         y8iMC1eRc5H6nmj0o81Po3pcc1y3JWspwm3aMITsPiYvO9+cWQL4akSugON+vgC2ibP2
         Essg==
X-Forwarded-Encrypted: i=1; AJvYcCVYtg3eJ1apWI+nxVG70/ITqP6Q5sRJIoyLQ/BDlTtuBQZHzgH5YyexbILUrlzTvmiWhzKpZY93NKmYu16I@vger.kernel.org
X-Gm-Message-State: AOJu0YzSCbZntUDfcTejtU7QxkPJ6N3mwchv03PLCaaNJq0YT3/kO5iG
	ZGrqTghHH+msu7hAZMIXFfbKmXfN7qa6mhZYSu0IJZQLIwGlwPeNbIRmVuCuFok71Im/5fhpIkD
	pzfImMywwkfRdyG9L5/wE74T8vEoOFHUFKxVEZhKaQZucBubrKrqwtGLvK4beyUFo
X-Gm-Gg: ASbGncsMu4BaS19g29OGiWqoGRuN7tVo4aBDK3g+O0uFyH9e3COrpGt6pKAvyMjtDWR
	LOnDFPvZwjL/L6Fa1cOtZmy5oUa7IJpOgiuE1rIfBohQ/vjs6qcb4GPwBlmYmkEDIpQGnAbb30B
	RyjkNjCdDMezklL7Z9PozQ1SSXrBwB0dkpogeFnBEvd818Wlng3u44Worr5PtUBEYH4pA2MVq1n
	rsfyZWE9oiQQ1xbiNwQEzYOOzGuGcliuZNRT1dUEMb0P1kTOMCUniOXmor9buZxeai4gos5GW4f
	SeTTugMJ0prz0C3Nlj5MNVxsIEOeahzDZMU=
X-Received: by 2002:a05:620a:4108:b0:7b6:c3ad:6cc5 with SMTP id af79cd13be357-7b9ba7be550mr712275885a.8.1734953491083;
        Mon, 23 Dec 2024 03:31:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvwO24UGsNvg7bUmjw5WDK3t0LO4IlGiUGkEO33GSi4HQPnTDCdY7hqz7Af059iiH2mtM0Ag==
X-Received: by 2002:a05:620a:4108:b0:7b6:c3ad:6cc5 with SMTP id af79cd13be357-7b9ba7be550mr712272385a.8.1734953490549;
        Mon, 23 Dec 2024 03:31:30 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aaec0aa223bsm217851666b.173.2024.12.23.03.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 03:31:30 -0800 (PST)
Message-ID: <16e1145c-6ef4-4274-a8f9-966f0edef9fe@oss.qualcomm.com>
Date: Mon, 23 Dec 2024 12:31:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: opp: Add v2-qcom-adreno vendor
 bindings
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20241021-gpu-acd-v2-0-9c25a62803bc@quicinc.com>
 <20241021-gpu-acd-v2-2-9c25a62803bc@quicinc.com>
 <mz4zpcr4tqh2w7vt75f4ofxjzfve54ozzgpdbi2jjzk5pdxbk7@t36tlt3mmprt>
 <d858dadb-4098-4c9f-b4f0-393dc988db5f@quicinc.com>
 <4426b4kybtac6rc4twa5pgm3hvlegofemvqjcrvh6ni7f5z2h6@5dnlv3hgywh5>
 <c5e868e1-2dae-466c-a6fc-ef0f247fa0ce@quicinc.com>
 <278e62e1-02a4-4e33-8592-fb4fafcedf7e@quicinc.com>
 <CAA8EJprgshjbNqNErOb06jqV__LmbWvocsK5eD8PQqL+FaLb1g@mail.gmail.com>
 <f67c72c3-7393-47b0-9b9c-1bfadce13110@quicinc.com>
 <CAA8EJppy+V9m-t_qPEJh2iTkC7tyDcf2y8wD9vYoHtFSp=HrkQ@mail.gmail.com>
 <982686bb-0ddd-45a2-b620-564af4f01800@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <982686bb-0ddd-45a2-b620-564af4f01800@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SPTzo4ZSCx82jKoRz2UYZWkgtiIQXkAS
X-Proofpoint-GUID: SPTzo4ZSCx82jKoRz2UYZWkgtiIQXkAS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 mlxscore=0 spamscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230103

On 4.12.2024 7:18 PM, Akhil P Oommen wrote:
> On 11/16/2024 1:17 AM, Dmitry Baryshkov wrote:
>> On Fri, 15 Nov 2024 at 19:54, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>
>>> On 11/15/2024 3:54 AM, Dmitry Baryshkov wrote:
>>>> Hello Akhil,
>>>>
>>>> On Thu, 14 Nov 2024 at 20:50, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>
>>>>> On 11/1/2024 9:54 PM, Akhil P Oommen wrote:
>>>>>> On 10/25/2024 11:58 AM, Dmitry Baryshkov wrote:
>>>>>>> On Thu, Oct 24, 2024 at 12:56:58AM +0530, Akhil P Oommen wrote:
>>>>>>>> On 10/22/2024 11:19 AM, Krzysztof Kozlowski wrote:
>>>>>>>>> On Mon, Oct 21, 2024 at 05:23:43PM +0530, Akhil P Oommen wrote:
>>>>>>>>>> Add a new schema which extends opp-v2 to support a new vendor specific
>>>>>>>>>> property required for Adreno GPUs found in Qualcomm's SoCs. The new
>>>>>>>>>> property called "qcom,opp-acd-level" carries a u32 value recommended
>>>>>>>>>> for each opp needs to be shared to GMU during runtime.
>>>>>>>>>>
>>>>>>>>>> Cc: Rob Clark <robdclark@gmail.com>
>>>>>>>>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>>>>>>>> ---
>>>>>>>>>>  .../bindings/opp/opp-v2-qcom-adreno.yaml           | 96 ++++++++++++++++++++++
>>>>>>>>>>  1 file changed, 96 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
>>>>>>>>>> new file mode 100644
>>>>>>>>>> index 000000000000..6d50c0405ef8
>>>>>>>>>> --- /dev/null
>>>>>>>>>> +++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
>>>>>>>>>> @@ -0,0 +1,96 @@
>>>>>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>>>>>>> +%YAML 1.2
>>>>>>>>>> +---
>>>>>>>>>> +$id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>>>>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>>>>> +
>>>>>>>>>> +title: Qualcomm Adreno compatible OPP supply
>>>>>>>>>> +
>>>>>>>>>> +description:
>>>>>>>>>> +  Adreno GPUs present in Qualcomm's Snapdragon chipsets uses an OPP specific
>>>>>>>>>> +  ACD related information tailored for the specific chipset. This binding
>>>>>>>>>> +  provides the information needed to describe such a hardware value.
>>>>>>>>>> +
>>>>>>>>>> +maintainers:
>>>>>>>>>> +  - Rob Clark <robdclark@gmail.com>
>>>>>>>>>> +
>>>>>>>>>> +allOf:
>>>>>>>>>> +  - $ref: opp-v2-base.yaml#
>>>>>>>>>> +
>>>>>>>>>> +properties:
>>>>>>>>>> +  compatible:
>>>>>>>>>> +    items:
>>>>>>>>>> +      - const: operating-points-v2-adreno
>>>>>>>>>> +      - const: operating-points-v2
>>>>>>>>>> +
>>>>>>>>>> +patternProperties:
>>>>>>>>>> +  '^opp-?[0-9]+$':
>>>>>>>>>
>>>>>>>>> '-' should not be optional. opp1 is not expected name.
>>>>>>>>
>>>>>>>> Agree. Will change this to '^opp-[0-9]+$'
>>>>>>>>
>>>>>>>>>
>>>>>>>>>> +    type: object
>>>>>>>>>> +    additionalProperties: false
>>>>>>>>>> +
>>>>>>>>>> +    properties:
>>>>>>>>>> +      opp-hz: true
>>>>>>>>>> +
>>>>>>>>>> +      opp-level: true
>>>>>>>>>> +
>>>>>>>>>> +      opp-peak-kBps: true
>>>>>>>>>> +
>>>>>>>>>> +      opp-supported-hw: true
>>>>>>>>>> +
>>>>>>>>>> +      qcom,opp-acd-level:
>>>>>>>>>> +        description: |
>>>>>>>>>> +          A positive value representing the ACD (Adaptive Clock Distribution,
>>>>>>>>>> +          a fancy name for clk throttling during voltage droop) level associated
>>>>>>>>>> +          with this OPP node. This value is shared to a co-processor inside GPU
>>>>>>>>>> +          (called Graphics Management Unit a.k.a GMU) during wake up. It may not
>>>>>>>>>> +          be present for some OPPs and GMU will disable ACD while transitioning
>>>>>>>>>> +          to that OPP. This value encodes a voltage threshold and few other knobs
>>>>>>>>>> +          which are identified by characterization of the SoC. So, it doesn't have
>>>>>>>>>> +          any unit.
>>>>>>>>>
>>>>>>>>> Thanks for explanation and other updates. I am still not happy with this
>>>>>>>>> property. I do not see reason why DT should encode magic values in a
>>>>>>>>> quite generic piece of code. This creates poor ABI, difficult to
>>>>>>>>> maintain or understand.
>>>>>>>>>
>>>>>>>>
>>>>>>>> Configuring GPU ACD block with its respective value is a requirement for each OPP.
>>>>>>>> So OPP node seems like the natural place for this data.
>>>>>>>>
>>>>>>>> If it helps to resolve your concerns, I can elaborate the documentation with
>>>>>>>> details on the GMU HFI interface where this value should be passed on to the
>>>>>>>> hardware. Also replace "few other knobs" with "Delay cycles & Calibration margin"
>>>>>>>> in the above doc.
>>>>>>>
>>>>>>> Usually the preference for DT is to specify data in a sensible way
>>>>>>> rather than just the values being programmed to the register. Is it
>>>>>>> possible to implement this approach for ACD values?
>>>>>
>>>>> Krzysztof/Dmitry,
>>>>>
>>>>> BIT(0)-BIT(15) are static configurations which doesn't change between
>>>>> OPPs. We can move it to driver.
>>>>>
>>>>> BIT(16)-BIT(31) indicates a threshold margin which triggers ACD. We can
>>>>> keep this in the devicetree. And the driver can construct the final
>>>>> value from both data and send it to GMU.
>>>>>
>>>>> If this is acceptable, I will send the v3 revision.
>>>>
>>>> Can the upper bitfield have a sensible representation in DT (like uV
>>>> or something similar)?
>>>
>>> Closest approximation is quantized voltage steps. So, unit-less.
>>> Converting it to the exact voltage requires identifying the pmic voltage
>>> steps and other stuffs which are outside of my expertise.
>>>
>>> It is convenient if we can abstract it as an integer which correlates
>>> with the voltage margin that should be maintained for each regulator corner.
> 
> Krzysztof,
> 
> Could you please confirm if this approach would be acceptable?
> 
> To reiterate, move the lower 16 bits which is same across OPPs to the
> driver. Abstract the higher 16 bits as number of quantized voltage
> margin when ACD mitigation gets triggered.

I know I'm not Krzysztof, but given this is ultimately a magic value
passed to the firmware, I'm a bit lukewarm on decomposing it and would
rather see the entire 32b passed in a property, so that if a future
target needs a different constant in the lower word, we don't have to
pull our hair out again, trying to add more spaghetti logic to account
for that.

Konrad

