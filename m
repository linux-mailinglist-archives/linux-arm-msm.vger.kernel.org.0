Return-Path: <linux-arm-msm+bounces-109119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AiwGR0rD2q3HQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 17:56:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A74C5A8BDF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 17:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D542F30C8F64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 298ED2EA173;
	Thu, 21 May 2026 15:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zn/JZ/6/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09E686329;
	Thu, 21 May 2026 15:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779376170; cv=none; b=F4WDEZeHrOWxTCR3p3L9H3CDLTu24Vgo2kpXta1we682j8A7X3vbW/Cy7cqpUtQkDV7syBnzSS1xJCuDJcBYEEBdKG6Okan6yl2Ci5rEO6xrBCCwPA2p/aVeZ1nHCltENgTSUMdXLVJ9I/MvgX3a0SthhtSYMOiPLcNqJRVTU/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779376170; c=relaxed/simple;
	bh=tD0Jyxe+L3NmHAhDzJO6JIraK0eOBDwI3b0tNe71yRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KE5/cmWqRNR2wpguCjkBNysou3UhC5HcAOTX9xC6sYmxdAnqMVuvSNNvfOhdIdoaJZwk1H2rypSLYWSEOEKX4Fm4H6mqPBahn3kOs+VV6nnPQcQ1htDtbBoOrYgJuYCXUSJjbgZsOCJlAHrNLkv5K/JGqpPlyGWRajdzK7yMF5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zn/JZ/6/; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E111F000E9;
	Thu, 21 May 2026 15:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779376168;
	bh=WaWCNwcV4Q9WPXltaMYYj+j9vFr5Kxt8/s7SNLX1Li8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zn/JZ/6/1NhMbxJt9yFc14hFBWdZSs1lsZtRAwmO3xi9reC3KCOyZeu+YLzQZT/Mv
	 szdEjjM1MMqKc+jMitK6CQ1GDHgoVqccxfyGSYSBLLQWsAqUqDIzkkZ7i4/zv4esD1
	 MQzc6i/FXjYwPO89cjJO/NwSjKbNMfVU6WKKueysXFDhIQCrZ1WxRVbwXXbIYnwauH
	 vmtDI/QvTIhhjEpdEAkhXK+yywEHsNy5NFoWrolQCn8/+TbPwPglIbcgsFdgPJdchW
	 VXvjq7pwwJknnJfILyJYzWzrgFZatsGOMJ8BoT0V6RNhpbDRBx/mF5u4oNCHqT4XkS
	 HlHpvLuTB9yXw==
Date: Thu, 21 May 2026 20:39:18 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com
Subject: Re: [PATCH v5 1/5] PCI: host-common: Add helper to determine host
 bridge D3cold eligibility
Message-ID: <f6o5hl25ewgegvhhdhzoiuor2bgvlqduk46yvmascgabpzbf33@vcueeqidww2u>
References: <20260519223901.GA20376@bhelgaas>
 <20260520202755.GA120626@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260520202755.GA120626@bhelgaas>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109119-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,kernel.org,google.com,vger.kernel.org,lists.infradead.org,nvidia.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,sashiko.dev:url]
X-Rspamd-Queue-Id: 0A74C5A8BDF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 03:27:55PM -0500, Bjorn Helgaas wrote:
> On Tue, May 19, 2026 at 05:39:01PM -0500, Bjorn Helgaas wrote:
> > On Wed, Apr 29, 2026 at 12:12:23PM +0530, Krishna Chaitanya Chundru wrote:
> > > Add a common helper, pci_host_common_d3cold_possible(), to determine
> > > whether PCIe devices under host bridge can safely transition to D3cold.
> > ...
> 
> > > +static int __pci_host_common_d3cold_possible(struct pci_dev *pdev, void *userdata)
> > > +{
> > > +	u32 *flags = userdata;
> > > +	int type;
> > > +
> > > +	/* Ignore conventional PCI devices */
> > > +	if (!pci_is_pcie(pdev))
> > > +		return 0;
> > > +
> > > +	type = pci_pcie_type(pdev);
> > > +	if (type != PCI_EXP_TYPE_ENDPOINT &&
> > > +	    type != PCI_EXP_TYPE_LEG_END &&
> > > +	    type != PCI_EXP_TYPE_RC_END)
> > > +		return 0;
> > 
> > From https://sashiko.dev/#/patchset/20260429-d3cold-v5-0-89e9735b9df6%40oss.qualcomm.com:
> > 
> >   If the topology contains an active conventional PCI device or an
> >   intermediate PCIe switch in PCI_D0, returning 0 here allows
> >   pci_walk_bus() to continue without clearing the
> >   PCI_HOST_D3COLD_ALLOWED flag.
> > 
> >   Does this create a situation where the host bridge might
> >   aggressively power off the link, dropping power to these active
> >   components?
> > 
> > I guess this is intentional, since you have comment about ignoring
> > conventional PCI devices.  But this does seem like a potential
> > problem.  Why should we ignore switches here?  And I think it's still
> > fairly common to have a PCIe-to-PCI bridge leading to a conventional
> > PCI device, and I don't know why we should ignore them.
> > 
> > The commit log consistently refers to "PCIe" devices and endpoints, so
> > maybe there's some reason that I'm missing.
> > 
> > There are other sashiko comments on this series that I think should
> > also be looked at.
> 
> This series is all in pci/next, so you and Mani can decide on whether
> any sashiko comments need to be addressed.
> 
> Even if there's no code change, I think it'd be nice to have a brief
> comment here about why conventional PCI and switches are ignored.

Looking at the helper again, I think we should allow all PCI/PCIe devices to
take part in the D3Cold check including Switch, Bridge, RP, RCiEP and RC-EC.
Some of them like RCiEP and RC-EC cannot be put into D3Cold by the host
controller drivers individually, but if they are bound to a driver, then there
is a possibility that the driver would want those devices to be kept in D0 for
some reason. In that case, the host controller driver should not broadcast
PME_Turn_Off.

So I've removed the PCIe device checks altogether including the check for
conventional PCI devices in the PCI tree.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

