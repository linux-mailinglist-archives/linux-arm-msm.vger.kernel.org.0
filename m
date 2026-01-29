Return-Path: <linux-arm-msm+bounces-91147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +N7OLJE3e2kYCgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 11:33:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F45AEC79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 11:33:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6591530041CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 10:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7643815E2;
	Thu, 29 Jan 2026 10:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KiS+XQfl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Js35qjLH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB63D3815E6
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 10:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769682826; cv=none; b=Zq8AoS1WMtyPCSGBtIpt5vg8PLJlyIlcF01UYQgIUxC3LAoI8u1tWQYU0azYsPwvKtPxrUYrKxwYpX5l5kT7yYwpXNnstHhsT6ZBO307qS6hSrFPOkoDl+4WkGNDpGR3xymAwfBtm3r5yZBoZcdtDGhfvNq4AN2qFiLiq6c3LyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769682826; c=relaxed/simple;
	bh=RKjzM+AzWEd2xLqDveQmeQFdcy+M78s4wSRN+pTC75o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LVoHDTEEL8HRPnjsWT4h8+y3qenEeBvrbTfVHpUyk86ucBISw2KrB4ByNyr1Dms9mvqC+xbV0f+izl8HvVxsmzid0v3+T1DgeGv6SXisykf8NswEWcB1ge2LOJqkuh5LAvHWc13j2iPZDXeXiPcl/BkLfLbQGbxRdIs1J/DHcNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KiS+XQfl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Js35qjLH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TARFPd1565022
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 10:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XniacV/s3o9H91GWrpTbMKzmS7SyJtuAfhbd5BWpqpY=; b=KiS+XQflezgVQ6GB
	ta7uC/l56nU9wSgZ1xd0mERxwlyJi3hbc7+QJGgfSietA3fh8Y+YZzUQaQAvQI+h
	JWQsjGCxuN1dp3RaZx/NQy/7jUpW+55v7p0SKWQ2SO2WIP4PuAGgyI3jZNFHwf7a
	RzdgmbXEvbkTjK5XBj15EkV+YMSlBt2nZO7NT3zlSrVAsn7yWHmtBz6JJ4mVBe8y
	X7bsAhFx9x4Tq/aAoB2NV119k98/uoU22Ld2s+Lsa7ASlOigFVH5+EJIw4KvCtT+
	meLWbMJc3c6iKyg8CFyFMu0IkLLIIho+5tHjg+2n/BrsAysVuJJrSY+yS5gaKDEU
	IhtsLQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byusfhx7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 10:33:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a8c273332cso13574075ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 02:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769682823; x=1770287623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XniacV/s3o9H91GWrpTbMKzmS7SyJtuAfhbd5BWpqpY=;
        b=Js35qjLHvt8aLS3/CjYi8nhKmZDbpX/deeWlocTp8ASIv3tPs6AHlDODept9BQlqD6
         nBpAwZWqLGPtDwSvxdg29jh/ktUmPFGUtrfHJZbgHMygsI/dyPCofg13RnXqlplvs1bG
         fKAec4eiI+AxAhtYuTLB/ccF7Z3O9xtykMGRSfRjvh23oeQJJbEJ+l0IfDQtpIU4syFE
         I5JrrHcL7IbjUR9RX+mDCRAmNqsDAKD5RVGZ3oafXAoP6NPkdaLBQ1SiCEQ6NpSDbI7s
         CtyiPbV5/0ugD+Bn1u5z1zdTjrd2A9SSnj9Ak20B8dJfwFz2eNJZosA8aqnAOwfcTKdr
         HAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769682823; x=1770287623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XniacV/s3o9H91GWrpTbMKzmS7SyJtuAfhbd5BWpqpY=;
        b=xRNQQUvk7xymZNFFGTpMWdoGyKlyXGo015ABwO/QBNSUK9IWq/xzVpS6bqMP76CggX
         rfnOcymfwPrd81951b9X+3LPcusGMi9mEfMgCefr4mE2t0RLUwQb4ic2sDxKU8wAUnex
         3gN0LrXOvBpgXql4mjObJUwD0ZgIMtb+qJyL5I/w/4hZ79iRi4MgXMXV5i+MAGZV0R38
         apYcbKsOLUrGsXmd4A9ERA+ft5IaKOYO/NQLmZR++7s0+FmcFYXTf9jOjXwoqUSkXASn
         ljBqJIKvdD1Lj14NidOvkUL+xSzZwO1icVakYgOv7oQ1GjmN1RcW8+4yhPr69WiqSYTs
         BQng==
X-Forwarded-Encrypted: i=1; AJvYcCVGwo2ziWiPcrQybvxEqKZ0G6VQuEhvr2X3v8JL8jJfzWB2wtjPYF8uy8SEP7b2X/g1xHk8aKSKnVJFbCEH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+jgYerFB5OHAJiqlxdJPNLNeQFRQEGDCMitb2tfgRbdJvKaoD
	EaEUPe31uqjNIAYQdgolBRcM9Uxm2+cnlGd6EzppEbvPYDehK6wm2s+R2hhAnpLEzJQCJYhysqr
	hvvFL/J4p6N17k8xjAc2qFXej23E+zvN955zSjLeNuwyyPruX+rwF42wB0UKcSTTlKEAe
X-Gm-Gg: AZuq6aKqT/92CGg+lfhb2oj+nqcKW3Y0EoyIHX4ZEkdw+aXZq81KbGEEUuSXBXE0E5N
	Og/Yb4D9WgxjfdgXxPflRl4yZtLvi3b6N9wLjXKJ7bCkFQ+ttdQBtJRwfqh/eUuKIcMDIIpj30D
	oDxHKdOoBjPz0FSP6mltHGT1o5kVkGyI8bKxscWORDAONDeouwcImwS/ETpmCcb4Xt4ADpM2TLr
	PnLCmeZsRF3jRrTgi2CXco5M860aWWF+8OxDe5jV8nzBvllHgUXI4mqPAY4yFri0/jCcn7DMZkR
	YjN56rRESwJuID2LI9DBeafqgyn1kPoZgYQscdcVjYegvL5uYznKpfvIGzid/vxPfA6sMaLnkMR
	gdeZVAAnN9/jjjS3374xty5Lt0RHORnrAXz+Oum87FZExTetu
X-Received: by 2002:a17:902:cccb:b0:2a0:9ca7:7405 with SMTP id d9443c01a7336-2a870dc9634mr87914215ad.36.1769682823238;
        Thu, 29 Jan 2026 02:33:43 -0800 (PST)
X-Received: by 2002:a17:902:cccb:b0:2a0:9ca7:7405 with SMTP id d9443c01a7336-2a870dc9634mr87913935ad.36.1769682822728;
        Thu, 29 Jan 2026 02:33:42 -0800 (PST)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3d2bsm48006435ad.53.2026.01.29.02.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 02:33:42 -0800 (PST)
Message-ID: <81f0ee3c-a7e3-4730-a396-9599ddd45f53@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 16:03:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi-pinctrl:
 Add SA8775P and QCS8300 pinctrl
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260127105511.3917491-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260127141740.GA1574044-robh@kernel.org>
 <9f5436df-fef7-4921-85b3-b6fe4e942779@oss.qualcomm.com>
 <CAL_Jsq+YYxWKaD-Xo7L3VUAJ=wvpbfW9GkKn0gcj3AOvMb=Uhg@mail.gmail.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <CAL_Jsq+YYxWKaD-Xo7L3VUAJ=wvpbfW9GkKn0gcj3AOvMb=Uhg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Ptp1e-Hro1YbgflV_3vSYHXwZVH_O-c_
X-Proofpoint-GUID: Ptp1e-Hro1YbgflV_3vSYHXwZVH_O-c_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA2OSBTYWx0ZWRfX834pdMu1+vWP
 N5TytLUyFXSTb9dgu2wVicnqvt3hHnAEi0/NH06AFZpMva41zW6RTng1Omg4KnbMoN6Bu1UZLkM
 a0CdLX6hAZR19jG981HcQ+2Thg2+ssKKEtp13T4oe830yyFg7AdC076pDjkPp/WWhmQXpmqCelU
 vTbU9C/UYIXTX5CZ65G/Z1PcoFBqMVjiQx8lZhpMh2sEUVWzg4qgIXmT9YESqMJLWhEf7x0mbdr
 jfEleFA1GwwIpJ4oFzTTsB9KCm3OxuC71qND+U4flNguaD5AJx8FKweMZ8swRDwBdgrMsL010HI
 uVzO1oCXx9yZXhRDcOVHNUEaIEGrSHRYUooBturQmDFVAM6Vej/jR00bZcvMPERVHDupDi0ILGt
 7I7Uu6t3rBhJ1UvLSq0qnWdauX8EUX0UtPwOxUudNeqnyrZ70fVmNt9rw1/ytnOEH41zumcYFBS
 mVMc2PTz8GveffFU11w==
X-Authority-Analysis: v=2.4 cv=YtIChoYX c=1 sm=1 tr=0 ts=697b3787 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=iS5eDfI7LrtSjKTbtTEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290069
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91147-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 59F45AEC79
X-Rspamd-Action: no action



On 1/27/2026 11:57 PM, Rob Herring wrote:
> On Tue, Jan 27, 2026 at 12:13 PM Mohammad Rafi Shaik
> <mohammad.rafi.shaik@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 1/27/2026 7:47 PM, Rob Herring wrote:
>>> On Tue, Jan 27, 2026 at 04:25:11PM +0530, Mohammad Rafi Shaik wrote:
>>>> Document compatible for Qualcomm SA8775P and QCS8300 SoC LPASS TLMM
>>>> pin controller, fully compatible with previous SM8450 generation
>>>> (same amount of pins and functions).
>>>>
>>>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>>> ---
>>>> changes in [v3]:
>>>>    - Removed the duplicate driver code patch as suggested by Krzysztof.
>>>>    - Reused the existing SM8490 pinctrl, which is fully compatible with SA8775P and QCS8300.
>>>>    - Link to V2: https://lore.kernel.org/all/20260107192007.500995-1-mohammad.rafi.shaik@oss.qualcomm.com/
>>>>
>>>> changes in [v2]:
>>>>    - Fixed dt-binding errors reported by Krzysztof and Rob.
>>>>    - Added proper slew rate value for wsa2_swr_data GPIO, as suggested by Konrad.
>>>>    - Documented Monaco compatible as suggested by Konrad.
>>>>    - Link to V1: https://lore.kernel.org/all/20251116171656.3105461-1-mohammad.rafi.shaik@oss.qualcomm.com/
>>>> ---
>>>>    .../pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml         | 10 +++++++++-
>>>>    1 file changed, 9 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
>>>> index e7565592d..354629c38 100644
>>>> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
>>>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
>>>> @@ -15,7 +15,15 @@ description:
>>>>
>>>>    properties:
>>>>      compatible:
>>>> -    const: qcom,sm8450-lpass-lpi-pinctrl
>>>> +    oneOf:
>>>> +      - const: qcom,sm8450-lpass-lpi-pinctrl
>>>> +      - items:
>>>> +          - enum:
>>>> +              - qcom,qcs8300-lpass-lpi-pinctrl
>>>> +              - qcom,sa8775p-lpass-lpi-pinctrl
>>>> +          - const: qcom,sm8450-lpass-lpi-pinctrl
>>>> +        minItems: 1
>>>> +        maxItems: 2
>>>
>>> No. You are either backwards compatible with sm8450 or you aren't. The
>>> h/w is fixed.
>>>
>>
>> ACK,
>>
>> Agree,
>>
>> Need backward compatibility with sm8450 for both sa8775p and qcs8300 as
>> they must fall back to the sm8450, so initially used enum to pick
>> between the sa8775p and qcs8300 compatibles. I see enum isn’t
>> appropriate here since fixed h/w.
>>
>> will use the const instead of enum like below.
>>
>>    properties:
>>      compatible:
>> -    const: qcom,sm8450-lpass-lpi-pinctrl
>> +    oneOf:
>> +      - const: qcom,sm8450-lpass-lpi-pinctrl
>> +      - items:
>> +          - const: qcom,sa8775p-lpass-lpi-pinctrl
>> +          - const: qcom,sm8450-lpass-lpi-pinctrl
>> +
>> +      - items:
>> +          - const: qcom,qcs8300-lpass-lpi-pinctrl
>> +          - const: qcom,sm8450-lpass-lpi-pinctrl
> 
> Sigh, no. The 2 entries can be combined like you had. Just drop
> minItems and maxItems from what you had.
> 
> And test your binding before sending it.
> 

Sure, I’ll take care of it going forward

Thanks & Regarding,
Rafi.

> Rob


