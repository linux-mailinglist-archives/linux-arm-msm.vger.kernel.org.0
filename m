Return-Path: <linux-arm-msm+bounces-103567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eM0eFMG04mls9QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 00:31:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A910A41EE59
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 00:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A04DD3055D75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 22:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B421B346FAD;
	Fri, 17 Apr 2026 22:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uHokZ8Jm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C16282F2C;
	Fri, 17 Apr 2026 22:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776464946; cv=none; b=g2lvfDBO+MkyCIevGogCdyvFVH7hqHRrjoNqJGZcm+wq/omzNDZl1MtGfTrmX53Wt366luaOcFZCmr0J70ULeetzmyLLtBS9jvCuwhm8Yeh5fyxVO64HPweyCvDDbOqEaUrOV4i8ejx9iINGB5uRxkpT8LodWvZ5TxG7xjctHAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776464946; c=relaxed/simple;
	bh=5AZF7bXelQGRzqbFL48OEydTjXw5VXz9hXvYPhUg7As=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=a63j4g6gLxyTl7/eDkAsPZmYJnxZoMYrm7bVOOjKbCPCXiJ1bwvEecH2GrmhUan0Vl8PXv03r3WkazE70yedQfn6zzgQGKXeYz8gP6WzKcVSz8BdpRwQTFmpJbTp4DVHxzrte6gdiB5TG2D8g7mCwcCX30cYPkgfp/oTfXEE6B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uHokZ8Jm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A959C19425;
	Fri, 17 Apr 2026 22:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776464946;
	bh=5AZF7bXelQGRzqbFL48OEydTjXw5VXz9hXvYPhUg7As=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=uHokZ8JmZIpmCjQjmbsog78G5QkQcMRXVG1SuUlM+Nxsvs1vDF9q/BthjNfLvD12J
	 uOb9NrkpkQpW82ID0zvAni/zrsRRsQ6fPkz2mqBYnM3X9EyeMl4e+YnDuVraRaME+3
	 nDHMikggfXez8Tw3w3iu88GYsmtNQj97tzu1puKYbnjzlHsJNm5ZzDY5PNOtZjrKEB
	 WuHnkLDWAiaD4UbXIz3q2qSnKzASaDive6Pt/nsKkGFbceGWgHZRZjtqmfeOwpFf1c
	 kRFZJkMoVYnEpR6tJoaxuQnTFJVYM62JvSCDyw8DnKk/tYIvoyuMOEWWfV8xXYL9jd
	 +QOxtyBDDEs0w==
Date: Fri, 17 Apr 2026 17:29:04 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH 0/4] PCI: Introduce pci_dev_suspend_retention_supported()
 API
Message-ID: <20260417222904.GA97164@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3smfckgl2vwhha7rtlqlpfzlfpg2rebyump77cbi5pcgwubn3y@d66eu7axo7xi>
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103567-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A910A41EE59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 04:34:53PM +0530, Manivannan Sadhasivam wrote:
> On Thu, Apr 16, 2026 at 02:11:11PM -0500, Bjorn Helgaas wrote:
> > On Tue, Apr 14, 2026 at 09:29:38PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > > This series introduces a new PCI API
> > > pci_dev_suspend_retention_supported() to let the client drivers
> > > know whether they can expect context retention across
> > > suspend/resume or not and uses it in the NVMe PCI host driver.
> > > 
> > > This new API is targeted to abstract the PCI power management
> > > details away from the client drivers. This is needed because
> > > client drivers like NVMe make use of APIs such as
> > > pm_suspend_via_firmware() and decide to keep the device in low
> > > power mode if this API returns 'false'. But some platforms may
> > > have other limitations like in the case of Qcom, where if the RC
> > > driver removes the resource vote to allow the SoC to enter low
> > > power mode, it cannot reliably exit the L1ss state when the
> > > endpoint asserts CLKREQ#. So in this case also, the client
> > > drivers cannot keep the device in low power state during suspend
> > > and expect context retention.
> > 
> > I don't know what pm_suspend_via_firmware() means.  The kernel-doc
> > says "platform firmware is going to be invoked at the end of the
> > system-wide power management transition," but that doesn't say
> > anything about what firmware might do or what it means to drivers.
> 
> It's hard to predict what the firmware might do after it gains
> control from the OS. But as far as the API goes, it just expects the
> drivers to save the context and reset the device so that the
> firmware could do anything it want.

I don't see anything about the driver needing to reset the device.
(Kernel-doc says "driver *may* need to reset it" but no hint about how
to know.)

Adding something like "device internal state is not preserved" would
go a long ways here.

> > Based on d916b1be94b6 ("nvme-pci: use host managed power state for
> > suspend"), which used it in nvme_suspend(), I guess the assumption
> > is that pm_suspend_via_firmware() means the device might be put in
> > D3cold and lose all its internal state, and conversely,
> > !pm_suspend_via_firmware() means the device will *never* be put in
> > a low-power state that loses internal state.
> 
> Yes, that's the assumption. Though, the firmware might not do D3Cold
> at all, but the drivers should be prepared for that to be compatible
> with all firmware implementations.

I don't think it's useful for a driver to know "firmware might not do
D3cold".  What could a driver do with that?  Unless the driver *knows*
internal state will be preserved, it must act as though the state is
lost.

