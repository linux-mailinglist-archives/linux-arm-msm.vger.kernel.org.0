Return-Path: <linux-arm-msm+bounces-32507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C22CC986489
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 18:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 786F028AF75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 16:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B7E22EF0;
	Wed, 25 Sep 2024 16:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mj6lMq2c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D018825;
	Wed, 25 Sep 2024 16:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727280799; cv=none; b=ikNa2ITj12W2oyNsTGob6XBC7RrZEldPI1xGPYtP1Smf5/Mc19atAANp/19bKF4gDcD6F2p+/34dyZ7TrnuyHdziujmdYfHDyWhg9IEN1elGRYwvdWnUMpE5BC6c9QYypv0tGbGyjALw8ZgX75Kz4mV0+kN8sCelEmIBOkURkt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727280799; c=relaxed/simple;
	bh=fh87/7/cjeNB1MLFEZVeuefzCQFZEWjVB8DAwrbLGZQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxpBjN6Uj8DPxwOUCh3U8MIVxtlf9LfpKEg5riBLOwDSoak0aJ9mqrmV7KyRH/f1W7pQRm5xvnuDYM8Jln6MBYg9d+7oJyA1Rn+MCFADZPNFCT3qc5CGAhDqs0/WhQX8c7Puzr5ixuuHBEmtTBNsCMD5KVmXSUeZ6nRLLo1b0j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mj6lMq2c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48PAXZ6m021829;
	Wed, 25 Sep 2024 16:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Xn5KB4XMfCoVaqwl1DhkyrSK
	BLK4FYZuKYagmLMmDg8=; b=mj6lMq2cnzYk8kWlV97b+04DEimao5DMHNFV/2dj
	GJlzImEKl2MIfIeJBfmYMuurk0FRwYicjJ7IodsY0muNOYVadIwbwH/GNFTy0DMQ
	5xYrC+ce1KfCMTOgf8+ScGvkKZiTBW9sZCcQRt38VWxQ2GNa9s1DwXVnuOdcL13d
	HB0PeQw7J29VUx3gp/rm8L2XIur4Jtsol+8OSWTHa6/MDIHyMpXhqc15b5Qkq2kO
	nD9e8/VgF/Yy9j2Wo797ezmRWURMTsNAAiT+g/A5X7YB/0KhyTDyAYylZIHpoozo
	qNMoQEN92voAZUTyq+Dyg+4iZJsoojvJSmFO0nttXCuu/g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41snqymv5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 16:13:13 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48PGDB5n024261
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 16:13:11 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Sep 2024 09:13:11 -0700
Date: Wed, 25 Sep 2024 09:13:10 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Deepak Kumar Singh <quic_deesin@quicinc.com>
CC: <andersson@kernel.org>, <quic_clew@quicinc.com>,
        <mathieu.poirier@linaro.org>, <linux-kernel@vger.kernel.org>,
        <quic_sarannya@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH V2] rpmsg: glink: Add abort_tx check in intent wait
Message-ID: <ZvQ2lnRO/dTyH1g3@hu-bjorande-lv.qualcomm.com>
References: <20240925072328.1163183-1-quic_deesin@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240925072328.1163183-1-quic_deesin@quicinc.com>
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PivgByQxnxAC1xkwdyBjDtHVxBtNFqdf
X-Proofpoint-ORIG-GUID: PivgByQxnxAC1xkwdyBjDtHVxBtNFqdf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 clxscore=1011 mlxscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250114

On Wed, Sep 25, 2024 at 12:53:28PM +0530, Deepak Kumar Singh wrote:
> From: Sarannya S <quic_sarannya@quicinc.com>
> 
> On remote susbsystem restart rproc will stop glink subdev which will

"When stopping or restarting a remoteproc the glink subdev stop will
invoke qcom_glink_native_remove(). Any ..."

> trigger qcom_glink_native_remove, any ongoing intent wait should be

Please always have () on function names, to make clear they are indeed
functions.

s/intent wait/wait for intent request/

And I think "can" is a better word than "should" (we can abort the wait
to not waiting for the intents that aren't expected to come).

> aborted from there otherwise this wait delays glink send which potentially
> delays glink channel removal as well. This further introduces delay in ssr
> notification to other remote subsystems from rproc.
> 
> Currently qcom_glink_native_remove is not setting channel->intent_received,

This observation is correct, but I don't see a reason why it should. So
express this in terms of the applicable logic (i.e. we have abort_tx to
signal this scenario already, let's use it)

> so any ongoing intent wait is not aborted on remote susbsystem restart.
> abort_tx flag can be used as a condition to abort in such cases.
> 
> Adding abort_tx flag check in intent wait, to abort intent wait from
> qcom_glink_native_remove.

More () please.

> 
> Fixes: c05dfce0b89e ("rpmsg: glink: Wait for intent, not just request ack")
> Cc: stable@vger.kernel.org

I don't think the current code is broken, just suboptimal. And as such I
don't think this is a bugfix.

Perhaps I'm missing some case here? Otherwise, please drop the Fixes and
Cc...

> Signed-off-by: Sarannya S <quic_sarannya@quicinc.com>
> Signed-off-by: Deepak Kumar Singh <quic_deesin@quicinc.com>
> ---
>  drivers/rpmsg/qcom_glink_native.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 82d460ff4777..ff828531c36f 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -438,7 +438,6 @@ static void qcom_glink_handle_intent_req_ack(struct qcom_glink *glink,
>  
>  static void qcom_glink_intent_req_abort(struct glink_channel *channel)
>  {
> -	WRITE_ONCE(channel->intent_req_result, 0);
>  	wake_up_all(&channel->intent_req_wq);
>  }
>  
> @@ -1354,8 +1353,9 @@ static int qcom_glink_request_intent(struct qcom_glink *glink,
>  		goto unlock;
>  
>  	ret = wait_event_timeout(channel->intent_req_wq,
> -				 READ_ONCE(channel->intent_req_result) >= 0 &&
> -				 READ_ONCE(channel->intent_received),
> +				 (READ_ONCE(channel->intent_req_result) >= 0 &&
> +				 READ_ONCE(channel->intent_received)) ||
> +				 glink->abort_tx,

This looks good. But Chris and I talked about his patches posted
yesterday, and it seems like a good idea to differentiate the cases of
aborted and granted = 0.

Chris' patch is fixing a real bug, so that should be backported, so
let's conclude that discussion (with this patch included or in mind).

Regards,
Bjorn

>  				 10 * HZ);
>  	if (!ret) {
>  		dev_err(glink->dev, "intent request timed out\n");
> -- 
> 2.34.1
> 

