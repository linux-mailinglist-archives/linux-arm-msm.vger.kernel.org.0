Return-Path: <linux-arm-msm+bounces-29180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F7295972C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 11:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CA02283B73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 09:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C261B3B18;
	Wed, 21 Aug 2024 08:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lfR9yU0y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889C41B3B14;
	Wed, 21 Aug 2024 08:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724228594; cv=none; b=QQlJsHWyswQ+qwXdGTpaoVaFScq3rrlYig0/E7cREu/cJKngi7h8LTWtNFHz/jRZD6ucrHxMAF6149E5z5oOYURgJivp+c9KQYCWQWd+Oc0tRGShwBHg81+v1t3UozgiJLCEswIFi45sybmfEXatsnFcrG0RX881d8BAmPQO30Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724228594; c=relaxed/simple;
	bh=jOrsVYLPT/LX5XGTID+z3HT4EhZdLtHiW4ckoAw/Cm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oQ/XZIeAWGSnEAs97uJSOPjqtdlMFdx4Oohmnye5rEZ6R2jJs7PiTNEjQimufeNqvMFSOM1C8AdD1UWTmf1syngyf0kG7hej60Fyvh2KBUlsfknS8SYblbzStV2E7imXtQSYwvPLwc6boV4ZBBITBJi7fg3pYen4peXYdVC8Yv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lfR9yU0y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47KNTcNh032576;
	Wed, 21 Aug 2024 08:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UXKkrJTTHGs8ypri51Y39362lh3BomOsU7Gl/1XJ1AE=; b=lfR9yU0yBK5izwOU
	LihKaPJWuuAodsxBhCyRauQchMh+tEmct875IO6a4s8vNQq99U+tqwZnfofhJSbV
	FiRy4RS1yp9eAI3PJWxcqgVv5NChi35iEX67Axzvem6cnjmFHJla0LK4bN0l2lZu
	aWcUjBsrScHgQ1OtsHcn4AwyGPOsq2uYn/Y11TPhzHngBYOn9Jl0mLyOX4YDWlgS
	t3traIedM87Wpwil+oRpV0lUUA5O/Zs6r2Z4NONtaTcshXe6kP9LkzYziGLPxeHb
	bDuR1X9hF0hm6pIlxkeP77hAzzbji5VUs3cVza69KqeFuWyU59tG9bSgEnkc+Zhz
	iKp3PA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4145ywe6an-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Aug 2024 08:22:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47L8MjSF028476
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Aug 2024 08:22:45 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 Aug
 2024 01:22:42 -0700
Message-ID: <0b4c9c9f-02c9-45b5-b289-046ce4785325@quicinc.com>
Date: Wed, 21 Aug 2024 16:22:40 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] coresight: Add static trace id support
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20240729071414.5410-1-quic_jinlmao@quicinc.com>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <20240729071414.5410-1-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MujMsXaiAXuekwuw2bIW6eEl6Kjilxe5
X-Proofpoint-GUID: MujMsXaiAXuekwuw2bIW6eEl6Kjilxe5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_07,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1011
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 mlxscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408210060

On 2024/7/29 15:14, Mao Jinlong wrote:
> Some HW has static trace id which cannot be changed via
> software programming. For this case, configure the trace id
> in device tree with "arm,static-trace-id = <xxx>", and
> call coresight_trace_id_get_static_system_id with the trace id value
> in device probe function. The id will be reserved for the HW
> all the time if the device is probed.
> 
> Changes since V3:
> 1. Adda new API function
> int coresight_trace_id_get_system_static_id(int trace_id).
> 2. Use the term "static trace id" for these devices where
> the hardware sets a non-programmable trace ID.
> 
> Changes since V2:
> 1. Change "trace-id" to "arm,trace-id".
> 2. Add trace id flag for getting preferred id or ODD id.
> 
> Changes since V1:
> 1. Add argument to coresight_trace_id_get_system_id for preferred id
> instead of adding new function coresight_trace_id_reserve_system_id.
> 2. Add constraint to trace-id in dt-binding file.
> 
> Mao Jinlong (3):
>    dt-bindings: arm: Add arm,trace-id for coresight dummy source
>    coresight: Add support to get static id for system trace sources
>    coresight: dummy: Add static trace id support for dummy source
> 
>   .../sysfs-bus-coresight-devices-dummy-source  | 15 +++++
>   .../arm/arm,coresight-dummy-source.yaml       |  6 ++
>   drivers/hwtracing/coresight/coresight-dummy.c | 59 +++++++++++++++++--
>   .../hwtracing/coresight/coresight-platform.c  | 26 ++++++++
>   .../hwtracing/coresight/coresight-trace-id.c  | 38 ++++++++----
>   .../hwtracing/coresight/coresight-trace-id.h  |  9 +++
>   include/linux/coresight.h                     |  1 +
>   7 files changed, 140 insertions(+), 14 deletions(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source

Hi Reviewers,

Gentle remainder for the review.

Thanks
Jinlong Mao

> 

