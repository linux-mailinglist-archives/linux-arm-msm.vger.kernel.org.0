Return-Path: <linux-arm-msm+bounces-50302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE23CA4F400
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 02:40:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 669EC1890B47
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 01:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1C2D1519A8;
	Wed,  5 Mar 2025 01:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hnpSOT8o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9AA26AFC;
	Wed,  5 Mar 2025 01:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741138817; cv=none; b=fr/2YoMhHPgi6xJ+0+uDKiyZMx6uDlmw+GR14E5nU4QhuuEBhgKYSFcuA502tegCs+RDL6GJewAp+wJ2nSFuA13rgCML35ti8pHVKTdU+nGJXiB80WgRo6ewcO9zjvb69IMw2AemLUKy/ZlBBlo1mz6R513duAJ8IdRHpxkRIMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741138817; c=relaxed/simple;
	bh=KUIYRJ0FB7uctHIDx0chIWbJKrcDx7PXtdgf/xQ5Ck4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OX9WrQq9Xvk7a2RHuj57bm9Fcqld+dWAejUDQj0DO+l8me5pgbejnPmF5WA3UQEU+vbU1jX/fqvxxhM5tpYMVUK2E1Qer8A/AuCZ8K+9EuWr1RGj1TruPvceWUdPX38yboMNLxT9YNHGaUxkm1HaQfIVSo5hkQO7jfe44K8AqA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hnpSOT8o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524NA3GP022009;
	Wed, 5 Mar 2025 01:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u9vvkvyV4t5XH40aBxvK8nQrrgwumF6fOch6vU0Td0k=; b=hnpSOT8o8cUUub4d
	5g+BxaD/H+jCy93jgyKHX9i/9tAySMmKIbTkGUX0B68KBm2JSdwqrbWByuauU44G
	GXQAJHalZo2tD80F/joslbM6SwXIi5fZmX8eICoBX6KicDxkxQ5Tf2oFKuEAJHFz
	xXR6t8Ihq9e8MZ4fqBZlhd230FrcF90hvYD6S6rUIqzEPsuTV2Xsk7xNmKPwpeUN
	UgF1G3ljvCseW1FHfub4G92B4SR9NwlTSZbbt/mlO8gnwm3m7MUYUvIDnAUKN5GQ
	OJwbkgsbK2+RyFAGE8FyI1aK8RUCuZckWl9U7SVniy9ws/ut0oBBMUjtkXHx0Thd
	H1DZ9Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6t3rgb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 01:39:53 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5251drEg032134
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 01:39:53 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Mar 2025
 17:39:48 -0800
Message-ID: <2ab83252-fe17-489c-b103-28ce769123a3@quicinc.com>
Date: Wed, 5 Mar 2025 09:39:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 09/10] Coresight: Add Coresight TMC Control Unit
 driver
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
 <20250303032931.2500935-10-quic_jiegan@quicinc.com>
 <1b05e832-6d41-463a-a52a-6ff340d0d6f8@arm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <1b05e832-6d41-463a-a52a-6ff340d0d6f8@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: olhOWdusO9i-OZhGYmJNpEUPDrL-OFAR
X-Authority-Analysis: v=2.4 cv=P5XAhjAu c=1 sm=1 tr=0 ts=67c7ab69 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=73M6xUdCWGYtzQJonWAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: olhOWdusO9i-OZhGYmJNpEUPDrL-OFAR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_01,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 mlxlogscore=846 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050011



On 3/4/2025 10:59 PM, Suzuki K Poulose wrote:
> On 03/03/2025 03:29, Jie Gan wrote:
>> The Coresight TMC Control Unit hosts miscellaneous configuration 
>> registers
>> which control various features related to TMC ETR sink.
>>
>> Based on the trace ID, which is programmed in the related CTCU ATID
>> register of a specific ETR, trace data with that trace ID gets into
>> the ETR buffer, while other trace data gets dropped.
>>
>> Enabling source device sets one bit of the ATID register based on
>> source device's trace ID.
>> Disabling source device resets the bit according to the source
>> device's trace ID.
>>
>> Reviewed-by: James Clark <james.clark@linaro.org>
>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> 
> ...
> 
>> --- /dev/null
>> +++ b/drivers/hwtracing/coresight/coresight-ctcu.h
>> @@ -0,0 +1,39 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All 
>> rights reserved.
>> + */
>> +
>> +#ifndef _CORESIGHT_CTCU_H
>> +#define _CORESIGHT_CTCU_H
>> +#include "coresight-trace-id.h"
>> +
>> +/* Maximum number of supported ETR devices for a single CTCU. */
>> +#define ETR_MAX_NUM     2
>> +
> 
> WARNING: please, no space before tabs
> #413: FILE: drivers/hwtracing/coresight/coresight-ctcu.h:11:
> +#define ETR_MAX_NUM ^I2$
> 
> total: 0 errors, 2 warnings, 397 lines checked
> 
> Another checkpatch warning. Please take care in the future.
> 
> Suzuki

Hi Suzuki,

Got it. Will take care in the future. Thanks for help to deal with them 
this time.

Jie

> 
> 


