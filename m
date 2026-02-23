Return-Path: <linux-arm-msm+bounces-93729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJCUMmx3nGlfIAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:51:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 404A0179104
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A2360305D92F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D59B3009E8;
	Mon, 23 Feb 2026 15:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MqryC5cF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0E72FF17A;
	Mon, 23 Feb 2026 15:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771861678; cv=none; b=OKhr2WSmskrLaTYqkdT3PD0Xp5kA9BrrfzfbHoG1/CJyVPmLoYaYn10T9fc+vz54TtLM461S2nJmNgrGI42vbDgA2rCFdm6E5ZJayOld6l/JQsOY5nQOfA6CMwmQW2BdwwQ647U5/7x27zHHxwglkPGOB5xf+jlxfWjm26k7I6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771861678; c=relaxed/simple;
	bh=f8k3wdW0fE+4YcbFUG6ryjsoLx4/LjdmMkOoJ/G7YE4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=MWvYsiTRwzsT6v16wX9xKzgMWUywqkqXBuXY0pk9vfVCP8OldmzHzlyQSvHrl7R97opsQ3Chizlit9K5GKS8jJKkbsLFLhADU8QrQALptbXuZ2Z8viHnUhP99izGCzcD8QjyI79TWYef2GM6z2TGMZSPWIvFAwyAoZqqB4iWsJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MqryC5cF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DDB8C116C6;
	Mon, 23 Feb 2026 15:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771861677;
	bh=f8k3wdW0fE+4YcbFUG6ryjsoLx4/LjdmMkOoJ/G7YE4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=MqryC5cFXEP7LCDxsXuJvnozoLYFVlf5JsO8fhDkpH8WIEsccyrDPzKs3x3xPzS/z
	 LqnR5+wW75orsoEGq6kSqgkj+g6Jvyf64zshz3gMsO++0U3uy26NhlOM6kIPKtImoi
	 uvN9wJRmfv5O/bx98U6cAdgrVtBrfxP37szphAkuWIrCXBijZLcbzyPJGuQpW7i4vW
	 0fEG6QttUBC/oV6BGIMUy93LkaZ/Vjh0UHft41B+0DH6zw/+854ZxjzP7pvJzU3zO1
	 o2MgRhtryhP9480CVsfwCbAD7sqex3dJM/W68WV3vGeOH2Bz0cHsUYBXPIX8qTwPj4
	 ZqcpFWUglh0YQ==
Date: Mon, 23 Feb 2026 09:47:56 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com
Subject: Re: [PATCH v2 3/3] PCI: qcom: Program T_POWER_ON
Message-ID: <20260223154756.GA3695420@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-t_power_on_fux-v2-3-20c921262709@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93729-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
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
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 404A0179104
X-Rspamd-Action: no action

Mention L1 PM Substates in the subject so we know where to look for
T_POWER_ON.

On Mon, Feb 23, 2026 at 04:43:32PM +0530, Krishna Chaitanya Chundru wrote:
> Some platforms have incorrect T_POWER_ON value programmed in hardware.
> Generally these will be corrected by bootloaders, but not all targets
> support bootloaders to program correct values due to that
> LTR_L1.2_THRESHOLD value calculated by aspm driver can be wrong, which
> can result in improper L1.2 exit behavior and can trigger AER's.

"AER" is a little bit too specific here.  The actual behavior is some
PCIe error, e.g., Bad DLLP, Data Link Protol Error, etc (if you know
the actual error, please mention it here), and if AER happens to be
supported and enabled, the error may be *reported* via AER.

> Parse "t-power-on-us" property from each root port node and program them
> as part of host initialization using dw_pcie_program_t_power_on() before
> link training.
> 
> This property in added to the dtschema here[1].
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Link[1]: https://lore.kernel.org/all/20260205093346.667898-1-krishna.chundru@oss.qualcomm.com/
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 67a16af69ddc75fca1b123e70715e692a91a9135..489ed64c1df0fa3ed9f6b0d4c3e0bb65cfc3308e 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -269,6 +269,7 @@ struct qcom_pcie_perst {
>  struct qcom_pcie_port {
>  	struct list_head list;
>  	struct phy *phy;
> +	u32 t_power_on;

Please mention L1 PM Substates somewhere here (comment, member name,
function name?) Currently there's nothing in the code that a reader
could look up in a spec.

>  	struct list_head perst;
>  };
>  
> @@ -1283,6 +1284,16 @@ static int qcom_pcie_phy_power_on(struct qcom_pcie *pcie)
>  	return 0;
>  }
>  
> +static int qcom_pcie_configure_ports(struct qcom_pcie *pcie)
> +{
> +	struct qcom_pcie_port *port;
> +
> +	list_for_each_entry(port, &pcie->ports, list)
> +		dw_pcie_program_t_power_on(pcie->pci, port->t_power_on);
> +
> +	return 0;

Why return a value if it's never used or checked?  If we need a return
value later, we can add it then.

> +}
> +
>  static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> @@ -1317,6 +1328,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>  	dw_pcie_remove_capability(pcie->pci, PCI_CAP_ID_MSIX);
>  	dw_pcie_remove_ext_capability(pcie->pci, PCI_EXT_CAP_ID_DPC);
>  
> +	qcom_pcie_configure_ports(pcie);
> +
>  	qcom_pcie_perst_deassert(pcie);
>  
>  	if (pcie->cfg->ops->config_sid) {
> @@ -1759,6 +1772,8 @@ static int qcom_pcie_parse_port(struct qcom_pcie *pcie, struct device_node *node
>  	if (ret)
>  		return ret;
>  
> +	of_property_read_u32(node, "t-power-on-us", &port->t_power_on);
> +
>  	port->phy = phy;
>  	INIT_LIST_HEAD(&port->list);
>  	list_add_tail(&port->list, &pcie->ports);
> 
> -- 
> 2.34.1
> 

