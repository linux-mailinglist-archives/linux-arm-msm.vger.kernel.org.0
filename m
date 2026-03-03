Return-Path: <linux-arm-msm+bounces-95172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IdFNB0Kp2kDcgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 17:19:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D21A61F3914
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 17:19:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CC1B2302C817
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 16:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0634D8D85;
	Tue,  3 Mar 2026 16:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qQeNMC+8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598904D2EF0;
	Tue,  3 Mar 2026 16:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772554687; cv=none; b=oqe8eSH7uYrCXOM4j7c/0Cfzw2zPFMpVctHwise+OwUVHvgurSBr3+g3W/DhuIoBV11XYFCR5KTg4zIjbk7he6s9D9QZtrJ80KAkZ9zxhRfLAaREdFpQnqjfdrRaw1V8hFORJCoBZDotuPx0lcXXsD2mObqf/fc5lRUL2FpiLyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772554687; c=relaxed/simple;
	bh=HKrZ9fFGSSlpC4H/YmdsdQhTkBYdI7OCy2dmmG6ClUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eHQ4Wc5UXmaj9XfCg4zkf6PLJpGabsuQuZHBOsSMqSEGLr4d8/AiOH/0e/tcJRxOaR+mtREiRHl7L3s/GjL+wZC/BfBnjDKUNGzkx7UeXctBuIfBB6y+N+/ekRmBbtacTPKLaqRWPTzOPAPAhrRXJcrMEJmCis5JISiw7/cTqJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qQeNMC+8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C9A1C2BCAF;
	Tue,  3 Mar 2026 16:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772554687;
	bh=HKrZ9fFGSSlpC4H/YmdsdQhTkBYdI7OCy2dmmG6ClUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qQeNMC+8TjYaXqWmi1Z5AsSI76NbaOZ40hNtAsZ6GNJQBq79GgyQkmnX039B+sNcP
	 bDM2JTflnRZD6UVXAC8yjCXqWOSp30wGcd/GLC8km7VHOlR7xLAc31ecTyNeBlJvvX
	 v+sikuYUYseEEddP2Bl7O2IQ/PyUbkNc24/NiWz3T9MyITRBthI73rba5QYcelnShE
	 VWivcYQZyOs+RY4Cv5CJ4Za+E+SGMB2D1FhQXjtptQbcNNMA0oYpLceyhY1t48OE7l
	 EoDm8+Oxtx3GK+n4WcAE1O5RoaMuje7me2Ytjty1HK7bQDh4zgNRAQMsTwCsd6j+Rl
	 jHWze/5tHPx1g==
Date: Tue, 3 Mar 2026 21:47:50 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Manikanta Maddireddy <mmaddireddy@nvidia.com>, 
	krishna.chundru@oss.qualcomm.com, Bjorn Helgaas <helgaas@kernel.org>, 
	manivannan.sadhasivam@oss.qualcomm.com, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, "David E. Box" <david.e.box@linux.intel.com>, 
	Kai-Heng Feng <kai.heng.feng@canonical.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Chia-Lin Kao <acelan.kao@canonical.com>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org
Subject: Re: [PATCH v2 1/2] PCI/ASPM: Override the ASPM and Clock PM states
 set by BIOS for devicetree platforms
Message-ID: <kkly3z4durpagtenadvmzdpojlctachgfgi2fdapt6zthdl2gx@n2qhmlud2zb7>
References: <5z7c25nkb35prvax6vq6ud7eaeuhzsswbf7fqvmlgys3xftgwb@odocboejrdrv>
 <e44c330b-778b-4fa1-b678-fa909cc05b03@nvidia.com>
 <bf37b6a5-268d-4c07-a536-a826b3d5953b@nvidia.com>
 <unc5zefwndgcv7wufaezz3gkg3qtaymkjlmymhyqdqwzn3wybl@ow2rhbyt772h>
 <f9ac8c8f-8959-416b-ba90-14f0886c5bc0@nvidia.com>
 <a5m4pqtiaxsq5lmq64roro633ganbeq7mypa5ojuuqy4npkvok@wcogdbzaq6xe>
 <7157c68e-97f3-43b0-bfb5-e271a8f2a4b8@nvidia.com>
 <cf1e685a-a1cb-45ec-bdc3-1ef1a3d1044e@nvidia.com>
 <npt2cgwksulq5375dzlhszqaqrurgdvlkz6fdczer6shglqfg5@gp6a6xymymww>
 <26ad62ff-4972-4b29-8f9e-1868cd20ee00@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26ad62ff-4972-4b29-8f9e-1868cd20ee00@nvidia.com>
X-Rspamd-Queue-Id: D21A61F3914
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95172-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,oss.qualcomm.com,kernel.org,google.com,vger.kernel.org,linux.intel.com,canonical.com,gmail.com,kernel.dk,lst.de,grimberg.me,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 04:52:57PM +0000, Jon Hunter wrote:
> 
> On 26/02/2026 11:16, Manivannan Sadhasivam wrote:
> 
> ...
> 
> > I can't certainly know what is going wrong. If controller driver suspend is
> > skipped, then ideally the controller and the NVMe device should stay powered ON
> > during suspend. But if the platform pulls the plug at the end of suspend
> > (firmware, gdsc or some other entity), then all the context would be lost and
> > that might explain the failure because both the controller driver and NVMe
> > driver would expect the RC and NVMe to be active.
> > 
> > You can try commenting out the whole PM callbacks:
> > 		// .pm = &tegra_pcie_dw_pm_ops
> > 
> > If the host itself doesn't resume, then it confirms that some other entity is
> > pulling the plug (which is common in ARM platforms). In that case, we have to
> > let the NVMe driver know about it so that it can shutdown the controller.
> 
> For Tegra, we enter a deep low power state known as SC7 on suspend which
> does involve firmware. Nonetheless I tried for fun, but this breaks suspend
> completely.
> 

Ah, this explains the problem. We also have a similar problem on our Qcom Auto
boards where the firmware completely shuts down the SoC and puts the DRAM in
self refresh mode. So NVMe driver never resumes properly. We tried multiple ways
to address this issue in the NVMe driver, but the NVMe maintainers rejected
every single one of them and asking for some API in the PCI or PM core to tell
the NVMe driver when to shutdown the device during suspend. But this turned out
to be not so trivial.

Another way to workaround this issue would be by calling
pm_set_suspend_via_firmware() from the driver that controls the entity doing
power management of the SoC (firmware). In your case, it is
drivers/soc/tegra/pmc.c?

In that case, you can use this patch as a reference:
https://lore.kernel.org/all/20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com

When pm_set_suspend_via_firmware() is set, NVMe driver assumes that the firmware
might pull the plug during suspend, so it shutdowns the controller completely
and brings it back from reset during resume.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

