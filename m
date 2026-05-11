Return-Path: <linux-arm-msm+bounces-106835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AAAFrFmAWpvXwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 07:18:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4785081FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 07:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C06F93006F2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 05:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0EA36654F;
	Mon, 11 May 2026 05:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0IPhONn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DD72E63C;
	Mon, 11 May 2026 05:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778476717; cv=none; b=N8CeBkoHSEQwKpChSrpRrzPa7hfuK6tIE83vcfH9HqVdb4U5ORxareL9fIhZqj489JLD3MByevtOwFPEwl0bH36Dr4fouNLwNhIm09Se7mjqh3czg2aQUlJdyeHdBPiu+HcFSLP6jTMP36poxqvJUeAPFhY7j5YrROB6y5M+YW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778476717; c=relaxed/simple;
	bh=DlsXme9lwoqKsJyGSBaGtI+ozuQkDWi5uzvbU8C2c5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QB49FcpI5Tlzf0hQEdMDb1kLODH+vIxCcFehjB9eeRTsPdC5EJ6n3ZMQ6ERYPr5pwnquKvWZRNT0J2Lqwj5HWKaKB1CuSoW7MwFFeK/dtZISddaTsat41GYyQiCxxlBadkKc42SU5Es6lwlDv7F1uJBTPWg2NN87LUsdbLUWfD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0IPhONn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F31ABC2BCB0;
	Mon, 11 May 2026 05:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778476717;
	bh=DlsXme9lwoqKsJyGSBaGtI+ozuQkDWi5uzvbU8C2c5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A0IPhONnhKqguTZYEEPJfmmarergtLTe7mSrEWz5PN6QF7cnCSYkd/psKMt4cjrOA
	 iPMZg2uf0DMUlg80+8RIvT6HZyor+xgMmBfmWNyMmJMfIDrRn9Dt7l/BQpjFalaRxn
	 H7UXcyE2WHjJMAVqakihPkV1OUbFTRvxNK6I16Vcb6e3rL6der9faCerOOxCyiFn6C
	 sxeaPKDNEjql2Hzl93lyBYKXl9/ShZTiBz6jAoAzt5uhiyhs756PQ2ybYTYgJGs6uI
	 SiAI5AQKrpi7bWoZ+YmwJPK+xeL3gnS8t2PuKFUvZjdbLOxWJ07vze0/pdsRPsoXFS
	 A/cGX5Bsb1I6w==
Date: Mon, 11 May 2026 10:48:23 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	manivannan.sadhasivam@oss.qualcomm.com, Thierry Reding <treding@nvidia.com>, 
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
Message-ID: <fb6uzh3jfes3hky6fblpsh2vvg3daij5ogecydiuhmytxbglcb@tdqjcoxuymsk>
References: <20260122152903.GA1247682@bhelgaas>
 <8d8b2244-2bf0-48cf-8fb8-9e47e197a62d@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d8b2244-2bf0-48cf-8fb8-9e47e197a62d@nvidia.com>
X-Rspamd-Queue-Id: CD4785081FB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106835-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,nvidia.com,google.com,vger.kernel.org,linux.intel.com,canonical.com,gmail.com,kernel.dk,lst.de,grimberg.me,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 11:25:23AM +0100, Jon Hunter wrote:
> Hi Bjorn, Mani,
> 
> On 22/01/2026 15:29, Bjorn Helgaas wrote:
> > [+cc NVMe folks]
> > 
> > On Thu, Jan 22, 2026 at 12:12:42PM +0000, Jon Hunter wrote:
> > > ...
> > 
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
> > > Other PCIe devices seem to be OK (like the realtek r8169) but just
> > > the NVMe is having issues. So I am trying to figure out the best way
> > > to resolve this?
> > 
> > For context, "this commit" refers to f3ac2ff14834, modified by
> > df5192d9bb0e:
> > 
> >    f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
> >    df5192d9bb0e ("PCI/ASPM: Enable only L0s and L1 for devicetree platforms")
> > 
> > The fact that this suspend issue only affects NVMe reminds me of the
> > code in dw_pcie_suspend_noirq() [1] that bails out early if L1 is
> > enabled because of some NVMe expectation:
> > 
> >    dw_pcie_suspend_noirq()
> >    {
> >      ...
> >      /*
> >       * If L1SS is supported, then do not put the link into L2 as some
> >       * devices such as NVMe expect low resume latency.
> >       */
> >      if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
> >        return 0;
> >      ...
> > 
> > That suggests there's some NVMe/ASPM interaction that the PCI core
> > doesn't understand yet.
> > 
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/dwc/pcie-designware-host.c?id=v6.18#n1146
> 
> 
> I want to revisit this issue. From my perspective low-power suspend has now
> been broken on some of our Tegra platforms (that have NVMe devices) since
> v6.19 and so far this is no resolution to this issue. The patch that was
> proposed to fix this [0] has been rejected by qualcomm and although this
> does workaround the issue, my confidence that this is the right fix is now
> low.
> 

The referenced patch is now merged into arm-soc for v7.2:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=7602c0ec0bbfd3985d49f4f0cad281c1414008c9

I hope this takes care of the issue you are dealing with.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

