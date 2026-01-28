Return-Path: <linux-arm-msm+bounces-91044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGEkEfodemlS2QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:32:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6893A2CE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:32:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BD2A3029E5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 14:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD4B3451CF;
	Wed, 28 Jan 2026 14:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sEJ4Hdxd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA312FCBE3;
	Wed, 28 Jan 2026 14:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769610528; cv=none; b=lQw9Mcr5dBHpmj0WVsXd9bQaB0dH0Vx/EWSQn1AotcfVzVS9acV8MBuNz7nwwEHNx66PsWNR/zTtZ2AdNHCfMXNXcgwSUoiIZWJAAASJYCQd9I+DID+BRvIDNftoW/fXiDO9i1DAheUkAMOV1Bm9s7UEA+9M8FkRe3pOQ3AsLvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769610528; c=relaxed/simple;
	bh=yVK+1rGXEFwbGHm+y9dP2+QQA05aUnWbOsxkvUrgglI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJC2Drpvfbq572Bzt1Kc5djCYAEQE8zaBPSi9jSn41/UnbbiX5Igd20aX9f8t7j7NbWPIL5IpBbJmqilq5uBXgV9sRamHV6fkKwURpbBEW+6XUkW+karZEwX7OrGJnOEtQfXTKE6NdAEN77RcJZEEUJn4eS9gyhur6JF22TjllU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sEJ4Hdxd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E738C4CEF7;
	Wed, 28 Jan 2026 14:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769610528;
	bh=yVK+1rGXEFwbGHm+y9dP2+QQA05aUnWbOsxkvUrgglI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sEJ4HdxdHqoT5usmyr5CzYmdSDIUsy2yb8Q7Wfgo4BOctdBuAq+uvmf9k1VbAwJHl
	 2vltzlVx13lerrW/ce+XHP+39ufSDtafc0z170juseGExhSWircnGp94Iw6yYmUxjE
	 fAZjfpVsggYd5VHX3c10z4W8nqnhGl2uP3LY3P7Q/gAd9sKQKwo3gUc2LtOpt0Ji2H
	 EOyY+21K3DKX4gugOVAdIECT1MQTCtXXLyT9cgSVFkMIPc2AIFnjsDUk9HK0bpve7F
	 IP+NgMzRA5VrA4SQDmzKN/FYp6E1KT7oxvS427CAietuBA3ZQg+YJNHmBniit6gWE2
	 M/YZ0MIWnlpog==
Date: Wed, 28 Jan 2026 08:28:45 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com
Subject: Re: [PATCH 2/3] PCI: dwc: Use common D3cold eligibility helper in
 suspend path
Message-ID: <oygssx4tnd7uwofk4ucqj2ypok2zssnzbauzar2f65lzougr3a@vp6b7y4j56k3>
References: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
 <20260128-d3cold-v1-2-dd8f3f0ce824@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-d3cold-v1-2-dd8f3f0ce824@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-91044-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A6893A2CE9
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 05:10:42PM +0530, Krishna Chaitanya Chundru wrote:
> Previously, the driver skipped putting the link into L2/device state in
> D3cold whenever L1 ASPM was enabled, since some devices (e.g. NVMe) expect
> low resume latency and may not tolerate deeper power states. However, such
> devices typically remain in D0 and are already covered by the new helper's
> requirement that all endpoints be in D3hot before the host bridge may
> enter D3cold.
> 
> So, replace the local L1/L1SS-based check in dw_pcie_suspend_noirq() with
> the shared pci_host_common_can_enter_d3cold() helper to decide whether the
> DesignWare host bridge can safely transition to D3cold.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 7 +------
>  drivers/pci/controller/dwc/pcie-designware.h      | 1 +
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 372207c33a857b4c98572bb1e9b61fa0080bc871..2c8056761addf7febc1b0e06ddf8ba4dd4ad1684 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -1157,15 +1157,10 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
>  
>  int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  {
> -	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
>  	u32 val;
>  	int ret;
>  
> -	/*
> -	 * If L1SS is supported, then do not put the link into L2 as some
> -	 * devices such as NVMe expect low resume latency.
> -	 */
> -	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
> +	if (!pci_host_common_can_enter_d3cold(pci->pp.bridge))
>  		return 0;
>  
>  	if (pci->pp.ops->pme_turn_off) {
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 31685951a080456b8834aab2bf79a36c78f46639..18d8f7d5d23088b2fa177e84a21d900c98850fcd 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -26,6 +26,7 @@
>  #include <linux/pci-epc.h>
>  #include <linux/pci-epf.h>
>  
> +#include "../pci-host-common.h"

Why doesn't this include go in the c file? I don't see that all c files
including pcie-designware.h now needs this.

Regards,
Bjorn

>  #include "../../pci.h"
>  
>  /* DWC PCIe IP-core versions (native support since v4.70a) */
> 
> -- 
> 2.34.1
> 
> 

