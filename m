Return-Path: <linux-arm-msm+bounces-32692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E648988ACC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 21:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28B8E1F21C25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 19:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23CDF1C242F;
	Fri, 27 Sep 2024 19:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Kpc8WZ8R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521921C2423;
	Fri, 27 Sep 2024 19:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727465885; cv=none; b=tC2XWLlm6A3fSVZ5EFFUBw5FBBcP3odEUCbByc6Mt+nl7kj9GROfLRU4lNGuhkHWJ3+SfoRwKgQXZzWWHm7h3VOLB+FopdmQi1V/HdgEHWO9VnkdH9Xnb6ZTPicFsd3+hy3NQTupicttNxBf6uPWz5+DMQJGpwg+9geB9Gc+smM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727465885; c=relaxed/simple;
	bh=kv3QxqsVW2dfG1YNDz85KvG3puNGvwJQDHIA0s7DHio=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFzk5Tr/d5EFfBSs06MgWYvgUhT0mkI6KnLlpcUVjPO3ULwoAXIa2M23Fk4UYYFqB6AUpGhIuYsAcYqR2AWXZB4PIDL3GibZPvrgp24egXvX19uiygrYEuBPC9Lm+BUV2yB/RuZMlT/HxnGEz62qaxmf7jaTI+RL+ZIBLObS+EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Kpc8WZ8R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48RD05Cd026378;
	Fri, 27 Sep 2024 19:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b0Lssv7cUe0U/qYMod4vjdhA
	HSFbc3w8JAK/104B438=; b=Kpc8WZ8RbyC5RH4IZ4B8ooaujqs7MTTk7ysCyiGG
	BzfFXmWALH/SzhmzoqNIcunxP4C/2ASd+mdiju3ggWGGDlDwK+rnO6kf1k9isZEz
	H/ctu94hzy+7Kx73FztGlShHwtITBKK0WlAE/nzg9BwoXgpD0lMrnohxusC4PATJ
	ZXFISU1etguRFgNe4TrLIaW1/75jKjzPlbQIX3yvNiS3I//kK3mbQ0XOLN7xrymf
	EcI8V9Um96SGJMGzw7wJjz5F/cDMwxCBel97uivcdMNR4+gC85GGNhHGFWhnc3ne
	J3hR/Ev0f5j/qIn48omIcs27MQwYOCCSh2CzQ52gBGNXGQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41ww708wmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 19:37:55 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48RJbsti021025
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 19:37:54 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 27 Sep 2024 12:37:52 -0700
Date: Sat, 28 Sep 2024 01:07:43 +0530
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] remoteproc: qcom: Fix NULL pointer in glink_subdev_stop()
Message-ID: <ZvcJhzDmdhO/wbKq@hu-mojha-hyd.qualcomm.com>
References: <20240925103351.1628788-1-quic_mojha@quicinc.com>
 <ZvTYA1Rg6DrEEabk@hu-bjorande-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZvTYA1Rg6DrEEabk@hu-bjorande-lv.qualcomm.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BC8v580HNiGLCxPdG06qZjzCkAfsd2Pu
X-Proofpoint-ORIG-GUID: BC8v580HNiGLCxPdG06qZjzCkAfsd2Pu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409270143

On Wed, Sep 25, 2024 at 08:41:55PM -0700, Bjorn Andersson wrote:
> On Wed, Sep 25, 2024 at 04:03:51PM +0530, Mukesh Ojha wrote:
> > Multiple call to glink_subdev_stop() for the same remoteproc can happen
> > if rproc_stop() fails from Process-A that leaves the rproc state to
> > RPROC_CRASHED state later a call to recovery_store from user space in
> > Process B triggers rproc_trigger_recovery() of the same remoteproc to
> > recover it results in NULL pointer dereference issue in
> > qcom_glink_smem_unregister().
> > 
> > Fix it by having a NULL check in glink_subdev_stop().
> > 
> > 	Process-A                			Process-B
> > 
> >   fatal error interrupt happens
> > 
> >   rproc_crash_handler_work()
> >     mutex_lock_interruptible(&rproc->lock);
> >     ...
> > 
> >        rproc->state = RPROC_CRASHED;
> >     ...
> >     mutex_unlock(&rproc->lock);
> > 
> >     rproc_trigger_recovery()
> >      mutex_lock_interruptible(&rproc->lock);
> > 
> >       adsp_stop()
> >       qcom_q6v5_pas 20c00000.remoteproc: failed to shutdown: -22
> >       remoteproc remoteproc3: can't stop rproc: -22
> 
> I presume that at this point this remoteproc is in some undefined state
> and the only way to recover is for the user to reboot the machine?

Here, 50+ (5s) retry of scm shutdown is failing during decryption of
remote processor memory region, and i don't think, it is anyway to do
with remote processor state here, as a best effort more number of
retries can be tried instead of 50 or wait for some other recovery
command like recovery_store() to let it do the retry again from
beginning.

> 
> 
> The check for glink->edge avoids one pitfall following this, but I'd
> prefer to see a solution that avoids issues in this scenario in the
> remoteproc core - rather than working around side effects of this in
> different places.

Handling in a remoteproc core means we may need another state something
like "RPROC_UNKNOWN" which can be kept after one attempt of recovery
failure and checking the same during another try return immediately with
some log message.

-Mukesh

