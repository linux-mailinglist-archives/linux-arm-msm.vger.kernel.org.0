Return-Path: <linux-arm-msm+bounces-93541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cqTCG+ktmWmfRQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Feb 2026 05:00:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0940916C14D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Feb 2026 05:00:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4D1DF30078AD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Feb 2026 04:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1463626B2AD;
	Sat, 21 Feb 2026 04:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KeBjgInW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35078F4A;
	Sat, 21 Feb 2026 04:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771646438; cv=none; b=MbclKbL4u7eIn1PW1KOqiqN0jAcd/gHSOUNRGqzdOk0kRNVWQL/HxhvamDP/XBwNGV0eiLWvAv+N5kg3rSwq+6EM39xnn4vh9GayY9xY7GHVlSMHT6XhWfMxQpFzMmzcc6qC/qDThoJJkZDQZNWbNr+Ln7TNNWE4W0xOOMIkvu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771646438; c=relaxed/simple;
	bh=+WNMkY5JJm1kzCFBm/Q4pq2jKDqzBRCLdPN1FXaIK14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YjszMocGWnbUEb1BkZiFGhpiD343rUtRDI7UgFSi3F2gZOvQCyP6Sz/vpkuQPNTWhQi63MyGNF/NHXcNVGyJucXudzcwiuehwpwX/w+aEO3bMcrnGzCCC4Fk51/OlQ0VW2bR6lW/Z1PZqbfk5wpjeyIWgshD8E+AunkFDOMLBoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KeBjgInW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB901C4CEF7;
	Sat, 21 Feb 2026 04:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771646437;
	bh=+WNMkY5JJm1kzCFBm/Q4pq2jKDqzBRCLdPN1FXaIK14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KeBjgInW/dRSJYmCWVJLxuue7TvblcOd2M79c1eBSJDzZ2XspdgasZZpV27SvVtY+
	 qJk7EAgbhL+FiS8G1mnktE5zhHdmjbcj/tEVsShWhTKiuQGEVEezUOu0RfuhjMV5pQ
	 n6vbQpIY7Tc9+oDCDybx4cLyEYpNv3W8GhK4KRq/dCPHj8qXyQCT2d//ul81JuyvNx
	 203Cy+7IH9VGH4t7zFzCmfrjOWWuSoIXTDqua9RhguqGsDKL9ON1puoOK7RGgM/r6K
	 SvKCx3mhhos+gjRQlIuzdLO0mewErm4spl9BHypj02KeGp23AGrQdHggrb2RMVRD0J
	 gVqIxyQ+rlvJw==
Date: Fri, 20 Feb 2026 22:00:34 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: quic_utiwari@quicinc.com, herbert@gondor.apana.org.au, 
	thara.gopinath@gmail.com, davem@davemloft.net, linux-crypto@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, quic_neersoni@quicinc.com
Subject: Re: [PATCH v7] crypto: qce - Add runtime PM and interconnect
 bandwidth scaling support
Message-ID: <fnsagbqvriuxdz4xrvs76kwovu3oir3662tu4niii56tgz2cag@zrxyd36qmujb>
References: <20260220072818.2921517-1-quic_utiwari@quicinc.com>
 <ab5725df-8454-4e3d-8806-a711ef0e6a42@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab5725df-8454-4e3d-8806-a711ef0e6a42@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93541-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[quicinc.com,gondor.apana.org.au,gmail.com,davemloft.net,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0940916C14D
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 10:52:04AM +0100, Konrad Dybcio wrote:
> On 2/20/26 8:28 AM, quic_utiwari@quicinc.com wrote:
> > From: Udit Tiwari <quic_utiwari@quicinc.com>
> > 
> > The Qualcomm Crypto Engine (QCE) driver currently lacks support for
> > runtime power management (PM) and interconnect bandwidth control.
> > As a result, the hardware remains fully powered and clocks stay
> > enabled even when the device is idle. Additionally, static
> > interconnect bandwidth votes are held indefinitely, preventing the
> > system from reclaiming unused bandwidth.
> > 
> > Address this by enabling runtime PM and dynamic interconnect
> > bandwidth scaling to allow the system to suspend the device when idle
> > and scale interconnect usage based on actual demand. Improve overall
> > system efficiency by reducing power usage and optimizing interconnect
> > resource allocation.
> 
> [...]
> 
> 
> > +static int __maybe_unused qce_runtime_suspend(struct device *dev)
> 
> I think you should be able to drop __maybe_unused if you drop the
> SET_ prefix in pm_ops

I believe that's correct.

> and add a pm_ptr() around &qce_crypto_pm_ops in
> the assignment at the end
> 

Doesn't that turn into NULL if CONFIG_PM=n and then you get a warning
about unused struct?

> > +{
> > +	struct qce_device *qce = dev_get_drvdata(dev);
> > +
> > +	icc_disable(qce->mem_path);
> 
> icc_disable() can also fail, since under the hood it's an icc_set(path, 0, 0),
> please check its retval
> 

Given that the outcome of returning an error from the runtime_suspend
callback is to leave the domain in ACTIVE state I presume that also
means we need to turn icc_enable() again if pm_clk_suspend() where to
fail?


Two things I noted while looking at icc_disable():

1) icc_bulk_disable() return type is void. Which perhaps relates to the
fact that qcom_icc_set() can't fail?


2) Error handling in icc_disable() is broken.

icc_disable() sets enabled = false on the path, then calls icc_set_bw()
with the current bandwith again. This stores the old votes, then calls
aggregate_requests() (which ignored enabled == false votes) and then
attempts to apply_contraints().

If the apply_contraints() fails, it reinstate the old vote (which in
this case is the same as the new vote) and then does the
aggregate_requests() and apply_contraints() dance again.

I'm assuming the idea here is to give the provider->set() method a
chance to reject the new votes.


But during the re-application of the old votes (which are same as the
new ones) enabled is still false across the path, so we're not
reinstating anything and while we're exiting icc_disabled() with an
error, the path is now disabled - in software, because we have no idea
what the hardware state is.

Regards,
Bjorn

> > +
> > +	return pm_clk_suspend(dev);
> > +}
> > +
> > +static int __maybe_unused qce_runtime_resume(struct device *dev)
> > +{
> > +	struct qce_device *qce = dev_get_drvdata(dev);
> > +	int ret = 0;
> 
> No need to initialize it here, as you overwrite this zero immediately
> a line below anyway
> 
> > +
> > +	ret = pm_clk_resume(dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = icc_set_bw(qce->mem_path, QCE_DEFAULT_MEM_BANDWIDTH, QCE_DEFAULT_MEM_BANDWIDTH);
> > +	if (ret)
> > +		goto err_icc;
> 
> Normally I think bus votes are cast before clock re-enables to make sure
> the hw doesn't try to access a disabled bus path
> 
> Konrad
> 
> > +
> > +	return 0;
> > +
> > +err_icc:
> > +	pm_clk_suspend(dev);
> > +	return ret;
> > +}
> > +
> > +static const struct dev_pm_ops qce_crypto_pm_ops = {
> > +	SET_RUNTIME_PM_OPS(qce_runtime_suspend, qce_runtime_resume, NULL)
> > +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> > +};
> > +
> >  static const struct of_device_id qce_crypto_of_match[] = {
> >  	{ .compatible = "qcom,crypto-v5.1", },
> >  	{ .compatible = "qcom,crypto-v5.4", },
> > @@ -261,6 +323,7 @@ static struct platform_driver qce_crypto_driver = {
> >  	.driver = {
> >  		.name = KBUILD_MODNAME,
> >  		.of_match_table = qce_crypto_of_match,
> > +		.pm = &qce_crypto_pm_ops,
> >  	},
> >  };
> >  module_platform_driver(qce_crypto_driver);
> 

