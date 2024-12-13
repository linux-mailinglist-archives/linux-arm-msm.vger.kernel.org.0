Return-Path: <linux-arm-msm+bounces-41876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1382E9F025E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 02:40:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C81402851BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 01:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A15E286A1;
	Fri, 13 Dec 2024 01:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="X2bvlGrE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86401F95E;
	Fri, 13 Dec 2024 01:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734054003; cv=none; b=IqIeAefOaL+N630jl3uEjYHMCZwCBkerwsku8e0Jojm4Lrsq6CzfA9r/HbqG4Y25KcHNP0rrZoaiHooYjUyfQWwPMJxTSu0InbQQEUdsxCZEd7oHuDLQ6s5zBBi/8UMQvcywDrfoeMUQFXmadbX6Fqt0ufK369f1JcIuvIK6JN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734054003; c=relaxed/simple;
	bh=xB2j3OD6BuMU63Dn2jBnkBAVeDTCLE4e5sx+vMzawEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=X4juW+ooszrGJhLVu7YzA8P9gqZUZRCoZi/KXFN1s6Pnu0iTBkWMlaww9Og5WgIz8egOeWM5bPjP+ZBg1qv//VoA4rtbp1e2H+VOuzg3lerWBUJbhp25Q2b0G5dOXg/s/Lus/hnmdjrwRArMLHTewGUGYKy5vbyT2zvbgSLMg0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=X2bvlGrE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCDDcft000446;
	Fri, 13 Dec 2024 01:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9J2rYRY3BpD/qjbQgopEF8dcGo6hOoDPkxiioVh00Do=; b=X2bvlGrEd4ZoDfx4
	dk7bz+v0HxaTU2p2sgaC33wTojC6DzT676TYxY+h4MWExExCsFr/fz50njlSPfJY
	yhJAKrDhVJDU2Xrlp/sSM8nYovi/SSxVn60VQA0Otcvlqc2DtCb0K5V2j7SFcTCM
	7R5UI0qMpV54cuFOaSEpEBUV6/cGNQhm4LoDKgCoAITAj6Gr0krHrhQarrhqGr3L
	xahcmL6fx13fPYrSCQ5+lSEHn/V4zA6GPg8MKimaNU1H67KJRO0ZPgRuRWv+azgF
	14TrI5gbfxLGcF+HLCv3DjcsbUAxf3U4Kw1S2KYIck+z1E+zaUzdhX4jxhEExXzx
	CC1PZw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fqes3726-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 01:39:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BD1dbG4006527
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 01:39:37 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Dec
 2024 17:39:32 -0800
Message-ID: <767e2a81-17a6-48ae-932b-314cdfa8005a@quicinc.com>
Date: Fri, 13 Dec 2024 09:39:29 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] dt-bindings: arm: Add Coresight TMC Control Unit
 hardware
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark
	<james.clark@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20241210031545.3468561-1-quic_jiegan@quicinc.com>
 <20241210031545.3468561-4-quic_jiegan@quicinc.com>
 <8c60e0dc-531a-47d6-9c40-ea157a24da1b@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <8c60e0dc-531a-47d6-9c40-ea157a24da1b@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uObcWWm6XyFhKkk3qlhUpw4rlLOiNU71
X-Proofpoint-ORIG-GUID: uObcWWm6XyFhKkk3qlhUpw4rlLOiNU71
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130011



On 12/13/2024 2:19 AM, Konrad Dybcio wrote:
> On 10.12.2024 4:15 AM, Jie Gan wrote:
>> Add binding file to specify how to define a Coresight TMC
>> Control Unit device in device tree.
>>
>> It is responsible for controlling the data filter function
>> based on the source device's Trace ID for TMC ETR device.
>> The trace data with that Trace id can get into ETR's buffer
>> while other trace data gets ignored.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>> ---
> 
> [...]
> 
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,sa8775p-ctcu
> 
> I don't think anyone asked that question.. Is the TMCCU something unique
> to Qualcomm platforms?

Yes, only presents on Qualcomm platforms. That's why we try to upstream 
the driver.

> 
> Konrad

Thanks,
Jie


