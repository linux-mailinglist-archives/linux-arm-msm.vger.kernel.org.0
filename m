Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A236135890B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 17:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232059AbhDHP6C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 11:58:02 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.24]:28261 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231866AbhDHP6B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 11:58:01 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1617897464; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=FrtupQqXNl41U2encBVhcG6lH1+Y9+xXBCe396IGRJjOqmNXo4AzRXywZz0LEWyEvo
    wCSyCUQdm6LfP/0TIAkDePzwlpJmSqqcONajBu7bU9W3bTP6MWQqTAUmLSeI4MV2LzDm
    F1m/RW9ECrPo5fAzComblg6GhQ2we9Y5CMSRddG8Nrw+MktjqQDFMu9PDMN+5/dI9DDw
    YLlxu40nwwYmqq9jLlAj0+G1cdGMIaaRgpKzGFEvBx58WCk9JrGJ2AZcoy25D0T0s8KN
    thJ3NKleUXIm5tWQKdnEQReZG9uIbQ3Bkrw1NJZxWK6kyfcRD3OLIA+gKn5QXY9J55oB
    Re6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1617897464;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=qJzrcEJtFtjqvzC/z2GlGG4ntM5V+mCgLo9FaKWsg+E=;
    b=rxzlUoH+zeEocwCAFiVCPr6Hd/2jEWeFKpCBxRUifSpzp3Z9/A0TWJWyAn/0tkEsX6
    MJaUqK66BGv2YCxvY8XeTbFQZrKWKTCTc5s+Q2d156jgUvORrYJTbUNtKOOhioEUenWl
    N+SoDgTsTbxcHofNkRiUi+HH/jwq1ExQZi8cQoxRgmxySA/sx0+cr2aFSKajH/e4k0Se
    B6v1Bp5OHXYzmTsQxbSKKKK+GMuSdGmunr81UGLmnI06pe2BYaYH3w2r9RMSKRb3tSnG
    3YV1/U1Ng/lY83omii4swFB4eDAKyBGliE9W/V9imBF/CiZyTo7zGyWm6eWtwJAjMgBB
    u3Mw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1617897464;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=qJzrcEJtFtjqvzC/z2GlGG4ntM5V+mCgLo9FaKWsg+E=;
    b=qyOd6wKuypQvwRk8X2fF/grVVxmcLceVO0WlxwKc5Cq2yRk78R9H5wR1giyIuD5R5D
    P0d/ZMmaN0KoHC7YLwjWBPjSGbg7L8Dpb32Q1lJewQc59dPq9DM0psP6UeIyXOvxp6LR
    Y6O9zjSSKsqGOGVuCBMQ8GxDekjCGieUhDyTAU7sKLUcSc4vjOd9tIAk3N1kVxduPqdP
    0gF70ufST/q+4pROwl03oybUiDgjhRy4cHXruC62EEwWBKY83Gxy5K9jnAwxbfYEVfTj
    PFi7S345AxnkF+ggLnr6HMHtwoA+RIRTu9eRKQ4VsXXpCNzrVoyHduyssipXgzn9rfZs
    GqOQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j6IczAaYo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.24.0 DYNA|AUTH)
    with ESMTPSA id 409abax38FvhBew
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 8 Apr 2021 17:57:43 +0200 (CEST)
Date:   Thu, 8 Apr 2021 17:57:39 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] arm64: dts: qcom: msm8916: Add GICv2 hypervisor
 registers/interrupt
Message-ID: <YG8n83ckdeGKERA6@gerhold.net>
References: <20210407163648.4708-1-stephan@gerhold.net>
 <871rblorhy.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871rblorhy.wl-maz@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Marc,

On Thu, Apr 08, 2021 at 02:06:17PM +0100, Marc Zyngier wrote:
> Hi Stephan,
> 
> On Wed, 07 Apr 2021 17:36:48 +0100,
> Stephan Gerhold <stephan@gerhold.net> wrote:
> > 
> > The ARM Cortex-A53 CPU cores and QGIC2 interrupt controller
> > (an implementation of the ARM GIC 2.0 specification) used in MSM8916
> > support virtualization, e.g. for KVM on Linux. However, so far it was
> > not possible to make use of this functionality, because Qualcomm's
> > proprietary "hyp" firmware blocks the EL2 mode of the CPU and only
> > allows booting Linux in EL1.
> > 
> > However, on devices without (firmware) secure boot there is no need
> > to rely on all of Qualcomm's firmware. The "hyp" firmware on MSM8916
> > seems simple enough that it can be replaced with an open-source
> > alternative created only based on trial and error - with some similar
> > EL2/EL1 initialization code adapted from Linux and U-Boot.
> 
> Ay, Quaramba! That's great news!
> 
> > 
> > qhypstub [1] is such an open-source firmware for MSM8916 that
> > can be used as drop-in replacement for Qualcomm's "hyp" firmware.
> > It does not implement any hypervisor functionality.
> > Instead, it allows booting Linux/KVM (or other hypervisors) in EL2.
> 
> Do you happen to know if the same method would apply to other SoCs
> from the same vendor? /me eyes the Lenovo c630 that is getting bored
> with EL1 only...
> 

I think there is still a separate "hyp" firmware on newer SoCs, which
suggests that a similar approach should be possible. However, newer SoCs
also seem to have "larger" hyp firmwares (just judging from the file
size). This suggests that there is more functionality implemented there.
Perhaps it's not important code or it can be replicated easily, but it
would definitely require some investigation.

However, I suspect the main problem for your Lenovo c630 is that it
likely has (firmware) secure boot enabled, which means that all firmware
must be signed with a private key from Lenovo. Unless you can somehow
convince Lenovo to sign firmware for you it is pretty much impossible to
tinker with the firmware there. Sorry :(

This is even a problem for qhypstub; out of 20+ MSM8916 smartphones
with mainline support (not all of them upstream yet), only ~5 can make
use of my firmware, all others also have firmware secure boot enabled.

For MSM8916, this even means no PSCI support (= no SMP, no CPU idle)
because Qualcomm never added support for that in firmwares used on
Android devices. I have to workaround that with very annoying hacks... :(

(To clarify this: Qualcomm made a PSCI firmware for the DragonBoard 410c,
 but it can only be installed on devices without firmware secure boot.)

> > 
> > With Linux booting in EL2, KVM seems to be working just fine on MSM8916.
> > However, so far it is not possible to make use of the virtualization
> > features in the GICv2. To use KVM's VGICv2 code, the QGIC2 device tree
> > node needs additional resources (according to binding documentation):
> > 
> >   - The CPU interface region (second reg) must be at least 8 KiB large
> >     to access the GICC_DIR register (mapped at 0x1000 offset)
> >   - Virtual control/CPU interface register base and size
> >   - Hypervisor maintenance interrupt
> > 
> > Fortunately, the public APQ8016E TRM [2] provides the required information:
> > 
> >   - The CPU interface region (at 0x0B002000) actually has a size of 8 KiB
> >   - Virtual control/CPU interface register is at 0x0B001000/0x0B004000
> >   - Hypervisor maintenance interrupt is "PPI #0"
> >       Note: This is a bit strange since almost all other ARM SoCs use
> >             GIC_PPI 9 for this. However, I have verified that this is
> >             indeed the interrupt that fires when bits are set in GICH_HCR.
> 
> Other SoCs have their maintenance interrupt wired to weird and
> wonderful interrupts. Given QC's lack of appetite for standards, I'm
> not totally surprised.
> 

To be honest, I was kind of positively surprised that Qualcomm
implemented the standards well enough to make KVM and the GIC
virtualization work without any quirks in the code. :)
I doubt that the Qualcomm firmware makes use of the GIC virtualization
functionality, so it is really nice that it works without any problems.

Thanks for the review!
Stephan
