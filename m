Return-Path: <linux-arm-msm+bounces-96786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALPqFiGysGkHmQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 01:06:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DD19C2597EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 01:06:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 121FA302C70F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 00:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1C13B7A8;
	Wed, 11 Mar 2026 00:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="boWh54e+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AA027707;
	Wed, 11 Mar 2026 00:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773187612; cv=none; b=kgzDpreD3obkCjFeZtXzVC0AhiqvRIdn9+rxgOB0dRVBa/2k5bIQAbpR63cMPte29/EGfCGMvNoSU1vtBRNK3MlVeCNZO/njRrzMS3tSlVZmev9gYmcE4KWhqVVRwDzRvgiOjl6a6J8frxLczrKQIRhVofmV5RhjqR9plp6sdsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773187612; c=relaxed/simple;
	bh=k2t3wK18V1Lsefy+SCxBOABnjgV/cYpE68vp3HXwutw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5X2edbss3MCIIve0r4kpCJJ9QogoSPQIKvJByv8CCyqS2StiTxW8WI6VJNsfWHcXc+usjJlRCQwmH7EBFu0ITlVq6FAreGVYBO+iJByJQOs06Iwb87neWrv7l0YqIgBIdpwp8C8DWATM3QUTk+7nxZ7LSJgFNEqnzpG7uWL/Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=boWh54e+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3FFBC19423;
	Wed, 11 Mar 2026 00:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773187611;
	bh=k2t3wK18V1Lsefy+SCxBOABnjgV/cYpE68vp3HXwutw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=boWh54e+tVHswXuPet6d9EKDP3Ggxp60UaOAxKJvRlXXx/7d5MsrIP7MzroF4/4Yb
	 PjnEiJSbkpwDG7Q06lvmuMIX9vhJKoYsm9lh/qKhqsYi5eaT6MRYfg2TnkWgxcWIs4
	 HZYTu0mafyKCmse4enJ7QB7ZzKhA0Dw+yknuO7OFzRC5Qj7NY7gzm6FmvEo9WHCpol
	 PVmfJFGykW1FNTRNp2wfQw0JPE/JrlsTtYPTmm7AyRi/KK0S5Cg9Fn7/C1XHwa9aoR
	 X3RKmM4RQqZifnHC8mh0WPF8jXF1Lc9uf4Tv9fZtZrCLaPeOaxFfXA9EARQkGc+iQ9
	 KX9Gd6pAXnm0g==
Date: Tue, 10 Mar 2026 19:06:47 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 7/7] slimbus: qcom-ngd-ctrl: Avoid ABBA on
 tx_lock/ctrl->lock
Message-ID: <abCuRcbukIBx4iBL@baldur>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
 <20260309-slim-ngd-dev-v1-7-5843e3ed62a3@oss.qualcomm.com>
 <20260310100319.fzucrw7do4bxvghv@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310100319.fzucrw7do4bxvghv@hu-mojha-hyd.qualcomm.com>
X-Rspamd-Queue-Id: DD19C2597EE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96786-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 03:33:19PM +0530, Mukesh Ojha wrote:
> On Mon, Mar 09, 2026 at 11:09:08PM -0500, Bjorn Andersson wrote:
> > During the SSR/PDR down notification the tx_lock is taken with the
> > intent to provide synchronization with active DMA transfers.
> > 
> > But during this period qcom_slim_ngd_down() is invoked, which ends up in
> > slim_report_absent(), which takes the slim_controller lock. In multiple
> > other codepaths these two locks are taken in the opposite order (i.e.
> > slim_controller then tx_lock).
> > 
> > The result is a lockdep splat, and a possible deadlock:
> > 
> >   rprocctl/449 is trying to acquire lock:
> >   ffff00009793e620 (&ctrl->lock){+.+.}-{4:4}, at: slim_report_absent (drivers/slimbus/core.c:322) slimbus
> > 
> >   but task is already holding lock:
> >   ffff00009793fb50 (&ctrl->tx_lock){+.+.}-{4:4}, at: qcom_slim_ngd_ssr_pdr_notify (drivers/slimbus/qcom-ngd-ctrl.c:1475) slim_qcom_ngd_ctrl
> > 
> >   which lock already depends on the new lock.
> > 
> >   Possible unsafe locking scenario:
> > 
> >         CPU0                    CPU1
> >         ----                    ----
> >    lock(&ctrl->tx_lock);
> >                                 lock(&ctrl->lock);
> >                                 lock(&ctrl->tx_lock);
> >    lock(&ctrl->lock);
> > 
> > The assumption is that the comment refers to the desire to not call
> > qcom_slim_ngd_exit_dma() while we have an ongoing DMA TX transaction.
> > But any such transaction is initiated and completed within a single
> > qcom_slim_ngd_xfer_msg().
> > 
> > Prior to calling qcom_slim_ngd_exit_dma() the slim_controller is torn
> > down, all child devices are notified that the slimbus is gone and the
> > child devices are removed.
> > 
> > Stop taking the tx_lock in qcom_slim_ngd_ssr_pdr_notify() to avoid the
> > deadlock.
> > 
> > Fixes: a899d324863a ("slimbus: qcom-ngd-ctrl: add Sub System Restart support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> >  drivers/slimbus/qcom-ngd-ctrl.c | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> > index 54a4c6ee1e71fe55794f09575979826d9aa5be9f..75d70de0909a8d17e2410d30f7811f32d5eebea3 100644
> > --- a/drivers/slimbus/qcom-ngd-ctrl.c
> > +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> > @@ -1471,15 +1471,12 @@ static int qcom_slim_ngd_ssr_pdr_notify(struct qcom_slim_ngd_ctrl *ctrl,
> >  	switch (action) {
> >  	case QCOM_SSR_BEFORE_SHUTDOWN:
> >  	case SERVREG_SERVICE_STATE_DOWN:
> > -		/* Make sure the last dma xfer is finished */
> > -		mutex_lock(&ctrl->tx_lock);
> >  		if (ctrl->state != QCOM_SLIM_NGD_CTRL_DOWN) {
> >  			pm_runtime_get_noresume(ctrl->ctrl.dev);
> >  			ctrl->state = QCOM_SLIM_NGD_CTRL_DOWN;
> >  			qcom_slim_ngd_down(ctrl);
> >  			qcom_slim_ngd_exit_dma(ctrl);
> >  		}
> > -		mutex_unlock(&ctrl->tx_lock);
> 
> 
> is it not much more safer, to put this tx_lock around qcom_slim_ngd_exit_dma() ?
> 

It would avoid the deadlock in question, so that's good.

But I don't think it's reasonable to guard against the case where
qcom_slim_ngd_xfer_msg() is running beyond qcom_slim_ngd_down().

qcom_slim_ngd_down() will tear down the world around the caller
of qcom_slim_ngd_xfer_msg(), so it's unlikely we're in a good place if
this happens.

One concrete example of this is that the wcd934x "ddata" will be
released by devres as qcom_slim_ngd_down() is cleaning up the children.


But to clarify, this is not something that is handled properly today -
more work is needed in this area.

Regards,
Bjorn

> 
> >  		break;
> >  	case QCOM_SSR_AFTER_POWERUP:
> >  	case SERVREG_SERVICE_STATE_UP:
> > 
> > -- 
> > 2.51.0
> > 
> 
> -- 
> -Mukesh Ojha

