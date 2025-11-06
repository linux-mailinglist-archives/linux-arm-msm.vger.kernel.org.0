Return-Path: <linux-arm-msm+bounces-80638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CC6C3C7A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 17:37:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0D18B507230
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 16:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ADF334F475;
	Thu,  6 Nov 2025 16:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0rvNLlC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hbfJj2T4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5978334F47D
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 16:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762446279; cv=none; b=Ud912eQcAOZw2tlmykxRQxBkIZxQKLQ/F3RWhJSJ9GFzYzdhr0ZBD8WuemX20GIss7i7LoS/vQSQrzdJrhaS2gWCUTN5lqklmEli98YQQOONSKU+ufIoy9cVoDd32RlqiTOegwwqHcniLo1bE+8qDitmxkW1c4vj/LuSl5bIdrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762446279; c=relaxed/simple;
	bh=rjswRZ8fYhP4ZArBfQ59SFM5Xabj5yCS0dt7YlTsIBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DrO3UnRuWVhGomo94gqC/2mfnkHFAPrUnEVvPrtGdA5GUEKPAUtSxl8u2B0MUl179O4rFYjML8bnTFf5e9qSLyPZmORzEqn9XoFZuW1lek+fGbP26dKn2ioMKVMzWoYTjChUq4lcJvIoiqNNy9bKHD9O4n2t1d4JAQvhttjmHiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0rvNLlC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hbfJj2T4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A68jd7D3383359
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 16:24:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4eBKMzZBS7fv3JxWVRUTQzW9MQESzHB6KUZ8he5atGY=; b=b0rvNLlCuRSAqU10
	QdM4/aLzdJesi3j2jAsxbWDNVM9jS8r2Zjegojx38/hThIiv/it3wlKlm0uPASmm
	Sm/PjjcpC6zjZs52DuAUsUSUTCRUFrQFMooZWwCLKRCTUkRRk/oGNEl7hDJ+x+OA
	L5yfJpw6om0dlhsC6QTyzFthp0/j0/FOO0I87J8VVz8wrq/wuJTKJ58sssvw321z
	X39vL3kPJLON18e+YhsDsemYK+OG7rJUTf/TsjURSGXJ863gt1c/S+zyt7jPjnXm
	boxpkFNlkZv6ICMyHAi9akLPjjGF/2wR7Bqe38Bi0JCXva85YH0qK1rTC6rB/QRD
	h8iuXw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8reusbbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 16:24:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed73c9e3aaso1019671cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 08:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762446275; x=1763051075; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4eBKMzZBS7fv3JxWVRUTQzW9MQESzHB6KUZ8he5atGY=;
        b=hbfJj2T46aGnsayllG5bF9m1+hVt4nuYeKfaBKwQtlV5FS95DMgj7uDKCOt08e5D3S
         Of4oQxRdtPcCh15FJuRrg3hCJyK3lWM51AgmLzmIcuFml5EIFJNyTx0x7ze0X2IH+XV0
         jcdCBhnQ+pYsc8pgcEokXGjVBxIEv8D6AmmMwnUNVULVacOOi006TxGkEGHLQk2B3Ip8
         xgP7NJPouHaVf+bLh4s+594Bwyb/3TARJrc4PSj0olY3SX03yJp9h9lXXAnK03tTF2Bg
         p+YEXyVuUhZLS0Lh1nvUh7y2godmrcYYcDSMB/gxaRMtSPGUzfRr1+ij8eUAbAnvIA6b
         KNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762446275; x=1763051075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4eBKMzZBS7fv3JxWVRUTQzW9MQESzHB6KUZ8he5atGY=;
        b=Lp0dRXHX0P1TgnNwb+GjXk0BC5juX9uOf11LrjNThf3pfubvnylejnsN6JHhPhJKNm
         ktr1NtyCEVwFpNVg5r3YQfanUpODxKWy02619y4mmy4Qcxc/rH92uK6RqVgcsC38DVzd
         PvYVptSUc9VQwhJ3P+qGgKpetJ21O1nPmYpBnOVTSVCnsNmQ5cjxcfJvx5N/1KMx3JwQ
         HCwFkzCXtOdY1+WnuKS6wHlFkQWKo9mW1J5sPtgl8zuj9hiXH683ZR4h8vnwfPGNVYiq
         j3dp4wYBwH0bO0sXev+EUzWPUeKUtmpiyzDvbt6JB3hfbUGyLFUuZG7MjOIzynU4BQTi
         zF3w==
X-Forwarded-Encrypted: i=1; AJvYcCXVD8OeKTbOw6j+nZZWccIeAlk5ge+JWvlE7LMxTdTejH4nebs9kGOnsdzp4K9dsflWPUKMiJIkIahYbyTz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9cR1jP7tMyZRVf0J6GTkzClaCvyAC6qDLzA3yd8dkdHeslJ4Q
	TA1GEX4ozdFv4v0cXrrT7uQJTSdSWKQRTJnbGUAfiseUfnV0PLC/TetrHgL+xlL2sG9zWcgjgfv
	Pw1XJy92WSvjV+sd1pmMe9nQWiNlgT6HLJ0OonHiPLQ2X3HwZ8qJrmlqCmJi0F1DY5buY
X-Gm-Gg: ASbGncuZgIAycsTQXR7gHlL1buyFHf+zCAoCYk5XXBGfErjOkedlgCfDgMgfMvUsmJz
	nDOulKh7ZgetNijIXh72Tw48uWdK2IwGUn7UNZkmq6ta9p6ZDv7Pt6t1RkC+kZKwZvfLNz45RZC
	at6ljuBfPCaZgcRAKpO+ezCDndaYJDUb2xjEoRZb9EB7m4+7lUe37XanW3iEN5gVVI5FuLnv/gA
	+APW0lJ7o73RsU5jl2KzaZkW4SXSir9BSFiHU7/MHZv9y0QIKldPsX1BRIfrH+vKP1pdKE5SLbV
	WF/cn0gWltbGKbgTF4e0vDLdRUILxesx5kIY+MA8VOD1O/pHtCWq7ECbuFKqKFB1X8xLY1PrfSn
	H0AwYPSJ+mj7ua1BK3BSqLURjTOwMPv7sD/npJhskV63yufkHnxw/JdgC
X-Received: by 2002:a05:622a:1a98:b0:4e8:85ae:5841 with SMTP id d75a77b69052e-4ed814bd563mr30310101cf.5.1762446275414;
        Thu, 06 Nov 2025 08:24:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0kA54XRtpKBsm1SpgXQVoKL6TSJayG4yUU0vcxufAOcFBD1zUUWSqrNIKZ5aSJxENxX7sPw==
X-Received: by 2002:a05:622a:1a98:b0:4e8:85ae:5841 with SMTP id d75a77b69052e-4ed814bd563mr30309261cf.5.1762446274069;
        Thu, 06 Nov 2025 08:24:34 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f85f8c7sm2485290a12.27.2025.11.06.08.24.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 08:24:33 -0800 (PST)
Message-ID: <01de9616-825b-4fbb-83cf-e0bf91e8cf39@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 17:24:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for Kaanapali
To: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-mfd-v1-1-6c8a98760e95@oss.qualcomm.com>
 <b623c7f6-f28f-49ba-b6f6-25084117a6b3@oss.qualcomm.com>
 <l4mb5pi7kz7uuq6o3eueoxl2ngt2sdd6dv3kyudw6i54co5v5h@w6ya2nuas322>
 <ad00835e-bc20-4f97-aba6-e1b4f5e97191@oss.qualcomm.com>
 <f2q7a7r7quq6pplcn3kklwrhdc6hxa5zvc7osygshtyurwyvi4@t5iyragt7irh>
 <b5ecf5e7-4dc4-41ac-9b56-7c52afacb950@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b5ecf5e7-4dc4-41ac-9b56-7c52afacb950@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDEzMSBTYWx0ZWRfXwEgRhxUGKbE4
 seRKfWbvp/RPT/+V0nOH7WSpyNkAU0CJ4y2piHiSroylHYIF6zEhh/5K9s/UY1oQMswVjFibZys
 RWPKin1P/Vl31MDBB8+v1cweoZGWvMXB/og4gBMmOwKNwrTtZ4/+zNv5p0H5/dgW+TGOMzLvVcP
 3NzNJLcA0lt86iKChEnG6sk4ncwwVcXw9wmTU9Dae1g7DQoMs6tQimd7155taW3xLEN82HBB/og
 xP+hJvfaDpwV2SKJfazQ/Ew4gUH/CQL7rdWz0ISjAPKEB7TawPL+yFkZMwstpCvfxv1B9IFj13E
 spqX6WGQC+Ga1dLVoX9u3W4DxoEaLDJTm16a5fvFc0N1Ktvtv3SE0R/PbDdYMYdI8j8ydyPyS3a
 9EnVWbwdqSzqulXW32hL28muJKlL8A==
X-Proofpoint-ORIG-GUID: SzXzidWFtmK3uDWk4EHt5cu-eBex7o_H
X-Authority-Analysis: v=2.4 cv=RrDI7SmK c=1 sm=1 tr=0 ts=690ccbc4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=NvqmdPLM_IyHh0VbTxoA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: SzXzidWFtmK3uDWk4EHt5cu-eBex7o_H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060131

On 11/6/25 11:16 AM, Aiqun(Maria) Yu wrote:
> On 11/6/2025 5:06 AM, Bjorn Andersson wrote:
>> On Tue, Nov 04, 2025 at 01:35:01PM +0800, Jingyi Wang wrote:
>>>
>>>
>>> On 11/4/2025 12:02 PM, Bjorn Andersson wrote:
>>>> On Tue, Nov 04, 2025 at 11:34:25AM +0800, Aiqun(Maria) Yu wrote:
>>>>> On 9/25/2025 7:23 AM, Jingyi Wang wrote:
>>>>>> Document the qcom,tcsr-kaanapali compatible, tcsr will provide various
>>>>>> control and status functions for their peripherals.
>>>>>>
>>>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>>>> ---
>>>>>>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>>>>>>  1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
>>>>>> index 14ae3f00ef7e..ae55b0a70766 100644
>>>>>> --- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
>>>>>> @@ -48,6 +48,7 @@ properties:
>>>>>>            - qcom,tcsr-ipq8064
>>>>>>            - qcom,tcsr-ipq8074
>>>>>>            - qcom,tcsr-ipq9574
>>>>>> +          - qcom,tcsr-kaanapali
>>>>>
>>>>> It looks good to me. Glymur didn't have this functionality verified yet.
>>>>
>>>> You spelled Reviewed-by: Aiqun Yu <..> wrong.
>>>>
>>>>> Remind for review.
>>>>
>>>> No need for that, reviewers will review when they have time.
>>>>
>>>>>
>>>
>>> Hi Bjorn,
>>>
>>>>
>>>> But that said, most modern additions to this binding follow the common
>>>> format of qcom,<soc>-<block>.
>>>>
>>>> So I would prefer this to be qcom,kaanapali-tcsr.
>>>>
>>>> Regards,
>>>> Bjorn
>>>>
>>>
>>> qcom,tcsr-kaanapali is used to distinguish with binding for GCC:
>>> https://lore.kernel.org/all/20251030-gcc_kaanapali-v2-v2-2-a774a587af6f@oss.qualcomm.com/
>>>
>>
>> So, qcom,kaanapali-tcsr is the clock controller region of TCSR and
>> qcom,tcsr-kaanapali is the non-clock controller region of TCSR?
>>
>> Sorry for not understanding that earlier, but this doesn't work for me.
>>
>> It's a bit of a lie that TCSR_MUTEX is a separate node in devicetree,
>> but it's always an nice chunk of 256K in the beginning (or end in some
>> cases?) of TCSR. But for the rest, there should be a single tcsr node in
>> DeviceTree and that one node should be a syscon and a clock controller.
> 
> I've been dive deeply on this tcsr block. And actually the tcsr clock
> controller part is a very small trunk size(0x1c) of the tcsr block. And
> this block have contain other multiple purposed sys registers. So maybe
> we can have a more discussion on how to have device tree node describe
> this situation? It is not straight forward that to have a non-tcsrcc
> related area being described in tcsrcc.
> 
> What about option 1 (tcsr_mutex + tcsr_dload_syscon + tcsrcc):
> tcsr_mutex: hwlock@1f40000 {
> 	compatible = "qcom,tcsr-mutex";
> 	reg = <0x0 0x01f40000 0x0 0x20000>;
> 	#hwlock-cells = <1>;
> };
> 
> tcsr_dload: syscon@1fc0000 {
> 	compatible = "qcom,tcsr-kaanapali", "syscon";
> 	reg = <0x0 0x1fc0000 0x0 0x30000>;
> };
> 
> tcsrcc: clock-controller@1fd5044 {
> 	compatible = "qcom,kaanapali-tcsr", "syscon";
> 	reg = <0x0 0x01fd5044 0x0 0x1c>;
> ...
> };
> 
> What about option 2 (tcsr whole block + tcsr_mutex  + tcsrcc):
> 
> tcsr: syscon@1f40000 {
> 	compatible = "qcom,tcsr-kaanapali", "syscon";
> 	reg = <0x0 0x1f40000 0x0 0xC0000>; //align with the whole hardware
> block design.
> };
> 
> tcsr_mutex: hwlock@1f40000 {
> 	compatible = "qcom,tcsr-mutex";
> 	reg = <0x0 0x01f40000 0x0 0x20000>;
> 	#hwlock-cells = <1>;
> };
> 
> tcsrcc: clock-controller@1fd5044 {
> 	compatible = "qcom,kaanapali-tcsr", "syscon";
> 	reg = <0x0 0x01fd5044 0x0 0x1c>;
> ...
> };

Is there anything wrong with what we have done for x1e80100?
______________________
|             |       |
| TCSR_MUTEX  | mutex |
|_____________|_______|
|	      |       |
| RANDOM_REGS |       |
|_____________|       |
|	      |       |
| TCSR_CLKS   | tcsr  |
|_____________|       |
|	      |       |
| RANDOM_REGS |       |
|_____________|_______|


8750 was different because someone decided to stick the "TCSR clocks"
into the TLMM address space, but it was a one-off

Konrad

