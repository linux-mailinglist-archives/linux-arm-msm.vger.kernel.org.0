Return-Path: <linux-arm-msm+bounces-32695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC94D988C27
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 23:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75A84283C3D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 21:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A48918C33B;
	Fri, 27 Sep 2024 21:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L6xdRkPp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E0E18B470;
	Fri, 27 Sep 2024 21:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727474369; cv=none; b=ldNhb6AOXZqXh4Q0r+KiOt6qfM183tKxQqeD38+E93bUW/Ho03Hru5DepDeyuZqs5DbE4G1M+IQckbxXsi14Dhm9KIkoX2AiS5Vs8gaiZOjqS0DRaSGDmzCIedWT7uoreUKZFKMxdUKh+2t5xhSgCmLmPIygC1CtgTuH4KsSTKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727474369; c=relaxed/simple;
	bh=2M0hdn4noUNVfLyhfiyb7RMQfOb1Mpni3jceBnB3vfE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNZwlTkw2DVT36BRrZDn+xNqm/UofWF9Laxlp1XWPeP5pP4d8j6Cj+GQaWk5bZ6lrZJCD7+FOfxVezYrZ2ZbVVe+7W2rMWfRnkoRkUEvF7rmaa435Uw/p4a4odKlVf2EbgXZ7uXofPpqySAqVcPdszJHT/lSQJowl0Q3qU3vel8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L6xdRkPp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48REZUrF001917;
	Fri, 27 Sep 2024 21:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yJk9n7jJ8hLIEsvr/THkA9Pi
	ukcapey3efMXjpwZxto=; b=L6xdRkPp6D7ZWhh3ny4RnqI5/EldNBzMguokduez
	k8BlKJGsWKVV5v6dIq3dq/CSW2kmtXtwQnIh5qeESzUzjHZlySfHdpxRioGwySlF
	xft0Irzi7uakbo4wcdYhsFmvES4WNUt3reB2InA1qXKce7E4QhakGHiHsqwB8BSc
	D17EIAL3l3lTcg9bLqQ4ZC0YQNxnJlmcZheyM+lE4XFRmJvvNWKZ6T4GMi56wQSV
	iulGXUPbyZKSkiDMLyHBDr0G1hM9/98h24g+7DnUy4vrJXxNbZjmWEomyS9qg4t5
	8Q2lHDoBuz7ZfEfcdylTpDl84nA8gO0q9RReiUGrzM6MqQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skgnmpx2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 21:59:21 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48RLxBpw007807
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 21:59:11 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 27 Sep 2024 14:59:10 -0700
Date: Fri, 27 Sep 2024 14:59:09 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Mukesh Ojha <quic_mojha@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] remoteproc: qcom: Fix NULL pointer in glink_subdev_stop()
Message-ID: <ZvcqrbLKqCQyYBsF@hu-bjorande-lv.qualcomm.com>
References: <20240925103351.1628788-1-quic_mojha@quicinc.com>
 <ZvTYA1Rg6DrEEabk@hu-bjorande-lv.qualcomm.com>
 <ZvcJhzDmdhO/wbKq@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZvcJhzDmdhO/wbKq@hu-mojha-hyd.qualcomm.com>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xXCjVqyzBZSTvVhOFFI_U3Jw4-LQndf1
X-Proofpoint-GUID: xXCjVqyzBZSTvVhOFFI_U3Jw4-LQndf1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409270161

On Sat, Sep 28, 2024 at 01:07:43AM +0530, Mukesh Ojha wrote:
> On Wed, Sep 25, 2024 at 08:41:55PM -0700, Bjorn Andersson wrote:
> > On Wed, Sep 25, 2024 at 04:03:51PM +0530, Mukesh Ojha wrote:
> > > Multiple call to glink_subdev_stop() for the same remoteproc can happen
> > > if rproc_stop() fails from Process-A that leaves the rproc state to
> > > RPROC_CRASHED state later a call to recovery_store from user space in
> > > Process B triggers rproc_trigger_recovery() of the same remoteproc to
> > > recover it results in NULL pointer dereference issue in
> > > qcom_glink_smem_unregister().
> > > 
> > > Fix it by having a NULL check in glink_subdev_stop().
> > > 
> > > 	Process-A                			Process-B
> > > 
> > >   fatal error interrupt happens
> > > 
> > >   rproc_crash_handler_work()
> > >     mutex_lock_interruptible(&rproc->lock);
> > >     ...
> > > 
> > >        rproc->state = RPROC_CRASHED;
> > >     ...
> > >     mutex_unlock(&rproc->lock);
> > > 
> > >     rproc_trigger_recovery()
> > >      mutex_lock_interruptible(&rproc->lock);
> > > 
> > >       adsp_stop()
> > >       qcom_q6v5_pas 20c00000.remoteproc: failed to shutdown: -22
> > >       remoteproc remoteproc3: can't stop rproc: -22
> > 
> > I presume that at this point this remoteproc is in some undefined state
> > and the only way to recover is for the user to reboot the machine?
> 
> Here, 50+ (5s) retry of scm shutdown is failing during decryption of
> remote processor memory region, and i don't think, it is anyway to do
> with remote processor state here, as a best effort more number of
> retries can be tried instead of 50 or wait for some other recovery
> command like recovery_store() to let it do the retry again from
> beginning.
> 

But are you saying that retrying a bit later would allow us to get out
of this problem? If we just didn't hit the NULL pointer(s)?

How long are we talking about here? Is the timeout too short?

> > 
> > 
> > The check for glink->edge avoids one pitfall following this, but I'd
> > prefer to see a solution that avoids issues in this scenario in the
> > remoteproc core - rather than working around side effects of this in
> > different places.
> 
> Handling in a remoteproc core means we may need another state something
> like "RPROC_UNKNOWN" which can be kept after one attempt of recovery
> failure and checking the same during another try return immediately with
> some log message.
> 

Yes, if we are failing to shut down the remoteproc and there's no way
for us to reliably recover from that (e.g. we are not able to reclaim
the memory), it seems reasonable that we have to mark it using a new
state.

If that is the case, I'd call it RPROC_DEFUNCT (or something like that
instead), because while in some "unknown" state, from a remoteproc
framework's point of view, it's in a well known (broken) state.

Regards,
Bjorn

