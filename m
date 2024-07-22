Return-Path: <linux-arm-msm+bounces-26788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FE6938D8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 12:35:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C98C0280D9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 10:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB1216A39E;
	Mon, 22 Jul 2024 10:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Mj9aKqcX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A793234;
	Mon, 22 Jul 2024 10:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721644520; cv=none; b=o97P44KH6C6SZurb1AL9BoPlWgTnf4rQGzhXFzlDwvfZf/oUCqnzb9ghc5dlR7r/2/ZY15DatvrwSiXmiSehz0Qn5O5GDeRHmCsPKsNx374sGN/f/KIcKJe2drcX4dftIdnGl97ox+hEzEYBLCqtCNujEdVeGt7yhvUz+L+j9ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721644520; c=relaxed/simple;
	bh=D7hVRLYfxkch1U1mtSpiAIE5Iff35/q9e/U0R4Lh5oA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KUFm2faypuZH47oSQb1maNzwxfXAkkWynJGPDt1I/aBTsVsehs8H3aOiiy6NRSneSnosz+Sx8oq0+zXyOdAih0rVAEpSuQb1ScLHI0cz23erKnwm5A+f+kqoQCr9QByyARzO2oRZXGFwPPuIhKJuitOSx0/h5RqmgnsVPks1o0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Mj9aKqcX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46M0Drod012212;
	Mon, 22 Jul 2024 10:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Zj27V7JTwoD0SUx9EXR9+qKQSy89DA4nYKIcLU0tdI=; b=Mj9aKqcX5g4cx4Ji
	B93jWhPgqKKhWo9r/82mx7HzBxwEo2Xic8QG7jDvvdWhahzaINZw8gDUGZXVUet7
	FohqkDqb1NZZOnm3Kuz+uVEmpA+W4BaRTtYqfadc5rW1U1KYdKY1QYoTmg9zrPKq
	/xbDzsHSGUYACDE8VXBbwS1QDVSb+r/xUXyTC0PpNn5dY3MVJkkFvBfvYrW61RXx
	W9J5nPAic+iaEad1/iJTEFnpIHCHFni0B6tE6tO6XiumsWLviFBXSYfcyVeIXhVp
	TACU4knATFEvqvbxmZVwUHxzoOfsC20iKWrXC44o/esf4eQLOMyHICihqkUlOOgP
	tKpK7g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g5m6uebc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 10:35:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46MAYxZg018256
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 10:34:59 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Jul
 2024 03:34:56 -0700
Message-ID: <bbfb3ab2-1b59-4e84-bdff-a150b0393378@quicinc.com>
Date: Mon, 22 Jul 2024 18:34:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] coresight: Add preferred trace id support
To: Mike Leach <mike.leach@linaro.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark
	<james.clark@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        "Tingwei
 Zhang" <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang
	<quic_yuanfang@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>,
        songchai
	<quic_songchai@quicinc.com>
References: <20240626060724.28862-1-quic_jinlmao@quicinc.com>
 <CAJ9a7VhG4qNLnT87J7OiXpygbtMRZ8uAvNhZhcRCBxovMEPDEg@mail.gmail.com>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <CAJ9a7VhG4qNLnT87J7OiXpygbtMRZ8uAvNhZhcRCBxovMEPDEg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PvBxoxGpQ_XelUOUq5HNNU0_df6cCoP2
X-Proofpoint-ORIG-GUID: PvBxoxGpQ_XelUOUq5HNNU0_df6cCoP2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_06,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407220081



On 2024/7/18 23:57, Mike Leach wrote:
> Hi,
> 
> I have detailed comments in the following patches but in summary we should:
> 1) consistently use the term "static trace id" for these devices where
> the hardware sets a non-programmable trace ID
> 2) Simplify the patch set by introducing a new API function
> int coresight_trace_id_get_system_static_id(int trace_id)
> This would avoid having to change drivers which use the existing
> function where no static ID is required.
> 

Thanks for the comments, Mike.
I will address your comments in next version.

Thanks
Jinlong Mao

> Regards
> 
> Mike
> 
> 
> On Wed, 26 Jun 2024 at 07:07, Mao Jinlong <quic_jinlmao@quicinc.com> wrote:
>>
>> Some HW has static trace id which cannot be changed via
>> software programming. For this case, configure the trace id
>> in device tree with "arm,trace-id = <xxx>", and
>> call coresight_trace_id_get_system_id with the trace id value
>> in device probe function. The id will be reserved for the HW
>> all the time if the device is probed.
>>
>> Changes since V2:
>> 1. Change "trace-id" to "arm,trace-id".
>> 2. Add trace id flag for getting preferred id or ODD id.
>>
>> Changes since V1:
>> 1. Add argument to coresight_trace_id_get_system_id for preferred id
>> instead of adding new function coresight_trace_id_reserve_system_id.
>> 2. Add constraint to trace-id in dt-binding file.
>>
>> Mao Jinlong (3):
>>    dt-bindings: arm: Add arm,trace-id for coresight dummy source
>>    coresight: Add support to get preferred id for system trace sources
>>    coresight: dummy: Add reserve atid support for dummy source
>>
>>   .../sysfs-bus-coresight-devices-dummy-source  | 15 +++++
>>   .../arm/arm,coresight-dummy-source.yaml       |  6 ++
>>   drivers/hwtracing/coresight/coresight-dummy.c | 59 +++++++++++++++++--
>>   .../hwtracing/coresight/coresight-platform.c  | 25 ++++++++
>>   drivers/hwtracing/coresight/coresight-stm.c   |  2 +-
>>   drivers/hwtracing/coresight/coresight-tpda.c  |  2 +-
>>   .../hwtracing/coresight/coresight-trace-id.c  | 35 +++++++----
>>   .../hwtracing/coresight/coresight-trace-id.h  | 11 +++-
>>   include/linux/coresight.h                     |  1 +
>>   9 files changed, 137 insertions(+), 19 deletions(-)
>>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source
>>
>> --
>> 2.41.0
>>
> 
> 
> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK

