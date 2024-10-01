Return-Path: <linux-arm-msm+bounces-32835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A50E798B494
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 08:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 659A81C22317
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 06:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5EA91BBBFD;
	Tue,  1 Oct 2024 06:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LXKYNdqc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E102191F8D;
	Tue,  1 Oct 2024 06:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727764603; cv=none; b=brg9wmrTyue8pIaqZTeBx/jGGw+Pzve1JM/5lHCdhuu7yMWLh1mPuhnd70XxQ563HIDEIA6x0c6bpAkQbg4UpT+u7DJKSvyqM9cKGtYJIcRCsoRF70OYvHaFNGb9+k9TCP3QlSc4rge8cMH4xZ8QYZZqJvuDmDCXtGQJr2J6kTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727764603; c=relaxed/simple;
	bh=FtzVMfOWCtTDfoVWXXTcvZyj59YNTdtJ2JdGOq8fpVc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uPOhmeUfgp4PoME4qN0jhU+2KF1k95nVXOS3XRVRvvf2iL2D7eMbN5VYRTQYwFwfwwAilS4i1qBOnkDhAHwDe/BwCvTGxMd+uLltCGIYYoxsr8+KhJpXyoBE3EGKHvjHv1THDVrzn81IRG0MLKflr1zHMFQHNVA9v2jydmKr9+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LXKYNdqc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4911CtGk021899;
	Tue, 1 Oct 2024 06:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OCmotbsX932H7HgXE5rDTYLb
	LmDmdrO8a4bLvdUEaLk=; b=LXKYNdqcZyY/rs9msYnuuGgn8rQdcJk8rZ74vizd
	H7SrB5gdKo9jLFCvFcvU+VBccled83F8qKJlywuwEqLPnZOsHdB05j5JZSPDb2vp
	+2lBU4zaVeb7L7ix3D6fiKG32Ffu5BRPzKjOC0nNPv5LGztHNQtzNPyrWXgrEHZ/
	QWUnL1hEmDiIqR4EmEYSiaHv1Ws2SP8V2jWwLCWsMBhWjUOrWJ8jnAxZV34etJXE
	AJ7fg8ejLaDpZx6xiE5FrGA5LH2LM/8PvrCYJxPuX02VN+WOI/8VdtToUjg2R3vT
	9pmqvyQldrckSUqGoN3hfuvo2cXzF9S4C1BJOtdakCyxAA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x9vu76n2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 06:36:24 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4916aN0d030710
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Oct 2024 06:36:23 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 30 Sep 2024 23:36:20 -0700
Date: Tue, 1 Oct 2024 12:06:17 +0530
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] remoteproc: qcom: Fix NULL pointer in glink_subdev_stop()
Message-ID: <ZvuYYbIycFKRBcCi@hu-mojha-hyd.qualcomm.com>
References: <20240925103351.1628788-1-quic_mojha@quicinc.com>
 <ZvTYA1Rg6DrEEabk@hu-bjorande-lv.qualcomm.com>
 <ZvcJhzDmdhO/wbKq@hu-mojha-hyd.qualcomm.com>
 <ZvcqrbLKqCQyYBsF@hu-bjorande-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZvcqrbLKqCQyYBsF@hu-bjorande-lv.qualcomm.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wAd0XBfEFMb2RlUw2s-ByarSqbzBpelk
X-Proofpoint-ORIG-GUID: wAd0XBfEFMb2RlUw2s-ByarSqbzBpelk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2410010043

On Fri, Sep 27, 2024 at 02:59:09PM -0700, Bjorn Andersson wrote:
> On Sat, Sep 28, 2024 at 01:07:43AM +0530, Mukesh Ojha wrote:
> > On Wed, Sep 25, 2024 at 08:41:55PM -0700, Bjorn Andersson wrote:
> > > On Wed, Sep 25, 2024 at 04:03:51PM +0530, Mukesh Ojha wrote:
> > > > Multiple call to glink_subdev_stop() for the same remoteproc can happen
> > > > if rproc_stop() fails from Process-A that leaves the rproc state to
> > > > RPROC_CRASHED state later a call to recovery_store from user space in
> > > > Process B triggers rproc_trigger_recovery() of the same remoteproc to
> > > > recover it results in NULL pointer dereference issue in
> > > > qcom_glink_smem_unregister().
> > > > 
> > > > Fix it by having a NULL check in glink_subdev_stop().
> > > > 
> > > > 	Process-A                			Process-B
> > > > 
> > > >   fatal error interrupt happens
> > > > 
> > > >   rproc_crash_handler_work()
> > > >     mutex_lock_interruptible(&rproc->lock);
> > > >     ...
> > > > 
> > > >        rproc->state = RPROC_CRASHED;
> > > >     ...
> > > >     mutex_unlock(&rproc->lock);
> > > > 
> > > >     rproc_trigger_recovery()
> > > >      mutex_lock_interruptible(&rproc->lock);
> > > > 
> > > >       adsp_stop()
> > > >       qcom_q6v5_pas 20c00000.remoteproc: failed to shutdown: -22
> > > >       remoteproc remoteproc3: can't stop rproc: -22
> > > 
> > > I presume that at this point this remoteproc is in some undefined state
> > > and the only way to recover is for the user to reboot the machine?
> > 
> > Here, 50+ (5s) retry of scm shutdown is failing during decryption of
> > remote processor memory region, and i don't think, it is anyway to do
> > with remote processor state here, as a best effort more number of
> > retries can be tried instead of 50 or wait for some other recovery
> > command like recovery_store() to let it do the retry again from
> > beginning.
> > 
> 
> But are you saying that retrying a bit later would allow us to get out
> of this problem? If we just didn't hit the NULL pointer(s)?

I am not sure whether adding more number of retries will solve the issue
and initially thinking from perspective that, it is better to retry than
to leave the remoteproc in some unknown state however, I do get that
letting it retry could give unnecessary patching every code e.g., ssr
notifier callbacks, which is not expecting to be called twice as a
side-effect of remoteproc unknown state.
> 
> How long are we talking about here? Is the timeout too short?

5sec is very significant amount of time in wait for remote processor to
get recovered, we should not change this.
> 
> > > 
> > > 
> > > The check for glink->edge avoids one pitfall following this, but I'd
> > > prefer to see a solution that avoids issues in this scenario in the
> > > remoteproc core - rather than working around side effects of this in
> > > different places.
> > 
> > Handling in a remoteproc core means we may need another state something
> > like "RPROC_UNKNOWN" which can be kept after one attempt of recovery
> > failure and checking the same during another try return immediately with
> > some log message.
> > 
> 
> Yes, if we are failing to shut down the remoteproc and there's no way
> for us to reliably recover from that (e.g. we are not able to reclaim
> the memory), it seems reasonable that we have to mark it using a new
> state.
> 
> If that is the case, I'd call it RPROC_DEFUNCT (or something like that
> instead), because while in some "unknown" state, from a remoteproc
> framework's point of view, it's in a well known (broken) state.

Ack.

-Mukesh
> 
> Regards,
> Bjorn

