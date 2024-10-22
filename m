Return-Path: <linux-arm-msm+bounces-35319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBB09A97DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 06:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD1152849B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 04:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2ACC84A4D;
	Tue, 22 Oct 2024 04:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="epkaEALl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C776D38B;
	Tue, 22 Oct 2024 04:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729571292; cv=none; b=F4x5NnzSuryBkZTiJphmSWreMHcInbAQ0VzCYZBsOAkg8PQv59qJJ9MzIi+pCXo11icVXos2jFwFzHervDgIh2L14yJNW3xi989nL4sCv2f1Ze7F2wSzECNs68h0WdImNQxjijJv7koSux7oTxuIlgnBuL+R2ZdnKRV1y3rxcx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729571292; c=relaxed/simple;
	bh=/6p8OCVcO+gIXZx1F2+JRJBOXU+Z42uZ2miXaSD7HWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QEf243ThtMAGsrizUWZ1mU7QFAAamcvs2vjX8h5PczOdMTdfatzPnNBazvMp9BNHkhCwfiPeSoKfntYvrpdyPpv4e+WszuGEeUZautqjhCIVnhCA67Ycg49pyycHvM5IbKUwNpdCjJZNhPHKQ8Q2XX773DZAmSpIveYCsUivFZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=epkaEALl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LGh4u8014396;
	Tue, 22 Oct 2024 04:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sZQJydqzyBYO4LTOnUq2YaDuPWUvzok2FaxTJUJZILI=; b=epkaEALl72JjuqP2
	O5mG6/vdK7Gd+XqyP/qIymUQ/x7ckHKtBuQcvAzHODcNa1ymsx8dgPdGIeVPH7KV
	NgYbLfBt6/+zpmhs2Id5akfAzI/qoHSSaEyAH0z1nBnziMIcMZeA7/i+lPWidO5Y
	WsxS5BHQPUIXfQSDwvh/07vIipUdyNaTtmKBQbzH8g1Ra2IHXt6P2iUoAD+48lG4
	3tjn2rCeIuuq0GVhZ0G4Bu8ydlGeXBxVtBdcBU37tjKnolvPkGKwUpLsTTVlBNgY
	3rQHF7tEQPft8wX10xR90p8S2ZJIYQXtT1dYuUCGibszQvOCcTTa7m+k1rBtMOYP
	tl+azw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dkhd31u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 04:27:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49M4RubU009917
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 04:27:56 GMT
Received: from [10.110.108.212] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Oct
 2024 21:27:56 -0700
Message-ID: <82f296f8-9538-4c89-952f-ff8768c5a0b7@quicinc.com>
Date: Mon, 21 Oct 2024 21:27:55 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 01/10] net: qrtr: ns: validate msglen before
 ctrl_pkt use
To: Denis Kenzior <denkenz@gmail.com>, <netdev@vger.kernel.org>
CC: Marcel Holtmann <marcel@holtmann.org>, Andy Gross <agross@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241018181842.1368394-1-denkenz@gmail.com>
 <20241018181842.1368394-2-denkenz@gmail.com>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <20241018181842.1368394-2-denkenz@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IwWmkNDphKe3_1OaA83gaVu0u4W_uQXI
X-Proofpoint-GUID: IwWmkNDphKe3_1OaA83gaVu0u4W_uQXI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=721
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410220028



On 10/18/2024 11:18 AM, Denis Kenzior wrote:
> The qrtr_ctrl_pkt structure is currently accessed without checking
> if the received payload is large enough to hold the structure's fields.
> Add a check to ensure the payload length is sufficient.
> 
> Signed-off-by: Denis Kenzior <denkenz@gmail.com>
> Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
> Reviewed-by: Andy Gross <agross@kernel.org>
> ---
>   net/qrtr/ns.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
> index 3de9350cbf30..6158e08c0252 100644
> --- a/net/qrtr/ns.c
> +++ b/net/qrtr/ns.c
> @@ -619,6 +619,9 @@ static void qrtr_ns_worker(struct work_struct *work)
>   			break;
>   		}
>   
> +		if ((size_t)msglen < sizeof(pkt))

sizeof(*pkt)?

> +			break;
> +
>   		pkt = recv_buf;
>   		cmd = le32_to_cpu(pkt->cmd);
>   		if (cmd < ARRAY_SIZE(qrtr_ctrl_pkt_strings) &&

