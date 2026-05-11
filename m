Return-Path: <linux-arm-msm+bounces-106834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WF0RJfBlAWpvXwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 07:15:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5A250812D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 07:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E127A30068F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 05:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C1036DA1A;
	Mon, 11 May 2026 05:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KoUD8R5x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD3D3644C6;
	Mon, 11 May 2026 05:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778476524; cv=none; b=tXHQ2r9rx8i3XQORuf21/mAciuYFHNvT+bQgoGRWbsUNSvMrjezuoJC5IKpMAO9tAxxkuOI30uGrGahRt3gZ4aAZYV0N9EVi80Yfv8tNYjBhV66gUnBSpiqTQzFgaDB5VMjv0JBe49KsYsWnUr4+AdQRAZeNtzOzmvF1tm3ci8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778476524; c=relaxed/simple;
	bh=rK2ET1HiJ0JzQgjLAlzz7yx0hWuI8qnNbwc9GxCLjQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qw9ikQL9RrZFA6axz5oyImabLeOAIw/l0dI2PBrno6aX2Xi36CqPUOvme/1ehVjLG/oHytfZ/85F2URALfZrxROReetU+ZvfW85hH0ZR6aC2K0Q0RnbrRKQB3iaB8HWAWDXaQRrLq44vGnN7NJenjx/9f+VrehZyrIeYuACgH5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KoUD8R5x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B37D8C2BCB0;
	Mon, 11 May 2026 05:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778476524;
	bh=rK2ET1HiJ0JzQgjLAlzz7yx0hWuI8qnNbwc9GxCLjQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KoUD8R5xu+BmQLR9qPGYh/pAB6M9BAYOhkmIF4FNUQaODve1oLXUPlWN/KeYyOFPL
	 +Qbd1Cjft6zAlpfbgl9hKJTqv1Ec5u+G33PE2dPp3UYxRMuH8xVL7kNNzA5Y/RTjbu
	 xxXVJiTOiLUqfHAyac4DkIQBBg8X9RB2I55DjPhKHK9k9DddFybWGNb3bbywu9Gn/Y
	 u/v2Fh0A72CnF6O8ozbD6CwYM3aJtCX0JW7Kd4lhUyZhKdeTiIab28HQoxp7/GeSxV
	 u6BzA1c2zNqAZJv7DIXaVzlDieqcqAjjsEUJ1HMP7KhVBBOUV5z6RUbwFHDBOtvwv8
	 C8bUw3qjEjeeg==
Date: Mon, 11 May 2026 10:45:11 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, Keith Busch <kbusch@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-nvme@lists.infradead.org
Subject: Re: [PATCH 1/4] PCI: Introduce an API to check if RC/platform can
 retain device context during suspend
Message-ID: <tt3tl7vrdd4b4a73miywgvhdp4qqsvtfvx5xxxnv557t7daw6p@ieorx6il26qj>
References: <xqwvjygt3bgttbipe6hhnpkfwauczxpoiyfbbakdyzesz6ydcd@en54522wjnar>
 <20260507230248.GA51586@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260507230248.GA51586@bhelgaas>
X-Rspamd-Queue-Id: 0D5A250812D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106834-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 06:02:48PM -0500, Bjorn Helgaas wrote:
> On Fri, Apr 17, 2026 at 04:41:09PM +0530, Manivannan Sadhasivam wrote:
> > On Thu, Apr 16, 2026 at 02:18:55PM -0500, Bjorn Helgaas wrote:
> > > On Tue, Apr 14, 2026 at 09:29:39PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > > > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > > > 
> > > > Currently, the PCI endpoint drivers like NVMe checks whether the device
> > > > context will be retained or not during system suspend, with the help of
> > > > pm_suspend_via_firmware() API.
> > > > 
> > > > But it is possible that the device context might be lost due to some
> > > > platform limitation as well. Having those checks in the endpoint drivers
> > > > will not scale and will cause a lot of code duplication.
> > ...
> 
> > > > + * pci_dev_suspend_retention_supported - Check if the platform can retain the device
> > > > + *					 context during system suspend
> > > > + * @pdev: PCI device to check
> > > > + *
> > > > + * Returns true if the platform can guarantee to retain the device context,
> > > > + * false otherwise.
> > > > + */
> > > > +bool pci_dev_suspend_retention_supported(struct pci_dev *pdev)
> > > 
> > > This doesn't seem like the right name.  This isn't a property of the
> > > *device*; that's all determined by the PCI spec (devices must retain
> > > all internal state in D0, D1, and D2, they retain it in D3hot if
> > > No_Soft_Reset, and they never do in D3cold).
> > > 
> > > So this seems like something to do with the *platform* behavior.  It
> > > sounds like this is basically a way to learn whether the device might
> > > be put in D3cold on system suspend.
> > 
> > That's correct. But I wanted to keep it device specific, since apart
> > from pm_suspend_via_firmware() there could be other issues causing
> > context to be lost. Like the issue with RC, brought up in the
> > successive patches. There could be chances that only one hierarchy
> > might be affected. So making it device specific would give us the
> > granularity.
> 
> OK, a device-specific API is fine.
> 
> Maybe it could be something like "pci_suspend_preserves_context()"?
> 

How about, pci_suspend_retains_context()? But I'm fine with
pci_suspend_preserves_context() too.

> Is it the case that suspend never uses D3cold?  If suspend ever uses
> D3cold, *every* device put in D3cold will lose its context.
> 
> How would this work if suspend can use D3cold?  Can a driver (or this
> API) learn whether D3cold might be used?

If this API returns 'false', then the device will lose all the context during
suspend. But that's not due to D3Cold, but due to the firmware and RC issues.
One can say that losing context is equivalent to D3Cold, but this API doesn't
guarantee that the proper D3Cold transition will happen (PME_Turn_Off broadcast
and waiting for PME_To_Ack).

So I would say, drivers cannot use this API to learn about D3Cold

- Mani

-- 
மணிவண்ணன் சதாசிவம்

