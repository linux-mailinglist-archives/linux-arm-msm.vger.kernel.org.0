Return-Path: <linux-arm-msm+bounces-108615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oA1kILz6DGpHqwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 02:05:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE09858638F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 02:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58A9E3058B94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 00:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0410D4964F;
	Wed, 20 May 2026 00:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G53BZT2o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62FC13D51E;
	Wed, 20 May 2026 00:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779235315; cv=none; b=Ddg7ueEmBcJandthmv5vqRgpZokyGysJH0M6HptN0B7bxpIOb/Qs950wVZHsIXwVnMIo84mxlKk+gmnk5tK+9poQYlsEsNfJDZMb8jFXDi4vuo810o2/z7wod3d6Js9U4/Hut87/EU0eL+jIfZ9a4ZYnxx7CIszdBHyimKydU1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779235315; c=relaxed/simple;
	bh=fR7m8/Ewk+coHnCQI+/psxuWf29L80kouvEcqYOW37M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=UnVtQkYFHGdpasLQb+4RjyhPkRTVWFKRmP7kubk/oSXkyvKUxfWghgAHRjkT8U+M6QuANBP2zU9wmp1t+K8f2B/BAQUQvb7AEn6doxFA+dYDk+HtkXQoWCK/25Y/0vHkvI9cbFLeymhl6t41HY4s2kdLg2nGUzfIuLWXC5wRwZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G53BZT2o; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 5AA991F000E9;
	Wed, 20 May 2026 00:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779235314;
	bh=z5+d8X1xsrZ2nYFL0/wXdETl3fdxdqG4T8Y5iYJSXk8=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=G53BZT2ogWRbd4EK6NCrK36i40EUGvN8gVZ9AQzXfJbz+k/c6muGGqY2K2uRxQI2Z
	 oHtRBPyvZ4yiJNwH6s3ZR9oFskiQ2jpNCSaptOBDmC5dRVvexsYBR8muO6j90axEI2
	 JTzQ4UNWatAohlQlWe7mOqe5to1IAMedjkpmVUHQ9tITlgxYnelNsNSaCPsz1OEh5D
	 PJSJGiJ5Zxp+fDurVTzVRbx5NjPkVfiIZb7TzySDJZDl5+IvUYN3m3JeaxPFoR4saK
	 guoMPuoJHhMDi9wPTdk4dXrFJf7I5d0/ttdW6j++W0OBwtb9MmKypiheK2+bUq+wJS
	 EgBVdOE16wt2A==
Date: Tue, 19 May 2026 19:01:53 -0500
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
	bjorn.andersson@oss.qualcomm.com, Frank Li <Frank.Li@nxp.com>,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 4/5] PCI: dwc: Use common D3cold eligibility helper in
 suspend path
Message-ID: <20260520000153.GA14400@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429-d3cold-v5-4-89e9735b9df6@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108615-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,vger.kernel.org,lists.infradead.org,nvidia.com,oss.qualcomm.com,nxp.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: DE09858638F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

[+cc Frank, linux-pm]

On Wed, Apr 29, 2026 at 12:12:26PM +0530, Krishna Chaitanya Chundru wrote:
> Previously, the driver skipped putting the link into L2/device state in
> D3cold whenever L1 ASPM was enabled, since some devices (e.g. NVMe) expect
> low resume latency and may not tolerate deeper power states.

I think "some devices expect low resume latency and may not tolerate
deeper power states" conveys the wrong message.  It's not that NVMe
has a mysterious acceptable resume latency number that we have to meet
or that NVMe has some inherent aversion to D3cold or L1SS or whatever
"deeper power states" refers to.

It could be that ASPM L1 was configured incorrectly (e.g., an L1->L0
transition didn't happen within the advertised exit latency, leading
to some device access failure) or a device lost internal context when
the driver didn't expect it (e.g., the Qcom problem where L1SS exit
takes too long and results in a link-down and device reset [1]).

It sounds to me like the ASPM L1 check was a way to avoid problems
like that, but I don't think we ever really had a root cause.

[1] https://lore.kernel.org/linux-pci/20260519-l1ss-fix-v2-0-b2c3a4bdeb15@oss.qualcomm.com/

> However, such devices typically remain in D0 and are already covered
> by the new helper's requirement that all endpoints be in D3hot
> before the devices under host bridge may enter D3cold.

If we put the host bridge in D3cold, I assume the hierarchy below is
either put in D3cold as well, or at least every device in the
hierarchy will be reset as a consequence of the Root Port link going
down.

If the driver doesn't manage the device power state itself, I assume
we have the freedom to put the hierarchy in D3cold or reset it.

Do we have the same freedom if the driver *does* manage the power
state itself?  What if the driver put the device in D3hot, expecting
it to *stay* in D3hot?

I think pci_host_common_d3cold_possible() will see the device in D3hot
and decide that D3cold is possible.

(I'm looking at https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/power/pci.rst?id=v7.0#n746)

> So, replace the local L1/L1SS-based check in dw_pcie_suspend_noirq() with
> the shared pci_host_common_d3cold_possible() helper to decide whether the
> devices under host bridge can safely transition to D3cold.
> 
> In addition, propagate PME-from-D3cold capability information from the
> helper and record it in skip_pwrctrl_off. Some devices (e.g. M.2 cards
> without auxiliary power) may lose PME detection when main power is
> removed, even if they advertise PME-from-D3cold support. This allows
> controller power-off to be skipped when required to preserve wakeup
> functionality.
> 
> Update the suspended flag in dw_pcie_resume_noirq() only after the PCIe
> link resumes successfully, to avoid marking the controller active when
> link resume fails.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 15 +++++++--------
>  drivers/pci/controller/dwc/pcie-designware.h      |  1 +
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index c9517a348836..9e409a1909e6 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -16,9 +16,11 @@
>  #include <linux/msi.h>
>  #include <linux/of_address.h>
>  #include <linux/of_pci.h>
> +#include <linux/pci.h>
>  #include <linux/pci_regs.h>
>  #include <linux/platform_device.h>
>  
> +#include "../pci-host-common.h"
>  #include "../../pci.h"
>  #include "pcie-designware.h"
>  
> @@ -1218,18 +1220,14 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
>  
>  int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  {
> -	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +	bool pme_capable = false;
>  	int ret = 0;
>  	u32 val;
>  
>  	if (!dw_pcie_link_up(pci))
>  		goto stop_link;
>  
> -	/*
> -	 * If L1SS is supported, then do not put the link into L2 as some
> -	 * devices such as NVMe expect low resume latency.
> -	 */
> -	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
> +	if (!pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable))
>  		return 0;
>  
>  	if (pci->pp.ops->pme_turn_off) {
> @@ -1273,6 +1271,7 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  	udelay(1);
>  
>  stop_link:
> +	pci->pp.skip_pwrctrl_off = pme_capable;
>  	dw_pcie_stop_link(pci);
>  	if (pci->pp.ops->deinit)
>  		pci->pp.ops->deinit(&pci->pp);
> @@ -1290,8 +1289,6 @@ int dw_pcie_resume_noirq(struct dw_pcie *pci)
>  	if (!pci->suspended)
>  		return 0;
>  
> -	pci->suspended = false;
> -
>  	if (pci->pp.ops->init) {
>  		ret = pci->pp.ops->init(&pci->pp);
>  		if (ret) {
> @@ -1313,6 +1310,8 @@ int dw_pcie_resume_noirq(struct dw_pcie *pci)
>  	if (pci->pp.ops->post_init)
>  		pci->pp.ops->post_init(&pci->pp);
>  
> +	pci->suspended = false;
> +
>  	return 0;
>  
>  err_stop_link:
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 3e69ef60165b..e759c5c7257e 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -450,6 +450,7 @@ struct dw_pcie_rp {
>  	bool			ecam_enabled;
>  	bool			native_ecam;
>  	bool                    skip_l23_ready;
> +	bool			skip_pwrctrl_off;
>  };
>  
>  struct dw_pcie_ep_ops {
> 
> -- 
> 2.34.1
> 

