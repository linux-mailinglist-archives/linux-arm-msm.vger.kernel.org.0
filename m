Return-Path: <linux-arm-msm+bounces-58561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E369ABCAB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 00:05:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 090037A44E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 22:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4BAA21C185;
	Mon, 19 May 2025 22:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Zx91c72B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E296A21147B;
	Mon, 19 May 2025 22:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747692303; cv=none; b=gw7qCFY+W6dM/eQUQNOKJpt9a5Q+eeS7+w/cv7HFJq0+YzzxnanLFsXFC48oUD7+nd8XgmTGwYWQtSv3obIxOJ+aBVZX2VoeDftb7S1nyCyo9yyLWFqRj2nOi08Iichxchy2+ALtUQGFLszLYgx23vXeB8CXu9RMHlECB8+v8/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747692303; c=relaxed/simple;
	bh=CM8ZHMND7YXvqzO8+Kz4TpDUNwHHZU01RXS5hzcvDLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=a/k9PkGd44CHYMDAfqfkYPG1+19mxjludD+/sbbqPDvAT0o36oxHTHAIWVsZ44L15qSuRT+9viV2cQqHZ3jmTUB7pCKrNXA++/Ejan1GrAX3X7Q3Cc5a0SBybXhVdqqif3giSpiHYdKlZ6J8Hw0j22U79E4lIaisrLS6eFBNqmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Zx91c72B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JHmmtt027166;
	Mon, 19 May 2025 22:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T8g9hmVvqjn8rXNSXykqDJITIJDGdI8Suwi98GQc/zA=; b=Zx91c72BFkw4dnbv
	pjjVQNEwoUp4uvmhh0pAqmcR/IvsJZ2Mi6AfKsTmTW+pYrLSW8S4STQ8I6YO1qMN
	m0wVTJorpC6PJ5OYV5m4hqj19onpE4j2xr+ZOk2VLVqKAFDr/Yu9YzujgiZXYTz8
	bmnydtbKQMK/y1YCC6R2E1qDbbbEyLYEFpeAeq2AC4Xm5uHHZTD22nD+aHoPXVaK
	HrnlF371qSbAabnD2+Re6+rI/tjFbs3adXLdlHRmMsgpUcN0HBFcBTOPuUF2QB4a
	nwXxDDP05qzSsGNflUehxd2wAC42T/0kNwTSS1m7DANlXrkhckexYSxkjQ/GS1FX
	6BwMHw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9wqnm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 22:04:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54JM4YkV014811
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 22:04:34 GMT
Received: from [10.110.43.57] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 19 May
 2025 15:04:33 -0700
Message-ID: <f3727b53-8da3-d4f6-575b-108a8d6898e5@quicinc.com>
Date: Mon, 19 May 2025 15:04:27 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul
	<vkoul@kernel.org>
CC: Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Kishon Vijay Abraham I
	<kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
 <20250409-sm8750_usb_master-v4-6-6ec621c98be6@oss.qualcomm.com>
 <Z/exOF4T+0vNLQwg@vaman> <0517c37d-b1ba-466e-bffd-9f47b0d458d5@quicinc.com>
 <aCRVaNDQP/PdAXPR@vaman> <5183b76b-8043-4309-b25d-e1ae505f929e@quicinc.com>
 <6fa4959c-d733-4d50-904f-caf933e02da9@oss.qualcomm.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <6fa4959c-d733-4d50-904f-caf933e02da9@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7tkQXt10AubyxISGwOFWZdq0ny_YbYf5
X-Proofpoint-ORIG-GUID: 7tkQXt10AubyxISGwOFWZdq0ny_YbYf5
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682baaf3 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=jJrOw3FHAAAA:8
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=WksZTEnvWCXEbMr8NocA:9 a=QEXdDO2ut3YA:10
 a=-FEs8UIgK8oA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDIwNSBTYWx0ZWRfX4Vcchgh/WruK
 V7ZkJSFPodRTjs/iAtlDkF49Z8ENM9Zur72GPcH4aOTTlSSaRnzyDOiHS5u2ZXWWH8JRmXIGkWM
 ZEgCmEEKBHkqm8vHsn9ce/iNhHwwxRho/3tVIz29aSph9km0aEVfVQ3L4C6V9eBAXXLeaSiP3aE
 qnX2/7ZN4n9frNYVvm8aP5J6jVZixiPXsGjgN9HT2Tfj9bAGHHy+NG0mju7X81XgZ5J70ZTAMiR
 Z3RY8ONHh9RnFFgPzukmH2ZXwxKT/mQZQeVfciu8HENPNxD94UEnz2Y+q4l5rf99kgG0ujiy38D
 7eU5UxSLU7UXkgM44okzqJID/bHMPJXZAKvW0R5ZNR8FHfsfPnTyE3b0hq6PRbajL6YKtgn62mr
 oyUZboS50pTuJRFG9RwdImoQvNmT9L9GfZEGE8zOBbHjPsEVJBU/wVs6ldIuw7LR1sxn9MAi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_09,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190205

Hi Konrad,

On 5/17/2025 11:28 AM, Konrad Dybcio wrote:
> On 5/14/25 8:24 PM, Wesley Cheng wrote:
>> Hi Vinod,
>>
>> On 5/14/2025 1:33 AM, Vinod Koul wrote:
>>> On 16-04-25, 15:45, Wesley Cheng wrote:
>>>> Hi Vinod,
>>>>
>>>> On 4/10/2025 4:53 AM, Vinod Koul wrote:
>>>>> On 09-04-25, 10:48, Melody Olvera wrote:
>>>>>
>>>>>> +static int m31eusb2_phy_write_readback(void __iomem *base, u32 offset,
>>>>>> +					const u32 mask, u32 val)
>>>>>> +{
>>>>>> +	u32 write_val;
>>>>>> +	u32 tmp;
>>>>>> +
>>>>>> +	tmp = readl_relaxed(base + offset);
>>>>>> +	tmp &= ~mask;
>>>>>> +	write_val = tmp | val;
>>>>>> +
>>>>>> +	writel_relaxed(write_val, base + offset);
>>>>>> +
>>>>>> +	tmp = readl_relaxed(base + offset);
>>>>>
>>>>> Why are you using _relaxed version here?
>>>>>
>>>>
>>>> No particular reason.  I think someone pointed this out previously, and I
>>>> was open to use the non-relaxed variants, but I assume using the relaxed vs
>>>> non-relaxed apis comes down to preference in this case.
>>>
>>> Nope you cant! There _needs_ to be a specific reasons!
>>> When you are doing read, modify, write, it is very important to know the
>>> right version to use...
>>>
>>
>> I mean, its a write readback, which ensures the bus transaction is complete
>> based on [1], hence why **in this situation** it is up to preference.
>>
>> Otherwise, w/o the readback then we'd need to ensure writes are made
>> depending on the required sequencing (in spots where the sequence is
>> strictly defined), and that can be enforced using barriers.  If you feel
>> like using the non-relaxed variant is preferred let me know.  I can replace
>> it and remove the readback.
> 
> Readback is stronger on arm64, as otherwise the writes may be buffered and
> not observable at the other endpoint even though the instruction has been
> issued, even if a barrier has been issued
> 
> Some resources:
> 
> https://youtu.be/i6DayghhA8Q
> https://lore.kernel.org/linux-arm-msm/20240618153419.GC2354@willie-the-truck/
> https://developer.arm.com/documentation/ddi0487/latest sec B2.6.9
> 
> There's been a real bug observed (pun not intended):
> Commit 2f8cf2c3f3e3 ("clk: qcom: reset: Ensure write completion on reset de/assertion")
> 

Thanks for sharing.  Useful info...The way I interpret it, even between 
relaxed and non-relaxed variants, a readback is always desired.

Thanks
Wesley Cheng

