Return-Path: <linux-arm-msm+bounces-99522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MwkD7H5wWlSYgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:40:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A58301426
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C7C5303C286
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5462F38642A;
	Tue, 24 Mar 2026 02:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ss9s4b6C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B204285072;
	Tue, 24 Mar 2026 02:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774319813; cv=none; b=JHOE6eZ3OWasdTa3HpfyT9/H8luLL6krlhWeRbrA3Wv/uaf8r6KtT8UHtQLSJPOmS8GDFg5Ku27MkrfAfxv6T07gpf5h9Lxsc3WFMmlxdLCnUyEN1FeQSIGByJjyj0Zk4yd0JsL+EmUvHpNCgTpZ2Go9+NdcguvCWheQfnT7DI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774319813; c=relaxed/simple;
	bh=xhPHUppt3YgV5Yf0MAsA7TMRhgcRUI0+2A82HXnTJJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=buh54J+xddADn1e3W3u9MgCvxfZgK97Nj3Vha29EqXYa+VgnRu56Rqo/2NXgazoA7AA+QA47/8Kt4UujmFOuFo2XgpkB+9pcn6wLW+1z7TrwtYXHr/aKy83/LGXxJrt6Ot3tSHd38peEe0ZK7e4gYCE04lJyik6WDWESvUGWKNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ss9s4b6C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10BEBC4CEF7;
	Tue, 24 Mar 2026 02:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774319812;
	bh=xhPHUppt3YgV5Yf0MAsA7TMRhgcRUI0+2A82HXnTJJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ss9s4b6CvGwNcIomu6b2tFVVW80RENBkvAZXxtBj3KeQJzCccGBLVu8AyjM79KlEu
	 39OBD7Gy/4Hi5ehXRrmOySvDQZMTsy1nc+BVt4/zU0WfwNSUBi49ULpT9GrYYXjrab
	 +43mXMZzfRUqU9BH3nWtJUpbTDx87V+4XISyr6RN2t6AQkgt5lusnMSu+Hwy4sm6Lq
	 Rtg2aLz89OavCeAhWKalk22z0lUQOujlCwWkzpepZTToMliDJftKGNUU1NSGH8V3m3
	 917K25P8wONAkJ5gfHnSRVyQoRF1f2bxmoepRr4D4j/g0L13TmRwfgdI+yP/tFVT2y
	 53P4PNpXGhjjg==
Date: Mon, 23 Mar 2026 21:36:49 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 3/7] slimbus: qcom-ngd-ctrl: Correct PDR and SSR cleanup
 ownership
Message-ID: <acH4WGLAfJnyzK9H@baldur>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
 <20260309-slim-ngd-dev-v1-3-5843e3ed62a3@oss.qualcomm.com>
 <20260310073933.ttble7algoiy7rwq@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310073933.ttble7algoiy7rwq@hu-mojha-hyd.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99522-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 96A58301426
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 01:09:33PM +0530, Mukesh Ojha wrote:
> On Mon, Mar 09, 2026 at 11:09:04PM -0500, Bjorn Andersson wrote:
> > PDR and SSR callbacks are registred from the controller probe function,
> > but currently released from the child device's remove function.
> > 
> > In the next commit the controller probe function will be modified such
> > that the error path will unregister the child device, resulting in a
> > double free of these resources.
> 
> Change is fine, Could this not be accommodated in the next commit?
> 

The problem solved by patch 4 relates to the oreder that we're acquiring
the resources in probe and how the error handling of that works.

If I squash the two patches, it seems that I would have a lengthy commit
message talking about that part and then a "also, while at it move the
unregister from X to Y because...".

I.e. it doesn't feel like the same logical change to me.

Please let me know if you disagree.

Regards,
Bjorn

> > 
> > Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> > ---
> >  drivers/slimbus/qcom-ngd-ctrl.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> > index b34e727bab086c95dc7e760bf1141baac9ccf6a7..09ce3299e15c25b1b9cf6b1559850adf4aa20737 100644
> > --- a/drivers/slimbus/qcom-ngd-ctrl.c
> > +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> > @@ -1685,6 +1685,9 @@ static void qcom_slim_ngd_ctrl_remove(struct platform_device *pdev)
> >  {
> >  	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
> >  
> > +	pdr_handle_release(ctrl->pdr);
> > +	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
> > +
> >  	qcom_slim_ngd_unregister(ctrl);
> >  }
> >  
> > @@ -1693,8 +1696,6 @@ static void qcom_slim_ngd_remove(struct platform_device *pdev)
> >  	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
> >  
> >  	pm_runtime_disable(&pdev->dev);
> > -	pdr_handle_release(ctrl->pdr);
> > -	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
> >  	qcom_slim_ngd_enable(ctrl, false);
> >  	qcom_slim_ngd_exit_dma(ctrl);
> >  	qcom_slim_ngd_qmi_svc_event_deinit(&ctrl->qmi);
> > 
> > -- 
> > 2.51.0
> > 
> 
> -- 
> -Mukesh Ojha

