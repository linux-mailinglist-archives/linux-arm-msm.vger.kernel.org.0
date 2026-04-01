Return-Path: <linux-arm-msm+bounces-101192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIhoIo6NzGnVTwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:14:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A06374276
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A9F130490CC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 03:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE2D736D500;
	Wed,  1 Apr 2026 03:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VdkeDsFG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486FB363C69;
	Wed,  1 Apr 2026 03:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775012776; cv=none; b=u1GsmxCjyULAYNB4+tR/G6x1vXg+SqQUM/Kf8IHkvbcvR2WEjsPa1jn8ON8EXdOeLl6yZQ59xi3ybiYUU8lEZ/mmnxVvCugGjCpDWZDZE5ELdN5+14gwzqcZmqkkIeQi5X+WnNBIX6kBClQ7A04CMI5tinDS83oD6oMPGKiFUCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775012776; c=relaxed/simple;
	bh=Tp0Ijbb+7BUqRqT/cYdpvNBqWp29ck4byQ+fqVrlIJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+LYEQNJkm+Isd9+drGWRjyQOCn+1ySKldzZpIdFc0HtW1/DieWIPdKL/QbL7bBU629fD7Ln6IXd6xI4+1b8f8GnrvWgcTZ9ECVxtGKZctyXkmya1r82SMtU0N7THfNLeiZCTdHxwns85r+wVZOQUEKDCSBams3XiFzmOUTZ/6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VdkeDsFG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D740AC19423;
	Wed,  1 Apr 2026 03:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775012775;
	bh=Tp0Ijbb+7BUqRqT/cYdpvNBqWp29ck4byQ+fqVrlIJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VdkeDsFGMHF16TFgHpnTSZYA+AfnWqoxxMaSN8YXqy+EXWjwh5NBUsz+AePVsUmp1
	 vOyAQ5OwiBHlNg6S2f8HcUm7JCRky5BYvsH/jfBEmRpb0JMOTZ/eNW+uLLWDtqTUOq
	 NJEinLp3dnu9K9nu7AtKld2aFa2Wtsl2b/GPL0obGLmh6EGLBFLq63IVZmV41VaYoP
	 ywE4lulxiSN9sHoEqkqmAW9cYFcatfqWHL4t41wuHnGly1NjPFOzyZUQ77XQXqD0Fn
	 +Lsy4yMPtNkejT4csNBE0Ol7vd4vG6vjthIM6mnCvCacrpryQUPUcw6xjvyJwMNLy3
	 1TWUimvkek5pQ==
Date: Tue, 31 Mar 2026 22:06:11 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 1/7] slimbus: qcom-ngd-ctrl: Fix up platform_driver
 registration
Message-ID: <acyLI4FWUOue6cFL@baldur>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
 <20260309-slim-ngd-dev-v1-1-5843e3ed62a3@oss.qualcomm.com>
 <20260310073309.djxq5zsyudhjob73@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310073309.djxq5zsyudhjob73@hu-mojha-hyd.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101192-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E5A06374276
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 01:03:09PM +0530, Mukesh Ojha wrote:
> On Mon, Mar 09, 2026 at 11:09:02PM -0500, Bjorn Andersson wrote:
> > Device drivers should not invoke platform_driver_register()/unregister()
> > in their probe and remove paths. They should further not rely on
> > platform_driver_unregister() as their only means of "deleting" their
> > child devices.
> > 
> > Introduce a helper to unregister the child device and move the
> > platform_driver_register()/unregister() to module_init()/exit().
> > 
> > Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> > ---
> >  drivers/slimbus/qcom-ngd-ctrl.c | 36 +++++++++++++++++++++++++++++++++---
> >  1 file changed, 33 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> > index 9aa7218b4e8d2b350835626839371ed6e19860e2..c69656a0ef1766d5a9df40bdf37bae8f64789fab 100644
> > --- a/drivers/slimbus/qcom-ngd-ctrl.c
> > +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> > @@ -1562,6 +1562,13 @@ static int of_qcom_slim_ngd_register(struct device *parent,
> >  	return -ENODEV;
> >  }
> >  
> > +static void qcom_slim_ngd_unregister(struct qcom_slim_ngd_ctrl *ctrl)
> > +{
> > +	struct qcom_slim_ngd *ngd = ctrl->ngd;
> > +
> > +	platform_device_del(ngd->pdev);
> 
> First, it surprised me why only once, then I saw there is return 0 in
> for_each_available_child_of_node_scoped() loop..
> 

Yeah, I'm not sure about that one. If I read the binding correctly it
allows for an arbitrary number of child devices, but the implementation
will only consider the first active child, and silently ignore any
others.

I don't know if it's a valid usecase to have multiple NGDs on a
controller thought?

Regards,
Bjorn

> > +}
> > +
> >  static int qcom_slim_ngd_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> > @@ -1664,7 +1671,6 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
> >  		goto err_pdr_lookup;
> >  	}
> >  
> > -	platform_driver_register(&qcom_slim_ngd_driver);
> >  	return of_qcom_slim_ngd_register(dev, ctrl);
> >  
> >  err_pdr_alloc:
> > @@ -1678,7 +1684,9 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
> >  
> >  static void qcom_slim_ngd_ctrl_remove(struct platform_device *pdev)
> >  {
> > -	platform_driver_unregister(&qcom_slim_ngd_driver);
> > +	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
> > +
> > +	qcom_slim_ngd_unregister(ctrl);
> >  }
> >  
> >  static void qcom_slim_ngd_remove(struct platform_device *pdev)
> > @@ -1754,6 +1762,28 @@ static struct platform_driver qcom_slim_ngd_driver = {
> >  	},
> >  };
> >  
> > -module_platform_driver(qcom_slim_ngd_ctrl_driver);
> > +static int qcom_slim_ngd_init(void)
> > +{
> > +	int ret;
> > +
> > +	ret = platform_driver_register(&qcom_slim_ngd_ctrl_driver);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = platform_driver_register(&qcom_slim_ngd_driver);
> > +	if (ret)
> > +		platform_driver_unregister(&qcom_slim_ngd_ctrl_driver);
> > +
> > +	return ret;
> > +}
> > +
> > +static void qcom_slim_ngd_exit(void)
> > +{
> > +	platform_driver_unregister(&qcom_slim_ngd_driver);
> > +	platform_driver_unregister(&qcom_slim_ngd_ctrl_driver);
> > +}
> > +
> > +module_init(qcom_slim_ngd_init);
> > +module_exit(qcom_slim_ngd_exit);
> >  MODULE_LICENSE("GPL v2");
> >  MODULE_DESCRIPTION("Qualcomm SLIMBus NGD controller");
> > 
> > -- 
> > 2.51.0
> > 
> 
> -- 
> -Mukesh Ojha

