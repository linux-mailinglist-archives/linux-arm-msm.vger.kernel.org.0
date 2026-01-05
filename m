Return-Path: <linux-arm-msm+bounces-87461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 056E1CF4040
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:05:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 735333001000
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26CB123EA86;
	Mon,  5 Jan 2026 14:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgmcNYEw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E56145B3E;
	Mon,  5 Jan 2026 14:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767621898; cv=none; b=qeK4aI/6e+VHYaF/vzx2dvi7GaFwrd91xvnVLDkVBdUvzWsz8kcUdeU38vtU14JCkenY3fzmsxFUIbts6T9AxzMZkajQCC6Z92gM5fxciSr2wUvhvdXX8iS1anBEtzvQFeRjS1DSJqbJYrvSfJ7ndVH4IsEHMLqoK2ftShlQjnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767621898; c=relaxed/simple;
	bh=f974cHD/ROsMpt/DTUHyheRaIu8QqxsRAeYLWROE4z8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tr6hcps8mNa6/msJx0+AUxaaGftSxhwQPRq3Pu/VJP4LNc0W96pRvU0kCM77l9we+DOAOVCKz2UCcZPsOEvbu8sJvCfjL6Ic2Gta3VldLY2LCQyM5RS38+mA4KM9nVt5oDyVHu97SP6CKKuXUgMc2R0txFzDcM5CmbaMxwRa/ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgmcNYEw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C00CC116D0;
	Mon,  5 Jan 2026 14:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767621897;
	bh=f974cHD/ROsMpt/DTUHyheRaIu8QqxsRAeYLWROE4z8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WgmcNYEwh6zNc+w0KIV8+yGmOEAucAnX4HvdNe8nlI1lD9U92vzU/Hd4CoBHgM1tt
	 YbcSUCkfEmtmMvBzbyqHnv5x0Dg4EqZ+9pso8JUF0DPFgW4MJOdfvqJQ6qf+qvPZLU
	 XLpd3R17Cs5RjeoyR6rPKChv0MZ2LRYjvRvgC4+q6uvVFbtvitQsB0tQuP2SCgnAjJ
	 J1M3dI5gVLFM9eedMLKUVgLVE6Sa76nbHRrli+v88PZYAT6BQB0DV7O8gxlcegvkpB
	 h5JKNLyWmVYu0FN14IvuEg1g//xVtWripJC3ULgbtjlqnz6Iy/HClOjvnc0VcwWUqJ
	 nLukjNo4hHPrg==
Date: Mon, 5 Jan 2026 08:04:54 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mani@kernel.org
Subject: Re: [RFC PATCH 0/1] soc: qcom: rpmh-rsc: Register s2idle_ops to
 indicate s2ram behavior in s2idle
Message-ID: <lieekisbc2xe7elfh7edruw5csyw3vpqcyf6dc3fghe3mdqpph@fu2ofnbr5gbt>
References: <20260101165158.7251-1-manivannan.sadhasivam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260101165158.7251-1-manivannan.sadhasivam@oss.qualcomm.com>

On Thu, Jan 01, 2026 at 10:21:57PM +0530, Manivannan Sadhasivam wrote:
> Hi,
> 

Many thanks for looking into this problem, Mani.

> This is just an attempt to let the device drivers know of the quirky platform
> behavior of mimicking s2ram in s2idle for older Qcom SoCs (pre-Hamoa and
> non-chromebooks) using RPMh. This information is important for the device
> drivers as they need to prepare for the possible power loss during system
> suspend by shutting down or resetting the devices.
> 

Is this really what happens? What _exactly_ is the purpose of
pm_suspend_via_firmware() and pm_resume_via_firmware()?

The kernel-doc for pm_suspend_via_firmware() states "return true if
platform firmware is going to be invoked at end of system suspend...in
order to complete it".

To me this indicates that the purpose of this mechanism is to signal
Linux that we're running on a target where platform firmware will cut
power once we reach the bottom of the suspend chain, so the individual
drivers has to save/restore state in order to prepare for this.

But if I understand the bottom of the s2idle sequence, is that all we do
is enter idle and the kernel will pick the lowest idle idle-state, which
based on the psci-suspend-param will signal the system that the
resources needed by the CPU subsystem can be powered down.

But it's not really powering things down, it's releasing the vote of the
CPU subsystem - which if the driver didn't vote means power will be
lost. So for any drivers that relies on the implicit vote from the CPU
subsystem to sustain their operation this flag is correct.

For many IP blocks, the register state and/or some functionality will be
retained in this state - e.g. register state will be retained, or
functionality will be sustained by sleep power. So they can safely
ignore the flag.

In some cases state isn't retained when this happens, so e.g. PHY
drivers does perform save and restore operations, despite the flag
currently not indicating that power will be lost.


What's unique with Makena in this regard, is that in this state the PCIe
link can not be sustained, so we either need to tear things down, or the
PCIe controller needs to vote directly on those resources it need in
order to sustain its link.

It seems to me that this patch uses the global flag, in order to signal
the PCIe stack specifically, that it needs to save/restore state. I'm
concerned that support for retaining state in the PCIe subsystem isn't a
global question.



Then parallel to this discussion, we have the actual s2ram feature
showing up on some targets, where the SoC actually do power off. Here
the automatic retaining of register and functional state is not going to
happen - device drivers must save and restore state.

Do we force all "pre-Hamoa" targets into this same behavior? Or do we
have a different flag for saying "at the end of suspend power will be
lost" there?


PS. Think the commit message of the change itself falls short in
capturing the problem. The commit message of this change will become the
documentation on which many future discussions will be based.

> For implementation, s2idle_ops is registered during the boot of the rpmh-rsc
> driver based on the machine compatible limited to Makena (SC8280XP) as a
> proof-of-concept. If this approach gets consensus, I plan to have a helper
> that lists the compatibles of all SoCs exhibiting this behavior. Since there is
> no reliable way to find out whether s2idle is the only low power state supported
> or not during boot, I resorted to compatible based matching.
> 
> One could argue that this s2idle_ops should be registered in the PSCI driver
> similar to s2ram [1]. But I didn't prefer that since from PSCI point of view,
> only CPUs should be parked in low power states during s2idle (CPU_SUSPEND) and
> the peripherals should not be affected. Though in the past, an argument [2] was
> raised citing the PSCI spec wording that allows the vendors to implement system
> level low power states during CPU_SUSPEND. But that argument was not well
> received by the PSCI maintainers.
> 

It makes sense to me to have PSCI only manage CPUs and its necessary
peripherals.

But the definition of pm_suspend_via_firmware() in our case would then
be, "if your driver piggybacks on e.g. the CPU subsystem's vote for
critical resources, you might be in for a surprise".

Which makes me feel that the Makena quirk should be in the PCIe
controller driver...

Regards,
Bjorn

> Moreover, RPMh is the entity that implements the s2ram like deeper low power
> state during system suspend. So it made sense to add the ops in this driver.
> 
> Note: This series is compile tested only. If one tests this series on Makena
> platform, NVMe should get shutdown during suspend as confirmed by the dmesg log
> similar to below after resume:
> 
> 	nvme nvme0: 12/0/0 default/read/poll queues
> 
> This series, together with the upcoming PCIe D3Cold support should allow Makena
> (and other similar SoCs once added) to enter the deep low power mode a.k.a CXPC.
> 
> [1] https://lore.kernel.org/all/20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com
> [2] https://lore.kernel.org/all/54cc4221-ba5f-4741-9033-20874265ca01@oss.qualcomm.com
> 
> Manivannan Sadhasivam (1):
>   soc: qcom: rpmh-rsc: Register s2idle_ops to indicate s2ram behavior in
>     s2idle
> 
>  drivers/soc/qcom/rpmh-rsc.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> -- 
> 2.48.1
> 

