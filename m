Return-Path: <linux-arm-msm+bounces-94948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCuuEYOVpWnXEAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:49:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B04CD1DA1C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:49:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2A0D30BE2DB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 13:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB9A3E715A;
	Mon,  2 Mar 2026 13:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ki6ZmwPA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994EB30F535;
	Mon,  2 Mar 2026 13:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772459168; cv=none; b=Qc3Lgu2rUNIbTXCtFRSZvpT91JiZfIIXzUyEbwTHi9lWIj/rbiO0g8qD7F8uKQlEN64WmP7K7BrvditisuxjmkWzv7SjdK49fRv+e7xCba/am7e6Z15H7c9cEgga7T3TL4viQv7l13Ank2OqGiGkGdGFlxeTpA0uAdFTVsUYraM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772459168; c=relaxed/simple;
	bh=I+R3e7fdNngm4PXdks/LPqem0J+fQvEYvUydL9mgP2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQioz0LSnpi2jpKpVQhGEVIvVjCvOUiOHBODEDBxNVj5zqY6ZxHiYObcd8TRdvPuDgCQDQxmK4dOGxxgA/wGCNz2rhdLjcuIRx+O9k1mb1G84id/aKkHe8UY+4AQDn029IgN/uuwAF9FyLaRhVTFZgIiBIlHQOAmjpx4c5p8lYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ki6ZmwPA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25A11C19423;
	Mon,  2 Mar 2026 13:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772459168;
	bh=I+R3e7fdNngm4PXdks/LPqem0J+fQvEYvUydL9mgP2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ki6ZmwPAC9Z1C0jVHqDnVUswwoLpxcKAxJpDylkxEOOvZc/g8q8RLE1TgD7wsXDVj
	 GxxVCAYExnzOzpzw9GgBiipWry/F/qlDePlnXCdxJiE98plMsbZNeysY65Ihx9Dgsx
	 OKMfJ0X6djCDc1xbRN08PNsL/maqaPZ08g7OM0FicY575X42GVwbWwf7kifY7OMew3
	 26pP3qajUVnnPkqXiQlRQQRCThJgLXcgOuurz0dh1LKK+OcGDDlEfVfqeo4pQ+W6dZ
	 18BRN9v1KHywqULkn00yIbX9ao0aKDcsHSTUy/DwEXE95rc36Zm3NCUmU/TKr3EkDC
	 XPiIQi+u59JHg==
Date: Mon, 2 Mar 2026 19:15:58 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Qiang Yu <quic_qianyu@quicinc.com>, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Switch to async power up to
 avoid boot delays
Message-ID: <7ftdp7zuqrmppib4abwgk5jcubnfopajcctmyloq7dpk2yhnks@rm7p7fvv6e45>
References: <20260122-mhi_async_probe-v1-1-b5cb2a3629d0@oss.qualcomm.com>
 <vnqrsrglpmzizk2vtee3aohuwop5wynd463bkq6kknq4ploiox@frv5z5yk3kha>
 <aaVhQKZUd+53Uwtl@hu-qianyu-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aaVhQKZUd+53Uwtl@hu-qianyu-lv.qualcomm.com>
X-Rspamd-Server: lfdr
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94948-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B04CD1DA1C7
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 02:06:56AM -0800, Qiang Yu wrote:
> On Mon, Mar 02, 2026 at 01:37:38PM +0530, Manivannan Sadhasivam wrote:
> > On Thu, Jan 22, 2026 at 12:53:48AM -0800, Qiang Yu wrote:
> > > Some modem devices can take significant time (up to 20 secs for sdx75) to
> > > enter mission mode during initialization. Currently, mhi_sync_power_up()
> > > waits for this entire process to complete, blocking other driver probes
> > > and delaying system boot.
> > > 
> > > Switch to mhi_async_power_up() so probe can return immediately while MHI
> > > initialization continues in the background. This eliminates lengthy boot
> > > delays and allows other drivers to probe in parallel, improving overall
> > > system boot performance.
> > > 
> > 
> > This part is fine.
> > 
> > > Add pm_runtime_forbid() in remove path to prevent device suspend during
> > > driver reinstallation. This issue is specific to async power up: with
> > > sync power up, pm_runtime_put_noidle() is called after mission mode is
> > > reached because mhi_sync_power_up() waits for mission mode event. With
> > > async power up, pm_runtime_put_noidle() is called immediately while power
> > > up process continues in background, which can cause the device to
> > > suspend and mhi init fail if pm_runtime_allow() from a previous probe
> > > is still active.
> > > 
> > 
> > pm_runtime_forbid() should be called at the start of the remove() callback to
> > prevent the device from auto suspending during cleanup and to fix the issue you
> > described above.
> > 
> > So do in a separate patch and add a Fixes tag pointing to the commit that added
> > the Runtime PM support.
> >
> 
> I can implement this in a separate patch as it also serves as a cleanup to
> call pm_runtime_forbid() in the remove callback, since we call
> pm_runtime_allow() in our driver. However, I cannot call it at the start
> of the remove() callback. Before the remove callback is invoked,
> pci_device_remove() calls pm_runtime_get_sync(dev) first, so we don't need
> to worry about auto-suspend during removal.
> 

Three issues here:

1. remove() callback uses pm_runtime_get_noresume(), which wouldn't guarantee
that the driver will be resumed (if suspended) during remove operation. So there
is a good chance that the device access will fail.

2. Moreover, pm_runtime_get_noresume() is called at the end of the remove()
callback, which is also too late.

3. Even if the above two gets fixed, we should make sure that the autosuspend
should be stopped before executing remove() as the autosuspend timer will start
and expire in parallel. This is not causing any issue as of now, but it would be
canolical to fix it.

I've submitted a fix for the first two issues:
https://lore.kernel.org/mhi/20260302134116.18960-1-manivannan.sadhasivam@oss.qualcomm.com

You should fix the third one in a separate patch in this series. Hope this
clarifies!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

