Return-Path: <linux-arm-msm+bounces-91042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aI0rFngdemk02wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:30:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD00BA2CA5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:30:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96B683097D87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 14:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB07F27FD48;
	Wed, 28 Jan 2026 14:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ilefGgj0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E3A27FB32;
	Wed, 28 Jan 2026 14:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769610366; cv=none; b=CO/Sw2/31nMm87lEGaFgk23VImN4uh+nUy/7TTloBZf1n3g2rvo7LmKTKffczEdspgAt3SG9Y05/nf2HE8f5wzg31Q82TJwAq1IQgAD03Yd+mL0EYror1dymZeQQPz3/HfiIw1cTD1HQ5pgWVX6AsQ0Oh2qpcU2iwVeF8y878X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769610366; c=relaxed/simple;
	bh=QO3w/KtZadDTQW4wIhokJDJx2sDtkE7K8ERwX9Do5yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ql7NchRmXPXEuynvcF65OGmxH44JExCttxucPns68APDvcy8lLZSq2HqMxoSWOeh6CAFIM9Euu0br7Oa1vPBv2I+8nRPBpbcR05iviYwV1BoLu7bbuRVIAv0Pjv7kHw92AWZ5pNXYWvmhQhc5gL6ZgkzoCkjkFyjt48itLjAsJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ilefGgj0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2129C4CEF7;
	Wed, 28 Jan 2026 14:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769610366;
	bh=QO3w/KtZadDTQW4wIhokJDJx2sDtkE7K8ERwX9Do5yg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ilefGgj0lHsjogHe7L6aCEiMdTQirpxo5zgltfqFStYGRfltP/AAcbYXKU36rTfZ/
	 aGqiXyMH+qsEecokUT1cRjW01u8hq4Cpc7ECr5b8l1FrC9sKCcsVlxFSO7rFqOYXWz
	 EOGk2oZB4lPGZd3SixG4gGJvRXIbWh45TWrsPeGzBq61JQelU7TAM02Behs/NdIYpj
	 B5sNdGnc5puBH0QHD9Awq+2ZECc6kL9m2T5CV8Cz/Z0vUry1UwzRQBrR+kWw8a2sNX
	 AwTb2AU5kUXW1tHPTEzLPPw3bGY92x0SB3SfjNSSbFIHVvwDnyMlzJrF5iy+hdsiJe
	 4ZmPJELQYT6kg==
Date: Wed, 28 Jan 2026 08:26:03 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com
Subject: Re: [PATCH 1/3] PCI: host-common: Add shared D3cold eligibility
 helper for host bridges
Message-ID: <kztudduots342zz7gnx3twtlvjm5pd7sde627zxcsbe6c2imqk@7mmp7vjght5j>
References: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
 <20260128-d3cold-v1-1-dd8f3f0ce824@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-d3cold-v1-1-dd8f3f0ce824@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91042-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,vger.kernel.org,lists.infradead.org,nvidia.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: AD00BA2CA5
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 05:10:41PM +0530, Krishna Chaitanya Chundru wrote:
> Add a common helper, pci_host_common_can_enter_d3cold(), to determine
> whether a PCI host bridge can safely transition to D3cold.

Please read https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

It clearly says that you're supposed to start your commit message with a
description of the problem you're solving. In fact, even after reading
the entire commit message a few times I only know what the patch does,
but it's not clear to me why this patch exists.

> 
> The helper walks all devices on the bridge's bus and only allows the
> host bridge to enter D3cold if all PCIe endpoints are already in
> PCI_D3hot.

The code below does walk the bus, but it doesn't allow/disallow anything
as far as I can tell, it queries their type, state, and if they are wake
capable?

> For devices that may wake the system, it additionally
> requires that the device supports PME wakeup from D3cold(with WAKE#).
> Devices without wakeup enabled are not restricted by this check and can
> be allowed to keep device in D3cold.
> 

Again, this code doesn't perform any action, it doesn't
allow/disallow/restrict the devices from doing anything, it merely
queries a bunch of things across all devices, and the commit message
fails to capture why this is useful.

> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/pci-host-common.c | 29 +++++++++++++++++++++++++++++
>  drivers/pci/controller/pci-host-common.h |  2 ++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
> index c473e7c03bacad2de07c798768f99652443431e0..225472c5ac82c6c5b44257d68a0fc503ec046ff1 100644
> --- a/drivers/pci/controller/pci-host-common.c
> +++ b/drivers/pci/controller/pci-host-common.c
> @@ -106,5 +106,34 @@ void pci_host_common_remove(struct platform_device *pdev)
>  }
>  EXPORT_SYMBOL_GPL(pci_host_common_remove);
>  
> +static int pci_host_common_check_d3cold(struct pci_dev *pdev, void *userdata)
> +{
> +	bool *d3cold_allow = userdata;
> +
> +	if (pci_pcie_type(pdev) != PCI_EXP_TYPE_ENDPOINT)
> +		return 0;
> +
> +	if (pdev->current_state != PCI_D3hot)
> +		goto exit;
> +
> +	if (device_may_wakeup(&pdev->dev) && !pci_pme_capable(pdev, PCI_D3cold))
> +		goto exit;
> +
> +	return 0;
> +exit:
> +	*d3cold_allow = false;
> +	return -EBUSY;
> +}
> +
> +bool pci_host_common_can_enter_d3cold(struct pci_host_bridge *bridge)

Please add kernel-doc for any EXPORT_SYMBOL() functions, so that it's
clear to the next guy what the API does.

Regards,
Bjorn

> +{
> +	bool d3cold_allow = true;
> +
> +	pci_walk_bus(bridge->bus, pci_host_common_check_d3cold, &d3cold_allow);
> +
> +	return d3cold_allow;
> +}
> +EXPORT_SYMBOL_GPL(pci_host_common_can_enter_d3cold);
> +
>  MODULE_DESCRIPTION("Common library for PCI host controller drivers");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
> index b5075d4bd7eb31fbf1dc946ef1a6afd5afb5b3c6..18a731bca058828340bca84776d0e91da1edbbf7 100644
> --- a/drivers/pci/controller/pci-host-common.h
> +++ b/drivers/pci/controller/pci-host-common.h
> @@ -20,4 +20,6 @@ void pci_host_common_remove(struct platform_device *pdev);
>  
>  struct pci_config_window *pci_host_common_ecam_create(struct device *dev,
>  	struct pci_host_bridge *bridge, const struct pci_ecam_ops *ops);
> +
> +bool pci_host_common_can_enter_d3cold(struct pci_host_bridge *bridge);
>  #endif
> 
> -- 
> 2.34.1
> 
> 

