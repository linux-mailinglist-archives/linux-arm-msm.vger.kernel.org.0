Return-Path: <linux-arm-msm+bounces-103566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFLvG4yz4mkl9QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 00:26:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 175A241EE12
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 00:26:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 23CB130087C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 22:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815853264C0;
	Fri, 17 Apr 2026 22:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k56JV38k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD8E282F2C;
	Fri, 17 Apr 2026 22:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776464777; cv=none; b=mW4JDCymfgUtGTp1mI0lCptJCLLrRB6LjtMLnHI8u/DdxkI1KiFjqT2VAZk9UYz9ySeLth/1diVu4X2uyg/+Ch0PsxTf/YM9+MTErT8Ow9/SqU+lboeSf6FqeFw4U2wxmDGH4Ex6O2fxzvsN/aQJ02tp/Cmm1l4J9AuUC3ZZ5Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776464777; c=relaxed/simple;
	bh=ldDrCZLNDA6+Ze7JqHXF2mgFMD1/O2u3aOg33Abpsds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=eIpfH4/aKENKfgcFuZAHjfsKve86Bq7QjgFxOweAU8XfxWAKH1sphbHaUEKvlS7h9DRF4FFh5b2DliZmsbRLk2nrrtDkWdizNbY2O/PDh5mk/nYX+xa9UIkd6r2coSNLKlT/qr49T/PMpnNo0/dI29k9H7CoEoGEPJFiZav+13s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k56JV38k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D67A0C19425;
	Fri, 17 Apr 2026 22:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776464777;
	bh=ldDrCZLNDA6+Ze7JqHXF2mgFMD1/O2u3aOg33Abpsds=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=k56JV38kBfvzqBIsN8JWl0Oujn12TZ287FU/V6ljKbTCA3FwTXkCcL5lEOyQu9Csg
	 5XRwUUwXmSBrZsAU7UqtNJbFHgfcr4QePzpqz5ifIEgc3MW0Q6PhGH3Kh5bHTGTZHV
	 FSzjtKEkUXiNFDZ+4ROvgL6eUv3l/d/dxwFNaIeZDUZZegGDxOh6k9yhkj++tdO+hh
	 2oWSEgXOrBGlBoatS6GYN1fxHBxyCReEpvSnRBNmjG9thinHga388zSjN4n3sgXq0h
	 tVBT4yHApURwjzkixaE9kJ/k4TTbHZDtR9v9uOFCKke4JGdVgWNq7HyERrbClt4wRb
	 5YdzUqPFtBFfg==
Date: Fri, 17 Apr 2026 17:26:15 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH 3/4] PCI: qcom: Indicate broken L1ss exit during resume
 from system suspend
Message-ID: <20260417222615.GA97425@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vji2jty2pqerse6g66pavrt7e7oq3bax4m6sobp5wxew6xwv6d@r5lbv35klz6b>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103566-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 175A241EE12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 05:36:42PM +0530, Manivannan Sadhasivam wrote:
> On Thu, Apr 16, 2026 at 02:20:00PM -0500, Bjorn Helgaas wrote:
> > On Tue, Apr 14, 2026 at 09:29:41PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > > 
> > > Qcom PCIe RCs can successfully exit from L1ss during OS runtime.
> > > However, during system suspend, the Qcom PCIe RC driver may
> > > remove all resource votes and turns off the PHY to maximize
> > > power savings.
> > > 
> > > Consequently, when the host is in system suspend with the link
> > > in L1ss and the endpoint asserts CLKREQ#, the OS must first wake
> > > up and the RC driver must restore the PHY and enable the refclk.
> > > This recovery process causes the strict L1ss exit latency time
> > > to be exceeded. (If the RC driver were to retain all votes
> > > during suspend, L1ss exit would succeed without issue, but at
> > > the expense of higher power consumption).
> > 
> > I don't think the link can be in L1.x if the PHY is turned off,
> > can it?  I assume if the PHY is off, the link would be in L2 (if
> > aux power is available) or L3.
> 
> As per the spec, if the link is in L1.2, the entire analog circuitry
> of the PHY can be powered off and that's what I meant here. The
> LTSSM state would be preserved by the MAC layer, whose context is
> always retained.
> 
> The only problem is that, CLKREQ# is routed to an Always-on-Domain
> (AON) inside the SoC. So when the endpoint asserts CLKREQ#, AON
> wakes up the SoC and later the PCIe controller driver turns ON the
> PHY. But by that time, the L1ss exit latency would've elapsed,
> causing LDn.
> 
> > L2 and L3 both correspond to the downstream device being in D3cold
> > (PCIe r7.0, sec 5.3.2), so I assume this is a reset as far as the
> > device is concerned, and we need all the delays associated with
> > reset and the D3cold -> D0 transition.
> > 
> > > This latency violation leads to an L1ss exit timeout, followed
> > > by a Link Down (LDn) condition during resume. This LDn can crash
> > > the OS if the endpoint hosts the RootFS, and for other types of
> > > devices, it may result in a full device reset/recovery.
> > 
> > What does "L1SS exit timeout" mean in PCIe terms?  Is there some
> > event (Message, interrupt, etc) that is triggered by the timeout?
> 
> By 'L1ss exit timeout' I meant the failure to move to L0 state post
> L1.2 exit.  During L1.2 exit, the endpoint expects the refclk and
> common mode voltage to be restored within the negotiated time. Per
> spec, r7.0, sec 5.5.3.3.1, Exit from L1.2:
> 
> ```
> Next state is L1.0 after waiting for TPOWER_ON
> 
> * Common mode is permitted to be established passively during L1.0,
> and actively during Recovery. In order to ensure common mode has
> been established, the Downstream Port must maintain a timer, and the
> Downstream Port must continue to send TS1 training sequences until a
> minimum of TCOMMONMODE has elapsed since the Downstream Port has
> started transmitting TS1 training sequences and has detected
> electrical idle exit on any Lane of the configured Link.
> ```
> 
> So if this condition is not satisfied, then the link would move to
> the LDn state and that's the only event triggered to the OS.
> 
> > > So to ensure that the client drivers can properly handle this
> > > scenario, let them know about this platform limitation by
> > > setting the 'pci_host_bridge::broken_l1ss_resume' flag.
> > 
> > I don't see how this means L1SS is broken.  If the device is
> > effectively reset, of course we can't go from L1.x to L0 because
> > we didn't start from L1.x.
> 
> From the OS perspective, the link would still be in L1ss and not
> expected to move to L2/L3 during suspend/resume, since that
> transition is controlled by the OS itself. But when the OS resumes,
> the link would go to LDn state and it can only be brought back to
> L0, after a complete reset.

Thanks for the background.  It would help a lot if I had more of a
hardware background!

Does L1.2 have to meet the advertised L1 Exit Latency?  I assume maybe
it does because I don't see an exception for L1.x or any exit
latencies advertised in the L1 PM Substates Capability.

Regardless, I'd be kind of surprised if *any* system could meet an
L1.2 exit latency from a system suspend situation where PHY power is
removed.  On ACPI systems, the OS doesn't know how to remove PHY
power, so I don't think that situation can happen unless firmware
is involved in the suspend.

Maybe that's part of why pm_suspend_via_firmware() exists.  What if
native host drivers just called pm_set_suspend_via_firmware()?  After
all, if they support suspend, they're doing things that are done by
firmware on other systems.

