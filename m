Return-Path: <linux-arm-msm+bounces-107315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIhqHWaABGrmKwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:45:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D17775344A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 439E032D980C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598E647D93A;
	Wed, 13 May 2026 13:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oOOXw93G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336C247CC97;
	Wed, 13 May 2026 13:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778678422; cv=none; b=b83BXK1gtrogaecLtzEyh0wW+AlJ0Fwn3oeCEoYxzWFJKUjCDRAcFdwLFwXRwmRXq+4tWIOoHQJYsl39PDdJC/qQ9Q+BwZiOhQsZI1Nc6lCO5gYRSCI6Pv3wg6wrVpjwyNRwbz1jd3lMjnzNaADGIsdqPQwT/49sNJVFFwKC2UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778678422; c=relaxed/simple;
	bh=S1BvYYSJE5VcerFQf1EGsA9bOPQ2bXNuvJNtcspmZMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2z/VzjtVy+inBeFsSEdWGmD2D5M9zb724thx5hHSjlsaubigsOswTS755I7s5I6ydFBk5rp9rEHuJREw9JQSdNektOtP8F999CL58jRxER2Ae2mDb9IGmiuFBWSzIs/tXqJgbarpw0MgjhgIOP5BjGtD9UyKWsWfW8tCbbiLFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oOOXw93G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58D35C2BCF5;
	Wed, 13 May 2026 13:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778678421;
	bh=S1BvYYSJE5VcerFQf1EGsA9bOPQ2bXNuvJNtcspmZMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oOOXw93GvA6+1amZ9s2I820J3rT+oiFMY8pXrlRLSph1Y05NEtpVVjTwU3pm2zIA3
	 8WLw2KH8MCz2Tjgv9MmyxPsKk/vKWWLTemrNznjiwMO/vFohGAIiMUPUhP++TekKqC
	 UjgQsTi8/RkFcTuAGVGvQ9lSHA7oBAfRnrHPYhnx7rNTy24tjiFD77+DvqyktiEyXG
	 wVznEz3Wo99Wx7BJAOVWbhhD5i5CfOcMfTQKMqryi5lg/qsBsI3QHttObxelPJRsxu
	 asYHMW+pPgFIDlY8cU2maG/pMooJ/OFAnulPM2P1DbHvJFlbX/0wYOK314MRR7HAqe
	 4ip8G5aDODncw==
Date: Wed, 13 May 2026 18:50:12 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com, 
	bjorn.andersson@oss.qualcomm.com
Subject: Re: [PATCH v5 4/5] PCI: dwc: Use common D3cold eligibility helper in
 suspend path
Message-ID: <psbhxfox2dwdwv7m773xociaq3z5ns2ktognhu6hvoyptkoxvy@x6s4rkdq3dhj>
References: <20260429-d3cold-v5-0-89e9735b9df6@oss.qualcomm.com>
 <20260429-d3cold-v5-4-89e9735b9df6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260429-d3cold-v5-4-89e9735b9df6@oss.qualcomm.com>
X-Rspamd-Queue-Id: D17775344A8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107315-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,vger.kernel.org,lists.infradead.org,nvidia.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, Apr 29, 2026 at 12:12:26PM +0530, Krishna Chaitanya Chundru wrote:
> Previously, the driver skipped putting the link into L2/device state in
> D3cold whenever L1 ASPM was enabled, since some devices (e.g. NVMe) expect
> low resume latency and may not tolerate deeper power states. However, such
> devices typically remain in D0 and are already covered by the new helper's
> requirement that all endpoints be in D3hot before the devices under host
> bridge may enter D3cold.
> 
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

But you are unconditionally keeping the devices in power ON state even if they
are not M.2 based. We should be able to get this information from the pwrctrl
driver through an API since it has the knowledge of the power supplies. But it
can be done in a follow-up series.

I'll add TODO while applying.

- Mani

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

-- 
மணிவண்ணன் சதாசிவம்

