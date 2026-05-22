Return-Path: <linux-arm-msm+bounces-109433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNYWIlDlEGqOfAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 01:22:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0752B5BB739
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 01:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF49E30056C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 23:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 330EA357CFB;
	Fri, 22 May 2026 23:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QWyK4Ejl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0049A30674A;
	Fri, 22 May 2026 23:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779492074; cv=none; b=BtARoZjQ2pw7yracj8wY2JP/hbUEfKku3193rRAiVBJ2znOgUn7179Bppe9hlD2kQFPL+c5XXo8q+OlG3kjqGVMjCpWAgswOaWsZq4oUuU8o5SwD6d1ksfO6nZF+0UhYL6A9cVMTa5kXkIH/YKDNJfftHy957J2GatJ0ov2xDJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779492074; c=relaxed/simple;
	bh=M3eWbdjhZJj4iW88X78biMJ7gBeoiAjJRDXOkoyrcZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=tyRibOvEx/cqXA+rpZUjHbSDEZq0HFE7yZ7W3Su+YIhfgc/nRjSUoOV6za07duPha7Zyx6RHe3IBAVdW6vxCI9FRpGcZQJBNP3jsE3Cj3oNvwCz5O4Z8dPJXG3w8BkI2BzADXHTg9k+A9RfHgDlBnulw1L6MpDQFb6FSi0I2nno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QWyK4Ejl; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 64E3F1F000E9;
	Fri, 22 May 2026 23:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779492072;
	bh=92Y7gu64Me1nPepdcTTZwAhjO9Zg3Z0BifWUTUDqJxw=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=QWyK4EjlQuPPXWBb4Ex98Ne0Ks96bUGJO3Boqe/0Anncc2c4J+TG88vQYilLd0UV/
	 px++OqU1KKTRaK6FkuytSsTSPPhC6QzExKCxsfjo0wFSAL/CEIDlvT6vTguImOvjrq
	 q1NWpko1UVikkUQKHMlmDV7aprOiUJikRTv40HgnLXKRpo7oo2SBeAVdndmCEDVn2v
	 ghhnMXaG2lFzuHE9fkCQmFLaoGAKs0lmjLlQZGyMoaQS7Js5ko3bw4Nvfel4ceQNWH
	 tR+t8I4jdKHzogMbFHJRDdJwvVC8+zYBYXfaLWpPUSDjroeliMhPIOIbjk47GuP3dq
	 BsD96Fhs/xokg==
Date: Fri, 22 May 2026 18:21:10 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH v2 2/4] PCI: Indicate context lost if L1ss exit is broken
 during resume from system suspend
Message-ID: <20260522232110.GA258915@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-l1ss-fix-v2-2-b2c3a4bdeb15@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109433-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 0752B5BB739
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 01:41:21PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> The PCIe spec v7.0, sec 5.5.3.3.1, states that for exiting L1.2 due to an
> endpoint asserting CLKREQ# signal, the refclk must be turned on no earlier
> than TL10_REFCLK_ON, and within the latency advertised in the LTR message.
> This same behavior applies to L1.1 as well.

It sounds like only the "within the latency advertised in the LTR
message" part is relevant in this case, and there's no issue with the
"no earlier than TL10_REFCLK_ON" part?

> On some platforms like Qcom, these requirements are satisfied during OS
> runtime, but not while resuming from the system suspend. This happens
> because the PCIe RC driver may remove all resource votes and turns off the
> analog circuitry of PHY during suspend to maximize power savings while
> keeping the link in L1ss.
> 
> Consequently, when the endpoint asserts CLKREQ# to wake up, the OS must
> first resume and the RC driver must restore the PHY and enable the REFCLK.
> When this recovery process exceeds the L1ss exit latency time (roughly
> L10_REFCLK_ON + T_COMMONMODE), the endpoint may treat it as a fatal
> condition and triger Link Down (LDn). If the endpoint device is used to
> host the RootFS, it will result in an OS crash. For other endpoints, it
> may result in a complete device reset/recovery.

s/triger/trigger/

> So to indicate this platform limitation to the client drivers, introduce a
> new flag 'pci_host_bridge::broken_l1ss_resume' and check it in the
> pci_suspend_retains_context() API. If the flag is set by the RC driver, the
> API will return 'false' indicating the client drivers that the device
> context may not be retained and the drivers must be prepared for context
> loss.

Thanks for the details, this makes sense to me now.

> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  drivers/pci/pci.c   | 11 +++++++++++
>  include/linux/pci.h |  2 ++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 38cc5172d259..a7d2cb69b42e 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -2910,6 +2910,8 @@ void pci_config_pm_runtime_put(struct pci_dev *pdev)
>   */
>  bool pci_suspend_retains_context(struct pci_dev *pdev)
>  {
> +	struct pci_host_bridge *bridge = pci_find_host_bridge(pdev->bus);
> +
>  	/*
>  	 * If the platform firmware (like ACPI) is involved at the end of system
>  	 * suspend, device context may not be retained.
> @@ -2917,6 +2919,15 @@ bool pci_suspend_retains_context(struct pci_dev *pdev)
>  	if (pm_suspend_via_firmware())
>  		return false;
>  
> +	/*
> +	 * Some host bridges power off the PHY to enter deep low-power modes
> +	 * during system suspend. Exiting L1 PM Substates from this condition
> +	 * violates strict timing requirements and results in Link Down (LDn).
> +	 * On such platforms, the endpoint must be prepared for context loss.
> +	 */
> +	if (bridge && bridge->broken_l1ss_resume)
> +		return false;
> +
>  	/* Assume that the context is retained by default */
>  	return true;
>  }
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index f60f9e4e7b39..1e5b59fa258a 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -660,6 +660,8 @@ struct pci_host_bridge {
>  	unsigned int	preserve_config:1;	/* Preserve FW resource setup */
>  	unsigned int	size_windows:1;		/* Enable root bus sizing */
>  	unsigned int	msi_domain:1;		/* Bridge wants MSI domain */
> +	unsigned int	broken_l1ss_resume:1;	/* Resuming from L1ss during
> +						   system suspend is broken */
>  
>  	/* Resource alignment requirements */
>  	resource_size_t (*align_resource)(struct pci_dev *dev,
> 
> -- 
> 2.48.1
> 
> 

