Return-Path: <linux-arm-msm+bounces-68051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08683B1DCBF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 19:56:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3F5B3AF773
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 17:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 555F520296E;
	Thu,  7 Aug 2025 17:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q1flqUP6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02361FCF41;
	Thu,  7 Aug 2025 17:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754589400; cv=none; b=hpl0ko3Vc2Sek8J2YaF9GpdmnHDQiBSfp0bQeTtcHTN2OJxIc4MoCjhwaUhZfNprVdO5PyUP4qRaTgfzDTavAisiO2XlP0eRDI5Sqhu21zLAv0Z/tcVmC6Mt5Jcu6OlwBsE4dKm9/nMtS1TNK8Gxoy5uXnlw0HDVsyifbipxwO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754589400; c=relaxed/simple;
	bh=zGma+H+t/u8Vc+j/CWH77yMZEYXD+Cn+I5YwYhpUZNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=t/bMd+WyMhSisOiMuULQAvJgykV59Wtciw/dOhwE6F5RnsDr2B9UAgklBaLWPqac/+aFPyhKujW74Xv3bgvHIRDHNpdLtYq7Doc2WKxaKFCubGNVveMlFvC9J80C1yVyrzy19K+TkfDkn6O/rq/qKLWYOIllgybyV6RTO1H/ArQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q1flqUP6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 577EDJOF030191;
	Thu, 7 Aug 2025 17:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6YHORUoMsrOOCbSVlY5NdFABShlBBXio8F17YDO65R0=; b=Q1flqUP6PMBVoDCh
	4WuU/Ye6HRn0UYWMJediByNq9gVnohTMXsCGfMwGaUN7Z0Hn3ZtYM9rhzAGF/onQ
	9Wkph3nL0JD4keWxzvxJN9TWQX3wOj1neujKNc1H0sSZW7pJ3T5w7ko09nNHdglb
	ohQ280jUlCO2D54Z0lH4LGiZcF/0fzmNDaiww+izGdcPs4U6RPKwcVT9SlD/S6D9
	9iPMA4d2S41SPI3S+9N/43ojTeGGkBHwqNftfTGNYycfHPTaKxGhqTgmykITj3Z9
	GXOc4Eqm8V5YxfDvGE6Q+T5cTfw2d5/1ppGzursKE1OJNz0FYs10itpO7MFESZI4
	y7qMKw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvyyb4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 17:56:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 577HuRmY002761
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Aug 2025 17:56:27 GMT
Received: from [10.216.57.148] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 7 Aug
 2025 10:56:21 -0700
Message-ID: <31461227-3f3a-4316-9c8a-c851209d0278@quicinc.com>
Date: Thu, 7 Aug 2025 23:26:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 4/4] phy: qcom-qmp-ufs: read max-microamp values from
 device tree
To: Mark Brown <broonie@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <vkoul@kernel.org>,
        <kishon@kernel.org>, <mani@kernel.org>, <conor+dt@kernel.org>,
        <bvanassche@acm.org>, <andersson@kernel.org>,
        <neil.armstrong@linaro.org>, <dmitry.baryshkov@oss.qualcomm.com>,
        <konradybcio@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
 <20250806154340.20122-5-quic_nitirawa@quicinc.com>
 <f368b6da-1aa3-4b8e-9106-3c29d4ab5c5e@oss.qualcomm.com>
 <fe2bc07c-8fe9-47fd-bcd7-c2f0ebbd596f@sirena.org.uk>
 <aed1de56-fafe-4ccc-b542-69400b574def@oss.qualcomm.com>
 <acf89420-743b-4178-ac05-d4ca492bfee3@sirena.org.uk>
 <599b8a4b-324a-4543-ba27-0451f05c3dfd@quicinc.com>
 <3aa82f65-4812-4bf0-9323-96f40824a004@sirena.org.uk>
 <685e3d36-c0e3-4faa-b817-aecc15976a25@quicinc.com>
 <c1435858-6288-4525-8c92-e27ed86cb55e@sirena.org.uk>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <c1435858-6288-4525-8c92-e27ed86cb55e@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: f4X0BDZ2xxnLo2baqVvaSX_SGzcEVSXm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX6063Wcwgldw1
 ePf2g2CsxZDBs0GpvopTBrpv/lYK64lYg60azlmMSyGEpJTkBJRf1Yw5UAcQMRJt3Xtqi69D3Jk
 LE24U3CK88usnuU1gIm3U3TJ/YoPOlAy9XtgkPK9NVPQXAgPEz6oO6gAEOQlkAF2m7PqCpqw/CJ
 8Rf6bqobUPA5AMswFMYl6UeZQWS8ac/DACL5uYrjWzm08HilWV72o7d+Qy239uG4JM/lG2p21P3
 boqVAsTpAlNe8oWZZTvzshBp74cUOt9884jxgKfN1DPwrb7twN4WG3zdZtN+VRNnx+th2ZQ2P5l
 oEf72bIkznh0lKJrMmmUxAYwLD4rURFzIoOxDBR3vjUDiH1fFEXwaL4356GcsDGhq47DxMQPkZf
 zTHwaQ3U
X-Proofpoint-ORIG-GUID: f4X0BDZ2xxnLo2baqVvaSX_SGzcEVSXm
X-Authority-Analysis: v=2.4 cv=NsLRc9dJ c=1 sm=1 tr=0 ts=6894e8cc cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=Q3xy-p0DM1bs88ZO6TcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009



On 8/7/2025 11:13 PM, Mark Brown wrote:
> On Thu, Aug 07, 2025 at 11:05:08PM +0530, Nitin Rawat wrote:
>> On 8/7/2025 10:56 PM, Mark Brown wrote:
> 
>>> The issue isn't using regulator_set_load(), that's perfectly fine and
>>> expected.  The issue is either reading the value to use from the
>>> constraint information (which is just buggy) or adding a generic
>>> property for this (which I'm not convinced is a good idea, I'd expect a
>>> large propoprtion of drivers should just know what their requirements
>>> are and that a generic property would just get abused).
> 
>>>> These drivers also define corresponding binding properties, as seen in the
>>>> UFS instances documented here:
> 
>>>> UFS Common DT Binding ((link - https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/ufs/ufs-common.yaml?h=next-20250807)
> 
>>> Note that that's specifying OPPs which is different...
> 
>> Sorry for the confusion .Instead, I meant the following three properties
>> defined in the link to ufs-common.yaml binding, which specify the maximum
>> load that can be drawn from the respective power supplies.
> 
>>    vcc-max-microamp:
>>      description:
>>        Specifies max. load that can be drawn from VCC supply.
>>
>>    vccq-max-microamp:
>>      description:
>>        Specifies max. load that can be drawn from VCCQ supply.
>>
>>    vccq2-max-microamp:
>>      description:
>>        Specifies max. load that can be drawn from VCCQ2 supply.
> 
> OK, but that's still not motivating putting things in DT (the properties
> are there but don't explain why) and having this for some devices
> doesn't really address the why make it a generic rather than device
> specific part of things like Konrad was suggesting.  Perhaps there's
> enough board specific variation that it does make sense to put something
> specific to this consumer in DT, but it'd be another step to make it a
> generic thing that applies to all regulators.

Hi Mark,

Thanks for your review and feedback.
To address your question about why these properties should be included 
in the device tree:

1. Regulator and PMIC configurations are board-specific, meaning they 
can vary significantly across different platforms. For example, some 
boards may use different generations of UFS devices — such as UFS 2.x — 
which come with distinct power and load requirements and some with 
UFS3.x which has it own power/load requirement.

2. UFS PHY load and PMIC requirements also varies across targets, 
depending on the underlying technology node and the specific PHY 
capabilities. These differences can be influenced by the MIPI version or 
other implementation details.

Given this variability, expressing these requirements in the device tree 
allows for a flexible and accurate way to describe board-specific 
constraints without hardcoding them into the driver.

Thanks,
Nitin

