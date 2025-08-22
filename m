Return-Path: <linux-arm-msm+bounces-70291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6474FB312EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 772835C5165
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A01C32C21E8;
	Fri, 22 Aug 2025 09:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JarX3u1N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D665129E10F;
	Fri, 22 Aug 2025 09:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854626; cv=none; b=L9/t8IzuwCKD++pRlR7VAS/Vr3ODFG7xvigz1xVkOURG+Dw1n49l378tPi7Rs5bBbuWfMw0QwswO6NZ3jVDBC4KxlGFgWc00QNDgvJqss6UbRk0gI+l0+7z4u1KLWvQJ5SgeJKqoGQRKn5oLKA2bRskGKg5bYyJMrgOrGeNspBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854626; c=relaxed/simple;
	bh=kYXpNa0/O5F2E4mtT7HmzydM7FRm2oH//LuQw09Ui4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hiUeXyxy4OXWnouD0v6X5gx0kuy88946WQQU4F3bFUw5CdMKXjIvPlJOevWC4YQH+QG8tNk3yv9som1OyGDNdc7hCt93nwQ/o6/P8v9jaotPYQfCdTm+pH46tsX8fs+YKrBXXKy5QZzchklijvt+39bctAxFRWzRqvUAVE7Ofhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JarX3u1N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UJE0020865;
	Fri, 22 Aug 2025 09:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gX61FoazzEu2dfspbNtw7L4e4zRSy/lHaPgZlW4iuU4=; b=JarX3u1NTmzTg/3A
	rqCY4qeE9MZHXvqA8VrR+WySD3gGGxdKi/oD/ZVsioZDRo/pih1/+5Pt+rcdEXeG
	88dvtn+h3RLPbI3hBN5vJqsX67AALG4DRpbKwxD3uz9UV2RZkS6Evtze5uu5yw8i
	fsOvYFCXyqzcqcF4E5scpdPuvSUShT5juDMzXCojloeg4tjCDJNN/QZVk8G4Hbif
	7XPFi/gjwa20K/Ib5B/kOXIlHSOUM5rPFLP3Mr0I6B6hwc3unhy9X/n3dObOliYW
	Z/W0to+8lx4RUBcZmFwPv3B2Owe6eAi4gBLE/EOvuIGXj9Ov2fLsBX2lV3ob1x14
	WrX9ZQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5290pf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 09:23:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57M9NcrG026076
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 09:23:38 GMT
Received: from [10.216.22.206] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 22 Aug
 2025 02:23:35 -0700
Message-ID: <2635ced4-b91f-4c79-ae2a-079f06bbb8a9@quicinc.com>
Date: Fri, 22 Aug 2025 14:53:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/2] phy: qcom-qmp-ufs: Add regulator loads for SM8650
 and SM8750
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        "Manivannan
 Sadhasivam" <mani@kernel.org>
CC: <vkoul@kernel.org>, <kishon@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250819222832.8471-1-quic_nitirawa@quicinc.com>
 <20250819222832.8471-3-quic_nitirawa@quicinc.com>
 <ger4kizeltjwalfuwu4dpfjiskrv2okgo5c7d6n3pb24yaxgfo@nkcndblyx3il>
 <xir3u3hlmcvfu6uasijz6g2oialoasmuu4bno6ctxpscqcebz6@6kw6xpm5bxbd>
 <761c97bb-ee90-4ace-acd3-08349831aade@oss.qualcomm.com>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <761c97bb-ee90-4ace-acd3-08349831aade@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a8371b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=3vFY76kdcj1CIDOknBYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: XfsU-EhmgXv_0IHsY4LYIOFZEA96EXrq
X-Proofpoint-ORIG-GUID: XfsU-EhmgXv_0IHsY4LYIOFZEA96EXrq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX4UUL2xrAk2kz
 uvd3m5dNMtxCRIK4tWLkarYROGzkgov3/Q+B8ByHYTeESsDYdnIgZgHiwpcKvgGF3dMQ+RFDxlA
 NLMQNOlX4sZQoHSDmjtxnV1HvHuY42yquzkGY9Z1A0lvJGNWgDmps8uFdOkAAWH7x6DeoGy3fvX
 pcmhew8toRhCgTYZq75DvKitfdGR/rrjLbk4HiqT9TzypnQMRDuAVP9oKggFBGSYIljP++JHe9E
 ltyPmROTnGU8Rg0lM/mJ6RaXBEwW70C1q3oNvzAVCm+46z3VANPI51e0+dAQ9tQIquTvP6boE8h
 tAh/JyISwooS/uiu0S5qBzhJeDVosPQHeeP8d37s4CT2ewNU6nR+4e6xjD+GuEqd+5atr+tspQL
 k7PiuMYkZtIShujb12CLV2+572EG1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013



On 8/22/2025 2:45 PM, Dmitry Baryshkov wrote:
> On 22/08/2025 11:53, Manivannan Sadhasivam wrote:
>> On Wed, Aug 20, 2025 at 03:49:31AM GMT, Dmitry Baryshkov wrote:
>>> On Wed, Aug 20, 2025 at 03:58:26AM +0530, Nitin Rawat wrote:
>>>> Add regulator load voting support for SM8650 and SM8750 platforms by
>>>> introducing dedicated regulator bulk data arrays with their load
>>>> values.
>>>>
>>>> The load requirements are:
>>>> - SM8650: vdda-phy (205mA), vdda-pll (17.5mA)
>>>> - SM8750: vdda-phy (213mA), vdda-pll (18.3mA)
>>>>
>>>> This ensures stable operation and proper power management for these
>>>> platforms where regulators are shared between the QMP USB PHY and
>>>> other IP blocks by setting appropriate regulator load currents 
>>>> during PHY
>>>> operations.
>>>>
>>>> Configurations without specific load requirements will continue to work
>>>> unchanged, as init_load_uA remains zero-initialized when .init_load_uA
>>>> is not provided.
>>>
>>> Can we please get configuration for the rest of the platforms?
>>>
>>
>> Only if the rest of the platforms require setting the load... It is 
>> not very
>> clear if the older platforms share the regulators with other IPs or not.
> 
> Yes, they are usually shared. USB. PCIe and DSI frequently sit on the 
> same voltage rails.

Yes, it’s typically shared across multiple clients.

However, as I mentioned earlier, in the current upstream codebase, the 
"regulator-allow-set-load" property is defined only for SM8750 and 
SM8650 within the PMIC PHY and PLL device tree nodes. This means that 
even if the UFS PHY driver is updated to vote for this configuration on 
other platforms, it will have no effect, as the property is not 
supported there.


> 
> 


