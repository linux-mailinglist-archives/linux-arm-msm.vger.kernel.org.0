Return-Path: <linux-arm-msm+bounces-84068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C08F3C9B490
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 12:18:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A9B9A4E0F32
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 11:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12DC830214E;
	Tue,  2 Dec 2025 11:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="of7hR2O2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GexFAalE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C31F201033
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 11:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764674314; cv=none; b=SxD7UosftQxzxzPsWGjYtDTWilTF+/xcVtoKkxkq6LiF9SP6/clKQvJvsq0BvitQFqlGT8G8mhd0sID9SNyg886Y4tsCqiEOcGhenhsUkUkA5EEAEEARTARaekQcEhtEvHPPcs5RXQ04xUJuXCJD/0GOdaaygciaeF74H7GjEeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764674314; c=relaxed/simple;
	bh=w382XtkhAPxqd7MsAJ4IUsHt4uKmL5b5TSOkfEWrtk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TqL/PsrGcnkC4Peg92HZ4L3zvD+XCe3hYuDBnQwDprP9jl801I6r7xok/lyU7drccUU8/spfacN16McyiQRgH5CT4i3kkjCidxl9V4kELfM80Rm/Ak5eDR5f4S+IO001FHubhmgM2OMntvExsKCMgxi93vny3M225GQynbTJw/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=of7hR2O2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GexFAalE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2B5A8g3311173
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 11:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dg/OYrx4va6h9MRcN5ljZQwaDI2yk5HxAM9uySjHWEw=; b=of7hR2O2SnFqPy3e
	D3lA5vBmm2KZ8matvZFMnFTjU4R0xFIRYvmEonK8d8RlBHyjzkiOCghDEm0ANM2Q
	aL1AvNLrvYOcOxX1ZxwQMbY2QdK42osII9scj2bp6Xu2TFXwOy+J8oZ7TevO27/S
	8Lt03b/aTExByhXvfs/v6zpdbxvj8sJOloEvpMr5SXRkWHDk4sALRN2LIiwrQjG0
	lMFCdVYE+ja5hV1r0vnocXIlUdQQnPY1JqumoDCV2DGmTKHXUTDI1/SQzYvQlOwU
	LdnVRBjPeKieocyhMmpAFdy54C45K+Ese+Q3xZdB3cvmVVmDiglaV7zt8a+nieyQ
	jvcs1A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asxwwg15f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 11:18:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-299d221b749so97639045ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 03:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764674310; x=1765279110; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dg/OYrx4va6h9MRcN5ljZQwaDI2yk5HxAM9uySjHWEw=;
        b=GexFAalErJxS5mP9iTUuhHDydRc1mN9vew9uFVMguJCU3rKzXkW4er9TX/afPH+65M
         LxcAd6F8qtzbOZeVC+Sw05dErQUIG4o8odihojS40T7oJrx4yueEoAECgR32RzawIh2I
         lGhPSk+EWrgvKRuLY7+vvhRcSCQqMuuU1kNx8OapchUua64FSSKty2PMaFOJWBAX4HBo
         41uHVqayny6j5KOeq1bt5Jkba4tA6z+kZPJEjUopkq7j+1azAjVZgQiroaL8M5C9xfDX
         MeHIqZjp0IQyYycRFs5yP4fYzI+nkZV6asNEw7zT1AbtkoVWw+ROuqPMaVfZgVuAJoPJ
         UlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764674310; x=1765279110;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dg/OYrx4va6h9MRcN5ljZQwaDI2yk5HxAM9uySjHWEw=;
        b=xRAvPSK5fAfHbGpOJqzLdVVDromga1Ofm7AjGxHloMZgthqvTuJHfAkYX9n4oL3z9B
         XXyN4ClTTZkfLDIVjwkBIYPJSNjtSFvbAn1JFm/akcD+NJX4x3eZHMj8Bk5HMU4rtuY0
         oMt6Hv2w7G+xLPLIQipFtaH4fIxT09sxzHrlz3nhOBSkkSn4TAATOBCbNUZmhIiGgENn
         NkFAnLBbiovKnw9iFJKBRT+b34Vubxq3XWfUhO+mSFFVNiMJ0SDWC1cCge/Dgeh6buqv
         S37hgjl6Wb3sg55fDyL9H5r779Ets8kIMMPQzSEPYfK0QKn85XK3N8gWSP//CGnXXvbK
         RnDQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4V6Hz9HKgi67zTgVUABER5cRM5MYmoXgDHNA3QlOMYF2ncdwcSM7lFl/csmu291p9+Rq4dg9C0SH7XN34@vger.kernel.org
X-Gm-Message-State: AOJu0YzcfF1Wa1+8ZUeRbO5FtZ5Le9WBJpl5qdnVT3Jey4MWBOmTZ5ij
	Wngwyz3crJCmP0FHhqNauZ8mKuTJDgG7OecBK94F/9AXB+k5pOGA4hzl1ZV2KpMsoAMYo9SZeO3
	a2I6nR4KUwltFVVyCzL8asSp5PLYkHPMYm6j9OcU2Ubl4WfTHelDqzyfx6Vs0CROC9wL8
X-Gm-Gg: ASbGncvJ4cpP10b5beq5zaVJmecjXkVcpO0/WxJefcvmxPnPVx656KEzPvT6lr/8X8N
	+oTQT+MtuNxRfwMfUYKDOKZSfKg3hTbgofsGUtqova7WcZRmhQsH6m2zlYuik6vi9lFcRkbXdK4
	hvldnKoCRa40d1wjH/JFEJNr4s6Rg2c8CFwHIo9+YrV0e8kb2sdIu6cz8g1szKEXeHHJWfNUdOW
	Rfvn+sy9H4YXljyPKOPnIs9JZyi2PUVe0862xYMaAkRvsH0IxoLSxNXh9ea4N/5V4uWKMF68K+A
	RtmUqMI4W+A6gaycraDzn8wJay2rT5lW/HJ6+k4SI+hQXAppEYzEJCb9JKNwDgvcVpDhtw0Lbtx
	SIPuvicG2L2IYU5/7Zi89JeHki+I12rBBMVC5
X-Received: by 2002:a17:903:3d0c:b0:294:f711:baa with SMTP id d9443c01a7336-29b6c3c71b6mr521186775ad.2.1764674309647;
        Tue, 02 Dec 2025 03:18:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXa6xCeHNIZ0F+Ti4hBeAwQHmgmFJ4gSOqJTFj9zlC1wnqalofi4oQoo26fa157sCkGXSXyA==
X-Received: by 2002:a17:903:3d0c:b0:294:f711:baa with SMTP id d9443c01a7336-29b6c3c71b6mr521186385ad.2.1764674308849;
        Tue, 02 Dec 2025 03:18:28 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb7bccbsm150257515ad.100.2025.12.02.03.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 03:18:28 -0800 (PST)
Date: Tue, 2 Dec 2025 16:48:23 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] remoteproc: qcom: Fix NULL pointer issue
Message-ID: <20251202111823.s7qgorpqalgaayn7@hu-mojha-hyd.qualcomm.com>
References: <20251128103240.1723386-1-mukesh.ojha@oss.qualcomm.com>
 <o7txzvxy36nphtf5aybzb3z25zovhgtseubkyn2hbira3aorxo@vky3kzv7gvs3>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <o7txzvxy36nphtf5aybzb3z25zovhgtseubkyn2hbira3aorxo@vky3kzv7gvs3>
X-Authority-Analysis: v=2.4 cv=JbyxbEKV c=1 sm=1 tr=0 ts=692ecb06 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=LIePxy4-OamFXmqomhUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -VOqRFf4sz7903BedBHrgIOOS-1thwtO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA5MCBTYWx0ZWRfX7OMBPEOSUORM
 U2dLfywol/aDc5h8hSJ9Lfb5rZwEExxiRSVKiYv3tPAaNt2oI/i/zXkQCjSi6dV8L9LzojU5RDa
 mPXKQxoeNXKkYAifJuz23krpxH1aUnq/lYXcxqIWmXerwG/d1Hvxc0paLNU7AKuAb6g33K37Pq2
 KvLfufyL+52BIDSLgNVsfhSDNFhNZLHiU2/LxgBz4qSjfdfTupWNHie2rH2x3Vqx8RmGqGRQiN+
 7qgw8i3uPYyp+L7v+ha+TPA6Cys8bZbHkcZOPnAMhE9gLpoh0C58TLpLHI535Cy+UuDtrPhIlIO
 NFctq7gJx/nZ4CrNAisevmtQDxZ8DT6iGZSgfqPPz5jp2+Fg610bouNNiYUTt2+34FWpDp+tMMZ
 eHIbnRza9lXl7qSStVw3XWGm3xftsg==
X-Proofpoint-GUID: -VOqRFf4sz7903BedBHrgIOOS-1thwtO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020090

On Sat, Nov 29, 2025 at 03:01:42PM -0600, Bjorn Andersson wrote:
> On Fri, Nov 28, 2025 at 04:02:40PM +0530, Mukesh Ojha wrote:
> > There is a scenario, when fatal interrupt triggers rproc crash handling
> > while a user-space recovery is initiated in parallel. The overlapping
> > recovery/stop sequences race on rproc state and subdevice teardown,
> > resulting in a NULL pointer dereference in the GLINK SMEM unregister
> > path.
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
> >       qcom_pas_stop()
> >       qcom_q6v5_pas 20c00000.remoteproc: failed to shutdown: -22
> >       remoteproc remoteproc3: can't stop rproc: -22
> >      mutex_unlock(&rproc->lock);
> > 
> > 						echo enabled > /sys/class/remoteproc/remoteprocX/recovery
> > 						recovery_store()
> > 						 rproc_trigger_recovery()
> > 						  mutex_lock_interruptible(&rproc->lock);
> > 						   rproc_stop()
> > 						    glink_subdev_stop()
> > 						      qcom_glink_smem_unregister() ==|
> >                                                                                      |
> >                                                                                      V
> > 						      Unable to handle kernel NULL pointer dereference
> >                                                                 at virtual address 0000000000000358
> 
> I'm not able to read out from these two flows where there would be a
> race condition. You're describing things that happens in process A and
> then you're describing things in processes B, but I think you're
> expecting the reader to deduce what the actual problem is from those
> -EINVAL lines in Process-A - or I'm completely failing to see what
> problem you're solving here.

I missed to mention mutex contention on rproc lock.

> 
> > 
> > It is tempting to introduce a remoteproc state that could be set from
> > the ->ops->stop() callback, which would have avoided the second attempt
> > and prevented the crash.
> 
> Above you tried to describe a race condition, but this is talking about
> something else.

I could have used the discussion link pointing that we have discussed
about having a separate rproc state.

> 
> > However, making remoteproc recovery dependent
> > on manual intervention or a system reboot is not ideal.
> 
> I totally agree with this statement, but I find it to come out of
> nothing.

I meant, if we had separate state that would have avoided the crash but
remoteproc would still not recover and will be non-functional and agree
doing NULL check is not solving this either but keeping this more open
ended like even if there is slightest chance but this is all hypothesis.

> 
> > We should always
> > try to recover the remote processor if possible.
> 
> Yes! But there is a race condition?
> 
> > A failure in the
> > ->ops->stop() callback might be temporary or caused by a timeout, and a
> > recovery attempt could still succeed, as seen in similar scenarios.
> 
> This on the other hand, seems to be a real problem - but I don't think
> it's a race condition.
> 
> > Therefore, instead of adding a restrictive state, let’s add a NULL check
> > at the appropriate places to avoid a kernel crash and allow the system
> > to move forward gracefully.
> 
> You haven't established why the restrictive state would be needed.

I meant, remoteproc state(new) here..its a typo..

> 
> 
> In fact, I don't think you have a race condition, because I think it can
> be 20 minutes between the "mutex_unlock()" and your "echo enabled" and
> you would see exactly the same problem.

Yes, you are right, but the one I am describing here has had rproc lock
race where a test case of recover just triggered and collided with
unlucky crash at the same time at the remoteproc.

> 
> If I interpret pieces of your commit message and read the code, I think
> you're solving the problem that
> 
> rproc_crash_handler_work()
>   rproc_trigger_recovery()
>     rproc_boot_recovery()
>       rproc_stop()
>         rproc_stop_subdevices()
>           glink_subdev_stop()
>             qcom_glink_smem_unregister(glink->edge)
>               deref(glink->edge)
>             glink->edge = NULL;
>         rproc_ops->stop() // returns -EINVAL
>         // rproc_unprepare_subdevices never happens
>         // rproc->state = OFFLINE never happens
> 
> // rproc left in CRASHED state
> 
> rproc_recovery_write()
>   rproc_trigger_recovery()
>     rproc_boot_recovery()
>       rproc_stop()
>         rproc_stop_subdevices()
>           glink_subdev_stop()
>             qcom_glink_smem_unregister(glink->edge)
>               deref(glink->edge) // glink is NULL -> oops
> 
> 
> Or in English, stopping the remoteproc fails, but we've already stopped
> the subdevices and when we then try to recover a second time, we fail to
> stop the subdevice.
> 
> This does sound familiar, to the point that I believe we've talked about
> this in the past, and perhaps that's where the idea of a new state
> you're talking about is coming from? Unfortunately I don't remember the
> details, and the future reader of the git history surely won't
> remember...

Yes, we spoke about it here

https://lore.kernel.org/lkml/20240925103351.1628788-1-quic_mojha@quicinc.com/

> 
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> > Changes in v4: https://lore.kernel.org/all/20241016045546.2613436-1-quic_mojha@quicinc.com/
> >  - Brought the same change from v2.
> >  - Added smd->edge NULL check.
> >  - Rephrased the commit text.
> > 
> > Changes in v3:
> >  - Fix kernel test reported error.
> > 
> > Changes in v2: https://lore.kernel.org/lkml/20240925103351.1628788-1-quic_mojha@quicinc.com/
> >  - Removed NULL pointer check instead added a new state to signify
> >    non-recoverable state of remoteproc.
> > 
> >  drivers/remoteproc/qcom_common.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> > index 8c8688f99f0a..6480293d2f61 100644
> > --- a/drivers/remoteproc/qcom_common.c
> > +++ b/drivers/remoteproc/qcom_common.c
> > @@ -209,6 +209,9 @@ static void glink_subdev_stop(struct rproc_subdev *subdev, bool crashed)
> >  {
> >  	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);
> >  
> > +	if (!glink->edge)
> > +		return;
> 
> This does make glink_subdev_stop() idempotent, but do we guarantee that
> the rest of the involved callstack handles this as well? Is it
> documented somewhere that any changes to the framework or remoteproc
> drivers need to maintain this property - or does it just happen to work
> today?
>

This changes was not intended to enforce the check throughout the involved
callstack instead just put NULL check to avoid the kernel crash. Yes, it
works as in we don't see kernel crash after this.

I see, even after this there is no guarantee that it would not result
in kernel crash in future may be in some SSR notifier.

> 
> 
> The commit message needs to be rewritten so that a 3rd party can read it
> and understand what problem it solves.
> 
> Under what circumstance does qcom_pas_stop() fail, and in what
> circumstances would it work again a little bit later? Why do we get
> -EINVAL here?

I don't have information on whether it will recover later or not.

> 
> I fully agree with you that we should do our very best to recover the
> crashed remoteproc, to the point that I wonder who will actually trigger
> this bug? In what circumstance would a user go and manually enable
> recovery on a remoteproc with recovery already enabled, to dislodge it.
> 
> I think we should fix the root cause, because that's what all the users
> and 99% of the developers will hit. Very few will attempt a manual
> recovery.


This can be triggered from developer by seeing why my audio does not
work, that can lead to checking the state and triggering the recover
command and he may not have liked to see kernel crash just because
of this command. I know, there could be firmware bug but that firmware
did not crash the system and it happened much time later.

> 
> If we then consider attempting a manual recovery after the recovery has
> failed, then we need to document that all parts of the stop must be
> idempotent - in which case this patch would be part of that
> implementation.


Now, I agree with all of the points but leaving the device crash just
like that does not look fine either even if there is firmware bug, but it is
not crashing in firmware but in Kernel.

Do you think, I should still follow [1] - RPROC_DEFUNCT from framework +
setting to RPROC_DEFUNCT from qcom_pas_stop() ?

[1]
https://lore.kernel.org/all/20241016045546.2613436-1-quic_mojha@quicinc.com/
or 

Not solve this at all ?

> 
> Regards,
> Bjorn
> 
> > +
> >  	qcom_glink_smem_unregister(glink->edge);
> >  	glink->edge = NULL;
> >  }
> > @@ -320,6 +323,9 @@ static void smd_subdev_stop(struct rproc_subdev *subdev, bool crashed)
> >  {
> >  	struct qcom_rproc_subdev *smd = to_smd_subdev(subdev);
> >  
> > +	if (!smd->edge)
> > +		return;
> > +
> >  	qcom_smd_unregister_edge(smd->edge);
> >  	smd->edge = NULL;
> >  }
> > -- 
> > 2.50.1
> > 

-- 
-Mukesh Ojha

