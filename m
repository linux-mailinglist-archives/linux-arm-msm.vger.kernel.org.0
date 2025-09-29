Return-Path: <linux-arm-msm+bounces-75498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C138BA8D41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 12:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDD983AAF17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 10:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE212FB0A9;
	Mon, 29 Sep 2025 10:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qi0UgehH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0A12FAC1E
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 10:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759140693; cv=none; b=SQPFh9ZcqgNMfv7yA6eKSXQjFQzfBa3iT7Ewm21md/un3RQx+PBe4/NLC1TkAvgRnhIxP0JrZOPuJQ1+6yntLo0UQyNW1gsri+OLd4/QcgjKsL/szQ757tfitNPCqwhascS/xBHU+I12yCjwXqYVA4vBDzX45KhANUwC+PrGF8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759140693; c=relaxed/simple;
	bh=SNlPsVtVvLE+7Qc32BXbo+x7QO7oxtlaKyVIWZUYfdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kb43FvK66co1lD0AYey4dCEX7pECWZx00VfgSN7PiEi+oKE57EE0F9M4We9FyyijoF7BefaqXowU0ex30+tDWV/+AKTqGtqG9TVaLR4GGe8TQr1Hoh+b1JjjbTDjmZhogDk/3o4BID+Fe1zpF1T8vZE0tyoQYC+/YaGXZYzzusE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qi0UgehH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58T9xkvB031597
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 10:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KAy6TsCY0/+8cRPvCOBR5q3OazEKN7PJw0wUDI9VBI8=; b=Qi0UgehHpBKMgFxZ
	nSMXe6dms8moOAvkBuo0I0/Ac760RPu2rluzEcx/+aRUAl3P+HEHRRlLZVayG2iw
	iXyXeKqXKJBok+hJu8IY3PvUvZp/buUpj8mfGO4P0uLUTm02u6QTxF9NGyCkt6Xx
	jgpasyBuVF2R755vHCaEi4qp/FGUhU2rZeDvmoDz1w8UPA1IQ7jIj15nCgMmiP3K
	/ZHISxC0WF7izjocTox0ROdnUakxLEZWKyhG2Y8XdZQXZH56dwkINon7fEgUUMJ/
	GpQZb7SmHC7FtajVB+i816WLE89GEgYcOiBuMUNK2fhpXpNZJQRZKd/60b+3BRo6
	PZV3gg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e78fvuea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 10:11:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-781269a9049so3837924b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 03:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759140688; x=1759745488;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KAy6TsCY0/+8cRPvCOBR5q3OazEKN7PJw0wUDI9VBI8=;
        b=BvvmBe02K6g1TAbWPwlgMDsEq9RKu72BpKRFAIN99ZYaRTbAzspMh/u9wh6oFEcAxe
         uyLdZfGHgMPUN3qQgTK48tA3PdZmfLTpTZsoPuYMCh6/MotrY3edMAc3RlYGHiAhUcRX
         7lDgHA+b6NFWZ/8Ao450628O1MCNDjvOWVbhlS7TKCBoKXuYe7ewRyXLwWKjjFMgglLr
         7iT2L1dezD/hDJ1gUdSnYK6fHSI9ignIeKh6+x7hczE331eIFFBFnZtGtQvAHC2p4tx2
         iGo9uL7FhgkAGyTDIwTELAHKDgj1bj/0JgeyMpH6WV3XFZty7z6MbMC1RtxFSn1Q9Me6
         Q2kA==
X-Forwarded-Encrypted: i=1; AJvYcCUYgHJNa7uo89mHOYVOWuiCNieQRLAF9YLAU4w1ZraQTqDfWKw+YcSUHpevLOt+WkI6K/m/8rpsfSoFK2FE@vger.kernel.org
X-Gm-Message-State: AOJu0YyISMHGpGAitGMvfXHaclZXNPyWHHGirx1fLkIO+KIDO/tqQ5ZM
	9TEsAeFfj4DWEkbMZRai5ffDhq4qEu/bKNfxT9GjxpHMDtSofip/mN/Wr3p7FEEnN4robWaX28p
	Gft9r7SYsIShVG9YojYGZKumNvmPj5Xqh2AM2VMHcbd9lYKkMR8a/i73XWxxwpCkP0TfR
X-Gm-Gg: ASbGncu3dHA34urYwDEkC2AElxyhRUFcSOS4UMRj+O4nIBZIL0dwM+wImAiKXtW/MIt
	TETudSQZD4Z9pwZneeQqxVvMTGIP7afjAKj9SrLF87GTdtRsN4Qox1KXrZ0fcwQblfg5DuiSfqq
	Hbqy1f5CcvxcWnrPEHR6SzJLFvVzVWg0X777t08/78OtQO4II0MK9dLkveEb0DX1pR9pXUl8+2R
	Mdw796UCz12SHcLdkVqYYdSkYBykenmr/hxUA/SR/TiAMH1QHj7Cj6LlCCTSGPzEkHi16Ecf/Gl
	EtWmmPKv7ndUuUEl7yrRIcMv/Nf+wdfOFSHD2tNNHqcpOLaxCCbpfv0jWyYbJWYyvlBShUG3W3I
	m7d2I1KM1kLiCXm0KJxNgcvt/iiP3BgfRWtU=
X-Received: by 2002:a05:6a20:9192:b0:2bf:183c:aca3 with SMTP id adf61e73a8af0-2e7c1eb1322mr19674185637.12.1759140688484;
        Mon, 29 Sep 2025 03:11:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzemKX0SD6GSKVWhUTVYl9RL2yj6+ykC20lMCtAy+GTBdDXQQON7rWIJ2aTOuGZH74HCqu5Q==
X-Received: by 2002:a05:6a20:9192:b0:2bf:183c:aca3 with SMTP id adf61e73a8af0-2e7c1eb1322mr19674138637.12.1759140688000;
        Mon, 29 Sep 2025 03:11:28 -0700 (PDT)
Received: from [10.133.33.234] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c52eee5fsm11103220a12.0.2025.09.29.03.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 03:11:27 -0700 (PDT)
Message-ID: <4a25e085-39f8-49dc-85c6-7a4267689dd1@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 18:11:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali ADSP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
 <20250924-knp-remoteproc-v1-1-611bf7be8329@oss.qualcomm.com>
 <h4lk5psnwx3ma3um2sozhcdccwhmgmbje2lgjks2czcrzn4mre@svtnbyzvrivw>
 <d374036c-1263-42f4-b9ae-13b21427b01d@oss.qualcomm.com>
 <maeobo6qukgzn3acwtvhfrvwrfwo4q5pzspem6htbybr5xuwlm@opagojsav6ey>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <maeobo6qukgzn3acwtvhfrvwrfwo4q5pzspem6htbybr5xuwlm@opagojsav6ey>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DZAaa/tW c=1 sm=1 tr=0 ts=68da5b51 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=dVhWkjGdtg-RV6iV_LsA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyMiBTYWx0ZWRfX2pNTeNemyED/
 uqzj6/rKKucAYvSmaWztl2ypHbBGBDjJKnI671n4xukbq5D/SZHoix2tBAZ5pyX1lqZGumXB+L8
 zGFeNrTxoT/dXhguHlHYbE5JO6Tkv8v8S2VlVmEJSvS7cl32zUXlyNgbc8iC2EJiLb/WjvKkfw3
 POD6HqcWZpdGDW44cjcF1izaJKRnK6GWn7lEJ7InNEJs5X8+PH2XSb6er3/CFoWxFC8jHN2U/5Y
 SWTZmuQFAFR03FHI6sYm5G0G80LOzeXK870HAQY0JnfMKjftjii5R4XxBmxUDUANqNR0RIu+70Q
 VlUYrPGcuMAFi4hlCenGdD4Ff8MIVHo9kDbgvI0NEMSM1I8VyaU68sIEIQmvCgebqbvZtLG5rph
 2FgmcqntyF49mWNzuRVCN/DsCa+zbQ==
X-Proofpoint-GUID: RALaO5VAmPjkVM28nw4fw85A-NT8sxDT
X-Proofpoint-ORIG-GUID: RALaO5VAmPjkVM28nw4fw85A-NT8sxDT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_04,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270022



On 9/29/2025 5:39 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 29, 2025 at 02:06:11PM +0800, Jingyi Wang wrote:
>>
>>
>> On 9/25/2025 10:19 AM, Dmitry Baryshkov wrote:
>>> On Wed, Sep 24, 2025 at 04:37:22PM -0700, Jingyi Wang wrote:
>>>> Document compatible for Qualcomm Kaanapali SoC ADSP PAS which looks fully
>>>> compatible with SM8750, which can fallback to SM8550 except for one more
>>>> interrupt ("shutdown-ack").
>>>>
>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 6 +++++-
>>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>>> index 2dd479cf4821..be9e2a0bc060 100644
>>>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>>> @@ -28,7 +28,9 @@ properties:
>>>>            - qcom,x1e80100-adsp-pas
>>>>            - qcom,x1e80100-cdsp-pas
>>>>        - items:
>>>> -          - const: qcom,sm8750-adsp-pas
>>>> +          - enum:
>>>> +              - qcom,kaanapali-adsp-pas
>>>> +              - qcom,sm8750-adsp-pas
>>>>            - const: qcom,sm8550-adsp-pas
>>>>        - items:
>>>>            - const: qcom,sm8750-cdsp-pas
>>>> @@ -95,6 +97,7 @@ allOf:
>>>>          compatible:
>>>>            contains:
>>>>              enum:
>>>> +              - qcom,kaanapali-adsp-pas
>>>
>>> This one and the next entry are redundant. Do you see why?
>>>
>>
>> This one describe the interrupt:
>>
>>   - if:
>>       properties:
>>         compatible:
>>           contains:
> 
>>             enum:
>>               - qcom,kaanapali-adsp-pas
>>               - qcom,sm8750-adsp-pas
> 
> It's still redundant. Don't you see it?
> 

sorry I didn't get your point here, could you explain more?

>>     then:
>>       properties:
>>         interrupts:
>>           maxItems: 6
>>         interrupt-names:
>>           maxItems: 6
>>         memory-region:
>>           maxItems: 2
>>
>>
>>>>                - qcom,sm8750-adsp-pas
>>>>      then:
>>>>        properties:
>>>> @@ -185,6 +188,7 @@ allOf:
>>>>          compatible:
>>>>            contains:
>>>>              enum:
>>>> +              - qcom,kaanapali-adsp-pas
>>
>> This one describe the power domain
>>
>>   - if:
>>       properties:
>>         compatible:
>>           contains:
>>             enum:
>>               - qcom,kaanapali-adsp-pas
>>               - qcom,sm8550-adsp-pas
>>               - qcom,sm8650-adsp-pas
>>               - qcom,sm8750-adsp-pas
>>               - qcom,x1e80100-adsp-pas
> 
> Likewise
> 

indeed, here is redundant as "qcom,sm8550-adsp-pas" is added in
the dts. I will remove this.

Thanks,
Jingyi

>>     then:
>>       properties:
>>         power-domains:
>>           items:
>>             - description: LCX power domain
>>             - description: LMX power domain
>>         power-domain-names:
>>           items:
>>             - const: lcx
>>             - const: lmx
>>
>>
>>>>                - qcom,sm8550-adsp-pas
>>>>                - qcom,sm8650-adsp-pas
>>>>                - qcom,sm8750-adsp-pas
>>>>
>>>> -- 
>>>> 2.25.1
>>>>
>>>
>>
>> Thanks,
>> Jingyi
> 


