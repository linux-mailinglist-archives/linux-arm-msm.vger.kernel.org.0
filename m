Return-Path: <linux-arm-msm+bounces-102389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EQAuH9QH12m0KggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 03:58:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 036AE3C565C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 03:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4F1A300952B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 01:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE50B3624C2;
	Thu,  9 Apr 2026 01:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HwGZpkxi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4068E363C60
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 01:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775699921; cv=none; b=e+NuLKvM3lVUXOzmpb6XMtbWLVDMEB/WBGyaEU+ZZ7wMMwnAvPaY1H1J1YiNu6yMhzQ4MbsBVR5msJAG1opoB9Xq1A46smVI7U5FDNjmMXofpN4R4ueKgE1XlTKy5TdZ9P+n0/dYFhrsVmefjbDEhO5SEcmygyEd4ILJoWkF8tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775699921; c=relaxed/simple;
	bh=ImbgTzP+JJQ0wT/r9F7poPzQD53JcpRtXcFwBff9CgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bA0D6pYSIDZ9JWGwk/eioCdee1TMX7g0TL7wsy5aN1YsCn9V3+Cd3eDQ+rpVDZeB3aVxNVajBGpm3g7WUD4Vdpomb3SpFL+gyJXFkSapGNFATYsOorllx7I3U7dyTeicuqA3qA2bZv4TN6TOIcKsOb/5qgOvSRvWKUU4HpH3PzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HwGZpkxi; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2d17b8fbedaso101476eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 18:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775699918; x=1776304718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rtu5J6mkYa7cAz+oGv/2J7Qnc58jCw+U8QvJQpdZOFw=;
        b=HwGZpkxi0GU+D+l4ZMO2DPxkJJW7lvH7yA95n+VX9ehoYcUhXos1iqzeSy7UgdFF/c
         uR3M37ZzdFgV0UAWYzrGxN1hnybkJcZy+FlbKtznDj69vcl/VguDp7byKf3IScrgihj3
         +kNazM78YpOFtv319uYznJUIOL0VxLmQaSV2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775699918; x=1776304718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtu5J6mkYa7cAz+oGv/2J7Qnc58jCw+U8QvJQpdZOFw=;
        b=neV7P1SOcovCzEhgRGY8/q5wX4bbPXWsgRzgp1jzV7Ju778Ia8pCd5lgxoYz/coi2v
         7IKvIGtgXnLxlBCoXKrpfeAkCWrR7sYM3ulFFs/xN02hHPmhZZTiZM+UDK/P8trHlZoB
         l2QSAE5TTPQZ4SyPtcYXmdaUG8ddMwu05/kC+x/G2zlLn7YBWrASmXck6o2QIrsYfrdy
         4mUYn0g1c/QBtkhEefgHSKwM9ijDDrI4jMttD5xmvv+FhIJ/7542Hf0DX+uEwyfLQsDb
         qFk3/St/kXGG+7YH/13xU+DgKKuRpTPXaMfF1LcyNe7FMhB2O7ULRseyzL0pvz+A9gTn
         2GKg==
X-Forwarded-Encrypted: i=1; AJvYcCWwjX93lw2ONEra0p5H2ziJ+fQ6pe0BqKGboe/q6WzxSdSC+JxxfTxJ2Cs2h3LJoBAc5r0S3/uHTdzjkhMr@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3MrrLZTLM6J431GgRRSQ9nd3qKoEiaN3HXgGD/10lvu7+DmfU
	e/peKqzTXAG8NohLbfV9k120paly0apIt9wFOuzbuuFO0DvRIa2WZdU+3VvK3FkyyQ==
X-Gm-Gg: AeBDievmEiTanBKHI1SFz6E9XWrAvCJ2m59JFgWTqVMDBC20BJZje2ogFfG4Aed41v8
	bPzdCoJsn9tXmqPsTHHFS/RLSowPLV2UCSeo16xAOmD6lLTiTbBYYSUZ2OsUELSR+d/U/+GbcR2
	xcjcnViphYXzEiM0Hze4JeMYiNgeC3HmuK1A0AJj1FnvQ/NDfFhVG+02+iUNQI8K1mdBhZAi0Lu
	vhvB0nd4mAM6COcb5x7PgxJtHdnlevpX1c42vQ8XllGAWXrM35e5r9z7bDhbQvVwUj2lek0mgsP
	czYEqT+PTxwCQUdWJwj8OmiALn+ccw3lWrjY842n1Rzk+T7WG0PwsMzB+NnyC2sIOUcJ1F+MfYM
	KIGBTVmnGfipBhP77uhdLtTh1pihz4MDOs8YLrjRoktYPk2/XLn+Z9jYAH0gZCA8w/GyUoo4u20
	e9wLebS2caDKSBIYjCj6DDbIrESi9WnTUNsHlLl29+PKvrZJQOR3QwQzJeYQtxmA==
X-Received: by 2002:a05:7301:6097:b0:2d1:a3ea:d8a5 with SMTP id 5a478bee46e88-2d40e9cace4mr857392eec.7.1775699918176;
        Wed, 08 Apr 2026 18:58:38 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:8419:d73b:6e27:ef7e])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2ca7c3010e9sm29435810eec.14.2026.04.08.18.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 18:58:37 -0700 (PDT)
Date: Wed, 8 Apr 2026 18:58:34 -0700
From: Brian Norris <briannorris@chromium.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: "manivannan.sadhasivam@oss.qualcomm.com" <manivannan.sadhasivam@oss.qualcomm.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
	Niklas Cassel <cassel@kernel.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Lukas Wunner <lukas@wunner.de>, Wilson Ding <dingwei@marvell.com>,
	Miles Chen <minhuachen@google.com>
Subject: Re: [PATCH v7 0/4] PCI: Add support for resetting the Root Ports in
 a platform specific way
Message-ID: <adcHylFjFjhHT-tP@google.com>
References: <20260310-pci-port-reset-v7-0-9dd00ccc25ab@oss.qualcomm.com>
 <AS8PR04MB883389FD2A016F9E02756B048C49A@AS8PR04MB8833.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR04MB883389FD2A016F9E02756B048C49A@AS8PR04MB8833.eurprd04.prod.outlook.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102389-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,google.com,linux.ibm.com,gmail.com,kernel.org,sntech.de,pengutronix.de,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,wdc.com,wunner.de,marvell.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[briannorris@chromium.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,4c300000:email,chromium.org:dkim]
X-Rspamd-Queue-Id: 036AE3C565C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Richard and Mani,

For the record, I've been using a form of an earlier version of this
patchset in my environment for some time now, and I've run across
problems that *might* relate to what Richard is reporting, but I'm not
quite sure at the moment. Details below.

On Wed, Mar 25, 2026 at 07:06:49AM +0000, Hongxing Zhu wrote:
> Hi Mani:
> I've accidentally encountered a new issue based on the reset root port patch-set.
> After performing a few hot-reset operations, the PCIe link enters a continuous up/down cycling pattern.
> 
> I found that calling pci_reset_secondary_bus() first in pcibios_reset_secondary_bus() appears to resolve this issue.
> Have you experienced a similar problem?
> 
> "
> ...
> [  141.897701] imx6q-pcie 4c300000.pcie: PCIe(LNK_STS:0x00000700) link up detected
> [  142.086341] imx6q-pcie 4c300000.pcie: PCIe Gen.3 x1 link up
> [  142.092038] imx6q-pcie 4c300000.pcie: PCIe(LNK_STS:0x00000c00) link down detected
> ...
> "
> 
> Platform: i.MX95 EVK board plus local Root Ports reset supports based on the #1 and #2 patches of v7 patch-set.
> Notes of the logs:
> - One Gen3 NVME device is connected.
> - "./memtool 4c341058=0;./memtool 4c341058=1;" is used to toggle the LTSSM_EN bit to trigger the link down.
> - Toggle BIT6 of Bridge Control Register to trigger hot reset by "./memtool 4c30003c=004001ff; ./memtool 4c30003c=000001ff;"
> - The Root Port reset patches works correctly at first.
> However, after several hot-reset triggers, the link enters a repeated down/up cycling state.
> 
> Logs:
> [    3.553188] imx6q-pcie 4c300000.pcie: host bridge /soc/pcie@4c300000 ranges:
> [    3.560308] imx6q-pcie 4c300000.pcie:       IO 0x006ff00000..0x006fffffff -> 0x0000000000
> [    3.568525] imx6q-pcie 4c300000.pcie:      MEM 0x0910000000..0x091fffffff -> 0x0010000000
> [    3.577314] imx6q-pcie 4c300000.pcie: config reg[1] 0x60100000 == cpu 0x60100000
> [    3.796029] imx6q-pcie 4c300000.pcie: iATU: unroll T, 128 ob, 128 ib, align 4K, limit 1024G
> [    4.003746] imx6q-pcie 4c300000.pcie: PCIe Gen.3 x1 link up
> [    4.009553] imx6q-pcie 4c300000.pcie: PCI host bridge to bus 0000:00
> root@imx95evk:~#
> root@imx95evk:~#
> root@imx95evk:~# ./memtool 4c341058=0;./memtool 4c341058=1; Writing 32-bit value 0x0 to address 0x4C341058
> Writing 32-bit v
> [   87.265348] imx6q-pcie 4c300000.pcie: PCIe(LNK_STS:0x00000d01) link down detected
> alue 0x1 to adder
> [   87.273106] imx6q-pcie 4c300000.pcie: Stop root bus and handle link down
> ss 0x4C341058
> [   87.281264] pcieport 0000:00:00.0: Recovering Root Port due to Link Down
> [   87.289245] pci 0000:01:00.0: AER: can't recover (no error_detected callback)
> root@imx95evk:~# [   87.514216] imx6q-pcie 4c300000.pcie: PCIe(LNK_STS:0x00000700) link up detected
> [   87.702968] imx6q-pcie 4c300000.pcie: PCIe Gen.3 x1 link up
> [   87.834983] pcieport 0000:00:00.0: Root Port has been reset
> [   87.840714] pcieport 0000:00:00.0: AER: device recovery failed
> [   87.846592] imx6q-pcie 4c300000.pcie: Rescan bus after link up is detected
> [   87.855947] pcieport 0000:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring

I've seen this same line ("bridge configuration invalid") before, and I
believe that's because the saved state (pci_save_state(); more about
this below) is invalid -- it contains 0 values in places where they
should be non-zero. So when those values are restored
(pci_restore_state()), we get confused.

I believe we've pinned down one reason this invalid state occurs -- it's
because of an automatic (mis)feature in the DesignWare PCIe hardware.
Specifically, it's because of what the controller does during a surprise
link-down error.

From the Designware docs:

  "[...] during normal operation, the link might fail and go down. After
  this link-down event, the controller requests the DWC_pcie_clkrst.v
  module to hot-reset the controller. There is no difference in the
  handling of a link-down reset or a hot reset; the controller asserts
  the link_req_rst_not output requesting the DWC_pcie_clkrst.v module to
  reset the controller."

In some of the adjacent documentation (and confirmed in local testing),
it suggests that this automatic reset will also reset various DBI (i.e.,
PCIe config space) registers. It also seems as if there's not really a
good way to completely stop this automatic reset -- the docs mention
some SW methods prevent the reset, but they all seem racy or incomplete.

Anyway, I think this implies that patch 1 is somewhat wrong [1]. It
includes some code like this:

		pci_save_state(dev);
		ret = host->reset_root_port(host, dev);
		if (ret)
			pci_err(dev, "Failed to reset Root Port: %d\n", ret);
		else
			/* Now restore it on success */
			pci_restore_state(dev);

That first line (pci_save_state()) is prone to saving invalid state,
depending on whether the link-down event has finished flushing and
resetting the controller yet or not. The resulting impact is a bit hard
to judge, depending on what (mis)configuration you end up with.

I also noticed commit a2f1e22390ac ("PCI/ERR: Ensure error
recoverability at all times") was merged recently. With that change, I
believe it is now safe to perform pci_restore_state() even without
pci_save_state() here.

So ... can we remove pci_save_state() from
pcibios_reset_secondary_bus()? Might that help? It sounds like my above
observations *may* match Richard's reports, but I'm not sure. And
anyway, the documented hardware behavior is racy, so it's hard to
propose a foolproof solution.

Brian

[1] At least, for DesignWare controllers.

> [   87.864423] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
> 
> root@imx95evk:~#
> root@imx95evk:~# cat /proc/interrupts | grep lnk;
> 273:          2          0          0          0          0          0    GICv3 342 Level     PCIe PME, lnk_notify
> root@imx95evk:~#
> root@imx95evk:~#
> root@imx95evk:~# ./memtool 4c30003c=004001ff; ./memtool 4c30003c=000001ff; Writing 32-bit va
> [  107.028086] imx6q-pcie 4c300000.pcie: PCIe(LNK_STS:0x00000d00) link down detected lue 0x4001FF to a
> [  107.037018] imx6q-pcie 4c300000.pcie: Stop root bus and handle link down ddress 0x4C30003C
> [  107.045137] pcieport 0000:00:00.0: Recovering Root Port due to Link Down
> 
> Writing 32-bit
> [  107.053332] pci 0000:01:00.0: AER: can't recover (no error_detected callback)  value 0x1FF to address 0x4C30003C root@imx95evk:~#
> [  107.282146] imx6q-pcie 4c300000.pcie: PCIe(LNK_STS:0x00000700) link up detected
> [  107.470801] imx6q-pcie 4c300000.pcie: PCIe Gen.3 x1 link up
> [  107.602823] pcieport 0000:00:00.0: Root Port has been reset
> [  107.608601] pcieport 0000:00:00.0: AER: device recovery failed
> [  107.614497] imx6q-pcie 4c300000.pcie: Rescan bus after link up is detected
> [  107.623805] pcieport 0000:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
> [  107.632281] pci_bus 0000:01: busn_res: [bus 01] end is updated to 01
> 
> root@imx95evk:~#
> root@imx95evk:~# cat /proc/interrupts | grep lnk;
> 273:          4          0          0          0          0          0    GICv3 342 Level     PCIe PME, lnk_notify
> root@imx95evk:~#
> root@imx95evk:~# ./memtool 4c30003c=004001ff; ./memtool 4c30003c=000001ff; Writing 32-bit va
> [  133.424041] imx6q-pcie 4c300000.pcie: PCIe(LNK_STS:0x00000d00) link down detected lue 0x4001FF to a
> [  133.432954] imx6q-pcie 4c300000.pcie: Stop root bus and handle link down ddress 0x4C30003C
> [  133.441106] pcieport 0000:00:00.0: Recovering Root Port due to Link Down
> 
> Writing 32-bit
> [  133.449309] pci 0000:01:00.0: AER: can't recover (no error_detected callback)  value 0x1FF to address 0x4C30003C root@imx95evk:~#
> [  133.677824] imx6q-pcie 4c300000.pcie: PCIe(LNK_STS:0x00000700) link up detected
> [  133.870414] imx6q-pcie 4c300000.pcie: PCIe Gen.3 x1 link up
> [  134.002534] pcieport 0000:00:00.0: Root Port has been reset
> [  134.008307] pcieport 0000:00:00.0: AER: device recovery failed
> [  134.014193] imx6q-pcie 4c300000.pcie: Rescan bus after link up is detected
> [  134.023418] pcieport 0000:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
> [  134.031881] pci_bus 0000:01: busn_res: [bus 01] end is updated to 01
> 
> root@imx95evk:~# ./memtool 4c30003c=004001ff; ./memtool 4c30003c=000001ff; Writing 32-bit va
> [  140.149713] imx6q-pcie 4c300000.pcie: PCIe(LNK_STS:0x00000d00) link down detected lue 0x4001FF to a
> [  140.158614] imx6q-pcie 4c300000.pcie: Stop root bus and handle link down ddress 0x4C30003C
> [  140.166779] pcieport 0000:00:00.0: Recovering Root Port due to Link Down
> [  140.174981] pci 0000:01:00.0: AER: can't recover (no error_detected callback) Writing 32-bit value 0x1FF to address 0x4C30003C root@imx95evk:~#
> [  140.401605] imx6q-pcie 4c300000.pcie: PCIe(LNK_STS:0x00000700) link up detected
> [  140.590491] imx6q-pcie 4c300000.pcie: PCIe Gen.3 x1 link up
> [  140.596206] imx6q-pcie 4c300000.pcie: PCIe(LNK_STS:0x00000c00) link down detected
> 
> root@imx95evk:~#
> [  141.630311] pcieport 0000:00:00.0: Data Link Layer Link Active not set in 100 msec
> [  141.637950] pcieport 0000:00:00.0: Failed to reset Root Port: -25
> [  141.644095] pcieport 0000:00:00.0: AER: subordinate device reset failed
> [  141.650883] pcieport 0000:00:00.0: AER: device recovery failed
> [  141.656784] imx6q-pcie 4c300000.pcie: Stop root bus and handle link down
> [  141.663520] pcieport 0000:00:00.0: Recovering Root Port due to Link Down
> [  141.670271] pci 0000:01:00.0: AER: can't recover (no error_detected callback)
> [  141.897701] imx6q-pcie 4c300000.pcie: PCIe(LNK_STS:0x00000700) link up detected
> [  142.086341] imx6q-pcie 4c300000.pcie: PCIe Gen.3 x1 link up
> [  142.092038] imx6q-pcie 4c300000.pcie: PCIe(LNK_STS:0x00000c00) link down detected
> [  143.126273] pcieport 0000:00:00.0: Data Link Layer Link Active not set in 100 msec
> [  143.133919] pcieport 0000:00:00.0: Failed to reset Root Port: -25
> [  143.140052] pcieport 0000:00:00.0: AER: subordinate device reset failed
> [  143.146747] pcieport 0000:00:00.0: AER: device recovery failed
> [  143.152604] imx6q-pcie 4c300000.pcie: Stop root bus and handle link down
> [  143.159314] pcieport 0000:00:00.0: Recovering Root Port due to Link Down
> [  143.166022] pci 0000:01:00.0: AER: can't recover (no error_detected callback)
> [  143.389723] imx6q-pcie 4c300000.pcie: PCIe(LNK_STS:0x00000700) link up detected
> [  143.582294] imx6q-pcie 4c300000.pcie: PCIe Gen.3 x1 link up
> [  143.587996] imx6q-pcie 4c300000.pcie: PCIe(LNK_STS:0x00000c00) link down detected
> 
> 
> Thanks.
> Best Regards
> Richard Zhu

