Return-Path: <linux-arm-msm+bounces-103454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OO61ACg24WkEqgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 21:19:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC0E4140BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 21:19:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E29E6301C302
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 19:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56EFC7262E;
	Thu, 16 Apr 2026 19:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u5A+4BIc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34124368971;
	Thu, 16 Apr 2026 19:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776367137; cv=none; b=YGLslaXsE+RDhoilrDsMMVe+58Tks+Tyq/OeBCbJxdfNCwLCdhGykAXHa4fPTwJPEgP2+b5jtQlqotuwh8fapBLmkrAKmddYvpeIyEZQu7NuU6Gu/KDYuLxfoI2elog2n5rSIxk74jt8Y5zIxMbsJnUoGcwudrLdDTZLu/JLUpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776367137; c=relaxed/simple;
	bh=cxQ+7FhFzLrr6TPqUh9AYVWytGQ1HV5gDQCXSFFG+6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=n/JxgMqv+C1LcOt8jFwcWChT6am64oLxXUQEHQG3tieU0nuSFh4Iwb78h7hpyneIdF5gnYjMffqCxmYRQcK15sW+pajQ/lRsAJetneK/9svzL41RYpqKa6Bg+Yjto36aVuQNpiNokU4lw1pR3NnfyPTV9PDzKfUG3kYlMrN9iz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u5A+4BIc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2819C2BCAF;
	Thu, 16 Apr 2026 19:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776367136;
	bh=cxQ+7FhFzLrr6TPqUh9AYVWytGQ1HV5gDQCXSFFG+6Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=u5A+4BIcuaa4oqwz9AiqKjJOOYobQMNqGPyE9YiZXfv67vJBoMy3Bwm3q0zfYltDB
	 np95kAxZ6ylxKRQjKJGfKUFVSBzPPfddCrkogkXtguG2Pl3hnoxukzUWB+1L7QhGQf
	 A754J/t4EGRx0Fv6q3EKL1E+m8PsRVCi7acAqKXzaTU/NJly64Sw8lvJJXagBxJBQv
	 BIZaskcdx7hfgurLzxBCc0T3+jk5+g0QxLsQNx3EwLt7kTALGesXBKVtjOkpOgnZp4
	 fqgMns3ru6dS8hdrRXHMI2n5SOkJ2uIGjYubMCLV5qWVGpMQv0tNw0drOmXnQU7bUN
	 BDws4NpcYTrRA==
Date: Thu, 16 Apr 2026 14:18:55 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH 1/4] PCI: Introduce an API to check if RC/platform can
 retain device context during suspend
Message-ID: <20260416191855.GA25147@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-l1ss-fix-v1-1-adbb4555b5ab@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103454-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DEC0E4140BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

[+cc Rafael]

On Tue, Apr 14, 2026 at 09:29:39PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Currently, the PCI endpoint drivers like NVMe checks whether the device
> context will be retained or not during system suspend, with the help of
> pm_suspend_via_firmware() API.
> 
> But it is possible that the device context might be lost due to some
> platform limitation as well. Having those checks in the endpoint drivers
> will not scale and will cause a lot of code duplication.
> 
> So introduce an API that acts as a sole point of truth that the endpoint
> drivers can rely on to check whether they can expect the device context
> to be retained or not.
> 
> If the API returns 'false', then the client drivers need to prepare for
> context loss by performing actions such as resetting the device, saving
> the context, shutting it down etc... If it returns 'true', then the drivers
> do not need to perform any special action and can leave the device in
> active state.
> 
> Right now, this API only incorporates the pm_suspend_via_firmware() check.
> But will be extended in the future commits.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  drivers/pci/pci.c   | 23 +++++++++++++++++++++++
>  include/linux/pci.h |  7 +++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 8479c2e1f74f..211616467a77 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -33,6 +33,7 @@
>  #include <asm/dma.h>
>  #include <linux/aer.h>
>  #include <linux/bitfield.h>
> +#include <linux/suspend.h>
>  #include "pci.h"
>  
>  DEFINE_MUTEX(pci_slot_mutex);
> @@ -2900,6 +2901,28 @@ void pci_config_pm_runtime_put(struct pci_dev *pdev)
>  		pm_runtime_put_sync(parent);
>  }
>  
> +/**
> + * pci_dev_suspend_retention_supported - Check if the platform can retain the device
> + *					 context during system suspend
> + * @pdev: PCI device to check
> + *
> + * Returns true if the platform can guarantee to retain the device context,
> + * false otherwise.
> + */
> +bool pci_dev_suspend_retention_supported(struct pci_dev *pdev)

This doesn't seem like the right name.  This isn't a property of the
*device*; that's all determined by the PCI spec (devices must retain
all internal state in D0, D1, and D2, they retain it in D3hot if
No_Soft_Reset, and they never do in D3cold).

So this seems like something to do with the *platform* behavior.  It
sounds like this is basically a way to learn whether the device might
be put in D3cold on system suspend.

> +{
> +	/*
> +	 * If the platform firmware (like ACPI) is involved at the end of system
> +	 * suspend, device context may not be retained.
> +	 */
> +	if (pm_suspend_via_firmware())
> +		return false;
> +
> +	/* Assume that the context is retained by default */
> +	return true;
> +}
> +EXPORT_SYMBOL_GPL(pci_dev_suspend_retention_supported);
> +
>  static const struct dmi_system_id bridge_d3_blacklist[] = {
>  #ifdef CONFIG_X86
>  	{
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 1c270f1d5123..d9bc7ad4eaa4 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -2080,6 +2080,8 @@ pci_release_mem_regions(struct pci_dev *pdev)
>  			    pci_select_bars(pdev, IORESOURCE_MEM));
>  }
>  
> +bool pci_dev_suspend_retention_supported(struct pci_dev *pdev);
> +
>  #else /* CONFIG_PCI is not enabled */
>  
>  static inline void pci_set_flags(int flags) { }
> @@ -2239,6 +2241,11 @@ pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
>  static inline void pci_free_irq_vectors(struct pci_dev *dev)
>  {
>  }
> +
> +static inline bool pci_dev_suspend_retention_supported(struct pci_dev *pdev)
> +{
> +	return true;
> +}
>  #endif /* CONFIG_PCI */
>  
>  /* Include architecture-dependent settings and functions */
> 
> -- 
> 2.51.0
> 
> 

