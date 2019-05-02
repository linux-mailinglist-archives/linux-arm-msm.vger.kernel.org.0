Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B719F11FD3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 May 2019 18:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbfEBQN3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 May 2019 12:13:29 -0400
Received: from ns.iliad.fr ([212.27.33.1]:45048 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726321AbfEBQN3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 May 2019 12:13:29 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 4FE87202EC;
        Thu,  2 May 2019 18:05:37 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 2EECD1FF15;
        Thu,  2 May 2019 18:05:37 +0200 (CEST)
Subject: Re: [PATCH] arm64/io: Don't use WZR in writel
To:     Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
References: <68b71c15f32341468a868f6418e4fcb375bc49ba.camel@gmail.com>
 <20190211105755.GB30880@fuggles.cambridge.arm.com>
 <38d8965a-cd41-17cf-1b95-8dd58c079be4@arm.com>
 <874c702b8af760aa8fae38d478c79e3ecba00515.camel@gmail.com>
 <235d20ef-3054-69d9-975d-25aebf32aad3@arm.com>
 <20190223181254.GC572@tuxbook-pro> <86zhqm8i6d.wl-marc.zyngier@arm.com>
 <20190224035356.GD572@tuxbook-pro>
 <33d765b5-1807-fa6c-1ceb-99f09f7c8d5a@free.fr>
 <8eb4f446-6152-ffb6-9529-77fb0bcc307f@arm.com>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <7b5e8bb1-d339-07f7-66f6-7f09df2107c4@free.fr>
Date:   Thu, 2 May 2019 18:05:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8eb4f446-6152-ffb6-9529-77fb0bcc307f@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Thu May  2 18:05:37 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/03/2019 17:04, Robin Murphy wrote:

> On 12/03/2019 12:36, Marc Gonzalez wrote:
>
>> On 24/02/2019 04:53, Bjorn Andersson wrote:
>>
>>> On Sat 23 Feb 10:37 PST 2019, Marc Zyngier wrote:
>>>
>>>> On Sat, 23 Feb 2019 18:12:54 +0000, Bjorn Andersson wrote:
>>>>>
>>>>> On Mon 11 Feb 06:59 PST 2019, Marc Zyngier wrote:
>>>>>
>>>>>> On 11/02/2019 14:29, AngeloGioacchino Del Regno wrote:
>>>>>>
>>>>>>> Also, just one more thing: yes this thing is going ARM64-wide and
>>>>>>> - from my findings - it's targeting certain Qualcomm SoCs, but...
>>>>>>> I'm not sure that only QC is affected by that, others may as well
>>>>>>> have the same stupid bug.
>>>>>>
>>>>>> At the moment, only QC SoCs seem to be affected, probably because
>>>>>> everyone else has debugged their hypervisor (or most likely doesn't
>>>>>> bother with shipping one).
>>>>>>
>>>>>> In all honesty, we need some information from QC here: which SoCs are
>>>>>> affected, what is the exact nature of the bug, can it be triggered from
>>>>>> EL0. Randomly papering over symptoms is not something I really like
>>>>>> doing, and is likely to generate problems on unaffected systems.
>>>>>
>>>>> The bug at hand is that the XZR is not deemed a valid source in the
>>>>> virtualization of the SMMU registers. It was identified and fixed for
>>>>> all platforms that are shipping kernels based on v4.9 or later.
>>>>
>>>> When you say "fixed": Do you mean fixed in the firmware? Or by adding
>>>> a workaround in the shipped kernel?
>>>
>>> I mean that it's fixed in the firmware.
>>>
>>>> If the former, is this part of an official QC statement, with an
>>>> associated erratum number?
>>>
>>> I don't know, will get back to you on this one.
>>>
>>>> Is this really limited to the SMMU accesses?
>>>
>>> Yes.
>>>
>>>>> As such Angelo's list of affected platforms covers the high-profile
>>>>> ones. In particular MSM8996 and MSM8998 is getting pretty good support
>>>>> upstream, if we can figure out a way around this issue.
>>>>
>>>> We'd need an exhaustive list of the affected SoCs, and work out if we
>>>> can limit the hack to the SMMU driver (cc'ing Robin, who's the one
>>>> who'd know about it).
>>>
>>> I will try to compose a list.
>>
>> FWIW, I have just been bitten by this issue. I needed to enable an SMMU to
>> filter PCIe EP accesses to system RAM (or something). I'm using an APQ8098
>> MEDIABOX dev board. My system hangs in arm_smmu_device_reset() doing:
>>
>> 	/* Invalidate the TLB, just in case */
>> 	writel_relaxed(0, gr0_base + ARM_SMMU_GR0_TLBIALLH);
>> 	writel_relaxed(0, gr0_base + ARM_SMMU_GR0_TLBIALLNSNH);
>>
>>
>> With the 'Z' constraint, gcc generates:
>>
>> 	str wzr, [x0]
>>
>> without the 'Z' constraint, gcc generates:
>>
>> 	mov	w1, 0
>> 	str w1, [x0]
>>
>>
>> I can work around the problem using the following patch:
>>
>> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
>> index 045d93884164..93117519aed8 100644
>> --- a/drivers/iommu/arm-smmu.c
>> +++ b/drivers/iommu/arm-smmu.c
>> @@ -59,6 +59,11 @@
>>   
>>   #include "arm-smmu-regs.h"
>>   
>> +static inline void qcom_writel(u32 val, volatile void __iomem *addr)
>> +{
>> +	asm volatile("str %w0, [%1]" : : "r" (val), "r" (addr));
>> +}
>> +
>>   #define ARM_MMU500_ACTLR_CPRE		(1 << 1)
>>   
>>   #define ARM_MMU500_ACR_CACHE_LOCK	(1 << 26)
>> @@ -422,7 +427,7 @@ static void __arm_smmu_tlb_sync(struct arm_smmu_device *smmu,
>>   {
>>   	unsigned int spin_cnt, delay;
>>   
>> -	writel_relaxed(0, sync);
>> +	qcom_writel(0, sync);
>>   	for (delay = 1; delay < TLB_LOOP_TIMEOUT; delay *= 2) {
>>   		for (spin_cnt = TLB_SPIN_COUNT; spin_cnt > 0; spin_cnt--) {
>>   			if (!(readl_relaxed(status) & sTLBGSTATUS_GSACTIVE))
>> @@ -1760,8 +1765,8 @@ static void arm_smmu_device_reset(struct arm_smmu_device *smmu)
>>   	}
>>   
>>   	/* Invalidate the TLB, just in case */
>> -	writel_relaxed(0, gr0_base + ARM_SMMU_GR0_TLBIALLH);
>> -	writel_relaxed(0, gr0_base + ARM_SMMU_GR0_TLBIALLNSNH);
>> +	qcom_writel(0, gr0_base + ARM_SMMU_GR0_TLBIALLH);
>> +	qcom_writel(0, gr0_base + ARM_SMMU_GR0_TLBIALLNSNH);
>>   
>>   	reg = readl_relaxed(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0);
>>   
>>
>>
>>
>> Can a quirk be used to work around the issue?
>> Or can we just "pessimize" the 3 writes for everybody?
>> (Might be cheaper than a test anyway)
> 
> If it really is just the SMMU driver which is affected, we can work 
> around it for free (not counting the 'cost' of slightly-weird-looking 
> code, of course). If the diff below works as expected, I'll write it up 
> properly.

Here's another take on the subject. I find it minimally intrusive.
(But I might have overlooked better options.)

diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
index b807cb9b517d..f37149ab1ebf 100644
--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -31,31 +31,37 @@
 #include <asm/alternative.h>
 #include <asm/cpufeature.h>
 
+#ifdef DO_NOT_USE_ZERO_REGISTER
+#define VAL_CONSTRAINT "r"
+#else
+#define VAL_CONSTRAINT "rZ"
+#endif
+
 /*
  * Generic IO read/write.  These perform native-endian accesses.
  */
 #define __raw_writeb __raw_writeb
 static inline void __raw_writeb(u8 val, volatile void __iomem *addr)
 {
-	asm volatile("strb %w0, [%1]" : : "rZ" (val), "r" (addr));
+	asm volatile("strb %w0, [%1]" : : VAL_CONSTRAINT (val), "r" (addr));
 }
 
 #define __raw_writew __raw_writew
 static inline void __raw_writew(u16 val, volatile void __iomem *addr)
 {
-	asm volatile("strh %w0, [%1]" : : "rZ" (val), "r" (addr));
+	asm volatile("strh %w0, [%1]" : : VAL_CONSTRAINT (val), "r" (addr));
 }
 
 #define __raw_writel __raw_writel
 static inline void __raw_writel(u32 val, volatile void __iomem *addr)
 {
-	asm volatile("str %w0, [%1]" : : "rZ" (val), "r" (addr));
+	asm volatile("str %w0, [%1]" : : VAL_CONSTRAINT (val), "r" (addr));
 }
 
 #define __raw_writeq __raw_writeq
 static inline void __raw_writeq(u64 val, volatile void __iomem *addr)
 {
-	asm volatile("str %x0, [%1]" : : "rZ" (val), "r" (addr));
+	asm volatile("str %x0, [%1]" : : VAL_CONSTRAINT (val), "r" (addr));
 }
 
 #define __raw_readb __raw_readb
diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
index f13f36ae1af6..0ce565285603 100644
--- a/drivers/iommu/Makefile
+++ b/drivers/iommu/Makefile
@@ -34,3 +34,5 @@ obj-$(CONFIG_S390_IOMMU) += s390-iommu.o
 obj-$(CONFIG_QCOM_IOMMU) += qcom_iommu.o
 obj-$(CONFIG_HYPERV_IOMMU) += hyperv-iommu.o
 obj-$(CONFIG_VIRTIO_IOMMU) += virtio-iommu.o
+
+CFLAGS_arm-smmu.o := -D DO_NOT_USE_ZERO_REGISTER
