Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D56793BE595
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 11:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbhGGJaU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 05:30:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:50568 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230474AbhGGJaU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 05:30:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3307761CBA;
        Wed,  7 Jul 2021 09:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625650060;
        bh=eQRJz6lggUJb8SZU1qZY+jo9rN8hvlgDH0IFe/UbUmI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U3e6mgB8MNLcTTkO5xbJIxRXSbMK/c9sK+jubLeOugqsbTIBPSa4X6Z3ndP93vyAe
         hR+fHsgYf1QS9kT2SS+LVFu8Y3xfOQI4qroFZTestEalaCNe14Gg7zmnMn+NRDrgMl
         F+NeGNZt7XPxnXeRaJWkmhKyTARP9OamRTjldI74l8k4QEqk7DW6ZefS7JRr/cFKNc
         liaCGjGaTXzit1wZ2Mub0W34RqweooKzwpiWUd8XXMC9dHLR7saWbI7tj7DNuDlAy1
         OFRU4TFeCTXFKCiVtszIC2Me6SHhYH8nSLMjipSNyLqO954h6sVP+OeYZCNbUMrgy2
         y1IoseVZkJR8w==
Date:   Wed, 7 Jul 2021 10:27:34 +0100
From:   Will Deacon <will@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] arm64: cache: Lower ARCH_DMA_MINALIGN to 64
 (L1_CACHE_BYTES)
Message-ID: <20210707092734.GA21603@willie-the-truck>
References: <20210706102634.GB24903@arm.com>
 <59800d6c-364a-f4be-e341-c5b531657ba3@arm.com>
 <20210706133314.GB20327@willie-the-truck>
 <f136da2ea91fc22334c552b8c524f6e7@kernel.org>
 <CAK8P3a2xWTvj6HjsC6gH44Ad13adKjK0wR7UxFFQ1i=XYixvQA@mail.gmail.com>
 <87zguz7b6b.wl-maz@kernel.org>
 <CAK8P3a2eFDSdkAUgapGuANQJsO=Arsp4uxoiLRXL-ah0ttc6Fg@mail.gmail.com>
 <m-pFOMXMXSwpPq7H8syJd3qyVkuhGYjVEOgk-iiezAFhr8ApjWX8eIMkcL3updRXOOeOClx88ekyeOvEsNYp_HrY54W4iCSYl8yT03Tykv4=@protonmail.com>
 <CAK8P3a1rtXTtGQ_Q7eg2SOrYa_OhSWPWFiS8m=oSb_GU1uUNXQ@mail.gmail.com>
 <YOTY6ZpVIg9cMBt2@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YOTY6ZpVIg9cMBt2@yoga>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 06, 2021 at 05:27:53PM -0500, Bjorn Andersson wrote:
> On Tue 06 Jul 15:33 CDT 2021, Arnd Bergmann wrote:
> 
> > On Tue, Jul 6, 2021 at 7:15 PM Yassine Oudjana <y.oudjana@protonmail.com> wrote:
> > > > (the numactl command helps run this both on the 'big' and 'little'
> > > > cores without running into migration)
> > > >
> > > > Arnd
> > >
> > > Here are the results:
> > 
> > Thanks, that was quick
> > 
> > > $ numactl -C 0 line -M 1M
> > > 128
> > > $ numactl -C 3 line -M 1M
> > > 128
> > > $ numactl -C 0 cache
> > > L1 cache: 512 bytes 1.37 nanoseconds 64 linesize -1.00 parallelism
> > > L2 cache: 24576 bytes 2.75 nanoseconds 64 linesize 5.06 parallelism
> > > L3 cache: 131072 bytes 7.89 nanoseconds 64 linesize 3.85 parallelism
> > > L4 cache: 524288 bytes 15.86 nanoseconds 128 linesize 3.48 parallelism
> > > Memory latency: 145.93 nanoseconds 4.88 parallelism
> > > $ numactl -C 3 cache
> > > L1 cache: 24576 bytes 1.29 nanoseconds 64 linesize 5.00 parallelism
> > > L2 cache: 1048576 bytes 8.60 nanoseconds 128 linesize 3.07 parallelism
> > > Memory latency: 143.29 nanoseconds 5.37 parallelism
> > 
> > This is still somewhat inconclusive, but it does give some hope. The data that
> > I found on random web sites was
> > 
> > - 32KB L1, 2MB/1MB L2 [1][2]
> > - 16KB L1, 1.5MB L2 [3]
> > - 32KB L1, 1MB/512KB L2 [4]
> > 
> > so none of the sizes really line up. My best guess is that the actual hierarchy
> > 
> > 1MB per-core L2 cache on the two big CPU, 512KB per-core L2 cache on
> > the two little ones, but no shared L2 or L3. The older Krait had a 4KB L0
> > cache, which could explain the 512-byte L1 output.
> > 
> > Can you rerun the the 'line' test with '-M 128K' to see if that confirms the 64
> > byte L1 line size that the 'cache' test reported?
> 
> I can confirm that MSM8996, and a few derivatives, has 128 byte cache
> lines.

Do you know if the caches with 128-byte lines sit above the PoC? i.e. is
non-coherent DMA coherent with this cache or not?

Will
