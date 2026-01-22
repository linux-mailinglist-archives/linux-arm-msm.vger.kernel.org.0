Return-Path: <linux-arm-msm+bounces-90201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBK+Hp8ncmmadwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:35:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D1000675B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:35:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 30C54740087
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 12:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4110F3101CE;
	Thu, 22 Jan 2026 12:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="IIzq8JcI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m1973179.qiye.163.com (mail-m1973179.qiye.163.com [220.197.31.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970BA33D6CD;
	Thu, 22 Jan 2026 12:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769086326; cv=none; b=VBHH80oVeOhS906CbPpOUD5Aowu1NyUxyeo8trbD/vTV+c43Vk1pHJi/ux0YQ8eg7MF2HR0PHoW5pnbJJL5sblA+ZRg8cC0cogXFA1dLUMtJnStDdGvoFxpHTpL00HP+E7fPml7rDop1OKCYUYf4cEvcVgQR/osZPymSX83w3Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769086326; c=relaxed/simple;
	bh=oH4OPF0tawrZSboWsqQV8Wk5V/Ve1JkWG943xoj6I/U=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VLbO2MmNM9oCAyVPlbB7LuulnXPicEIfPf3zXFk65XjspdyKkKNzCsDubVZJCrpr9D2zqgT2z3eE/xSOSouVMT2ZtW/zxDkMJPBf1dtZ7gILfvLWpXcm5no4ZoWXfwA2hYwf1A7JOZj4uvDtYo6teiDDcSegQz9HCQ+6pSZQz+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=IIzq8JcI; arc=none smtp.client-ip=220.197.31.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3192b0431;
	Thu, 22 Jan 2026 16:15:54 +0800 (GMT+08:00)
Message-ID: <09f9acc1-d1ad-4971-8488-f0268cf08799@rock-chips.com>
Date: Thu, 22 Jan 2026 16:15:52 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] PCI: dwc: Rename has_msi_ctrl to uses_imsi_rx for
 clarity
To: Qiang Yu <qiang.yu@oss.qualcomm.com>, Jingoo Han <jingoohan1@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
References: <20260121-remove_cap_clean_up-v1-0-e78115e5d467@oss.qualcomm.com>
 <20260121-remove_cap_clean_up-v1-2-e78115e5d467@oss.qualcomm.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260121-remove_cap_clean_up-v1-2-e78115e5d467@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9be4c636e609cckunm14ea87cebf7b7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh4ZTFZNSkMaTEIYGUxNSUJWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=IIzq8JcI67qI+Dej9wE1vfiMIsKuAUdRsUki9Ewyc7/ZpxtxzVmnNKLSNyKh82lfwWaWUAdIg1aYu1obrvEdqH62PYny5b6liDg6SbF5mbVWmFt1N31hJz9v1Ebv7a2eTmE9GntwawGWNoEGh5gyD2xBOI6tVVdyT7pFV/AgHoQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=G7KAe8O/EONhIsPqZsYfU/8r+5SxhjqCO/8SBOh5FdI=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90201-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,google.com];
	DMARC_POLICY_ALLOW(0.00)[rock-chips.com,none];
	DKIM_TRACE(0.00)[rock-chips.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shawn.lin@rock-chips.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,qualcomm.com:email,rock-chips.com:email,rock-chips.com:dkim,rock-chips.com:mid]
X-Rspamd-Queue-Id: D1000675B6
X-Rspamd-Action: no action

Hi Qiang,

在 2026/01/22 星期四 15:45, Qiang Yu 写道:
> The current "has_msi_ctrl" flag name is misleading because it suggests the
> presence of any MSI controller, while it is specifically set for platforms
> that lack .msi_init() callback and don't have "msi-parent" or "msi-map"
> device tree properties, indicating they rely on the iMSI-RX module for MSI
> functionality.
> 
> Rename it to "uses_imsi_rx" to make the intent clear:
> - When true: Platform uses the iMSI-RX module for MSI handling
> - When false: Platform has other MSI controller support (ITS/MBI, custom
> handlers)
> 
> No functional changes, only improves code readability and eliminates
> naming confusion.
> 

I love this patch, it's indeed confusing. But I noticed the naming
seems inconsistency, for instance, there are already use_atu_msg,
use_parent_dt_ranges, etc. Should we use use_imsi_rx instead?

But in any case,
Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>   drivers/pci/controller/dwc/pcie-designware-host.c | 16 ++++++++--------
>   drivers/pci/controller/dwc/pcie-designware.h      |  2 +-
>   drivers/pci/controller/dwc/pcie-qcom.c            |  4 ++--
>   3 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index a17833dd6f9d4b4aa06dc1fe09ffed5e2c28a82f..e7dbdf3670b426783e778be5064def10d2b209b1 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -255,7 +255,7 @@ void dw_pcie_msi_init(struct dw_pcie_rp *pp)
>   	u64 msi_target = (u64)pp->msi_data;
>   	u32 ctrl, num_ctrls;
>   
> -	if (!pci_msi_enabled() || !pp->has_msi_ctrl)
> +	if (!pci_msi_enabled() || !pp->uses_imsi_rx)
>   		return;
>   
>   	num_ctrls = pp->num_vectors / MAX_MSI_IRQS_PER_CTRL;
> @@ -603,15 +603,15 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>   	}
>   
>   	if (pci_msi_enabled()) {
> -		pp->has_msi_ctrl = !(pp->ops->msi_init ||
> +		pp->uses_imsi_rx = !(pp->ops->msi_init ||
>   				     of_property_present(np, "msi-parent") ||
>   				     of_property_present(np, "msi-map"));
>   
>   		/*
> -		 * For the has_msi_ctrl case the default assignment is handled
> +		 * For the uses_imsi_rx case the default assignment is handled
>   		 * in the dw_pcie_msi_host_init().
>   		 */
> -		if (!pp->has_msi_ctrl && !pp->num_vectors) {
> +		if (!pp->uses_imsi_rx && !pp->num_vectors) {
>   			pp->num_vectors = MSI_DEF_NUM_VECTORS;
>   		} else if (pp->num_vectors > MAX_MSI_IRQS) {
>   			dev_err(dev, "Invalid number of vectors\n");
> @@ -623,7 +623,7 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>   			ret = pp->ops->msi_init(pp);
>   			if (ret < 0)
>   				goto err_deinit_host;
> -		} else if (pp->has_msi_ctrl) {
> +		} else if (pp->uses_imsi_rx) {
>   			ret = dw_pcie_msi_host_init(pp);
>   			if (ret < 0)
>   				goto err_deinit_host;
> @@ -701,7 +701,7 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>   	dw_pcie_edma_remove(pci);
>   
>   err_free_msi:
> -	if (pp->has_msi_ctrl)
> +	if (pp->uses_imsi_rx)
>   		dw_pcie_free_msi(pp);
>   
>   err_deinit_host:
> @@ -729,7 +729,7 @@ void dw_pcie_host_deinit(struct dw_pcie_rp *pp)
>   
>   	dw_pcie_edma_remove(pci);
>   
> -	if (pp->has_msi_ctrl)
> +	if (pp->uses_imsi_rx)
>   		dw_pcie_free_msi(pp);
>   
>   	if (pp->ops->deinit)
> @@ -1130,7 +1130,7 @@ int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
>   	 * the MSI and MSI-X capabilities of the Root Port to allow the drivers
>   	 * to fall back to INTx instead.
>   	 */
> -	if (pp->has_msi_ctrl) {
> +	if (pp->uses_imsi_rx) {
>   		dw_pcie_remove_capability(pci, PCI_CAP_ID_MSI);
>   		dw_pcie_remove_capability(pci, PCI_CAP_ID_MSIX);
>   	}
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 53b65428fadb3d905b02bdcc06667065574f4f9d..33154bc89dd3b7d7fbe0ea749ca22bdc8292489c 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -416,7 +416,7 @@ struct dw_pcie_host_ops {
>   };
>   
>   struct dw_pcie_rp {
> -	bool			has_msi_ctrl:1;
> +	bool			uses_imsi_rx:1;
>   	bool			cfg0_io_shared:1;
>   	u64			cfg0_base;
>   	void __iomem		*va_cfg0_base;
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 13e6c334e10d21b9ebfe5f82de0aff3bce6191e3..999f5e083cef4e78b85a0111d2a90c3de65c83b5 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1633,7 +1633,7 @@ static void qcom_pci_free_msi(void *ptr)
>   {
>   	struct dw_pcie_rp *pp = (struct dw_pcie_rp *)ptr;
>   
> -	if (pp && pp->has_msi_ctrl)
> +	if (pp && pp->uses_imsi_rx)
>   		dw_pcie_free_msi(pp);
>   }
>   
> @@ -1657,7 +1657,7 @@ static int qcom_pcie_ecam_host_init(struct pci_config_window *cfg)
>   	if (ret)
>   		return ret;
>   
> -	pp->has_msi_ctrl = true;
> +	pp->uses_imsi_rx = true;
>   	dw_pcie_msi_init(pp);
>   
>   	return devm_add_action_or_reset(dev, qcom_pci_free_msi, pp);
> 


