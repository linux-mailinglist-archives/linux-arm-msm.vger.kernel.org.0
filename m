Return-Path: <linux-arm-msm+bounces-90203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ArABj8pcmmadwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:42:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 753C4676D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:42:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 86B907A2819
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 13:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9A02E7BDE;
	Thu, 22 Jan 2026 13:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vu/vaqZq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F752DC763;
	Thu, 22 Jan 2026 13:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769087844; cv=none; b=ondynYT0SVmdcmcj7HUsiePaVvft+/RD96lQGjPYYj5HnvY5xVgLzNVCQjnTDChfQjoV3t/G1GwawDF8IjXbPkIlMfkGKRMq+0BE86yv2pHSG8+w0WbjUo4udoxgvsv6PBHM2yysP8w5/LPbLo7HAqjOKo3qs4OZif6l3oRUs4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769087844; c=relaxed/simple;
	bh=BboKZC7lJjpQsIwQ8SNg8wIaBhGEiugaek244I4OWiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=axce/cRFbAbu/f+2xnPyjwcf7JwoReubBmAI4tJHn+le0r6PZfyKRHRL/PoGk9yVggrajf0APSSLJcue9fdLASLt4261laclCS7Xnpybq9kqZuLrcVcWL4mrr/RCZe8UQ5dp0LmTePXurDiC93U+NFcdBqHgrve+6JuE4DFj45I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vu/vaqZq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8657CC116C6;
	Thu, 22 Jan 2026 13:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769087844;
	bh=BboKZC7lJjpQsIwQ8SNg8wIaBhGEiugaek244I4OWiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vu/vaqZqS7AZZ1hiNQ//DWxncpJcqp2APCwNpEoAS7w06EwvT/CQ5oEesuZqpdj9U
	 NH/O2YuNqLMSPoovHGJOBeyu+n7T6JAjqs03HQ+hJEoWLkgLYXpACTV9oPqc3duejH
	 ZTj4T0eiyANOjllj6ZAFaN3kUbn3Y24bDKdXLxBL2xGNhSK8KUDqSa9bMhcrXscx/x
	 74/Jq52YNXz0zYUu2mqo+LtqF+5bBjdmtbKFodXSQdRBSMpIn8PIS+IaXlEVM5hv0S
	 W8TiSMPcncJvueHm9C+/KHyRuHiPojkccruUAfO9YeV0kaSK9J3COpudAS+Q9HEL6Y
	 VtcURRO5cyDbQ==
Date: Thu, 22 Jan 2026 18:47:09 +0530
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
Message-ID: <76sr3yuwdaon3o3u5dfjycwlxhxcarid5tevgtao6aaapvwbzd@e7bam35dzt3k>
References: <20250922-pci-dt-aspm-v2-0-2a65cf84e326@oss.qualcomm.com>
 <20250922-pci-dt-aspm-v2-1-2a65cf84e326@oss.qualcomm.com>
 <7306256a-b380-489b-8248-b774e6d3d80e@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7306256a-b380-489b-8248-b774e6d3d80e@nvidia.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90203-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,google.com,kernel.org,vger.kernel.org,linux.intel.com,canonical.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 753C4676D3
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 12:12:42PM +0000, Jon Hunter wrote:
> Hi Manivannan,
> 
> On 22/09/2025 17:16, Manivannan Sadhasivam via B4 Relay wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > 
> > So far, the PCI subsystem has honored the ASPM and Clock PM states set by
> > the BIOS (through LNKCTL) during device initialization, if it relies on the
> > default state selected using:
> > 
> > * Kconfig: CONFIG_PCIEASPM_DEFAULT=y, or
> > * cmdline: "pcie_aspm=off", or
> > * FADT: ACPI_FADT_NO_ASPM
> > 
> > This was done conservatively to avoid issues with the buggy devices that
> > advertise ASPM capabilities, but behave erratically if the ASPM states are
> > enabled. So the PCI subsystem ended up trusting the BIOS to enable only the
> > ASPM states that were known to work for the devices.
> > 
> > But this turned out to be a problem for devicetree platforms, especially
> > the ARM based devicetree platforms powering Embedded and *some* Compute
> > devices as they tend to run without any standard BIOS. So the ASPM states
> > on these platforms were left disabled during boot and the PCI subsystem
> > never bothered to enable them, unless the user has forcefully enabled the
> > ASPM states through Kconfig, cmdline, and sysfs or the device drivers
> > themselves, enabling the ASPM states through pci_enable_link_state() APIs.
> > 
> > This caused runtime power issues on those platforms. So a couple of
> > approaches were tried to mitigate this BIOS dependency without user
> > intervention by enabling the ASPM states in the PCI controller drivers
> > after device enumeration, and overriding the ASPM/Clock PM states
> > by the PCI controller drivers through an API before enumeration.
> > 
> > But it has been concluded that none of these mitigations should really be
> > required and the PCI subsystem should enable the ASPM states advertised by
> > the devices without relying on BIOS or the PCI controller drivers. If any
> > device is found to be misbehaving after enabling ASPM states that they
> > advertised, then those devices should be quirked to disable the problematic
> > ASPM/Clock PM states.
> > 
> > In an effort to do so, start by overriding the ASPM and Clock PM states set
> > by the BIOS for devicetree platforms first. Separate helper functions are
> > introduced to override the BIOS set states by enabling all of them if
> > of_have_populated_dt() returns true. To aid debugging, print the overridden
> > ASPM and Clock PM states as well.
> > 
> > In the future, these helpers could be extended to allow other platforms
> > like VMD, newer ACPI systems with a cutoff year etc... to follow the path.
> > 
> > Link: https://lore.kernel.org/linux-pci/20250828204345.GA958461@bhelgaas
> > Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > Link: https://patch.msgid.link/20250916-pci-dt-aspm-v1-1-778fe907c9ad@oss.qualcomm.com
> > ---
> >   drivers/pci/pcie/aspm.c | 42 ++++++++++++++++++++++++++++++++++++++++--
> >   1 file changed, 40 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
> > index 919a05b9764791c3cc469c9ada62ba5b2c405118..cda31150aec1b67b6a48b60569222ea3d1c3d41f 100644
> > --- a/drivers/pci/pcie/aspm.c
> > +++ b/drivers/pci/pcie/aspm.c
> > @@ -15,6 +15,7 @@
> >   #include <linux/math.h>
> >   #include <linux/module.h>
> >   #include <linux/moduleparam.h>
> > +#include <linux/of.h>
> >   #include <linux/pci.h>
> >   #include <linux/pci_regs.h>
> >   #include <linux/errno.h>
> > @@ -235,13 +236,15 @@ struct pcie_link_state {
> >   	u32 aspm_support:7;		/* Supported ASPM state */
> >   	u32 aspm_enabled:7;		/* Enabled ASPM state */
> >   	u32 aspm_capable:7;		/* Capable ASPM state with latency */
> > -	u32 aspm_default:7;		/* Default ASPM state by BIOS */
> > +	u32 aspm_default:7;		/* Default ASPM state by BIOS or
> > +					   override */
> >   	u32 aspm_disable:7;		/* Disabled ASPM state */
> >   	/* Clock PM state */
> >   	u32 clkpm_capable:1;		/* Clock PM capable? */
> >   	u32 clkpm_enabled:1;		/* Current Clock PM state */
> > -	u32 clkpm_default:1;		/* Default Clock PM state by BIOS */
> > +	u32 clkpm_default:1;		/* Default Clock PM state by BIOS or
> > +					   override */
> >   	u32 clkpm_disable:1;		/* Clock PM disabled */
> >   };
> > @@ -373,6 +376,18 @@ static void pcie_set_clkpm(struct pcie_link_state *link, int enable)
> >   	pcie_set_clkpm_nocheck(link, enable);
> >   }
> > +static void pcie_clkpm_override_default_link_state(struct pcie_link_state *link,
> > +						   int enabled)
> > +{
> > +	struct pci_dev *pdev = link->downstream;
> > +
> > +	/* Override the BIOS disabled Clock PM state for devicetree platforms */
> > +	if (of_have_populated_dt() && !enabled) {
> > +		link->clkpm_default = 1;
> > +		pci_info(pdev, "Clock PM state overridden: ClockPM+\n");
> > +	}
> > +}
> > +
> >   static void pcie_clkpm_cap_init(struct pcie_link_state *link, int blacklist)
> >   {
> >   	int capable = 1, enabled = 1;
> > @@ -395,6 +410,7 @@ static void pcie_clkpm_cap_init(struct pcie_link_state *link, int blacklist)
> >   	}
> >   	link->clkpm_enabled = enabled;
> >   	link->clkpm_default = enabled;
> > +	pcie_clkpm_override_default_link_state(link, enabled);
> >   	link->clkpm_capable = capable;
> >   	link->clkpm_disable = blacklist ? 1 : 0;
> >   }
> > @@ -788,6 +804,26 @@ static void aspm_l1ss_init(struct pcie_link_state *link)
> >   		aspm_calc_l12_info(link, parent_l1ss_cap, child_l1ss_cap);
> >   }
> > +static void pcie_aspm_override_default_link_state(struct pcie_link_state *link)
> > +{
> > +	struct pci_dev *pdev = link->downstream;
> > +	u32 override;
> > +
> > +	/* Override the BIOS disabled ASPM states for devicetree platforms */
> > +	if (of_have_populated_dt()) {
> > +		link->aspm_default = PCIE_LINK_STATE_ASPM_ALL;
> > +		override = link->aspm_default & ~link->aspm_enabled;
> > +		if (override)
> > +			pci_info(pdev, "ASPM states overridden: %s%s%s%s%s%s\n",
> > +				 (override & PCIE_LINK_STATE_L0S) ? "L0s+, " : "",
> > +				 (override & PCIE_LINK_STATE_L1) ? "L1+, " : "",
> > +				 (override & PCIE_LINK_STATE_L1_1) ? "L1.1+, " : "",
> > +				 (override & PCIE_LINK_STATE_L1_2) ? "L1.2+, " : "",
> > +				 (override & PCIE_LINK_STATE_L1_1_PCIPM) ? "L1.1 PCI-PM+, " : "",
> > +				 (override & PCIE_LINK_STATE_L1_2_PCIPM) ? "L1.2 PCI-PM+" : "");
> > +	}
> > +}
> > +
> >   static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
> >   {
> >   	struct pci_dev *child = link->downstream, *parent = link->pdev;
> > @@ -868,6 +904,8 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
> >   	/* Save default state */
> >   	link->aspm_default = link->aspm_enabled;
> > +	pcie_aspm_override_default_link_state(link);
> > +
> >   	/* Setup initial capable state. Will be updated later */
> >   	link->aspm_capable = link->aspm_support;
> 
> 
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

Marek reported a similar issue on ARM Juno board [1] on which one of the switch
downstream port failed to come up while *entering* system suspend. But I was
clueless as to why the device fails to function only while entering system
suspend and not during runtime. I suspect something is going wrong in the
suspend path.

In your case, looks like the device is failing while resuming from suspend. Did
you see any error log during suspend as well?

> Other PCIe devices seem to be OK (like the realtek r8169) but just the NVMe
> is having issues. So I am trying to figure out the best way to resolve this?
> 

First let's try to isolate the issue to L0s or L1. Can you try disabling L0s
first, then L1?

I will also inspect the suspend/resume path in the meantime.

- Mani

[1] https://lore.kernel.org/linux-pci/cae5cb24-a8b0-4088-bacd-14368f32bdc5@samsung.com/

-- 
மணிவண்ணன் சதாசிவம்

