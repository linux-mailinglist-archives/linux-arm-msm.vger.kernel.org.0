Return-Path: <linux-arm-msm+bounces-101191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJ4oIN+JzGlXTgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 04:58:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00496374143
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 04:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA930300E3DD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 02:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC2836EAA8;
	Wed,  1 Apr 2026 02:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b74buEWd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3A836E493;
	Wed,  1 Apr 2026 02:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775012050; cv=none; b=CMHQyRHkCbRRjriSNLNuFfxpsc8OXKhVp2JpW1tte0z7uog6mExQMJusCRghO291tcDQsbcm9Wr40Qawr6JGSwZH7Ql1FYszxhsGLUE2hvQ+9YtqjDg+65E/DIpo2QvuJpKNeK13tFgc2lOo6zw45CDma9dWCNfIzF7Y1eYLMiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775012050; c=relaxed/simple;
	bh=O5X7lcPD1ZDeQusDyz2Ikf6zqk7JQPK0rRhOMxOXdCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHfTEdwEND0v38AcYbb/k/aMSZ3DSekGSq+iHoZ5SMMPni/bK0rI3U+BpdA38IJXwgVvc3mVvEDheFQGCiDBrXOdxlqOJZ4BDhKXZvbBWRltPbMfjBD7lRAyiOhSo9HB7d9hTQSTQwJfoAAEj/QQYMlt3ldvpnSZYF9aM7wT2fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b74buEWd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62CA3C19423;
	Wed,  1 Apr 2026 02:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775012049;
	bh=O5X7lcPD1ZDeQusDyz2Ikf6zqk7JQPK0rRhOMxOXdCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b74buEWdygfOrK+ixxWQUDq9hejQGdBedmKFt3pdBIDh3+QJNLjJvWYC+Emv6rXNR
	 38L3jvRrz64Vm3jiFgGvoojpOT42Fz8OAu/xhNuFUlLQ/YthHo7/Z/dQY76lSia4Ax
	 4C8DpoC/7HDcoxEq8KXpf5+IGLuL7XFOO9IQHW/JQKlo6FxSZeX0jd1cG3rNSWHEeo
	 HFVJKUDEdVf2tcRYNaJpQaQvfcQT3orfnp2gdpt/EASmvdqmnkmlxSBx9JLnitStm2
	 9IlzAA25z3D6PrNJM/0mndmapWKhRPgO0c2V6AgzXVLMLCHR1dfAinx0GQhIRhl2rI
	 Us4/JtizU1UKA==
Date: Tue, 31 Mar 2026 21:54:05 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 0/7] slimbus: qcom-ngd-ctrl: Fix some race conditions and
 deadlocks
Message-ID: <acyEDJK4nkqsOHvM@baldur>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
 <noodhyin3en2l5xravmt5l6dslcz74na5akin24zod2zhmsevo@pqtxi5ydbidx>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <noodhyin3en2l5xravmt5l6dslcz74na5akin24zod2zhmsevo@pqtxi5ydbidx>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101191-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 00496374143
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 03:40:46AM +0200, Dmitry Baryshkov wrote:
> On Mon, Mar 09, 2026 at 11:09:01PM -0500, Bjorn Andersson wrote:
> > When the qcom-ngd-ctrl driver is probed after the ADSP remoteproc, the
> > SSR notifier will fire immediately, which results in
> > qcom_slim_ngd_ssr_pdr_notify() attempting to schedule_work() on an
> > unitialized work_struct.
> > 
> > The concrete result of this is that my db845c/RB3 now fails to boot 100%
> > of the time.
> > 
> > In reviewing the problematic code, a few other problems where
> > discovered, such that platform_driver_unregister() is used to unregister
> > the child device.
> > 
> > Lastly, with the db845c booting, it was determined that attempting to
> > stop the ADSP remoteproc causes the slimbus driver to deadlock.
> > 
> > Note that while this solves the problems described above, and unblock
> > boot as well as restart of the remoteproc, this stack needs more love.
> > 
> > Upon tearing down the slimbus controller (when the ADSP goes down), the
> > slimbus devices attempts to access their slimbus devices - which is
> > prevented by the controller being runtime suspended. This results in a
> > wall of errors in the log, about failing transactions.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> > Bjorn Andersson (7):
> >       slimbus: qcom-ngd-ctrl: Fix up platform_driver registration
> >       slimbus: qcom-ngd-ctrl: Fix probe error path ordering
> >       slimbus: qcom-ngd-ctrl: Correct PDR and SSR cleanup ownership
> >       slimbus: qcom-ngd-ctrl: Register callbacks after creating the ngd
> >       slimbus: qcom-ngd-ctrl: Initialize controller resources in controller
> >       slimbus: qcom-ngd-ctrl: Balance pm_runtime enablement for NGD
> >       slimbus: qcom-ngd-ctrl: Avoid ABBA on tx_lock/ctrl->lock
> > 
> >  drivers/slimbus/qcom-ngd-ctrl.c | 127 +++++++++++++++++++++++++---------------
> >  1 file changed, 80 insertions(+), 47 deletions(-)
> > ---
> > base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
> > change-id: 20260211-slim-ngd-dev-74166f29f035
> > 
> > Best regards,
> > -- 
> > Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
> Bjorn,
> 
> While you are at it, it looks like there is another possible issue:
> ngd->base is set after platform_device_add(), possibly letting NGD
> driver to use uninitialized base.
> 

ngd->base is only dereferences from qcom_slim_ngd_up_worker() and
qcom_slim_ngd_runtime_resume(), so at this time there's no concrete
problem here.

I'll keep it in mind as I continue to poke at the driver.

Regards,
Bjorn

> -- 
> With best wishes
> Dmitry

