Return-Path: <linux-arm-msm+bounces-90356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJ2AM1x+c2mQwwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 14:57:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 359C976884
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 14:57:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C861C3035D77
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 13:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C842D838C;
	Fri, 23 Jan 2026 13:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVj/Og6D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B95266565;
	Fri, 23 Jan 2026 13:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769176591; cv=none; b=lZmJ9dbLQVTlHlRSrdDdzaTZbgJWUgDrRMHfWh+7fPeSg8vkoxvbkPlf7c9pg7fSNoOzXL03Bq3TlGcgOq6VdJ4fXTMcVF5nQ2oyqXcFgg2jgscomw0VG2an64VhbHoLL12OAfN7URG36QrKpm/xpdW9z29MFw89RuRAGXyKvEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769176591; c=relaxed/simple;
	bh=GrLa4Ipr5uuNIx8FLflnc5DZHfapIQatDZ883pAbvVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rP/68Amsp/97ebVi9A5Z3y+IpLFDFftgze/STeaZ9l9GYV+edxVwOzLwGeO1+Licawn5LsCx/UxXCbQiILCo0O+4UoLXyj8kDadoI3M2U/7+TJIHKZ+BeBSmimS/wouMFdR1mN5qcxil9ZLkXl5JB3MqjyLzGNLV8MC169CAcd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fVj/Og6D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D6DEC19424;
	Fri, 23 Jan 2026 13:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769176591;
	bh=GrLa4Ipr5uuNIx8FLflnc5DZHfapIQatDZ883pAbvVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fVj/Og6Dsam87eSwc/fSklA6b6iRd/S5y9Cq/EqOYRct5TAlVy2wrfRwMPHan/EOO
	 xrBs8TR9glOT/Z0+/NpougmXdcqF/xEN4KJddW1acGRb1KMFKiTEu/zyCUCRFbg2HY
	 uWpFZjJfr4pETvIsuLWZb+1iiSzW/kTaxRLha/lsEODM5VZNlQAjbEjaGfONVlPpca
	 Bf59ufWV4Tbf7u5x8DXIDER1vjZPpsQ5BgHe4qO8HdlGuYymvZ9UFA5+NDAjF9QUs5
	 PWwLeDEGX5BDoDZNOEPfHzAu8A2uM2yNMdt4UCT3luCzpqa3AbBB4tK2vU0Jy+6WVp
	 K7TUPuejLZtwg==
Date: Fri, 23 Jan 2026 19:26:14 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	manivannan.sadhasivam@oss.qualcomm.com, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, "David E. Box" <david.e.box@linux.intel.com>, 
	Kai-Heng Feng <kai.heng.feng@canonical.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Chia-Lin Kao <acelan.kao@canonical.com>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org, 
	krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v2 1/2] PCI/ASPM: Override the ASPM and Clock PM states
 set by BIOS for devicetree platforms
Message-ID: <unc5zefwndgcv7wufaezz3gkg3qtaymkjlmymhyqdqwzn3wybl@ow2rhbyt772h>
References: <7306256a-b380-489b-8248-b774e6d3d80e@nvidia.com>
 <20260122152903.GA1247682@bhelgaas>
 <5z7c25nkb35prvax6vq6ud7eaeuhzsswbf7fqvmlgys3xftgwb@odocboejrdrv>
 <e44c330b-778b-4fa1-b678-fa909cc05b03@nvidia.com>
 <bf37b6a5-268d-4c07-a536-a826b3d5953b@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bf37b6a5-268d-4c07-a536-a826b3d5953b@nvidia.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90356-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,google.com,vger.kernel.org,linux.intel.com,canonical.com,gmail.com,kernel.dk,lst.de,grimberg.me,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[22];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 359C976884
X-Rspamd-Action: no action

+ Krishna

On Fri, Jan 23, 2026 at 10:55:28AM +0000, Jon Hunter wrote:
> 
> On 22/01/2026 19:14, Jon Hunter wrote:
> 
> ...
> 
> > > I think what is going on here is that since before commits
> > > f3ac2ff14834 and
> > > df5192d9bb0e, !pcie_aspm_enabled() check was passing as ASPM was not
> > > enabled for
> > > the device (and upstream port) and after those commits, this check is not
> > > passing and the NVMe driver is not shutting down the controller and
> > > expects the
> > > link to be in L0/L1ss. But the Tegra controller driver initiates L2/L3
> > > transition, and also turns off the device. So all the NVMe context
> > > is lost
> > > during suspend and while resuming, the NVMe driver got confused due
> > > to lost
> > > context.
> > > 
> > > Jon, could you please try the below hack and see if it fixes the issue?
> > > 
> > > diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
> > > index 0e4caeab739c..4b8d261117f5 100644
> > > --- a/drivers/nvme/host/pci.c
> > > +++ b/drivers/nvme/host/pci.c
> > > @@ -3723,7 +3723,7 @@ static int nvme_suspend(struct device *dev)
> > >           * state (which may not be possible if the link is up).
> > >           */
> > >          if (pm_suspend_via_firmware() || !ctrl->npss ||
> > > -           !pcie_aspm_enabled(pdev) ||
> > > +           pcie_aspm_enabled(pdev) ||
> > >              (ndev->ctrl.quirks & NVME_QUIRK_SIMPLE_SUSPEND))
> > >                  return nvme_disable_prepare_reset(ndev, true);
> > > This will confirm whether the issue is due to Tegra controller
> > > driver breaking
> > > the NVMe driver assumption or not.
> > 
> > Yes that appears to be working! I will test some more boards to confirm.
> 
> So yes with the above all boards appear to be working fine.
> 
> How is this usually coordinated between the NVMe driver and Host controller
> driver? It is not clear to me exactly where the problem is and if the NVMe
> is not shutting down, then what should be preventing the Host controller
> from shutting down.
> 

Well if the NVMe driver is not shutting down the device, then it expects the
device to be in APST (NVMe low power state if supported) state and retain all
the context across the suspend/resume cycle.

But if the host controller powers down the device, then during resume, the
device will start afresh and would've lost all the context (like queue info
etc..). So when the NVMe driver resumes, it would expect the device to retain
the context and try to use the device as such. But it won't work as the device
will be in an unconfigured state and you'll see failures as you reported.

Apparently, most host controller drivers never cared about it because either
they were not tested with NVMe or they haven't enabled ASPM before. So the NVMe
driver ended up shutting down the controller during suspend. But since we
started enabling ASPM by default since 6.18, this issue is being uncovered.

So to properly fix it, we need the controller drivers to perform below checks
for all devices under the Root bus(ses) before initiating D3Cold:

1. Check if the device state is D3Hot. If it is not D3Hot, then the device is
expected to stay in the current D-state by the client driver, so D3Cold should
not be initiated.

2. Check if the device is wakeup capable. If it is, then check if it can support
wakeup from D3Cold (with WAKE#).

Only if both conditions are satisfied for all the devices under the Root busses,
then the host controller driver should initiate D3Cold sequence.

Krishna is going to post a patch that performs the above checks for
pcie-designware-host driver. But since the above checks are platform agnostic,
we should introduce a helper and resuse it across other controllers as well.

Hope this clarifies.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

