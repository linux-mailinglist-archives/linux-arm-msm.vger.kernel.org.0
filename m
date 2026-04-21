Return-Path: <linux-arm-msm+bounces-103977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFZzNHCw52lZ/QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 19:14:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 547BD43DCA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 19:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B2AF308269D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 17:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E2CA3876B0;
	Tue, 21 Apr 2026 17:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ny2Iu0dI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4995637A481;
	Tue, 21 Apr 2026 17:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776791484; cv=none; b=ZI8YzxjqumgKOYMwxdgD+NAn6pIU0pjMYTiaIkLuxjydWq06FXFb+Dq1iCMTQYfPkpeReM/16svMg1wTxrShLA5hMdC+y6lH0IPD6QLJ1MgHdcWhFK56JV58wVpdoQDokITgYgQe7zVyUBRzz2Wb3RMGWl2I4Lm5nV0GT1O2lRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776791484; c=relaxed/simple;
	bh=AHtrmGhN5J/vsvtIwiAqM8EI8sFhj4a4bvN+jToBjkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rWfoH62TGhMErOqNq30JTtiFhGDK4vzADIT+gtQu4wTJ3jV8GbpjY9WwE4VbwiChLYUpcfllgn9owPekfKKrtEOOHLNp/bLRJSLU9tL1ghtz03KgY/8zpED8p3Ynuq8R+2fg2kNteq1nJw1iXaCHRp+JP0o2z5vYLSiBTo6YgzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ny2Iu0dI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 929F1C2BCB5;
	Tue, 21 Apr 2026 17:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776791483;
	bh=AHtrmGhN5J/vsvtIwiAqM8EI8sFhj4a4bvN+jToBjkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ny2Iu0dIkI+IAzLWnRo/dQolio56CfrRzGLDxapFHeL41W2BMt9kWPWyJLjLnvHZx
	 Hd9X0iNjCsOC5mp44673N+IozjhAKaDq2eD5jyrO2T45ddJGR1AAPz6nVXS4JLKUeo
	 4kGbwAFy5IdQpTBJYmAB8Ly/WLLteSrUx53c/pkB0hdA5W6PZC38h2FU21W/BkYBuk
	 7XlSdmytouADLU7flPD/JHXFoIroHSxKGS0iab3/1gE4l7BIJQFWMe8kUrVlLxl/TC
	 N1zk0bKShx46dzqnG2VGGlo51HCIevKmDI0qaSRWyyYT6RaNArKp2d4CG8c0qJQsJt
	 nAl3PhcPP3ezg==
Date: Tue, 21 Apr 2026 22:41:08 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, Keith Busch <kbusch@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-nvme@lists.infradead.org
Subject: Re: [PATCH 3/4] PCI: qcom: Indicate broken L1ss exit during resume
 from system suspend
Message-ID: <bkejoqdchyv55efsyl7o6b3ewiwaj5kbc2hgltxt5vwqdvt5yf@cxvwcjo5zcrp>
References: <zv3tl2cvlhpmwe5ikcszdneft4bjebqibrl6onbg7457vtzmmc@clh7nzgpeext>
 <20260420204915.GA231862@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260420204915.GA231862@bhelgaas>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103977-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 547BD43DCA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 03:49:15PM -0500, Bjorn Helgaas wrote:
> On Sat, Apr 18, 2026 at 11:09:11AM +0530, Manivannan Sadhasivam wrote:
> > On Fri, Apr 17, 2026 at 05:26:15PM -0500, Bjorn Helgaas wrote:
> > ...
> 
> > > Does L1.2 have to meet the advertised L1 Exit Latency?  I assume
> > > maybe it does because I don't see an exception for L1.x or any
> > > exit latencies advertised in the L1 PM Substates Capability.
> > 
> > As per my understanding, 'L1 Exit Latency' only covers ASPM L1
> > state, not L1ss.  Because, 'L1 Exit Latency' field exists even
> > before L1 PM Substates got introduced in r3.1. So it doesn't cover
> > L1.2 exit latency.
> > 
> > > Regardless, I'd be kind of surprised if *any* system could meet an
> > > L1.2 exit latency from a system suspend situation where PHY power
> > > is removed.  On ACPI systems, the OS doesn't know how to remove
> > > PHY power, so I don't think that situation can happen unless
> > > firmware is involved in the suspend.
> > 
> > Yes, you are right. Even for systems turning off the PHY completely,
> > they should have some mechanism to detect the CLKREQ# assert and
> > turn ON the PHY within the expected time.
> 
> What would the expected time be?
> 

That's mostly L10_REFCLK_ON + T_COMMONMODE. But nevertheless, the system wakeup
and controller driver resume() time would be far greater than it.

> > On our Qcom platforms, we do have some co-processors handling this
> > even before the OS wakesup.  But support for that co-processor is
> > currently not available in upstream and we don't know when it is
> > going to be added. Until then, we only have one option to not put
> > the link to L1ss during suspend and keep the devices into D3Cold to
> > achieve the SoC low power state.
> > 
> > > Maybe that's part of why pm_suspend_via_firmware() exists.  What
> > > if native host drivers just called pm_set_suspend_via_firmware()?
> > > After all, if they support suspend, they're doing things that are
> > > done by firmware on other systems.
> > 
> > No, that would be inappropriate. pm_set_suspend_via_firmware() is
> > supposed to be called only when the firmware is invoked at the end
> > of suspend. If OS handles everything and not the firmware, there is
> > no need to invoke this API.
> 
> This is part of my issue with the "pm_suspend_via_firmware()" name --
> it doesn't really matter whether the code is in the OS or in the
> firmware.  What matters is what the code *does* or is *allowed* to do.
> The native host bridge drivers do things that are done by firmware on
> ACPI systems, so the "via_firmware" part is not as clear as it once
> was.

I partly agree with you. But it should be noted that this API doesn't just apply
to PCI alone, but for the overall system. So even if the native host controller
drivers are present, the firmware might do something more at the end of suspend.
This is exactly what happens on ARM64 systems where PSCI firmware carries out
some activities at the end of suspend and we still have host controller drivers
doing some power management. Consequently, even if the host controller driver
wants to keep the bus active, the firmware might power down the whole PCI bus
for system power savings.

So you are right that host controller drivers do what the firmware might do on
ACPI based systems, but there could be some firmware involvement also.

For this series, I'm trying to keep the existing behavior intact and just
introduce one more check. But if we want to move away from
pm_suspend_via_firmware(), that could be done as a follow up series. Wdyt?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

