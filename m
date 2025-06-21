Return-Path: <linux-arm-msm+bounces-61926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58826AE287F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 12:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A32643BDE9E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 10:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9727D1FBE83;
	Sat, 21 Jun 2025 10:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ekkBzQ1+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28B71F3BAE
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 10:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750500591; cv=none; b=tpT9pYVAJh7LBON5/hqTtLp7B2w56sO8Vn/MmzRfnYXgfe1k2iCIRDzU8PlIUraXWA2YWD/9Zb1wfE05rl2XPWAux2za67rPieumruhKAYGmY8pTVIfSbjwOKGpdqQxZgiu5yZ2fbHSi8qg2qMoizG2/EDCFvam6IHugRo9M+dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750500591; c=relaxed/simple;
	bh=fhmuuk4oxkPAjOucmLsQQYL6pZBtL6KZT3sq2lRWRrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=urUAh1dbdt8XQxLpQiAUC7fJDi6lTj0TWWPT8QYGNacza9liFc1Nc7B0sscQe12I/FAzhevdbeLGNnT83ZBw50s/ouRpYOIb8LZjCjwk0KiL+XILi0SD7Ka7SL3s37XejxxBDshsx4gpO0Sc/okpBBL8m5t6Q5FIOmVh1cDapcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ekkBzQ1+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L4pMOr005734
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 10:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W8nrgve/sfE4i/DQEMAHREmTS62webINUascpRsXO6s=; b=ekkBzQ1+VaNQiJnI
	d2q8G7lnu2RO6d2omQX8MaE85UXn/KEpTWVqL8lyqmYw2OJQqLXqdmfFOcStliNZ
	U/mhUotLw1HQa8ra9mb9z56u+qK1QtGvvEU78TKTeqcqmIz10oB9CSAgMUSXKX+T
	bKR+btMff0tUur8XaP31s+fztfe1MVzO7Na13E3JqRcVK0Vd0Od14DMV4MA/wEPP
	6T6FMVDzhkFS39rJ/GclUQwKr/OUomXst9p1cqZV0SdEsBjPu7/wgK3VkyqNUEU6
	qFDort8e6jMb1MFMSri6+JSLNWKmUDm7x3FMFfAKx7xHum7T691YVQbTKvCMod+y
	JtHNyg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dm2mgh2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 10:09:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3eeb07a05so36960885a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 03:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750500588; x=1751105388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W8nrgve/sfE4i/DQEMAHREmTS62webINUascpRsXO6s=;
        b=sQDyzal/ekdzPodkrwU67Xlu8IJf86GnRnDLgHuOWw6nBnR3UO8z+1WwJ13qMGCWL6
         sJXijeWoyLJn4NAjmbny6UPRjhMuHFj8Jf+mhTPZ6xObVxUsCb82VaFgOlRg0Hox5nkP
         zrOuGiV7USvdwN4ZMxbHaM0dj1p92Li4ybsUWhJQIUpmH6A8/rLjqljjrOWnLLmKENk0
         YMZUWl0QUsLImNP+H9bJbtKmgYAloOH4bfJwqp1FsvFJa0b+YK43lYK9cm6kxm87AiSr
         Vwa0M1q5guUOfkzZ5khZ0+Bo+X1a6RzU45KdXalJWLkcUglkHiAbsBKH2my/uS8qRW+c
         Tahw==
X-Gm-Message-State: AOJu0YzTFEyCcHg75mxCg1ewo3TejbsM+gYgEqXA+/JYlfn3YSqJiE//
	/h/1NZ4CbMpaj+k6uKevkhoTZ6ef42ua63NVaGBFpPkGHjmj2SlCl1ahyXd/QcgBa3/9d6Ak7we
	4yqg7/kRGXjFBi1exgNo9TgIM6JGayXeSvBS4uH4ZpvfCnc6GhEeO4VUIdYnjW8IKZ+zF
X-Gm-Gg: ASbGncs5J+QshCUSPJW3yV1MB/I+algORGv05ov6+8fW2DujgvihT8TtYJZN9OqL05s
	agsoD56O+VARILOs6WWBffs1k6dyY3uPtHrTBjSfWx6VVgqRwaHTf2UGBeFtnLJf8n3zDgJ4ZBN
	ZPSaVILpdKz2Mm6tz8WlOVh27l0lnwwuk015rUUK0c/3iQNV3Qf6FkgC6OWSL6COBfLDV1BppUJ
	DdajKGcDHvY+EKY9O+GZHgn6pFHLuuOLztFMtDKu8xnmiQHGuwVF74QXmorLJNdcNPJnQc70438
	pScY3NEZe3ATd8H3u/d6dpLGaQlTLBy0hTUWORv3k5Dv4WhIEa1wEidsQiPSUTBLSx0q+PXwVcE
	F65o=
X-Received: by 2002:a05:620a:2903:b0:7cd:4a08:ea12 with SMTP id af79cd13be357-7d3f98234f9mr305387785a.0.1750500587444;
        Sat, 21 Jun 2025 03:09:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEkHqdZ+avToFSA0VJxfQsaNZ+3I7zEzzowA07Hg+ReuS+AxPXnZPkGqYAlly0AM+Nl6q6wg==
X-Received: by 2002:a05:620a:2903:b0:7cd:4a08:ea12 with SMTP id af79cd13be357-7d3f98234f9mr305385085a.0.1750500586953;
        Sat, 21 Jun 2025 03:09:46 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053edc0e9sm341317366b.54.2025.06.21.03.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 03:09:46 -0700 (PDT)
Message-ID: <78f0e4b5-19f6-45a0-b4dc-a1b519645567@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 12:09:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] dt-bindings: clock: qcom: Add NSS clock controller
 for IPQ5424 SoC
To: Luo Jie <quic_luoj@quicinc.com>, Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Anusha Rao <quic_anusha@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com, quic_pavir@quicinc.com
References: <20250617-qcom_ipq5424_nsscc-v1-0-4dc2d6b3cdfc@quicinc.com>
 <20250617-qcom_ipq5424_nsscc-v1-5-4dc2d6b3cdfc@quicinc.com>
 <b628b85b-75c4-4c85-b340-d26b1eb6d83e@kernel.org>
 <512e3355-a110-4e7c-ab43-04f714950971@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <512e3355-a110-4e7c-ab43-04f714950971@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: D2Q-2eHI723iG708GZs_Egyirpn4boAJ
X-Proofpoint-ORIG-GUID: D2Q-2eHI723iG708GZs_Egyirpn4boAJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA1OSBTYWx0ZWRfX2dR9zth0tJks
 BWk06OKAt/RDlwTib3ok6rpGvIUJnKJe1+1tSp3wp4F5ri+PvDXmgvgJo6C6cjFbbCT1QPyfdIr
 kc+o3J9QzI8Tbwxb90IiEF1MsbY1NJGIQk03WDkLP2Jfa66z68cCEABOAbEFtabZQcghX+2DcD0
 43Zkv8ou1XY2D813yJf+9VEoCnOnabgo04GPs+7aKIX6gHTdvXtDeXGyXu3KXO6p6st67AIXfE5
 h7Bepo/ZSz0tX59jqX/DItZtkl/aASd83M7KQdLzB3MuFiPut272eSQp3AYVXtyEYb4cV4+8Emo
 61qszMIEYdWRmDXCPosjamq/NkoNqZS+d6/rqYAWJhseunPGhr5V+hRBFLMx5wsEs5/XvzLcltr
 nqhBaarUxJ0+r+bnrvs/Qmv0Go38uilm3ge5jnQbpBclSL7LLKDfm46x4jv86AqxbdBa/RxW
X-Authority-Analysis: v=2.4 cv=Q93S452a c=1 sm=1 tr=0 ts=685684ec cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=P-IC7800AAAA:8 a=gEfo2CItAAAA:8
 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=LVulUOl5olkk-nN9es8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210059

On 6/18/25 5:58 PM, Luo Jie wrote:
> 
> 
> On 6/17/2025 10:49 PM, Krzysztof Kozlowski wrote:
>> On 17/06/2025 14:06, Luo Jie wrote:
>>> NSS clock controller provides the clocks and resets to the
>>> networking blocks such as PPE (Packet Process Engine) and
>>> UNIPHY (PCS) on IPQ5424 devices.
>>
>> Please wrap commit message according to Linux coding style / submission
>> process (neither too early nor over the limit):
>> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
>>
> 
> OK.
> 
>>>
>>> Add the compatible "qcom,ipq5424-nsscc" support based on the
>>> current IPQ9574 NSS clock controller DT binding file.
>>> ICC clocks are always provided by the NSS clock controller
>>> of IPQ9574 and IPQ5424, so add interconnect-cells as required
>>> DT property.
>>>
>>> Also add master/slave ids for IPQ5424 networking interfaces,
>>> which is used by nss-ipq5424 driver for providing interconnect
>>> services using icc-clk framework.
>>>
>>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>>> ---
>>>   .../bindings/clock/qcom,ipq9574-nsscc.yaml         | 66 +++++++++++++++++++---
>>>   include/dt-bindings/clock/qcom,ipq5424-nsscc.h     | 65 +++++++++++++++++++++
>>>   include/dt-bindings/interconnect/qcom,ipq5424.h    | 13 +++++
>>>   include/dt-bindings/reset/qcom,ipq5424-nsscc.h     | 46 +++++++++++++++
>>>   4 files changed, 182 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
>>> index 17252b6ea3be..5bc2fe049b26 100644
>>> --- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
>>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
>>> @@ -4,7 +4,7 @@
>>>   $id: http://devicetree.org/schemas/clock/qcom,ipq9574-nsscc.yaml#
>>>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>>>   -title: Qualcomm Networking Sub System Clock & Reset Controller on IPQ9574
>>> +title: Qualcomm Networking Sub System Clock & Reset Controller on IPQ9574 and IPQ5424
>>>     maintainers:
>>>     - Bjorn Andersson <andersson@kernel.org>
>>> @@ -12,21 +12,25 @@ maintainers:
>>>     description: |
>>>     Qualcomm networking sub system clock control module provides the clocks,
>>> -  resets on IPQ9574
>>> +  resets on IPQ9574 and IPQ5424
>>>   -  See also::
>>> +  See also:
>>> +    include/dt-bindings/clock/qcom,ipq5424-nsscc.h
>>>       include/dt-bindings/clock/qcom,ipq9574-nsscc.h
>>> +    include/dt-bindings/reset/qcom,ipq5424-nsscc.h
>>>       include/dt-bindings/reset/qcom,ipq9574-nsscc.h
>>>     properties:
>>>     compatible:
>>> -    const: qcom,ipq9574-nsscc
>>> +    enum:
>>> +      - qcom,ipq5424-nsscc
>>> +      - qcom,ipq9574-nsscc
>>>       clocks:
>>>       items:
>>>         - description: Board XO source
>>> -      - description: CMN_PLL NSS 1200MHz (Bias PLL cc) clock source
>>> -      - description: CMN_PLL PPE 353MHz (Bias PLL ubi nc) clock source
>>> +      - description: CMN_PLL NSS 1200 MHz or 300 MHZ (Bias PLL cc) clock source
>>> +      - description: CMN_PLL PPE 353 MHz  or 375 MHZ (Bias PLL ubi nc) clock source
>>
>> This change means devices are different. Just ocme with your own schema.
> 
> The NSS clock controller hardware block on the IPQ5424 SoC is identical
> in design to that of the IPQ9574 SoC. The main difference is in the
> clock rates for its two parent clocks sourced from the CMN PLL block.
> 
> Given this, would it be acceptable to update the clock name and its
> description to use a more generic clock name, such as "nss" and "ppe"
> instead of the current "nss_1200" and "ppe_353"?

Because you used those clock_names in the existing ipq9574, you can't
change them now. You could introduce a separate set of clock_names
for the new ipq5424 though, but I think it could be useful to drop the
rate suffix for new additions

Konrad

