Return-Path: <linux-arm-msm+bounces-35491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76ED69ABA97
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 02:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 125D1284A8A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 00:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B7112B73;
	Wed, 23 Oct 2024 00:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gDJH3iYX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDA64A32;
	Wed, 23 Oct 2024 00:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729643786; cv=none; b=PvFx5WSBToWkLAOXFGGyEBBZDFAmnANAnnjG5NTRyrV1tLBcaza24/t0qnsENPJ05+XwRjEiTYrXsLTu7txyxdUJ9FUcuhqw4a4mlXYK80ObNUrxVGXtfs8k+I+JaHjV+1KswQLKcaIVZ8rIcOCRv9AGbk1Ubc23eb/uT4UHogE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729643786; c=relaxed/simple;
	bh=0xlYY4mzmdOoyXk14+fntNyWU4DFoKGqy2TnCpJI3h8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WDMADIhQ6AnWFKEDg3bAyDVQYWhI7M6qZ6HdnmTyQCax/R8FgHJIFsh5aYS2nDDY8vVizVfiCrRVrAKpYG2oBOzWY1xYiVlmEAJ/PlhoCaqnvI5fMxfNyyv1UrkiiVsG1D2mSfJTniVC1TbIcUpSjf5Gi8xu7qw+SOis8kILzGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gDJH3iYX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MLaH1x025415;
	Wed, 23 Oct 2024 00:36:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZA8izx+dGTgWZcv3L+Ni0DmbX+JyrWlyG8FPshbHAA0=; b=gDJH3iYXf2ph4ycR
	na8NBkgUKYpLtj89K0Rm4feOb9//8ng5VKeh2SBZvVLL+ou3t7oR2ZogfsYLEikk
	D5HjFEOs06Zu4ylwuP08WNxoYqHEZaRxqgRHdfjlsDXlPdCEwbIwP7D6yK4aEnEV
	rdzT8FFtBTGuW12hTm77ooRf6bBkTJMVElg/tVgIGiIA4XnuOOuSgKsmaayiOQU7
	f84RBc4LHa/g6YQvGlzi+3rUcNvNPE7Q9yFUUW8Qt9sKZR5LLyywwCBtAA7nEvB3
	dWE7W8/QkeGxpC5lBYxmyamCQknJMtMd3zYo9bzQzHYVBR3VzNVhCT44hLf2YFSR
	NzyGbQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em41rat7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 00:36:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49N0aCDK005538
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 00:36:12 GMT
Received: from [10.110.103.186] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Oct
 2024 17:36:11 -0700
Message-ID: <2582b8af-e18d-4103-a703-4dbf7464746d@quicinc.com>
Date: Tue, 22 Oct 2024 17:36:11 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 08/10] net: qrtr: Drop remote {NEW|DEL}_LOOKUP
 messages
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
 <20241018181842.1368394-9-denkenz@gmail.com>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <20241018181842.1368394-9-denkenz@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dFFZQ7QSX9ttRaRtFhYcyL3hBhNKOHsW
X-Proofpoint-ORIG-GUID: dFFZQ7QSX9ttRaRtFhYcyL3hBhNKOHsW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230001



On 10/18/2024 11:18 AM, Denis Kenzior wrote:
> These messages are explicitly filtered out by the in-kernel name
> service (ns.c).  Filter them out even earlier to save some CPU cycles.
> 
> Signed-off-by: Denis Kenzior <denkenz@gmail.com>
> Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
> Reviewed-by: Andy Gross <agross@kernel.org>
> ---
>   net/qrtr/af_qrtr.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
> index b2f9c25ba8f8..95c9679725ee 100644
> --- a/net/qrtr/af_qrtr.c
> +++ b/net/qrtr/af_qrtr.c
> @@ -560,6 +560,11 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
>   	if (!size || len != ALIGN(size, 4) + hdrlen)
>   		goto err;
>   
> +	/* Don't allow remote lookups */
> +	if (cb->type == QRTR_TYPE_NEW_LOOKUP ||
> +	    cb->type == QRTR_TYPE_DEL_LOOKUP)
> +		goto err;
> +

Just curious, was this case observed? I thought we blocked clients from 
sending this control message to remotes and I didnt think the ns 
broadcasts it either.

>   	if ((cb->type == QRTR_TYPE_NEW_SERVER ||
>   	     cb->type == QRTR_TYPE_RESUME_TX) &&
>   	    size < sizeof(struct qrtr_ctrl_pkt))

