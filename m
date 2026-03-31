Return-Path: <linux-arm-msm+bounces-101179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIXUNEZSzGmvSQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 01:01:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D363728E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 01:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 00DB9301D4D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 23:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2973A962E;
	Tue, 31 Mar 2026 23:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cvmbGkiR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DD739DBD4;
	Tue, 31 Mar 2026 23:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774998004; cv=none; b=up8SOdCogSh7hw4nYD0yjw+hphI6FdIqyqVj1lP+6yGQMn1Z5+7HEGOiIO+rD4NwgjbcOTNzKQCXjtDni7+bangcdBoRXw8YZfMGx+GKv9fINbryrLlztMEH3be5DX+TwXXw3uxL0yDlWcpErPcOb2tyd1nceGGupaXHIV23DEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774998004; c=relaxed/simple;
	bh=wAZncBDwQwOuR44nK4v4tmMHviN2u3z1Mq/RMS8bO+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KucI3pgHp6dVfh4ZIwUh7eWa7+KjRjCzTRh+OAN5iyuPyWaAjRxENWXThqiDXWSOrZ5VTovFLwCQqas4BAF0C2lS9qSQIBHJ1mPzoGSxbtPzdz39/AhBDLxUgJ2ktCOW9R7FGr1uJj8Ppcm84tICHqb6sL0WofSewuUd3mkjCNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cvmbGkiR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCBE8C19423;
	Tue, 31 Mar 2026 23:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774998003;
	bh=wAZncBDwQwOuR44nK4v4tmMHviN2u3z1Mq/RMS8bO+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cvmbGkiRPrw50EWaHalmSjA+aVj6I3tp7fJphPuyN1zvJdBjf+4tkABhCOyo/JIUp
	 rdIQL4n8OHNCtiNA5TTuF1qWOxHoNpfBjpORiX8TKR6+TJ3vizzoeb+GxNzdwwu8fN
	 03y1U/I919fZqM1+/FCEMQDoydAT8u1E3uualWBxHk37PWSOjkiMcZfaoFG7u3pdyL
	 bKNpPn05HjCCm93trmIsQq6ntZadmzX/L8Lgi+j/Yvvn9/MRUOQdHYfbKmXKzZZrDD
	 i3UCs2iJz0Bdiq+R4ju7kRbCBN8qwCyfBo8dnwao3pYuzcdJbCFmXgYvW/qy7obU5u
	 9SXzbn10ZHt9g==
Date: Tue, 31 Mar 2026 17:59:59 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 6/7] slimbus: qcom-ngd-ctrl: Balance pm_runtime
 enablement for NGD
Message-ID: <acxQ8tQIK90N9Nao@baldur>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
 <20260309-slim-ngd-dev-v1-6-5843e3ed62a3@oss.qualcomm.com>
 <20260310080025.lbof4hj5zqytc3vy@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310080025.lbof4hj5zqytc3vy@hu-mojha-hyd.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101179-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 54D363728E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 01:30:25PM +0530, Mukesh Ojha wrote:
> On Mon, Mar 09, 2026 at 11:09:07PM -0500, Bjorn Andersson wrote:
> > The pm_runtime_enable() and pm_runtime_use_autosuspend() calls are
> > supposed to be balanced on exit, add these calls.
> > 
> > Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> >  drivers/slimbus/qcom-ngd-ctrl.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> > index d932f7fd6170773890f561e3af444ac2c5730338..54a4c6ee1e71fe55794f09575979826d9aa5be9f 100644
> > --- a/drivers/slimbus/qcom-ngd-ctrl.c
> > +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> > @@ -1584,8 +1584,11 @@ static int qcom_slim_ngd_probe(struct platform_device *pdev)
> >  	pm_runtime_enable(dev);
> >  	pm_runtime_get_noresume(dev);
> >  	ret = qcom_slim_ngd_qmi_svc_event_init(ctrl);
> > -	if (ret)
> > +	if (ret) {
> >  		dev_err(&pdev->dev, "QMI service registration failed:%d", ret);
> > +		pm_runtime_dont_use_autosuspend(dev);
> > +		pm_runtime_disable(dev);
> > +	}
> 
> Can this entire pm_runtime_* calls moved after
> qcom_slim_ngd_qmi_svc_event_init() ?
> 

As soon as qcom_slim_ngd_qmi_svc_event_init() executes we might get a
qcom_slim_ngd_qmi_new_server() if the service is already up which would
complete(qmi_up), which would unblock qcom_slim_ngd_up_worker() which
will invoke qcom_slim_ngd_enable() which currently operates
conditionally on pm_runtime_enabled().

So, what you're proposing does make some sense, but I think we should
try to clean that up in a subsequent series.

Regards,
Bjorn

> >  
> >  	return ret;
> >  }
> > @@ -1699,6 +1702,7 @@ static void qcom_slim_ngd_remove(struct platform_device *pdev)
> >  {
> >  	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
> >  
> > +	pm_runtime_dont_use_autosuspend(&pdev->dev);
> >  	pm_runtime_disable(&pdev->dev);
> >  	qcom_slim_ngd_enable(ctrl, false);
> >  	qcom_slim_ngd_exit_dma(ctrl);
> > 
> > -- 
> > 2.51.0
> > 
> 
> -- 
> -Mukesh Ojha

