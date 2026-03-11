Return-Path: <linux-arm-msm+bounces-96869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Hn2Ca0AsWn1pgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:42:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E43BE25C818
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:42:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA27931080B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 05:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4275D32AAAB;
	Wed, 11 Mar 2026 05:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="K7wZRUJk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m1973189.qiye.163.com (mail-m1973189.qiye.163.com [220.197.31.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A361A6812;
	Wed, 11 Mar 2026 05:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773207721; cv=none; b=JD0QdCQd9erUPW0KE0C7qbXMK0qzA3cK2ix6RKtP7zUzg5GURlTGaTr0zqmwi7weBYuyX+/eSXONa3eAHbb+3pBhAedO7FS2XYOe7uhwJ45q7dhmmFeiCmfRwdn5LmB3fx+/xkBn6L54B+BqbPjCuKiuiXun3d8L8GpJLX6ULQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773207721; c=relaxed/simple;
	bh=eZq62JBHkK1Ju69MukNzvda0TQ1C2GpK9Gtc7lrsaiI=;
	h=Cc:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=hdlqHsayzVB6HahnWQ/Hfg3LigYtULzpPLSoZbk1cPb75XuTs/9hK/QlP40xDwSYN8p+ec2cCQgOHz8ThBS6foiV7zflyjWrRVWeCgs1cbU2J5vyuQ4XEfaHYTkufrrzTFJqGmo6Jamnk92p1yH8tEab7LzXrd73+Toh9apt9L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=K7wZRUJk; arc=none smtp.client-ip=220.197.31.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.17] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 36820e818;
	Wed, 11 Mar 2026 13:26:29 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Niklas Cassel <cassel@kernel.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Lukas Wunner <lukas@wunner.de>, Richard Zhu <hongxing.zhu@nxp.com>,
 Brian Norris <briannorris@chromium.org>, Wilson Ding <dingwei@marvell.com>,
 Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v7 1/4] PCI/ERR: Add support for resetting the Root Ports
 in a platform specific way
To: manivannan.sadhasivam@oss.qualcomm.com,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20260310-pci-port-reset-v7-0-9dd00ccc25ab@oss.qualcomm.com>
 <20260310-pci-port-reset-v7-1-9dd00ccc25ab@oss.qualcomm.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <e951b005-d9c9-224b-ed52-23abbccf7212@rock-chips.com>
Date: Wed, 11 Mar 2026 13:26:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260310-pci-port-reset-v7-1-9dd00ccc25ab@oss.qualcomm.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cdb5c5d4d09cckunma929f57d18cd2d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhlDTlZPHxlISE4ZSx8aHUJWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=K7wZRUJk1emUgxCcHil5+9JB/ANF+IxeKRXJYfvQNEB51UFMvURGvaB1+hEuaGfLw6gNqqGdYK7+AzOAJqC3QeulrOvdMdg98utMWmVdILteJwz08dWusEIiUceoqY1rrzpiBbUcuejudxcc0a8Y5GCv3zU3YmURNiNhYMC2e6Q=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=9yG8NQ0gHRExp7u3DqeTqLY+f4Q07ToFiRLsE78NeCU=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Queue-Id: E43BE25C818
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rock-chips.com,none];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,google.com,linux.ibm.com,gmail.com,kernel.org,sntech.de,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96869-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,chromium.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

在 2026/03/10 星期二 22:01, Manivannan Sadhasivam via B4 Relay 写道:
> From: Manivannan Sadhasivam <mani@kernel.org>
> 
> Some host bridge devices require resetting the Root Ports in a platform
> specific way to recover them from error conditions such as Fatal AER
> errors, Link Down etc... So introduce pci_host_bridge::reset_root_port()
> callback and call it from pcibios_reset_secondary_bus() if available. Also,
> save the Root Port config space before reset and restore it afterwards.
> 
> The 'reset_root_port' callback is responsible for resetting the given Root
> Port referenced by the 'pci_dev' pointer in a platform specific way and
> bring it back to the working state if possible. If any error occurs during
> the reset operation, relevant errno should be returned.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Tested-by: Brian Norris <briannorris@chromium.org>
> Tested-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Tested-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>   drivers/pci/pci.c      | 20 ++++++++++++++++++++
>   drivers/pci/pcie/err.c |  5 -----
>   include/linux/pci.h    |  1 +
>   3 files changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 8479c2e1f74f..6f09057d83e0 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -4812,6 +4812,26 @@ void pci_reset_secondary_bus(struct pci_dev *dev)
>   
>   void __weak pcibios_reset_secondary_bus(struct pci_dev *dev)
>   {
> +	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
> +	int ret;
> +
> +	if (pci_is_root_bus(dev->bus) && host->reset_root_port) {
> +		/*
> +		 * Save the config space of the Root Port before doing the
> +		 * reset, since the state could be lost. The Endpoint state
> +		 * should've been saved by the caller.
> +		 */
> +		pci_save_state(dev);
> +		ret = host->reset_root_port(host, dev);
> +		if (ret)
> +			pci_err(dev, "Failed to reset Root Port: %d\n", ret);
> +		else
> +			/* Now restore it on success */
> +			pci_restore_state(dev);
> +
> +		return;
> +	}
> +
>   	pci_reset_secondary_bus(dev);
>   }
>   

LGTM,

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index bebe4bc111d7..13b9d9eb714f 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -256,11 +256,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>   	}
>   
>   	if (status == PCI_ERS_RESULT_NEED_RESET) {
> -		/*
> -		 * TODO: Should call platform-specific
> -		 * functions to reset slot before calling
> -		 * drivers' slot_reset callbacks?
> -		 */
>   		status = PCI_ERS_RESULT_RECOVERED;
>   		pci_dbg(bridge, "broadcast slot_reset message\n");
>   		pci_walk_bridge(bridge, report_slot_reset, &status);
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 1c270f1d5123..34c434b79abb 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -644,6 +644,7 @@ struct pci_host_bridge {
>   	void (*release_fn)(struct pci_host_bridge *);
>   	int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
>   	void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
> +	int (*reset_root_port)(struct pci_host_bridge *bridge, struct pci_dev *dev);
>   	void		*release_data;
>   	unsigned int	ignore_reset_delay:1;	/* For entire hierarchy */
>   	unsigned int	no_ext_tags:1;		/* No Extended Tags */
> 

