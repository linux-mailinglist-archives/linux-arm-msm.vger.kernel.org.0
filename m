Return-Path: <linux-arm-msm+bounces-93766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KILJ1qenGmyJgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:37:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2622417B982
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:37:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 421703120393
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 18:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C02F366DB2;
	Mon, 23 Feb 2026 18:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="SZ5I+XzO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m8255.xmail.ntesmail.com (mail-m8255.xmail.ntesmail.com [156.224.82.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760AB31A7F6;
	Mon, 23 Feb 2026 18:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.224.82.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771871604; cv=none; b=o8biD3TmSwOV3VoTpNbOj9rAPpAbI2jcek7FF5Ulxsbbi3SrGAlckeN+Y+uPvGPlSDCDNcFJRwWtKEqCh4h5/887fFKtgtnFca87cULsUb5/v6T51p67g+QwfNWbcvuBi1idrHK9b55dARji/cYenJ5MQMbbemf9fBM4P5lcyQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771871604; c=relaxed/simple;
	bh=5uEGHGgIhfEXC3hAJ6HJNKX2hEnyoWEhmBZoOQ+H6Bw=;
	h=Cc:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Aao5NmpGgKOcEmPovFaHpu1XlGHyma4yuzVv5dRkqyu4aB1FGkGyc2rdsDEI0a22yGmi8Jx1cMgapRn5U+c9ZNTg+h7y7FjsnyUig+l9/eLV6XxNwjRtVi5bm5nG3VPBsNBIgxi4y9BbwRR/71Xc6LAi651GZK9C9lLd+av1hto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=SZ5I+XzO; arc=none smtp.client-ip=156.224.82.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 34b1f7ddc;
	Mon, 23 Feb 2026 21:57:13 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, linux-pci@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
 Manivannan Sadhasivam <mani@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: Re: [PATCH v2 3/3] PCI: qcom: Program T_POWER_ON
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
References: <20260223-t_power_on_fux-v2-0-20c921262709@oss.qualcomm.com>
 <20260223-t_power_on_fux-v2-3-20c921262709@oss.qualcomm.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <85631e65-6328-3154-67a9-cc1b5ae8183e@rock-chips.com>
Date: Mon, 23 Feb 2026 21:57:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260223-t_power_on_fux-v2-3-20c921262709@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c8aca34c709cckunmdf98552e97fbc8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQklNTFYfSRpPSEoYTkMZSktWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=SZ5I+XzOQiw25JRycw+G43RuMAQ+1RWtoG65LcESRkLjG/PiXXyNRkNqAkDLopv7NJ7MPHO2P6BYHeFCpKvbhyOrR5HkGqLkP2QYZvjUNXTpddVtZ+bqg+/cCuNc+uFojH2UZVyL6Kic1E5w1zXOJ24MICpjxRZLClntG1exJ34=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=w0R6TmAzkowlIBvQ5OXp4sHjKGLma/nnPd9O00qSoS8=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rock-chips.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93766-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[rock-chips.com,vger.kernel.org,oss.qualcomm.com,quicinc.com,kernel.org,google.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shawn.lin@rock-chips.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[rock-chips.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2622417B982
X-Rspamd-Action: no action

Hi Krishna,

在 2026/02/23 星期一 19:13, Krishna Chaitanya Chundru 写道:
> Some platforms have incorrect T_POWER_ON value programmed in hardware.
> Generally these will be corrected by bootloaders, but not all targets
> support bootloaders to program correct values due to that
> LTR_L1.2_THRESHOLD value calculated by aspm driver can be wrong, which
> can result in improper L1.2 exit behavior and can trigger AER's.
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
>   drivers/pci/controller/dwc/pcie-qcom.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 67a16af69ddc75fca1b123e70715e692a91a9135..489ed64c1df0fa3ed9f6b0d4c3e0bb65cfc3308e 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -269,6 +269,7 @@ struct qcom_pcie_perst {
>   struct qcom_pcie_port {
>   	struct list_head list;
>   	struct phy *phy;
> +	u32 t_power_on;
>   	struct list_head perst;
>   };
>   
> @@ -1283,6 +1284,16 @@ static int qcom_pcie_phy_power_on(struct qcom_pcie *pcie)
>   	return 0;
>   }
>   
> +static int qcom_pcie_configure_ports(struct qcom_pcie *pcie)
> +{
> +	struct qcom_pcie_port *port;
> +
> +	list_for_each_entry(port, &pcie->ports, list)
> +		dw_pcie_program_t_power_on(pcie->pci, port->t_power_on);
> +
> +	return 0;
> +}
> +
>   static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>   {
>   	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> @@ -1317,6 +1328,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>   	dw_pcie_remove_capability(pcie->pci, PCI_CAP_ID_MSIX);
>   	dw_pcie_remove_ext_capability(pcie->pci, PCI_EXT_CAP_ID_DPC);
>   
> +	qcom_pcie_configure_ports(pcie);
> +
>   	qcom_pcie_perst_deassert(pcie);
>   
>   	if (pcie->cfg->ops->config_sid) {
> @@ -1759,6 +1772,8 @@ static int qcom_pcie_parse_port(struct qcom_pcie *pcie, struct device_node *node
>   	if (ret)
>   		return ret;
>   
> +	of_property_read_u32(node, "t-power-on-us", &port->t_power_on);

Your patch 2 adds a common helper in pcie-designware, but why not add
this parse as well as what the qcom_pcie_configure_ports() does, into to
the pcie-designware core, etc dw_pcie_host_init()/dw_pcie_ep_init()?
Because I don't see anything qcom specific here.


> +
>   	port->phy = phy;
>   	INIT_LIST_HEAD(&port->list);
>   	list_add_tail(&port->list, &pcie->ports);
> 

