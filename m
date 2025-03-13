Return-Path: <linux-arm-msm+bounces-51287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 469BFA5F389
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 12:58:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F25C3189DBFD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 11:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89CDA266591;
	Thu, 13 Mar 2025 11:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TLqsh3jt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE90B1FAC4F;
	Thu, 13 Mar 2025 11:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741867076; cv=none; b=mDbNYUJXXHlthvQlBxP77dDqUgoqXnTii9ma8rwQwO/roVQiqsBmmgLzJrn6pg6BxFgQ1j2hji6spOWdgpMiijAt5e9fczqqVLGVanT5YZ0VdkbvNwy5530NbwZ2YKtnJBVd2zu8EIP0nQ4HaosRrxJ0ep2byZc6Z35Fd0EKg6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741867076; c=relaxed/simple;
	bh=VaZGpDHXocsmDGsVUFDMwOt40aVSLOI7VseTZBWQkWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bs7Ycfk74IxySyEhatIns40KQyJM3NcgucSaQ2xP76R7sDKmGPQW64ypAiHHIfhh9DLWE9KAbMVeIj8SwHZzHXOyJ7JFvUuNLxroNZ2S45LEF05Rns4fAcNB//nBBGHbIC0Fbc7CvidF+laknJK54hcYT94OGP+BU2L1Njvh8VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TLqsh3jt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DAj7Au031333;
	Thu, 13 Mar 2025 11:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7tD6dwPDuG5atjXLy17A7KJWot+nURvVIM+MNsUqmK0=; b=TLqsh3jtGtvFmzTV
	3yW0dUMVrAtCaMzmLYzXy0PO9imv1s4CfNX7bwxygLAQXmDJSifGgbbRRSFcVu3l
	P8Ih87r7tHu+rX2nDFFrRbeXsMTB6UaQAnZKP54C8Sb17wE2+JYKcD6OGntOYpBM
	i9rUcS4yC3pAqQpqCkBYN8dVIi5nChmjDcHg00YV0OWBzHUeCAaCe5gjfU0DOt2K
	yKGlMb7i5E2lUJVnxj7jSURGZ+83uOSpmIjoitu7e04+cvKdJFq3WvYxtEDl7MEr
	4JO+b7lAggitLw/CpAqSaJKxDQ+MsAY9tJeXtBPG4AufdmS7Oa0LKIyfJRCopPok
	jkfkJA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2qnrpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 11:57:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52DBvmiF028615
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 11:57:48 GMT
Received: from [10.217.216.178] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Mar
 2025 04:57:44 -0700
Message-ID: <d64c0776-0b12-42d3-aed3-4e6a13487f51@quicinc.com>
Date: Thu, 13 Mar 2025 17:27:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
To: Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Jagadeesh Kona
	<quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
 <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
 <3210a484-b9c3-4399-bee1-9f5bbc90034c@linaro.org>
 <CAA8EJprP9Z181VDCT=xfyrBipzgiB0tfb8M_XZ4H=yOrvEnB0w@mail.gmail.com>
 <f41061a2-cf45-4588-8df7-22270c936ee2@quicinc.com>
 <D8EZ47Z557OX.37FDVYA5AHET0@fairphone.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <D8EZ47Z557OX.37FDVYA5AHET0@fairphone.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KIMEmnqJHATUj4x8LX3ybJ73x5S5LXyH
X-Proofpoint-GUID: KIMEmnqJHATUj4x8LX3ybJ73x5S5LXyH
X-Authority-Analysis: v=2.4 cv=TIhFS0la c=1 sm=1 tr=0 ts=67d2c83d cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EzFUx7Xx5Uxcnu-jchQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=595 mlxscore=0 clxscore=1011 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130094



On 3/13/2025 1:22 PM, Luca Weiss wrote:
> Hi Taniya,
> 
> On Thu Mar 13, 2025 at 5:39 AM CET, Taniya Das wrote:
>>
>>
>> On 3/4/2025 2:10 PM, Dmitry Baryshkov wrote:
>>> On Tue, 4 Mar 2025 at 09:37, Vladimir Zapolskiy
>>> <vladimir.zapolskiy@linaro.org> wrote:
>>>>
>>>> On 3/4/25 01:53, Dmitry Baryshkov wrote:
>>>>> On Tue, Mar 04, 2025 at 12:55:21AM +0200, Vladimir Zapolskiy wrote:
>>>>>> SM8550 Camera Clock Controller shall enable both MXC and MMCX power
>>>>>> domains.
>>>>>
>>>>> Are those really required to access the registers of the cammcc? Or is
>>>>> one of those (MXC?) required to setup PLLs? Also, is this applicable
>>>>> only to sm8550 or to other similar clock controllers?
>>>>
>>>> Due to the described problem I experience a fatal CPU stall on SM8550-QRD,
>>>> not on any SM8450 or SM8650 powered board for instance, however it does
>>>> not exclude an option that the problem has to be fixed for other clock
>>>> controllers, but it's Qualcomm to confirm any other touched platforms,
>>>
>>> Please work with Taniya to identify used power domains.
>>>
>>
>> CAMCC requires both MMCX and MXC to be functional.
> 
> Could you check whether any clock controllers on SM6350/SM7225 (Bitra)
> need multiple power domains, or in general which clock controller uses
> which power domain.
> 
> That SoC has camcc, dispcc, gcc, gpucc, npucc and videocc.
> 
> That'd be highly appreciated since I've been hitting weird issues there
> that could be explained by some missing power domains.
> 

Hi Luca,

The targets you mentioned does not have any have multiple rail
dependency, but could you share the weird issues with respect to clock
controller I can take a look.

> Regards
> Luca
> 
>>
>>>> for instance x1e80100-camcc has it resolved right at the beginning.
>>>>
>>>> To my understanding here 'required-opps' shall also be generalized, so
>>>> the done copy from x1e80100-camcc was improper, and the latter dt-binding
>>>> should be fixed.
>>>
>>> Yes
>>>
>>
>> required-opps is not mandatory for MXC as we ensure that MxC would never
>> hit retention.
>>
>> https://lore.kernel.org/r/20240625-avoid_mxc_retention-v2-1-af9c2f549a5f@quicinc.com
>>
>>
>>>
>>>
> 


