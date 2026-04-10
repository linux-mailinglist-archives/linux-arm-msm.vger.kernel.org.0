Return-Path: <linux-arm-msm+bounces-102708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJJmJE8t2Wl+nAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 19:03:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDE73DAD9E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 19:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CCC81309DD4A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 16:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B850E3DC4AD;
	Fri, 10 Apr 2026 16:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1h7Yc7o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F2932B9B5;
	Fri, 10 Apr 2026 16:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775840163; cv=none; b=g15HYPNbwCujwAiR9pS7yVJsCXYrcWmYoH7I4bkQ7zwsFK3iqOV+NvnOISMFP4/WO96zuEHuT3mF1bxaLcmX2S/vcpVGaWD9Q4G3aRtEeRi0Q4GDqAmJukk+OvTpAm7BN79c0xZw868dXNiCH8WJZkQG1OePwIq40Z+/EQyRFqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775840163; c=relaxed/simple;
	bh=0zOCZJnaYIQuYXQVmurpx5jqunz0DRYinF6Wn5Dcq2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=muDDp76KOTnq8chhzVWQD+ygIAJM6WBZhtaESTlB7BmN6DTcT5cgcu+lOP6O/9rLPRlUe5tkQ8UOrngdhhfBQ1pRckkHc4bpvTOnflEfrnBimVvpJNAff8IGHoY9cfFYNutgJA2H+6iWl8Zp/lYmpvxVvExx936CbuAZPtvATJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o1h7Yc7o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0860C19421;
	Fri, 10 Apr 2026 16:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775840162;
	bh=0zOCZJnaYIQuYXQVmurpx5jqunz0DRYinF6Wn5Dcq2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o1h7Yc7oCOq3Ai8V1bMJZvNxjC5LPo6chXUELz/EF9K/Y7SLR0qcNumrg0KjDR8o4
	 dTzTirYa7wPlbFFvxZz9puTQwC6DkuSwOa5SLjOocKw2k8KLisyLrmNYRufB9TxZIL
	 Y98ajNicRgBQNd+JCVCwsbpTHIkWBgyOUakZcJsmLLUIwSiwIK/p2ddjt0P/pMuBAM
	 dWNaYEkI5s+13wukwys1t5idh4IHzbnmliN1cnksVjJKQso3EEWFfvC9iQYdmftpTf
	 uz8H/2Rr3JBDYxiNETS7lPigIzJ8FMbSOwVR9QEk9wH5t24/8MZWdxoiiFLmNYZTcw
	 uuC0oetTOn7iA==
Date: Fri, 10 Apr 2026 22:25:54 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, mayank.rana@oss.qualcomm.com, 
	quic_vbadigan@quicinc.com
Subject: Re: [PATCH v4 3/3] PCI: qcom: Program T_POWER_ON
Message-ID: <hd3zmtaaetewdlki77jtqqfz2dzv2mad2dcqmssvqbagm3p62h@qihlc6xw4vqn>
References: <20260404-t_power_on_fux-v4-0-2891391177f4@oss.qualcomm.com>
 <20260404-t_power_on_fux-v4-3-2891391177f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260404-t_power_on_fux-v4-3-2891391177f4@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	TAGGED_FROM(0.00)[bounces-102708-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 0EDE73DAD9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 04, 2026 at 01:47:20PM +0530, Krishna Chaitanya Chundru wrote:
> Some platforms have incorrect T_POWER_ON value programmed in hardware.
> Generally these will be corrected by bootloaders, but not all targets
> support bootloaders to program correct values due to that
> LTR_L1.2_THRESHOLD value calculated by aspm driver can be wrong, which
> can result in improper L1.2 exit behavior and if AER happens to be
> supported and enabled, the error may be *reported* via AER.
> 
> Parse "t-power-on-us" property from each root port node and program them
> as part of host initialization using dw_pcie_program_t_power_on() before
> link training.
> 
> This property in added to the dtschema here[1].
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Link[1]: https://lore.kernel.org/all/20260205093346.667898-1-krishna.chundru@oss.qualcomm.com/
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 67a16af69ddc75fca1b123e70715e692a91a9135..a8f82f860c08fe2eabad2c0eed541b8dd121215e 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -269,6 +269,7 @@ struct qcom_pcie_perst {
>  struct qcom_pcie_port {
>  	struct list_head list;
>  	struct phy *phy;
> +	u32 l1ss_t_power_on;
>  	struct list_head perst;
>  };
>  
> @@ -1283,6 +1284,14 @@ static int qcom_pcie_phy_power_on(struct qcom_pcie *pcie)
>  	return 0;
>  }
>  
> +static void qcom_pcie_configure_ports(struct qcom_pcie *pcie)
> +{
> +	struct qcom_pcie_port *port;
> +
> +	list_for_each_entry(port, &pcie->ports, list)
> +		dw_pcie_program_t_power_on(pcie->pci, port->l1ss_t_power_on);

Since this writes to the same register, there is no point in iterating over all
ports. Add a TODO here also and write it only once.

> +}
> +
>  static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> @@ -1317,6 +1326,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>  	dw_pcie_remove_capability(pcie->pci, PCI_CAP_ID_MSIX);
>  	dw_pcie_remove_ext_capability(pcie->pci, PCI_EXT_CAP_ID_DPC);
>  
> +	qcom_pcie_configure_ports(pcie);
> +
>  	qcom_pcie_perst_deassert(pcie);
>  
>  	if (pcie->cfg->ops->config_sid) {
> @@ -1759,6 +1770,9 @@ static int qcom_pcie_parse_port(struct qcom_pcie *pcie, struct device_node *node
>  	if (ret)
>  		return ret;
>  
> +	/* TODO: Need to move to dwc once multi root port support is added.  */

s/dwc/DWC core

s/root port/Root Port

- Mani

-- 
மணிவண்ணன் சதாசிவம்

