Return-Path: <linux-arm-msm+bounces-43283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4C39FC324
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2024 02:29:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04555164A4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2024 01:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D92C101EE;
	Wed, 25 Dec 2024 01:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KxLBVI4J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D838825;
	Wed, 25 Dec 2024 01:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735090177; cv=none; b=mREHikbTGoGPm/PyZzpF6YGlSQJ1WBRRQyXpQislhYXurUzixmj5s7INTtfgDxRhyl6uO3xa9uWV3vxi8ZqhpuPE764GgJwsTzkodD/tKEI2goZ2HzuqUyiEWu7e20QYz7JwtsRkYM0wYuamKs/4OYiXTuVob6e+CXvg44/0+08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735090177; c=relaxed/simple;
	bh=7eW7xymwwRZ1HuzNRcAqAlduadL7sFZGdJvWbWlOVYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TLupxHw2a2Th+eO9qH1mCz3g6hvlcZll/iSXDJK1FPSD2ZzONzbwaLCb/rdNG/u6t+hziPSYIN3CbGomX649TUkhKwdExDBWLOJaWq43apaALbAhd8PTjYNOpEzYRestIOiqJ68XnAgOXYOFIwml5sDnQNb85AAf3IdJ2GSKIf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KxLBVI4J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BONWpt0013809;
	Wed, 25 Dec 2024 01:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A1+I3+iDyGHdqfnhf4BUihb1pQ8R1q10nUQNH2aQl0M=; b=KxLBVI4JrNdHE9la
	ZQaCgfS/xwIpld+UUsBiGnRBIUh0zZaIQtPmIR7cbD/45qPYi0WiBg4RKAALxmYg
	Br4BslI+WQ1wtForZ3W2cp4QyzthSB4mpl0V3CtLNcWGg8sXOiBiqwj7r694VYJm
	zJcTBevidxWG9YYJWS65CGPwTtGlOVP5yZFnFr8QttMeMGbXYHHfKTE5pTnfBWlK
	nAhmn7npb++xSszeZNZDQhnuT+6oM0A8jm5yzqNijQllPFiNbQYK/oBA3vFvXj17
	PpM4mzb/pYFTYzkMpE1zH1DLoTTqQah2o8u6HeiYe4MElfFXoJ2qwFsFk5pVhqMt
	vNvTbw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qtf8c6ds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 01:29:29 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BP1TSU7020706
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 01:29:28 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Dec
 2024 17:29:24 -0800
Message-ID: <1680e4bd-3618-451a-bb84-42f0fc379221@quicinc.com>
Date: Wed, 25 Dec 2024 09:29:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: fix the secure device bootup
 issue
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>
References: <20241219025216.3463527-1-quic_jiegan@quicinc.com>
 <2b4adb2d-29f5-459b-bd85-d5d12876f7eb@oss.qualcomm.com>
 <6d91567b-0cbc-4d85-be38-2467e873e91c@quicinc.com>
 <7b33235f-dbf7-45f9-9e8a-5d69ec8ca863@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <7b33235f-dbf7-45f9-9e8a-5d69ec8ca863@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LYP6hxJM3O8Glca55M4QGYW-ltAYyiWd
X-Proofpoint-ORIG-GUID: LYP6hxJM3O8Glca55M4QGYW-ltAYyiWd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 mlxscore=0 suspectscore=0 mlxlogscore=972 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412250010



On 12/23/2024 7:56 PM, Konrad Dybcio wrote:
> On 20.12.2024 6:51 AM, Jie Gan wrote:
>>
>>
>> On 12/20/2024 5:25 AM, Konrad Dybcio wrote:
>>> On 19.12.2024 3:52 AM, Jie Gan wrote:
>>>> The secure device(fused) cannot bootup with TPDM_DCC device. So
>>>> disable it in DT.
>>>>
>>>> Fixes: 6596118ccdcd ("arm64: dts: qcom: Add coresight nodes for SA8775p")
>>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>>> ---
>>>
>>> I was thinking, is there a QFPROM fuse we could read on both
>>> secure and non-secure devices to determine whether all coresight
>>> components will be accessible, and enable them based on that
>>> information?
>>>
>> There are two known TPDM devices had been disabled on secure device. One of these devices is TPDM_DCC. In downstream code, we have an API to check the secure status of the device in TPDM's probe function, to avoid unintentional enable. The downstream API will check the register that controls crash dump functionality in TZ and the crash dump functionality is disabled by default on secure devices.
> 
> That's an "eeeh" type solution, crashdump is a separate thing that may be
> enabled independently, and some prod devices from certain vendors actually
> do that
> 
This solution have been applied because the TPDM_DCC has connection with 
crashdump. But I think you are right, this is not a totally suitable 
solution.


>> We need to verify if the downstream API is supported by the upstream kernel. We plan to upstream a patch to implement this functionality in the TPDM driver or any other device's driver that needed the functionality.
> 
> Please check if there's a coresight-specific fuse instead
I will check it with hardware team.

> 
> 
>> For the time being, we need to disable this TPDM device in DT because the TPDM_DCC will break the bootup process on secure devices.
> 
> Yeah, right
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

Thanks,
Jie


