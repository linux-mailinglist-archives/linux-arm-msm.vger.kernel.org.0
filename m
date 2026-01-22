Return-Path: <linux-arm-msm+bounces-90217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JZCJTc7cmlMfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 15:59:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0636368378
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 15:59:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B59EC96359B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26FC3349AEC;
	Thu, 22 Jan 2026 14:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hN6y9gqA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2BE343D7F;
	Thu, 22 Jan 2026 14:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769092801; cv=none; b=XZvXaV/9W6NXsLfiYmIofdolWZp1VqHWbTFk2riPV7mvDHdn47yOAcOPNGix+ItaLs393M9kz3bK//fvyqaNHsjtb39W0RlaRq8if+znxU1Ejy+cw/M5uM3vj2WD4Zs5FNaQGuAzZPLOzVvuvbUR7363+xw3yRaCuOwoWxL+j4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769092801; c=relaxed/simple;
	bh=1ieLDIlqa3rrEJoM3l1ytVw+31Xyr7caHGb5FP+IeH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pDr7j340aDcIwJNRhcLmeufzLYZpKr/PCUPjnTPaxoeDCyMGhe1vrOwUzcHUjcXi2vT6Pv+ypJqoPR55urFY0aZch++ODQbQyAS//EoVs7iQ2O+aaqv6wU/xvtpQAIByWL5n9ihUEeHTJt0cqPPwkai2Pkzwu4mu34ZGVsgs2Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hN6y9gqA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC1BC116C6;
	Thu, 22 Jan 2026 14:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769092801;
	bh=1ieLDIlqa3rrEJoM3l1ytVw+31Xyr7caHGb5FP+IeH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hN6y9gqAWxAcQsPwSSNk6yDY0nA/2zMjHltdGPEYl32qpcc756s/+sUezdnA5xT2a
	 g+JcA26d40PYgkM5c65D4eQgm33IOUbjc68X9eSb2HN3Ieb0rFa68JBdTci6t/Fxmr
	 ahoZp1wZpSoDAPDs7x2VfXnd4kD3oUv+QSfhSn5vCykEyKgWtJQiH9eJymSoXC2SoC
	 qjkWRHymFFXa9XrCdmAXNvOGRZy3Yo3odm3eqAbR0MAMKDmU2P9Uo9fQmEbJm7NhI1
	 WSuDgmkzsnr0G1gkovOOBlfhAEi9BA3yooLMxccj/atS+iDSbvD19S6wV8Ah+lTQ5K
	 CBPac2Zv4CdFQ==
Date: Thu, 22 Jan 2026 20:09:45 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"David E. Box" <david.e.box@linux.intel.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Chia-Lin Kao <acelan.kao@canonical.com>, Bjorn Helgaas <helgaas@kernel.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] PCI/ASPM: Override the ASPM and Clock PM states
 set by BIOS for devicetree platforms
Message-ID: <4ywec7ifq4s2hqd3rg4mxcwkj345vvifpyihsywz3unn77fkdu@74wzarashnul>
References: <20250922-pci-dt-aspm-v2-0-2a65cf84e326@oss.qualcomm.com>
 <20250922-pci-dt-aspm-v2-1-2a65cf84e326@oss.qualcomm.com>
 <7306256a-b380-489b-8248-b774e6d3d80e@nvidia.com>
 <76sr3yuwdaon3o3u5dfjycwlxhxcarid5tevgtao6aaapvwbzd@e7bam35dzt3k>
 <9a76a4a7-c02c-436a-8f69-57606a6b2bed@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a76a4a7-c02c-436a-8f69-57606a6b2bed@nvidia.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90217-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,google.com,kernel.org,vger.kernel.org,linux.intel.com,canonical.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 0636368378
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 01:43:41PM +0000, Jon Hunter wrote:
> 
> On 22/01/2026 13:17, Manivannan Sadhasivam wrote:
> 
> ...
> 
> > > Since this commit was added in Linux v6.18, I have been observing a suspend
> > > test failures on some of our boards. The suspend test suspends the devices
> > > for 20 secs and before this change the board would resume in about ~27 secs
> > > (including the 20 sec sleep). After this change the board would take over 80
> > > secs to resume and this triggered a failure.
> > > 
> > > Looking at the logs, I can see it is the NVMe device on the board that is
> > > having an issue, and I see the reset failing ...
> > > 
> > >   [  945.754939] r8169 0007:01:00.0 enP7p1s0: Link is Up - 1Gbps/Full -
> > >    flow control rx/tx
> > >   [ 1002.467432] nvme nvme0: I/O tag 12 (400c) opcode 0x9 (Admin Cmd) QID
> > >    0 timeout, reset controller
> > >   [ 1002.493713] nvme nvme0: 12/0/0 default/read/poll queues
> > >   [ 1003.050448] nvme nvme0: ctrl state 1 is not RESETTING
> > >   [ 1003.050481] OOM killer enabled.
> > >   [ 1003.054035] nvme nvme0: Disabling device after reset failure: -19
> > > 
> > >  From the above timestamps the delay is coming from the NVMe. I see this
> > > issue on several boards with different NVMe devices and I can workaround
> > > this by disabling ASPM L0/L1 for these devices ...
> > > 
> > >   DECLARE_PCI_FIXUP_HEADER(0x15b7, 0x5011, quirk_disable_aspm_l0s_l1);
> > >   DECLARE_PCI_FIXUP_HEADER(0x15b7, 0x5036, quirk_disable_aspm_l0s_l1);
> > >   DECLARE_PCI_FIXUP_HEADER(0x1b4b, 0x1322, quirk_disable_aspm_l0s_l1);
> > >   DECLARE_PCI_FIXUP_HEADER(0xc0a9, 0x540a, quirk_disable_aspm_l0s_l1);
> > > 
> > > I am curious if you have seen any similar issues?
> > > 
> > 
> > Marek reported a similar issue on ARM Juno board [1] on which one of the switch
> > downstream port failed to come up while *entering* system suspend. But I was
> > clueless as to why the device fails to function only while entering system
> > suspend and not during runtime. I suspect something is going wrong in the
> > suspend path.
> > 
> > In your case, looks like the device is failing while resuming from suspend. Did
> > you see any error log during suspend as well?
> 
> I don't see any errors on entering suspend, just resuming from suspend. One
> other thing that I notice, on resuming in a good case I see ...
> 
>  tegra194-pcie 141e0000.pcie: Link didn't transition to L2 state
> 
> In a bad case I see ...
> 
>  tegra194-pcie 141e0000.pcie: Link didn't transition to L2 state
>  tegra194-pcie 14160000.pcie: Link didn't transition to L2 state
>  tegra194-pcie 14160000.pcie: Link didn't go to detect state
> 

But this error print is coming from:

	tegra_pcie_dw_suspend_noirq()
		\__ tegra_pcie_dw_pme_turnoff()

This function broadcasts PME_Turn_Off message and expects the PME_TO_Ack
response from the device. But in both working and non-working cases, response is
not being received. Then the driver *deasserts* PERST# without asserting it
before (which is weird) and then restarts LTSSM expecting the LTSSM to be in
Detect state. And this one is not happening in non-working case. I don't know
why, maybe the device got crashed?

Can you also try skipping the suspend/resume handlers to isolate the issue with
PME_Turn_Off?

diff --git drivers/pci/controller/dwc/pcie-tegra194.c drivers/pci/controller/dwc/pcie-tegra194.c
index 0ddeef70726d..a5bb122a9477 100644
--- drivers/pci/controller/dwc/pcie-tegra194.c
+++ drivers/pci/controller/dwc/pcie-tegra194.c
@@ -2490,7 +2490,7 @@ static struct platform_driver tegra_pcie_dw_driver = {
        .shutdown = tegra_pcie_dw_shutdown,
        .driver = {
                .name   = "tegra194-pcie",
-               .pm = &tegra_pcie_dw_pm_ops,
+//             .pm = &tegra_pcie_dw_pm_ops,
                .of_match_table = tegra_pcie_dw_of_match,
        },
 };

- Mani

-- 
மணிவண்ணன் சதாசிவம்

