Return-Path: <linux-arm-msm+bounces-36951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0386F9BB73C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 15:11:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC026284C93
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 14:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4CAF13B58C;
	Mon,  4 Nov 2024 14:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X5DayAdE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C88413B29B
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 14:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730729481; cv=none; b=dufzeTr8jae+bmw2j4IDPDbXJLaKxCvqXOtf6VmDt/WhIS7JXkfi30UYpM/q8eROYNc7RiRMaK8lziZ94zICUuQ50xt9xiiKpiYTbmeeuEWkrPG1g4SZKRvOL32gVZRh2hWCZrW5IGQhUbE8lBjhjZyNzrpLd6bG7Ds9zeKjgjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730729481; c=relaxed/simple;
	bh=Mb1NAHwy4i/OehlNAj/7mKmxIJiSPMovAsyefDQqPCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i+2bUmZEoskVupCnfsS5LWgHrB1WIW5FQoKFXGivIhC/R7yA+lZ/uMaC8QFXlOubeNj2HlaYGMkWGQ9xO0jA8GwRiQqZCrTleSPcAwshm0nBEfVRK3kiOf01EwDmUN0Vbi2ZimknkytEUn5OKvTJVK1whREZ65QEVKHUbeJFDrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X5DayAdE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4BjYva013492
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Nov 2024 14:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OWQGK+gFqiAdlvvCufCcwMSL0mH6zzKf4LLgUnrZec4=; b=X5DayAdEp6wWCsxl
	4YtvZQekepElalg4PMAXyJkPQOyArVsqiA4e5mpGb2vQoVxMGIkUSteUhmWvhDa5
	yLUNgLAIEvjLKxUw4Q+7XUpk78mbA1pnKSK4aVUHTPfy4rLZYA2S9vxuTm+RWaiW
	YJqRHwOPC9Y1FayC5yXGyP47tlgEKQLsUYfCMXdlEO/mBx0po+WODsWIMcR/Jb4v
	t6EtKFrX8rTIe1qyNBrMIgYwgImC5NiNLgoky6h6r6KITLwTH/K8KhAXvxXTN4HC
	Bh59JQN+rl2Y3PPGgk1PzXaQrc2Au+us40Ez7Mc6Ihc/fdSVtM4liQtfx1C0Mbfs
	LnFb0w==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd4umg1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 14:11:19 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-71806530394so400254a34.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 06:11:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730729470; x=1731334270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OWQGK+gFqiAdlvvCufCcwMSL0mH6zzKf4LLgUnrZec4=;
        b=B2FF61M4llIwpUgzNIraZlJDWy3C9u0I0Ts2iuxFBADm33e/TxpWha26oh15eAcyW+
         tpe/VejJ/+3W++keD5oWafiY/8p/XdhTMWzAyLNHbDB8oss7FJXiFn9z2OQRfu6P7q2J
         YeMlaCkvVzntsKiKkDe+kwf9aLevK1bu4/A8Sjcm9eP7BCcvSE8qcB/wLPLUohPYWIZA
         0pH9L8jYF6NaOVyGKSMRP1icLivzBTYVqNYKt4ZCkEbWig9zfsrp3fUpzc5MZjXMYsCi
         7npXuBT5Pk6LHkRC6YGflAcNr8Bgm8f2oRbBwZEDZzrhoZR2MHAJDmMWXSZQ1rjNwqEs
         E9cg==
X-Gm-Message-State: AOJu0Yzlk4qaJ6cNe5mNOFZcTQbTqt/VIezpcgPTbWteeYUR5/0iykLc
	/GmkFM2UhTvXC4XP/Qt6FwR1TjsZt+CXs7qhv0jDpXHNvIUS1e28gfqKYglrx3ithINf+vrPy6+
	bpJ/kPIhNtVXhk5vJjKksPMdDiLHm7bTaL9dQX2wl/SnKKT4kKGez7ui0knmHZ8mK
X-Received: by 2002:a05:6808:13c7:b0:3e5:f6b0:6ece with SMTP id 5614622812f47-3e6384c54e0mr8553318b6e.8.1730729470513;
        Mon, 04 Nov 2024 06:11:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeLnK3SNwDSbU/S8+Adq+C7BNiBcubtYMDM1I7j21B1MpWE1qSEckxqqAiiqRZlKmn1s3qYA==
X-Received: by 2002:a05:6808:13c7:b0:3e5:f6b0:6ece with SMTP id 5614622812f47-3e6384c54e0mr8553301b6e.8.1730729470101;
        Mon, 04 Nov 2024 06:11:10 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e56645da9sm556198566b.164.2024.11.04.06.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 06:11:08 -0800 (PST)
Message-ID: <a41e3aeb-43b9-49c0-8243-29a78a3b1602@oss.qualcomm.com>
Date: Mon, 4 Nov 2024 15:11:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Add coresight nodes for QCS615
To: Jie Gan <quic_jiegan@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>
References: <20241017030005.893203-1-quic_jiegan@quicinc.com>
 <69be09ec-e9a5-4fb6-890e-74a65f3ce404@oss.qualcomm.com>
 <3f90b3d6-9637-47b7-ad8a-ff43cb28ad32@quicinc.com>
 <e263d461-9e2b-4ffe-8221-cd9ecdd142c9@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e263d461-9e2b-4ffe-8221-cd9ecdd142c9@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: L8_bj0N3Ea7VRh942VIqJ-5nLINfCzVp
X-Proofpoint-ORIG-GUID: L8_bj0N3Ea7VRh942VIqJ-5nLINfCzVp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040124

On 28.10.2024 3:53 AM, Jie Gan wrote:
> 
> 
> On 10/28/2024 8:54 AM, Jie Gan wrote:
>>
>>
>> On 10/26/2024 2:47 AM, Konrad Dybcio wrote:
>>> On 17.10.2024 5:00 AM, Jie Gan wrote:
>>>> Add following coresight components on QCS615, EUD, TMC/ETF, TPDM, dynamic
>>>> Funnel, TPDA, Replicator and ETM.
>>>>
>>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>>> ---
>>>> Already checked by command:dtbs_check W=1.
>>>>
>>>> Dependencies:
>>>> 1. Depends on qcs615 base dtsi change:
>>>> https://lore.kernel.org/all/20240926-add_initial_support_for_qcs615- v3-5-e37617e91c62@quicinc.com/
>>>> 2. Depends on qcs615 AOSS_QMP change:
>>>> https://lore.kernel.org/linux-arm-msm/20241017025313.2028120-4- quic_chunkaid@quicinc.com/
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 1632 ++++++++++++++++++++++++++
>>>>   1 file changed, 1632 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/ dts/qcom/qcs615.dtsi
>>>> index 856b40e20cf3..87cca5de018e 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>> @@ -202,6 +202,18 @@ l3_0: l3-cache {
>>>>           };
>>>>       };
>>>> +    dummy_eud: dummy_sink {
>>>
>>> Node names (after the ':' and before the '{' signs) can't contain
>>> underscores, use '-' instead.
>> Sure, will fix it.
>>
>>>
>>> [...]
>>>
>>>> +        stm@6002000 {
>>>> +            compatible = "arm,coresight-stm", "arm,primecell";
>>>> +            reg = <0x0 0x6002000 0x0 0x1000>,
>>>
>>> Please pad the non-zero address part to 8 hex digits with leading
>>> zeroes, across the board
>> Will fix it.
>>
>>>
>>> This looks like a lot of nodes, all enabled by default. Will this run
>>> on a production-fused device?
>> Yes, usually Coresight nodes are enabled by default. Those nodes can run on the commercial devices.
> Sorry, my last clarification is not clearly. The Coresight nodes are enabled by default for commercial devices(fused), but only part of functions can run with commercial devices because it needs check fuse data before running.
> 
> If we want enable all debug functions related to coresight nodes on commercial devices, we need APDP override(APPS debug policy override) procedure first. The APDP override procedure will override some fuse data to allow debug sessions.

In other words, will a production fused device boot with this patch
applied?

Konrad

