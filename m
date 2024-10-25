Return-Path: <linux-arm-msm+bounces-35927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D470D9B0BA8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 19:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4670C285C87
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 17:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10AC2161F3;
	Fri, 25 Oct 2024 17:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dYJHjh1q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA8B2161EF
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 17:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729877220; cv=none; b=N0AZFd+U3swzgBpSPg2UURBtLXaOemBZpCdkK8p8Ms68JaETNRGnmz9DQMMHtf9e7Is+ql4EHaCoESyn1uQ7o1G4F2SWHXg0LzuNHvLTBAQ2pxXv8hMwhlVzRVuqqtcWvYc3s2T/R4i9OZ9TiWKwPVYhz/NDPjK0Nt5sBem2nEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729877220; c=relaxed/simple;
	bh=ux4fyoryvlDRZZOu0dZOEtLyAosOVYVFlVj+nrSm3YU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XtBsfQuYRQoaj863u6goksQNecZhn+S/Di643F29dAx8iSF+K41k+ApoRYZBIC1htKGHKt1NeLBO1c73aPRStmz0BeHfrXs26CP+ugeJ2NTVH23xkMRnBLdHcJLjAStgUhU+WE4acuP7zPI2/+YiR7mAo1SEQaxQaZ96YNpiNlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYJHjh1q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PAnrpj025989
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 17:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kYOS61s+4Ua8E53ppWv27vHnk8+CmbTTSSY3hk6zX/4=; b=dYJHjh1qawP3ZGml
	XD5dtFJJV3GZTAvB5MlM9R7F9pRBNvFSv2kqxvk9cdfVTaeLzeGvhd/9CD4Bb7Xl
	ghQVBVnNMvtLaGhcDd5nM1WSBQBaYpZ/m5SYqhlSYcpC3tp1Fx8E1EuZcmZvth4a
	092R/w+6CbnIWcor3PXmx40cQMgcAbCqEyxaP4VMWvQEzDXtBcu3VI1G472VvGbc
	LrmDTSVsLh97nj2JSmQBRI2YTs1snAx9Rab5B22tJXnZC0pGdZSGZv3qQ4CwPJJH
	p6RSSx0A5YRYGYa7MJJHdRKvANv7VyQVvJAXUQaRJgz//O9+6AH9B/2FltJlJOp6
	dfh+sA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3wt030-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 17:26:57 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6cbf5a3192aso4653286d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 10:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729877216; x=1730482016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kYOS61s+4Ua8E53ppWv27vHnk8+CmbTTSSY3hk6zX/4=;
        b=u1lPT7wIwF/Z60UdLP7YzTkH+F95PJv6ZCrw+/HTfnesdBCABV9Bo8XGFeD0odinXP
         exeVJhq3wv/NUcn+vtSHqT4RobL/dyZ96Mg/bWNo9yF3E5GM5wzG72WlDfKzReHfCgHF
         C2B14DVtK8XaGTaYUweMV852pQxKtA/GbV4lvWOiFuDtQFBY2BnYZc9o5JOWLe3wwVaW
         EQ7iEG0az4AIIEIAqSLHeohdzzPO6WIfACQ1poR+861A/hUHYTGxjXxI9yLm3zMXcrZq
         tyOzaDGSr8atpKXZeE35zMWuWvp3daJCBM2fOFnfh88zBOt01/P08ZoCvLV7XvKOo/os
         DlUA==
X-Gm-Message-State: AOJu0Yyha130VEpV5LLTOF9uGOCsQNsFsyjgSqqYyLlJ+uqd22ai/omj
	Dq0wGTZvdZsK7fDg9k+qg2IhKe1ixn3mWO1/Vl8ODAeK0IqcdeykguFero247tZAMBcbNBHNRui
	6IzKGmHEHDNEAhzDOTzEjGk2A0rbRnNkundJ70THr1Xyv1fn2oC+bKXaCaKEVlTWb
X-Received: by 2002:ad4:5c6c:0:b0:6cc:12d3:b589 with SMTP id 6a1803df08f44-6d1856f2258mr1385866d6.4.1729877216485;
        Fri, 25 Oct 2024 10:26:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdtUaERmfWAnhiQDDdjVtcZz5sT4YcsSGXWw5y/MThZI4linWvUqyTaFyN8ev94EQBc+1Q8w==
X-Received: by 2002:ad4:5c6c:0:b0:6cc:12d3:b589 with SMTP id 6a1803df08f44-6d1856f2258mr1385596d6.4.1729877216131;
        Fri, 25 Oct 2024 10:26:56 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b30f58991sm90413066b.159.2024.10.25.10.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 10:26:55 -0700 (PDT)
Message-ID: <f02537ef-81e1-441c-bc0a-9d4eb5786361@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 19:26:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: qcs615: add the APPS SMMU node
To: Qingqing Zhou <quic_qqzhou@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robimarko@gmail.com, will@kernel.org,
        robin.murphy@arm.com, joro@8bytes.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20241015081603.30643-1-quic_qqzhou@quicinc.com>
 <20241015081603.30643-5-quic_qqzhou@quicinc.com>
 <ac5081ce-e2e4-4201-bd7c-eb4ec2cf7e2d@oss.qualcomm.com>
 <ed4209a8-fb37-4354-a717-60dc1b5c29ab@quicinc.com>
 <bc1ab306-903a-4111-a428-8f28d8324207@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bc1ab306-903a-4111-a428-8f28d8324207@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: h7D5UCj9mqiAity3sJ4nA0xQG6KqQ4ny
X-Proofpoint-ORIG-GUID: h7D5UCj9mqiAity3sJ4nA0xQG6KqQ4ny
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250133

On 23.10.2024 7:48 AM, Qingqing Zhou wrote:
> 
> 
> 在 10/18/2024 2:20 PM, Qingqing Zhou 写道:
>>
>>
>> 在 10/18/2024 4:05 AM, Konrad Dybcio 写道:
>>> On 15.10.2024 10:16 AM, Qingqing Zhou wrote:
>>>> Add the APPS SMMU node for QCS615 platform. Add the dma-ranges
>>>> to limit DMA address range to 36bit width to align with system
>>>> architecture.
>>>>
>>>> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 74 ++++++++++++++++++++++++++++
>>>>  1 file changed, 74 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>> index 027c5125f36b..fcba83fca7cf 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>> @@ -379,6 +379,7 @@
>>>>  	soc: soc@0 {
>>>>  		compatible = "simple-bus";
>>>>  		ranges = <0 0 0 0 0x10 0>;
>>>> +		dma-ranges = <0 0 0 0 0x10 0>;
>>>>  		#address-cells = <2>;
>>>>  		#size-cells = <2>;
>>>>  
>>>> @@ -524,6 +525,79 @@
>>>>  			reg = <0x0 0x0c3f0000 0x0 0x400>;
>>>>  		};
>>>>  
>>>> +		apps_smmu: iommu@15000000 {
>>>> +			compatible = "qcom,qcs615-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>>>> +			reg = <0x0 0x15000000 0x0 0x80000>;
>>>> +			#iommu-cells = <2>;
>>>> +			#global-interrupts = <1>;
>>>> +
>>>> +			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
>>>> +					<GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
>>>> +					<GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
>>>
>>> The list seems perfectly sorted, which is suspicious.. if we set
>>> i = n - #global-interrupts, interrupt[i] signifies an error in the i-th
>>> context bank. If the order is wrong, we'll get bogus reports
>> Thanks for the review, the list refers to Qualcomm Interrupts design spec, checking this platform again, the list is right, first line is global interrupt and the others are context interrupts with right order.
> Hi Konrad,
> Hope above comments explain your question. If no more questions from you, I will post the next version. Thanks.

Sorry, forgot to reply.

I was able to confirm this is just a happy coincidence with the numbers.

Konrad

