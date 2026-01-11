Return-Path: <linux-arm-msm+bounces-88385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E97D8D0E6CC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 10:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03DD0300D159
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 09:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B6D61DF755;
	Sun, 11 Jan 2026 09:06:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C2A1643B;
	Sun, 11 Jan 2026 09:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768122381; cv=none; b=j2eNGhFKzOIm5PIswyISEzNlqBnc8PZnQLutRH9ASE8ENfdXutUanETyYgVtUbrLORxBa/ttk7MkX2qL5fX5nC3FruSmQW5v1kMHJRG94DkWFL1kxyYzL4Z//r/DxZyeiT010qm3FlAWzsqb6SWxiHqhvuH92kNLsUjDzgHujyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768122381; c=relaxed/simple;
	bh=OY7NDRZGkvXH5t60Nmww0imKSgEi4lVaX7yZCdKXyCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4XM2QN6LhGD+v/FTBsqPzjTJ+UElK8rCVCwB6uYmHfC7DsmhQfbdV6j3qNrPOAuv5KW4Z0KUII6gSzivYhs9aNw1AqqROuUQ9aomsULdoQL7ZqqN5Vs0NgY9zleAaRqOXIrWwJ1/9747xZyRctFZ1qhaEN5IYx91lfxrEXElFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D90BC4CEF7;
	Sun, 11 Jan 2026 09:06:18 +0000 (UTC)
Date: Sun, 11 Jan 2026 14:36:07 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/1] soc: qcom: rpmh-rsc: Register s2idle_ops to
 indicate s2ram behavior in s2idle
Message-ID: <5iw2uj5d76cfl6jgvpio6qdqf3nvwicgmqdd7agsdbjghpowww@kxxkoeadfr3r>
References: <20260101165158.7251-1-manivannan.sadhasivam@oss.qualcomm.com>
 <lieekisbc2xe7elfh7edruw5csyw3vpqcyf6dc3fghe3mdqpph@fu2ofnbr5gbt>
 <filahffwq5th2if7jm3ytpea3pqblracdcl7pkp3bg3wyqg3by@qdxvwzt7a2fd>
 <l4v4gqv36nwdhvc2jgyvonnusakkd7kfrrecetlxsv74agemin@txdp7tzwnwpp>
 <sge2mznbz3wufvyisq4xll33ocr7kxz5jvv2ufqjfxcgapp3pd@6pkauvuuv7jm>
 <75av4b6g4slterg5ctdxkevaxvjsymealok47x7tjwv5etqwmj@rotc7nfhhgi5>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75av4b6g4slterg5ctdxkevaxvjsymealok47x7tjwv5etqwmj@rotc7nfhhgi5>

On Fri, Jan 09, 2026 at 01:36:32PM -0600, Bjorn Andersson wrote:
> On Thu, Jan 08, 2026 at 10:55:16AM +0530, Manivannan Sadhasivam wrote:
> > On Tue, Jan 06, 2026 at 11:21:59AM -0600, Bjorn Andersson wrote:
> > > On Mon, Jan 05, 2026 at 10:27:41PM +0530, Manivannan Sadhasivam wrote:
> > > > On Mon, Jan 05, 2026 at 08:04:54AM -0600, Bjorn Andersson wrote:
> > > > > On Thu, Jan 01, 2026 at 10:21:57PM +0530, Manivannan Sadhasivam wrote:
> > > > > > Hi,
> > > > > > 
> > > > > 
> > > > > Many thanks for looking into this problem, Mani.
> > > > > 
> > > > > > This is just an attempt to let the device drivers know of the quirky platform
> > > > > > behavior of mimicking s2ram in s2idle for older Qcom SoCs (pre-Hamoa and
> > > > > > non-chromebooks) using RPMh. This information is important for the device
> > > > > > drivers as they need to prepare for the possible power loss during system
> > > > > > suspend by shutting down or resetting the devices.
> > > > > > 
> > > > > 
> > > > > Is this really what happens? What _exactly_ is the purpose of
> > > > > pm_suspend_via_firmware() and pm_resume_via_firmware()?
> > > > > 
> > > > > The kernel-doc for pm_suspend_via_firmware() states "return true if
> > > > > platform firmware is going to be invoked at end of system suspend...in
> > > > > order to complete it".
> > > > > 
> > > > > To me this indicates that the purpose of this mechanism is to signal
> > > > > Linux that we're running on a target where platform firmware will cut
> > > > > power once we reach the bottom of the suspend chain, so the individual
> > > > > drivers has to save/restore state in order to prepare for this.
> > > > > 
> > > > 
> > > > Yes!
> > > > 
> > > 
> > > But that's not the case here. In fact, iirc even on Makena the PCIe
> > > controller is retained, it's just the link that can't be sustained
> > > without CX - but I might misremember.
> > > 
> > 
> > There is no MX retention for PCIe on Makena.
> > 
> 
> Okay, thanks for correcting my memory.
> 
> [..]
> > > > We tried to fix the issue in the NVMe driver so far, but all efforts ended up in
> > > > vain. NVMe maintainers preferred to rely on some PCI/PM APIs for this. Initially
> > > > I looked into creating one such API, but then figured out that I can just make
> > > > use of this global flag and not touch the NVMe driver at all.
> > > > 
> > > 
> > > At the same time acpi_storage_d3() tells me that this problem is already
> > > accepted by the community, we just don't have a way to signal the same
> > > in our system.
> > > 
> > 
> > There are many solutions initially accepted for x86/ACPI which are not getting
> > accepted now.
> > 
> 
> It's inspiring to see the whole x86 ecosystem moving beyond such issues.
> 
> > > > This worked well for s2ram, so I resent a patch submitted by Konrad in 2024 [1].
> > > > But for s2idle and Makena, I thought I could reuse the same global flag and
> > > > achieve the same net result.
> > > > 
> > > 
> > > My problem remains that we're using the global "power to all IP-blocks
> > > will be lost"-flag to say "on Makena, the PCIe controller doesn't retain
> > > state in low power mode", to a single driver.
> > > 
> > 
> > I agree with your concern. If not global, we need to either fix it in PCI core
> > or in the NVMe driver. Unfortunately, for an one-off issue like this, making
> > change in both proves difficult. As you may know, our initial work was to get it
> > fixed in the NVMe driver, but that didn't fly.
> > 
> 
> The fact that the PCIe controller is "broken" does not imply that the
> whole SoC is broken, and claiming so will come with side effects.
> 

I don't "disagree" with you.

> [..]
> > > > > Do we force all "pre-Hamoa" targets into this same behavior? Or do we
> > > > > have a different flag for saying "at the end of suspend power will be
> > > > > lost" there?
> > > > > 
> > > > 
> > > > If you don't agree with the above reasoning, I can just limit its usage to
> > > > Makena and s2ram.
> > > > 
> > > 
> > > I don't think I have all the details, but if we're saying that Makena is
> > > broken and need special treatment in NVMe, it would be better to say
> > > just that, with a patch in check_vendor_combination_bug()
> > > 
> > > /* Qualcomm SC8280XP can not enter low-power with PCIe link active */
> > > if (of_machine_is_compatible("qcom,sc8280xp"))
> > > 	return NVME_QUIRK_SIMPLE_SUSPEND;
> > > 
> > 
> > I tried it in multiple attempts. Recent one is this:
> > https://lore.kernel.org/all/20250126050309.7243-1-manivannan.sadhasivam@linaro.org/
> > 
> > And here is the reply:
> > https://lore.kernel.org/all/20250210040446.GA2823@lst.de/
> 
> I presume "core" doesn't necessarily imply "system-wide", but you know
> the PCIe stack better than me, so I'm not sure where in the "core" this
> would be better implemented.
> 

"Core" here is just the PCI stack. If the stack can detect that this platform
Root Complex is broken, the it may possible indicate that to its client drivers.

> > 
> > > 
> > > Alternatively, make it possible to set StorageD3Enable in DeviceTree.
> > > This flag exists in ACPI for a reason, why wouldn't we see the same
> > > problems when describing the system using DeviceTree?
> > > 
> > 
> > This is not a ACPI spec defined object, but just a MSFT way of telling the OS
> > when to enter D3 (D3Hot or D3Cold) for storage devices. If we want to go with
> > the DT property, it has to be something like 'qcom,no-retention'. I don't think
> > a generic property makes sense here.
> > 
> 
> Unless I'm reading the nvme driver incorrectly, I don't think the need
> for such property is vendor-specific. But conceptually it doesn't really
> belong in system description, given that the user might swap NVMe and
> introduce/remove the need for this quirk.
> 

Here, I meant "Qcom" as the vendor for the property, not NVMe vendor. Since this
behavior of loosing context during s2idle is only specific to Qcom, that too
only for a specific SoC, if we were going for a DT property, I will use Qcom
specific property to mark the RC as broken in some way.

> > Even then, we would need a PCI API to translate that for client drivers. I can
> > look into this direction.
> > 
> 
> I hope that we can agree that this is a property of the PCIe controller,
> for Makena. If we can't move the problem with NVMe on Makena out of the
> way of progress, how about we work our way around it (for now
> hopefully...)?
> 
> Change qcom_pcie_suspend_noirq() to explicitly carry a vote for CX (e.g.
> using the bw-vote as today), describe the problem explictily in a
> comment, and then move forward with releasing the CX vote for all other
> targets.
> 

Sure. That should work as a last resort.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

