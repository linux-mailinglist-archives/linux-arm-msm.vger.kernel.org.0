Return-Path: <linux-arm-msm+bounces-57001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12796AACCCB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 20:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B4DB3BD57B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 18:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636F32857E9;
	Tue,  6 May 2025 18:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e22rt5Go"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C821A20B806;
	Tue,  6 May 2025 18:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746554728; cv=none; b=KdWisagsQmISlF6PMbY4hwT3tr2omMjyyDOKB9PB/37uaSma59FubKqvonpR57SyW65a2Dk1ipyJacCcxELHaVzWMrhrEylXPwTtqwuJs5/CMfnRP4HYJZly7dwZsYJTDxNd+VVJRV/CC8sEd/mXWAq5SP8FSV7d6TF53H5hUAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746554728; c=relaxed/simple;
	bh=KYreDwvsYgQnUrGxsm7xKU7ld0QQ7QtelPywydDjvjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RPpnEocI7bfIhETCabz408wo3Ss4WUxGHXZKWY3w3WpKOH1oA2EoMm1FZH7Z3F17yIDrpxzwvif/UpXMWzOmHHflBmmDcMp6FQxlMfu+JJWUgnVC5x3UiQYA8nK+LoYIsPLCTl8RYPa5/HXaZT9HVIbGMjcqSOFIoEqnLli4Jxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e22rt5Go; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5468vLfY006739;
	Tue, 6 May 2025 18:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/fTlJ6GhgBLKQq9QQNoj8qPUgIVdcwx5jr6DFrInaU4=; b=e22rt5GoQpaG73xJ
	b8ULcHyseSJLOK0fWccHSwoY4H8Hqq8KWmWielGiermzPtNZ2gEx8N7wjbyaEWR7
	/J2xl7GKmVNLgmQ2QnZAEDxv2SgpWm/HNVzNuINKKsY9oHucK4S6F0FrtXllnuFT
	r3yOk1tIp3mz4G9Ihbuo3hQO4oMRzrCVGl2WqGkFtSICJLsBZZ5Dnv4QvVtnGh24
	gbHoqJBxCGDp4PU7G6xqfTORLv7mxFvMb0cK3TyS/9tWru0R4OM4ccEDYl/nzTev
	ApdnSDI57JUUwu7yNNhRDk2253Ksy1UMCx2pE5Acbtaxt1nRWfBwddctdEEaVdZJ
	nKzQKg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5wg34bm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 18:05:22 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 546I5LaQ029814
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 18:05:21 GMT
Received: from [10.216.25.246] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 6 May 2025
 11:05:15 -0700
Message-ID: <c839726f-6625-45b5-a632-75bd2b8dd7bb@quicinc.com>
Date: Tue, 6 May 2025 23:35:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] dt-bindings: serial: describe SA8255p
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <psodagud@quicinc.com>, <djaggi@quicinc.com>,
        <quic_msavaliy@quicinc.com>, <quic_vtanuku@quicinc.com>,
        <quic_arandive@quicinc.com>, <quic_mnaresh@quicinc.com>,
        <quic_shazhuss@quicinc.com>, Nikunj Kela
	<quic_nkela@quicinc.com>
References: <20250502171417.28856-1-quic_ptalari@quicinc.com>
 <20250502171417.28856-2-quic_ptalari@quicinc.com>
 <20250504-hilarious-ultra-grebe-d67e7d@kuoka>
 <6f97510c-eb6c-4f3b-b219-aa8d895b060b@quicinc.com>
 <20250505-ostrich-of-impossible-conversion-a0f8ac@kuoka>
 <4ebe065e-9686-4e35-bb00-a9e816fb8926@quicinc.com>
 <1de5c0b7-7761-4d0c-bced-7e26150e995f@kernel.org>
 <d96eb6b7-5b48-446c-8b33-ba282d896e85@quicinc.com>
 <8ed44a58-eed3-4be6-9c63-7c6c172a6b7f@kernel.org>
Content-Language: en-US
From: Praveen Talari <quic_ptalari@quicinc.com>
In-Reply-To: <8ed44a58-eed3-4be6-9c63-7c6c172a6b7f@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: S5V4NV0NIo3KjqU8_WNn3xvAewhtPYbR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDE3MCBTYWx0ZWRfX6Aq98HQ9JfyS
 IHO75zfsAjsjViTF7a5BKZ5/WKCB4vPxMuX02+qcBKndaXfeR3RcOXiE1leeaVTDR991f9o4TZD
 cSPpKH9B9niSQ8fYAerH2Oj/6xiiwNyOB2h5WPz1IrCPJrwyoDyNDhbbKVqA41hDmUUEFdvxktk
 Jc53gG4V6hj4rUea2IOUXh62Mm4x/BjJVVm4hPphqDtEM0Idoapmbte+x3q+ncj+RlSL9Ga+p6O
 XvwuiHpsKZnRCFRG/Du1Xw0NOIS3p1kgCpWoKfBk3ifrGHqNSRQVcxXNMxYiSO1sFdKywulCQKe
 miiCbFG0w6X3r6O6aykXIPf6ppXNHtNm9PuhPVb2i1DHFYUs+zJDrMwnEAemqaMG+1O3O7GR/xB
 9ZquQ5NA6zU93xxKfexPec5O9uhfMhJKcsh8rNyjyPeDPfIYtL11E0yxMxREH6rsA20LhTTE
X-Authority-Analysis: v=2.4 cv=dPemmPZb c=1 sm=1 tr=0 ts=681a4f62 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=7ft5doZtLqEtjDXVSFoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: S5V4NV0NIo3KjqU8_WNn3xvAewhtPYbR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_08,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 mlxlogscore=794 priorityscore=1501 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060170


On 5/6/2025 11:45 AM, Krzysztof Kozlowski wrote:
> On 05/05/2025 15:42, Praveen Talari wrote:
>> Hi Krzysztof
>>
>> On 5/5/2025 3:29 PM, Krzysztof Kozlowski wrote:
>>> On 05/05/2025 08:51, Praveen Talari wrote:
>>>>>>>> +    serial@990000 {
>>>>>>>> +        compatible = "qcom,sa8255p-geni-uart";
>>>>>>>> +        reg = <0x990000 0x4000>;
>>>>>>>> +        interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
>>>>>>> Why isn't here wakeup interrupt? Commit msg also does not help me to
>>>>>>> understand why number of interrupts varies.
>>>>>> Currently we are not using wake-irq because it is optional for our current
>>>>>> implementation.
>>>>> Great explanation. I asked why is it optional, answer because it is
>>>>> optional.
>>>> sorry.
>>>>> What does it mean optional? This is part of the SoC, so how given one,
>>>>> fixed SoC can have it routed or not routed in the same time?
>>>> the serial driver doesn't enter runtime suspend mode until the port is
>>>> closed.
>>>>
>>>> therefore, there is no need for a wake IRQ when the driver is in an
>>>> active state
>>> You described current Linux driver, so if we change Linux driver or we
>>> try for example FreeBSD, then bindings are different?
>> Currently, the driver includes code to register the device's wakeup
>> capability
>>
>> but it lacks the necessary handler code for wakeup IRQ. According to the
>> serial driver,
>>
>> the wake IRQ is meant to wake up the device but the device remains
>> active because
>>
>> the serial driver does not enter runtime suspend mode until the port
>> closed.
>>
>> So it is better to exclude the wake IRQ until the appropriate code is added.
> But my driver on FreeBSD handles the wake IRQ, why you cannot add the
> IRQ for it?

Will update in next patch set.

Thanks,

Praveen Talari

>
> Best regards,
> Krzysztof

