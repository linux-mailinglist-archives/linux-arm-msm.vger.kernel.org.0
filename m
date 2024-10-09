Return-Path: <linux-arm-msm+bounces-33669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EECF996547
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 11:26:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AB251F22992
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 09:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A22A18A6DD;
	Wed,  9 Oct 2024 09:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j0Px2J4s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A76188906;
	Wed,  9 Oct 2024 09:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728465945; cv=none; b=ZlQ/6iapJt9A3IzNuPJzURH3sBbFTpgSWmrPboeFwid7A3r1aARp/vqZJb1MGl25kYkys0TgZ9m6g3E9n5j/kKKwzBH/QqVj4AHIvPTptdUKXT8RqbU2GNH+P97T1dK2MUVVTMFBZbfruj+StBzLME52F7vtxsyl7VUA4UgjJGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728465945; c=relaxed/simple;
	bh=8Rm3CqIaUH04nch4KNzaX9ksWJukZum7GopzBindC+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GidQOTwEctSLipBG3b2e1u/Ph5gag7ngS1xRY7QT5uX3Kti3g2fNsXGyluD1Ao2yKEUCFJy3Tk6YY+/BAP+fNpn9EIdx59+TElxVi/9cfiTjS0ca3z0GoStI1/u4f/xLNFNkx2h/bbufNFut6Q2Od5YGPYuxW/NrFDa1mlMNyE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j0Px2J4s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4996OLCc029436;
	Wed, 9 Oct 2024 09:25:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LD7A2pwBFdoyVPG2zETKNHHhWYtem0o4ej8s3AoD1fw=; b=j0Px2J4s0VOf4+Mq
	hn0FlXUn1lvFQarYpMBwPwik6AJYnXjUjQF8TYA8QSXMPar/iZYLLyKtr6GehDfh
	inoT8+7HtZItxUEGKtk1t+lXpuFSfH8sXKpRtGlnQ4eqGJf+dc4qgk2D8QPcNw6R
	HJ4SupAZJfn/eRwiNHH7U5/TVc0lBoNcNPbn6BFvewW+SVAbhrc72Op5tOEUHyPz
	EfsfBEBQKOp85Ob6rKZUDPe6iO3S26vHB/5r95EDrTknSuUgob6tU6+xccb6x/D8
	NzSlXxSEx6jNg/6wnIMicXkk0RAbNYUH4i6LihNO+MUjm3gsagHtbUWcoV05EG6Q
	vqvmFQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424yj041pm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 09:25:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4999PTN4025307
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Oct 2024 09:25:29 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Oct 2024
 02:25:25 -0700
Message-ID: <bbeccf0d-b98b-41f7-b910-b3ec07d1e069@quicinc.com>
Date: Wed, 9 Oct 2024 17:25:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 RESEND 0/3] coresight: Add static trace id support
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
References: <20240910100127.8948-1-quic_jinlmao@quicinc.com>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <20240910100127.8948-1-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AKMSlgSoWUfbAhzhaxD5D6vrjZYcJO2d
X-Proofpoint-ORIG-GUID: AKMSlgSoWUfbAhzhaxD5D6vrjZYcJO2d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 clxscore=1011
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410090062



On 2024/9/10 18:01, Mao Jinlong wrote:
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


