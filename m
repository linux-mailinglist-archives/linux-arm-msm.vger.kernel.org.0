Return-Path: <linux-arm-msm+bounces-103583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BFEbDaMT42mOBwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 07:16:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF3F41FFFA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 07:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7B613026A84
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 05:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 377C92494F0;
	Sat, 18 Apr 2026 05:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XxyLaMDf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1102A76026;
	Sat, 18 Apr 2026 05:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776489376; cv=none; b=N6aImE8qo+v3G1iUCWduj4B3+kkVpTxzfKb1v1TfbORDItaRaTZ11UsFMO1WQQrtqDcoobTq1lSDCx1t4zy+9yTkY2tOUYeVP3ySjy2EKjfl8LabqjKGWz11Vore7aWWteOVS7lZr16N5ADMSRKUTDtNXzr5fSlSa7lt7wIptYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776489376; c=relaxed/simple;
	bh=uMPl3Kc09k8mo4zpBH85e8Wx+IpfMYQJXFxOcuyR1oI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4zSGQB6gYeP/KQ43h4shlX/x0VyJC9UNIrAoNh9Aj2VUzozyDZM1AxFf2fOUiFEAGzLxCF1kCXCeWkxBk4J/79AvfJHTdseOsTzQqq3twV6dsTm394MuxLyPmcCmtvuwljzmAE00imi85DlTsioMf3LM+KzzuMxXrWq3VlzEdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XxyLaMDf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF7FC19424;
	Sat, 18 Apr 2026 05:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776489375;
	bh=uMPl3Kc09k8mo4zpBH85e8Wx+IpfMYQJXFxOcuyR1oI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XxyLaMDflw+emQt95R4lPo1h8kRa4KDHaOfY/ksAQGYU/F/xVdQVFeuTcfmI6QsSJ
	 V70P2dugzCSIiv+7uSwEddAk+Ia30XVPuNjODqxsQCJWPLrz9eabfO+pBV71WLoG+8
	 toUVlqB5SAGfwjZLAQW0mwR7nWX+S8IaHzKKhok9f+pm9qC5kGnW+IMDtghBA9/nOu
	 LUhPOAei9BFDaVkEdnzFPNdt7Shvsalyfw76eWzCm3AvRC2GSucAfeinm+9Ov4LzG4
	 UjM9JGJyPbM97rw4gFJkJKo5fHDblkgz/RDlCusOigib8lb2nyeVEPUyShDN88Qx82
	 NlzhdLDi7pRtA==
Date: Sat, 18 Apr 2026 10:46:06 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, Keith Busch <kbusch@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH 0/4] PCI: Introduce pci_dev_suspend_retention_supported()
 API
Message-ID: <r4l53y6vfxqojwprm24cfnqb4etjkfqfw6xfakrdixgi3sc2o5@t3wpxspylebs>
References: <3smfckgl2vwhha7rtlqlpfzlfpg2rebyump77cbi5pcgwubn3y@d66eu7axo7xi>
 <20260417222904.GA97164@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260417222904.GA97164@bhelgaas>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103583-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7BF3F41FFFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 05:29:04PM -0500, Bjorn Helgaas wrote:
> On Fri, Apr 17, 2026 at 04:34:53PM +0530, Manivannan Sadhasivam wrote:
> > On Thu, Apr 16, 2026 at 02:11:11PM -0500, Bjorn Helgaas wrote:
> > > On Tue, Apr 14, 2026 at 09:29:38PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > > > This series introduces a new PCI API
> > > > pci_dev_suspend_retention_supported() to let the client drivers
> > > > know whether they can expect context retention across
> > > > suspend/resume or not and uses it in the NVMe PCI host driver.
> > > > 
> > > > This new API is targeted to abstract the PCI power management
> > > > details away from the client drivers. This is needed because
> > > > client drivers like NVMe make use of APIs such as
> > > > pm_suspend_via_firmware() and decide to keep the device in low
> > > > power mode if this API returns 'false'. But some platforms may
> > > > have other limitations like in the case of Qcom, where if the RC
> > > > driver removes the resource vote to allow the SoC to enter low
> > > > power mode, it cannot reliably exit the L1ss state when the
> > > > endpoint asserts CLKREQ#. So in this case also, the client
> > > > drivers cannot keep the device in low power state during suspend
> > > > and expect context retention.
> > > 
> > > I don't know what pm_suspend_via_firmware() means.  The kernel-doc
> > > says "platform firmware is going to be invoked at the end of the
> > > system-wide power management transition," but that doesn't say
> > > anything about what firmware might do or what it means to drivers.
> > 
> > It's hard to predict what the firmware might do after it gains
> > control from the OS. But as far as the API goes, it just expects the
> > drivers to save the context and reset the device so that the
> > firmware could do anything it want.
> 
> I don't see anything about the driver needing to reset the device.
> (Kernel-doc says "driver *may* need to reset it" but no hint about how
> to know.)
> 
> Adding something like "device internal state is not preserved" would
> go a long ways here.
> 

IIUC, 'may' is used in the description because not all firmware are going to
turn off or do something with the device. But for a driver that is supposed to
work with all firmware implementations, like a NIC/storage client driver, it
should save the internal state and prepare for a possible power loss. This is
what the NVMe driver does currently.

> > > Based on d916b1be94b6 ("nvme-pci: use host managed power state for
> > > suspend"), which used it in nvme_suspend(), I guess the assumption
> > > is that pm_suspend_via_firmware() means the device might be put in
> > > D3cold and lose all its internal state, and conversely,
> > > !pm_suspend_via_firmware() means the device will *never* be put in
> > > a low-power state that loses internal state.
> > 
> > Yes, that's the assumption. Though, the firmware might not do D3Cold
> > at all, but the drivers should be prepared for that to be compatible
> > with all firmware implementations.
> 
> I don't think it's useful for a driver to know "firmware might not do
> D3cold".  What could a driver do with that?  Unless the driver *knows*
> internal state will be preserved, it must act as though the state is
> lost.

A driver doesn't need to know whether device will be put into D3Cold or not. But
it does need to know whether there is a possibility or not. Because, AFAIK,
there is no way the OS can query what the firmware is going to do at the end of
the suspend. So to be on the conservative side, this API gives an indication to
the client drivers saying 'hey, firmware is going to be invoked at the end of
suspend and it may do something with the device state like invoking D3Cold or
doing something else. So be prepared for that.'

And 'be prepared' means, saving the context and resetting the device.

@Rafael: Please correct me if my above understanding is wrong.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

