Return-Path: <linux-arm-msm+bounces-90236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCoFOhJncmmrjwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 19:06:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9655E6BF41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 19:06:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F12FD3025A57
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 17:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57FB138E138;
	Thu, 22 Jan 2026 15:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r9RIThb7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E8138E109;
	Thu, 22 Jan 2026 15:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769095745; cv=none; b=IrSUZ7EsyysfKnFDRthtaxypW0Ra+j63xkXixoZGIegzBrKYia1kkGqwmfXIar3Al+xwGHlenBezurcCAaCbu2ephpJaG7BAcZ+rENPWWpQ3DpWFhh0VSCrPesolXUjsTX02NfSMv4JTRwPZ/L3UmUxqnPwQJJtHthpQh2pGTNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769095745; c=relaxed/simple;
	bh=vYjhezx8RBYrZaQh5Oid2wtb4ZoiGXx6HNPQ9eDro9w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=rOhh+gBXS6HsT607tm+FzHnk5Tv9f9qk5WFlpoeC2vGARyCC1dIaYWt0FiS8rj9HoD4fKm8cGtgSWA1/kBCEBH/Y9IeD52FvyKot3Pn9FUlZNXqmnynOo+di9XJQkkS45+FWgWtVeHojp6nOOE8Kb4lQuv5P/wTSffdBOIcXVCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r9RIThb7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE824C116C6;
	Thu, 22 Jan 2026 15:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769095745;
	bh=vYjhezx8RBYrZaQh5Oid2wtb4ZoiGXx6HNPQ9eDro9w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=r9RIThb7pS8xgBhPwF6j7rujxOlpGK87EDpxtnKQWiX/kMFD7/1HzsMUNgEf8eVpS
	 Z97YIo9I3WxQWVAAi+Ntp2bI5zcFcogD46jybFOBK2thytrqmLuoJHF0at0Lpkktvd
	 C50JSZHao1pYE8mN7r725zBWUSidfJXAWE8qHrl3+WMLIf52IQHjz/Q5IPn0UTr2uk
	 m5AEBZbfcfeMVkjyZ72imyixCHrppf8FWodV1EZ5pWGvNeGt/9u1DmXpvk8tbf8T0y
	 e3rtCDPK//aK9ftaHcGYC6h9++sOAmDxrAWTiTJz7+jxx95PZPT2xgUkst+wL9+Kv8
	 MI+3qjq6ef4Nw==
Date: Thu, 22 Jan 2026 09:29:03 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: manivannan.sadhasivam@oss.qualcomm.com,
	Bjorn Helgaas <bhelgaas@google.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	"David E. Box" <david.e.box@linux.intel.com>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Chia-Lin Kao <acelan.kao@canonical.com>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH v2 1/2] PCI/ASPM: Override the ASPM and Clock PM states
 set by BIOS for devicetree platforms
Message-ID: <20260122152903.GA1247682@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7306256a-b380-489b-8248-b774e6d3d80e@nvidia.com>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90236-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,google.com,kernel.org,vger.kernel.org,linux.intel.com,canonical.com,gmail.com,kernel.dk,lst.de,grimberg.me,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.974];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9655E6BF41
X-Rspamd-Action: no action

[+cc NVMe folks]

On Thu, Jan 22, 2026 at 12:12:42PM +0000, Jon Hunter wrote:
> ...

> Since this commit was added in Linux v6.18, I have been observing a suspend
> test failures on some of our boards. The suspend test suspends the devices
> for 20 secs and before this change the board would resume in about ~27 secs
> (including the 20 sec sleep). After this change the board would take over 80
> secs to resume and this triggered a failure.
> 
> Looking at the logs, I can see it is the NVMe device on the board that is
> having an issue, and I see the reset failing ...
> 
>  [  945.754939] r8169 0007:01:00.0 enP7p1s0: Link is Up - 1Gbps/Full -
>   flow control rx/tx
>  [ 1002.467432] nvme nvme0: I/O tag 12 (400c) opcode 0x9 (Admin Cmd) QID
>   0 timeout, reset controller
>  [ 1002.493713] nvme nvme0: 12/0/0 default/read/poll queues
>  [ 1003.050448] nvme nvme0: ctrl state 1 is not RESETTING
>  [ 1003.050481] OOM killer enabled.
>  [ 1003.054035] nvme nvme0: Disabling device after reset failure: -19
> 
> From the above timestamps the delay is coming from the NVMe. I see this
> issue on several boards with different NVMe devices and I can workaround
> this by disabling ASPM L0/L1 for these devices ...
> 
>  DECLARE_PCI_FIXUP_HEADER(0x15b7, 0x5011, quirk_disable_aspm_l0s_l1);
>  DECLARE_PCI_FIXUP_HEADER(0x15b7, 0x5036, quirk_disable_aspm_l0s_l1);
>  DECLARE_PCI_FIXUP_HEADER(0x1b4b, 0x1322, quirk_disable_aspm_l0s_l1);
>  DECLARE_PCI_FIXUP_HEADER(0xc0a9, 0x540a, quirk_disable_aspm_l0s_l1);
> 
> I am curious if you have seen any similar issues?
> 
> Other PCIe devices seem to be OK (like the realtek r8169) but just
> the NVMe is having issues. So I am trying to figure out the best way
> to resolve this?

For context, "this commit" refers to f3ac2ff14834, modified by
df5192d9bb0e:

  f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
  df5192d9bb0e ("PCI/ASPM: Enable only L0s and L1 for devicetree platforms")

The fact that this suspend issue only affects NVMe reminds me of the
code in dw_pcie_suspend_noirq() [1] that bails out early if L1 is
enabled because of some NVMe expectation:

  dw_pcie_suspend_noirq()
  {
    ...
    /*
     * If L1SS is supported, then do not put the link into L2 as some
     * devices such as NVMe expect low resume latency.
     */
    if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
      return 0;
    ...

That suggests there's some NVMe/ASPM interaction that the PCI core
doesn't understand yet.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/dwc/pcie-designware-host.c?id=v6.18#n1146

