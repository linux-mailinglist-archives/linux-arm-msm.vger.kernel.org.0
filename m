Return-Path: <linux-arm-msm+bounces-96856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJzdMeT3sGkRpQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:04:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2465725C2FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:04:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE96530F837E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 05:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C000931F985;
	Wed, 11 Mar 2026 05:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nqL4eVSc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD57EEC0;
	Wed, 11 Mar 2026 05:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773205473; cv=none; b=UUtQszQabVVZ6IjELD6XDv0tpXDsSnzXwr6BP0/KCEsNNNOLluaABkJ9asDqYE9yR6XalV7zELMt9QQTRjFQIoWpi4iFDHMQiiBKoGiD59uVeZ+974dZiuqE0VKeDBDGu7pOn4OhgQp2FH2HhDTgLe1wt2H4Y4XNxQL5PppygmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773205473; c=relaxed/simple;
	bh=fYyP3Zu9FaIM29drE15IUXdeAZe+0BRP7elc4vr6eGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pwYXNdDZi+2bVOcGcyxX+rsaQTp0e1rbH8qaqTm0YqH1bwW2DktqjhmwEX/8TKYN9NneBsv7qjXzuntR2uZ98ZWXuILyIi2qBursat9u0FTLsPlCvuBsvAXpJ9fM/Bg8rqIY4C/jfFE1oe29d6jacqZ/BsYwBY5RNr0dAQp7Wvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nqL4eVSc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB3FC4CEF7;
	Wed, 11 Mar 2026 05:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773205473;
	bh=fYyP3Zu9FaIM29drE15IUXdeAZe+0BRP7elc4vr6eGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nqL4eVSceLQkWZy2agF52UXOujfj7w7KrEuOhM4cOGhKUUw59uYN9x/5NytgiLzOR
	 xyWmn0w8TWKhJQe9w/xoJxPfAi391pPUereu4K3uFM6v04Vy0yAg19kdVdcsk+Uybf
	 M2Rb7gOuGWtqzdzH2HbGgZU1OqH3JIw2AyDnYgJBndJ7Du6iRkyELJwQFdExIOU4Ue
	 Sm1dIkfSaGoEcCsDEFhczs0iyNeXbjA2koRhzqOeqDPtcX7Yl6WJiiPLg+Cqqkp7pf
	 tKgqGLem++ya1KScueLxRfgME5XE5rfWQxjtKpmX42uZbg7S1f/VNDZtR75TxwvL13
	 hssZiohpAg36Q==
Date: Wed, 11 Mar 2026 10:34:17 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Bjorn Helgaas <bhelgaas@google.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Niklas Cassel <cassel@kernel.org>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Lukas Wunner <lukas@wunner.de>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Brian Norris <briannorris@chromium.org>, 
	Wilson Ding <dingwei@marvell.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v7 2/4] PCI: host-common: Add link down handling for Root
 Ports
Message-ID: <vnsmjvtwaeticdxwz6u43dxnpi6duhc3r5motwnfer4l2bpqcm@noeme6lgq4jf>
References: <20260310-pci-port-reset-v7-0-9dd00ccc25ab@oss.qualcomm.com>
 <20260310-pci-port-reset-v7-2-9dd00ccc25ab@oss.qualcomm.com>
 <2eb738fb-9dfe-1e88-6ea7-afdba9cb3d25@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2eb738fb-9dfe-1e88-6ea7-afdba9cb3d25@rock-chips.com>
X-Rspamd-Queue-Id: 2465725C2FC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96856-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,google.com,linux.ibm.com,gmail.com,kernel.org,sntech.de,pengutronix.de,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,wdc.com,wunner.de,nxp.com,chromium.org,marvell.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,chromium.org:email,qualcomm.com:email]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 08:55:01AM +0800, Shawn Lin wrote:
> Hi Mani
> 
> 在 2026/03/10 星期二 22:02, Manivannan Sadhasivam via B4 Relay 写道:
> > From: Manivannan Sadhasivam <mani@kernel.org>
> > 
> > The PCI link, when down, needs to be recovered to bring it back. But on
> > some platforms, that cannot be done in a generic way as link recovery
> > procedure is platform specific. So add a new API
> > pci_host_handle_link_down() that could be called by the host bridge drivers
> > for a specific Root Port when the link goes down.
> > 
> > The API accepts the 'pci_dev' corresponding to the Root Port which observed
> > the link down event. If CONFIG_PCIEAER is enabled, the API calls
> > pcie_do_recovery() function with 'pci_channel_io_frozen' as the state. This
> > will result in the execution of the AER Fatal error handling code. Since
> > the link down recovery is pretty much the same as AER Fatal error handling,
> > pcie_do_recovery() helper is reused here. First, the AER error_detected()
> > callback will be triggered for the bridge and then for the downstream
> > devices. Finally, pci_host_reset_root_port() will be called for the Root
> > Port, which will reset the Root Port using 'reset_root_port' callback to
> > recover the link. Once that's done, resume message will be broadcasted to
> > the bridge and the downstream devices, indicating successful link recovery.
> > 
> > But if CONFIG_PCIEAER is not enabled in the kernel, only
> > pci_host_reset_root_port() API will be called, which will in turn call
> > pci_bus_error_reset() to just reset the Root Port as there is no way we
> > could inform the drivers about link recovery.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > Tested-by: Brian Norris <briannorris@chromium.org>
> > Tested-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > Tested-by: Richard Zhu <hongxing.zhu@nxp.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >   drivers/pci/controller/pci-host-common.c | 35 ++++++++++++++++++++++++++++++++
> >   drivers/pci/controller/pci-host-common.h |  1 +
> >   drivers/pci/pci.c                        |  1 +
> >   drivers/pci/pcie/err.c                   |  1 +
> >   4 files changed, 38 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
> > index d6258c1cffe5..15ebff8a542a 100644
> > --- a/drivers/pci/controller/pci-host-common.c
> > +++ b/drivers/pci/controller/pci-host-common.c
> > @@ -12,9 +12,11 @@
> >   #include <linux/of.h>
> >   #include <linux/of_address.h>
> >   #include <linux/of_pci.h>
> > +#include <linux/pci.h>
> >   #include <linux/pci-ecam.h>
> >   #include <linux/platform_device.h>
> > +#include "../pci.h"
> >   #include "pci-host-common.h"
> >   static void gen_pci_unmap_cfg(void *ptr)
> > @@ -106,5 +108,38 @@ void pci_host_common_remove(struct platform_device *pdev)
> >   }
> >   EXPORT_SYMBOL_GPL(pci_host_common_remove);
> > +static pci_ers_result_t pci_host_reset_root_port(struct pci_dev *dev)
> > +{
> > +	int ret;
> > +
> > +	pci_lock_rescan_remove();
> > +	ret = pci_bus_error_reset(dev);
> > +	pci_unlock_rescan_remove();
> > +	if (ret) {
> > +		pci_err(dev, "Failed to reset Root Port: %d\n", ret);
> > +		return PCI_ERS_RESULT_DISCONNECT;
> > +	}
> > +
> > +	pci_info(dev, "Root Port has been reset\n");
> > +
> > +	return PCI_ERS_RESULT_RECOVERED;
> > +}
> > +
> > +static void pci_host_recover_root_port(struct pci_dev *port)
> > +{
> > +#if IS_ENABLED(CONFIG_PCIEAER)
> > +	pcie_do_recovery(port, pci_channel_io_frozen, pci_host_reset_root_port);
> > +#else
> > +	pci_host_reset_root_port(port);
> 
> Since pci_host_reset_root_port() returns pci_ers_result_t, shouldn't we
> check the result? If the return value is intentionally ignored here,
> maybe pci_host_reset_root_port actually doesn't need a return value at
> all?
> 

The return value is mostly for pcie_do_recovery() which iterates through the
subordinate devices and calls pci_host_reset_root_port(). It also makes use of
the return value, so we cannot make it void.

The reason why I skipped the return value in pci_host_handle_link_down() is
that, we canot do much in the case of failure other than reporting the failure,
which is already taken care in pci_host_reset_root_port().

> > +#endif
> > +}
> > +
> > +void pci_host_handle_link_down(struct pci_dev *port)
> > +{
> > +	pci_info(port, "Recovering Root Port due to Link Down\n");
> > +	pci_host_recover_root_port(port);
> > +}
> > +EXPORT_SYMBOL_GPL(pci_host_handle_link_down);
> 
> This function shouldn't be called like in interrupt context because of
> the pci_lock_rescan_remove() and pci_bus_error_reset()::pci_slot_mutex,
> but it's not so obvious from the API name. It's prone for host drivers
> to use it like:
> 
> register_LDn_irq -> irq isr -> pci_host_handle_link_down()
> 
> So perhaps add a comment about it would be better.
> 

Yes, I agree. I mentioned in the cover letter that this API should be called
from a threaded IRQ handler, but it should be mentioned in the API description
too. I will add it in next version or ammend it while applying.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

