Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD8238811
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2019 12:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727953AbfFGKkI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jun 2019 06:40:08 -0400
Received: from ns.iliad.fr ([212.27.33.1]:34388 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726584AbfFGKkI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jun 2019 06:40:08 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 28F4F1FFF7;
        Fri,  7 Jun 2019 12:40:06 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 1176D1FF7C;
        Fri,  7 Jun 2019 12:40:06 +0200 (CEST)
Subject: Re: [PATCH v3] iommu/arm-smmu: Avoid constant zero in TLBI writes
To:     Joerg Roedel <joro@8bytes.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Will Deacon <will.deacon@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        iommu <iommu@lists.linux-foundation.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Andy Gross <agross@kernel.org>
References: <f523effd-ef81-46fe-1f9e-1a0cb42c8b7b@free.fr>
 <20190529130559.GB11023@fuggles.cambridge.arm.com>
 <84791515-e0ae-0322-78aa-02ca0b40d157@free.fr>
 <09a290f1-27a0-5ee3-16b9-659ef2ba99dc@free.fr>
 <20190605121900.GJ15030@fuggles.cambridge.arm.com>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <f7b2e799-e3b1-ad40-c7b7-153f00323636@free.fr>
Date:   Fri, 7 Jun 2019 12:40:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605121900.GJ15030@fuggles.cambridge.arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Fri Jun  7 12:40:06 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/06/2019 14:19, Will Deacon wrote:

> On Mon, Jun 03, 2019 at 02:15:37PM +0200, Marc Gonzalez wrote:
>
>> From: Robin Murphy <robin.murphy@arm.com>
>>
>> Apparently, some Qualcomm arm64 platforms which appear to expose their
>> SMMU global register space are still, in fact, using a hypervisor to
>> mediate it by trapping and emulating register accesses. Sadly, some
>> deployed versions of said trapping code have bugs wherein they go
>> horribly wrong for stores using r31 (i.e. XZR/WZR) as the source
>> register.
>>
>> While this can be mitigated for GCC today by tweaking the constraints
>> for the implementation of writel_relaxed(), to avoid any potential
>> arms race with future compilers more aggressively optimising register
>> allocation, the simple way is to just remove all the problematic
>> constant zeros. For the write-only TLB operations, the actual value is
>> irrelevant anyway and any old nearby variable will provide a suitable
>> GPR to encode. The one point at which we really do need a zero to clear
>> a context bank happens before any of the TLB maintenance where crashes
>> have been reported, so is apparently not a problem... :/
>>
>> Reported-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
>> Tested-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> 
> Acked-by: Will Deacon <will.deacon@arm.com>
> 
> Joerg -- Please can you take this as a fix for 5.2, with a Cc stable?

Hello Joerg,

Can you ping this thread once this patch hits linux-next, so I can
ask Bjorn to pick up the 8998 ANOC1 DT node, and the PCIe DT node
that requires ANOC1.

Bjorn: for ANOC1, a small fixup: s/arm,smmu/iommu/

https://patchwork.kernel.org/project/linux-arm-msm/list/?series=99701
https://patchwork.kernel.org/patch/10895341/

Regards.
