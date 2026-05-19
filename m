Return-Path: <linux-arm-msm+bounces-108612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AEEMI7mDGoopwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 00:39:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEB5585BDF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 00:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ADA6F300531E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 22:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C69C36A01E;
	Tue, 19 May 2026 22:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="acjyTica"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C14370D70;
	Tue, 19 May 2026 22:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779230344; cv=none; b=J1a6gUCTRZehxKK25fAGFNva6a3jUgaDSzPoZ+bu5djNUI4glat7spJcU2mm4oKCwXLLtH/eJBBH65v/TxSOCalpCX2plgOUSpBefOKi8IpYarWv94Ik1dElAeuKqWYEW4TS3nLsepU4mz3avqCUq63olNCcfeKMdaNVJ6yWJw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779230344; c=relaxed/simple;
	bh=BwED/VE3bDiqK/oe+pE2/kpirJdTKU6ceKY+zXIkYPw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=u2iodMxBd4Ps144hZQ+9BPFmXq64C1Zj/DeoCd1U/znjiz+y0zwyKeu+6epPTutw1vH+t1ukcgIo4zzZo6nb/Dvgx6EQTqLTaXPG7PHEaVxcp3ojeDms2wP0f0719q0b0zl0B5E4Y5xSyXEjbtN+hpAodLrra2ya2xUqbDwN8Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=acjyTica; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 5BCC01F000E9;
	Tue, 19 May 2026 22:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779230342;
	bh=uhGMUkYK7lJN21Y0KILAaLJAxufhyTf8mTQiKOdsg6M=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=acjyTicaIjtkUEZL6fJWCBm/HWBLjz/+5c58S36X8fn7b9V2iaJDRcH/VWXAa4o2p
	 8ZTg5jzqMHREg4YJRclKWkeX4leIONH8badx1nbph3Y+XhUnr8dR+DRl3QQhfFCjvH
	 Bv8mVmjDhfnDV/+TBS6dgBSclWGF9ft8dhu1/hnoQNmUxNhiaZOirESnQ6vl+Tf5zv
	 3gpemJ9qYTHhC66Cb92r/tqqqyV4YMFElRT7YWxmsebbOzsb5HeNbOddjId5hsv71/
	 5AnjBPliF3pt/lpE/NifwxsIZoBGfMSVlJdVY1aa1Xns6CSy88KLPsZPQa/o/0XLxc
	 bmwIHWhYeC48Q==
Date: Tue, 19 May 2026 17:39:01 -0500
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
Message-ID: <20260519223901.GA20376@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429-d3cold-v5-1-89e9735b9df6@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108612-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,vger.kernel.org,lists.infradead.org,nvidia.com,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,sashiko.dev:url]
X-Rspamd-Queue-Id: AFEB5585BDF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 29, 2026 at 12:12:23PM +0530, Krishna Chaitanya Chundru wrote:
> Add a common helper, pci_host_common_d3cold_possible(), to determine
> whether PCIe devices under host bridge can safely transition to D3cold.
> 
> This helper is intended to be used by PCI host controller drivers to
> decide whether they may safely put the host bridge into D3cold based on
> the power state and wakeup capabilities of downstream endpoints.
> 
> The helper walks all devices on the all bridge buses and only allows
> the devices to enter D3cold if all PCIe endpoints are already in
> PCI_D3hot. This ensures that we do not power off the host bridge while
> any active endpoint still requires the link to remain powered.
> 
> For devices that may wake the system, the helper additionally requires
> that the device supports PME wake from D3cold (via WAKE#). Devices that
> do not have wakeup enabled are not restricted by this check and do not
> block the devices under host bridge from entering D3cold.
> 
> Devices without a bound driver and with PCI not enabled via sysfs are
> treated as inactive and therefore do not prevent the devices under host
> bridge from entering D3cold. This allows controllers to power down more
> aggressively when there are no actively managed endpoints.
> 
> Some devices (e.g. M.2 without auxiliary power) lose PME detection when
> main power is removed. Even if such devices advertise PME-from-D3cold
> capability, entering D3cold may break wakeup. So, return PME-from-D3cold
> capability via an output parameter so PCIe controller drivers can apply
> platform-specific handling to preserve wakeup functionality.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/pci-host-common.c | 71 ++++++++++++++++++++++++++++++++
>  drivers/pci/controller/pci-host-common.h |  2 +
>  2 files changed, 73 insertions(+)
> 
> diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
> index d6258c1cffe5..09432d69175c 100644
> --- a/drivers/pci/controller/pci-host-common.c
> +++ b/drivers/pci/controller/pci-host-common.c
> @@ -17,6 +17,9 @@
>  
>  #include "pci-host-common.h"
>  
> +#define PCI_HOST_D3COLD_ALLOWED        BIT(0)
> +#define PCI_HOST_PME_D3COLD_CAPABLE    BIT(1)
> +
>  static void gen_pci_unmap_cfg(void *ptr)
>  {
>  	pci_ecam_free((struct pci_config_window *)ptr);
> @@ -106,5 +109,73 @@ void pci_host_common_remove(struct platform_device *pdev)
>  }
>  EXPORT_SYMBOL_GPL(pci_host_common_remove);
>  
> +static int __pci_host_common_d3cold_possible(struct pci_dev *pdev, void *userdata)
> +{
> +	u32 *flags = userdata;
> +	int type;
> +
> +	/* Ignore conventional PCI devices */
> +	if (!pci_is_pcie(pdev))
> +		return 0;
> +
> +	type = pci_pcie_type(pdev);
> +	if (type != PCI_EXP_TYPE_ENDPOINT &&
> +	    type != PCI_EXP_TYPE_LEG_END &&
> +	    type != PCI_EXP_TYPE_RC_END)
> +		return 0;

From https://sashiko.dev/#/patchset/20260429-d3cold-v5-0-89e9735b9df6%40oss.qualcomm.com:

  If the topology contains an active conventional PCI device or an
  intermediate PCIe switch in PCI_D0, returning 0 here allows
  pci_walk_bus() to continue without clearing the
  PCI_HOST_D3COLD_ALLOWED flag.

  Does this create a situation where the host bridge might
  aggressively power off the link, dropping power to these active
  components?

I guess this is intentional, since you have comment about ignoring
conventional PCI devices.  But this does seem like a potential
problem.  Why should we ignore switches here?  And I think it's still
fairly common to have a PCIe-to-PCI bridge leading to a conventional
PCI device, and I don't know why we should ignore them.

The commit log consistently refers to "PCIe" devices and endpoints, so
maybe there's some reason that I'm missing.

There are other sashiko comments on this series that I think should
also be looked at.

> +
> +	if (!pdev->dev.driver && !pci_is_enabled(pdev))
> +		return 0;
> +
> +	if (pdev->current_state != PCI_D3hot)
> +		goto exit;
> +
> +	if (device_may_wakeup(&pdev->dev)) {
> +		if (!pci_pme_capable(pdev, PCI_D3cold))
> +			goto exit;
> +		else
> +			*flags |= PCI_HOST_PME_D3COLD_CAPABLE;
> +	}
> +
> +	return 0;
> +
> +exit:
> +	*flags &= ~PCI_HOST_D3COLD_ALLOWED;
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +/**
> + * pci_host_common_d3cold_possible - Determine whether the host bridge can transition the
> + *				     devices into D3Cold.
> + *
> + * @bridge: PCI host bridge to check
> + * @pme_capable: Pointer to update if there is any device which is capable of generating
> + *		 PME from D3cold.
> + *
> + * Walk downstream PCIe endpoint devices and determine whether the host bridge
> + * is permitted to transition the devices into D3cold.
> + *
> + * Devices under host bridge can enter D3cold only if all active PCIe endpoints are in
> + * PCI_D3hot and any wakeup-enabled endpoint is capable of generating PME from D3cold.
> + * Inactive endpoints are ignored.
> + *
> + * The @pme_capable output allows PCIe controller drivers to apply
> + * platform-specific handling to preserve wakeup functionality.
> + *
> + * Return: %true if the host bridge may enter D3cold, otherwise %false.
> + */
> +bool pci_host_common_d3cold_possible(struct pci_host_bridge *bridge, bool *pme_capable)
> +{
> +	u32 flags = PCI_HOST_D3COLD_ALLOWED;
> +
> +	pci_walk_bus(bridge->bus, __pci_host_common_d3cold_possible, &flags);
> +
> +	*pme_capable = !!(flags & PCI_HOST_PME_D3COLD_CAPABLE);
> +
> +	return !!(flags & PCI_HOST_D3COLD_ALLOWED);
> +}
> +EXPORT_SYMBOL_GPL(pci_host_common_d3cold_possible);
> +
>  MODULE_DESCRIPTION("Common library for PCI host controller drivers");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
> index b5075d4bd7eb..7eb5599b9ce4 100644
> --- a/drivers/pci/controller/pci-host-common.h
> +++ b/drivers/pci/controller/pci-host-common.h
> @@ -20,4 +20,6 @@ void pci_host_common_remove(struct platform_device *pdev);
>  
>  struct pci_config_window *pci_host_common_ecam_create(struct device *dev,
>  	struct pci_host_bridge *bridge, const struct pci_ecam_ops *ops);
> +
> +bool pci_host_common_d3cold_possible(struct pci_host_bridge *bridge, bool *pme_capable);
>  #endif
> 
> -- 
> 2.34.1
> 

