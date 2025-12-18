Return-Path: <linux-arm-msm+bounces-85682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A75F8CCBB66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 13:03:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EAA230707B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 12:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D861332C950;
	Thu, 18 Dec 2025 12:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4WcPmKs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RuNuSvbV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D022232D0E3
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766059359; cv=none; b=bkYaXXrRLbxYyDVdevfw64kHYUCMGvhKaDRhfR2/ba+ECygPDrPmpd/i0svYnu/B1eNKgr3DFz4GVe7RcSbacnJWgDEB1xc4rdjtLdRr7KiElpofaxVeXdh8r5U1Qxvjj5ir7zj2O8eJwV6SPh7Vj5cKZ0xZ8wR9c8PRjcjv6EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766059359; c=relaxed/simple;
	bh=2LkLvDuDiZF2Oqy24Wdv+QwVvSgqRTukra+AHkgkL9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CJyEI/1kGLulSlmkV7bB7CQntmhV6JD9JhwoEgHFj13bpIWOzJNsXetemyWHSd4RdAwuee1pRnWShgGwaMrPEBPTU9MI0zlUFPAmoONkuToSzXoERSad7SXeYB+XuSdblrgP+Xi5LhqDb1QENrpPkdJiWKrzDQeEatfKacnCl54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4WcPmKs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RuNuSvbV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIB5LSo1334757
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Vm/z6fYkdn2JoQ1TCNbeRy8mA7MaOc+Zg3cU+fK6UQ=; b=M4WcPmKsynq44HVC
	qzwxdxeLGtbtTx1v/L+iPu6krGaUVsWAcZ9heSuRjf9xH1wFTZvmq+ePxfbt6u/V
	TFipIrcMZAKSxIX7MSGivPRmU3KdGVMA90JM5BnlClmFPp21i9eO4BJzWYsFZHKS
	zRd3JloQxr1R9Y4/4717fOUj9Yu1zB8Qr7oTID3BqNWWjx1fV7IS0HFSDZtWDiqy
	pt7+sCmCDXOo9KwYVwBBl/43tMcSNN1Vp67W334a293BpHEEv2akCZwSTE74I/iH
	ilxOE9jd0G2s8KH+sPrX1uDyhwNNTEu91eVJTsZuA/rPlU1Oo4wYZGQoiP4ZOIt0
	+ZVB/Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4gec05qx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:02:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f3564e2321so218891cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 04:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766059356; x=1766664156; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Vm/z6fYkdn2JoQ1TCNbeRy8mA7MaOc+Zg3cU+fK6UQ=;
        b=RuNuSvbVvAlU/mlpvRs5UdD9vme2icEm9cu8ncU6aK9uo6e/Gt8MmoAIHj5/ndvdSs
         jA+DT6IcMu48NvVlwqBPA86VAeAQHaE+z3pySuFwUyuy7K5cQeo7hhKbaTHaSNHtrvmg
         ql1KXMfjmVzGAQtORkvBf6472IRwCqXYUKXxjkpPGs8cYNtEmz8LhDAm+jRMmgn427Bi
         ttdXrYghncLZIVCDzn6TDGaE9fuLgIXq8Z00S7Vj9iYLQXSn85y7aBc4kppsFfRNM/f7
         R43+x1eiq2qbMNtuoRUEB09MBaOVIjCXhtWnL45y1/ksFfEC6VAJTnL5VKYT4rTaGA2o
         4v3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766059356; x=1766664156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Vm/z6fYkdn2JoQ1TCNbeRy8mA7MaOc+Zg3cU+fK6UQ=;
        b=ENwZlj3LEPFgfwnmGGqfr4KQZ95kX5vySTZJv6TXUjy5yZS7XgKetlRMTKUTB2y4es
         x50TeoYtgXtK8Z06nLv9WmZcbMd03AkbfNLf2kPDIJqqvRgY0y3XGTgekJrwm4lU2SKT
         5VN81bvYooWFykSoo9gEp2Uwfe5vRgVVht4NiScBZKuvCxSm2AYIRezGB+neZWKMpCkF
         0iLo4RmXVmohK6t58yG2y5tyLm9OiCQ4E4JqjpG5SCHeEzcCmkcDOjbUC2NFXOTJMQ8e
         IKYk6lBpQGHk4VMODLdQeX4lC6LN/tZ9Lxqkj+WoIYdUQTafeAPNrZCGi/FAwUeE1iwb
         5iEg==
X-Forwarded-Encrypted: i=1; AJvYcCUh4HIZciE8tSFGxwuWlYEBbKov+osfy0Ljv5BSRcGZTsIKGdv31kbIRwEjdvwpv9hjFWOKfNExIUk0XbOy@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6EQn0U0nSgV4jq9V0FNPuTxUsGOUlZHn0JTuJRpfsAf1gYDV3
	4kimTmqrKuwYFaT+m/yltOGsQHXBi76vVAH1A7T89ytNQzN6Y5rO4jLs+otNXfb+ktz+uhr6Agz
	Pr2ilpLUFx7IqyT3JHhTyRSPvTXZpXRwfNS+eMjou7ZZCAzjE18cIl3+eyfSouX0YDeD8
X-Gm-Gg: AY/fxX5BAyIV4qxuZ3mAAUMDwCnOztCyclAQakEAGZM1ZlXqFmom5tLtfd1G9Ew/6T4
	+Omo7himXQ63hv6g3ZTLxLzorXmxb0RcVBDNop41j6LmgiKkgMe4UAM4mQ3lr6dRFN+t8DpZKOm
	XLJce6irQXiXwEVcGpnyfDxNa0ZvtdDDO8lFXiSya7Fd/gZ9a3/o5g6I6fxgryW67kmkq2rKP32
	4J+WJsIvZsHOHhXAZ4bgKt9u7yLMT6s/S//YJBBl4/pH6Coo0FKrnqlD4nmUaywTtUuDm+rhban
	kg3yBN5xHelNhyJ8F6fFpdFbr01rtSqJWtre9QYCvdtV8xrwHu1O/KcR//8xq/u5aRvxqng09JN
	JB2WaHUP2k1Q1+pHOzMJ93xRD8+V7W2JAfBwlXh7oHZ2zx4T3FqY5mrLsPr4VzW62MQ==
X-Received: by 2002:ac8:7e84:0:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4f36103f922mr18008151cf.2.1766059355668;
        Thu, 18 Dec 2025 04:02:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEjKaCrErxWCAcr66bGBT8jNIruLZAk0ai2nWX7kimbI6AaPHvw4PWGXD/l8FGMsK0GDByDA==
X-Received: by 2002:ac8:7e84:0:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4f36103f922mr18007551cf.2.1766059355003;
        Thu, 18 Dec 2025 04:02:35 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8023466d66sm204110166b.34.2025.12.18.04.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 04:02:34 -0800 (PST)
Message-ID: <bfdb1125-3dcc-496e-8380-80ba669dfe20@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 13:02:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu: add actlr settings for mdss and fastrpc
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        robin.clark@oss.qualcomm.com, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, dmitry.baryshkov@oss.qualcomm.com
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251105075307.1658329-1-charan.kalla@oss.qualcomm.com>
 <eb596f7a-e13b-4edd-8ee7-05424ea3d9e5@oss.qualcomm.com>
 <c4b1df46-e4b6-4d95-971c-7aaf33bd35f1@oss.qualcomm.com>
 <02d7c0a9-0d24-4fd8-980a-da9d7307588a@oss.qualcomm.com>
 <9b4c895a-c822-40e6-bb92-8fdcd09c82d3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9b4c895a-c822-40e6-bb92-8fdcd09c82d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GIgRaBbOhdER3Kx6lakT9p4Y8r1OUU_7
X-Authority-Analysis: v=2.4 cv=V51wEOni c=1 sm=1 tr=0 ts=6943ed5c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=Y1-X-kz94dDufzMKMX0A:9 a=UnacWq3ggp9slQcj:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA5OSBTYWx0ZWRfX56YuNf1O0V37
 px//ZC6yjCadff1rZWvgg+d0g8ST3drlW8fJbG49nS6ypknVZT50jGf8NxkEfJZKi7QYKUHeu1f
 FeBeFLzyxCer1Epanrgt4SItNEGsAQDcheTnHC1563VhGdOSexiEFAJ+dvKAhe+LVyyR4jKXc7E
 4xFLRZhlNL7gpi17BZwK6mCX5HYoAXDuDtMxtguGrg4yvnF2S52arTjY/FF55K5aTErYpfuMp/h
 Tio9Et41YtRe0NSlJ2RrkgnZGDt7+I8IwEALJKEf22OICF8xMuSkExuAJLAwhviKcRnFFjg5i48
 nzmeMc/aec52Rg80BuCklNpMmY0RYosT7IveuFUB5s1rR1JXKtHzmtkU0PgHwP6J7M3t/JujpAV
 pbkDIpZGUAEIR4Kg3x88gQaXMblMOw==
X-Proofpoint-GUID: GIgRaBbOhdER3Kx6lakT9p4Y8r1OUU_7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180099

On 11/27/25 12:14 PM, Bibek Kumar Patro wrote:
> 
> 
> On 11/12/2025 7:32 PM, Konrad Dybcio wrote:
>> On 11/11/25 3:02 PM, Charan Teja Kalla wrote:
>>>
>>>
>>> On 11/5/2025 2:44 PM, Konrad Dybcio wrote:
>>>>> +    { .compatible = "qcom,fastrpc-compute-cb",
>>>>> +            .data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>>>> This will be globally applied to all smmu-v2 targets with fastrpc,
>>>> starting from MSM8996 ending at Kaanapali and everything inbetween
>>>>
>>>> Are these settings always valid?
>>> Oops, you are correct...this settings are not always applicable it seems.
>>>
>>> Example: lpass compute and cdsp compute node uses the
>>> "qcom,fastrpc-compute-cb", but it is for the later that ACTLR settings
>>> are valid.
>>>
>>> Then for these cases, should we be extending the actlr match array with
>>> additional compatible string and then add them in all the device nodes
>>> that require actlr setting? example:
>>>
>>> @@ -3119,7 +3119,8 @@ fastrpc {
>>>        compute-cb@1 {
>>> -         compatible = "qcom,fastrpc-compute-cb";
>>> +         compatible = "qcom,fastrpc-compute-cb",
>>> +                      "qcom,fastrpc-compute-cb-actlr";
>>
>> dt-bindings (and especially compatible strings) must not be altered solely
>> to work around a driver being suboptimal
>>
>> But because you reported that these settings can change both between
>> platforms and instances of the same devices on these platforms, we could
>> possibly reconsider adding ACTRL settings to the consumer device nodes
>> where they stray away from the otherwise seemingly reasonable baseline
>> we have in the driver so far..
>>
> 
> During initial discussion of ACTLR design phase, It was concluded that
> prefetch alike QoS settings are not hardware definitions, and device
> tree would not be the right place to store such configurable/tunable
> settings [1]. So it might be contradicting to add it in consumer nodes.
> 
> For fastrpc client, there are 2 hiccups:
> 1. For a particular SoC, Different SIDs of compute client are using the
>    same compatible  "qcom,fastrpc-compute-cb" but can have different
>    prefetch settings <refer table below> e.g. CDSP and ADSP have same
>    compat string "qcom,fastrpc-compute-cb" with different labels.
> 
> e.g.
> fastrpc {
>         compatible = "qcom,fastrpc";
>         qcom,glink-channels = "fastrpcglink-apps-dsp";
>         label = "adsp"; /*---different label: adsp---*/
>         compute-cb@3 {
>                 compatible = "qcom,fastrpc-compute-cb";
>                 reg = <3>;
>         /*---Prefetch Default---*/
>                 iommus = <&apps_smmu 0x1003 0x80>,
>                          <&apps_smmu 0x1063 0x0>;
>                 dma-coherent;
> fastrpc {
>         compatible = "qcom,fastrpc";
>         qcom,glink-channels = "fastrpcglink-apps-dsp";
>         label = "cdsp"; /*---Different Label: cdsp---*/
>         qcom,non-secure-domain;
>         #address-cells = <1>;
>         #size-cells = <0>;
>         compute-cb@1 {
>                 compatible = "qcom,fastrpc-compute-cb";
>                 reg = <1>;
>         /*---Prefetch DEEP----*/
>                 iommus = <&apps_smmu 0x1961 0x0>,
>                          <&apps_smmu 0x0c01 0x20>,
>                          <&apps_smmu 0x19c1 0x10>;
> 
> 2. Different SoCs having the same compatible string and same label but
>    different prefetch settings.
>    e.g:
>    in below table sm6550, sm8250 and sm8550
>    compat string = "qcom,fastrpc-compute-cb" and label = "cdsp"
>    but prefetch settings are different
> 
> As per my idea both the above cases could be resolved by compat string addition,
> case 1 : compatible = "qcom,fastrpc-compute-cb-cdsp";
> case 2 : compatible = "qcom,sm8550-fastrpc-compute-cb-cdsp"
> 
> This discrpeancy is not applicable for other clients, except fastrpc.
> One way both the above cases could be resolved by additional fastrpc
> compat string with below format:
> compatible = "qcom,<soc_name>-fastrpc-compute-cb-<label_name>"
> 
> e.g: "qcom,sm8550-fastrpc-compute-cb-cdsp", "qcom,sm6550-fastrpc-compute-cb-adsp"
> 
> This should handle both case 1 & case 2.
> 
> But as you mentioned previously this might need change alteration of DT bindings addition which might not be allowed or favoured always.
> 
> [1]: https://lore.kernel.org/all/a01e7e60-6ead-4a9e-ba90-22a8a6bbd03f@quicinc.com/
> 
>> Or we could introduce some more bespoke matching logic.
>>
>> I would like to know more about the scope of this issue, i.e. the matrix
>> of (soc, device, actlr_val) that needs special handling.
>>
> 
> +---------+-----------------------------------------------+----------+
> | SoC     | Description                                   | Prefetch |
> +---------+-----------------------------------------------+----------+
> | sc7180  | qcom,fastrpc-compute-cb | label = cdsp        | DEEP     |
> |         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
> +---------+-----------------------------------------------+----------+
> | sc7280  | qcom,fastrpc-compute-cb | label = cdsp        | DEEP     |
> |         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
> +---------+-----------------------------------------------+----------+
> | sm6115  | qcom,fastrpc-compute-cb | label = cdsp        | DEFAULT  |
> |         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
> +---------+-----------------------------------------------+----------+
> | sm6125  | qcom,fastrpc-compute-cb (NA upstream)         |          |
> +---------+-----------------------------------------------+----------+
> | sm6350  | qcom,fastrpc-compute-cb | label = cdsp        | SHALLOW  |
> |         | qcom,fastrpc-compute-cb | label = adsp        | SHALLOW  |
> +---------+-----------------------------------------------+----------+
> | sm8250  | qcom,fastrpc-compute-cb | label = cdsp        | DEFAULT  |
> |         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
> |         | qcom,fastrpc-compute-cb | label = sdsp        | DEFAULT  |
> +---------+-----------------------------------------------+----------+
> | sm8350  | qcom,fastrpc-compute-cb | label = cdsp        | DEEP     |
> |         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
> |         | qcom,fastrpc-compute-cb | label = sdsp        | DEFAULT  |
> +---------+-----------------------------------------------+----------+
> | sm8450  | qcom,fastrpc-compute-cb | label = cdsp        | DEEP     |
> |         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
> |         | qcom,fastrpc-compute-cb | label = sdsp        | DEFAULT  |
> +---------+-----------------------------------------------+----------+
> | sm8550  | qcom,fastrpc-compute-cb | label = cdsp        | DEEP     |
> |         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
> +---------+-----------------------------------------------+----------+
> | sm8650  | qcom,fastrpc-compute-cb | label = cdsp        | DEEP     |
> |         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
> +---------+-----------------------------------------------+----------+

Thanks for the detailed explanation. It feel quite impossible to keep
track of all this in the current model.

On the other hand, the approach where a third OF cell is introduced
isn't my favorite thing in the world, and that seems to be the general
sentiment.

FWIW downstream solves this by carrying the list of <sid mask val> under
the SMMU node. Perhaps that could be reconsidered, either as a storage
for all the values, or as storage for non-default overrides.. Krzysztof,
Bjorn, opinions?

Konrad

