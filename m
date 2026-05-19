Return-Path: <linux-arm-msm+bounces-108579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UA08AiucDGq8jwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 19:21:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D223582F6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 19:21:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6259C300D754
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8DC63DB31D;
	Tue, 19 May 2026 17:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XbBBzI6B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857073DB33A;
	Tue, 19 May 2026 17:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779211199; cv=none; b=id0zaNGTNPi7Ty9tGUoUMhee6ncN6jy/+gOhJJ3RPiRZexZXT7XzH6ekiFJk9wsqDIh/6N4R46CMprTef6lwz6Eo/vKS2/xrf/vLNWaG6PgUnSpmZCitbzcICREWbXGQV31r0X3YhS54yndPdt1id+4H5EkzE+KBN4h2Z8mvTPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779211199; c=relaxed/simple;
	bh=PcQgZeciD6zTFbc/Al2Qw1LpZV+52E8Gj2OSIzC9Qss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tzTW7HLDSqriiWWKPtWUhuT5dxbDUf3/DHp9RTNSK0ZPvMxp+HjYiNmy5U8vqAeVwNeXz3SQG7z/Ih67jE2aJjqvJV/4RALWKCjE6KqlI/k5KdUVxShuzs9NnZrv4zFZQfhLGO/aznt9rrn2kuuTkAh/wnluUwD/zs/wJ0RGXas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XbBBzI6B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE02BC2BCB3;
	Tue, 19 May 2026 17:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779211198;
	bh=PcQgZeciD6zTFbc/Al2Qw1LpZV+52E8Gj2OSIzC9Qss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XbBBzI6BMmc2qi3CO/PJ03L/0BLjVUWyHeawfD9cL5/Zzfr6WScpP28XVy2zTPt2a
	 ljZxJD6N9ASkopYjKp67ifLM3nvk+x3bNgJjQ3DEk+H1XdQoY5pVyxFITJh/YqBggM
	 /7KGybNccUvfeB0gUVw/ZKhWVoQwjtBHNrtclXL7HSsCBMRekKdsE56dzcCpTohR21
	 p+DQfqk6jZLV2LDjGtesHbn1XRL0vzBGFqNoE6wXGIwVw8slCzZUQsO1BZgApb5mii
	 Cb0kl7/79jR/btL5zrqnIi3y47jE3yZzzRC0fdAju6hYf6U5Zf98CCl3/IBjZZJ0ex
	 NqYjdckOwMG0w==
Date: Tue, 19 May 2026 19:19:51 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Lukas Wunner <lukas@wunner.de>, Richard Zhu <hongxing.zhu@nxp.com>,
	Brian Norris <briannorris@chromium.org>,
	Wilson Ding <dingwei@marvell.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v7 0/4] PCI: Add support for resetting the Root Ports in
 a platform specific way
Message-ID: <agybt3onTAJO2Dl9@ryzen>
References: <20260310-pci-port-reset-v7-0-9dd00ccc25ab@oss.qualcomm.com>
 <abFMa6DCGGLUHddA@fedora>
 <dp2rem4gj7zhfgykvekmcrhq4ticm6m6ido6tbgflwzfcuuwkl@4wuxgle27eyx>
 <srdn3bspgwff7f7tnst7wzg4us4buifrv7o3ylo527hmuciyl3@6ioyrl6rfhaz>
 <abk3rU2EDKjkefUD@ryzen>
 <tgsh3cum6qxrqjzbdeqjsp6bf7cqedj7il77hww3oxecadndin@idjnwib7cz4z>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tgsh3cum6qxrqjzbdeqjsp6bf7cqedj7il77hww3oxecadndin@idjnwib7cz4z>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108579-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,google.com,linux.ibm.com,gmail.com,kernel.org,sntech.de,pengutronix.de,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,wdc.com,wunner.de,nxp.com,chromium.org,marvell.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0D223582F6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Mani,

On Mon, May 18, 2026 at 11:51:56AM +0530, Manivannan Sadhasivam wrote:
> > 
> > With the patch above. There is zero difference before/after reset, and all
> > the BAR tests pass. However, MSI/MSI-X tests still fail with:
> > 
> > # pci_endpoint_test.c:143:MSI_TEST:Expected 0 (0) == ret (-110) 
> > # pci_endpoint_test.c:143:MSI_TEST:Test failed for MSI1
> > 
> > ETIMEDOUT.
> > 
> > This suggests that pci_endpoint_test on the host side did not receive an
> > interrupt.
> > 
> > I don't know why, but considering that lspci output is now (with the
> > save+restore) identical, I assume that the problem is not related to
> > the host. Unless somehow the host will use a new/different MSI address
> > after the root port has been reset, and we restore the old MSI address,
> > but looking at the code, dw_pcie_msi_init() is called by
> > dw_pcie_setup_rc(), so I would expect the MSI address to be the same.
> > 
> 
> Hi Niklas,
> 
> When I rebased this series on top of v7.1-rc1, I ended up seeing the issue what
> you described here (not sure why I didn't see it earlier). So after the Root
> Port reset, MSI tests fail, but BAR tests succeed. Also, I got IOMMU faults on
> the host after endpoint triggers MSI.
> 
> I investigated it and found that the MSI iATU mapping gets cleared in hw after
> LDn happens. But the host continues to use the same address/size for the
> endpoint MSI even after reset. Due to this, the existing checks in
> dw_pcie_ep_raise_msi_irq() don't pass and the stale MSI iATU mapping gets
> reused.
> 
> The fix would be to clear the mapping in dw_pcie_ep_cleanup(), which gets called
> as part of the PERST# assert/deassert sequence post LDn and also set
> msi_iatu_mapped flag to 'false'. This will force dw_pcie_ep_raise_msi_irq() to
> use fresh iATU mapping when it gets called for the first time:
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index d4dc3b24da60..4ae0e1b55f39 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -1035,6 +1035,11 @@ void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
>  {
>         struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  
> +       if (ep->msi_iatu_mapped) {
> +               dw_pcie_ep_unmap_addr(ep->epc, 0, 0, ep->msi_mem_phys);
> +               ep->msi_iatu_mapped = false;
> +       }
> +
>         dwc_pcie_debugfs_deinit(pci);
>         dw_pcie_edma_remove(pci);
>  }
> 
> With this change, MSI works after Root Port reset without any issues on our Qcom
> endpoint/host setup.
> 
> Please test this change on your rockchip setup as well. You have to make sure
> that dw_pcie_ep_cleanup() is called during PERST# assert/deassert.
> 
> I'm going to respin the series with this fix. If you confirm it works for you,
> then we can merge your Rockchip Root Port change.

I am happy to hear that you managed to find the root cause!

Hopefully your series can finally move forward :)

While e.g. RK3588 does have a PERST# input GPIO, so it could theoretically
add a perst_deassert()/assert() function. However, when the EPC support was
added, you did not want that, since I remember that you said that you only
wanted that for drivers that required an external refclock.

Thus, for drivers that do not require an external refclock, should we
perhaps add your suggested code in dw_pcie_ep_linkdown()?

E.g. pcie-tegra194.c does not call dw_pcie_ep_linkdown(), so I'm not
sure if we can simply move it from dw_pcie_ep_cleanup() to
dw_pcie_ep_linkdown() either...

Perhaps we need the code in both functions?

(pcie-qcom-ep.c seems to be the only function that will call both
dw_pcie_ep_linkdown() and dw_pcie_ep_cleanup().)


Kind regards,
Niklas

