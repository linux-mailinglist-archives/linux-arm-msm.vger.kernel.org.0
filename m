Return-Path: <linux-arm-msm+bounces-31921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5551097B1BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 17:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88A6F1C22649
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 15:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083F31925A6;
	Tue, 17 Sep 2024 14:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TvDA7Lia"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF121922ED;
	Tue, 17 Sep 2024 14:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726585186; cv=none; b=TLcpp+ACNgRScoKL+z8hTERu/x5m7XYzCO3qCU9tLgzu+9uDqI6NhINuyyRxMGXiCcESaj3Pf/MfaF/X+scnsM0GYDTwTdSF1Vyme0xTU+ATfBuL5jOSy997NTytiQG3X81OMF7NUcP318W0t23zSn0rmsz6gqyFOJrPNTHDkg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726585186; c=relaxed/simple;
	bh=7yGTXCeJyHx0pn9KEaVOKoW1uu11ZTcpJPmslp+rTFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FPiKatLPpgh36Ka2zqa2babrwLnHt3yV3cTimiVVZceDC4fCboIBGJFvGZNJFHFzwTCtzZ7NaV7LHhAMHcFcGsqHO3qO8D4JKnmhZF0dvDFx+wU2Ic+YMrF9P/75KmlOkdnlfEq2L37biZr+WfDDPujnVvhdtjeOjDFJnODPRPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TvDA7Lia; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48GNGEHe022320;
	Tue, 17 Sep 2024 14:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KCPA0YBW61i/OFnXlZZqJSraPl+xBvzDKB4MCJnZBuA=; b=TvDA7LiasXu3VACB
	OHBue/f0ViTdGeL912ROh11CUHNF5AN8r5TzIBAa4+PqcuEcWkJxBtJy5nbO/52X
	Og4DZ5t7792EzS4jnjgBpF9LTPi4/UQTwrd8A8fxIUqgswnfpAV0Hwt37Tq3I7Co
	CtH6GfLgar5oQflsYBGBIWYImti+mS4nm6JCKwcdg4NG+ugVbmfAtbZErLIQvGFR
	FXp8o2GudlrdJQRVbL5S9EzN5ZFhjdO1dEPCqSPbKcKFLBSmhCZDWmx9BZt2AYJD
	RYd7jkJ1xfB2T2GdfTe4M7jJtKQRIFhRlUoLsIoDlo1MYiNCPZc/TMjPTlNtQrJk
	9uqX0Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hey2t0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 14:59:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48HExZik029143
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 14:59:35 GMT
Received: from [10.251.40.127] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Sep
 2024 07:59:31 -0700
Message-ID: <a3abd3f6-6247-4933-9b8e-df2241a3ec75@quicinc.com>
Date: Tue, 17 Sep 2024 07:59:28 -0700
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
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <20240916170858.2382247-1-quic_yabdulra@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fYzBeVyEEexO_S_T4TmGrkb0m4WMCa-p
X-Proofpoint-GUID: fYzBeVyEEexO_S_T4TmGrkb0m4WMCa-p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011
 mlxlogscore=999 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409170107

Hi Youssef,

On 9/16/2024 10:08 AM, Youssef Samir wrote:
> When broadcasting data to multiple nodes via MHI, using skb_clone()
> causes all nodes to receive the same header data. This can result in
> packets being discarded by endpoints, leading to lost data.
> 
> This issue occurs when a socket is closed, and a QRTR_TYPE_DEL_CLIENT
> packet is broadcasted. All nodes receive the same destination node ID,
> causing the node connected to the client to discard the packet and
> remain unaware of the client's deletion.
> 

I guess this never happens for the SMD/RPMSG transport because the skb 
is consumed within the context of qrtr_node_enqueue where as MHI queues 
the skb to be transmitted later.

Does the duplicate destination node ID match the last node in the 
qrtr_all_nodes list?


> Replace skb_clone() with pskb_copy(), to create a separate copy of
> the header for each sk_buff.
> 
> Fixes: bdabad3e363d ("net: Add Qualcomm IPC router")
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Reviewed-by: Jeffery Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> ---
>   net/qrtr/af_qrtr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
> index 41ece61eb57a..00c51cf693f3 100644
> --- a/net/qrtr/af_qrtr.c
> +++ b/net/qrtr/af_qrtr.c
> @@ -884,7 +884,7 @@ static int qrtr_bcast_enqueue(struct qrtr_node *node, struct sk_buff *skb,
>   
>   	mutex_lock(&qrtr_node_lock);
>   	list_for_each_entry(node, &qrtr_all_nodes, item) {
> -		skbn = skb_clone(skb, GFP_KERNEL);
> +		skbn = pskb_copy(skb, GFP_KERNEL);
>   		if (!skbn)
>   			break;
>   		skb_set_owner_w(skbn, skb->sk);

