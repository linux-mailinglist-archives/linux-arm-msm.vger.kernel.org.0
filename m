Return-Path: <linux-arm-msm+bounces-48697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9085EA3DD4A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 15:50:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 503D03A9257
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 14:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6AE51CB332;
	Thu, 20 Feb 2025 14:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D9isSpvt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CACF18A6CF;
	Thu, 20 Feb 2025 14:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740063034; cv=none; b=YK/zRHPqFZvVibRIfbRZZ1UMndkrgx17te51k58sqHYzZGCbzLLQ8Ah7ypMASjWO4dkxybquXmoO7T9UTJ2XQNyH9o9jUFPeAo3Y1r/XcZ4UMbyX2zV/+vW72Nx6iXPaBRyUYKdeHPQNs2yy+l1hqjNWS79R9OBb1WfwS5UZF9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740063034; c=relaxed/simple;
	bh=7ODVJoWcxbVhSMxjP97wQSd4lRfo/v0mxOOLT6X5bqk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=PaC5IY6GDoXr+FJFtBk6+zRctWRtm1yM5Vwd65nvYxPifSX70Mu73snklfCJ1jSEyQ42ixJcAQ0prxp3x56gKRqd6bl/fFAJTils/7045s0wIVkPtIFnJtl6FJZOmeU8NqwPsh4icU2ciJr+anzB98tXlM7JWn0rV9l6J5eyHyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D9isSpvt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K6YqQk014997;
	Thu, 20 Feb 2025 14:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p7ZxLcaLU0fXupOi2fwh6hh7LMaX89KYoIfbFDMpISs=; b=D9isSpvtZkW2kXUg
	MU8ZaVE+gmUzqca2mlYsXtpu0XfMdeBQwQ0TBcJauEvHnutfy+GObD1/v7dPgtMr
	2Abv1z4RAox+Rm+VZ8bqoXOwfBjplIVk6/nIM9+Z3JQqSlaSFKFABLPavF2aWdn0
	OTuoYdWu/nzW6LK9/JUE4nykh82VwLImBAfUc2mfFf99gGW+XbZx09eEOUEmRg/8
	yU9yBXZgOyyZVrlQflbNqMgH7/9R7vG6VCAFLaUrJOd4FNZX1P3ZNSmFfKxt9WfA
	vxmmzDeMY2tJru2Qsq3DcV/tpieVmXXFg8y21Wzhr3iVbumA0GHwKRm3t1UuHOOU
	xJlAYA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy16dq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 14:50:17 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51KEoGD1011425
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 14:50:16 GMT
Received: from [10.253.79.77] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Feb
 2025 06:50:10 -0800
Message-ID: <877b3796-3afc-4f3e-a0f5-ec1a6174a921@quicinc.com>
Date: Thu, 20 Feb 2025 22:50:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jie Luo <quic_luoj@quicinc.com>
Subject: Re: [PATCH net-next v3 06/14] net: ethernet: qualcomm: Initialize the
 PPE scheduler settings
To: Andrew Lunn <andrew@lunn.ch>
CC: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal
	<quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>,
        "Simon
 Horman" <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Kees Cook
	<kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Philipp
 Zabel" <p.zabel@pengutronix.de>,
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <john@phrozen.org>
References: <20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com>
 <20250209-qcom_ipq_ppe-v3-6-453ea18d3271@quicinc.com>
 <f8d30195-1ee9-42f2-be82-819c7f7bd219@lunn.ch>
Content-Language: en-US
In-Reply-To: <f8d30195-1ee9-42f2-be82-819c7f7bd219@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UqlydHCOZGvsAx6NFK3-EGLfOY31OCHO
X-Proofpoint-ORIG-GUID: UqlydHCOZGvsAx6NFK3-EGLfOY31OCHO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_06,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502200106



On 2/11/2025 9:32 PM, Andrew Lunn wrote:
>> +/* Scheduler configuration for the assigning and releasing buffers for the
>> + * packet passing through PPE, which is different per SoC.
>> + */
>> +static const struct ppe_scheduler_bm_config ipq9574_ppe_sch_bm_config[] = {
>> +	{1, 0, 0, 0, 0},
>> +	{1, 1, 0, 0, 0},
>> +	{1, 0, 5, 0, 0},
>> +	{1, 1, 5, 0, 0},
>> +	{1, 0, 6, 0, 0},
>> +	{1, 1, 6, 0, 0},
>> +	{1, 0, 1, 0, 0},
>> +	{1, 1, 1, 0, 0},
> 
> Rather than add a comment what it is, add a comment what it means.

Sure, I will enhance the comment to describe the functionality for
this table better.

> 
> It also looks like the first, 3 and 4 value are fixed, so do they even
> need to be in the table? And the second value flip-flops?
> 
> 	Andrew

This array is defined to closely reflect the layout of the scheduler
BM configuration table in the PPE hardware. The value at index 0
indicates whether the entry is valid or not. In this case (for IPQ9574),
all the entries are marked as 'enabled', but for a different IPQ SoC,
some of these entries may be marked as disabled (Note: the table
structure is same for all IPQ SoCs that support PPE).

The values at index 3 and 4 indicate whether there is any backup port
configured for assigning these buffers, in the case when the primary
port is down. This option is disabled by default by the hardware
for this SoC and hence the values are marked '0'.

The value at index 1 flip flops, because for the same port, we have two
entries - one for ingress port buffer assignment (value 0) and one for
egress port buffer release (value 1).

The value at index 2 is the port number.

As a general rule, we have tried to keep the data structure definition
accurately mirror the hardware table design, for easier understanding
and debug ability of the code.

I will change the values of array index 0/1/3 to true/false to make it
more readable, thanks.

