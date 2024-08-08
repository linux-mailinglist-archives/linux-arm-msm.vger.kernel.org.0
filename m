Return-Path: <linux-arm-msm+bounces-28128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7C994B40E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 02:17:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA9E21C21065
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 00:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A75710E9;
	Thu,  8 Aug 2024 00:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VGW7l2S5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B91633D5;
	Thu,  8 Aug 2024 00:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723076244; cv=none; b=oQQ/U4UkuWsGPdrFC9amXs/k4tx95SdBEHhnxGN5KR0Z1/HwVI7nNDzQarRsmQvcRXeNyMZWQ84cZviwoZr7FFQj0lj1g5skjAXGY+ghBv6LAwr7wJpSsEFsZoGhmPSxspaV5o1OyvpN2bAHabtxXaZ5BpE7OBadpaL5gGgmjd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723076244; c=relaxed/simple;
	bh=6YbU9hMbNaZvymkd3XCUiSbv+Z7i0Zpk+Fql9bVOppM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aYUJZZmFsHfA6DSXJjyXXOGbDFaIZ4tFGzReu3YLj9YUnuPfyIIG8UcoEDZahKsGOPzdtDvWg5PT5Uvlm9eAMlB0KEfPPAe4osJ2pgBZz3qIsC4VidWbkCXD9TY9qdeASuzvBsU0tAnSdMbWhMCV1I1uGZRbQJKrI7uu6w+1U9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VGW7l2S5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 477K0WW3018981;
	Thu, 8 Aug 2024 00:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cr+3Y+YO9Zn/uOS+ypiYeC7bbRLQIrLN3WkyWVWHQo4=; b=VGW7l2S5aZIiDcEd
	Vm6mh1Q5K2R6iCEPM5vUmuanBlum2F3ju8nn7zq1BRmRy7xLC2B7rk5pLDoLLXm7
	ye5CUVmQ9IfD6fv8ddDk2zWxf4T1NVgZYWnOFmOodizuoMPtkFqnx3JpnSuFibyD
	r45UxcHbesu5ZcQlxAVUg7TN3gRCYBzYETU5kJI352r22vO7xSbE8OhPP2+FB5TB
	BvQIh0eY+fwhJ8V4+8/vAky78mNIkzu542pKJIoMSkGSXWb+BE9gimZjTAiiCaDp
	TBPBUtzH7aDOTzekbY2VdEk3BUJp+mdBRs4SyIT6qSoA01+QhDJjGjrctWb7sb8W
	1nXBrA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40u4cpq354-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Aug 2024 00:17:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4780HIwu014528
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Aug 2024 00:17:18 GMT
Received: from [10.71.112.173] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 Aug 2024
 17:17:17 -0700
Message-ID: <32f201b8-c0c6-42cd-b9f7-8a8abb33eccc@quicinc.com>
Date: Wed, 7 Aug 2024 17:17:17 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] rpmsg: glink: Introduce packet tracepoints
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240805-glink-tracepoints-v1-0-a5f3293fb09e@quicinc.com>
 <20240805-glink-tracepoints-v1-3-a5f3293fb09e@quicinc.com>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <20240805-glink-tracepoints-v1-3-a5f3293fb09e@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BuwhCGt_UMI4P4dY7Am2WOOxmidpt7wJ
X-Proofpoint-GUID: BuwhCGt_UMI4P4dY7Am2WOOxmidpt7wJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_14,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 mlxlogscore=962 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408080000



On 8/5/2024 8:56 PM, Bjorn Andersson wrote:
> Introduce tracepoints to allow tracing the GLINK packets being exchanged
> with other subsystems. This is useful for debugging both interaction
> with remote processors and client driver issues, as well as tracking
> latency through the communication stack.
> 
> Channel events are traced with both local and remote channel ids, as
> well as the textual representation when possible. The channel ids are
> useful when matching traces with traces from the firmware side logs,
> while the textual representation is necessary to identify channels when
> we're starting to trace an already running system.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>   drivers/rpmsg/Makefile            |   1 +
>   drivers/rpmsg/qcom_glink_native.c |  96 ++++++++-
>   drivers/rpmsg/qcom_glink_trace.h  | 406 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 501 insertions(+), 2 deletions(-)
> 

Reviewed-by: Chris Lew <quic_clew@quicinc.com>

