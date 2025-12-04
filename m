Return-Path: <linux-arm-msm+bounces-84353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFE6CA388E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 13:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90DD930184EB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 12:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D557F33ADA1;
	Thu,  4 Dec 2025 12:04:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 862EE315D47;
	Thu,  4 Dec 2025 12:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764849892; cv=none; b=gDNuX/6Tz4NtfefPXsfPBtE0CjiElG8VJCw4yDl5qszD3PoLbxTNrNVk1QZAMupsjzM4oNH7RnMp+Q321Akln0W08/UVoMzkccZEANblTCpQ+jjGOn4q5X3F6pE91WyArMqiKB6bDNNBPbaVUbN0J58atPoDC7vMKn+cRbVAJhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764849892; c=relaxed/simple;
	bh=12Lfq/da3LrfiY0wN3NWEsZr1b/QGpZIblsaghrW9jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mo34Ysm7l7W1t1sZYbt773t4G4SwY889iEzE1YeTfsu5GmW4Sc1cQrUiMeXWHbj10Tcaew2Rskv96Sipbfj6JkMI0sVboPKRPiNaOSSU/iysbSNxHDv79bFMnOMhXHpLMAQ38jAOITaBonJ+vGnPDkXFboBinDhyml69PWGYQrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BAE1339;
	Thu,  4 Dec 2025 04:04:42 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88DCB3F73B;
	Thu,  4 Dec 2025 04:04:48 -0800 (PST)
Date: Thu, 4 Dec 2025 12:04:42 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	rsalveti@oss.qualcomm.com
Subject: Re: Alternative to arm64.nopauth cmdline for disabling Pointer
 Authentication
Message-ID: <aTF42v5dpTuCe7r3@J2N7QTR9R3>
References: <3fcf6614-ee83-4a06-9024-83573b2e642e@quicinc.com>
 <86ecpappzi.wl-maz@kernel.org>
 <adc22b19-7dcc-4c38-9319-d979f1e3886a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adc22b19-7dcc-4c38-9319-d979f1e3886a@quicinc.com>

Hi Pavan, Marc,

On Thu, Dec 04, 2025 at 04:06:12PM +0530, Pavan Kondeti wrote:
> On Thu, Dec 04, 2025 at 09:15:29AM +0000, Marc Zyngier wrote:
> > On Thu, 04 Dec 2025 04:07:15 +0000,
> > Pavan Kondeti <pavan.kondeti@oss.qualcomm.com> wrote:
> > > Hi
> > > 
> > > The pointer authentication feature (PAuth) is only supported on
> > > 0-3 CPUs but it is not supported on 4-7 CPUS on QCS8300.

> > On what grounds? Hardware incompatibility? I seriously doubt it,
> > since nobody glues pre-8.3 CPUs to anything more modern.

Marc, it seems like that's exactly that's happened here. :/

> I see that Linux runs at EL2 and AA64ISAR1 register values on CPU#0
> (A78) indicates that PAuth is supported but not for CPU#4 (A55). I am
> told, there are no other controls outside EL2 (trap) to manipulate
> this feature. So, I am assuming that this is indeed reflecting the HW.

Cortex-A78 doesn't have pointer authentication, but Cortex-A78C does, so
maybe you actually have Cortex-A78C?

What are the MIDRs on this SoC? e.g. the output of:

  cat /sys/devices/system/cpu/cpu*/regs/identification/midr_el1 | sort | uniq

If this SoC has both Cortex-A78C and Cortex-A55, that's a rather
unfortunate combination that should have been caught at the SoC design
phase, as Marc alluded to.

[...]

> > > This patch [2] from Catalin adds a devicetree property under memory {}
> > > to disable MTE.

Catalin's patch was a bit different. It described whether the memory
range supported tags (and was actually a property of the memory). That
patch didn't make it into mainline AFAICT.

[...]

> I understand that this does not fall under errata but is
> there a possiblity to introduce an Errata targeting CPU#0 MIDR and
> disabling the Pointer authentication? I understand that if there is
> another Qualcomm SoC that exists with all CPUs supporting pointer
> authentication with same MIDR, we may be disabling the feature but this
> is something I can check internally.

I strongly suspect we cannot use the MIDR for this. Per:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=53a52a0ec7680287b170b36488203b5822e6da2d

... Qualcomm's Kryo {Prime,Gold,Silver} parts seem to identify
themselves as Arm ltd implementations, and those will appear in other
non-Qualcomm SoCs.

Without know *exactly* which MIDRs you have on this part, we cannot say.

Regardless, I strongly suspect that we have to live with the command
line option for these parts.

Mark.

