Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A43993BD7D9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 15:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231415AbhGFNf7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 09:35:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:39962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231400AbhGFNf6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 09:35:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61E7461983;
        Tue,  6 Jul 2021 13:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625578400;
        bh=WcDD30TViYNS4yatqktO0avnymB6mNK7bjMGHKx69Ss=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZnmRvc80v0apIs/ErVix0easCCnnBjRfyj/dv5xuHyBuG2KxowXTGWm4DyR/1ALwq
         q1Ro7cNCYL7ggvrEKW2r4710VOuYE/Kz80DTmB7tnpmofjyYF///c3IC2c3SD4NXoL
         ZAvgZ1L9vvlFA55MWSCxw+jCYTMk9PfBaJMkPE4QZbbVyxQ3WfyssQEOEXW8NIxM59
         RNNl6V3uXlPPK3WsFiTdQGTOGyf+YPx/gFBYcyLo5fGOM7rlb/NMlhlsGl0kqHQjFP
         C9kVM1C9p3IYIEkKx8mtFOf0t8NyHTNa8jbJlNHxI17omLaM5ShKsc2y2C+FdYzqM/
         CBfbzC5TIdbiw==
Date:   Tue, 6 Jul 2021 14:33:14 +0100
From:   Will Deacon <will@kernel.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        "ardb@kernel.org" <ardb@kernel.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "kernel-team@android.com" <kernel-team@android.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "vincent.whitchurch@axis.com" <vincent.whitchurch@axis.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] arm64: cache: Lower ARCH_DMA_MINALIGN to 64
 (L1_CACHE_BYTES)
Message-ID: <20210706133314.GB20327@willie-the-truck>
References: <20210527124356.22367-1-will@kernel.org>
 <uHgsRacR8hJ7nW-I-pIcehzg-lNIn7NJvaL7bP9tfAftFsBjsgaY2qTjG9zyBgxHkjNL1WPNrD7YVv2JVD2_Wy-a5VTbcq-1xEi8ZnwrXBo=@protonmail.com>
 <20210706102634.GB24903@arm.com>
 <59800d6c-364a-f4be-e341-c5b531657ba3@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59800d6c-364a-f4be-e341-c5b531657ba3@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 06, 2021 at 02:29:07PM +0100, Robin Murphy wrote:
> On 2021-07-06 11:26, Catalin Marinas wrote:
> > On Tue, Jul 06, 2021 at 09:26:59AM +0000, Yassine Oudjana wrote:
> > > In-Reply-To: <20210527124356.22367-1-will@kernel.org>
> > > > Reduce ARCH_DMA_MINALIGN to 64 bytes and allow the warning/taint to
> > > > indicate if there are machines that unknowingly rely on this.
> > > 
> > > The warning is being triggered on Qualcomm MSM8996, as well as the out-of-spec taint:
> > 
> > Is this booting with ACPI or DT?
> > 
> > > ------------[ cut here ]------------
> > > rtc-pm8xxx 400f000.qcom,spmi:pmic@0:rtc@6000: ARCH_DMA_MINALIGN smaller than CTR_EL0.CWG (64 < 128)
> > > WARNING: CPU: 0 PID: 1 at arch/arm64/mm/dma-mapping.c:45 arch_setup_dma_ops+0xf8/0x10c
> > [...]
> > > This warning is triggered with nearly every driver probe, not only rtc-pm8xxx.
> > 
> > I have a suspicion none of the reported devices actually do any DMA, so
> > in practice it should be safe but we need to figure out why
> > arch_setup_dma_ops() gets called.
> 
> It gets called because there's no straightforward way to know that a
> platform device *isn't* DMA-capable, so we have to assume they are.
> 
> I would also assume that in a Qcom SoC there really are at least some things
> doing non-coherent DMA :(

Agreed, unless this is a CPU erratum and the line size is being reported for
a cache beyond the PoC, then I think we're going to have to revert the patch
reducing ARCH_DMA_MINALIGN after all.

I can't find much information about the original Kryo core at all...

Will
