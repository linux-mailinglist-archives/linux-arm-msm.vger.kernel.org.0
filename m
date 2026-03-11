Return-Path: <linux-arm-msm+bounces-96792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qA9VAqm+sGm4mgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:00:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C23525A345
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8FAE630266CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 01:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE18293C4E;
	Wed, 11 Mar 2026 01:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="kfOdNE3E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m49216.qiye.163.com (mail-m49216.qiye.163.com [45.254.49.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B440A2139C9;
	Wed, 11 Mar 2026 01:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773190822; cv=none; b=IEnWe8oahQ9v1JIgFJKRTcS89pF4GZOfW96GkC70+8UOoMQ4+W227+mxXLGGDhB9U5j8BnGwrWN+16JIX6wP1HiaYCcV9UPEIpvURdYfVWKz5Q0ZLyvj3G9O0KmtBJSm9T4nE1Wrwh2nVjmpQOywK/rQhgVX6geMVU+3WbXgm6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773190822; c=relaxed/simple;
	bh=JKTDI1fN3PMrg/qe6GDVjHqc6yJ9nZIlmej/e/ee6b4=;
	h=Cc:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=LQWHpjuWaT0OpVdPNNMZ3pirMP3EKm8z4gB1BignEYC3hDWihhTerecwvFiZtjOIpEchc6q5lwmIfyRqqdavRlWRPGsjkDVyuAw8GLssF3z8naxe5oAiteuph/6Ag8l2uHo/RJQQhPVoYYKZfNas6sp6b1bgfMfPTpqdQ+nAgB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=kfOdNE3E; arc=none smtp.client-ip=45.254.49.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.17] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3678c56ad;
	Wed, 11 Mar 2026 08:55:03 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Niklas Cassel <cassel@kernel.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Lukas Wunner <lukas@wunner.de>, Richard Zhu <hongxing.zhu@nxp.com>,
 Brian Norris <briannorris@chromium.org>, Wilson Ding <dingwei@marvell.com>,
 Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v7 2/4] PCI: host-common: Add link down handling for Root
 Ports
To: manivannan.sadhasivam@oss.qualcomm.com,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20260310-pci-port-reset-v7-0-9dd00ccc25ab@oss.qualcomm.com>
 <20260310-pci-port-reset-v7-2-9dd00ccc25ab@oss.qualcomm.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <2eb738fb-9dfe-1e88-6ea7-afdba9cb3d25@rock-chips.com>
Date: Wed, 11 Mar 2026 08:55:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260310-pci-port-reset-v7-2-9dd00ccc25ab@oss.qualcomm.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cda63dc8f09cckunm38bfaea514eddb
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk4YGFZCS05KHUxLHRpNTUpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=kfOdNE3EOKnXsygqxi9846fL4/tfGrHHufMHhcZSqW9MTTTIqCuBGUX/zVyg7ioK37rllmhlXiocSZLOPtud5LXKachckvyWn7BGwp1H4lKUNHYY9AmWdtLUnJIF0u/fdulWGnBK2eSSI2LJdbit7/Qw5WUqh7Vhb7SNeSLBpJ4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=sd2Fc6FSnG2d3pMTg14GqePnOxYc9BQqdVSkTf9LTHs=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Queue-Id: 2C23525A345
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rock-chips.com,none];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,google.com,linux.ibm.com,gmail.com,kernel.org,sntech.de,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96792-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:email,rock-chips.com:dkim,rock-chips.com:mid]
X-Rspamd-Action: no action

Hi Mani

在 2026/03/10 星期二 22:02, Manivannan Sadhasivam via B4 Relay 写道:
> From: Manivannan Sadhasivam <mani@kernel.org>
> 
> The PCI link, when down, needs to be recovered to bring it back. But on
> some platforms, that cannot be done in a generic way as link recovery
> procedure is platform specific. So add a new API
> pci_host_handle_link_down() that could be called by the host bridge drivers
> for a specific Root Port when the link goes down.
> 
> The API accepts the 'pci_dev' corresponding to the Root Port which observed
> the link down event. If CONFIG_PCIEAER is enabled, the API calls
> pcie_do_recovery() function with 'pci_channel_io_frozen' as the state. This
> will result in the execution of the AER Fatal error handling code. Since
> the link down recovery is pretty much the same as AER Fatal error handling,
> pcie_do_recovery() helper is reused here. First, the AER error_detected()
> callback will be triggered for the bridge and then for the downstream
> devices. Finally, pci_host_reset_root_port() will be called for the Root
> Port, which will reset the Root Port using 'reset_root_port' callback to
> recover the link. Once that's done, resume message will be broadcasted to
> the bridge and the downstream devices, indicating successful link recovery.
> 
> But if CONFIG_PCIEAER is not enabled in the kernel, only
> pci_host_reset_root_port() API will be called, which will in turn call
> pci_bus_error_reset() to just reset the Root Port as there is no way we
> could inform the drivers about link recovery.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Tested-by: Brian Norris <briannorris@chromium.org>
> Tested-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Tested-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>   drivers/pci/controller/pci-host-common.c | 35 ++++++++++++++++++++++++++++++++
>   drivers/pci/controller/pci-host-common.h |  1 +
>   drivers/pci/pci.c                        |  1 +
>   drivers/pci/pcie/err.c                   |  1 +
>   4 files changed, 38 insertions(+)
> 
> diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
> index d6258c1cffe5..15ebff8a542a 100644
> --- a/drivers/pci/controller/pci-host-common.c
> +++ b/drivers/pci/controller/pci-host-common.c
> @@ -12,9 +12,11 @@
>   #include <linux/of.h>
>   #include <linux/of_address.h>
>   #include <linux/of_pci.h>
> +#include <linux/pci.h>
>   #include <linux/pci-ecam.h>
>   #include <linux/platform_device.h>
>   
> +#include "../pci.h"
>   #include "pci-host-common.h"
>   
>   static void gen_pci_unmap_cfg(void *ptr)
> @@ -106,5 +108,38 @@ void pci_host_common_remove(struct platform_device *pdev)
>   }
>   EXPORT_SYMBOL_GPL(pci_host_common_remove);
>   
> +static pci_ers_result_t pci_host_reset_root_port(struct pci_dev *dev)
> +{
> +	int ret;
> +
> +	pci_lock_rescan_remove();
> +	ret = pci_bus_error_reset(dev);
> +	pci_unlock_rescan_remove();
> +	if (ret) {
> +		pci_err(dev, "Failed to reset Root Port: %d\n", ret);
> +		return PCI_ERS_RESULT_DISCONNECT;
> +	}
> +
> +	pci_info(dev, "Root Port has been reset\n");
> +
> +	return PCI_ERS_RESULT_RECOVERED;
> +}
> +
> +static void pci_host_recover_root_port(struct pci_dev *port)
> +{
> +#if IS_ENABLED(CONFIG_PCIEAER)
> +	pcie_do_recovery(port, pci_channel_io_frozen, pci_host_reset_root_port);
> +#else
> +	pci_host_reset_root_port(port);

Since pci_host_reset_root_port() returns pci_ers_result_t, shouldn't we 
check the result? If the return value is intentionally ignored here,
maybe pci_host_reset_root_port actually doesn't need a return value at
all?

> +#endif
> +}
> +
> +void pci_host_handle_link_down(struct pci_dev *port)
> +{
> +	pci_info(port, "Recovering Root Port due to Link Down\n");
> +	pci_host_recover_root_port(port);
> +}
> +EXPORT_SYMBOL_GPL(pci_host_handle_link_down);

This function shouldn't be called like in interrupt context because of
the pci_lock_rescan_remove() and pci_bus_error_reset()::pci_slot_mutex,
but it's not so obvious from the API name. It's prone for host drivers
to use it like:

register_LDn_irq -> irq isr -> pci_host_handle_link_down()

So perhaps add a comment about it would be better.

> +
>   MODULE_DESCRIPTION("Common library for PCI host controller drivers");
>   MODULE_LICENSE("GPL v2");
> diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
> index b5075d4bd7eb..dd12dd1a1b23 100644
> --- a/drivers/pci/controller/pci-host-common.h
> +++ b/drivers/pci/controller/pci-host-common.h
> @@ -17,6 +17,7 @@ int pci_host_common_init(struct platform_device *pdev,
>   			 struct pci_host_bridge *bridge,
>   			 const struct pci_ecam_ops *ops);
>   void pci_host_common_remove(struct platform_device *pdev);
> +void pci_host_handle_link_down(struct pci_dev *port);
>   
>   struct pci_config_window *pci_host_common_ecam_create(struct device *dev,
>   	struct pci_host_bridge *bridge, const struct pci_ecam_ops *ops);
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 6f09057d83e0..1b37bfe6d079 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -5650,6 +5650,7 @@ int pci_bus_error_reset(struct pci_dev *bridge)
>   	mutex_unlock(&pci_slot_mutex);
>   	return pci_bus_reset(bridge->subordinate, PCI_RESET_DO_RESET);
>   }
> +EXPORT_SYMBOL_GPL(pci_bus_error_reset);
>   
>   /**
>    * pci_probe_reset_bus - probe whether a PCI bus can be reset
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index 13b9d9eb714f..d77403d8855b 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -292,3 +292,4 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>   
>   	return status;
>   }
> +EXPORT_SYMBOL_GPL(pcie_do_recovery);
> 

