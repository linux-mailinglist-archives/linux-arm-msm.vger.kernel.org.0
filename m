Return-Path: <linux-arm-msm+bounces-32530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A274E986B6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 05:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF9332838DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 03:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A93170A0B;
	Thu, 26 Sep 2024 03:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BmvUWZVZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A5F1F61C;
	Thu, 26 Sep 2024 03:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727322124; cv=none; b=kLwPk38ovHxnJi0ywT+IMphpdO0YB2bTtVYkCkJrGR6ncgdIDAhJpu5Hsnhn3FZ7imlkO+Kqy72SN0riKxCQEjsTJHI3RRm6uOpjdTSUzd0Jp4fjdNzik9qgsznexnnFt9btnqMDDsaKTACIJ96wEUn5wm1v5daXciteeZTord4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727322124; c=relaxed/simple;
	bh=bn8GY1t8xgLoxh/ERTd157vEL+orkLsu/4+o3DeMIS8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pq2Qa/xTm8mugOziJOO3kki+Y92QYnwaVES000HSqApVM7HR97+Z901n+2WTCpw04DkO4+fWoF1cqjS6Hu6m8CzUJt1+9R7BWI0z7mkIlCpi1gsYTrW4fXn7elErANVHk9MoDB89MwSY7PinyOLV/m+NZeOphgYZEtHJ98A38mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BmvUWZVZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48PH5HJm012428;
	Thu, 26 Sep 2024 03:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eE/qYBz4vfY5FUQjoQePYXST
	NpwboGXeT7wo5SN4QzU=; b=BmvUWZVZEHErSO8wb4z2O9D+xicl12P5xk/4EitR
	VGIzKxmDaofwr/Ii2Ma7zuDhWEmHd9A06rx+AQf4MqYGiPpugANmxHj5so/4vXUj
	8PeycDZ9jic4hVoPwxdVlBDYVWr149cvDLqC4bIaDMzLcQ41nxVEkegA8xcXh4KA
	kIJ04Bh0yXW1ZQPcTisBSaf7SA/44z1js+Ve7KSGOUHPhoeN716q66sH6HC4eQMy
	noSltNl2oLw2xE54I46pqI/FqrRCfs0nxuNuvkQDCjsF3dzxR5evnd7Ucgcw+pcD
	s5To7lzRK2dEPxAIraZxZiEbhFHFPebGg7COpMOxV1eymA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skgnemsy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 03:41:59 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48Q3fvCC021204
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 03:41:57 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Sep 2024 20:41:56 -0700
Date: Wed, 25 Sep 2024 20:41:55 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Mukesh Ojha <quic_mojha@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] remoteproc: qcom: Fix NULL pointer in glink_subdev_stop()
Message-ID: <ZvTYA1Rg6DrEEabk@hu-bjorande-lv.qualcomm.com>
References: <20240925103351.1628788-1-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240925103351.1628788-1-quic_mojha@quicinc.com>
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lydk3sJcl2qer8s6arYZZhUqyK2I6ZKn
X-Proofpoint-GUID: lydk3sJcl2qer8s6arYZZhUqyK2I6ZKn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409260022

On Wed, Sep 25, 2024 at 04:03:51PM +0530, Mukesh Ojha wrote:
> Multiple call to glink_subdev_stop() for the same remoteproc can happen
> if rproc_stop() fails from Process-A that leaves the rproc state to
> RPROC_CRASHED state later a call to recovery_store from user space in
> Process B triggers rproc_trigger_recovery() of the same remoteproc to
> recover it results in NULL pointer dereference issue in
> qcom_glink_smem_unregister().
> 
> Fix it by having a NULL check in glink_subdev_stop().
> 
> 	Process-A                			Process-B
> 
>   fatal error interrupt happens
> 
>   rproc_crash_handler_work()
>     mutex_lock_interruptible(&rproc->lock);
>     ...
> 
>        rproc->state = RPROC_CRASHED;
>     ...
>     mutex_unlock(&rproc->lock);
> 
>     rproc_trigger_recovery()
>      mutex_lock_interruptible(&rproc->lock);
> 
>       adsp_stop()
>       qcom_q6v5_pas 20c00000.remoteproc: failed to shutdown: -22
>       remoteproc remoteproc3: can't stop rproc: -22

I presume that at this point this remoteproc is in some undefined state
and the only way to recover is for the user to reboot the machine?


The check for glink->edge avoids one pitfall following this, but I'd
prefer to see a solution that avoids issues in this scenario in the
remoteproc core - rather than working around side effects of this in
different places.

Regards,
Bjorn

>      mutex_unlock(&rproc->lock);
> 
> 						echo enabled > /sys/class/remoteproc/remoteprocX/recovery
> 						recovery_store()
> 						 rproc_trigger_recovery()
> 						  mutex_lock_interruptible(&rproc->lock);
> 						   rproc_stop()
> 						    glink_subdev_stop()
> 						      qcom_glink_smem_unregister() ==|
>                                                                                      |
>                                                                                      V
> 						      Unable to handle kernel NULL pointer dereference
>                                                                 at virtual address 0000000000000358
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
> - We can do this NULL check in qcom_glink_smem_unregister() as it is
>   exported function however, there is only one user of this. So, doing
>   it with current approach should also be fine.
> 
>  drivers/remoteproc/qcom_common.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index 8c8688f99f0a..52d6c9b99fdb 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -209,6 +209,9 @@ static void glink_subdev_stop(struct rproc_subdev *subdev, bool crashed)
>  {
>  	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);
>  
> +	if (!glink->edge)
> +		return;
> +
>  	qcom_glink_smem_unregister(glink->edge);
>  	glink->edge = NULL;
>  }
> -- 
> 2.34.1
> 
> 

