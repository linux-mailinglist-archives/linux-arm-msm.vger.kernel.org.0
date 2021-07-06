Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA3163BD858
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 16:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232265AbhGFOhz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 10:37:55 -0400
Received: from foss.arm.com ([217.140.110.172]:43650 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232262AbhGFOhy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 10:37:54 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDEBB1396;
        Tue,  6 Jul 2021 07:21:32 -0700 (PDT)
Received: from [10.57.40.45] (unknown [10.57.40.45])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 313493F73B;
        Tue,  6 Jul 2021 07:21:31 -0700 (PDT)
Subject: Re: [PATCH] arm64: cache: Lower ARCH_DMA_MINALIGN to 64
 (L1_CACHE_BYTES)
To:     Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>, ardb@kernel.org,
        arnd@arndb.de, kernel-team@android.com,
        linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com,
        vincent.whitchurch@axis.com, linux-arm-msm@vger.kernel.org
References: <20210527124356.22367-1-will@kernel.org>
 <uHgsRacR8hJ7nW-I-pIcehzg-lNIn7NJvaL7bP9tfAftFsBjsgaY2qTjG9zyBgxHkjNL1WPNrD7YVv2JVD2_Wy-a5VTbcq-1xEi8ZnwrXBo=@protonmail.com>
 <20210706102634.GB24903@arm.com>
 <59800d6c-364a-f4be-e341-c5b531657ba3@arm.com>
 <20210706133314.GB20327@willie-the-truck>
 <f136da2ea91fc22334c552b8c524f6e7@kernel.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <5467495b-1095-9bb6-30d4-f9be63475421@arm.com>
Date:   Tue, 6 Jul 2021 15:21:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f136da2ea91fc22334c552b8c524f6e7@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-06 14:44, Marc Zyngier wrote:
> On 2021-07-06 14:33, Will Deacon wrote:
>> On Tue, Jul 06, 2021 at 02:29:07PM +0100, Robin Murphy wrote:
>>> On 2021-07-06 11:26, Catalin Marinas wrote:
>>> > On Tue, Jul 06, 2021 at 09:26:59AM +0000, Yassine Oudjana wrote:
>>> > > In-Reply-To: <20210527124356.22367-1-will@kernel.org>
>>> > > > Reduce ARCH_DMA_MINALIGN to 64 bytes and allow the 
>>> warning/taint to
>>> > > > indicate if there are machines that unknowingly rely on this.
>>> > >
>>> > > The warning is being triggered on Qualcomm MSM8996, as well as 
>>> the out-of-spec taint:
>>> >
>>> > Is this booting with ACPI or DT?
>>> >
>>> > > ------------[ cut here ]------------
>>> > > rtc-pm8xxx 400f000.qcom,spmi:pmic@0:rtc@6000: ARCH_DMA_MINALIGN 
>>> smaller than CTR_EL0.CWG (64 < 128)
>>> > > WARNING: CPU: 0 PID: 1 at arch/arm64/mm/dma-mapping.c:45 
>>> arch_setup_dma_ops+0xf8/0x10c
>>> > [...]
>>> > > This warning is triggered with nearly every driver probe, not 
>>> only rtc-pm8xxx.
>>> >
>>> > I have a suspicion none of the reported devices actually do any 
>>> DMA, so
>>> > in practice it should be safe but we need to figure out why
>>> > arch_setup_dma_ops() gets called.
>>>
>>> It gets called because there's no straightforward way to know that a
>>> platform device *isn't* DMA-capable, so we have to assume they are.
>>>
>>> I would also assume that in a Qcom SoC there really are at least some 
>>> things
>>> doing non-coherent DMA :(
>>
>> Agreed, unless this is a CPU erratum and the line size is being 
>> reported for
>> a cache beyond the PoC, then I think we're going to have to revert the 
>> patch
>> reducing ARCH_DMA_MINALIGN after all.
>>
>> I can't find much information about the original Kryo core at all...
> 
> I have similar issues with my QDF2400. The UART, RTC and DMA controllers
> are all screaming at me. I'm confident that the UART doesn't do any
> DMA (it is handled by the SBSA driver), but the DMA controllers are
> probably doing what it says on the tin.
> 
> Do we know whether Falkor and Kryo share any part of their design?

According to [1], not literally, but some of the same people being 
involved in both could plausibly imply that some basic design decisions 
might have carried over.

Robin.

[1] 
https://www.anandtech.com/show/11737/analyzing-falkors-microarchitecture-a-deep-dive-into-qualcomms-centriq-2400-for-windows-server-and-linux
