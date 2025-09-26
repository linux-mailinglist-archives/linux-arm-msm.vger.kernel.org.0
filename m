Return-Path: <linux-arm-msm+bounces-75298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B47BA3747
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 13:14:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC1FF6259EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 11:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731F62F547A;
	Fri, 26 Sep 2025 11:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HM+TxST6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EE52F5332
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 11:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758885281; cv=none; b=vFaT3n0j2QnLSYZFtrPdIN5BbRcVYB9ytJ/lmhXhvhLAKfBMJZ9k8HtT8NqWpg41Md2+1sjWyoIY1lU2I+d+bETbgIOYWkobcQviTWiYBGRIXf/8eUtM567L8DPO8cEu4xX0sBar0uTO6l54VGtEbI/Gw3HY1ISJOAC6E+bfD4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758885281; c=relaxed/simple;
	bh=iDSw11pyqhbkgwpWYT4ZdIm+jKHusW8fE0X5DlrCeps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ebChi8oBV3HRq0MqL6iSYyZpzX058OXWu/UJMqq3STaB8lX3d14IaSp6kr8ouJ6RGr2sOw1dXvTfBtcy0vFnsze4MWz1cSltbe+ygtmaIXyuVEUT64qM1FGVwcoAW5GmlzGVEZTgLNn8VL3Sd9OO7h4H6sn14tBQCBpRE3W+bSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HM+TxST6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vbd7030585
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 11:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v+mnnPyYM8R/xd6RV1KS2fBetyQnGZ7XuXS5A/9vnvA=; b=HM+TxST67Rpp7mdH
	8aW6xAI6VB8Ar3P4jmTQbwZAaj5FTztaFpXnrVr0r7k+7fXvt/DP93az8OLYOc87
	m0DCiP61MsORkID1E10nl98bf3F5+CUFtwpwjW5O/VZsI287MzG493CW8KUP8MRv
	MkXsCRuWcOygkl3R/Ej3xxdFzrntteW3H5Ej6p8RxebkfMlq6CMcEst09K2wLRv0
	TFLeCDAh9iefz9zqOyIKwqXJX5zzo2SVo24KHsI99dWZfM3CK/MBmwN2jD6GfSRV
	uTFo+QHkzwELffMv6fJ+gfjyU4NH62c4Euk3NAxSt+eD8nIktF8ab3MXYFnWoG0F
	Sq6ODA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u2kp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 11:14:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-85e23ce41bdso54607585a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 04:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758885278; x=1759490078;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v+mnnPyYM8R/xd6RV1KS2fBetyQnGZ7XuXS5A/9vnvA=;
        b=aWB1TA/n0fCEzPdYHWpIR7srbtyEHLpKNDMDfsgX7NO3N9ui53MjJosddXkztQoeT8
         4S7xMdDn07zt21kOvPQNsCvh+v3jZdRDNyeu7SadrGrLqNszE+EKxGoDmvfSk5ILR1rB
         7K6cjHwbQRkFK816O2Gs9CQnR/iPAUsbc6zKLTfoVocHHrIYQFTZsQRnzuPKTKcIT0B9
         64Ej/EChc3CzWItzkoWznVds19i+FHoAA/6ejvnUTOlhQ+BfgQgDY60V/rJ/As5hp5xd
         Gx3ug3ZLfL/VB6iyGgQWTAyYgNKESwEabtsR1fJakSa+K6G3mcmoxPwSaf+rK+P0MGCY
         2mAA==
X-Forwarded-Encrypted: i=1; AJvYcCXFzU0QslXikTGKbaisCeVrJ8Is71UlVWncfPlkbXn0zTFVU3NRZ4HeKyDmiNCv5RvXeHxPiv0p0HST03bJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo5JG43CM0kn97lhiaNAsXTBfYdcW31bCq+DzaUXYhauUQuymp
	i646OyPBFFr/ZyyLYIRR3p7F1sCap3PXIBbdl3zyqR8EBPcvQazjRxiuUwZXVwRiVbawl/GTdBP
	iBt+d+HLAFsNxhX+7iJnt3M8qdxoceiFWPzzSSdfqifBCwjdN1cFIrFS7a5aHyS6iTZ89
X-Gm-Gg: ASbGnct3O7AZ4qbUgIEBeuucjf7nQhz5ZPpCmGvTWp+fFHdPE5jnXmROjD7fRqRYkBM
	bHGXviGr6lDjt5J3M3n/NTsjqMm6K2WPjuC8UjYpWxxGubTQaa8hDdh/nVqaGpG3LZPGDSgVlke
	44KOV7oTeSVKJl3K8I2PWABcCzvagliCNC70N5FBMR/Kqo8Ld9zlygY08Ir/bvQm9qcQ9AVZQWJ
	nTo5kYxo8lKEhq3P0yc9PkaZZ44hEdRPLkEm+SWMmMN+fnfLREnZawos1cZm6HoHFIf2pxTaOm/
	rClN9TrPRUcpK43QrMtTE/+uqjmpgMHcwET2NKTUIw8cnF08lmG79NaRFduW4c/5nHi3VD8CWFV
	/n4q3ANGE0sEVRpjIZAr6nA==
X-Received: by 2002:a0c:c785:0:b0:801:2595:d05d with SMTP id 6a1803df08f44-8012595d527mr37523786d6.3.1758885277712;
        Fri, 26 Sep 2025 04:14:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVyVqDH56Rhc9V37bZmDRMzW77b/9dCZm0TB6JT1QzTWqi62x3w727VCI3OQtYuS6z3lWFeA==
X-Received: by 2002:a0c:c785:0:b0:801:2595:d05d with SMTP id 6a1803df08f44-8012595d527mr37523606d6.3.1758885277246;
        Fri, 26 Sep 2025 04:14:37 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629badsm2664309a12.9.2025.09.26.04.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 04:14:35 -0700 (PDT)
Message-ID: <4777e507-c329-4c22-a45f-099fc57e31e8@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 13:14:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: qcom: Add SM8750 video clock
 controller
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250829-sm8750-videocc-v2-v2-0-4517a5300e41@oss.qualcomm.com>
 <EAIobHjo8rM1e0LwqDqaUllC0qjV5ElMMhk6KgT1oNnFt_-k7ctM2_6kym9OjEtse5o4pOFM7yCkXgrSGRZhuw==@protonmail.internalid>
 <20250829-sm8750-videocc-v2-v2-2-4517a5300e41@oss.qualcomm.com>
 <d965949c-a7a0-43df-9bf1-c1232fc7e38e@linaro.org>
 <555039f9-a168-4a9c-b45c-d4583c553bc9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <555039f9-a168-4a9c-b45c-d4583c553bc9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ajguxZcDjs-g3HNvBS7jT7fdViS7y5Ye
X-Proofpoint-GUID: ajguxZcDjs-g3HNvBS7jT7fdViS7y5Ye
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX7l4OOBGSxgvN
 2ll0JWCAb44wcvTyttljJCF7TtaflDrgd96rtFLatbIiwk5gclC0n2+R7lk0iVa+fhVRwEHQtjs
 YKKBwt9MCVHihiyTHh1ghFrGgHAWBP3ib7lhT3LTnjstlizDSoafmkNAq9pRhwEnATl29YHec94
 2MeopTQhAw9bl4nE7O+MlP2oHV1GReM7Mqjc5ObgQm7dhN6HQ6UTJO/Khz+5DvPTYQ+jPg1E56K
 mVkaR1L35MPLSZyzAVv/Y4B7v1JQwuMnWbq8hTZUxz1fvzpRV1/YHaWo9aXQ+ckaPjrdLIln/qq
 ppmNCVPzE4VJEliVgA3taNdCVqxLthHIgAGhZ0nMeop+5b/AZWYkkl9iXk3DL7z6AZ6aFL0MXJv
 SBADgx5sDqXH5YIV/VSPZWg4zCxk7A==
X-Authority-Analysis: v=2.4 cv=ZsHg6t7G c=1 sm=1 tr=0 ts=68d6759e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=pvYLOa8aNrQGL8lVqOcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On 9/26/25 11:18 AM, Taniya Das wrote:
> 
> 
> On 9/15/2025 4:28 PM, Bryan O'Donoghue wrote:
>> On 29/08/2025 11:15, Taniya Das wrote:
>>> Add compatible string for SM8750 video clock controller and the bindings
>>> for SM8750 Qualcomm SoC.
>>>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>>> ---

[...]

>>>   properties:
>>>     compatible:
>>> @@ -25,6 +26,7 @@ properties:
>>>         - qcom,sm8475-videocc
>>>         - qcom,sm8550-videocc
>>>         - qcom,sm8650-videocc
>>> +      - qcom,sm8750-videocc
>>
>> Shouldn't this be qcom,pakala-videocc now ?
>>
> 
> As of now, Bryan, all of Pakala is using the SM8750. We can migrate
> everything together to maintain consistency.

We settled on keeping new compatibles numerical for already-numerical
platforms (except board compatibles where all the fuss was / as it makes
sense)

Konrad

