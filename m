Return-Path: <linux-arm-msm+bounces-31930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FFE97B389
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 19:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED30C2863FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 17:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6135A183CCE;
	Tue, 17 Sep 2024 17:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mzTtWZJ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FEE374EA;
	Tue, 17 Sep 2024 17:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726593964; cv=none; b=RGk/pL1ZpvxeBAbyHJv17TtAtvbLJef3WjOkTzZudFrD4wCijvk/44auN3zOiwrf5lUAX0EblliV2qI0XKSZIL/Mh7OMkYTVbeTcNjOdOz2P6KuivZwI8/KwL+thja6/Bsztlv757oq4z2NBKUpg/7ATnsBj9pJw5mJ2Eku/p5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726593964; c=relaxed/simple;
	bh=pkuAhBNNQVn4KVcH65ePpzq4Q2B2UXxIEOoq5n9ag1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BAdibg/BPpFIHPi5x81NEA/K2ybamMFniLAVHXMr61vLlePwAjMkg5ijndOryUrheirLJe5GvO2NNvboohZ9GEpe8erlld4reTb6MWfSwEOtlGIB+bhHfLqci7csqGziyFXURGiDL5qo+JOv9G/6h5w0eowMeK5I2Yf7/NCBMjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mzTtWZJ6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48H8U20R010095;
	Tue, 17 Sep 2024 17:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+8j+OrJBlK/3kaPW4xO6lmAuTkCYNHxxrAK3YCHrsV8=; b=mzTtWZJ6tsjfPpoZ
	BxY0CK0JNQRuHr5ob0Oyh6h4JxMg7YJni/RDHXGPzh+ItzmBC+wNF/ay5X0MfgZ8
	m9z4gcFnkQb1HC88atqBRQMTIUN92OvUSHHK/hap7WQxC8NIvGbD7f/AmItTm+dP
	TqRDhuwLIEvSlHLGGf1MdG+i8cKLP/xBZAQB8fmrIv4/obwsQeb8s1fkxrvmc649
	2A6L0gISyITBp3IcFVLnkbl6h/73N4mgLxW1Nr6fUnUkq/ixkQhGbHo0MkQg1ekC
	iIlbCeQZRL/gTF399JqOx5mzMxnFui6KMMKUt8t/A5SHkAGTfY0nD9F6DpJrgyC/
	gUgYow==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hh7h5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 17:25:52 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48HHPpwT015425
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 17:25:51 GMT
Received: from [10.111.139.232] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Sep
 2024 10:25:48 -0700
Message-ID: <00293616-d738-48eb-becc-981a6ad86493@quicinc.com>
Date: Tue, 17 Sep 2024 18:25:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: qrtr: Update packets cloning when broadcasting
To: Chris Lew <quic_clew@quicinc.com>, <mani@kernel.org>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <andersson@kernel.org>
CC: <quic_jhugo@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Carl Vanderlip
	<quic_carlv@quicinc.com>
References: <20240916170858.2382247-1-quic_yabdulra@quicinc.com>
 <a3abd3f6-6247-4933-9b8e-df2241a3ec75@quicinc.com>
Content-Language: en-US
From: Youssef Samir <quic_yabdulra@quicinc.com>
In-Reply-To: <a3abd3f6-6247-4933-9b8e-df2241a3ec75@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PrjbJ8Q8Mo_YjDPN1fUFng_BYvJd4TVC
X-Proofpoint-ORIG-GUID: PrjbJ8Q8Mo_YjDPN1fUFng_BYvJd4TVC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 mlxscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409170124

Hi Chris,

On 9/17/2024 3:59 PM, Chris Lew wrote:
> Hi Youssef,
> 
> On 9/16/2024 10:08 AM, Youssef Samir wrote:
>> When broadcasting data to multiple nodes via MHI, using skb_clone()
>> causes all nodes to receive the same header data. This can result in
>> packets being discarded by endpoints, leading to lost data.
>>
>> This issue occurs when a socket is closed, and a QRTR_TYPE_DEL_CLIENT
>> packet is broadcasted. All nodes receive the same destination node ID,
>> causing the node connected to the client to discard the packet and
>> remain unaware of the client's deletion.
>>
> 
> I guess this never happens for the SMD/RPMSG transport because the skb is consumed within the context of qrtr_node_enqueue where as MHI queues the skb to be transmitted later.
> 
> Does the duplicate destination node ID match the last node in the qrtr_all_nodes list?

Yes, it always matches the last node in the qrtr_all_nodes list.

> 
> 
>> Replace skb_clone() with pskb_copy(), to create a separate copy of
>> the header for each sk_buff.
>>
>> Fixes: bdabad3e363d ("net: Add Qualcomm IPC router")
>> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
>> Reviewed-by: Jeffery Hugo <quic_jhugo@quicinc.com>
>> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
>> ---
>>   net/qrtr/af_qrtr.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
>> index 41ece61eb57a..00c51cf693f3 100644
>> --- a/net/qrtr/af_qrtr.c
>> +++ b/net/qrtr/af_qrtr.c
>> @@ -884,7 +884,7 @@ static int qrtr_bcast_enqueue(struct qrtr_node *node, struct sk_buff *skb,
>>         mutex_lock(&qrtr_node_lock);
>>       list_for_each_entry(node, &qrtr_all_nodes, item) {
>> -        skbn = skb_clone(skb, GFP_KERNEL);
>> +        skbn = pskb_copy(skb, GFP_KERNEL);
>>           if (!skbn)
>>               break;
>>           skb_set_owner_w(skbn, skb->sk);


