Return-Path: <linux-arm-msm+bounces-118336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QSPbB1UsUWp8AQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 19:31:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A543E73D0AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 19:31:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=b8M3ltsW;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118336-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118336-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1BE8B300D4DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 17:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B519C26C385;
	Fri, 10 Jul 2026 17:30:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6528D3749E4;
	Fri, 10 Jul 2026 17:30:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783704659; cv=none; b=pey3xzXHDPyZI8AGxCThqRMoBQ7HXaDne+tInqB8VbE/6f58t3B+N5EbTXkYycrL3QPcNUgcjCghKzb+1ds7zDY6yr9Vu4RnuZKfyuY5uOVSsAwP8a/8l5T1trtxQe+JJ5MKkIYAp99gIh6QayWoldPt1rmgU42GidBG3GIA/+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783704659; c=relaxed/simple;
	bh=b67a0EPzaAw7rSE9bN4ze+rXB6DxeUA4NlxZQyt/Kp8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=EDWTSK56dTYM6GE1+isJq/06LAb6VuAsqkivLFlgsHBlGQKEvPC/r4ePnqkCuff51fsSqnsrGC8nNtHkwFvtznL7x26TAcMFTibxDEjHFbyHHN6ar03+4y0qaLvofWSLKRKiJLoC1hzzqvkjziTcZE7dTTKY89/odIaHKz1yfuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b8M3ltsW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46841F000E9;
	Fri, 10 Jul 2026 17:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783704658;
	bh=GuJryolNn69SO+2UKk9jEdCx7H4hM5LvaTK6HyZ4T28=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=b8M3ltsW27WGOAXEoyL1en/NtPEwhYelNvb6oeE7ISnxmirOA1ov9TzkBY8CIkWen
	 7rsRMymcpsPPVUmdY8DM1ybH+ykPZBBSIEuZ7VkDkVjVGO1K+ercLGZILoyHow+/zQ
	 37HOaokoEFaOmvp2NNCKdayUXM09FCruA7qqrrtfrF0FWYBQJCs2topqOqwlgBPJdD
	 EYhGS6TPlOEZ9fmwEnl+14dL5W3aFtT5xPxmnVsDLiOtXi5+uNLvYMKsB0m6sq84nF
	 LCCPBsnVnB1NQWjbzGmklt4Pwj8xYPlxidnuITSmS0TnWk9YyhmkdTmnmbQ08oiDLC
	 3EJzXoxFl12NQ==
Date: Fri, 10 Jul 2026 12:30:56 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom: Clear Attention Button Present in Slot
 Capabilities
Message-ID: <20260710173056.GA966003@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-clear_abp_0710-v1-1-efd63ebdaa09@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:linux-pci@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[helgaas@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-118336-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bhelgaas:mid,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A543E73D0AE

On Fri, Jul 10, 2026 at 06:20:57AM -0700, Qiang Yu wrote:
> Qcom PCIe Root Ports advertise the Attention Button Present (ABP) bit in
> the Slot Capabilities register, but the slots have no attention button.

I'm a little surprised that this would be hard-wired into the RP
instead of being some kind of strapping or config option, which would
allow the SoC to be used in platforms that do have Attention Buttons.

If it's actually hard-wired, this might be OK.  If ABP could be made
to work in hypothetical platforms that include it, maybe this should
be based on a DT property?

> When ABP is set, pcie_enable_notification() in the pciehp driver enables
> the Attention Button Pressed interrupt (ABPE) and leaves the Presence
> Detect Changed interrupt (PDCE) disabled. As a result, presence detect
> changes are never reported and surprise hot-plug detection that relies on
> Presence Detect Changed events does not work.
> 
> While at it, rename qcom_pcie_set_slot_nccs() to qcom_pcie_set_slot_cap()
> since it now programs more than just the NCCS field.

It'd be nice if the rename were a separate preparatory patch so the
functional part is by itself and obvious.

> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index b193c989b2b8..89c2d4cb1fbe 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -358,7 +358,7 @@ static void qcom_pcie_clear_aspm_l0s(struct dw_pcie *pci)
>  	dw_pcie_dbi_ro_wr_dis(pci);
>  }
>  
> -static void qcom_pcie_set_slot_nccs(struct dw_pcie *pci)
> +static void qcom_pcie_set_slot_cap(struct dw_pcie *pci)
>  {
>  	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
>  	u32 val;
> @@ -372,6 +372,11 @@ static void qcom_pcie_set_slot_nccs(struct dw_pcie *pci)
>  	 */
>  	val = readl(pci->dbi_base + offset + PCI_EXP_SLTCAP);
>  	val |= PCI_EXP_SLTCAP_NCCS;

Need a blank line here.

> +	/*
> +	 * Qcom PCIe Root Ports do not support Attention Button, so clear
> +	 * Attention Button Present in Slot Capabilities.
> +	 */
> +	val &= ~PCI_EXP_SLTCAP_ABP;
>  	writel(val, pci->dbi_base + offset + PCI_EXP_SLTCAP);
>  
>  	dw_pcie_dbi_ro_wr_dis(pci);
> @@ -580,7 +585,7 @@ static int qcom_pcie_post_init_2_1_0(struct qcom_pcie *pcie)
>  	writel(CFG_BRIDGE_SB_INIT,
>  	       pci->dbi_base + AXI_MSTR_RESP_COMP_CTRL1);
>  
> -	qcom_pcie_set_slot_nccs(pcie->pci);
> +	qcom_pcie_set_slot_cap(pcie->pci);
>  
>  	return 0;
>  }
> @@ -660,7 +665,7 @@ static int qcom_pcie_post_init_1_0_0(struct qcom_pcie *pcie)
>  		writel(val, pcie->parf + PARF_AXI_MSTR_WR_ADDR_HALT);
>  	}
>  
> -	qcom_pcie_set_slot_nccs(pcie->pci);
> +	qcom_pcie_set_slot_cap(pcie->pci);
>  
>  	return 0;
>  }
> @@ -759,7 +764,7 @@ static int qcom_pcie_post_init_2_3_2(struct qcom_pcie *pcie)
>  	val |= EN;
>  	writel(val, pcie->parf + PARF_AXI_MSTR_WR_ADDR_HALT_V2);
>  
> -	qcom_pcie_set_slot_nccs(pcie->pci);
> +	qcom_pcie_set_slot_cap(pcie->pci);
>  
>  	return 0;
>  }
> @@ -1078,7 +1083,7 @@ static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
>  		writel(WR_NO_SNOOP_OVERRIDE_EN | RD_NO_SNOOP_OVERRIDE_EN,
>  				pcie->parf + PARF_NO_SNOOP_OVERRIDE);
>  
> -	qcom_pcie_set_slot_nccs(pcie->pci);
> +	qcom_pcie_set_slot_cap(pcie->pci);
>  
>  	return 0;
>  }
> 
> ---
> base-commit: 3edb3a038d423480efeb204dbc6ddc9a292f8ecb
> change-id: 20260710-clear_abp_0710-2f81e92b9da4
> 
> Best regards,
> --  
> Qiang Yu <qiang.yu@oss.qualcomm.com>
> 

