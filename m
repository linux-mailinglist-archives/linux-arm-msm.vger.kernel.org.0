Return-Path: <linux-arm-msm+bounces-90240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LJmFSBmcmmrjwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 19:02:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D946BE0F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 19:02:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8CD973025530
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 17:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7083A5C24;
	Thu, 22 Jan 2026 17:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ldyC/2RN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CB038F950;
	Thu, 22 Jan 2026 17:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769101322; cv=none; b=M+SA/jr08Q6w7NclDXVmv3LzXiLpo4+yDnlVUL6AzLodSgRX/uNKrDvUbD0zD8DwmftKP3sz9LnKXAJfHaFdQiQmSrvIqsudpa8cXvM7hH3QPcaIjUFbU0XVBir8GFBTDMgHsSZiI1gy8/ogEnB5HnlsPtObiT1MAy+s8sh40Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769101322; c=relaxed/simple;
	bh=TPAxVo8Je7LBB6w1OgAl2SBsCio85y7ZhAg7mwaob/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MVE/IRXuhP+ceLrzCe6GNv+Mr7zgx4y5AiRqovlsNfNT4ilANCijOUoXhRGlaysG03+wtOkRjW82HTneroheI8a/DDaBBKY/BHtr1lGYu1maCLChslsKeP2KpTBkORMZoWZ1lCHDdAiBua+lbvsea5f26pX0x5k+XVjhuyOVLcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ldyC/2RN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04DF7C116C6;
	Thu, 22 Jan 2026 17:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769101321;
	bh=TPAxVo8Je7LBB6w1OgAl2SBsCio85y7ZhAg7mwaob/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ldyC/2RNsLzuo+dmdhcSQl2Lsm+MaFjhwWiz5vU/CE4I0SNwJMniv9WdvqPIzub/8
	 WSTzATYjUAS6k5btQyOu2yTVqC/4902f+3Xcw75W9mDW/fxsVB7YzCXK4i8gCtWPs+
	 4RA/xoorE+BmqGY6suSZi0NSUZ48nW/FfqRjkPpgYdRCa8qxF7oX7WO6MXXhvqLSyy
	 Wrwlth1qliNglURiJ/PbS/dWl6+xeNZygwO6N7oHIEjr/79TJKSOddy0fmWex3tkB9
	 0us42nFupsxpVha6bt5xAEeZh27srjXhoo3NHYw8VrH4ZMUOE5ewERi648ucFoD5YY
	 JcHAhXSpb4xIw==
Date: Thu, 22 Jan 2026 22:31:50 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"David E. Box" <david.e.box@linux.intel.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Chia-Lin Kao <acelan.kao@canonical.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, 
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org
Subject: Re: [PATCH v2 1/2] PCI/ASPM: Override the ASPM and Clock PM states
 set by BIOS for devicetree platforms
Message-ID: <5z7c25nkb35prvax6vq6ud7eaeuhzsswbf7fqvmlgys3xftgwb@odocboejrdrv>
References: <7306256a-b380-489b-8248-b774e6d3d80e@nvidia.com>
 <20260122152903.GA1247682@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260122152903.GA1247682@bhelgaas>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90240-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,google.com,kernel.org,vger.kernel.org,linux.intel.com,canonical.com,gmail.com,kernel.dk,lst.de,grimberg.me,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.968];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F0D946BE0F
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 09:29:03AM -0600, Bjorn Helgaas wrote:
> [+cc NVMe folks]
> 
> On Thu, Jan 22, 2026 at 12:12:42PM +0000, Jon Hunter wrote:
> > ...
> 
> > Since this commit was added in Linux v6.18, I have been observing a suspend
> > test failures on some of our boards. The suspend test suspends the devices
> > for 20 secs and before this change the board would resume in about ~27 secs
> > (including the 20 sec sleep). After this change the board would take over 80
> > secs to resume and this triggered a failure.
> > 
> > Looking at the logs, I can see it is the NVMe device on the board that is
> > having an issue, and I see the reset failing ...
> > 
> >  [  945.754939] r8169 0007:01:00.0 enP7p1s0: Link is Up - 1Gbps/Full -
> >   flow control rx/tx
> >  [ 1002.467432] nvme nvme0: I/O tag 12 (400c) opcode 0x9 (Admin Cmd) QID
> >   0 timeout, reset controller
> >  [ 1002.493713] nvme nvme0: 12/0/0 default/read/poll queues
> >  [ 1003.050448] nvme nvme0: ctrl state 1 is not RESETTING
> >  [ 1003.050481] OOM killer enabled.
> >  [ 1003.054035] nvme nvme0: Disabling device after reset failure: -19
> > 
> > From the above timestamps the delay is coming from the NVMe. I see this
> > issue on several boards with different NVMe devices and I can workaround
> > this by disabling ASPM L0/L1 for these devices ...
> > 
> >  DECLARE_PCI_FIXUP_HEADER(0x15b7, 0x5011, quirk_disable_aspm_l0s_l1);
> >  DECLARE_PCI_FIXUP_HEADER(0x15b7, 0x5036, quirk_disable_aspm_l0s_l1);
> >  DECLARE_PCI_FIXUP_HEADER(0x1b4b, 0x1322, quirk_disable_aspm_l0s_l1);
> >  DECLARE_PCI_FIXUP_HEADER(0xc0a9, 0x540a, quirk_disable_aspm_l0s_l1);
> > 
> > I am curious if you have seen any similar issues?
> > 
> > Other PCIe devices seem to be OK (like the realtek r8169) but just
> > the NVMe is having issues. So I am trying to figure out the best way
> > to resolve this?
> 
> For context, "this commit" refers to f3ac2ff14834, modified by
> df5192d9bb0e:
> 
>   f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
>   df5192d9bb0e ("PCI/ASPM: Enable only L0s and L1 for devicetree platforms")
> 
> The fact that this suspend issue only affects NVMe reminds me of the
> code in dw_pcie_suspend_noirq() [1] that bails out early if L1 is
> enabled because of some NVMe expectation:
> 
>   dw_pcie_suspend_noirq()
>   {
>     ...
>     /*
>      * If L1SS is supported, then do not put the link into L2 as some
>      * devices such as NVMe expect low resume latency.
>      */
>     if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
>       return 0;
>     ...
> 
> That suggests there's some NVMe/ASPM interaction that the PCI core
> doesn't understand yet.
> 

We have this check in place since NVMe driver keeps the device in D0 and expects
the link to be in L1ss on platforms not passing below checks:

        if (pm_suspend_via_firmware() || !ctrl->npss ||
            !pcie_aspm_enabled(pdev) ||
            (ndev->ctrl.quirks & NVME_QUIRK_SIMPLE_SUSPEND))

Since the majority of the DWC platforms do not pass the above checks, we don't
transition the device to D3Cold or link to L2/L3 in dw_pcie_suspend_noirq() if
the link is in L1ss. Though I think we should be checking for D0 state instead
of L1ss here.

I think what is going on here is that since before commits f3ac2ff14834 and
df5192d9bb0e, !pcie_aspm_enabled() check was passing as ASPM was not enabled for
the device (and upstream port) and after those commits, this check is not
passing and the NVMe driver is not shutting down the controller and expects the
link to be in L0/L1ss. But the Tegra controller driver initiates L2/L3
transition, and also turns off the device. So all the NVMe context is lost
during suspend and while resuming, the NVMe driver got confused due to lost
context.

Jon, could you please try the below hack and see if it fixes the issue?

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 0e4caeab739c..4b8d261117f5 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -3723,7 +3723,7 @@ static int nvme_suspend(struct device *dev)
         * state (which may not be possible if the link is up).
         */
        if (pm_suspend_via_firmware() || !ctrl->npss ||
-           !pcie_aspm_enabled(pdev) ||
+           pcie_aspm_enabled(pdev) ||
            (ndev->ctrl.quirks & NVME_QUIRK_SIMPLE_SUSPEND))
                return nvme_disable_prepare_reset(ndev, true);
 
This will confirm whether the issue is due to Tegra controller driver breaking
the NVMe driver assumption or not.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

