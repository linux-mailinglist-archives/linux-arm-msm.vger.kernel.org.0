Return-Path: <linux-arm-msm+bounces-63507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1657AF6FC0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 12:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC7651C215E3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 10:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390C52E1747;
	Thu,  3 Jul 2025 10:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mgfR/5di"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A13299930
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 10:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751537517; cv=none; b=X+HjN13XbF3gE9mbVA2Qq4f4tvs1Uh6TSBSWyxbr32z9/unGbva+sq5xzHKXxcYWaVrOCM4k6T7vNmBNCZsrjkVZgYuDd9rKQiiGY8ZGzk3q70fidCGbprJls1hd+HYpCaA5khzixPt1BOEoTe3NJOQEElXVCv+uGLZfzQPIuSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751537517; c=relaxed/simple;
	bh=SXqmvNk5xjNR1e+bSasH8c4+76O7Nk3NA5TvxPr4wH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kswX/XKntjyPKQwRkMBc34g42K0rbLlOuxDbUO7ZIdAyamLJEnsRUqxpfhsV1FzeWgFszgVUejv+WCVZTnXBE19nMWY2AsuvWDNIOqya09QLpqx2H3bg9TTMPXWFGCarq21EtRUsEcNwYo0KJuOGlAgzARSqdmd5H9GTQqFnt/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mgfR/5di; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5634xas0020529
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Jul 2025 10:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rjs2zG0olMi2WBhDfhSicOFTc6OJl1S38SXeGGRjwgk=; b=mgfR/5dinw9hXw4R
	932ijZlFhvg2GEXCN2EqjePFEqrCecd1P/EA+MfnjRzxOj8Mu/rLVMPhsMf5StGy
	Kddnqr9xYm/tBd7GNWUBDZqodtkUjnhxQqRj0wrDyY0VgiPg4k9ushhNBPKdm1YX
	n9BYYoOOq/AmIlsIsI4OEiMlrTBWEdqT44VKtPj4KVP/8nCHiDC6aGcPadaSdtko
	hYy6A1EnRlGyO5/eZI2oyP72a9IukSLNiKvpb4Ms2O6pnVR4bwAcPMoCgg15Zjc+
	7NsOOQvCf6AGmzBn+1zzlDGX3T4IVkv57muEqgYofUtpmCcnNUgIH3pStgO8lmsq
	vY0oUQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn6my4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 10:11:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3ba561898so98839285a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 03:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751537513; x=1752142313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rjs2zG0olMi2WBhDfhSicOFTc6OJl1S38SXeGGRjwgk=;
        b=FHXle8Vh75Fon27syiFQQQ8EV21ydfaE5QYkWXdv0yawjE9EidldWaBHA87v2IjhW3
         SkBbkzAU2m7nHE9D51AG4f1GN/7RF8n79h8GfAiA1nybkQhulBUS4MxwmKGalCb0N6pP
         zmXveS9mAcrgQ5MQlb8uJTT8HVMFaVJ9vmz1nhr+8814WCJp3c3RPbdYte+irmRKsuq1
         KFk4ECjAZJqSrRRG7oLFCq2DjfgUyZRJqK+O3GzvG7Rhh6ZeigB5UhjOUrccHg94LqXb
         legJJZnhYvOaS9tBzuoUeaywVEAo4Njx0TWceiDLghtNxrF441ksYu5PywUrb5jqbbOf
         GZbg==
X-Forwarded-Encrypted: i=1; AJvYcCUSeOqdJP2E+nyKVJTVv3DQKKfrLw9bQd6ScV14XaSi47QWHbbqcTa5hukgIA9SowPODgliglvdiTnPnKLW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3SRy9lWEpuDjfAr1zU+FLh/G3OdTpPGo5YeORUY4AU9XPOLVF
	pcDyUKlRApDYDCJg6K/Y01qiy7RxD25aYngiA6Jk/KOQ1Ofs8ywzAZvLBUFqWByhKhbbwUTcoTC
	FhwXHSHVTSh8vR4ZahVsFVQQcqDqwwkv/8eWq0Kn71p0+sxQ9VnObXl4S0Q+LcRMKGETE
X-Gm-Gg: ASbGnctoKPZiczSA406E2Oa7R/nAq7b3fJsmrxXyhMHZLBU+U82mz7KDM3hMCmgPLPo
	fsgOyM7fT+/FzF7KbENh/mcqpT6ts2dszb+va637Lob/mfaUAK+XmH92NBdFNtcTbnQnS7vi5RS
	YED9S2eQQbw+bx9QG2bqC9v2DsWnV/0/jSD1vIL+ePmgxbdsZEbtb2GRcLUOMqZSrd6NOjVQyN5
	lsXCfpP8nAapnZlneqkbBgYAVIXujWTPidyWmOAsQTvgzqZt+kbFTMliPCm5sJztxXToY6QJZja
	5ds3+Ucom1HDazkmxws6ZMp1gvHV1Z+8PfhQbl4IB5zNuyNvJmohdqyZ02WJu/+F1ClsHV+dJTe
	VJSUaWFP5
X-Received: by 2002:a05:620a:408a:b0:7c3:bae4:2339 with SMTP id af79cd13be357-7d5c476ce96mr283789585a.11.1751537513405;
        Thu, 03 Jul 2025 03:11:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFX7t33jjb6+MjEEp4NTcZ6saiozTBTdHXN/fHgOcFnOYzbFhWpMILY+eZlTekre5eOFqnufg==
X-Received: by 2002:a05:620a:408a:b0:7c3:bae4:2339 with SMTP id af79cd13be357-7d5c476ce96mr283787685a.11.1751537512772;
        Thu, 03 Jul 2025 03:11:52 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b42asm1223925366b.25.2025.07.03.03.11.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 03:11:51 -0700 (PDT)
Message-ID: <6e855928-9a29-42bd-9b6c-b560a76ff73d@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 12:11:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] media: dt-bindings: add non-pixel property in iris
 schema
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <20250627-video_cb-v3-1-51e18c0ffbce@quicinc.com>
 <19dd2e69-ad13-46f2-b99f-04a5e26f10d3@kernel.org>
 <08c8cdfd-099e-7b90-b163-23ecee3a5da4@quicinc.com>
 <118f2cbe-d8bd-4177-b0d5-91d9f1dbbef0@kernel.org>
 <9f5be122-302d-402f-91f2-675507612d32@oss.qualcomm.com>
 <023038d4-2258-4b2d-a3f9-b817ef0173bc@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <023038d4-2258-4b2d-a3f9-b817ef0173bc@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA4MyBTYWx0ZWRfX3wQanpt1cx4q
 EFn6I+vejVZbye4eohHaPpgox1wB3UYOoHfxQ2QyhkcSAiDnkLsWq6+V48jaIFvIteqkwceud19
 CtZ+GlQM+1WvmSDwBwUovHh0YwIm5U21hAGCLLQnpMzTdq6zHxnvb9VmJZZNUwoODE9jXbmuLWQ
 4BkeJaX8v1HpPKHr9VTji/WT6+k/7eNqSo61TWvoaAJpv7sWOIJgFGgVgnynh328CtQyrBQtaJc
 WRqOVpxcT8jxYfG3dCj4iiBkjKKImt+qHS2VJ9Meh3LDU9E9KRZ0SnM5xd4osQtu7eI9XB9J0/P
 Xnbq4aoTltaUHoTZAFhWZ0E6HQ7fdSxGKrWWDGXR5/RGoSpUvs6oL+dez6t9QGWzHXrvuIR+j2o
 GhzJ1C3RTjQH/jSMu697in00C/oeRjW4MDc/ghXcrrxdWoohsjQY10737qCWNTIvrAT/DfoK
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=6866576a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=Oh2cFVv5AAAA:8 a=ne4MQ-n4Ak7v_mLgEmoA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-ORIG-GUID: GOwU3ilqjD3VhSHZ3kvIGPQ8RPsbu5HR
X-Proofpoint-GUID: GOwU3ilqjD3VhSHZ3kvIGPQ8RPsbu5HR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=990 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030083



On 02-Jul-25 15:59, Krzysztof Kozlowski wrote:
> On 02/07/2025 15:11, Konrad Dybcio wrote:
>> On 7/2/25 1:46 PM, Krzysztof Kozlowski wrote:
>>> On 02/07/2025 13:32, Vikash Garodia wrote:
>>>>
>>>> On 7/2/2025 4:43 PM, Krzysztof Kozlowski wrote:
>>>>> On 27/06/2025 17:48, Vikash Garodia wrote:
>>>>>> Existing definition limits the IOVA to an addressable range of 4GiB, and
>>>>>> even within that range, some of the space is used by IO registers,
>>>>>> thereby limiting the available IOVA to even lesser. Video hardware is
>>>>>> designed to emit different stream-ID for pixel and non-pixel buffers,
>>>>>> thereby introduce a non-pixel sub node to handle non-pixel stream-ID.
>>>>>>
>>>>>> With this, both iris and non-pixel device can have IOVA range of 0-4GiB
>>>>>> individually. Certain video usecases like higher video concurrency needs
>>>>>> IOVA higher than 4GiB.
>>>>>>
>>>>>> Add reference to the reserve-memory schema, which defines reserved IOVA
>>
>> [...]
>>
>>>>>>    dma-coherent: true
>>>>>>  
>>>>>> +  non-pixel:
>>>>>
>>>>> Why EXISTING hardware grows?
>>>> Same here, the commit describes the limitation of existing design and also
>>>> explains the need for having the non-pixel device. Its not that the hardware is
>>>> growing here, rather the hardware stream-IDs are utilized differently to get
>>>> higher device addressable range.
>>>
>>> You are not doing this for a new device. There is no new device here at
>>> all. Nowhere here is a new device.
>>>
>>> Changes for a new device COME TOGETHER with the new device.
>>>
>>> What you are doing here is changing existing hardware without any
>>> explanation why.
>>
>> This is bindings getting a reality check.. this goes as far back as Venus
>> existed (msm8974/2012)
> 
> This won't fly. This is a new binding after long reviews and
> discussions, why Qualcomm does not want to extend existing Venus but
> needs completely new Iris. Well, if you get completely new Iris, you
> cannot use argument of "legacy". We insisted on growing existing
> solution, but choice of abandoning it and coming with a new one means
> you were supposed to do it right since there is no legacy.

So maybe I worded this in an unfortunate way.. I meant Venus the HW
block, not Venus the driver. Even the ancient msm8974 has the same
addressing limitations and a separate IOMMU domain for
non_pixel/secure/etc.

>> We unfortunately have to expect a number of similar updates for all
>> multimedia peripherals (GPU/Camera/Display etc.), as certain mappings
>> must be done through certain SIDs (which are deemed 'secure') and some
>> hardware has general addressing limitations that may have been causing
>> silent issues all along
>>
> Isn't all this commit msg here about non-pixel stuff just not really
> describing the real problem at all? This commit msg is very vague and
> silent on actual use cases and actual firmware, so even multiple
> readings of commit msg did not help me. Stephan Gerhold now nicely
> summarized what was never told in commit msg - there is a gap in address
> space which is reserved for firmware and no allocations can be done from
> that?
> 
> Also commit msg says "Existing definition limits the IOVA to an
> addressable range of 4GiB, and" but I do not see such definition in the
> binding at all. So what does it refer to?

Yeah, there's many parts to this. The solution that this patchset
proposes will essentially need to be copypasted a couple times if
this is going to go in as-is.. see qcom,msm-vidc,context-bank (lol)
subnodes, each describing some combination of the above problems:

https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/tags/android-11.0.0_r0.56/qcom/scuba-vidc.dtsi#58

Konrad

