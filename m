Return-Path: <linux-arm-msm+bounces-90301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBKxLIkkc2nCsgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:34:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EE09171C38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:34:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF83A3008E14
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 07:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0D6311C05;
	Fri, 23 Jan 2026 07:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NfT7cwqD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD1630C61F;
	Fri, 23 Jan 2026 07:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769153670; cv=none; b=YyFlK1s7A6R+CdqhRfjcNhZLQYPBNrs1ppIgrr0mZJ5KEeqBamkrxud50Pj5Kmz51Zs21tABriB65O6VMNZB8qKihDFUD9anTh4wbtVS8WAIbYkI+L6k43RJuNnYeW/73uz1vOCA1BtcldyWj6yrhUHGwYizt1+kJkWX+9+Dcfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769153670; c=relaxed/simple;
	bh=7NMXnrjC1tbNqN85RiD6VP7O/R0tIVUPWDic30QZiGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7ZpXoxovExjTKuxXTfpkBNUoaZdlsaTgp3QvG8+XD4ULyOSaXzi5e42qtRDb2i5qXd+GdWfsqpR2JC8X4ZlMTZ/5pU6R58x0oiZ399/wpxC8MK+F2+/QMAMglZF1dJmQZzLsaBwtHDrTRDz48XlzWdcPZHawpPL8iGnoE7NZlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NfT7cwqD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93F21C4CEF1;
	Fri, 23 Jan 2026 07:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769153669;
	bh=7NMXnrjC1tbNqN85RiD6VP7O/R0tIVUPWDic30QZiGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NfT7cwqD55tNHJByyfHeodctBW2t4LfS5jMsFegZUaDh1HElpKXY5kqT3TrHhSZjV
	 SyZgKwFcANJhySAdyZP69go/6yCt19oV+icdrKseWcLJQd0YEf5/G4hwdwgWfZ1b2h
	 tJ/xwoF8NAwbSGKugl+nvNObyVhkYXrGWGhwh9E/Hqai5qDrYI8yIiz2jT3VvN2TfK
	 VRL5kI1YoKxTIe3JQAelIMCLHzUplYgc3FXZQOYxKwyG862XPMbLsLHOcsmC9myJee
	 KzMMUeJs/JP2mT49EXqTizeCPBdYB0y0KIH0ijELyYGe/Ss9GI2wbNHuhCBC6Yt/T8
	 ZnthJz9yFMBZg==
Date: Fri, 23 Jan 2026 13:04:22 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] PCI: dwc: Rename has_msi_ctrl to uses_imsi_rx for
 clarity
Message-ID: <ax2sy242cejr66p6tlbrghhnvlvfhubmtcjk426hsvjgn2gino@l3ncdjb4gfby>
References: <20260121-remove_cap_clean_up-v1-0-e78115e5d467@oss.qualcomm.com>
 <20260121-remove_cap_clean_up-v1-2-e78115e5d467@oss.qualcomm.com>
 <09f9acc1-d1ad-4971-8488-f0268cf08799@rock-chips.com>
 <aXMQ2r1UKgAaYvNx@hu-qianyu-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXMQ2r1UKgAaYvNx@hu-qianyu-lv.qualcomm.com>
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
	FREEMAIL_CC(0.00)[rock-chips.com,gmail.com,kernel.org,google.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-90301-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.978];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: EE09171C38
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 10:10:34PM -0800, Qiang Yu wrote:
> On Thu, Jan 22, 2026 at 04:15:52PM +0800, Shawn Lin wrote:
> > Hi Qiang,
> > 
> > 在 2026/01/22 星期四 15:45, Qiang Yu 写道:
> > > The current "has_msi_ctrl" flag name is misleading because it suggests the
> > > presence of any MSI controller, while it is specifically set for platforms
> > > that lack .msi_init() callback and don't have "msi-parent" or "msi-map"
> > > device tree properties, indicating they rely on the iMSI-RX module for MSI
> > > functionality.
> > > 
> > > Rename it to "uses_imsi_rx" to make the intent clear:
> > > - When true: Platform uses the iMSI-RX module for MSI handling
> > > - When false: Platform has other MSI controller support (ITS/MBI, custom
> > > handlers)
> > > 
> > > No functional changes, only improves code readability and eliminates
> > > naming confusion.
> > > 
> > 
> > I love this patch, it's indeed confusing. But I noticed the naming
> > seems inconsistency, for instance, there are already use_atu_msg,
> > use_parent_dt_ranges, etc. Should we use use_imsi_rx instead?
> 
> Thank you. You are right. Use_imsi_rx is more consistency.
> 

Ammended this change while applying, thanks Shawn!

- Mani

> - Qiang Yu
> > 
> > But in any case,
> > Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
> > 
> > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > ---
> > >   drivers/pci/controller/dwc/pcie-designware-host.c | 16 ++++++++--------
> > >   drivers/pci/controller/dwc/pcie-designware.h      |  2 +-
> > >   drivers/pci/controller/dwc/pcie-qcom.c            |  4 ++--
> > >   3 files changed, 11 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > index a17833dd6f9d4b4aa06dc1fe09ffed5e2c28a82f..e7dbdf3670b426783e778be5064def10d2b209b1 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > @@ -255,7 +255,7 @@ void dw_pcie_msi_init(struct dw_pcie_rp *pp)
> > >   	u64 msi_target = (u64)pp->msi_data;
> > >   	u32 ctrl, num_ctrls;
> > > -	if (!pci_msi_enabled() || !pp->has_msi_ctrl)
> > > +	if (!pci_msi_enabled() || !pp->uses_imsi_rx)
> > >   		return;
> > >   	num_ctrls = pp->num_vectors / MAX_MSI_IRQS_PER_CTRL;
> > > @@ -603,15 +603,15 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
> > >   	}
> > >   	if (pci_msi_enabled()) {
> > > -		pp->has_msi_ctrl = !(pp->ops->msi_init ||
> > > +		pp->uses_imsi_rx = !(pp->ops->msi_init ||
> > >   				     of_property_present(np, "msi-parent") ||
> > >   				     of_property_present(np, "msi-map"));
> > >   		/*
> > > -		 * For the has_msi_ctrl case the default assignment is handled
> > > +		 * For the uses_imsi_rx case the default assignment is handled
> > >   		 * in the dw_pcie_msi_host_init().
> > >   		 */
> > > -		if (!pp->has_msi_ctrl && !pp->num_vectors) {
> > > +		if (!pp->uses_imsi_rx && !pp->num_vectors) {
> > >   			pp->num_vectors = MSI_DEF_NUM_VECTORS;
> > >   		} else if (pp->num_vectors > MAX_MSI_IRQS) {
> > >   			dev_err(dev, "Invalid number of vectors\n");
> > > @@ -623,7 +623,7 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
> > >   			ret = pp->ops->msi_init(pp);
> > >   			if (ret < 0)
> > >   				goto err_deinit_host;
> > > -		} else if (pp->has_msi_ctrl) {
> > > +		} else if (pp->uses_imsi_rx) {
> > >   			ret = dw_pcie_msi_host_init(pp);
> > >   			if (ret < 0)
> > >   				goto err_deinit_host;
> > > @@ -701,7 +701,7 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
> > >   	dw_pcie_edma_remove(pci);
> > >   err_free_msi:
> > > -	if (pp->has_msi_ctrl)
> > > +	if (pp->uses_imsi_rx)
> > >   		dw_pcie_free_msi(pp);
> > >   err_deinit_host:
> > > @@ -729,7 +729,7 @@ void dw_pcie_host_deinit(struct dw_pcie_rp *pp)
> > >   	dw_pcie_edma_remove(pci);
> > > -	if (pp->has_msi_ctrl)
> > > +	if (pp->uses_imsi_rx)
> > >   		dw_pcie_free_msi(pp);
> > >   	if (pp->ops->deinit)
> > > @@ -1130,7 +1130,7 @@ int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
> > >   	 * the MSI and MSI-X capabilities of the Root Port to allow the drivers
> > >   	 * to fall back to INTx instead.
> > >   	 */
> > > -	if (pp->has_msi_ctrl) {
> > > +	if (pp->uses_imsi_rx) {
> > >   		dw_pcie_remove_capability(pci, PCI_CAP_ID_MSI);
> > >   		dw_pcie_remove_capability(pci, PCI_CAP_ID_MSIX);
> > >   	}
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> > > index 53b65428fadb3d905b02bdcc06667065574f4f9d..33154bc89dd3b7d7fbe0ea749ca22bdc8292489c 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > > @@ -416,7 +416,7 @@ struct dw_pcie_host_ops {
> > >   };
> > >   struct dw_pcie_rp {
> > > -	bool			has_msi_ctrl:1;
> > > +	bool			uses_imsi_rx:1;
> > >   	bool			cfg0_io_shared:1;
> > >   	u64			cfg0_base;
> > >   	void __iomem		*va_cfg0_base;
> > > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > > index 13e6c334e10d21b9ebfe5f82de0aff3bce6191e3..999f5e083cef4e78b85a0111d2a90c3de65c83b5 100644
> > > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > > @@ -1633,7 +1633,7 @@ static void qcom_pci_free_msi(void *ptr)
> > >   {
> > >   	struct dw_pcie_rp *pp = (struct dw_pcie_rp *)ptr;
> > > -	if (pp && pp->has_msi_ctrl)
> > > +	if (pp && pp->uses_imsi_rx)
> > >   		dw_pcie_free_msi(pp);
> > >   }
> > > @@ -1657,7 +1657,7 @@ static int qcom_pcie_ecam_host_init(struct pci_config_window *cfg)
> > >   	if (ret)
> > >   		return ret;
> > > -	pp->has_msi_ctrl = true;
> > > +	pp->uses_imsi_rx = true;
> > >   	dw_pcie_msi_init(pp);
> > >   	return devm_add_action_or_reset(dev, qcom_pci_free_msi, pp);
> > > 
> > 

-- 
மணிவண்ணன் சதாசிவம்

