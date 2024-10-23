Return-Path: <linux-arm-msm+bounces-35635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AF49AD77B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 00:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 782F51C20C8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 22:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4531F1F429E;
	Wed, 23 Oct 2024 22:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g4f8hSuE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA414D599;
	Wed, 23 Oct 2024 22:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729722118; cv=none; b=UQLEuSV8xW3XGa1eqfU0SicQdxbP52w4dP9p1m+HbFbCUqKRnBd92CuvNktOZ5oDZh0YkUa8uMoRENjwluzaTyL1q3NzwxqlKAIEajZocjLoK6537OVKscBccUOvcC3DDstKIbunhmBf02vX1xZX7HHRl+em31mZ9Y94BMeQKEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729722118; c=relaxed/simple;
	bh=RNQZ+4Gn07qWwQ1WhtJQDHeeM6BS8OoxhTDaGvEztLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KqLXkzf4eYC6xdTMb+krqPGu+BFcCz0/+ykTSNMri21WgbSZANEV9LIxaHty7+pYje92Gl19hXewm4DQm66nz8p9761fvDoKKnVWqEjjdSRpOKHa8RqhnZ6/Mgjmf+Sr9iuw6tWriJQIfUajP4w60GSHlZx58V6rpoiG+l9s6/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g4f8hSuE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9ijGS030354;
	Wed, 23 Oct 2024 22:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oXTdl017qkFFaJjdWRfywgTTPeFRhj+b+Qyfqj4ayBo=; b=g4f8hSuE9IzYRX9l
	zRMRaXs0HqoqFYnAmqVIWxNaTjRzyGjUVGBUQN4Q29QOCYivj3GbL2B7iDHfw1f7
	lgrMo1mtF6IqfruPVnjbjJXFHGlam7sCA/jz2ho1jZqNoHlDbOlQviFP722Jr4bN
	68+aiUvawC4cjbGvRsJv+cqlCl/78702Wqg9T9dmVO+K7IS/ZSVojIEjtJoHEUYv
	9duWNTAX5ItVNFm1v/hqk6h2YYXHPe2HzNjltza02Rx1kBLnJeor+bqfRWXLCvoi
	94m+A599HhlfZAyKIGNH0TOd7WJd0wnIU5qLDTls8fWRD4dscxX71fKO9HQyEeTE
	85FyLQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3w3nyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 22:21:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49NMLp7h001476
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 22:21:51 GMT
Received: from [10.110.103.186] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Oct
 2024 15:21:50 -0700
Message-ID: <6b2b1e75-696b-4860-b6ec-ef5713fdfd21@quicinc.com>
Date: Wed, 23 Oct 2024 15:21:50 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] rpmsg: glink: Handle rejected intent request
 better
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Johan Hovold <johan@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson
	<quic_bjorande@quicinc.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>, Johan Hovold
	<johan+linaro@kernel.org>
References: <20241023-pmic-glink-ecancelled-v2-0-ebc268129407@oss.qualcomm.com>
 <20241023-pmic-glink-ecancelled-v2-1-ebc268129407@oss.qualcomm.com>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <20241023-pmic-glink-ecancelled-v2-1-ebc268129407@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -pAKsyJCTQ8pvqnIhdBkTm43pLuPvpxZ
X-Proofpoint-GUID: -pAKsyJCTQ8pvqnIhdBkTm43pLuPvpxZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1011 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230145



On 10/23/2024 10:24 AM, Bjorn Andersson wrote:
> GLINK operates using pre-allocated buffers, aka intents, where incoming
> messages are aggregated before being passed up the stack. In the case
> that no suitable intents have been announced by the receiver, the sender
> can request an intent to be allocated.
> 
> The initial implementation of the response to such request dealt
> with two outcomes; granted allocations, and all other cases being
> considered -ECANCELLED (likely from "cancelling the operation as the
> remote is going down").
> 
> But on some channels intent allocation is not supported, instead the
> remote will pre-allocate and announce a fixed number of intents for the
> sender to use. If for such channels an rpmsg_send() is being invoked
> before any channels have been announced, an intent request will be
> issued and as this comes back rejected the call fails with -ECANCELED.
> 
> Given that this is reported in the same way as the remote being shut
> down, there's no way for the client to differentiate the two cases.
> 
> In line with the original GLINK design, change the return value to
> -EAGAIN for the case where the remote rejects an intent allocation
> request.
> 
> It's tempting to handle this case in the GLINK core, as we expect
> intents to show up in this case. But there's no way to distinguish
> between this case and a rejection for a too big allocation, nor is it
> possible to predict if a currently used (and seemingly suitable) intent
> will be returned for reuse or not. As such, returning the error to the
> client and allow it to react seems to be the only sensible solution.
> 
> In addition to this, commit 'c05dfce0b89e ("rpmsg: glink: Wait for
> intent, not just request ack")' changed the logic such that the code
> always wait for an intent request response and an intent. This works out
> in most cases, but in the event that an intent request is rejected and no
> further intent arrives (e.g. client asks for a too big intent), the code
> will stall for 10 seconds and then return -ETIMEDOUT; instead of a more
> suitable error.
> 
> This change also resulted in intent requests racing with the shutdown of
> the remote would be exposed to this same problem, unless some intent
> happens to arrive. A patch for this was developed and posted by Sarannya
> S [1], and has been incorporated here.
> 
> To summarize, the intent request can end in 4 ways:
> - Timeout, no response arrived => return -ETIMEDOUT
> - Abort TX, the edge is going away => return -ECANCELLED
> - Intent request was rejected => return -EAGAIN
> - Intent request was accepted, and an intent arrived => return 0
> 
> This patch was developed with input from Sarannya S, Deepak Kumar Singh,
> and Chris Lew.
> 
> [1] https://lore.kernel.org/all/20240925072328.1163183-1-quic_deesin@quicinc.com/
> 
> Fixes: c05dfce0b89e ("rpmsg: glink: Wait for intent, not just request ack")
> Cc: stable@vger.kernel.org
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

Reviewed-by: Chris Lew <quic_clew@quicinc.com>

