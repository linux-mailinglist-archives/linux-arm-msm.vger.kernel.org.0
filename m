Return-Path: <linux-arm-msm+bounces-92914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6yDlMmn0kmkS0gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 11:41:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DF81426DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 11:41:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C11623009520
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 10:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4827D2FFF9B;
	Mon, 16 Feb 2026 10:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WD1wYf5U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2587D239099
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 10:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771238503; cv=none; b=p5GGKUxYcgpbW6xPmkIRYTM7uP0FHCaskahP5r3acNcyxm4U9bn7UqY6/2RTGuyY3i1+Cyt036YCuKCEQHS3t4FgES/NJBsaWLxyZeWNWC0zdPq2e9VRxghAY0xQNoYERULmD7lkrdaJFx1wk1qWlASTUXqq0gh/yyg/1WR9gmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771238503; c=relaxed/simple;
	bh=gz+Bkg7Hm+LIbTebWklcCLYcJyitSgHeu8WvkTXpLis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4QKinopcLPjpmMEgyX9xMd5w2sZGWYoN3kuCgUDc6e/+jXhY0MV1Rv4AneuPxmX8VGeZtIfxYcXczg0ldD7oGXJKt2XfrYLy3o4X4s3mUSbEnjpr/6nshUgm3lrDpmElMN+atlgLBCT/bWvFk6NEbo6rSGcGeAU+NN6XVO8OoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WD1wYf5U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5AB5C19422;
	Mon, 16 Feb 2026 10:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771238502;
	bh=gz+Bkg7Hm+LIbTebWklcCLYcJyitSgHeu8WvkTXpLis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WD1wYf5Uh42SaCiML58TMhtZiwCODawtKV4wLQdkwvLmAP2uUvqm/iMyWrsN0eqOu
	 TIvV74JufuwbS8j5euvDST3q9cPilJJVtUURlqwx9q5Qq15nsv3p+ZTVJvR7/a6Zul
	 4ZMhYFNUBYxLUnHxBV798eNkLm3DYwpo0WOnBUJKhJtqvb1bVFl4pjSo8tcgyuqkHV
	 nkGg9QkWGvMq1xCG+L5GeQHV9NjjFIy5oMjzfA6qiaKKQruAErwp1pNrI3zqTJCGdk
	 P/Dvw5Oc9YBzpheUsTO2LNRPawXu6pWdHjjyd5mNiBeJM7VbDAv7sTfw5PUiEe2t8z
	 ktkLuWLkwn1mg==
Received: from johan by rho.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vrw2s-000000000Rz-2iKl;
	Mon, 16 Feb 2026 11:41:38 +0100
Date: Mon, 16 Feb 2026 11:41:38 +0100
From: Johan Hovold <johan@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/5] phy: qcom: snps-femto-v2: Fix possible NULL-deref
 on early runtime suspend
Message-ID: <aZL0YhiDcUwKaIz4@hovoldconsulting.com>
References: <20260205160240.748371-1-loic.poulain@oss.qualcomm.com>
 <20260205160240.748371-6-loic.poulain@oss.qualcomm.com>
 <aY7pvakkOnaYsd5p@hovoldconsulting.com>
 <CAFEp6-3yk3sPXj+hGuWvAFsFJAXjH4kWLV8k_5_v9Hax0XxaOg@mail.gmail.com>
 <aY8Asvu-1u0e02oJ@hovoldconsulting.com>
 <CAFEp6-0rzkqc0ajN72q=mv3U-TT0JHMSPmnJD6ohKuLmbPz2-A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-0rzkqc0ajN72q=mv3U-TT0JHMSPmnJD6ohKuLmbPz2-A@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92914-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hovoldconsulting.com:mid]
X-Rspamd-Queue-Id: 20DF81426DB
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 04:04:43PM +0100, Loic Poulain wrote:
> On Fri, Feb 13, 2026 at 11:45 AM Johan Hovold <johan@kernel.org> wrote:

> > But I'm literally asking for *what* would trigger the suspend in that
> > initial window between enable() and forbid() cause I don't see it.
> 
> To be honest, I had not initially looked into the exact cause of the
> suspend trigger until now, but here is what is happening.
> 
> The PHY is a supplier of the USB device. A USB device cannot be probed
> until all its suppliers are ready. As long as the PHY is not ready, the
> device core keeps retrying the probe, which fails with -EPROBE_DEFER.
> 
> At some point the PHY probe finally runs, but the device core may still be
> attempting to probe the USB device concurrently.
> 
> Inside __driver_probe_device(), we have:
> 
>     ret = really_probe(dev, drv);
>     pm_request_idle(dev);
> 
>     if (dev->parent)
>         pm_runtime_put(dev->parent);
> 
>     pm_runtime_put_suppliers(dev);
>     return ret;
> 
> This means that whenever a USB probe attempt completes, whether with an
> error or not, its suppliers are released via pm_runtime_put_suppliers().
> Releasing suppliers may in turn trigger a runtime suspend.
> 
> In our case, since the PHY is a supplier of the USB device, the USB core
> keeps 'looping' in __driver_probe_device() returning -EPROBE_DEFER until
> the PHY becomes ready. As a result, pm_runtime_put_suppliers() may run
> concurrently with the PHY's probe function. If this happens after
> runtime PM has been enabled for the PHY, but before the driver has
> forbidden suspend or taken a PM reference, the PHY may end up being
> runtime-suspended 'unexpectedly'.

Thanks for tracking that down. That's an unexpected side effect of
fw_devlink adding runtime pm enabled links (which is the default
behaviour since late 2023).

Johan

