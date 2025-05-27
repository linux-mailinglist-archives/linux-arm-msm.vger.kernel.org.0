Return-Path: <linux-arm-msm+bounces-59562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F338AC5017
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 15:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABF771886D68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 13:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08BEF272E6E;
	Tue, 27 May 2025 13:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oz/1jUbP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE62248F5D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 13:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748353290; cv=none; b=GCOnsPe4hSp9ud7w+m7aKcbW7OqUobtMasS2qSHmWy6GU2J83Rih2gWhhCoWqTfhI5opwx+mNE3ro82xr16dOo14gENAZFeAO3Upig9dmBw6RXJvOoS4kx05GsV0a6fxmi4huxleeTrkAWaIuONbz+wOdGUHgG5g4qnPFb/QdeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748353290; c=relaxed/simple;
	bh=eqrnG1lZLmsW/y+K5POXZAg471BAsSXO8VWTa+x9WEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jShvJMAVMX7rYBuJ9ZbSwf3bjMMKLM1Q22ZiYyLuroOkuNONBfpl//Qtj8VsQCuUUAXpn5N0sLGX0+u+KkqWCKacscC7mI8SKyM3hkx0O9IhdbnBaRDohp1eGTwF/s2wU1AJshVEHlr6cP8ss9d9cm3gJRHQ5reRzstAxZY68Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oz/1jUbP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R9RWCw007505
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 13:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ERfDT1p+bjimwu7UE0keI/XkAbZ8gsveAmakce5jzjU=; b=oz/1jUbPk71hvr8K
	SFvCeOgzjdmvLzpWF5DGRXrCI1Wkf1QkebuvBPown1H0wI+2+Z5vwPCtDRKgODh1
	ZDLNmWMe4rLs73oNP0yjjNtXe2tHECwOkY4Xhv2RqKfQY1drp7LDeyBYatYjrx/U
	UOJwmJBz+iPqAK62OARQnW8VgLTuamI/Hc0UcgusEKB08yGbZ9fPBZ/QBZ+yjRLY
	IFc7SCPJjoHY0ibauyYXqvlMuubxE1jYgOQjv2MZcdilvYyXCfKnEDU1T6104lqF
	PEBte9UI/YyLHAftW17MAmMHXA4PBQlFcQL7Gj2Ir9I42yW1hl4HLWmTtHk7IOvt
	Ms45hQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmgcugc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 13:41:28 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6faa8342503so3621786d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 06:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748353287; x=1748958087;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ERfDT1p+bjimwu7UE0keI/XkAbZ8gsveAmakce5jzjU=;
        b=lnqjLFHqQjkDcpvJEb05E7mNQgZaDPz0AgCUXacxQl0S4HSTHGeCS5ap/9p1V2fHW4
         FCo0nQBBewV+6EJ0IUJuC/9GfAd+b8Igr4To7MJdy4/Wf7ECgCt2g5IzGmhA3+YoxbQu
         sX5hZYKyjpPRzftZx8fj61hpWsDIk0Y9IjTUdhqTL9pAlNU7B9jaDhKJglnBYIqXcQeO
         en9ibg9Oi2eCkYxBTnqocfy2XtRx5OH61qP01QNHES+LNPYWz9Mrcse4VkBq5h/1k1UV
         Em01CQ38XUclomC1aENvZTo0NFQFtVPFi/dKkvo5g7A1TLpAa7DkPVwQXka86dmbntdE
         w6DA==
X-Forwarded-Encrypted: i=1; AJvYcCX7wjwr/UjACptxlZzQLKMVlbDquG8ZQyu0lST0+vNg4g4aQF03IctgLG4/XqwIOAho0Ljg7/ZbowX66Lc4@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmharb4uZhuH94UFKaHbc10P4UrI/ci/wOh6i92MUZ8fIyLGzK
	wj0QuS0gfWUIkFpdK6MGeAvz5C7fPVI2b0BIz5S6XwaZvayYz0UX7mAihKciA6nhZjsK3DzZilZ
	t2fdPMvX1RYUykZqwDiPIZvtHwhzJSPqdZtuv4EdXtyjMY33VtiErpSo9IND9Q2X8MwfL
X-Gm-Gg: ASbGncvZ13zZeE3VSh9Yxr6+cBvX6UahzUORiZ7qjwSFjd2DSIbP31rIhFzgG5xsfYB
	Psqm7iuOnOmycmY44vlaYl4qRy1lPtZ/5yWsCQbee7Xx5SNF/DpYEQwsWseaU/ocQvaBZPmq2xw
	svRIVprtn+jTrpzS5rU+p5tsF7Ej9ee/dY5qWYzodG3qNreR4HxJtRrcHzMbdr6Y+P4wzN/1zzM
	sk/nZZjJUJQrm4aBJSbK+2YqNUmwClk7rycju9yFLN9XX/fnZ5RJz3k6O4JY8EYTZsbQzmZMa8p
	Ryk8GgR58u1trOM4vk0bCxGL6pbhEpJxngccewYulvrA94C3aTjJ9d7C9LD/1vMB4w==
X-Received: by 2002:a05:6214:f2c:b0:6f5:4259:297c with SMTP id 6a1803df08f44-6fa9d322aadmr73791326d6.7.1748353287144;
        Tue, 27 May 2025 06:41:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjqXPi+7vAd88Ft7f9PnA4rmMxmVtVhyeYRYjMeWxtVj3a4v2wV20uTm0Pohz8zd9qMGjP5Q==
X-Received: by 2002:a05:6214:f2c:b0:6f5:4259:297c with SMTP id 6a1803df08f44-6fa9d322aadmr73791086d6.7.1748353286612;
        Tue, 27 May 2025 06:41:26 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60306f0e39esm4940959a12.33.2025.05.27.06.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 06:41:26 -0700 (PDT)
Message-ID: <62380db5-5f01-4652-85a3-4dd213deba5c@oss.qualcomm.com>
Date: Tue, 27 May 2025 15:41:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: qcom,ipa: document qcm2290
 compatible
To: =?UTF-8?Q?Wojciech_Sle=C5=84ska?= <wojciech.slenska@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Andrew Lunn
 <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20241220073540.37631-1-wojciech.slenska@gmail.com>
 <20241220073540.37631-2-wojciech.slenska@gmail.com>
 <5bba973b-73fd-4e54-a7c9-6166ab7ed1f0@kernel.org>
 <939f55e9-3626-4643-ab3b-53557d1dc5a9@oss.qualcomm.com>
 <CAMYPSMr2JCQCX69PGUk1=7=-YfBcyFDpqQ6tMQzFP040srBA7w@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMYPSMr2JCQCX69PGUk1=7=-YfBcyFDpqQ6tMQzFP040srBA7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xaa8K7pywAod2B-v1CkxL34cjY6_Fn8e
X-Proofpoint-GUID: xaa8K7pywAod2B-v1CkxL34cjY6_Fn8e
X-Authority-Analysis: v=2.4 cv=Ws4rMcfv c=1 sm=1 tr=0 ts=6835c108 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=Mi87qWPe0p8fJGbmGX4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDExMCBTYWx0ZWRfX6sh+q6wN1xz7
 pibkKpvEdZGsuHSCuB2rlxmJf2Q7sEnqaPF1EivBLt9Q7FvUgcet9PwR7BGPmgHTI61TZZQzryt
 GUqcSx6gbfEP7zELD2h5Ca0Ts5bYVKHJZhCDrUGS6TfVxxmxwnGcoxyqphQd4gJDhD1hH0zS3HN
 FTe2LEgndiQEm+kPrvFSyI5D+jGFYDryiw485ATJ9Z3LspKCuTeCcRFWcmG99geMUPOwk2dpd1D
 d2UodLhI96g8HJ4qUsEcZdkzX3mLEzZeqketQGhA+tPU3AhjL9Uqk/1NAyoXhvpwOd7+gnRVUzQ
 Dvd8GhWmxopEkSZsx2bdNgw9kM8JDBIQJMem4aH7PHSn/nGv18uXXX1LmFcnIbFGPBANMgKWUom
 usnTx7lDLbgapjfPWRudtAWh/GKTSVOEH1r5OQFtsyKfFUU7yVs3QTz4GDDAJzLSFFUIpoaN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270110

On 5/26/25 9:39 PM, Wojciech Sleńska wrote:
> pt., 23 maj 2025 o 01:30 Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> napisał(a):
>>
>> On 12/21/24 9:44 PM, Krzysztof Kozlowski wrote:
>>> On 20/12/2024 08:35, Wojciech Slenska wrote:
>>>> Document that ipa on qcm2290 uses version 4.2, the same
>>>> as sc7180.
>>>>
>>>> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/net/qcom,ipa.yaml | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
>>>> index 53cae71d9957..ea44d02d1e5c 100644
>>>> --- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
>>>> +++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
>>>> @@ -58,6 +58,10 @@ properties:
>>>>            - enum:
>>>>                - qcom,sm8650-ipa
>>>>            - const: qcom,sm8550-ipa
>>>> +      - items:
>>>> +          - enum:
>>>> +              - qcom,qcm2290-ipa
>>>> +          - const: qcom,sc7180-ipa
>>>>
>>> We usually keep such lists between each other ordered by fallback, so
>>> this should go before sm8550-fallback-list.
>>>
>>> With that change:
>>>
>>> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
>>
>> (half a year later)
>>
>> I've now sent a series that resolves the issue described in the
>> other branch of this thread. Feel free to pick up this binding
>> Krzysztof/Rob/Kuba.
>>
>>
>>
>> Patch 2 will need an update and some prerequisite changes.
>> Wojciech, you'll need:
>>
>> https://lore.kernel.org/linux-arm-msm/20250523-topic-ipa_imem-v1-0-b5d536291c7f@oss.qualcomm.com
>> https://lore.kernel.org/linux-arm-msm/20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com
>> https://github.com/quic-kdybcio/linux/commits/topic/ipa_qcm2290
>>
>> and a snippet like
>>
>> -----------o<-----------------------------------
>>                         qcom,smem-state-names = "ipa-clock-enabled-valid",
>>                                                 "ipa-clock-enabled";
>>
>> +                       sram = <&ipa_modem_tables>;
>> +
>>                         status = "disabled";
>> -----------o<-----------------------------------
>>
>> added to your DT change
>>
>> please let me know if it works with the above
>>
>> if you're not interested anymore or don't have the board on hand,
>> I can take up your patch, preserving your authorship ofc
>>
>> Konrad
> 
> Hello Konrad,
> 
> I have applied your patches on top of the 6.15 kernel.
> I used the following:
> Konrad Dybcio: arm64: dts: qcom: qcm2290: Explicitly describe the IPA IMEM slice
> Konrad Dybcio: dt-bindings: sram: qcom,imem: Document QCM2290 IMEM
> Konrad Dybcio: net: ipa: Grab IMEM slice base/size from DTS
> Konrad Dybcio: dt-bindings: net: qcom,ipa: Add sram property for
> describing IMEM slice
> Konrad Dybcio: dt-bindings: sram: qcom,imem: Allow modem-tables
> Konrad Dybcio: net: ipa: Make the SMEM item ID constant
> 
> Two corrections were needed:
> 1. A small change in the DTS:
> -                       reg = <0x0c100000 0x2a000>;
> -                       ranges = <0x0 0x0c100000 0x2a000>;
> +                       reg = <0 0x0c100000 0 0x2a000>;
> +                       ranges = <0 0 0x0c100000 0x2a000>;
> 
> This was necessary because, in the original version, the following line:
> ret = of_address_to_resource(ipa_slice_np, 0, res);
> returns -22

Ouch! thanks for noticing this and for all the testing

Konrad

