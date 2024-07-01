Return-Path: <linux-arm-msm+bounces-24783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A08DB91DA4B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 10:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D2552846AB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 08:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F108287E;
	Mon,  1 Jul 2024 08:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bZ7vvwIK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97737839F1;
	Mon,  1 Jul 2024 08:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719823464; cv=none; b=HqlCLwtnu0cAVcYkIdFaAisVlNOxE33yRQJRLMr6uXxomC593jIAfUmrrMcskAuThdmIrd1h4n/xFdc/rnHsqtlBuq0WsAPS8qNEcxFgRQE5MIeUXNtzajueLJlxRkHLj7sg39Q7yYwG8TXn7GJ4gCha1ntVAPLDtsilYzGDLQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719823464; c=relaxed/simple;
	bh=+vlk8azM+EIZQDbFhqp6+PgLmCpcYQhNC+D/yVuO05I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZCyKor/hycT83hjmW3Pfw8wyvG2XbchzMJmmY/126f6M4nGS3oB8Cii9lVVyUGLGkRocpXVKmivSroBJ+ifdwAPe0ByoIvDSdSG1DjZaad8SW4hxk0BQtp4qjbjDOhfab6gr53x0cN9RpUVau5Iy0oaVmnHjHsUVdDEHUykNXwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bZ7vvwIK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45UNdVH6022334;
	Mon, 1 Jul 2024 08:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F0cUVYf/QbqCxJ+AG52zUWqfQ/UlIy9CuK9k88pkiBA=; b=bZ7vvwIKDhOgnDOX
	+Q1N41HEAyHaX18HHdbruMD7VHiOStkebp6+ZfOvzuNO2J24y3C8XQJI12jX98yJ
	uTAzUn3NoEGScka/rvW4KtMqb1CABI3SjOqQpsMf/hUw2mw2U2nzD6J3JcbbAJxw
	U+Qc901yA4eQTULbkD4PXWFI4zfNtO6/pNFCegBNRNwqh3Z5ysPownsNZt8+SXfd
	6wqY2Mq8GiqOd1qpli3YgVR3nCz0+wH3oNm0mL2pX0hv4gGi+ziQsag4MnZUbTuA
	omKbhvjK8/5mh1fppmc8Yyf8X8mRjvuXwATisaTSytskcmHv8ze28nCsn4lPGg8c
	Wxd9yg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 402abtkhka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 08:44:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4618iDrU021083
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Jul 2024 08:44:13 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 1 Jul 2024
 01:44:08 -0700
Message-ID: <854f324d-c9dc-affc-6f6f-0219bcbc1e1b@quicinc.com>
Date: Mon, 1 Jul 2024 14:14:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC 4/7] soc: qcom: Utilize qcom scmi vendor protocol for bus
 dvfs
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <sudeep.holla@arm.com>,
        <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <jassisinghbrar@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_rgottimu@quicinc.com>,
        <quic_kshivnan@quicinc.com>, <conor+dt@kernel.org>,
        Amir Vajid
	<avajid@quicinc.com>
References: <20240117173458.2312669-1-quic_sibis@quicinc.com>
 <20240117173458.2312669-5-quic_sibis@quicinc.com>
 <7e48e51e-e16a-41b9-800d-960c627b8da6@linaro.org>
 <d24a3372-8ee5-528d-09ac-86c64f0896e5@quicinc.com>
 <027b9ba8-20b7-4d20-8128-156398f21902@linaro.org>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <027b9ba8-20b7-4d20-8128-156398f21902@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CWScLshh2U-ioLx0yOphkktTcHPB4HGQ
X-Proofpoint-ORIG-GUID: CWScLshh2U-ioLx0yOphkktTcHPB4HGQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_07,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407010066



On 6/19/24 01:07, Konrad Dybcio wrote:
> 
> 
> On 2/12/24 11:33, Sibi Sankar wrote:
> 
> [...]
> 
> 
>>>
>>>> +            monitor->mon_type = (of_property_read_bool(monitor_np, 
>>>> "qcom,compute-mon")) ? 1 : 0;
>>>> +            monitor->ipm_ceil = (of_property_read_bool(monitor_np, 
>>>> "qcom,compute-mon")) ? 0 : 20000000;
>>>
>>> What does it even mean for a monitor to be a compute mon?
>>>
>>
>> When a monitor is marked compute-mon it means that the table is
>> followed religiously irrespective whether the instruction per miss
>> count threshold (ipm) is exceeded or not. Equivalent to having
>> a cpufreq map -> l3/DDR bw mapping upstream.
> 
> I'm sorta puzzled why the OS would even be required to program this, since
> L3/DDR/CPU frequencies are known by various stages of boot and secure 
> firmware
> too.
> 
> What happens if we omit this? Is the default configuration identical to 
> this?
> Or does it need explicit enabling?

CPUCP isn't expected to know the various ranges supported by the memory
buses it can vote on and from a sandboxing perspective one would want to
control what CPUCP has access to as well. It also can't arrive at the
exact values just from the OPP tables we pass on as well. So it doesn't
have any default values to start off with. For all these reasons, they
need explicit setting up and without it, the algorithm wouldn't function
as expected.

-Sibi

> 
> Konrad

