Return-Path: <linux-arm-msm+bounces-68058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79208B1DE69
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 22:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36EAE1AA5131
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 20:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18BD22756A;
	Thu,  7 Aug 2025 20:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q7/iSzqF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2716E19D8BC;
	Thu,  7 Aug 2025 20:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754599555; cv=none; b=lfhojl5heQsHuTrWJo9oscdd05w1PVJ6WeDyYPY9kmEQ5mjlpeMIdnoTc/rvFqAZ0RWQRbHod4ikeeF1fGi3eShB0B2p76WMGA7+i4yKZ5mZwWVKTP/uHXGOYT2YOFDqBwUunmG+CuKSozoXcpE/oF8yZ/Q1WHT5gmO9SDDrsvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754599555; c=relaxed/simple;
	bh=F+rikjg51mw2kXmO8Js7I/1yjwiRiqG3pWEEEcI0WBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jGPCc02PydN0dlQgt3MQ98I7COu3nfQjNCACeL+YZO40Ja7sxt9DL5Y4Oc6ULQ5HYAQlFfcEx84jy52XU80BPBrECYhcdj+Vqjiw+P83L8Yek+Nw0RgatNBZrpfKXZ6KIV7d3XraixbFwldzgbEJWXrHS2iVFXngPp4GCyoiEQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q7/iSzqF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 577EDJsh006876;
	Thu, 7 Aug 2025 20:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1y/Zhzh0xKBSqXOG4QAbfLqjcK4EPmh64vtepr7nrYA=; b=Q7/iSzqFZKIwQQO4
	nKWuJX+3HLVw2jPzx68MALM7KQLqfiVXFRVXqsn06KqDTOiYi9hRajeDt8jHnatH
	nDmYKCRbO/aE1F1zd0+rJG2GaVgM4k0q4wzl85XDK5PVGRtBs/2wcVjZxC9w2kfY
	kHZQ1fmxoK5jeArUJE0u5l4Va0QISM43uEr8POZwDV2Rv/abHjWCFaNs6Scsu+1r
	nhFPX2vNcv7nY3Uno4IXzTQwyHmAayhTADhSEaeGdVUs5AURjf7CZZvj1CkNl4j9
	EdJnq1XYCMcimVSGkqFQPnWB6NEYSB6pUkUAX/c7eXdqUPG8rFF3dczIXHWNc8dI
	8HIGYw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpybftpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 20:45:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 577KjgdM002043
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Aug 2025 20:45:42 GMT
Received: from [10.216.57.148] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 7 Aug
 2025 13:45:36 -0700
Message-ID: <52625e59-c7d0-45d1-8af3-d9958c5ef01a@quicinc.com>
Date: Fri, 8 Aug 2025 02:15:31 +0530
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
References: <20250806154340.20122-5-quic_nitirawa@quicinc.com>
 <f368b6da-1aa3-4b8e-9106-3c29d4ab5c5e@oss.qualcomm.com>
 <fe2bc07c-8fe9-47fd-bcd7-c2f0ebbd596f@sirena.org.uk>
 <aed1de56-fafe-4ccc-b542-69400b574def@oss.qualcomm.com>
 <acf89420-743b-4178-ac05-d4ca492bfee3@sirena.org.uk>
 <599b8a4b-324a-4543-ba27-0451f05c3dfd@quicinc.com>
 <3aa82f65-4812-4bf0-9323-96f40824a004@sirena.org.uk>
 <685e3d36-c0e3-4faa-b817-aecc15976a25@quicinc.com>
 <c1435858-6288-4525-8c92-e27ed86cb55e@sirena.org.uk>
 <31461227-3f3a-4316-9c8a-c851209d0278@quicinc.com>
 <4efc8a3a-ceb6-40dc-b877-328b86348e0b@sirena.org.uk>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <4efc8a3a-ceb6-40dc-b877-328b86348e0b@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX0Ab7AMZ7i3/E
 RXqQB/cLZsmAKhOBD4mDskR1A2Pko7dNEnXTmQeWpWfX/iQPwD9ethuJLj2FFiGEtkRlFx9QeA8
 EpMbJahXFfYRebhCpTNMTIFY/88T2LDSfRAxl7HcQXTIoCctERXZADYXJqSyW/AAz6wOraEv3Ok
 bdbWLkbJfmDYP9jSuteHLvblq+Y6HPBbUoMHs5ca0UpSpD9t8NL9pIufEPODQvDTOusKaa6Yk2J
 8L3rj0Lm7XbsIsEh2kOnrF6KzHrV5r3jxTb7ab0PP5Ul6rniTFw3Yt89sp7LTMaeqkV3PH4JBXI
 JSbplRgV+5F1Um74adOhfMRILoWt7tdIGIj696jtl7ajhUusYoE3KUKCcHpwXLgj4zCl2lYr9us
 4IY1le4k
X-Proofpoint-GUID: R58dcDIoPMNJvs0kQ5NPhRSGdgCgz_16
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=68951077 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=qAuQnvhxRzsbetId1DgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: R58dcDIoPMNJvs0kQ5NPhRSGdgCgz_16
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009



On 8/8/2025 12:15 AM, Mark Brown wrote:
> On Thu, Aug 07, 2025 at 11:26:17PM +0530, Nitin Rawat wrote:
> 
>> 1. Regulator and PMIC configurations are board-specific, meaning they can
>> vary significantly across different platforms. For example, some boards may
>> use different generations of UFS devices — such as UFS 2.x — which come with
>> distinct power and load requirements and some with UFS3.x which has it own
>> power/load requirement.
> 
> Requirements from generations of UFS devices presumably come from the
> UFS spec and should just be known though?
> 
>> 2. UFS PHY load and PMIC requirements also varies across targets, depending
>> on the underlying technology node and the specific PHY capabilities. These
>> differences can be influenced by the MIPI version or other implementation
>> details.
> 
> If you've got non-enumerable PHYs that have a big impact that's a much
> clearer use case for putting things in DT.

What I meant is that different boards may use different UFS parts, and 
the associated PHY load requirements are not governed by the UFS 
specification itself. Instead, these requirements depend on our specific 
PHY design and MIPI, which can vary across platforms.

Because these characteristics — such as load requirements — are not 
enumerable or automatically detectable, it makes sense to describe them 
explicitly in the device tree. This approach ensures that board-specific 
variations are accurately captured without hardcoding them into the driver.

> 
>> Given this variability, expressing these requirements in the device tree
>> allows for a flexible and accurate way to describe board-specific
>> constraints without hardcoding them into the driver.
> 
> There's still the issue with making this a thing for all regulators, not
> just for this specific device.


I see your point. Just to clarify — my patch is specifically scoped to 
UFS PHY and PLL regulators. The device tree binding defines these 
properties as optional, and they are only enabled for targets where load 
voting is required.

So, this isn’t intended to be a generic change for all regulators, but 
rather a targeted solution for specific consumers that need it.

That’s why I’ve chosen to keep the regulator parsing logic and 
corresponding load voting support within the UFS PHY driver, rather than 
extending it to the core regulator framework.


Thanks,
Nitin


