Return-Path: <linux-arm-msm+bounces-52824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EA7A75699
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 15:27:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9059B18900D2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 14:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397A71BFE00;
	Sat, 29 Mar 2025 14:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i0xkoFEi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A06339A1;
	Sat, 29 Mar 2025 14:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743258460; cv=none; b=Z96na4MKS+g+DtkNPKx9iXun+kr49qIt+vZ+ReZ7AnkZ8Yllh7+Lqug5ahMkny2wWvOJ4j14NDFso45V8LjuZzYDetFy26aYI0Xm7vseV1u6QHI4miqEHrc94xoY1X0wzvtQ6xIMKILElZ2wtFwTkEv+EiyouaMMONE8Qk+TPpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743258460; c=relaxed/simple;
	bh=TPng5g4WZM1ufzXcuBNCuTBv0uch6Jz3rOrVAhDQTNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=r/12HcnoIpmwHqmvWuEhLH0nMUkS9XsNwa9Hsmg1V4QtAK+luO9uelIwxqAHKzernXq3yl0wp7XfW5DnzRrtycpC/ou0gFxW+nsZ66c+khQW0o5s9eRWTSe8JHVZqgIbRRR8zaBgeqZU9NXMAXVeGChZILx8axlrk1j3WthIUa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i0xkoFEi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52T7idao003693;
	Sat, 29 Mar 2025 14:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uq4Et5owwwGRm0Vo/rx1V2Z7yc/0t/O17YBf+POMpnA=; b=i0xkoFEiSm8RTLNS
	0bVkPnUWuYgPPZXP4lFmVg8fNeLMXISriAX5cEor61W1WWLOmJZJ2louub5mGfDK
	OuFLhKDOLqwoVN7KH1we1VDtuSVAcyqNf2JUe+0BywEENi80A9cPPqkiqIz1fvoG
	4v4WC0h8pVzo48R8Z+7zFk8oA1XCJPMqGaHhDAGXR3YNOeLVmREM8536xtSmZox6
	khk6l61x6+baVILQVi5CAhUxs8uTVACNd7ZDIYhLcrT2wZ2rGcQjgjQNXLQg6Ld1
	MxteQsvYBx3xD8gYgWf6MXOe1PjkW7ppmjprBNsGYCNR6HFJc43DhK+ZWuz9wCtW
	O9b6Sw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p935rvbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Mar 2025 14:27:30 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52TERTAY024929
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Mar 2025 14:27:29 GMT
Received: from [10.216.2.59] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 29 Mar
 2025 07:27:25 -0700
Message-ID: <3d6738cf-fc4c-4bc6-b986-9a647867e76f@quicinc.com>
Date: Sat, 29 Mar 2025 19:57:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Markus Elfring <Markus.Elfring@web.de>, <linux-i3c@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        LKML
	<linux-kernel@vger.kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
References: <20250326141641.3471906-3-quic_msavaliy@quicinc.com>
 <66d344b9-5cc6-4060-86ff-8100a00de477@web.de>
 <4161e6de-b16f-4371-be41-cc12adb3e9b8@quicinc.com>
 <e32324c8-1888-451b-8621-0e468ca61fd9@web.de>
 <a96511dc-5ba1-4302-acb0-f3b49bf8990c@quicinc.com>
 <20250329104812225f9ee5@mail.local>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250329104812225f9ee5@mail.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LyoDU4ZznexULVx21UNS5ehTd9SHm9UF
X-Authority-Analysis: v=2.4 cv=KOFaDEFo c=1 sm=1 tr=0 ts=67e80352 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=X0vEURnw2XWclHXbzQYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: LyoDU4ZznexULVx21UNS5ehTd9SHm9UF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-29_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503290104



On 3/29/2025 4:18 PM, Alexandre Belloni wrote:
> On 29/03/2025 14:38:14+0530, Mukesh Kumar Savaliya wrote:
>> Hi Markus,
>>
>> On 3/29/2025 12:34 AM, Markus Elfring wrote:
>>>>> Under which circumstances would you become interested to apply a statement
>>>>> like “guard(spinlock_irqsave)(&gi3c->irq_lock);”?
>>>> Didn't get, hence a question.  Do you suggest to use DEFINE_LOCK_GUARD_1 instead of existing method ?
>>> I propose to pick further opportunities up for benefits from scope-based resource management.
>>>
>> Sorry, still not clear to me what should i add/change ? please share me some
>> example.
> 
> Don't change anything, Markus is wasting your time.
Clear to me. Thanks a lot !
> 


