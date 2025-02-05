Return-Path: <linux-arm-msm+bounces-46921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CA8A2850B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 08:45:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E0007A3648
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 07:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3BE2288C8;
	Wed,  5 Feb 2025 07:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DEw6oHGR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396EE21765E;
	Wed,  5 Feb 2025 07:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738741516; cv=none; b=U76qrlogWLsMj5s+T8gY9y+2GKckVDGt0WjcMZ1Me5mW7/7zebz6jSgGk6Ns2dFa5f/fHJ3APjWnDGySP3tY/ma9okntedCoqWOwxfo1p+fbIgr1sURcfzepAVIdIvpIN+fRQ+vYsMUCAVqE+e0Ny9drrxprQdWbJkiZIGTMFJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738741516; c=relaxed/simple;
	bh=v4EryWRRwymGava8FsQGIfQOwWC83qYo9hDAvdNk4rs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=niWWqfOKfqh4MGiUBbAiF5hmTFLMkKHMjHMCRxDidIgTUWVU7g0vU5HmNT+lXGjjT/uVll7OBwvbRGrQIUFqQHygnKky0kyblkdyvUeEqNV2Wfo+HYseQYRmomyZUeXJrb8s7olqFbGoMghsVmh33O+0qO4283W6bmakA9gY2fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DEw6oHGR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51503gGF004701;
	Wed, 5 Feb 2025 07:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K/K//dAWi6x+8KI7nlUs8PdklqseAGDqAT8TYyRKscE=; b=DEw6oHGRj2+ImEKw
	G9YVbnetNysHtQTN3sWVZbM4lCNnJopdGrgLEmv544RdTaQWhF7avpahc8VDbsUa
	KVECXBzMireQs3tFb1T8K2+2Ay4jFqtcjq8DB2OAeucczgc7qzvB6C3lztZm+rGf
	5cGoHkHH9aIpoYiGcyfH1/sqgMiZ2xOpwsUhV9jj7yQgK5L3aIHV7YyBe+HtO9R6
	jHFWrWOMWXWR7epNqKvw+zL+s4o33GIa6QrDSoR576di3UUQH8c3xCcv6J08/sv5
	G74JUiWFDq6eyNbgqvLpSC3EqX1diZUgpAY5bw2cTCSl7Gu3UH+D0BNd2Q17kpAD
	QdVTtw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kw440tqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 07:44:51 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5157iooi005024
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Feb 2025 07:44:50 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Feb 2025
 23:44:45 -0800
Message-ID: <d32b7b8f-fc23-4bef-bcd7-b519c43dc77e@quicinc.com>
Date: Wed, 5 Feb 2025 15:44:43 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] coresight: Alloc trace ID after building the path
From: Jie Gan <quic_jiegan@quicinc.com>
To: James Clark <james.clark@linaro.org>
CC: <quic_tingweiz@quicinc.com>, <quic_jinlmao@quicinc.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <suzuki.poulose@arm.com>,
        <mike.leach@linaro.org>, <alexander.shishkin@linux.intel.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>
References: <d5332d6d-237f-4b78-9eaf-2619bd97b7bd@quicinc.com>
 <20250131163617.1730505-1-james.clark@linaro.org>
 <33302e34-2e13-4bda-ae44-4c111167dde5@quicinc.com>
Content-Language: en-US
In-Reply-To: <33302e34-2e13-4bda-ae44-4c111167dde5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gb3Cl6UXuJMToHYAiGtfMCqC5mwkq828
X-Proofpoint-ORIG-GUID: gb3Cl6UXuJMToHYAiGtfMCqC5mwkq828
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_03,2025-02-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502050060



On 2/5/2025 12:13 PM, Jie Gan wrote:
> 
> 
> On 2/1/2025 12:36 AM, James Clark wrote:
>> Proof of concept to support CTCU device. Applies to Jie's patchset in
>> the parent email. I think this would be a good simplification, it
>> removes some code and makes things a bit clearer, and works for both the
>> old and new CTCU requirements. It will require merging into the parent
>> patchset somehow as it undoes some of those changes.
> Hi, James
> 
> I tested the patch series and it works well.
> 
> Can I combine these patchsets with mine with co-developed tag?
> Or are you prefer to submit them independently?
> 
> I believe it would be easier to read if we combined the codes together.

Hi, James

Please ignore my questions here. I missed the last paragraph of the 
description.

I merged your codes with mine and added co-developed and SOB tag.

Sorry for the mistake.

Thanks,
Jie

> 
>>
>> James Clark (3):
>>    coresight: Don't save handle in path
>>    coresight: Export coresight_get_sink()
>>    coresight: Alloc trace ID after building the path
>>
>>   drivers/hwtracing/coresight/coresight-core.c  | 107 +++++++++++++-----
>>   drivers/hwtracing/coresight/coresight-dummy.c |   9 +-
>>   drivers/hwtracing/coresight/coresight-etb10.c |   8 +-
>>   .../hwtracing/coresight/coresight-etm-perf.c  |  20 ++--
>>   drivers/hwtracing/coresight/coresight-etm.h   |   1 -
>>   .../coresight/coresight-etm3x-core.c          |  84 ++------------
>>   .../coresight/coresight-etm3x-sysfs.c         |   3 +-
>>   .../coresight/coresight-etm4x-core.c          |  83 ++------------
>>   .../coresight/coresight-etm4x-sysfs.c         |   4 +-
>>   drivers/hwtracing/coresight/coresight-etm4x.h |   1 -
>>   drivers/hwtracing/coresight/coresight-priv.h  |  17 +--
>>   drivers/hwtracing/coresight/coresight-stm.c   |   5 +-
>>   drivers/hwtracing/coresight/coresight-sysfs.c |   6 +-
>>   .../hwtracing/coresight/coresight-tmc-etf.c   |   9 +-
>>   .../hwtracing/coresight/coresight-tmc-etr.c   |  13 +--
>>   drivers/hwtracing/coresight/coresight-tmc.h   |   2 +-
>>   drivers/hwtracing/coresight/coresight-tpda.c  |   3 +-
>>   drivers/hwtracing/coresight/coresight-tpdm.c  |   3 +-
>>   drivers/hwtracing/coresight/coresight-tpiu.c  |   2 +-
>>   drivers/hwtracing/coresight/coresight-trbe.c  |   4 +-
>>   drivers/hwtracing/coresight/ultrasoc-smb.c    |   8 +-
>>   include/linux/coresight.h                     |  25 +++-
>>   22 files changed, 159 insertions(+), 258 deletions(-)
>>
> 
> 


