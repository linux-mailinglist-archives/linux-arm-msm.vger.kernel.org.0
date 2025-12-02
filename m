Return-Path: <linux-arm-msm+bounces-84059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE6BC9B03C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 11:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 323CC3A60D0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 10:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B75283FEF;
	Tue,  2 Dec 2025 10:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MupdOExJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gVtrjUG3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF841E1A17
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 10:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764669691; cv=none; b=SGjkFL36jUJedEkR/zC3NHRhBeJBWPKsU1lryBdYS6I9oh2J+7vavRA56egqZyQdarO8Ofc4CCB0MaSYMJDp1bM0iZhZvYJaQmAKYrCLswbGIZQRmNRjPEYrXjQbTkiY92R9Ppc+UmG8FFEzGNe8F0t7O7rJE6Mo8gd8lYSBEHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764669691; c=relaxed/simple;
	bh=Gt8pt1UiVrV3Crxj1QNKCmXBQMKVZfXbou/+ylLscKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fPrFqCP11FAvrgNpsc6UFSznasVOSK2aoW+WBjnb2FhclY8cDWH2LKO/2xByD4O+ZrVaUNRT5K6qT9y0TNkksvDWUvGnwJLT0F6YAxGUI76CVKd+jwrqg+HTCDSwfIt7in3P7FLve2fLjK5dpwMmZaGU99q/9Nwpogy5xwEfgS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MupdOExJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gVtrjUG3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B25JLIx1688817
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 10:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VCgyHpBwQTHzIAgBMQn8Tj44im5JyB4dlR9ZKOC00xw=; b=MupdOExJPHKS91JK
	OrTN9mOgl8emGkBoTUnDHrT8uwVXEEVM64XYfBDrx8YSK7ssxm/goPpPyZM/3F3j
	8cYu4Elmc0aqyBGMzjU+LzmzYWG/ZOvD7ZOYwp1uK2jNjCR1mfLCl7M4/kMKEQS7
	VIcmBelIqaEuPt3XpXcgrXxHSHWIbRHrwt9KJdwlYBudCN8dVo11oJNW3jWsr0XM
	jmyRHEBcHE66FH7uFHtrWgfoxxa0Z2ZxMmmUOL6bSR3Ln/fqKK1kfl64vXlFc9/A
	x2vt7ESELlZaNnGrzfM9Dlhr4YtlrtORn9QXbCnGK1Ire0mKsbH3UV7wPlTGLXXR
	U20LIg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asgxetjut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 10:01:28 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b969f3f5bb1so7671310a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 02:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764669687; x=1765274487; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VCgyHpBwQTHzIAgBMQn8Tj44im5JyB4dlR9ZKOC00xw=;
        b=gVtrjUG3a6TQFmbmVEtMwevOVgwEYDei4xK0mmQmKgeOZ1Eld9StTpF3ml7vvwkFYg
         qflYD1GIYL3h922Q6H/J/hWP8jbrx9jrS1mYQg0LBFXR0j6HOs6ecP+4eFrvG2XjT+SK
         FrbRuQU+VZ9Bf+lqHi/aYyHGPjzk1l6PojrpStyPlgSdfepwrFGWuNzykyAw7V4tTVxQ
         H09k5FUYZyj0Ql9DkIzKPJ8RbCkqidX9Fri4NgYWBIugZsbiR4jcO8yrxEcpP7EaeYV2
         EtHxZS4WrdZ2w0oulMqJy4kXOzh1J+IiWkOLBOm/+7bqWp3A/BZPcTrwRj55GpOxOCPN
         E3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764669687; x=1765274487;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VCgyHpBwQTHzIAgBMQn8Tj44im5JyB4dlR9ZKOC00xw=;
        b=A4pWI82r2C81Hpp/+nW7X2o1eXmg61jYhO7vfa6rbMB1jWYxt4ZDVJ0rOPWABOt8pa
         Ap5+DXR/ZulMeqQvVh+iMZY6FkU0pp2GUrEKvI7xDgbb80dgFzvWSTk/ghLnHguK3+12
         HSEvnYk6z+yzB4UVSImFNDJgc1oSpZ0n7Y714dgbNCKZj5u/BfNpAx0ipJCe6FXhEeYP
         QoQGV1+G0hW24jvSGQS7PMDxkwm8tjqZfQ0KBUy/rH9TgMHbR1jD4qWqowyjHjGWBJBk
         GP214DNeO3LhutRHP8VP5AzLbA7Jg2ItIHLVyfqqJSmYnEkkkYXRNbl4mUtdmj1RDW+F
         /qFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/Ex+kAqbWLIDYM2ANjbRX43zRW7ZmyGrpUHA7+SiurkIJl7VWv0qaWzu/0PjEIIqU/JqYBKUTWl0FRhxP@vger.kernel.org
X-Gm-Message-State: AOJu0YxnNWM+KKLlDiduTUIpuE4uoZa+N0lCTrDn6S9xbUUqizHA0m4c
	oeRfzyEbGbxGBXBuDsFnceNqZMzxQr5S1dedXtytpjFJFVos0bglkU2mlhW1V6m5lMImQWKHgdQ
	6EcsX5th6g8zqaUb8jr902HJFD0B5nb6dOEuxsQpjO6fF7YCwhIrx/y3YR6AK9HNtmy7B
X-Gm-Gg: ASbGnctufaRxzhBgIHqY9sweVCMoqBR+NmKVnyOIZbM8PpK2rLkh10KamwfU6o7+iXo
	xoVT7S9I7+L6eijBvqkcYUBQ+IfVkcq6lxSs69vkVydoUv+ux3xxTD7wVGMSbq58RLPn+KDJoqn
	j6HujRTA6NCfyCuQwSVytmwClAOsfWq7JDEAh5OxW4dEpt/FKv8wsMx1Wk/iB0xjYTvmixYy1WJ
	eKrX8KGao/bkxMr8ImYi4y4RezGHmNA65IhY0aL/I2G6XqdxzeWMUhH6FjUP6dwYUBx3gtGhO9j
	zCrT3cvX6CCQ2JbTc4F4rIOhCrRHmN5Cfn1vIfA5CoyLTqbXI+brZ6s+yCX2mKlcQUk7bAX0Ci4
	1YQRVfgRe2aawC5B8h+O4eXQM1RMfcmY/w/kboSPz4g==
X-Received: by 2002:a05:7301:7194:b0:2a4:3593:c7c1 with SMTP id 5a478bee46e88-2a7194ab2a1mr19578317eec.1.1764669687356;
        Tue, 02 Dec 2025 02:01:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKRFsMylJah6XxPplvV9ZpzzT/gex0k0NSf2YPvwqBcH7AOdKS2xzxMzA1XuIz16ntn4kKiA==
X-Received: by 2002:a05:7301:7194:b0:2a4:3593:c7c1 with SMTP id 5a478bee46e88-2a7194ab2a1mr19578297eec.1.1764669686707;
        Tue, 02 Dec 2025 02:01:26 -0800 (PST)
Received: from [10.204.86.123] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcaed5fcasm83627991c88.2.2025.12.02.02.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 02:01:26 -0800 (PST)
Message-ID: <ab942177-a8a7-4047-9b6a-634aa3d15b21@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 15:31:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindings: misc: qcom,fastrpc: Add compatible
 for Kaanapali
To: Krzysztof Kozlowski <krzk@kernel.org>, kpallavi@qti.qualcomm.com,
        srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: quic_bkumar@quicinc.com, ekansh.gupta@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
References: <20251202060628.1869967-1-kumari.pallavi@oss.qualcomm.com>
 <20251202060628.1869967-2-kumari.pallavi@oss.qualcomm.com>
 <191e6be9-5e61-43b7-a75b-e2d211bc6630@kernel.org>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <191e6be9-5e61-43b7-a75b-e2d211bc6630@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: mTwh0LZamLicQ5OgYmx6wk0a804RWAuw
X-Proofpoint-ORIG-GUID: mTwh0LZamLicQ5OgYmx6wk0a804RWAuw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA4MCBTYWx0ZWRfXy5IT3s5Ege6z
 HpmiovR+5RW4kcqNHTY2c9rMdMC9kHn24lAr6znGCvtprsa2K3IX4JVQhlWctkrMzmfib3DbLhC
 IEQ6cEU2SQxPzKiF0nsNFani3LVeOetLg9g/f1qQgx2mJPyeNnzKr67A2CsMn0AvuOAALNf03z5
 JnAlICeL9pUBkSroLRlLyPMqfqxNL+MZAZsVC3NDUeOoh9sComzybEe4hL8mdseYAIngrpgN1Dz
 6XvGO3INVM3E3IVULTyJhFovWgZkKVarBMkaGF/VITFhaNAWiNHy0K7XETKehQ/hBpEzWblucW+
 HqjafmOHGq9PT8Jy4YO19V77w7LA4nhNqXQw5hUf2QpPAcqQiMjfEVL7b3tn3e4JMDpA9oLTnvr
 KRrtVUEzJr51yZV0vb9u2It6yrv+4Q==
X-Authority-Analysis: v=2.4 cv=A8Zh/qWG c=1 sm=1 tr=0 ts=692eb8f8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9uI-NWsv2U5wCxV133oA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020080



On 12/2/2025 1:47 PM, Krzysztof Kozlowski wrote:
> On 02/12/2025 07:06, Kumari Pallavi wrote:
>> Kaanapali introduces changes in DSP IOVA layout and CDSP DMA addressing
>> that differ from previous SoCs. The SID field moves within the physical
>> address, and CDSP now supports a wider DMA range, requiring updated
>> sid_pos and DMA mask handling in the driver.
>> To apply these changes only on Kaanapali, add a SoC-specific compatible
>> string "qcom,kaanapali-fastrpc". Older DTs using "qcom,fastrpc" remain
>> valid.
> 
> Drop last two sentences, redundant. Patch contents tell that.
> 

ACK

>>
>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
> 
> You did not test the v4, so is this one tested?
> 

Yes, I tested all possible entry combinations for this version. For v4, 
I only validated the best-case scenario and did not cover all possibilities.

>> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> index 3f6199fc9ae6..8bf7d4d83c8b 100644
>> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> @@ -18,7 +18,13 @@ description: |
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,fastrpc
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - qcom,kaanapali-fastrpc
>> +          - const: qcom,fastrpc
>> +      - items:
> 
> I asked last time to drop the unnecessary items. Wasn't here before.
> 

I’ll update the schema in the next patch series to remove the 
unnecessary items. The revised version will look like this:

properties:
   compatible:
     oneOf:
       - items:
           - enum:
               - qcom,kaanapali-fastrpc
           - const: qcom,fastrpc
       - const: qcom,fastrpc


>> +          - const: qcom,fastrpc
>>   
>>     label:
>>       enum:
> 
> 
> Best regards,
> Krzysztof

Thanks,
Pallavi

