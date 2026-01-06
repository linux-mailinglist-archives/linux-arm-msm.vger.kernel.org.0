Return-Path: <linux-arm-msm+bounces-87727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7D5CFA179
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 19:23:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C287B3254BA1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 17:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852A434FF71;
	Tue,  6 Jan 2026 17:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMA5tiSm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEC534FF6B;
	Tue,  6 Jan 2026 17:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767720122; cv=none; b=AStmTGxE61OvpdYlSvw+xfkQs/BRXzLXoKfk1nzg0wAjhZWMYdiTFWuzhK5V/4dW377kJxtpy+0wvL0Ai+iQ233kfYpGlryD+LxOFP7yvSAd0pUfwEnrOoasd6/cErw4dfUlzD4DZWcv9sAvaK5ccop6HwbHlbZtogLDpEfiAlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767720122; c=relaxed/simple;
	bh=6rO/CbNS3QE/fv2gRGzpIQZLpai/OBopbtbeBLWPnB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kidNNerpWlzD0r02r5g92BSgqtgwbupLm6Q2Fw2hbCf8mYNyC81U/7xM5Mnd2f1jt/F8bZcu7azXDYzpbwawBzApRh1PmNCIofCa8yU1w93xewfzdkB2JhFU1MDV+0VRHwcHShRA2qlk18nVgqI02KJoAQ6n0Y/XKZ3M7A+8VNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMA5tiSm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F407C16AAE;
	Tue,  6 Jan 2026 17:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767720122;
	bh=6rO/CbNS3QE/fv2gRGzpIQZLpai/OBopbtbeBLWPnB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YMA5tiSmVDsaih+qB9hQ1lMhvDTeP5jDvPbtnjTUyAm/9ML3UDMtcLc8ZOH+MBTw8
	 ByON4Dmj3Juyd1nb1mwz4MRSt16Lv2TaCMsufoVa4iKQRTLUlrIecO/KlIFa/p66Rb
	 fQldP/PKDfafkweKcBqZFoED0LsuhFNhEaO2aFbJMRqX9EF+I9E4v/JSBfdmmritRW
	 v+ds8O9xfQlXBP5YxDuZk3ENqup5tEI7t6S2v6Xar0/52B/zK+jrtPFMezJ8djGDqZ
	 YcRk+OpUJrImW7ilNS6ep0LJ4VDFeARCbig6MJi1gelSKvs6EyraHfZ+F0ACj9TmjP
	 KtkISBnTlHLRA==
Date: Tue, 6 Jan 2026 11:21:59 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/1] soc: qcom: rpmh-rsc: Register s2idle_ops to
 indicate s2ram behavior in s2idle
Message-ID: <l4v4gqv36nwdhvc2jgyvonnusakkd7kfrrecetlxsv74agemin@txdp7tzwnwpp>
References: <20260101165158.7251-1-manivannan.sadhasivam@oss.qualcomm.com>
 <lieekisbc2xe7elfh7edruw5csyw3vpqcyf6dc3fghe3mdqpph@fu2ofnbr5gbt>
 <filahffwq5th2if7jm3ytpea3pqblracdcl7pkp3bg3wyqg3by@qdxvwzt7a2fd>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <filahffwq5th2if7jm3ytpea3pqblracdcl7pkp3bg3wyqg3by@qdxvwzt7a2fd>

On Mon, Jan 05, 2026 at 10:27:41PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Jan 05, 2026 at 08:04:54AM -0600, Bjorn Andersson wrote:
> > On Thu, Jan 01, 2026 at 10:21:57PM +0530, Manivannan Sadhasivam wrote:
> > > Hi,
> > > 
> > 
> > Many thanks for looking into this problem, Mani.
> > 
> > > This is just an attempt to let the device drivers know of the quirky platform
> > > behavior of mimicking s2ram in s2idle for older Qcom SoCs (pre-Hamoa and
> > > non-chromebooks) using RPMh. This information is important for the device
> > > drivers as they need to prepare for the possible power loss during system
> > > suspend by shutting down or resetting the devices.
> > > 
> > 
> > Is this really what happens? What _exactly_ is the purpose of
> > pm_suspend_via_firmware() and pm_resume_via_firmware()?
> > 
> > The kernel-doc for pm_suspend_via_firmware() states "return true if
> > platform firmware is going to be invoked at end of system suspend...in
> > order to complete it".
> > 
> > To me this indicates that the purpose of this mechanism is to signal
> > Linux that we're running on a target where platform firmware will cut
> > power once we reach the bottom of the suspend chain, so the individual
> > drivers has to save/restore state in order to prepare for this.
> > 
> 
> Yes!
> 

But that's not the case here. In fact, iirc even on Makena the PCIe
controller is retained, it's just the link that can't be sustained
without CX - but I might misremember.

> > But if I understand the bottom of the s2idle sequence, is that all we do
> > is enter idle and the kernel will pick the lowest idle idle-state, which
> > based on the psci-suspend-param will signal the system that the
> > resources needed by the CPU subsystem can be powered down.
> > 
> > But it's not really powering things down, it's releasing the vote of the
> > CPU subsystem - which if the driver didn't vote means power will be
> > lost. So for any drivers that relies on the implicit vote from the CPU
> > subsystem to sustain their operation this flag is correct.
> > 
> > For many IP blocks, the register state and/or some functionality will be
> > retained in this state - e.g. register state will be retained, or
> > functionality will be sustained by sleep power. So they can safely
> > ignore the flag.
> > 
> > In some cases state isn't retained when this happens, so e.g. PHY
> > drivers does perform save and restore operations, despite the flag
> > currently not indicating that power will be lost.
> > 
> > 
> > What's unique with Makena in this regard, is that in this state the PCIe
> > link can not be sustained, so we either need to tear things down, or the
> > PCIe controller needs to vote directly on those resources it need in
> > order to sustain its link.
> > 
> > It seems to me that this patch uses the global flag, in order to signal
> > the PCIe stack specifically, that it needs to save/restore state. I'm
> > concerned that support for retaining state in the PCIe subsystem isn't a
> > global question.
> > 
> 
> No, this is not a PCIe stack limitation, but PCIe client driver limitation
> like NVMe. PCIe stack does save and restore the device config space during
> system suspend (even during runtime suspend sometimes).
> 
> But the NVMe driver will only shutdown the controller if this global flag is set
> or other conditions are satisfied. Otherwise, it will just park the device in
> low power state. So if the target enters s2ram (deep sleep) or CXPC in Makena,
> controller context will be lost, leading to resume failure.
> 

So, you're saying that this is the only PCIe client driver that needs
this special handling?

> We tried to fix the issue in the NVMe driver so far, but all efforts ended up in
> vain. NVMe maintainers preferred to rely on some PCI/PM APIs for this. Initially
> I looked into creating one such API, but then figured out that I can just make
> use of this global flag and not touch the NVMe driver at all.
> 

At the same time acpi_storage_d3() tells me that this problem is already
accepted by the community, we just don't have a way to signal the same
in our system.

> This worked well for s2ram, so I resent a patch submitted by Konrad in 2024 [1].
> But for s2idle and Makena, I thought I could reuse the same global flag and
> achieve the same net result.
> 

My problem remains that we're using the global "power to all IP-blocks
will be lost"-flag to say "on Makena, the PCIe controller doesn't retain
state in low power mode", to a single driver.

And in particular, when taking DeepSleep into consideration, there's
going to be a lot of work performed by drivers when "power to all
IP-blocks will be lost".

> [1] https://lore.kernel.org/all/20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com
> 
> > 
> > 
> > Then parallel to this discussion, we have the actual s2ram feature
> > showing up on some targets, where the SoC actually do power off. Here
> > the automatic retaining of register and functional state is not going to
> > happen - device drivers must save and restore state.
> > 
> 
> AFAIK, atleast on compute targets, s2ram == s2idle + CXPC. Only difference is
> that the system wide low power mode transition will happen in PSCI
> SYSTEM_SUSPEND phase as opposed to CPU_SUSPEND.
> 

But this means that our normal assumptions about retention holds, except
for PCIe on Makena.

> Only on auto targets, we have the 'deep sleep' feature which behaves like x86
> s2ram i.e., turning off power to most of the components. But from Linux POV,
> both are just s2ram. This is one more motivation for me to use this global flag
> for s2ram.
> 

Not only on auto targets, the DeepSleep feature exists in IoT and other
places as well.

As I said in my other reply, we can decide that DeepSleep == s2ram from
Linux PoV, but that has implications - beyond what I think you're
willing to accept on your laptop.

> Oh there is one more limitation with doing CXPC without D3Cold (link retention).
> Linux cannot handle PCIe wakeup reliably. So if you have WLAN or USB keyboard
> connected to a PCIe-USB hub, wakeup will not work and will result in PCIe link
> down with upstream. We need to have a hw mechanism to handle PCIe wakeup. But
> that is not currently supported and I don't know when that support will land.
> 
> So if wakeup is not supported, I thought doing D3Cold + CXPC would be better in
> terms of power saving (not much difference, but still...). This is the only
> motivation for me to use this flag for all pre-Hamoa SoCs. 
> 

I'm glad that you're looking into this part, we want that.

> > Do we force all "pre-Hamoa" targets into this same behavior? Or do we
> > have a different flag for saying "at the end of suspend power will be
> > lost" there?
> > 
> 
> If you don't agree with the above reasoning, I can just limit its usage to
> Makena and s2ram.
> 

I don't think I have all the details, but if we're saying that Makena is
broken and need special treatment in NVMe, it would be better to say
just that, with a patch in check_vendor_combination_bug()

/* Qualcomm SC8280XP can not enter low-power with PCIe link active */
if (of_machine_is_compatible("qcom,sc8280xp"))
	return NVME_QUIRK_SIMPLE_SUSPEND;


Alternatively, make it possible to set StorageD3Enable in DeviceTree.
This flag exists in ACPI for a reason, why wouldn't we see the same
problems when describing the system using DeviceTree?

> > 
> > PS. Think the commit message of the change itself falls short in
> > capturing the problem. The commit message of this change will become the
> > documentation on which many future discussions will be based.
> > 
> 
> Sorry about that. I will add more context while sending non-RFC version.
> 
> > > For implementation, s2idle_ops is registered during the boot of the rpmh-rsc
> > > driver based on the machine compatible limited to Makena (SC8280XP) as a
> > > proof-of-concept. If this approach gets consensus, I plan to have a helper
> > > that lists the compatibles of all SoCs exhibiting this behavior. Since there is
> > > no reliable way to find out whether s2idle is the only low power state supported
> > > or not during boot, I resorted to compatible based matching.
> > > 
> > > One could argue that this s2idle_ops should be registered in the PSCI driver
> > > similar to s2ram [1]. But I didn't prefer that since from PSCI point of view,
> > > only CPUs should be parked in low power states during s2idle (CPU_SUSPEND) and
> > > the peripherals should not be affected. Though in the past, an argument [2] was
> > > raised citing the PSCI spec wording that allows the vendors to implement system
> > > level low power states during CPU_SUSPEND. But that argument was not well
> > > received by the PSCI maintainers.
> > > 
> > 
> > It makes sense to me to have PSCI only manage CPUs and its necessary
> > peripherals.
> > 
> > But the definition of pm_suspend_via_firmware() in our case would then
> > be, "if your driver piggybacks on e.g. the CPU subsystem's vote for
> > critical resources, you might be in for a surprise".
> > 
> > Which makes me feel that the Makena quirk should be in the PCIe
> > controller driver...
> > 
> 
> Do you still think so?
> 

Yes, not based on the current state of the kernel. But all the
implications that will follow, in particular in relation to DeepSleep.

Regards,
Bjorn

> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

