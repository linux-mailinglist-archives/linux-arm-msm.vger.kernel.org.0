Return-Path: <linux-arm-msm+bounces-44753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 012B9A095F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 16:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 597E73AA179
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 15:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9A62116E7;
	Fri, 10 Jan 2025 15:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XcU7fE4K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EF61FA15C;
	Fri, 10 Jan 2025 15:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736523551; cv=none; b=X+Dpp6KUx97jRiYkydki2Mpwa6oi2jIQiWohLSfcO99m8+tTq8b5vDne1j8o0ZxEAWgZ84IwJGE4qrtClo6NBHTkAR3x6kOOqldqW3UoxlrjDFTzz/CRhZKa3/SxsCOWQ9ElI3ZFJDc9UU6d8lv48fKyi4AvGB7WwnSl5AWydJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736523551; c=relaxed/simple;
	bh=pLuT3k/XsIf83YUI+692l74ezRgrNgOooqrI+cvuQXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AVQj194PzlRor6Qykoz3nmVRyluZV+24iRt+0PMpu5qHGIX4IW+R/o9MYcwI/xYpZfc5B3K6+BcMhNhGlhaUjkVmS1HF9OoidRQw8SNLuk4fxbJM7zEwtUjE4WQfDsFHZeVAXa9kCS8lCBLf9yr8HYB14+DzuS4yUajlw/ZmEcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XcU7fE4K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50ACLpn2004309;
	Fri, 10 Jan 2025 15:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	alwlknAfMQ9FAtZGikZGP2VWG6979GojMCrf72DktHs=; b=XcU7fE4KfNuZngZ4
	u4c4RMWsjQ+DZ05rm0Z0QEu9nY3o3QcTpvkPHRa7GYMA2V9p+5uwRUaXZKgj5Z5J
	0O5hNYJQKgGavG+Zk0JArSmcwhStWziclARYbPeonpvbnUvqIfL4oVFVZl9JUTqr
	KZ86QwMsPcsuVIBhFgKhgqeM6bmGoJlr+YrNVjiOES4Dn7ktDlIr8RMPGrdDcQjS
	2/tz0UxzyceBiIYdhBuReFeGoB4SchAXLjC+OfnhEGPuziYvtHgnXz1/vE71mo4R
	lou7lmw8Y7gKgVAjakeq2RjSBiwc9nnsUfSy5uIymFfD+CCXLxEs7DRglTswpXXl
	2K1R3w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4433g0rj9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 15:38:53 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50AFcr1u021046
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 15:38:53 GMT
Received: from [10.253.12.10] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 Jan
 2025 07:38:47 -0800
Message-ID: <5b3c2bde-ad41-4a53-bc55-2fd24c6730c9@quicinc.com>
Date: Fri, 10 Jan 2025 23:38:44 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 07/14] net: ethernet: qualcomm: Initialize PPE
 queue settings
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
 <20250108-qcom_ipq_ppe-v2-7-7394dbda7199@quicinc.com>
 <20250109175200.GP7706@kernel.org>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <20250109175200.GP7706@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CAlY-YIGO685E5DfZrxDiffzY10S4ZSB
X-Proofpoint-ORIG-GUID: CAlY-YIGO685E5DfZrxDiffzY10S4ZSB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501100123



On 1/10/2025 1:52 AM, Simon Horman wrote:
> On Wed, Jan 08, 2025 at 09:47:14PM +0800, Luo Jie wrote:
>> Configure unicast and multicast hardware queues for the PPE
>> ports to enable packet forwarding between the ports.
>>
>> Each PPE port is assigned with a range of queues. The queue ID
>> selection for a packet is decided by the queue base and queue
>> offset that is configured based on the internal priority and
>> the RSS hash value of the packet.
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>> ---
>>   drivers/net/ethernet/qualcomm/ppe/ppe_config.c | 357 ++++++++++++++++++++++++-
>>   drivers/net/ethernet/qualcomm/ppe/ppe_config.h |  63 +++++
>>   drivers/net/ethernet/qualcomm/ppe/ppe_regs.h   |  21 ++
>>   3 files changed, 440 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
> 
> ...
> 
>> @@ -673,6 +701,111 @@ static struct ppe_scheduler_port_config ppe_port_sch_config[] = {
>>   	},
>>   };
>>   
>> +/* The scheduler resource is applied to each PPE port, The resource
>> + * includes the unicast & multicast queues, flow nodes and DRR nodes.
>> + */
>> +static struct ppe_port_schedule_resource ppe_scheduler_res[] = {
>> +	{	.ucastq_start	= 0,
>> +		.ucastq_end	= 63,
>> +		.mcastq_start	= 256,
>> +		.ucastq_end	= 271,
> 
> Hi Luo Jie,
> 
> This appears to duplicate the initialisation of .ucastq_end.
> Should the line above initialise .mcastq_end instead?
> 
> Likewise for other elements of this array.
> 
> Flagged by W=1 builds with both clang-19 and gcc-14.

Thanks for pointing to this. I will update the code and build the
patches with latest GCC version gcc-14 flagged by W=1 to check the
patches.

> 
>> +		.flow_id_start	= 0,
>> +		.flow_id_end	= 0,
>> +		.l0node_start	= 0,
>> +		.l0node_end	= 7,
>> +		.l1node_start	= 0,
>> +		.l1node_end	= 0,
>> +	},
>> +	{	.ucastq_start	= 144,
>> +		.ucastq_end	= 159,
>> +		.mcastq_start	= 272,
>> +		.ucastq_end	= 275,
>> +		.flow_id_start	= 36,
>> +		.flow_id_end	= 39,
>> +		.l0node_start	= 48,
>> +		.l0node_end	= 63,
>> +		.l1node_start	= 8,
>> +		.l1node_end	= 11,
>> +	},
> 
> ...
> 
>> +};
> 
> ...


