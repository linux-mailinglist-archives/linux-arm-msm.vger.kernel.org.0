Return-Path: <linux-arm-msm+bounces-80314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADC1C31329
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 14:22:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2D9AE4F9A57
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 13:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D9452F617A;
	Tue,  4 Nov 2025 13:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CGmhIGZJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FdTOZNsn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5BB31A548
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 13:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762262186; cv=none; b=XLR3r0ZpEFX+iT3MJGa8ImQWJphV9A+pWmayrJlXdlA1dneZlt+vII6qfa7SzgYxK1mL0gZMaLCpqSPkK3ltDk98sRcOLxowdvTIZPqIle1fglz35Ft9QhhPFo1AA5cSb5Hny0M9tu/9XA4p7PW6n8PO40KknZ5MWR71ArpBLFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762262186; c=relaxed/simple;
	bh=dahnfKSQZXYULZ5tpN1l5CdbLbc02qJ3aJMjuy8fydc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h0hFdyidDlGi5pS2Xi/LSlZ0Iz0GKYnqySVxanWAawE23Du+fUtoWTYoTdYFoT7fqba9/FkUcRk/2YcX3pL3iSGzBApLNkjQmaIndA/Vn1XMqKkHqo3vaTsWnWbaAuBpehcsiPNK62ar4brtOxsRNWbg6UEaUHHRn4etFkKRiA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CGmhIGZJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FdTOZNsn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4Cg3jW1975430
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 13:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tCkbvOaLp4lIGumAdGTHtAA0z022CSMFZ6B3cK81eBA=; b=CGmhIGZJf928EuFa
	YjJDL73yAMsOTF9bxfON1lMw8XS6GO9aOAg2GY5bokJm1oThIcZlDXaHWL5783qv
	sevzARvJpmeroMqwQDcD/ybRd2IU3OUtGiIunE7EOvWHG1QRUy27OH5zxb2/dOBC
	NZiJI7ULK26ZihycpczXb6BzXb9dp546RRiDF/QkxNU9he+lNPYJl0yyD5ejpHk3
	6FJdQD+Z76HIV553LjTUggT3mER5e2mhDTwmWHXshm5a5oUP9DykTCDrjdNNT8YK
	8i8rPMdcMyCpwyvKKeSOfUJZSX2ULhoGVQG0YUBH94Xbc6iXLoDQs//L3GjvSBKM
	5yXuJw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7heag45p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 13:16:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ba433d88288so89724a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 05:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762262184; x=1762866984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tCkbvOaLp4lIGumAdGTHtAA0z022CSMFZ6B3cK81eBA=;
        b=FdTOZNsn00/p1kYx86iwQv9F9hAsvGYtaociYuvyuG68ZVHRGh7DLhNnrNc9tjh4lL
         kPxxWKW1qDOJW01XqV0i6IXb5CmtHJ2k+V2rQSFjPRc+CNsAyD8HstG0f8Y/4ldbHmJF
         tgpxvZmOYZuL5vB0n2kFjQ0y9b2XaJYBro/Lp6n3KUs5isAgAls2RQZXWJ5cWkivrdS+
         akb1pJo56ReMQkoC9rgCYENmjYijt0iEL2qM25n9peqXJ45Ic5uQ76xGDbmrGanw1Qjq
         z98kpkk0Y1k6CMvLvhorwGKcF9DT0MfF/7H9URwy7dErxO9pVrPbzEHPttWMd1ZMZVWq
         kWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762262184; x=1762866984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tCkbvOaLp4lIGumAdGTHtAA0z022CSMFZ6B3cK81eBA=;
        b=q4KfQI+AuDYlFOAuZHjYkb40BVAAWn3GqatmN5wFFNHmiuq8scr6nq8MPXasWg5vN5
         6+/ccHeuvgcLQzwT0RLQzPQcpqkhMNxRzl2BBLPI1PxQ5rsQaU1NRk2IuiVT7xTweVSw
         ccVUklSSMOkwEHjG6Ll/m8OoCiEVhoBeIrflopvykhDm4UE5rW+CKrm51fmvorlx5Q0t
         rGTjyVx07rKz2oqpBbSO0LW8fb66VGh6ZKIPLOk+6nDLdvnVLGHj2R+rTEGcsCxza18S
         5eQBOugFpmcT4iK1WPWbiz80JjECN2vfLCGPdxuxJVQbL8ZCHHehi/6RDPPjvCDqieEo
         cSbA==
X-Forwarded-Encrypted: i=1; AJvYcCWq/Ln851byYd7mE6FcRsJH9nYZo0xffiOFMSURYB+9P3i1vXQFEQ7V5K7UeW2CBID9h46/bfWW7vXz6jca@vger.kernel.org
X-Gm-Message-State: AOJu0YzK7G2E9My9/2n1x9ZcBLSHxQpy2x30Pl42Ejy43/UdpU3eZtqj
	80KXoofPg4lWluOMueqPiEUQ61B6Nsarn6R69JUZPOVNnKvJrEkXv4ujjyluggr9nNxlFHD4Th7
	ngJrhySWe16jtHHVqPWMMN9SbM1yZsV+uPwUW8/aBSmBqrul9L3jHteSn12dWa8qSKjnn
X-Gm-Gg: ASbGncvLt0/zMOCzhRGb9BM7klMSaGw7Uq6lGSq/dPWDbw347ilZwGY21uzN2LyGSPc
	xwzDo/JaUrV4jR5z2u9VFuAp4wtuVPf2PMiCB2MNoa7XWmmUuwQcB0lHO/2u0z12wC77zz8EIrH
	Gtz3U7ulLfulEThIezjwVVERIzOSyEbv2lX//MYwGijLmIHkuA54zOJRjLBqC5f9RNPxb83VHM6
	u79QUTH35jSUoWr4ZDKi+jmt3ghzcNrAlgSfTHU1U8Sz12ljW5WLtZhGPFzy/pCORWqeETZhjR3
	AJANEytfrnXeGs2oiuARQ7MiLJQ9VxXAvMhj9C54yvXyOZGNYA9eEJOkVZgNc2uPAYr7zCcOuv8
	GCZTjfxrm/u6tGEzMRCJiFKKtB90QgixJURriXQHeXZU=
X-Received: by 2002:a05:6a20:12c7:b0:334:9fbb:35c3 with SMTP id adf61e73a8af0-348cbfc36e5mr20524456637.46.1762262183505;
        Tue, 04 Nov 2025 05:16:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJ96wFJAi6EOKorEp/J4xzwntMqgifOhvphrTFuhOkUboj24jia9QeZ94B+cMWoPmdjudC8w==
X-Received: by 2002:a05:6a20:12c7:b0:334:9fbb:35c3 with SMTP id adf61e73a8af0-348cbfc36e5mr20524417637.46.1762262182906;
        Tue, 04 Nov 2025 05:16:22 -0800 (PST)
Received: from [192.168.1.9] ([122.164.83.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f18315bfsm2412021a12.5.2025.11.04.05.16.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 05:16:22 -0800 (PST)
Message-ID: <b81cdd25-3da7-4dd2-b69b-2f7b131f9610@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 18:46:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: sram: qcom,imem: drop the IPQ5424 compatible
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251015-ipq5424-imem-v1-1-ee1c1476c1b6@oss.qualcomm.com>
 <20251021-quaint-hopping-tuna-0dade2@kuoka>
 <cfb94b1a-7ad0-4067-a08b-2af358edb768@oss.qualcomm.com>
 <45a74411-32a0-4a28-a738-9f44d66c0de3@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <45a74411-32a0-4a28-a738-9f44d66c0de3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GekaXAXL c=1 sm=1 tr=0 ts=6909fca8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=8axTHWJ9fAdUHyy7aoPncQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=_CKE_32nWIW8_9EVYHUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDEwOSBTYWx0ZWRfX6PqA6b6xA36u
 DTSuqHTE0MiYl2h/m/OYc4EzYViH/ieD/SQarkIObiDKxPXsKlsTbkLvD+1PUUHFXb1Li4697qw
 zofDAlaOi3YXUnFZi60U8uujQgj7EUTrMHlgMAhNKG//NB4zW6dPHa86jlS+ZUHCpxCSIA4ML+s
 GMeXmiYZ7kkdv8SQ/ppnCJn68yxjCpdniKKP9XUrybHA5xzgEEUbeTTEOccgDkqY20spGq9Ep3b
 r73ps17GIW7oiAO9es0xyjj0wZ7X2YRJdRM+k7hXBWYfhj1vfGP4cpuJg/xULSsK+TzAf1DTEZV
 QwUvz/pN3n0FWjcwzj598WRPss5udq2NlTAtbOHgXt3imUG/Evjfvhl1hIT3jb8W18zuJcY5ul2
 E5ihbCSzhFgHc97AF8BwHwru7ZUAcg==
X-Proofpoint-GUID: 0kutHBewDfG7Gj-9jHcpfPkf_d9GqueY
X-Proofpoint-ORIG-GUID: 0kutHBewDfG7Gj-9jHcpfPkf_d9GqueY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040109


On 11/4/2025 6:18 PM, Konrad Dybcio wrote:
> On 10/27/25 5:59 AM, Kathiravan Thirumoorthy wrote:
>> On 10/21/2025 12:32 PM, Krzysztof Kozlowski wrote:
>>> On Wed, Oct 15, 2025 at 11:46:58AM +0530, Kathiravan Thirumoorthy wrote:
>>>> Based on the recent discussion in the linux-arm-msm list[1], it is not
>>>> appropriate to define the IMEM (On-Chip SRAM) as syscon or MFD. Since
>>>> there are no consumers of this compatible, drop it and move to
>>>> mmio-sram.
>>>>
>>>> While at it, add a comment to not to extend the list and move towards
>>>> mmio-sram.
>>>>
>>>> [1] https://lore.kernel.org/linux-arm-msm/e4c5ecc3-fd97-4b13-a057-bb1a3b7f9207@kernel.org/
>>>>
>>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/sram/qcom,imem.yaml | 3 +--
>>>>    1 file changed, 1 insertion(+), 2 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>> index 6a627c57ae2fecdbb81cae710f6fb5e48156b1f5..3147f3634a531514a670e714f3878e5375db7285 100644
>>>> --- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>> +++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>> @@ -14,11 +14,10 @@ description:
>>>>      transactions.
>>>>      properties:
>>>> -  compatible:
>>>> +  compatible: # Don't grow this list. Please use mmio-sram if possible
>>>>        items:
>>>>          - enum:
>>>>              - qcom,apq8064-imem
>>>> -          - qcom,ipq5424-imem
>>> And where is qcom,ipq5424-imem added? This is supposed to be one patch.
>>
>> Kindly excuse for the delay in the response as I was out of work.
>>
>> This is supposed to be added in the sram.yaml binding, but I haven't completed that yet. Between Konrad has done some rework [1] on removing the imem.yaml and combined with sram.yaml (in his dev tree). So I hope it will be taken care along with that.
>>
>> Konrad, Can you help to share the plan on when the patches will be posted for review? It will be helpful for reviving my other series[2] and obviously yours too :)
>>
>> [1] https://github.com/quic-kdybcio/linux/commits/topic/imem_sram/
>>
>> [2] https://lore.kernel.org/linux-arm-msm/20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com/#t
> Let's get an answer on the Kaanapali thread and go from there
>
> https://lore.kernel.org/linux-arm-msm/176222838026.1146775.13955186005277266199.b4-ty@kernel.org/T/#mb3284a3a0bc3a9cda9cc6c0fb9433e8c2dddea2f


Yeah, I'm also waiting for the conclusion on the thread.


>
> Konrad

