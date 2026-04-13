Return-Path: <linux-arm-msm+bounces-102982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cE+LCoMb3WkJaAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 18:36:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E08523EF5A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 18:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 81CDB301976F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 16:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5B8B310645;
	Mon, 13 Apr 2026 16:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lk8ymw3M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3454F313E10;
	Mon, 13 Apr 2026 16:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776098145; cv=none; b=nrPPZfj+KMkjWfe+sKgVDOW+mpHzcVMid+iVZjpPJ1Ft3NHDDbXDLlmJZy5eE+Sm+7DcLaorCFU0EqvJ9ySX/NFtIxLuHA+1Du7H8+w5uoUK31ftuI/mCPO63IlUkH4W+y72XJLFGIfkDf5+zbMw7j30ocQ2esqgYlOQ9OctUtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776098145; c=relaxed/simple;
	bh=YZ23nMQ/ay3QztACjeZpwAsTDk5SE/Lr+pB3V6c9Mqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0tUb9bTfX+hf5evk+GGQn5HiUhR2anE8myhHcHpWh6zAmUaDztL95tQasacp+ltnriXp5MywvXvVh7xtZNxsCIzKYS1jkkQwc8n3SlNlW+Rsf2RfkOGzBjQjDrGDDVorxy8Cw9DwDRrDYsAmeCblOVzk2qyESpchoyfUfwWb+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lk8ymw3M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49FBCC2BCB3;
	Mon, 13 Apr 2026 16:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776098145;
	bh=YZ23nMQ/ay3QztACjeZpwAsTDk5SE/Lr+pB3V6c9Mqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lk8ymw3MMZG/o+y7+yEs9+SRa2wM7p+rrtsT8WBnSf4v+gl6sXbHWOTbbi/XV3xC4
	 Pn5g7XBWkIkq8K23OKBe16ohjIMDDnUIoslb4p0kQC3a9ulPP1tSHjaCLOf54uD2oZ
	 G7ui53icbdw2iggotHL0Vy9VNgLSVMib1U3kiMTN0uW2+GElkpA8ikUiE8h0XLfNE9
	 ImA9l7/Am6GKhLrhIsYsx1CFPePcxFQ9wp4T8PUnxtM3gUcwJQ6/+R6IdMPwZ4nbDA
	 dZDI+53aOQhehcepUJNY3OiBRpz0ea9bCWS9K13MaCoeVgSKeZOTLYKnFz8Fy56/JW
	 PoN5/0eOM46Gw==
Date: Mon, 13 Apr 2026 22:05:28 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Brian Norris <briannorris@chromium.org>, 
	Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Hongxing Zhu <hongxing.zhu@nxp.com>, 
	"manivannan.sadhasivam@oss.qualcomm.com" <manivannan.sadhasivam@oss.qualcomm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, 
	Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, Niklas Cassel <cassel@kernel.org>, 
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Lukas Wunner <lukas@wunner.de>, Wilson Ding <dingwei@marvell.com>, 
	Miles Chen <minhuachen@google.com>
Subject: Re: [PATCH v7 0/4] PCI: Add support for resetting the Root Ports in
 a platform specific way
Message-ID: <klzq2i2ne62hdri65gz7s5pxmvely277optr2lrkvdrrahl3ca@k3hdo6o4nkjz>
References: <20260310-pci-port-reset-v7-0-9dd00ccc25ab@oss.qualcomm.com>
 <AS8PR04MB883389FD2A016F9E02756B048C49A@AS8PR04MB8833.eurprd04.prod.outlook.com>
 <adcHylFjFjhHT-tP@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adcHylFjFjhHT-tP@google.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102982-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[nxp.com,oss.qualcomm.com,google.com,linux.ibm.com,gmail.com,kernel.org,sntech.de,pengutronix.de,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,wdc.com,wunner.de,marvell.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E08523EF5A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Brian,

On Wed, Apr 08, 2026 at 06:58:34PM -0700, Brian Norris wrote:
> Hi Richard and Mani,
> 
> For the record, I've been using a form of an earlier version of this
> patchset in my environment for some time now, and I've run across
> problems that *might* relate to what Richard is reporting, but I'm not
> quite sure at the moment. Details below.
> 
> On Wed, Mar 25, 2026 at 07:06:49AM +0000, Hongxing Zhu wrote:
> > Hi Mani:
> > I've accidentally encountered a new issue based on the reset root port patch-set.
> > After performing a few hot-reset operations, the PCIe link enters a continuous up/down cycling pattern.
> > 
> > I found that calling pci_reset_secondary_bus() first in pcibios_reset_secondary_bus() appears to resolve this issue.
> > Have you experienced a similar problem?
> > 
> > "
> > ...
> > [  141.897701] imx6q-pcie 4c300000.pcie: PCIe(LNK_STS:0x00000700) link up detected
> > [  142.086341] imx6q-pcie 4c300000.pcie: PCIe Gen.3 x1 link up
> > [  142.092038] imx6q-pcie 4c300000.pcie: PCIe(LNK_STS:0x00000c00) link down detected
> > ...
> > "
> > 
> > Platform: i.MX95 EVK board plus local Root Ports reset supports based on the #1 and #2 patches of v7 patch-set.
> > Notes of the logs:
> > - One Gen3 NVME device is connected.
> > - "./memtool 4c341058=0;./memtool 4c341058=1;" is used to toggle the LTSSM_EN bit to trigger the link down.
> > - Toggle BIT6 of Bridge Control Register to trigger hot reset by "./memtool 4c30003c=004001ff; ./memtool 4c30003c=000001ff;"
> > - The Root Port reset patches works correctly at first.
> > However, after several hot-reset triggers, the link enters a repeated down/up cycling state.
> > 
> > Logs:
> > [    3.553188] imx6q-pcie 4c300000.pcie: host bridge /soc/pcie@4c300000 ranges:
> > [    3.560308] imx6q-pcie 4c300000.pcie:       IO 0x006ff00000..0x006fffffff -> 0x0000000000
> > [    3.568525] imx6q-pcie 4c300000.pcie:      MEM 0x0910000000..0x091fffffff -> 0x0010000000
> > [    3.577314] imx6q-pcie 4c300000.pcie: config reg[1] 0x60100000 == cpu 0x60100000
> > [    3.796029] imx6q-pcie 4c300000.pcie: iATU: unroll T, 128 ob, 128 ib, align 4K, limit 1024G
> > [    4.003746] imx6q-pcie 4c300000.pcie: PCIe Gen.3 x1 link up
> > [    4.009553] imx6q-pcie 4c300000.pcie: PCI host bridge to bus 0000:00
> > root@imx95evk:~#
> > root@imx95evk:~#
> > root@imx95evk:~# ./memtool 4c341058=0;./memtool 4c341058=1; Writing 32-bit value 0x0 to address 0x4C341058
> > Writing 32-bit v
> > [   87.265348] imx6q-pcie 4c300000.pcie: PCIe(LNK_STS:0x00000d01) link down detected
> > alue 0x1 to adder
> > [   87.273106] imx6q-pcie 4c300000.pcie: Stop root bus and handle link down
> > ss 0x4C341058
> > [   87.281264] pcieport 0000:00:00.0: Recovering Root Port due to Link Down
> > [   87.289245] pci 0000:01:00.0: AER: can't recover (no error_detected callback)
> > root@imx95evk:~# [   87.514216] imx6q-pcie 4c300000.pcie: PCIe(LNK_STS:0x00000700) link up detected
> > [   87.702968] imx6q-pcie 4c300000.pcie: PCIe Gen.3 x1 link up
> > [   87.834983] pcieport 0000:00:00.0: Root Port has been reset
> > [   87.840714] pcieport 0000:00:00.0: AER: device recovery failed
> > [   87.846592] imx6q-pcie 4c300000.pcie: Rescan bus after link up is detected
> > [   87.855947] pcieport 0000:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
> 
> I've seen this same line ("bridge configuration invalid") before, and I
> believe that's because the saved state (pci_save_state(); more about
> this below) is invalid -- it contains 0 values in places where they
> should be non-zero. So when those values are restored
> (pci_restore_state()), we get confused.
> 
> I believe we've pinned down one reason this invalid state occurs -- it's
> because of an automatic (mis)feature in the DesignWare PCIe hardware.
> Specifically, it's because of what the controller does during a surprise
> link-down error.
> 
> From the Designware docs:
> 
>   "[...] during normal operation, the link might fail and go down. After
>   this link-down event, the controller requests the DWC_pcie_clkrst.v
>   module to hot-reset the controller. There is no difference in the
>   handling of a link-down reset or a hot reset; the controller asserts
>   the link_req_rst_not output requesting the DWC_pcie_clkrst.v module to
>   reset the controller."
> 
> In some of the adjacent documentation (and confirmed in local testing),
> it suggests that this automatic reset will also reset various DBI (i.e.,
> PCIe config space) registers. It also seems as if there's not really a
> good way to completely stop this automatic reset -- the docs mention
> some SW methods prevent the reset, but they all seem racy or incomplete.
> 
> Anyway, I think this implies that patch 1 is somewhat wrong [1]. It
> includes some code like this:
> 
> 		pci_save_state(dev);
> 		ret = host->reset_root_port(host, dev);
> 		if (ret)
> 			pci_err(dev, "Failed to reset Root Port: %d\n", ret);
> 		else
> 			/* Now restore it on success */
> 			pci_restore_state(dev);
> 
> That first line (pci_save_state()) is prone to saving invalid state,
> depending on whether the link-down event has finished flushing and
> resetting the controller yet or not. The resulting impact is a bit hard
> to judge, depending on what (mis)configuration you end up with.
> 

Thanks a lot for your investigation. I think your observation makes sense and
could be the culprit in saving the corrupted state. Even on non-DWC controllers,
there is no guarantee that the Root Port config registers state will be
preserved after LDn (before Root Port reset).

> I also noticed commit a2f1e22390ac ("PCI/ERR: Ensure error
> recoverability at all times") was merged recently. With that change, I
> believe it is now safe to perform pci_restore_state() even without
> pci_save_state() here.
> 
> So ... can we remove pci_save_state() from
> pcibios_reset_secondary_bus()? Might that help?

I think so. I will also test it locally and report back soon.

> It sounds like my above
> observations *may* match Richard's reports, but I'm not sure. And
> anyway, the documented hardware behavior is racy, so it's hard to
> propose a foolproof solution.
> 

@Richard: Can you confirm if removing 'pci_save_state(dev);' from
pcibios_reset_secondary_bus() fixes your issue?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

