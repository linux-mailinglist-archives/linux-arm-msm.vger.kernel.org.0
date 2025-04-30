Return-Path: <linux-arm-msm+bounces-56190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE97AA41B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 06:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E04751BC828B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 04:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A8D71D8E1A;
	Wed, 30 Apr 2025 04:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GEbOdS6p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03DA366;
	Wed, 30 Apr 2025 04:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745986578; cv=none; b=AbW9DBme5BnbjjfKfEYrXdi1Qfk4W7iuuSdpzgYPihRO6GGKJ76AKnbszYeWmEz0v7PMedxX77cGinENaGSq1KEQiqnX/fzGHUhmg0aDZ/kmvZvr5MBoX7XkiNyd65WteCmpCMc4zjDFRTKp5iqXgvcOsKjEKo5QwgNWP2s1ZLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745986578; c=relaxed/simple;
	bh=IPEe/ZfODbctbdxL/MayZ0WqOeVU+voxMWSU6vfUSa4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Oz0yk+nihk8lCCem88OrGc4zyeSrVHUCS+Soa40XG7We3wMBOk9eRPgpH3EIKfR+XNLQFG9HVA/vJys7bgwZ7segJs3dqzF1AJ0V/Tn99X7iEd0Ic388ZBCc0s8a/Qu8H8CW8CENoxSYVRQpMF3pr4lH15T6D2zxbNd8mcsSR7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GEbOdS6p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLahDi001224;
	Wed, 30 Apr 2025 04:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gKdKlIhY6/W1FIhEQGzmhk4YCJUHej8Qbon8wISTw40=; b=GEbOdS6pbE7ZjPhw
	tSYVh8m7fNi9mae7F/UfV9Cmn4YLvf2ivtgqdxe9Dsls9b1cf7WWBrm5nHqgimIr
	mjVzj1ZayiAQqokdZAPlHGaQy1hHrcIC3qDOj+5OFVb9aLiIFKnbWm6yfl1oKGUM
	0KSJHyy+SzCsXb3qmM08porcdP2xVEJwxBTdMmNG9ue/b3H+w9H8MxmhiQm3/Yvt
	eL6yscYQYZefk9gmG+aGLotpRJReWr9DbvF95V3B3TDhyo+NdUOL63jZ3lZVd4wp
	jigX7Kz0wOIYtPhPSLBsrYJpXWKK2wpObds0ZIkF5qb25E54H7Ykov0zAin9mJvP
	llfNHw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u9rr4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 04:16:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53U4G3Ru000636
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 04:16:03 GMT
Received: from [10.239.29.178] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 21:15:59 -0700
Message-ID: <c4115bbc-e120-4a20-b6ad-a0d5266319d3@quicinc.com>
Date: Wed, 30 Apr 2025 12:15:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-qcp: Add qref supply
 for PCIe PHYs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold
	<johan@kernel.org>
CC: Wenbin Yao <quic_wenbyao@quicinc.com>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <krishna.chundru@oss.qualcomm.com>,
        <quic_vbadigan@quicinc.com>, <quic_mrana@quicinc.com>,
        <quic_cang@quicinc.com>
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
 <20250425092955.4099677-5-quic_wenbyao@quicinc.com>
 <aAtbFQIQMJO-BYe_@hovoldconsulting.com>
 <e82eda3b-b27f-4584-ad23-562ca4b22847@oss.qualcomm.com>
 <aAt54vikoREWZyGY@hovoldconsulting.com>
 <17a1a4d9-fdc5-477a-bf4e-91cae5a62479@oss.qualcomm.com>
Content-Language: en-US
From: Qiang Yu <quic_qianyu@quicinc.com>
In-Reply-To: <17a1a4d9-fdc5-477a-bf4e-91cae5a62479@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dZ6RngitfF5yqOr-NcEeqcvDSriSJvWS
X-Proofpoint-ORIG-GUID: dZ6RngitfF5yqOr-NcEeqcvDSriSJvWS
X-Authority-Analysis: v=2.4 cv=UZZRSLSN c=1 sm=1 tr=0 ts=6811a405 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=QfwDM738abGcK5AhbMgA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDAyNyBTYWx0ZWRfX7PU6gY+sSafB URMQZNSKS5x9HxZyd4daAzpQAI6z1/sVyHuZ348Wqe38CehIz10DwSw9xpDKU2p0xj4FecOw9ZZ DR3cKAEgfwwbtnC31RoFjTQNaSVaYxhT1ue5Yce5zTROacD0sB1/f52NBN6/Pu3cz7a0rBT6kXR
 6jmw1CfruPlks39Y2R13keu54t0d8Du6lckK3HaS5npnxw80q5Z+4x+B4BFwvEQhUdwAc3R8xXj lH8kQrun2xJEbdLIPlOqBPB4CRzocSRXSTPz7RU2PYMtAIY8oZOmVoZgkdad9ba8xMLdFIiUacO waUyZiWzCdq7amG2vNlPpQw0hK29nxuIUEvjM1H3e4g7h7BNbhIst7MpXjnxVqs19kpastv/yrr
 qKoUUUZ8IPSlFvYNZu0WdbC9tSf3JP5CbV1/pjzZ3NE5aqDF33xOPKrEOw4qcrfdvD0hrrUo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300027


On 4/26/2025 6:48 PM, Konrad Dybcio wrote:
> On 4/25/25 2:02 PM, Johan Hovold wrote:
>> On Fri, Apr 25, 2025 at 12:03:06PM +0200, Konrad Dybcio wrote:
>>> On 4/25/25 11:51 AM, Johan Hovold wrote:
>>>> On Fri, Apr 25, 2025 at 05:29:55PM +0800, Wenbin Yao wrote:
>>>>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>>>>
>>>>> All PCIe PHYs on X1E80100 require vdda-qref power supplies, but this is
>>>>> missing in the current PHY device tree node. The PCIe port can still
>>>>> function because the regulator L3J, which vdda-qref consumes, is voted by
>>>>> other components.
>>>>>
>>>>> Since the device tree should accurately describe the hardware, add the
>>>>> vdda-qref power supply explicitly in all PCIe PHY device nodes.
>>>> AFAIU the PHYs do not use this qref supply directly so it does not
>>>> belong in the PHY node (but possibly in the tcsr node that provides the
>>>> refclk).
>>>>
>>>> Since commit 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100
>>>> qref supplies") it also won't have any effect for pcie4 and pcie6.
>>> QREF is a separate hw block distributing the reference clocks across
>>> certain on-SoC peripherals
>>>
>>> If its power goes out, I don't think much of the platform would be
>>> functional anyway, so it's redundant here..
>>>
>>> It doesn't have its own single register region and it's frankly
>>> one-shot-configured way before Linux starts up, so there should be
>>> no need of describing it at all.
>> Then it sounds like the qref supplies should be marked as always-on. Can
>> they be disabled at all?
> The best answer I can say is "maybe". I would (without knowing any better)
> assume RPMh wouldn't let you turn them off. QREF predictably takes VDD_CX/MX
> and some additional lines
>
> Konrad
The vdda-qref power supply feeds the QREF clocks, which are consumed by 
PCIe, UFS, USB and display on X1e80100.
For PCIe, QREF clks are provided by the TCSR device with the following 
bindings on X1E80100:
#define TCSR_PCIE_2L_4_CLKREF_EN
#define TCSR_PCIE_2L_5_CLKREF_EN
#define TCSR_PCIE_8L_CLKREF_EN
#define TCSR_PCIE_4L_CLKREF_EN

These QREF clocks are not enabled all the time and are disabled during 
PHY deinit. Hence, vdda-qref should not be an always-on power supply. It 
should be turned off when the QREF clocks are disabled.

Describing vdda-qref in the PHY device tree node is reasonable, as it 
allows the vdda-qref power supply to be enabled or disabled along with 
the QREF clocks during PHY init/deinit.

-- 
With best wishes
Qiang Yu


