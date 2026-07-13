Return-Path: <linux-arm-msm+bounces-118624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f7LzN65uVGoFmAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 06:50:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D49174727B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 06:50:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BPNovL9d;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118624-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118624-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56E6D30015A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 04:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB4925F994;
	Mon, 13 Jul 2026 04:50:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D64233945;
	Mon, 13 Jul 2026 04:50:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783918251; cv=none; b=RYXtCRgBhlPfH27knJ24Cb9zd77L7zwfkmB2s7VDoUplFBLr4jfvYQx3P676f8kElLBw1bKiioejG2djo28weJdtBvvkdFTLDrDPqjcLuqIE/y9TZrVIXyc4sdQcxpBmfgOoElQtTCecRD9eN2r3cJXmEhZzyB/uPxR75kCKKQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783918251; c=relaxed/simple;
	bh=ZD6NLAA8ZM3TqenH2KukxW8V6qHj7Pv2UjSY/2mlT7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2t8ZmiWmXbHWwtLvcoDw561GsNnYvcCa1oCSgyQllRxXU2QZqQAJCew6tgC34hBL1AkCizu+CsgqAPa16eUdBTWq65mE5XWFlIA6UREWTyjdw3O6OehSgwZ7155+PHT6WD6fu9R5+YMnnPylrj/y8ZP0dTUy2bzZhSV8DTubwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BPNovL9d; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2603B1F000E9;
	Mon, 13 Jul 2026 04:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783918249;
	bh=TH45Jg99FG/gJo75rbovzk0nMKzz59rxX4Xtky5qH8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BPNovL9d7v7NVRW8LxTrkUiCsy1UOMd2IkvrQanASNKUIGkQLit6f1j8JCjChM6yB
	 pQK2yn5/Ucn8+Y/5527LPoTXwByO9oWtb9CVaT0lJ/GK5twV5J6PJtwaPlcxucCZY2
	 B6s10z+pWjREnKDV1InM8jOS0gQ287Mv4r7dgOP5jND57GFFqfGof2dK8Q4j9zRPLs
	 wCYv/Qdvg1oUCUR5kunIulHvNFA/9WSv39gUPg1M8nIgGlh17efYzdro8IcdUsq800
	 UK0b5MMJz+sifykibLY5fBz0hWVWlk1+Y/TD+6iK/EezF9Az4rGiH74c729+a3QSEV
	 ndYcxACb3x+MQ==
Date: Mon, 13 Jul 2026 06:50:40 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Jingoo Han <jingoohan1@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/4] PCI: qcom: Add link retention support
Message-ID: <63rwvquftwg77cy6wmsw7stubpluvmp6dplg3nt5lzhdilio2e@dmdesbk63frc>
References: <20260709-link_retain-v3-0-81a9d187bb61@oss.qualcomm.com>
 <20260709-link_retain-v3-3-81a9d187bb61@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260709-link_retain-v3-3-81a9d187bb61@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krishna.chundru@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:p.zabel@pengutronix.de,m:jingoohan1@gmail.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118624-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,pengutronix.de,gmail.com,google.com,vger.kernel.org,lists.infradead.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,dmdesbk63frc:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D49174727B

On Thu, Jul 09, 2026 at 12:05:18PM +0530, Krishna Chaitanya Chundru wrote:
> Some platforms keep the PCIe link active across bootloader and kernel
> handoff. Reinitializing the controller and toggling PERST# in such cases is
> unnecessary when the driver does not need to retrain the link.
> 
> Introduce link_retain in both qcom_pcie_cfg and qcom_pcie to indicate when
> link retention is supported. During initialization, check the LTSSM state;
> if the link is already in L0 or L1 idle and LTSSM is enabled, set
> link_retain and skip controller reset, PERST# toggling, and other post-
> init steps.
> 
> The max-link-speed and num-lanes properties in Device Tree cap the link's
> maximum capability. Retrain the link if the controller's max link speed or
> width exceeds the Device Tree cap, unless the currently negotiated speed
> or width is already within that cap, in which case the existing link can
> still be retained.
> 
> Configure the DBI and ATU base addresses in the retention path, since the
> bootloader may use different base addresses than those provided by the
> device tree.
> 

Where is this base address change?

> Set l1ss_support in the retention path as well, since it is otherwise only
> set later in the normal init flow which is skipped when the link is
> retained.
> 
> Tested-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware.h |  1 +
>  drivers/pci/controller/dwc/pcie-qcom.c       | 68 ++++++++++++++++++++++++++--
>  2 files changed, 66 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index de4b245b1758..0c98b914eb52 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -471,6 +471,7 @@ struct dw_pcie_rp {
>  	bool			native_ecam;
>  	bool                    skip_l23_ready;
>  	bool			skip_pwrctrl_off;
> +	bool			link_retain;
>  };
>  
>  struct dw_pcie_ep_ops {
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 9ca620d4746a..77d2d989e9da 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -260,12 +260,14 @@ struct qcom_pcie_ops {
>    * @override_no_snoop: Override NO_SNOOP attribute in TLP to enable cache
>    * snooping
>    * @firmware_managed: Set if the Root Complex is firmware managed
> +  * @link_retain: Set if controller supports retaining link from bootloader
>    */
>  struct qcom_pcie_cfg {
>  	const struct qcom_pcie_ops *ops;
>  	bool override_no_snoop;
>  	bool firmware_managed;
>  	bool no_l0s;
> +	bool link_retain;
>  };
>  
>  struct qcom_pcie_perst {
> @@ -996,6 +998,50 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
>  	return 0;
>  }
>  
> +/*
> + * Determine whether the link established by the bootloader can be reused.
> + *
> + * The max-link-speed and num-lanes specified in Device Tree are meant to cap
> + * the link's maximum capability. Retrain the link if the controller's max
> + * link speed/width exceeds the Device Tree cap, unless the currently
> + * negotiated speed/width is already within that cap, in which case the
> + * existing link can be retained as-is.
> + */
> +static bool qcom_pcie_check_link_retain(struct qcom_pcie *pcie)
> +{
> +	u32 cap, speed, cur_speed, val, ltssm, width, cur_width;
> +	struct dw_pcie *pci = pcie->pci;
> +	u8 offset;
> +
> +	val = readl(pcie->parf + PARF_LTSSM);
> +	ltssm = val & 0x1f;
> +	if ((val & LTSSM_EN) &&
> +	    (ltssm == DW_PCIE_LTSSM_L0 || ltssm == DW_PCIE_LTSSM_L1_IDLE)) {
> +		qcom_pcie_configure_dbi_atu_base(pcie);
> +
> +		offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +		cap = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
> +		speed = FIELD_GET(PCI_EXP_LNKCAP_SLS, cap);
> +		width = dw_pcie_link_get_max_link_width(pci);
> +
> +		val = dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKSTA);
> +		cur_speed = FIELD_GET(PCI_EXP_LNKSTA_CLS, val);
> +		cur_width = FIELD_GET(PCI_EXP_LNKSTA_NLW, val);
> +
> +		if (pci->max_link_speed > 0 && speed > pci->max_link_speed &&
> +		    cur_speed > pci->max_link_speed)
> +			return false;
> +
> +		if (pci->num_lanes > 0 && width > pci->num_lanes &&
> +		    cur_width > pci->num_lanes)
> +			return false;
> +
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>  static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
>  {
>  	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
> @@ -1014,6 +1060,15 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
>  	if (ret < 0)
>  		goto err_disable_regulators;
>  
> +	if (pcie->cfg->link_retain) {
> +		pci->pp.link_retain = qcom_pcie_check_link_retain(pcie);
> +		pci->l1ss_support = true;
> +		if (pci->pp.link_retain) {
> +			dev_info(dev, "Retaining PCIe link\n");
> +			return 0;
> +		}
> +	}
> +
>  	ret = reset_control_assert(res->rst);
>  	if (ret) {
>  		dev_err(dev, "reset assert failed (%d)\n", ret);
> @@ -1074,6 +1129,9 @@ static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
>  {
>  	const struct qcom_pcie_cfg *pcie_cfg = pcie->cfg;
>  
> +	if (pcie->pci->pp.link_retain)
> +		return 0;
> +
>  	if (pcie_cfg->override_no_snoop)
>  		writel(WR_NO_SNOOP_OVERRIDE_EN | RD_NO_SNOOP_OVERRIDE_EN,
>  				pcie->parf + PARF_NO_SNOOP_OVERRIDE);
> @@ -1364,12 +1422,13 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>  	struct qcom_pcie *pcie = to_qcom_pcie(pci);
>  	int ret;
>  
> -	qcom_pcie_perst_assert(pcie);
> -

This is problematic. Most of the init callbacks do operations like reset the
PHY, enable clocks... If those operations affect the link state and the device
is not reset using PERST#, it will cause the device to crash.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

