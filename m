Return-Path: <linux-arm-msm+bounces-44754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBF4A09608
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 16:41:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4B3E188BC96
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 15:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B2E211A3F;
	Fri, 10 Jan 2025 15:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oH6A0g0j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691E7211A06;
	Fri, 10 Jan 2025 15:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736523639; cv=none; b=d283xOZowJYa4OxT4bBzzlkkXm9cQwSWRzJ4cV+SwuK6CN70cJIAWQXMJNrJouJ84nhcXi3yed6KS3jyxbOJKNJgob4E6XZ7tSVSSkFdibgSLpy+jTcdIQ3CTSD1QWX91tBJWVy/m/r/d/xopHVrUVz6pHtNcYPZHqj14vvu2qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736523639; c=relaxed/simple;
	bh=GPLAZ2xw6XCiGcekAiOYe3K0sLZgwXJ7P3mibRgrRK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KvpT9g18T2YlwLK9aJXDVOKv+rgyS+HLtWyXb+x2MwbyFsz5boHmUTO9dnMF+LgaUQ0eD9VpjGV/985E9MEzVNqgD5kR8k0Ou2O2iibKYSqKAa4MMuwImJMlrDi3tjBsvTzhUPEjUNw1PGiKGvbHzwBxQ0XJMZQvcPJriR7VqEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oH6A0g0j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50ABEbLe029427;
	Fri, 10 Jan 2025 15:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tfc7VHD11bAES9Uu7pJnWNE0irlgE3NaUIN/A+R7P2Q=; b=oH6A0g0jv2GNf3fR
	cm9CvrUBk7+K6WcXqRYHTDFHRQzp8Kube9fhCxbIBL/ZGe+oNwYxmSLkzYyc14ZJ
	DxJmf+NvSJZRKbAT/UTfsRtyteCvi4TKYVgWrXBO+t282ferxMCTIfRIO++pF0oD
	DEJYLWU3OxpOQuZ9Y++EZC6AexntlkKD9Ch1NC+abSxBZAxZHYkBJbtvoddZ1y8s
	UZ3LgIUivb3VSc12Cp1YbMzw1cNpAcvJY1IRFGeC9xxT1HuDYIifJ6FiCEm2Dc1X
	1qlXrnWYl3/sP+QcFxNVDWOzPv3Y9HHZX4FJy5f7RhidPs2uBbzDTHkjSjO/NI5q
	S4VspQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4432gq0qu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 15:40:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50AFeMab013031
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 15:40:23 GMT
Received: from [10.253.12.10] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 Jan
 2025 07:40:17 -0800
Message-ID: <caf8bc02-ef31-4426-a362-06d97d4626fd@quicinc.com>
Date: Fri, 10 Jan 2025 23:40:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 06/14] net: ethernet: qualcomm: Initialize the
 PPE scheduler settings
To: Simon Horman <horms@kernel.org>
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
        "Jonathan
 Corbet" <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva"
	<gustavoars@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <john@phrozen.org>
References: <20250108-qcom_ipq_ppe-v2-0-7394dbda7199@quicinc.com>
 <20250108-qcom_ipq_ppe-v2-6-7394dbda7199@quicinc.com>
 <20250109174234.GO7706@kernel.org>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <20250109174234.GO7706@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: w_lemBygddxVriNFIsgakhHdNkL2g3dQ
X-Proofpoint-ORIG-GUID: w_lemBygddxVriNFIsgakhHdNkL2g3dQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100123



On 1/10/2025 1:42 AM, Simon Horman wrote:
> On Wed, Jan 08, 2025 at 09:47:13PM +0800, Luo Jie wrote:
>> The PPE scheduler settings determine the priority of scheduling the
>> packet across the different hardware queues per PPE port.
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>> ---
>>   drivers/net/ethernet/qualcomm/ppe/ppe_config.c | 789 ++++++++++++++++++++++++-
>>   drivers/net/ethernet/qualcomm/ppe/ppe_config.h |  37 ++
>>   drivers/net/ethernet/qualcomm/ppe/ppe_regs.h   |  97 +++
>>   3 files changed, 922 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
> 
> ...
> 
>> +/**
>> + * ppe_queue_scheduler_set - Configure scheduler for PPE hardware queue
>> + * @ppe_dev: PPE device
>> + * @node_id: PPE queue ID or flow ID
>> + * @flow_level: Flow level scheduler or queue level scheduler
>> + * @port: PPE port ID set scheduler configuration
>> + * @scheduler_cfg: PPE scheduler configuration
>> + *
>> + * PPE scheduler configuration supports queue level and flow level on
>> + * the PPE egress port.
>> + *
>> + * Return 0 on success, negative error code on failure.
> 
> Nit: The tooling would prefer this last line formatted as;
> 
>      * Return: ...
> 
> or
> 
>      * Returns: ...
> 
> Flagged by ./scripts/kernel-doc -none -Wall

OK, I will update the kernel-doc comments and run the kernel-doc to
verify proper formatting of the documentation comments on all patches.

> 
>> + */
>> +int ppe_queue_scheduler_set(struct ppe_device *ppe_dev,
>> +			    int node_id, bool flow_level, int port,
>> +			    struct ppe_scheduler_cfg scheduler_cfg)
>> +{
>> +	if (flow_level)
>> +		return ppe_scheduler_l1_queue_map_set(ppe_dev, node_id,
>> +						      port, scheduler_cfg);
>> +
>> +	return ppe_scheduler_l0_queue_map_set(ppe_dev, node_id,
>> +					      port, scheduler_cfg);
>> +}
> 
> ...

