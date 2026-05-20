Return-Path: <linux-arm-msm+bounces-108882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DLfNV8ZDmqA6AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 22:28:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 82573599A0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 22:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D8C3430360A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 20:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58CAC36D51B;
	Wed, 20 May 2026 20:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tzb1Ret7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CF036C9EE;
	Wed, 20 May 2026 20:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779308878; cv=none; b=J6MMDtCq0EV8c/Bgp9Cac6tOjLXEZX30joXDzC5v0iRmaS4tLBXXMQ3hkZ+4w6fsyqf1XHFEOWSL0dRtXcqub01a993CYqu7Iz+GEChq0QXmouFQKIUHrwunXr15mH3fGSG8vlA7cXp1GpF+MiT1tD+7C7y7hFpNOwo7xPXwEvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779308878; c=relaxed/simple;
	bh=O4mp0TCZLIIQoOZJrrRwFBYSguOzPbONHyPBbBQMzOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=hqyY/OTfmzuPctfxZgOqUsAfydzMRX+TVsxPMdzteHSeSLjTfhqT70vGjlkrSLvNpxa6gPXvTqg/C3Pn/vU5a09MvPijiVURq+DuTSlZQRsWK7XKBlVrXSQeRwRVXdNof8iEPO80zPShI66mZtPD4nqTIax6zd7BcJ9kF1Y4V08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tzb1Ret7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 9C32C1F000E9;
	Wed, 20 May 2026 20:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779308876;
	bh=Sf1SMQC28bDRL9mfOLMubwubEk1ClyBVQ/X/6xOLHzc=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=Tzb1Ret77ExKLvkEHhl993AAxmn1PQZDUTwx1VawQJyrOOaiXEOcOhOUXf4DIQxVg
	 xBtX0U8pNf9//BzKJH6MzU6mvOMjZiqc6gcibTTnVMyFFttt/mGxPG23JhfredhdtC
	 gHofPsuO6hd3CxCZE+fqiEawS+IeZgoZ5XyhksIeYLSi17kBZmGYcR9c/k0ThnMxef
	 hA/in1OvY9BzhpP3Tf8n4DHdPKNnG+OF1WCv0K3JBl91IrM53Ojf81RZ298bR6C4eR
	 bHD9eFR/fXqfcBw2VYfh/e6mMt/pS8p1NKwgTopsZyOMq/04ZW2BgRVHwv2ru2o26W
	 4LS/8EHAyDBNg==
Date: Wed, 20 May 2026 15:27:55 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com,
	bjorn.andersson@oss.qualcomm.com
Subject: Re: [PATCH v5 1/5] PCI: host-common: Add helper to determine host
 bridge D3cold eligibility
Message-ID: <20260520202755.GA120626@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519223901.GA20376@bhelgaas>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-108882-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,vger.kernel.org,lists.infradead.org,nvidia.com,oss.qualcomm.com];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,sashiko.dev:url]
X-Rspamd-Queue-Id: 82573599A0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 05:39:01PM -0500, Bjorn Helgaas wrote:
> On Wed, Apr 29, 2026 at 12:12:23PM +0530, Krishna Chaitanya Chundru wrote:
> > Add a common helper, pci_host_common_d3cold_possible(), to determine
> > whether PCIe devices under host bridge can safely transition to D3cold.
> ...

> > +static int __pci_host_common_d3cold_possible(struct pci_dev *pdev, void *userdata)
> > +{
> > +	u32 *flags = userdata;
> > +	int type;
> > +
> > +	/* Ignore conventional PCI devices */
> > +	if (!pci_is_pcie(pdev))
> > +		return 0;
> > +
> > +	type = pci_pcie_type(pdev);
> > +	if (type != PCI_EXP_TYPE_ENDPOINT &&
> > +	    type != PCI_EXP_TYPE_LEG_END &&
> > +	    type != PCI_EXP_TYPE_RC_END)
> > +		return 0;
> 
> From https://sashiko.dev/#/patchset/20260429-d3cold-v5-0-89e9735b9df6%40oss.qualcomm.com:
> 
>   If the topology contains an active conventional PCI device or an
>   intermediate PCIe switch in PCI_D0, returning 0 here allows
>   pci_walk_bus() to continue without clearing the
>   PCI_HOST_D3COLD_ALLOWED flag.
> 
>   Does this create a situation where the host bridge might
>   aggressively power off the link, dropping power to these active
>   components?
> 
> I guess this is intentional, since you have comment about ignoring
> conventional PCI devices.  But this does seem like a potential
> problem.  Why should we ignore switches here?  And I think it's still
> fairly common to have a PCIe-to-PCI bridge leading to a conventional
> PCI device, and I don't know why we should ignore them.
> 
> The commit log consistently refers to "PCIe" devices and endpoints, so
> maybe there's some reason that I'm missing.
> 
> There are other sashiko comments on this series that I think should
> also be looked at.

This series is all in pci/next, so you and Mani can decide on whether
any sashiko comments need to be addressed.

Even if there's no code change, I think it'd be nice to have a brief
comment here about why conventional PCI and switches are ignored.

