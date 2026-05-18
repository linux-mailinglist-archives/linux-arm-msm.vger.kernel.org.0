Return-Path: <linux-arm-msm+bounces-108087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Kt6DGyxCmpx5wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 08:27:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF21E566AD9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 08:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7AA0E3056970
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 06:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D253DE42A;
	Mon, 18 May 2026 06:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+kE7lok"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7948F3DEAFB;
	Mon, 18 May 2026 06:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779085335; cv=none; b=BVuGDrd1n/UjxhO8jvpizdlwIcCdVBJCIP2M0XmNIqsX7M0DMiRyY6vuAvMnBtE85NZoohKfaNkub1uxsyS0ZFvAE3LnVxDeN7/6oosRd1y7YixeRz9eP52h0YBfWJC6sZWIlrpbGToTRAazGx0Gbbh4mUa/GJJ22VVGfY5LLWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779085335; c=relaxed/simple;
	bh=zkFDJF7fz51FV37iDY2VAna6p1X471J7zJme82WLsjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n1Vrs8IFQUHV/p5C/Qa0s8FVDpC3r/fT+ZS6SU0Nin6OOAzSTNTIyoIR9m7rNji4qJ7u8a8cgydTn3sUTTRp1lhzrQpTq40EQmIGptgMnCdsnTJHqDwtiwwJmAc3kjSjmTFlAO25WNWLNJTxFgV/qStPujboqRBVjskijPNxCro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+kE7lok; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A01CC2BCB7;
	Mon, 18 May 2026 06:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779085332;
	bh=zkFDJF7fz51FV37iDY2VAna6p1X471J7zJme82WLsjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S+kE7lokwNjnm9hvlBCtnLv445qG+GCXIVjLfHmeChC4oyGZnd/ILC768x1ScWGb7
	 GvnjSzMy7vYc5k+AqXhnZcQ4h9c7m3vrO9MBM/QOqMv6dXuiUlmFvip/GX+7jnfw7T
	 OohmcKlf7aH+0dKHk5EY0JoQSb1OrL7wyVYnq/Dmp4d8+52y5HJK0DX+7VpqX13DR5
	 EXSDqXNCb97kCJBHm7KOsbaUAniKBxvLmrtOjkAjsuUMFcKKPxY3LQYs9XqfJaJe8d
	 A1t65qfPm/zHB2RUDbCOeYniRrnfabTDQRI7AE8OEWqId1Fb5l9+IgOMefKbErftE2
	 0f6l7jrFmYABw==
Date: Mon, 18 May 2026 11:51:56 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Bjorn Helgaas <bhelgaas@google.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Lukas Wunner <lukas@wunner.de>, Richard Zhu <hongxing.zhu@nxp.com>, 
	Brian Norris <briannorris@chromium.org>, Wilson Ding <dingwei@marvell.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v7 0/4] PCI: Add support for resetting the Root Ports in
 a platform specific way
Message-ID: <tgsh3cum6qxrqjzbdeqjsp6bf7cqedj7il77hww3oxecadndin@idjnwib7cz4z>
References: <20260310-pci-port-reset-v7-0-9dd00ccc25ab@oss.qualcomm.com>
 <abFMa6DCGGLUHddA@fedora>
 <dp2rem4gj7zhfgykvekmcrhq4ticm6m6ido6tbgflwzfcuuwkl@4wuxgle27eyx>
 <srdn3bspgwff7f7tnst7wzg4us4buifrv7o3ylo527hmuciyl3@6ioyrl6rfhaz>
 <abk3rU2EDKjkefUD@ryzen>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abk3rU2EDKjkefUD@ryzen>
X-Rspamd-Queue-Id: CF21E566AD9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108087-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,google.com,linux.ibm.com,gmail.com,kernel.org,sntech.de,pengutronix.de,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,wdc.com,wunner.de,nxp.com,chromium.org,marvell.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, Mar 17, 2026 at 12:16:47PM +0100, Niklas Cassel wrote:
> On Wed, Mar 11, 2026 at 08:44:15PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Mar 11, 2026 at 08:09:53PM +0530, Manivannan Sadhasivam wrote:
> > > On Wed, Mar 11, 2026 at 12:05:15PM +0100, Niklas Cassel wrote:
> > > > On Tue, Mar 10, 2026 at 07:31:58PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > > > > Changes in v7:
> > > > > - Dropped Rockchip Root port reset patch due to reported issues. But the series
> > > > >   works on other platforms as tested by others.
> > > > 
> > > > Are you referring to
> > > > 
> > > > ## On EP side:
> > > > # echo 0 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start && \
> > > >   sleep 0.1 && echo 1 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start
> > > > 
> > > > Then running pcitest only having 7 / 16 tests passed ?
> > > > 
> > > > If so, isn't that a problem also for qcom?
> > > > 
> > > 
> > > No, tests are passing on my setup after link up.
> > > 
> > > > 
> > > > There is no chance that the patch:
> > > > "misc: pci_endpoint_test: Add AER error handlers"
> > > > improves things in this regard?
> > > > 
> > > > Or will it simply avoid the "AER: device recovery failed" print?
> > > > 
> > > 
> > > Yes, as mentioned in the commit message, it just avoids the AER recovery failure
> > > message.
> > > 
> > 
> > I also realized that Endpoint state is not saved in all the code paths. So the
> > pci_endpoint_test driver has to save/restore the state also. But it is still not
> > clear why that didn't help you.
> > 
> > Can you share the snapshot of the entire config space before and after reset
> > using 'lspci -xxxx -s "0000:01:00"'?
> 
> If I don't add something like:
> 
> diff --git a/drivers/misc/pci_endpoint_test.c b/drivers/misc/pci_endpoint_test.c
> index 1eced7a419eb..9d7ee39164d4 100644
> --- a/drivers/misc/pci_endpoint_test.c
> +++ b/drivers/misc/pci_endpoint_test.c
> @@ -1059,6 +1059,9 @@ static int pci_endpoint_test_set_irq(struct pci_endpoint_test *test,
>                 return ret;
>         }
>  
> +       pr_info("saving PCI state (irq_type: %d)\n", req_irq_type);
> +       pci_save_state(pdev);
> +
>         return 0;
>  }
>  
> @@ -1453,6 +1456,7 @@ static pci_ers_result_t pci_endpoint_test_error_detected(struct pci_dev *pdev,
>  
>  static pci_ers_result_t pci_endpoint_test_slot_reset(struct pci_dev *pdev)
>  {
> +       pci_restore_state(pdev);
>         return PCI_ERS_RESULT_RECOVERED;
>  }
> 
> On top of your patch.
> 
> Then all the BAR tests + MSI and MSI-X tests fail.
> 
> There is a huge difference in lspci -vvv output (as I guess is expected),
> including all BARs being marked as disabled.
> 
> 
> With the patch above. There is zero difference before/after reset, and all
> the BAR tests pass. However, MSI/MSI-X tests still fail with:
> 
> # pci_endpoint_test.c:143:MSI_TEST:Expected 0 (0) == ret (-110) 
> # pci_endpoint_test.c:143:MSI_TEST:Test failed for MSI1
> 
> ETIMEDOUT.
> 
> This suggests that pci_endpoint_test on the host side did not receive an
> interrupt.
> 
> I don't know why, but considering that lspci output is now (with the
> save+restore) identical, I assume that the problem is not related to
> the host. Unless somehow the host will use a new/different MSI address
> after the root port has been reset, and we restore the old MSI address,
> but looking at the code, dw_pcie_msi_init() is called by
> dw_pcie_setup_rc(), so I would expect the MSI address to be the same.
> 

Hi Niklas,

When I rebased this series on top of v7.1-rc1, I ended up seeing the issue what
you described here (not sure why I didn't see it earlier). So after the Root
Port reset, MSI tests fail, but BAR tests succeed. Also, I got IOMMU faults on
the host after endpoint triggers MSI.

I investigated it and found that the MSI iATU mapping gets cleared in hw after
LDn happens. But the host continues to use the same address/size for the
endpoint MSI even after reset. Due to this, the existing checks in
dw_pcie_ep_raise_msi_irq() don't pass and the stale MSI iATU mapping gets
reused.

The fix would be to clear the mapping in dw_pcie_ep_cleanup(), which gets called
as part of the PERST# assert/deassert sequence post LDn and also set
msi_iatu_mapped flag to 'false'. This will force dw_pcie_ep_raise_msi_irq() to
use fresh iATU mapping when it gets called for the first time:

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index d4dc3b24da60..4ae0e1b55f39 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -1035,6 +1035,11 @@ void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
 {
        struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 
+       if (ep->msi_iatu_mapped) {
+               dw_pcie_ep_unmap_addr(ep->epc, 0, 0, ep->msi_mem_phys);
+               ep->msi_iatu_mapped = false;
+       }
+
        dwc_pcie_debugfs_deinit(pci);
        dw_pcie_edma_remove(pci);
 }

With this change, MSI works after Root Port reset without any issues on our Qcom
endpoint/host setup.

Please test this change on your rockchip setup as well. You have to make sure
that dw_pcie_ep_cleanup() is called during PERST# assert/deassert.

I'm going to respin the series with this fix. If you confirm it works for you,
then we can merge your Rockchip Root Port change.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

