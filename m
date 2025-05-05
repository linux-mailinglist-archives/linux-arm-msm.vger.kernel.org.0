Return-Path: <linux-arm-msm+bounces-56796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44072AA94B9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 15:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DD4D175A71
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 13:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15505255F24;
	Mon,  5 May 2025 13:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J5pZasxA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7EF14AD0D;
	Mon,  5 May 2025 13:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746452593; cv=none; b=sJ+/NjShgYbXFidsjXLtnJlmlK0b0/DRWKW4N3c0Ar1tN8luhmD82tAQkxYzamnwbx1PCI5JQTn+vdlMzL9vCmVvhIYfQFPa5tmpUncNnqjRPydrBrIXAfdiOxQ2YratTp/+NTZDNMF6fkBEUPc7MXH2xfQOEP8W43hW1iYeJBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746452593; c=relaxed/simple;
	bh=j9EtIF3DNCp8ZxnjSRW19YefWedN6WL0LXivajHm2dM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=L36OP12iZ7Bz23Rh+ciPNPqrrnmaGH6rLJclaAl01v3trxSHxHPSgDJxwJIedJIBR/TYmC4FbbemONZIK2NH9AKQ0/sfg3VRJGjiuSOuJisl7jUruyH1DxuFrbKWYW6jKMVPjvw/xYGCHLBUfZN/k3UzEZOxSpWt2RLIMxAWnlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J5pZasxA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545CoqqP003653;
	Mon, 5 May 2025 13:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bf/zDnpOG+HFmTINg8VWD7poiFb3F++3waIwiqLyUl4=; b=J5pZasxAz4a3Y9Jb
	/2TMSOAtV+bLWMbxS+jLEiimH3pMCndJlkkiY9g4ZG4RYfVLr9Vhsw32T3IMUrMj
	tQaeRmSlIM6xYTwPQXq3ahmAQbHBRGKXo+yLurRj/uma4MoUZj0A0/ZRUiY9EqSd
	8Zt5T8VcR6Eq6Pg8woCDxO/jltG6oorjYo1uysWRDBWaG2849QxZqdfZn9LRyr48
	B47i11Pcr6Cz786Eh0Rv9QHijcIs9DqAgtRrKe930TDX4A8muXg4RBqr8xq/EYrA
	0kh8H74PYg/bS+rTwumfRDswepwpoYVnGIHKpDUYinXx26tPt3TTFj9kmo5eAaFl
	yC11ag==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rv984-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 13:43:07 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 545Dh60u001189
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 May 2025 13:43:06 GMT
Received: from [10.216.4.22] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 5 May 2025
 06:43:00 -0700
Message-ID: <d96eb6b7-5b48-446c-8b33-ba282d896e85@quicinc.com>
Date: Mon, 5 May 2025 19:12:57 +0530
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
Content-Language: en-US
From: Praveen Talari <quic_ptalari@quicinc.com>
In-Reply-To: <1de5c0b7-7761-4d0c-bced-7e26150e995f@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NPGNapmLDEWlOg6YzH2mEgvgiHkt266l
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=6818c06b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=5_evsBJ8IHIMuaj2uzsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: NPGNapmLDEWlOg6YzH2mEgvgiHkt266l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEzMiBTYWx0ZWRfX5xOpg0V5xhIZ
 Rv4fHfVpJAYQObP57jO7jAWk4OyCVOVrqGvpqt8oopBQwGTGftHjX5tpSFsjYnOby8iR/3eG1Jc
 gd01XuLu6lcIrvfgrr75uV8hAXYMt1uLdNBE/IgN9bRqox2mC8ylrXflwmzjQhFViV7Cf1dJllo
 CFkz1g/hqfGytJDe4kFCW5NNESO890WyiAmfkVe9j1UeVDycjc3T7m6SSsBYYgJ1SOuu1fRJ+mS
 ZOMkoXCJ2BYmmbgkPpNtpMmAa4vCV9KO0XEjTFNZkdfwXs2r1cl9UnIsKBbV8Y+m1e5mAFbXg0H
 lv17WjBdjlOWmxToHmPh3SFQAmkCXloy2B/4pgIh3CUB0CWkRJeQUkdj9kJfL3luv9DadKfeagv
 2NeEtJ8xLGEaDENy/gJd17KvfiLxFp7NH8YlWoBJWNSrP0Hq32U/titRnxWVnyHa/8pMrhp5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=831
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050132

Hi Krzysztof

On 5/5/2025 3:29 PM, Krzysztof Kozlowski wrote:
> On 05/05/2025 08:51, Praveen Talari wrote:
>>>>>> +    serial@990000 {
>>>>>> +        compatible = "qcom,sa8255p-geni-uart";
>>>>>> +        reg = <0x990000 0x4000>;
>>>>>> +        interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
>>>>> Why isn't here wakeup interrupt? Commit msg also does not help me to
>>>>> understand why number of interrupts varies.
>>>> Currently we are not using wake-irq because it is optional for our current
>>>> implementation.
>>> Great explanation. I asked why is it optional, answer because it is
>>> optional.
>> sorry.
>>> What does it mean optional? This is part of the SoC, so how given one,
>>> fixed SoC can have it routed or not routed in the same time?
>> the serial driver doesn't enter runtime suspend mode until the port is
>> closed.
>>
>> therefore, there is no need for a wake IRQ when the driver is in an
>> active state
> You described current Linux driver, so if we change Linux driver or we
> try for example FreeBSD, then bindings are different?

Currently, the driver includes code to register the device's wakeup 
capability

but it lacks the necessary handler code for wakeup IRQ. According to the 
serial driver,

the wake IRQ is meant to wake up the device but the device remains 
active because

the serial driver does not enter runtime suspend mode until the port 
closed.

So it is better to exclude the wake IRQ until the appropriate code is added.

>
> Again, explain how SoC can have this interrupt not routed.
>
> Best regards,
> Krzysztof

