Return-Path: <linux-arm-msm+bounces-47580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A0DA30C80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 14:08:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D920F165D22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 13:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB4F221D8F;
	Tue, 11 Feb 2025 13:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R2z28JaH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE9821E097
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 13:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739279319; cv=none; b=pBoIrXGOMnIT65UAUFJvpnVAokKD9O+OHsK3GhU8YsUHB7Otr1Z+hFI16h8VeL+tcpUId+YNBOuouwFtr5Qh4k8ObzG5SR+hDxNKPF0ProuDI1v8AI4OLnSWlQTATwVmx1djgwFa2e6bYCjhZhuLo5Io+7q5XdFuHx0b08H5RVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739279319; c=relaxed/simple;
	bh=vnvebyZwwLc8OwSou8hBVCmlvtKLxHwqaxSZLdVAAuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ffGsWrGNnM6zIyr0zi6VPrcnCh2MOJB+Q8nieJoMh1shhnWdjGvSNqRvzVR6rv/hoWLJ1gB3TaORp0HupRHiAqCwRkzQ47aL7pBkJq5Cag0gTtSU91aHh0F9Z+54qxtICdluOKW/ykx1wskWfoSijrsTUT/FpAUctZJ6eKlFxiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R2z28JaH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BAqIwS031929
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 13:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vHAtLns7KnEDpQV6jYYQrWll7xcYebywPguBOqRPaJA=; b=R2z28JaHgjLe1yI0
	/irQfjKQeEBCQ66Ruo5WBPc9zIs7WF6gYdOBC7o/R0pDEgDiBOplozE7oCj222Co
	+LJdpdfW09d/RrAFM2NpvEWAgt8bzdTCCVbLRN/QgbEpI6/GpS1v7trutqB8mKv9
	/NnknjddikDbMMUVKVHG0X2TPTucGnmh+1M5f/A6poh3X1WawLsddO/kz/ybEG78
	e+aWHEA2Qh5exBV+MElZOlQ3gu9AFFZbQbFUffRPgZbmp7/w7L3Fb+JCByRDbouw
	EbShoTWg76Oohviy+p9LOJxagNtVGTIWVKC0Ej2f4h8gAmVGcBHXUfI8Cmcr6Tpc
	Enw+1g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qgtk3qkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 13:08:36 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e448963aafso12294816d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 05:08:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739279315; x=1739884115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vHAtLns7KnEDpQV6jYYQrWll7xcYebywPguBOqRPaJA=;
        b=dUMEjF/ulRXJsS6ARXizYNCrnUtS7cn2HxUr+zIuDdS8Gbqz5Ol35SM5oBcs9kWjv+
         y6nnCFVBoHEbHZ9GgN/SbTmMq2OjS+g2HavZkbU4/JIQcrvBuV3PiaolR3e/GckEe7r7
         bACw1KflJojp5ljxXPV02kWAW/SJbwkbrtS+PeO0KlVzJ2wSY93BvHw9ScGXiBIoo9YE
         bRa7he0NNvqVGr8wXmcdaeSdHn4wmavI+PkKFj47F/KrFktcwQGrK8nppCRUNZ6/GYFF
         uXCtbASduSDRVvyDYl2pqaAKuHfxJr6zLu7KVJG7n4bdfy5TyL5KdZEBR8socTe27BMc
         USfg==
X-Gm-Message-State: AOJu0Yxd0u5i6E8Ue2gYlJbIuwf1Haykneh9NLwJTZAGD+dJme+FG38B
	QNRo8XPueE4ji4ltQd2qCt6A/dQI5ieJgVB0nTM0SEyiJtQrretuVHvMM6us2GFY16HwxG2t/vD
	9fHwK2pdCI5KcEjAXzdtQs0mZnYtbdVZuZtt/YwceIrdGA7+j4/UOW7iwBnwVAE4K
X-Gm-Gg: ASbGnctU8sIsnrtKfnOu5Wbe/rq/91OGwalRto+34ehqWFX3M+gcXoKIShhP9zPus5R
	ie3lT2e5ot/JEtLRj5RY8KSpmVIJdcZ0xpCN/xjDcswDKiwwxhVWyfAWY+GIX0GCKMdZUze5JKk
	8MeTLONLJqGFh4gLYI4HR2u9h4A2CsCj8zVYeTinelPl6w5eRiTBOuhbnnmJ8hfgsFyxvHLRJGU
	e3lEB1RaEftJrZPw5/GLRthYdsrzjPIxldR/fs0nRY9cu4PK+Gsiqf1Eedu58y/HIoD2ETfbs+5
	Wep6O642eXDFwQfdN3+dKuyZaSFDij+cfeNMy84+8XZ40im/EA4zb5q08WA=
X-Received: by 2002:a05:622a:315:b0:471:8bb2:ed1d with SMTP id d75a77b69052e-471a3da4884mr13265651cf.9.1739279315319;
        Tue, 11 Feb 2025 05:08:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxyWN2FQWfRwG4MGFHiOrHCWVf9nY3hnm7QYJ0cnrKFuy9MLK1m5TwTpomSl/Zgd9LOHGw+A==
X-Received: by 2002:a05:622a:315:b0:471:8bb2:ed1d with SMTP id d75a77b69052e-471a3da4884mr13265421cf.9.1739279314824;
        Tue, 11 Feb 2025 05:08:34 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7ee6f81fesm3927466b.157.2025.02.11.05.08.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 05:08:34 -0800 (PST)
Message-ID: <6d52d3aa-0dab-406d-bf4f-0bace77d46d7@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 14:08:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8650: add PPI interrupt
 partitions for the ARM PMUs
To: neil.armstrong@linaro.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250207-topic-sm8650-pmu-ppi-partition-v1-0-dd3ba17b3eea@linaro.org>
 <20250207-topic-sm8650-pmu-ppi-partition-v1-2-dd3ba17b3eea@linaro.org>
 <ba546075-cfc0-4b17-9129-f99054e2e1ae@oss.qualcomm.com>
 <6aa71142-3b1d-476f-9c78-1207fbbed3f5@linaro.org>
 <bbbd36a1-d67c-404c-b749-eefcf493ed7f@oss.qualcomm.com>
 <a2fbae9e-d1cc-44a7-86b7-9e15aa0490b1@linaro.org>
 <21f7eb11-bb0d-4e4d-a4b1-780c03fb86d9@oss.qualcomm.com>
 <36ba4696-1af2-49e7-90bf-f6f559b76fb7@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <36ba4696-1af2-49e7-90bf-f6f559b76fb7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: o1J25j-_bY0k8OKoNQxW4moKS4WdUYgs
X-Proofpoint-ORIG-GUID: o1J25j-_bY0k8OKoNQxW4moKS4WdUYgs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_05,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=981 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502110086

On 11.02.2025 9:02 AM, neil.armstrong@linaro.org wrote:
> On 10/02/2025 19:29, Konrad Dybcio wrote:
>> On 10.02.2025 4:30 PM, neil.armstrong@linaro.org wrote:
>>> On 10/02/2025 16:23, Konrad Dybcio wrote:
>>>> On 9.02.2025 3:44 PM, Neil Armstrong wrote:
>>>>> On 07/02/2025 21:30, Konrad Dybcio wrote:
>>>>>> On 7.02.2025 11:31 AM, Neil Armstrong wrote:
>>>>>>> The PMUs shares the same per-cpu (PPI) interrupt, so declare the proper
>>>>>>> interrupt partition maps and use the 4th interrupt cell to pass the
>>>>>>> partition phandle for each ARM PMU node.
>>>>>>>
>>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>> ---
>>>>>>
>>>>>>> @@ -5309,6 +5309,20 @@ intc: interrupt-controller@17100000 {
>>>>>>>                 #size-cells = <2>;
>>>>>>>                 ranges;
>>>>>>>     +            ppi-partitions {
>>>>>>> +                ppi_cluster0: interrupt-partition-0 {
>>>>>>> +                    affinity = <&cpu0 &cpu1>;
>>>>>>> +                };
>>>>>>> +
>>>>>>> +                ppi_cluster1: interrupt-partition-1 {
>>>>>>> +                    affinity = <&cpu2 &cpu3 &cpu4 &cpu5 &cpu6>;
>>>>>>> +                };
>>>>>>> +
>>>>>>> +                ppi_cluster2: interrupt-partition-2 {
>>>>>>> +                    affinity = <&cpu7>;
>>>>>>> +                };
>>>>>>
>>>>>> I'm not sure this is accurate.
>>>>>>
>>>>>> I *think* it's cores 0-1 and 2-7, but I can't find a concrete answer
>>>>>
>>>>> Core 7 is a Cortex-X4, and has a dedicated PMU node, look at the cpu compatibles.
>>>>
>>>> Look at what these compatibles do in code. Nothing special for the X.
>>>
>>> So you suggest to revert Rob's change ?
>>>
>>> https://lore.kernel.org/all/20240417204247.3216703-1-robh@kernel.org/
>>>
>>> So what I understood is that yes the code is the same, but the perf
>>> attributes are not necessarily the same between heterogeneous cores,
>>> so each instance here would load the attributes for each core type
>>> correctly instead of only using the ones from the first core
>>>
>>> Again, other SoCs uses this same scheme so I wonder what's the issue here ?
>>
>> So I'm a little confused here. Is this partitioning scheme only describing
>> a set of same-kind cores to Linux so that the PMU interrupts only arrive at
>> one PMU device? Or does it reflect some actual physical topology of clusters
>> and how they're connected to the GIC?
>>
>> If the former, I have no issues with this version of the patch.
> 
> The former, we simply partition the PPI interrupt for each device node, it
> has obviously something to do with the topology, but the goal is not to describe
> the topology.

Ok, good

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

