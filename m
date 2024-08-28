Return-Path: <linux-arm-msm+bounces-29756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AB4962449
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 12:07:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42EF9B21D5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 10:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C3F16078B;
	Wed, 28 Aug 2024 10:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JunY7zgw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF78A158DC2;
	Wed, 28 Aug 2024 10:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724839613; cv=none; b=N1fGnyD82x4G3AmWq3ULbWzottCwixKQRNmTZy/XKFOOhp/P0iBJNVBm7ClHfncLrLIH1ksE1zpaPbD8s4jVwvNCJGcfy+VNN8Ij4YH+YHIiYhjWh0K387D/kiAMkRr7hK9fsuCH1fyJNQpC/UI2RbSniilPvDyu357ltyGI0OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724839613; c=relaxed/simple;
	bh=FKGbrxqJSRa4U0/BHk4YGXG5im9Iz1hjXpIRWRfZKEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mKTtzcT3xg6DSWJN6G8CGctWssu+pQZqW4HkPD3Uij6AFd/vZiaYLqeOMnWezUjwWuAMtV7aYg4UbdKqlJcaZknaaD6SQWCZH1T5rOh5SsV8Y5YseJ4SPuC8MnveYY46omIFnnESjYUfoD1+1JFMMTqZQb1LLgZgzjrndSIPySE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JunY7zgw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SA5Qp5026192;
	Wed, 28 Aug 2024 10:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EwycJpyb+jhaoS/+kJ3yX61GWjWCUDaA9mWmk5KUAAw=; b=JunY7zgwgChRjrKl
	gBNMFyB13ShnH/qzQgmDIba59qgsue4+6uEJKLU5OhNzOhammsirrVPXM+wDqIHs
	7HdSCbxipVcR1jTa6XBnNlO749gROQQSyaHeVROm/CrTjWWhie8a31nucBVJtBv9
	fDIVcDAVJ6vFbA1LDHxEsZScekC5vw+Eo6ZhnOBJh0qgYJ+VJjW5nP81cwZLZ6YG
	MR74R0R0eRxjp5iMVdfB08abg+8mnXefpUIsGFuGPS87yyn7M8nJXAj5iyRUOr6I
	nZLNeqMHHIz451HUUYl5InjBm4YhAc2v9KfjN5M3Y4UAiu22x9bXMunoeAAi5fm/
	LgO6uA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puthe1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 10:06:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47SA6iXA008184
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 10:06:44 GMT
Received: from [10.239.132.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 Aug
 2024 03:06:39 -0700
Message-ID: <b9aee62c-3c8c-4a8f-8559-41fabced7fbe@quicinc.com>
Date: Wed, 28 Aug 2024 18:06:36 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: add base QCS615 RIDE dts
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <kernel@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com>
 <20240828-add_initial_support_for_qcs615-v1-6-5599869ea10f@quicinc.com>
 <22qkvfravm6sxiq3xfavahg2u6b2pwlyzqbqvd55zym5zef3gi@m4bsqkdvggty>
 <17d0017e-b55d-4b32-9fd3-1a1a84e5ebf9@quicinc.com>
 <0ec92d59-0648-40ed-a522-307152b5c37d@kernel.org>
 <148451f2-6b1b-4616-b703-fd52e7afa2be@quicinc.com>
 <90c98fee-770c-4b83-9e05-6f04866094c2@kernel.org>
From: Lijuan Gao <quic_lijuang@quicinc.com>
In-Reply-To: <90c98fee-770c-4b83-9e05-6f04866094c2@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GskXdbBZ_q4xX6T_X4aS1OuOGb7snX_K
X-Proofpoint-ORIG-GUID: GskXdbBZ_q4xX6T_X4aS1OuOGb7snX_K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_03,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=640 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280072



在 8/28/2024 5:34 PM, Krzysztof Kozlowski 写道:
> On 28/08/2024 11:31, Lijuan Gao wrote:
>>>>>> +/ {
>>>>>> +	model = "Qualcomm Technologies, Inc. QCS615 Ride";
>>>>>> +	compatible = "qcom,qcs615-ride", "qcom,qcs615";
>>>>>> +
>>>>>> +	chosen {
>>>>>> +		bootargs = "console=hvc0";
>>>>>
>>>>> Noooo, last time I agreed on this, you told me later it is different.
>>>>>
>>>> In the early stages, enabling HVC is to more easily verify clock and
>>>> PMIC related functions, as it’s difficult to debug without the console
>>>> log. After the clock and PMIC are ready, we will enable the UART console.
>>>
>>> Working serial is supposed to be part of the early submission.
>>>
>> Okay, I will remove it in the next patch.
> 
> Can you post next version with proper serial device?
Well noted, will update in the next version.
> 
> Best regards,
> Krzysztof
> 

-- 
Thx and BRs
Lijuan Gao

