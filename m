Return-Path: <linux-arm-msm+bounces-64834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B59B0422D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 16:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8326C3A3368
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 14:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FBB82580CB;
	Mon, 14 Jul 2025 14:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tnpj5prc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396A6253F1A
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 14:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752504680; cv=none; b=L0CfgS7jlm1kqJJ6TECLPoSmC7uptBwQPMWBrv8pp3Fqv/aIM9NSDUcZnj0ZV+JPa+vlcd+NqDzhH298kWVbDNWvQoO1nD+XCb/n2X59x4/xIm41mj055PU6Gr9eRyc6WOXLa3ooPorFWFGxW9pCSbPdd0dTGRTqHldp6EBLNiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752504680; c=relaxed/simple;
	bh=34c3k2JS0Ft1btNphYjTKqe1IWB+QrtfS49zngYMtao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VgkOCNNjd9WdARFxzA8nCSIDqjEmIUhMSgF5f+fQCegUEWz2Z4165EXwYt3pmHkR8tejnYWUDJAn9CmEMls3o7cOp0tgmG0m3xa6X2c2nlKFzVLRVyC21iGIcbJtHV16AEryZ0ivlXfzdszc965hAyYFskzso6ry+ZHhTcvF+ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tnpj5prc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E9gQpD001306
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 14:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j9W4CuSLttgvJ6FyeozWzpAz4Cuh64rTL2lKSOstBnM=; b=Tnpj5prcJdQb1sjj
	DaqdXinNI+fa/pI24OGOYmul1c0U91R2/kJjbtdbblS4sUrouilbyd/2dEIhzF6u
	SPH784E5X9M5Eu672ZZfeDzjvGq3fOEcBN5S/+OOHhDFUB7yv3SgXEbFp834ndz1
	9P1zz4hT0jNXzreyesyzdBrVga4OjXHlGW52PZjs7iCuBHSMSI4JgYvRIsnrR5zE
	pEiHj8xERc/3fFLgNc2Qib1eGiwxCktRURQgYf6fWeArSxwd2Uz0Bmjl60ZYgEhe
	SyLN9CGqSMqRgYrLzGbLDtMPcE+I1szYfwMQvzoGJpHoBPBTx5K3NjGOuWw8RO9T
	6uP8pQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug37w2rh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 14:51:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e2439259caso22212885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 07:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752504675; x=1753109475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j9W4CuSLttgvJ6FyeozWzpAz4Cuh64rTL2lKSOstBnM=;
        b=aYscKD5ncjJtR0JmvtGuKyOLrHkT2FBtgm7OkiXzk5hXyb2AcIilHx1xacik/Nq9rz
         B7hn+J/oimT31TTgrSlPcyOroXg5igcg1tRM5hcogKpE5zOoyJPLQqyUsW3QWr1yuL0n
         8AMH8co5Sc/Ni/XtINbAPvft8fT7Hrei3YGVM3ypqerfqq1X5VYN6zgWirfPUw2xZMCU
         aUquExiMo9fWXnp/cBCifsozVthYEuLySV65GukvNBLdylheg3buo+bohhgKt6I1HORJ
         FHLCV1u98L6QSI7lHS72pOxpKL7D7u4fz5eMmPT3TNZVp8NlehTL9I2nPFzCt6f2qrbR
         QXlw==
X-Forwarded-Encrypted: i=1; AJvYcCWfnbGpm3uqfMyRouC8qR9JbtI1Cqz9Hta4HNIw/iiv03ksy5BlP2clJlbCdRE6t3YnGIwoW8YC1+6/PCAd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8H69L4uvSDIbHl8myC6MqO0x+DtMDMy9xgRnnV8mXRnCY/yM9
	eXZJT418E91ueuqhDnDMKdE1R44qfFEyOBzTCbnrcLVwnfTxRsf5cEjSllI3dn30TojOOdKRlvs
	bV04brH1pftdOoMSlmA/gxWPbz/ZR9aO6SgcVo910fnh1c8HvDN6Il/eZx9wLZLzV86wy
X-Gm-Gg: ASbGnctNodJaf+lrcdZ+GMB0CUig/u13IsK7tm5SaC4iaOJzb+4Zf9JWk/zJsGxxQUu
	+Iu5soNaWCwLoXH6AmMlUhS+iat+PgiEcYLZkScOu7AeiLcQDlSw0EBXrkkFz6QwrwDxamefs1o
	gl8JHJZY+5jfrkTZpm9u0FrzbCP4ieafoskWGXG8WFGNSwniZ3GRXeBOgSGSKhJohHVkc+3wu+x
	xs7v78J/bWl6kJpdOsIZE7X1VrB+ZHs/HD0JkbDpSE2SeD7U11RBnahy4KlqwXMYdz0JghQVw/E
	Szo+YZ77R4bvZCUwhD8RLZP314tI/zuGhHudlRq0kJNJ2M6C7rLEqFV33uXGyDV9zGpNhoy3Neh
	blKHSE7TKnhpIq9e2EwDW
X-Received: by 2002:a05:620a:44d0:b0:7e2:ee89:205a with SMTP id af79cd13be357-7e2ee893ba1mr225930785a.5.1752504674814;
        Mon, 14 Jul 2025 07:51:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE74z/KAqLPegwZP0R34v4pwdMd2EKA/Hi8iI61zdmqy3z3diiIL2Ji8kmWMZfmjJZIoWEzUg==
X-Received: by 2002:a05:620a:44d0:b0:7e2:ee89:205a with SMTP id af79cd13be357-7e2ee893ba1mr225927485a.5.1752504674098;
        Mon, 14 Jul 2025 07:51:14 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c9542fe5sm6049190a12.35.2025.07.14.07.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 07:51:12 -0700 (PDT)
Message-ID: <39acdb37-e6f0-45e3-b54e-bd8a5905b2ec@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 16:51:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] dt-bindings: watchdog: qcom-wdt: Document sram
 property
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com>
 <20250610-wdt_reset_reason-v5-3-2d2835160ab5@oss.qualcomm.com>
 <20250610180345.GA2382213-robh@kernel.org>
 <a8b33510-c010-452f-9177-ce743b732d21@oss.qualcomm.com>
 <073480a2-0b6f-4dc0-b7eb-eec500b3106e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <073480a2-0b6f-4dc0-b7eb-eec500b3106e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA4NyBTYWx0ZWRfXxm4NSx3/9m+0
 o0j1/fGHTXt9JMiJksl5V7NHZ/1CJ45CNBneonb0uY0XZ6FSm0q0EgkEhBqLuDn1ERfZfqM95fu
 03aFhCAXYhHo7mG3qc+Wb0Up5x48NeiNa+YcznGJxnAVfD7rrpfvLfMObhn4lf7JFPrzjpTFN9G
 nnBTH8KiQWU4OZ9esIXiUsEq8P8qWUvW6havlB8lQvL5GhW0PuOHCmtVkXRE1pEedVlYHLm61MS
 YfojeZGKr/6HM4r0tXDFV/SuGtdxrudLJCa5hrddLM+R2uSUDHoCmXo5u/JgMlt20JR0doRotYa
 c3SbIR7qyUVnldNOyeaUd7vgrOY6bhTTdfIy4UzmSwh6T/NoH2jPwSGi4yCkNONgJC1Uli8bznr
 oXoujvkXbgqh9nx2bKVvD/Kd7GL0YRewyFC1/9lOH/U1QLHk/FYyf2ME5VLRWK3Jm5SCE/+c
X-Proofpoint-GUID: xysLfypoNG3yNk8qNSWyUpOwgn5Wq-OA
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=68751963 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9B6XoSWOLoSC-pKoQf8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: xysLfypoNG3yNk8qNSWyUpOwgn5Wq-OA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140087

On 6/19/25 7:48 AM, Kathiravan Thirumoorthy wrote:
> 
> On 6/16/2025 10:48 AM, Kathiravan Thirumoorthy wrote:
>> Thanks Rob for the review comments!
>>
>> On 6/10/2025 11:33 PM, Rob Herring wrote:
>>> On Tue, Jun 10, 2025 at 07:15:19PM +0530, Kathiravan Thirumoorthy wrote:
>>>> Document the "sram" property for the watchdog device on Qualcomm
>>>> IPQ platforms. Use this property to extract the restart reason from
>>>> IMEM, which is updated by XBL. Populate the watchdog's bootstatus sysFS
>>>> entry with this information, when the system reboots due to a watchdog
>>>> timeout.
>>>>
>>>> Describe this property for the IPQ5424 watchdog device and extend support
>>>> to other targets subsequently.
>>>>
>>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>> ---
>>>> Changes in v5:
>>>>     - Rename the property 'qcom,imem' to 'sram'
>>>> Changes in v4:
>>>>     - New patch
>>>> ---
>>>>   .../devicetree/bindings/watchdog/qcom-wdt.yaml       | 20 ++++++++++++++++++++
>>>>   1 file changed, 20 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>>>> index 49e2b807db0bc9d3edfc93ec41ad0df0b74ed032..74a09c391fd8e2befeac07f254ea16d0ca362248 100644
>>>> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>>>> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>>>> @@ -81,6 +81,16 @@ properties:
>>>>       minItems: 1
>>>>       maxItems: 5
>>>>   +  sram:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>>> +    description:
>>>> +      phandle to the IMEM syscon node that exposes the system restart reason
>>>> +    items:
>>>> +      - items:
>>>> +          - description: phandle of IMEM syscon
>>>> +          - description: offset of restart reason region
>>>> +          - description: value indicate that the watchdog timeout has occurred
>>> A 'sram' property points to an SRAM region (see mmio-sram binding), not
>>> a syscon and offset.
>>>
>>> The 'value' should be a separate property or implied by the compatible.
>>
>> Sorry for the delay. It was a long weekend here!
>>
>> Let me start with the requirement (Please feel free to skip it). When the system goes for reboot, Xtensible Boot loader (XBL) find the cause and update the particular offset (in this case it is 0x7b0) in the IMEM region with the known values. On the next boot, if the system is rebooted due to  watchdog timeout, watchdog's bootstatus is updated accordingly, which this series tries to address it.
>>
>> Based on the previous review comments / discussions [1], it is decided to go with the above approach, i.e., name the property to 'sram' and let it points to the syscon region (IMEM) along with the offset to read and what value to expect. So that we don't have to touch the driver if either of the offset or the value changes across the platforms.
>>
>> Currently, IMEM region (which is a on-chip SRAM) in the most of the QCOM platforms are modeled as 'syscon' [2]. So I have followed the same approach here as well. Should I describe the IMEM region as "sram" (mmio-sram)  instead of the "syscon" (existing approach) and retrieve the offset and desired value from the compatible? or stick with existing approach and name the property to something else? Could you guide me here to proceed further?
>>
>> [1] https://lore.kernel.org/linux-arm-msm/20250519-wdt_reset_reason-v4-3-d59d21275c75@oss.qualcomm.com/#t
>>
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> 
> Konrad,
> 
> The bootloader team confirmed that the IMEM offset and restart reason value are fixed for the SoC's lifetime. Based on Rob’s suggestion, let’s pull these values from the device data using the compatible string. Let me know your thoughts.
> 
> Kathiravan T.

So I'm not sure whether I proposed this before, but this is how I solved a
parallel problem for IPA, also consuming a slice of IMEM:

https://lore.kernel.org/all/20250527-topic-ipa_imem-v2-0-6d1aad91b841@oss.qualcomm.com/

Konrad 

