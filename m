Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6832DFC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 16:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbfE2ObJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 May 2019 10:31:09 -0400
Received: from ns.iliad.fr ([212.27.33.1]:51584 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726411AbfE2ObJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 May 2019 10:31:09 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id E4A0020B19;
        Wed, 29 May 2019 16:31:06 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id CA82B207DC;
        Wed, 29 May 2019 16:31:06 +0200 (CEST)
Subject: Re: [PATCH v2] iommu/arm-smmu: Avoid constant zero in TLBI writes
To:     Will Deacon <will.deacon@arm.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        iommu <iommu@lists.linux-foundation.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <f523effd-ef81-46fe-1f9e-1a0cb42c8b7b@free.fr>
 <20190529130559.GB11023@fuggles.cambridge.arm.com>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <84791515-e0ae-0322-78aa-02ca0b40d157@free.fr>
Date:   Wed, 29 May 2019 16:31:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190529130559.GB11023@fuggles.cambridge.arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Wed May 29 16:31:06 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/05/2019 15:05, Will Deacon wrote:

> On Wed, May 29, 2019 at 01:55:48PM +0200, Marc Gonzalez wrote:
>
>> From: Robin Murphy <robin.murphy@arm.com>
>>
>> Apparently, some Qualcomm arm64 platforms which appear to expose their
>> SMMU global register space are still, in fact, using a hypervisor to
>> mediate it by trapping and emulating register accesses. Sadly, some
>> deployed versions of said trapping code have bugs wherein they go
>> horribly wrong for stores using r31 (i.e. XZR/WZR) as the source
>> register.
> 
> ^^^
> This should be in the comment instead of "qcom bug".

As you wish. I wasn't sure how much was too much.

>> While this can be mitigated for GCC today by tweaking the constraints
>> for the implementation of writel_relaxed(), to avoid any potential
>> arms race with future compilers more aggressively optimising register
>> allocation, the simple way is to just remove all the problematic
>> constant zeros. For the write-only TLB operations, the actual value is
>> irrelevant anyway and any old nearby variable will provide a suitable
>> GPR to encode. The one point at which we really do need a zero to clear
>> a context bank happens before any of the TLB maintenance where crashes
>> have been reported, so is apparently not a problem... :/
> 
> Hmm. It would be nice to understand this a little better. In which cases
> does XZR appear to work?

There are 4 occurrences of writel_relaxed(0 in the driver.

The following do not crash. Perhaps they run natively from NS EL1.

[        SMMU + 008000] = 00000000
[        SMMU + 009000] = 00000000
[        SMMU + 00a000] = 00000000
[        SMMU + 00b000] = 00000000
[        SMMU + 00c000] = 00000000
[        SMMU + 00d000] = 00000000

The following do crash. They trap to some evil place.

[        SMMU + 00006c] = 00000000
[        SMMU + 000068] = 00000000
[        SMMU + 000070] = 11190070

NB: with Robin's patch, we end up writing 0 anyway.
It would be "fun" if the emulation puked at !0
Unlikely since it worked for +70

> Any reason not to make these obviously dummy values e.g.:
> 
> 	/*
> 	 * Text from the commit message about broken hypervisor
> 	 */
> 	#define QCOM_DUMMY_VAL_NOT_XZR	~0U
> 
> That makes the callsites much easier to understand and I doubt there's a
> performance impact from allocating an extra register here.

Robin, what sayeth thee? Should I spin a v3?

Regards.
