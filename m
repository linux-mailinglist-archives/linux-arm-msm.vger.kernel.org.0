Return-Path: <linux-arm-msm+bounces-68048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67965B1DC85
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 19:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F0B9727EF3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 17:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1AD2737EF;
	Thu,  7 Aug 2025 17:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jXqAKAsM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF81C13E02D;
	Thu,  7 Aug 2025 17:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754588139; cv=none; b=di3Xu8qHfgR/PJ5vTK/KTqGiBGk8vFOisrjbXATKUtwahk2fIrwyT2/PoQs/LBv1QkLSD8FgB6kb7eiNyFntn3HSaiZyMTjrumlPoAcDkjBDaySidrvg/hAbn+mEBO7/aEUXlPaxotEOQz5eK4xNtuqW3bXN1IM0TZRORiOgvgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754588139; c=relaxed/simple;
	bh=UASj2AgO1mBNMVv3V0LG49z0ZdwooDIrgM/bG1FaMMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FBNnGH6n4+O9ES9fs9l+GeAXk53W+c9CniDnb/uEpzra00N/fGmMC6Kp0XjSU0W+oMe4EKfP8mEk3IXEDzOJqB/ANS5nVe0ggZGGGvN8H7phgar//JzMQtBTCBXM3mh/dThNfzb3F9hgoISMEmjiBO/cU0nRAfQfUPsKMlD4j/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jXqAKAsM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 577EDLAC009613;
	Thu, 7 Aug 2025 17:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wzDxtcZ180VoLJkdrDeoWXbz8Llqqro6AJbxMaFVIoY=; b=jXqAKAsMdTB0JPwB
	BJ0bMtbLMPFz1+IAK30eNIS0+H/nnGHJU3lGBSfAML8qj7yBTVk5EQXvQYykSOm/
	lPR2PuY2c4jKkRrZ9JtlcmiWbD5Fsjl1h3/Mg9BL0QuV5WKY+fLZN/BOnbvJFs1N
	eH76WMt258n9HQhhKcYPOY7JzPRft4KlPxKKis3ki/XJo5+qCq5x60BLb/ZqRVMY
	OT9wzNbqSHqmpw0zWRrVg5DuRtQgZg6v0Lzbz4Fud4Dy+Adl1B11viM3GVIs6kP0
	6FSKaJ2569M6kyUwpchqw+wmb0OGRFMBFe+x3VkVC76R9TjyBJvNzrN9QrqQWpUG
	qn1qTQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c586crpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 17:35:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 577HZGej004485
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Aug 2025 17:35:16 GMT
Received: from [10.216.57.148] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 7 Aug
 2025 10:35:11 -0700
Message-ID: <685e3d36-c0e3-4faa-b817-aecc15976a25@quicinc.com>
Date: Thu, 7 Aug 2025 23:05:08 +0530
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
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <3aa82f65-4812-4bf0-9323-96f40824a004@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: k1lFEkVAZU6taij4K4oZC9rkplLHAAwz
X-Authority-Analysis: v=2.4 cv=MZpsu4/f c=1 sm=1 tr=0 ts=6894e3d6 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=lkdlCDLHdhMUbxeqZWYA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: k1lFEkVAZU6taij4K4oZC9rkplLHAAwz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA2NCBTYWx0ZWRfX83m6j4by5xD7
 kzuddMKPMFvUXzKUCrjFR5j19yINc8/xPwq1zh/W/NS3NjyiV13dOeW4xZiYOp0BlCWp+emC/dP
 KdHy9DZ20jiwhGc6SuOwXCymXZ9JNZizZWjqu+vqvqJIn0s2die5QiC2c9b+GtMi0Ppan/5u2hP
 YzEPsTPaW1ztyPn2UGhlFx07EfM3crceh2JUgrQAhdzNoFe8PaLyTIKzFvnwnGMQF1tkoAWD3Hr
 oirwPo8QZBJafcIu7TrbQSp0DBn3JZ4I/hTLZxbd3LuQ2d28XOYs34zqCmiOmJQ9I19OFfliwgO
 8dr7NTTfDSNLhUVHLwwDTR4hOTUMadZMQSc6vE3ZsHiCQF6sAtXEmDrxuJsjEwzP573EO1d3Enw
 QV8H2zHZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060064



On 8/7/2025 10:56 PM, Mark Brown wrote:
> On Thu, Aug 07, 2025 at 09:12:53PM +0530, Nitin Rawat wrote:
>> On 8/7/2025 7:14 PM, Mark Brown wrote:
> 
>>>> The intended use is to set the load requirement and then only en/disable
>>>> the consumer, so that the current load is updated in core (like in the
>>>> kerneldoc of _regulator_handle_consumer_enable())
> 
>>>> My question was about moving the custom parsing of
>>>> $supplyname-max-micromap introduced in this patch into the regulator
>>>> core, as this seems like a rather common problem.
> 
>>> Wait, is this supposed to be some new property that you want to
>>> standardise?  I didn't see a proposal for that, it's not something that
>>> currently exists - the only standard properties that currently exist are
>>> for the regulator as a whole.
> 
>> The UFS QMP PHY driver is not the first client to use regulator_set_load or
>> alternatively set load requirements and invoke enable/disable or
>> alternatively
> 
> The issue isn't using regulator_set_load(), that's perfectly fine and
> expected.  The issue is either reading the value to use from the
> constraint information (which is just buggy) or adding a generic
> property for this (which I'm not convinced is a good idea, I'd expect a
> large propoprtion of drivers should just know what their requirements
> are and that a generic property would just get abused).
> 
>> These drivers also define corresponding binding properties, as seen in the
>> UFS instances documented here:
> 
>> UFS Common DT Binding ((link - https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/ufs/ufs-common.yaml?h=next-20250807)
> 
> Note that that's specifying OPPs which is different...

Sorry for the confusion .Instead, I meant the following three properties 
defined in the link to ufs-common.yaml binding, which specify the 
maximum load that can be drawn from the respective power supplies.

   vcc-max-microamp:
     description:
       Specifies max. load that can be drawn from VCC supply.

   vccq-max-microamp:
     description:
       Specifies max. load that can be drawn from VCCQ supply.

   vccq2-max-microamp:
     description:
       Specifies max. load that can be drawn from VCCQ2 supply.


> 
>> There was a previous effort to introduce similar properties
>> (vdda-phy-max-microamp and vdda-pll-max-microamp) in the device tree
>> bindings.
>> Link - (link- https://patchwork.kernel.org/project/linux-arm-msm/patch/20220418205509.1102109-3-bhupesh.sharma@linaro.org/#24820481)
> 
> That patch also fails to supply any rationale for making this board
> specific or generally putting them in the DT, AFAICT it's one of these
> things just pulled out of the vendor tree without really thinking about
> it.  The changelog just says the properties are in downstream DTs.
> 
>> Currently, the regulator framework does support automatic aggregation of
>> load requests from multiple client drivers. Therefore, it is reasonable and
>> necessary for each client to individually communicate its expected runtime
>> load to the regulator framework to put the regulators in current
>> operation mode.
> 
> That doesn't mean that it's a good idea to put that information in the
> DT, nor if it is sensible to put in DT does it mean that it's a good
> idea to define a generic property that applies to all regulator
> consumers which is what I now think Konrad is proposing.


