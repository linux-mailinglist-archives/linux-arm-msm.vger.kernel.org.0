Return-Path: <linux-arm-msm+bounces-32014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA5D97CA32
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 15:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0FAB1C22F1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 13:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B82E19E827;
	Thu, 19 Sep 2024 13:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V/QU4oHR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26EE19D8BB;
	Thu, 19 Sep 2024 13:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726752984; cv=none; b=dJ6wdpxYkTFqfCBka8+mxyxD02G+AiulAPpEksyrduFxc4Y4kTXegTabGiEheQVgBnbgERkZFrrrX2YrkHXOI8LS7N0/7yKg63sYl2yR0TtMfTEPq5L19PFF9rm5ZmBK728vdaNsyQXMww7OUos2RRXlnOsuj/ogNtr3mH5Jexk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726752984; c=relaxed/simple;
	bh=hstUX21KBEtHjopCnXqSKNOH0rFQhohY/fxyASPML4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NI7b75PY4C30srmu+Rd6nknv1yRTm1/XqW/lj7PYccEKOi5JgKVilMyXD/pBq7q381WgTct2LayAh4OeXPj/BSSLx1qpZxQ63eg0yn//+10dV/tmfZ5Gw+XPFqoxDshifNPiiT+9U1tuWl1k9tZZYH/+PKT4J55D1QjI+BY3IXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V/QU4oHR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48J9HtOY022628;
	Thu, 19 Sep 2024 13:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i0RZIuHqgGGeJbkftCBmHHwAA9PfN547xTAQddzFrBI=; b=V/QU4oHRko2W1e3Y
	VogWqSBC9xUG7qgWeQI7HAV5HGi9vm9pC3slCBTgoh/C6epJOo7Vj9zHAuxmRBDc
	hdBj/g7D/C1l7Jn9niqMSb53E9Pzh7QBWemB+lxX0UTOBP0z8ZBW5qMnhe4Msdlr
	gbZPu0ZvERchypJjP8NQB1bx8tcBShFpiys90u3hmI4N5QEfSLCNo3KQv7/FoBgu
	YwYj2RQ/E69LObVpFgf28ob4PDPcXbR66JHed8TxGquLD6mu9hvrMWaiGFoAE2kf
	HZMXVuXplxuT2uDfV4Rnx+sd1HdCfLOXHkocFnqxwAUTZOu9fJSXDQzIjBY5gSMJ
	yrccYQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4jdwjnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 13:35:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48JDZvvU009093
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 13:35:57 GMT
Received: from [10.111.137.190] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 19 Sep
 2024 06:35:53 -0700
Message-ID: <9e23310b-c165-446f-9e99-c1bf61fe3e83@quicinc.com>
Date: Thu, 19 Sep 2024 06:35:51 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: qrtr: Update packets cloning when broadcasting
To: Youssef Samir <quic_yabdulra@quicinc.com>, <mani@kernel.org>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <andersson@kernel.org>
CC: <quic_jhugo@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Carl Vanderlip
	<quic_carlv@quicinc.com>
References: <20240916170858.2382247-1-quic_yabdulra@quicinc.com>
 <a3abd3f6-6247-4933-9b8e-df2241a3ec75@quicinc.com>
 <00293616-d738-48eb-becc-981a6ad86493@quicinc.com>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <00293616-d738-48eb-becc-981a6ad86493@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lgauoKmTQ6gnsZlkv_UkUxUfM7LDBiCJ
X-Proofpoint-GUID: lgauoKmTQ6gnsZlkv_UkUxUfM7LDBiCJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1015 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409190089



On 9/17/2024 10:25 AM, Youssef Samir wrote:
> Hi Chris,
> 
> On 9/17/2024 3:59 PM, Chris Lew wrote:
>> Hi Youssef,
>>
>> On 9/16/2024 10:08 AM, Youssef Samir wrote:
>>> When broadcasting data to multiple nodes via MHI, using skb_clone()
>>> causes all nodes to receive the same header data. This can result in
>>> packets being discarded by endpoints, leading to lost data.
>>>
>>> This issue occurs when a socket is closed, and a QRTR_TYPE_DEL_CLIENT
>>> packet is broadcasted. All nodes receive the same destination node ID,
>>> causing the node connected to the client to discard the packet and
>>> remain unaware of the client's deletion.
>>>
>>
>> I guess this never happens for the SMD/RPMSG transport because the skb is consumed within the context of qrtr_node_enqueue where as MHI queues the skb to be transmitted later.
>>
>> Does the duplicate destination node ID match the last node in the qrtr_all_nodes list?
> 
> Yes, it always matches the last node in the qrtr_all_nodes list.
> 

Thanks for the confirmation, we haven't seen this before since most of 
our platforms usually only use one MHI qrtr node.

Reviewed-by: Chris Lew <quic_clew@quicinc.com>

>>
>>
>>> Replace skb_clone() with pskb_copy(), to create a separate copy of
>>> the header for each sk_buff.
>>>
>>> Fixes: bdabad3e363d ("net: Add Qualcomm IPC router")
>>> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
>>> Reviewed-by: Jeffery Hugo <quic_jhugo@quicinc.com>
>>> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
>>> ---
>>>    net/qrtr/af_qrtr.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
>>> index 41ece61eb57a..00c51cf693f3 100644
>>> --- a/net/qrtr/af_qrtr.c
>>> +++ b/net/qrtr/af_qrtr.c
>>> @@ -884,7 +884,7 @@ static int qrtr_bcast_enqueue(struct qrtr_node *node, struct sk_buff *skb,
>>>          mutex_lock(&qrtr_node_lock);
>>>        list_for_each_entry(node, &qrtr_all_nodes, item) {
>>> -        skbn = skb_clone(skb, GFP_KERNEL);
>>> +        skbn = pskb_copy(skb, GFP_KERNEL);
>>>            if (!skbn)
>>>                break;
>>>            skb_set_owner_w(skbn, skb->sk);
> 

