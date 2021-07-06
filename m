Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB663BD98C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 17:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231937AbhGFPMF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 11:12:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:47080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231754AbhGFPMD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 11:12:03 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0536861CA4;
        Tue,  6 Jul 2021 13:44:21 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1m0lN4-00Bk1C-Tp; Tue, 06 Jul 2021 14:44:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 06 Jul 2021 14:44:18 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Will Deacon <will@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>, ardb@kernel.org,
        arnd@arndb.de, kernel-team@android.com,
        linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com,
        vincent.whitchurch@axis.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: cache: Lower ARCH_DMA_MINALIGN to 64
 (L1_CACHE_BYTES)
In-Reply-To: <20210706133314.GB20327@willie-the-truck>
References: <20210527124356.22367-1-will@kernel.org>
 <uHgsRacR8hJ7nW-I-pIcehzg-lNIn7NJvaL7bP9tfAftFsBjsgaY2qTjG9zyBgxHkjNL1WPNrD7YVv2JVD2_Wy-a5VTbcq-1xEi8ZnwrXBo=@protonmail.com>
 <20210706102634.GB24903@arm.com>
 <59800d6c-364a-f4be-e341-c5b531657ba3@arm.com>
 <20210706133314.GB20327@willie-the-truck>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <f136da2ea91fc22334c552b8c524f6e7@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: will@kernel.org, robin.murphy@arm.com, catalin.marinas@arm.com, y.oudjana@protonmail.com, ardb@kernel.org, arnd@arndb.de, kernel-team@android.com, linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, vincent.whitchurch@axis.com, linux-arm-msm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-06 14:33, Will Deacon wrote:
> On Tue, Jul 06, 2021 at 02:29:07PM +0100, Robin Murphy wrote:
>> On 2021-07-06 11:26, Catalin Marinas wrote:
>> > On Tue, Jul 06, 2021 at 09:26:59AM +0000, Yassine Oudjana wrote:
>> > > In-Reply-To: <20210527124356.22367-1-will@kernel.org>
>> > > > Reduce ARCH_DMA_MINALIGN to 64 bytes and allow the warning/taint to
>> > > > indicate if there are machines that unknowingly rely on this.
>> > >
>> > > The warning is being triggered on Qualcomm MSM8996, as well as the out-of-spec taint:
>> >
>> > Is this booting with ACPI or DT?
>> >
>> > > ------------[ cut here ]------------
>> > > rtc-pm8xxx 400f000.qcom,spmi:pmic@0:rtc@6000: ARCH_DMA_MINALIGN smaller than CTR_EL0.CWG (64 < 128)
>> > > WARNING: CPU: 0 PID: 1 at arch/arm64/mm/dma-mapping.c:45 arch_setup_dma_ops+0xf8/0x10c
>> > [...]
>> > > This warning is triggered with nearly every driver probe, not only rtc-pm8xxx.
>> >
>> > I have a suspicion none of the reported devices actually do any DMA, so
>> > in practice it should be safe but we need to figure out why
>> > arch_setup_dma_ops() gets called.
>> 
>> It gets called because there's no straightforward way to know that a
>> platform device *isn't* DMA-capable, so we have to assume they are.
>> 
>> I would also assume that in a Qcom SoC there really are at least some 
>> things
>> doing non-coherent DMA :(
> 
> Agreed, unless this is a CPU erratum and the line size is being 
> reported for
> a cache beyond the PoC, then I think we're going to have to revert the 
> patch
> reducing ARCH_DMA_MINALIGN after all.
> 
> I can't find much information about the original Kryo core at all...

I have similar issues with my QDF2400. The UART, RTC and DMA controllers
are all screaming at me. I'm confident that the UART doesn't do any
DMA (it is handled by the SBSA driver), but the DMA controllers are
probably doing what it says on the tin.

Do we know whether Falkor and Kryo share any part of their design?

         M.
-- 
Jazz is not dead. It just smells funny...
