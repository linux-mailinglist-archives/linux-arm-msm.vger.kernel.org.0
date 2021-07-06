Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14F7E3BD7D3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 15:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231618AbhGFNb5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 09:31:57 -0400
Received: from foss.arm.com ([217.140.110.172]:42426 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231453AbhGFNb5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 09:31:57 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 667CC1FB;
        Tue,  6 Jul 2021 06:29:18 -0700 (PDT)
Received: from [10.57.40.45] (unknown [10.57.40.45])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B294E3F73B;
        Tue,  6 Jul 2021 06:29:16 -0700 (PDT)
Subject: Re: [PATCH] arm64: cache: Lower ARCH_DMA_MINALIGN to 64
 (L1_CACHE_BYTES)
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     "will@kernel.org" <will@kernel.org>,
        "ardb@kernel.org" <ardb@kernel.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "kernel-team@android.com" <kernel-team@android.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "vincent.whitchurch@axis.com" <vincent.whitchurch@axis.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
References: <20210527124356.22367-1-will@kernel.org>
 <uHgsRacR8hJ7nW-I-pIcehzg-lNIn7NJvaL7bP9tfAftFsBjsgaY2qTjG9zyBgxHkjNL1WPNrD7YVv2JVD2_Wy-a5VTbcq-1xEi8ZnwrXBo=@protonmail.com>
 <20210706102634.GB24903@arm.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <59800d6c-364a-f4be-e341-c5b531657ba3@arm.com>
Date:   Tue, 6 Jul 2021 14:29:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706102634.GB24903@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-06 11:26, Catalin Marinas wrote:
> On Tue, Jul 06, 2021 at 09:26:59AM +0000, Yassine Oudjana wrote:
>> In-Reply-To: <20210527124356.22367-1-will@kernel.org>
>>> Reduce ARCH_DMA_MINALIGN to 64 bytes and allow the warning/taint to
>>> indicate if there are machines that unknowingly rely on this.
>>
>> The warning is being triggered on Qualcomm MSM8996, as well as the out-of-spec taint:
> 
> Is this booting with ACPI or DT?
> 
>> ------------[ cut here ]------------
>> rtc-pm8xxx 400f000.qcom,spmi:pmic@0:rtc@6000: ARCH_DMA_MINALIGN smaller than CTR_EL0.CWG (64 < 128)
>> WARNING: CPU: 0 PID: 1 at arch/arm64/mm/dma-mapping.c:45 arch_setup_dma_ops+0xf8/0x10c
> [...]
>> This warning is triggered with nearly every driver probe, not only rtc-pm8xxx.
> 
> I have a suspicion none of the reported devices actually do any DMA, so
> in practice it should be safe but we need to figure out why
> arch_setup_dma_ops() gets called.

It gets called because there's no straightforward way to know that a 
platform device *isn't* DMA-capable, so we have to assume they are.

I would also assume that in a Qcom SoC there really are at least some 
things doing non-coherent DMA :(

Robin.
