Return-Path: <linux-arm-msm+bounces-83880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4669EC94836
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 21:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 221293A75C9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 20:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C890A30DECE;
	Sat, 29 Nov 2025 20:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YR4ar81h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9830F272E54;
	Sat, 29 Nov 2025 20:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764449755; cv=none; b=nerOt8i5xKkKcdGivoIaOB+zX3yHbARqdfw9OhctdTKb2QloBftw+6YjGwLvt1mR8/SBBh9ATVwfbaZGJJAt8H6QPnWUj0vjFDefQXH/VC/WAM4iUsJ7sq+stNMnxCtabrf+8OcUjp1/ZgeY7TIbawVc3lJqwymLC4Co39Sn7xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764449755; c=relaxed/simple;
	bh=LEzyAKobk7kjA6raGTsp1bNeymxqUDP+k+LfItAZDWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jGci+fm3rntDlPq/Dzcylx6DoQgv+DRU1H8cZTML36mH/N2FXEoqArJ0o7gTlkhsQDPVIEsXzqdkfYXPJcFugD9AgulM+ZOVL+n0KsGZcDA1FYa+V2K90pxAvnXhtCfKnImdToaS9HnVsX4NXTrD3WLW1XKIsDmnDchI7Y57IF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YR4ar81h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA4D4C4CEF7;
	Sat, 29 Nov 2025 20:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764449755;
	bh=LEzyAKobk7kjA6raGTsp1bNeymxqUDP+k+LfItAZDWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YR4ar81hqVGXMt55va3yqlAwMSq99rTPi7/zXERUcBXz9nFtU2AGs/JMF/Qrqk2NH
	 L1ZqcjusLAqRx5mDuHn1LE4ubIP0NmJnP5xNSK+4akRCXwlsxmG3/BZkpnEqBT1Gef
	 AVgHeH8UbAgOz9lXsmaYa7gOx8oY/NgONoeljLKCMgpulw0v7ISRBWIFpGnEgiLKj/
	 97JV2q6h4I2vRTb3Ny83J1XuvBwACF2wGghdetwm05Unf2E6scFsYX5K1PDf0dC9K5
	 SdZUQ1443B0jIxgtLtDchLI/Jfuq07/JZpn9SOyJJPUi101Ra2eERIl+Dx8A5WaOqA
	 NiuHw6FyTRjBg==
Date: Sat, 29 Nov 2025 15:01:42 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] remoteproc: qcom: Fix NULL pointer issue
Message-ID: <o7txzvxy36nphtf5aybzb3z25zovhgtseubkyn2hbira3aorxo@vky3kzv7gvs3>
References: <20251128103240.1723386-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251128103240.1723386-1-mukesh.ojha@oss.qualcomm.com>

On Fri, Nov 28, 2025 at 04:02:40PM +0530, Mukesh Ojha wrote:
> There is a scenario, when fatal interrupt triggers rproc crash handling
> while a user-space recovery is initiated in parallel. The overlapping
> recovery/stop sequences race on rproc state and subdevice teardown,
> resulting in a NULL pointer dereference in the GLINK SMEM unregister
> path.
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
>       qcom_pas_stop()
>       qcom_q6v5_pas 20c00000.remoteproc: failed to shutdown: -22
>       remoteproc remoteproc3: can't stop rproc: -22
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

I'm not able to read out from these two flows where there would be a
race condition. You're describing things that happens in process A and
then you're describing things in processes B, but I think you're
expecting the reader to deduce what the actual problem is from those
-EINVAL lines in Process-A - or I'm completely failing to see what
problem you're solving here.

> 
> It is tempting to introduce a remoteproc state that could be set from
> the ->ops->stop() callback, which would have avoided the second attempt
> and prevented the crash.

Above you tried to describe a race condition, but this is talking about
something else.

> However, making remoteproc recovery dependent
> on manual intervention or a system reboot is not ideal.

I totally agree with this statement, but I find it to come out of
nothing.

> We should always
> try to recover the remote processor if possible.

Yes! But there is a race condition?

> A failure in the
> ->ops->stop() callback might be temporary or caused by a timeout, and a
> recovery attempt could still succeed, as seen in similar scenarios.

This on the other hand, seems to be a real problem - but I don't think
it's a race condition.

> Therefore, instead of adding a restrictive state, let’s add a NULL check
> at the appropriate places to avoid a kernel crash and allow the system
> to move forward gracefully.

You haven't established why the restrictive state would be needed.


In fact, I don't think you have a race condition, because I think it can
be 20 minutes between the "mutex_unlock()" and your "echo enabled" and
you would see exactly the same problem.

If I interpret pieces of your commit message and read the code, I think
you're solving the problem that

rproc_crash_handler_work()
  rproc_trigger_recovery()
    rproc_boot_recovery()
      rproc_stop()
        rproc_stop_subdevices()
          glink_subdev_stop()
            qcom_glink_smem_unregister(glink->edge)
              deref(glink->edge)
            glink->edge = NULL;
        rproc_ops->stop() // returns -EINVAL
        // rproc_unprepare_subdevices never happens
        // rproc->state = OFFLINE never happens

// rproc left in CRASHED state

rproc_recovery_write()
  rproc_trigger_recovery()
    rproc_boot_recovery()
      rproc_stop()
        rproc_stop_subdevices()
          glink_subdev_stop()
            qcom_glink_smem_unregister(glink->edge)
              deref(glink->edge) // glink is NULL -> oops


Or in English, stopping the remoteproc fails, but we've already stopped
the subdevices and when we then try to recover a second time, we fail to
stop the subdevice.

This does sound familiar, to the point that I believe we've talked about
this in the past, and perhaps that's where the idea of a new state
you're talking about is coming from? Unfortunately I don't remember the
details, and the future reader of the git history surely won't
remember...

> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v4: https://lore.kernel.org/all/20241016045546.2613436-1-quic_mojha@quicinc.com/
>  - Brought the same change from v2.
>  - Added smd->edge NULL check.
>  - Rephrased the commit text.
> 
> Changes in v3:
>  - Fix kernel test reported error.
> 
> Changes in v2: https://lore.kernel.org/lkml/20240925103351.1628788-1-quic_mojha@quicinc.com/
>  - Removed NULL pointer check instead added a new state to signify
>    non-recoverable state of remoteproc.
> 
>  drivers/remoteproc/qcom_common.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index 8c8688f99f0a..6480293d2f61 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -209,6 +209,9 @@ static void glink_subdev_stop(struct rproc_subdev *subdev, bool crashed)
>  {
>  	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);
>  
> +	if (!glink->edge)
> +		return;

This does make glink_subdev_stop() idempotent, but do we guarantee that
the rest of the involved callstack handles this as well? Is it
documented somewhere that any changes to the framework or remoteproc
drivers need to maintain this property - or does it just happen to work
today?



The commit message needs to be rewritten so that a 3rd party can read it
and understand what problem it solves.

Under what circumstance does qcom_pas_stop() fail, and in what
circumstances would it work again a little bit later? Why do we get
-EINVAL here?

I fully agree with you that we should do our very best to recover the
crashed remoteproc, to the point that I wonder who will actually trigger
this bug? In what circumstance would a user go and manually enable
recovery on a remoteproc with recovery already enabled, to dislodge it.

I think we should fix the root cause, because that's what all the users
and 99% of the developers will hit. Very few will attempt a manual
recovery.

If we then consider attempting a manual recovery after the recovery has
failed, then we need to document that all parts of the stop must be
idempotent - in which case this patch would be part of that
implementation.

Regards,
Bjorn

> +
>  	qcom_glink_smem_unregister(glink->edge);
>  	glink->edge = NULL;
>  }
> @@ -320,6 +323,9 @@ static void smd_subdev_stop(struct rproc_subdev *subdev, bool crashed)
>  {
>  	struct qcom_rproc_subdev *smd = to_smd_subdev(subdev);
>  
> +	if (!smd->edge)
> +		return;
> +
>  	qcom_smd_unregister_edge(smd->edge);
>  	smd->edge = NULL;
>  }
> -- 
> 2.50.1
> 

