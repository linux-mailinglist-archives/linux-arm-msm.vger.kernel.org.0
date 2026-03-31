Return-Path: <linux-arm-msm+bounces-101177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EP8KIp9OzGlSSQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 00:45:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E78EA3727D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 00:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A753D3015CB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 22:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F6E3BE155;
	Tue, 31 Mar 2026 22:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZiGaplLH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E480E3033C0;
	Tue, 31 Mar 2026 22:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774997148; cv=none; b=Dd6cb3pL2No9vvP8hPS6OkXazb1UFvcqPHis4c+Vy4jtOmN3hjM/wxfwvBRLH3irpBW8utdRqQ2Y3ShSQg4uG7uKJCfjcxeuRYHxgLVPRvX6gEeMwdh8tU6+UpFQgErfMwJKssPyQYuOaPnRJG1qKiwCY+rD6m64szNFKiOEsOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774997148; c=relaxed/simple;
	bh=er30PFyr+Ey31Q4SzXn1ex3xLAVv6SjrM4BaHs3dFnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aa7199rwaXoBBOVkSQC8+UmnjNaXtCk4TU6+i2rLoe3TUuq0Dv6w8TSTu2CvHLJuaHF6SEm/8h2HrPTqyMgxehET8akJVfa3+VKeW2Urv97M/LCo27A+RgPxa8YkiVTsjHrcWeXTKWqyZiaohChrh2t7AvrJmMIMAeaHZt/LPoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZiGaplLH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B638FC19423;
	Tue, 31 Mar 2026 22:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774997147;
	bh=er30PFyr+Ey31Q4SzXn1ex3xLAVv6SjrM4BaHs3dFnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZiGaplLHs2CW2seFLm9byYarn0WfSl69cInx8wX2MrIm7Lfqz6naoYZdwZ6aGuqo7
	 SEasGhjVJWGVYkuyF49FHeS/Jv7MJKFg0v169zRjFOBidVmEqy+nJKzcjb0iMJlOdu
	 So7Zmr170C8rODBhi7Ht9FOHh3tVW3A2a6fK+7K+db+vW7TDcM/TV3BRGnzYcZePB1
	 lz1AWEYLhdblgb5Zf5Ht5HT0K1o+OcYhBawxmjf8SAlN63EXbMVrTCk+WF1qy5akwx
	 H6jbpC494c9LeOnOjWH84JAwxux7qxigunOd9ulbx5eORCJaR/YkaARB4smi6OdHwC
	 py3u5BYUB2b/g==
Date: Tue, 31 Mar 2026 17:45:43 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 7/7] slimbus: qcom-ngd-ctrl: Avoid ABBA on
 tx_lock/ctrl->lock
Message-ID: <acxMiqZnuZJIoBDc@baldur>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
 <20260309-slim-ngd-dev-v1-7-5843e3ed62a3@oss.qualcomm.com>
 <eyitss5zwougawqadgpfb2xa3tv6nbqtlte3iou5aut2neuptw@ehktjxi66a33>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eyitss5zwougawqadgpfb2xa3tv6nbqtlte3iou5aut2neuptw@ehktjxi66a33>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101177-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E78EA3727D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 03:37:10AM +0200, Dmitry Baryshkov wrote:
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
> 
> What will protect ctrl->state from the possible concurrent modification?
> 

Nothing. qcom_slim_ngd_ssr_pdr_notify() might (at least) race with
qcom_slim_ngd_runtime_idle() and qcom_slim_ngd_runtime_suspend().

I think it would make sense to bring the ssr_lock out of
qcom_slim_ngd_up_worker() to ensure that qcom_slim_ngd_ssr_pdr_notify()
can't race with "itself" - but I believe that's still an incomplete fix
in relation to the PM runtime state.

More work will be needed here, beyond this series.

Regards,
Bjorn

> >  			qcom_slim_ngd_down(ctrl);
> >  			qcom_slim_ngd_exit_dma(ctrl);
> >  		}
> > -		mutex_unlock(&ctrl->tx_lock);
> >  		break;
> >  	case QCOM_SSR_AFTER_POWERUP:
> >  	case SERVREG_SERVICE_STATE_UP:
> > 
> > -- 
> > 2.51.0
> > 
> 
> -- 
> With best wishes
> Dmitry

