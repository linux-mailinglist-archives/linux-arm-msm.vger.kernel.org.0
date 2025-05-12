Return-Path: <linux-arm-msm+bounces-57571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9D8AB2E04
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 05:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDBCF3B2ED2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 03:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4401C24DFFD;
	Mon, 12 May 2025 03:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hv8/ezSm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9369D3FE7;
	Mon, 12 May 2025 03:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747020025; cv=none; b=jiNi80Kg9II8zXQVCz14DfAvbmRivGx7gwPiK/P4Joa1hrPppHDWDWAyek1pMJlT4qWkV6nHnsYny3BNYnhv8aSBHsnt3HzDicGfB5tkHi622EEfqRoO5RD+hHODGrRSnZeB2I3GlWYfHIN2AbRDi9NEj+Gqs45P4oEnMOoOqn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747020025; c=relaxed/simple;
	bh=e9bP4xfqeLEEmpYx1vZoRZfU8ik7kEpH/Xu4ESP9NBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RUyrTfrWxBQgXq7TTiXo2oZ+vG2KxMwkWJuF/sZEJXSUnXcVKf6V9WEGFcSA6/7FeY9hMVtLLWj97+/ztaOYTbTto8Yiz3E9VjupdNdXk9evlJTmQ6u8hSIwBwQZjqxnPSXXrM91vH9uIbMYRh0i4a6lNc4xqBIjRf3lX7fwtiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hv8/ezSm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BMwDuX013379;
	Mon, 12 May 2025 03:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qj3n6D7VwKoLjijtDVsMaEMCksWmx8FugJrnliRn3lY=; b=hv8/ezSmbt7qcvQU
	xOFkOgweqbU9iWnJRszKg+5pegpLPHjek7y4rL6IRT90q57BRwsgxNjvfI8mh1lc
	HkrnpZNchGg7VtlHIDeSd7Sry5g542R0EwByPS5Zt9NrWuoa+sec6HIZhCXMBhNK
	yrhQE68ADHZ/zJ+FUpLb+dYU5QgVNYi3XxNAsrPmtEq7bOOJSc+tPU20ziVEuUN0
	XD+SYl8bmwixbVMoliM2DJGGDW8f5jtRm9j5h5S701G74eNXVt51AnTYkPqeNsWG
	TnDoijBDYeZbn+NvhcN/IBPNFFKNj7heDaHNhRH44H7C3KH7A7uC/P4me+9glpnS
	CLnKTQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hv5qb4nh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 03:20:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54C3KHGl014444
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 03:20:18 GMT
Received: from [10.239.132.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 11 May
 2025 20:20:12 -0700
Message-ID: <2eb4606c-16f8-4e34-8084-039c9e57bbdd@quicinc.com>
Date: Mon, 12 May 2025 11:20:09 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: qcs615: Add IMEM and PIL info
 region
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
 <20250507-add_qcs615_remoteproc_support-v2-4-52ac6cb43a39@quicinc.com>
 <64893588-544f-4cb0-8c0b-7eef588468d5@oss.qualcomm.com>
 <c0ab504c-2b27-45cd-be8f-1176230b8bfd@quicinc.com>
 <f81b3f81-b14d-41c1-9968-2d473e1f0947@oss.qualcomm.com>
From: Lijuan Gao <quic_lijuang@quicinc.com>
In-Reply-To: <f81b3f81-b14d-41c1-9968-2d473e1f0947@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=DqtW+H/+ c=1 sm=1 tr=0 ts=682168f3 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=yCyZkDE8jGOGnjQE1oIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: uQFq18D9Q7sVwOmnQOg1p6ybi2STf3GN
X-Proofpoint-GUID: uQFq18D9Q7sVwOmnQOg1p6ybi2STf3GN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDAzMiBTYWx0ZWRfX9yUa+QWithC7
 tKpSQ8HaSc8X72BHj4mK8TPMnbW1fnB3K71zhtaLTe2kDwfcxDlol2LL8hRfeuk9IxSdK3VIR+z
 xnBXTPZvu1dN0nWtHG/R++MXvsAhNVuX0QyZmhRkPjt+GZOAncNqSst5cuKOqckrdvwKk6H5GAK
 uuSd8Ul6RQShXDa2mxQbH8gkJzN+aUDrY5JHnTBXNXEKM3wLhvN31wImjKu4tUyGTx/5lR36NM9
 /TSCaZqBPVMmVnoQhY81v/9Y+TKt00zLZKkFklZtxD9QqMNyVsfhb1lJP6DxLLeixWAQRpatpS1
 /KV0X3r7lBuKSfR0C+Yl9XfoIYShbGzj4Sim1e8h9YEGn3wQb7KttI0NlKbYda2nhl5Fx8TBO8m
 1MigP/GZ6aByfdVdrGEN4ZuwhIdf869cgyKj2YQfSCj1obtlXiZJF+8y/AhhHYZjx1gFIDKP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=931 malwarescore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505120032



在 5/9/2025 4:54 PM, Konrad Dybcio 写道:
> On 5/9/25 9:37 AM, Lijuan Gao wrote:
>>
>>
>> 在 5/8/2025 10:41 PM, Konrad Dybcio 写道:
>>> On 5/7/25 12:26 PM, Lijuan Gao wrote:
>>>> Add a simple-mfd representing IMEM on QCS615 and define the PIL
>>>> relocation info region as its child. The PIL region in IMEM is used to
>>>> communicate load addresses of remoteproc to post mortem debug tools, so
>>>> that these tools can collect ramdumps.
>>>>
>>>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/qcs615.dtsi | 14 ++++++++++++++
>>>>    1 file changed, 14 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>> index 53661e3a852e..fefdb0fd66f7 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>> @@ -3266,6 +3266,20 @@ sram@c3f0000 {
>>>>                reg = <0x0 0x0c3f0000 0x0 0x400>;
>>>>            };
>>>>    +        sram@146aa000 {
>>>> +            compatible = "qcom,qcs615-imem", "syscon", "simple-mfd";
>>>> +            reg = <0x0 0x146aa000 0x0 0x1000>;
>>>
>>> 0x14680000 0x2c000
>>
>> I checked the latest datasheet, the Shared IMEM address is 0x146aa000 and its size is 0x1000, 0x14680000 is the start address of IMEM layout. The shared IMEM is used for debugging purposes, while the others parts are dedicated.
> 
> Even if we don't use the entirety of it, it's good to describe
> the whole block
> 
> Konrad

According to the definitions on all existing upstream platforms, this 
imem points to the shared imem. Should we stay consistent?

-- 
Thx and BRs
Lijuan Gao


