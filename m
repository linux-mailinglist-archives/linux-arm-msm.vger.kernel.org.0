Return-Path: <linux-arm-msm+bounces-107963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLoJLGRlB2qE1gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 20:26:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 498495562C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 20:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 199E733FB0E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 17:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767B14F7990;
	Fri, 15 May 2026 17:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kt0rtmij"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C194DB557;
	Fri, 15 May 2026 17:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778866870; cv=none; b=mPiogVu8b5rlWyPoS3ELZnDO/el7bmCrC/L+oWzWwJQtQurRKRyc6tAoXBsPNBI17bymh1Qp8KrJiKddmGmClD8gP1HJAinMvHFR2pDI25lDBp/Gl5K4SSvicw2butwghRgb6FfE7c2718EyHu9hxEOUnqf2EiOdR/KCHEGQ3Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778866870; c=relaxed/simple;
	bh=GftQgpMFNiFvBjzhE4Zh/QNssHvSCAA7nuBOzWM34h8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=klLx/vBRJgsCIVAM0yBmOEmd98M5Q9N+jEKwFU761iFtaOGUMAyUbD2cPHV1x884ohfSKoDTE+xu+VouO1rL0wH2SmBkggisnKK0Llo9zTwEKkErtU5AkdXKGlVELI4S9Pg6lGvLvo1yrkd11H7Fnwcj07CuEMuUH0Gud8X2Lk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kt0rtmij; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E194C2BCB3;
	Fri, 15 May 2026 17:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778866869;
	bh=GftQgpMFNiFvBjzhE4Zh/QNssHvSCAA7nuBOzWM34h8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kt0rtmij+WVpjYj6bakqGqgLjVaTlumh/Dpq2FPHFgsNeWuDQO3RLY9nxV8pGBNm5
	 Pj1juB8T8fnQVDwzuEt9yhmNRwgAfJKIuJ4GyFuN40V/dgCQWNmHjYFTCr+IytlGGM
	 HMqhURERHRUkpR4SMHfGjAdJQwT3lQ89Od6peVo4U9SdXYQlFipSyhXU40VIdP2xIt
	 sigrJ3CHAX1b0NaA6dBJ7BZbmXO2FQ70sDAu6+McBw4VI+QKYHja+EHypbQtK90Bpr
	 zpz47CIr1eOJNAvk8tZcUDgAbkqVvfDK47cjm1Fho5vFWTrvIVF0nKzIWhFM7qsMF4
	 QYRbhHBswlSsQ==
Date: Fri, 15 May 2026 23:11:02 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Xilin Wu <sophon@radxa.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom: Restrict PERST# parsing to PCI bridge nodes
Message-ID: <j4fwefcgxarxbfxpcbwyllzsj65ryvtpnyt2l25goavpmspj3g@5vjvggtjzroq>
References: <20260507-fix-qcom-pcie-parse-perst-v1-1-79bdcce38eeb@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260507-fix-qcom-pcie-parse-perst-v1-1-79bdcce38eeb@radxa.com>
X-Rspamd-Queue-Id: 498495562C0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107963-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,radxa.com:email]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 10:18:31PM +0800, Xilin Wu wrote:
> Commit 2fd60a2edb83 ("PCI: qcom: Parse PERST# from all PCIe bridge
> nodes") extended PERST# parsing below the Root Port, so that downstream
> PCIe switch bridge nodes can describe their own PERST# GPIOs.
> 
> However, the implementation recurses into every available child node.  A
> PCI hierarchy may contain non-bridge child nodes with unrelated
> "reset-gpios" properties, such as an Ethernet PHY below an MDIO bus.  If
> such a reset GPIO is provided by a PCI endpoint GPIO controller, the
> endpoint has not been enumerated while the host bridge is still probing.
> Trying to acquire that GPIO then returns -EPROBE_DEFER and the Root Port
> probe is deferred indefinitely.
> 
> Only recurse into child nodes that are PCI bridge/bus nodes.  Keep parsing
> the Root Port passed by qcom_pcie_parse_port(), but filter descendants to
> nodes with device_type = "pci" and either a bus-range property or an
> explicit PCI bridge class compatible.
> 
> Fixes: 2fd60a2edb83 ("PCI: qcom: Parse PERST# from all PCIe bridge nodes")
> Signed-off-by: Xilin Wu <sophon@radxa.com>

This issue was already fixed by:
45df22935bdc ("PCI: qcom: Restrict port parsing only to PCIe bridge child nodes")

Could you please test v7.1-rc1 and confirm if the fix works for you?

- Mani

> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index af6bf5cce65b..5e0c31cc32a0 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1693,7 +1693,16 @@ static const struct pci_ecam_ops pci_qcom_ecam_ops = {
>  	}
>  };
>  
> -/* Parse PERST# from all nodes in depth first manner starting from @np */
> +static bool qcom_pcie_is_bridge_node(struct device_node *np)
> +{
> +	if (!of_node_is_type(np, "pci"))
> +		return false;
> +
> +	return of_property_present(np, "bus-range") ||
> +	       of_device_is_compatible(np, "pciclass,0604");
> +}
> +
> +/* Parse PERST# from all PCIe bridge nodes starting from @np */
>  static int qcom_pcie_parse_perst(struct qcom_pcie *pcie,
>  				 struct qcom_pcie_port *port,
>  				 struct device_node *np)
> @@ -1731,6 +1740,9 @@ static int qcom_pcie_parse_perst(struct qcom_pcie *pcie,
>  
>  parse_child_node:
>  	for_each_available_child_of_node_scoped(np, child) {
> +		if (!qcom_pcie_is_bridge_node(child))
> +			continue;
> +
>  		ret = qcom_pcie_parse_perst(pcie, port, child);
>  		if (ret)
>  			return ret;
> 
> ---
> base-commit: 735d2f48cadaa9a87e7c7601667878de70c771c5
> change-id: 20260507-fix-qcom-pcie-parse-perst-a882f580a658
> 
> Best regards,
> --  
> Xilin Wu <sophon@radxa.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

