Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A87D457052
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 15:09:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234119AbhKSOML (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Nov 2021 09:12:11 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:11275 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbhKSOML (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Nov 2021 09:12:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637330950; x=1668866950;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RzKaAcngVk8ke6sw4Hmes1jEcz67SzLurWxT4aZMDsQ=;
  b=LB0Xko3FFjwMvdYXlpKECp57Ih7gr7BlYMS+qiFm8HbiewyMTfTWI2IF
   WwFWoZz2IqHUU8TPBhptWl5d6lKhaQ2eav0egthc9qgsKUjciAv791JWL
   V/HIZDQT3JHdqwm89zMzkksgb5R2p6sNAuo99sDfMw6u3sdFMlmEFddut
   s=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 19 Nov 2021 06:09:09 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2021 06:09:08 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 19 Nov 2021 06:09:08 -0800
Received: from [10.50.57.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Fri, 19 Nov
 2021 06:09:04 -0800
Message-ID: <92acd810-28c1-6f6f-512a-a961311dfa88@quicinc.com>
Date:   Fri, 19 Nov 2021 19:39:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCHv4 2/2] arm64/io: Add a header for mmio access
 instrumentation
Content-Language: en-US
To:     Marc Zyngier <maz@kernel.org>
CC:     Will Deacon <will@kernel.org>, <rostedt@goodmis.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <quic_psodagud@quicinc.com>, <gregkh@linuxfoundation.org>,
        <arnd@arndb.de>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <mingo@redhat.com>
References: <cover.1636973694.git.quic_saipraka@quicinc.com>
 <9396fbdc415a3096ab271868960372b21479e4fb.1636973694.git.quic_saipraka@quicinc.com>
 <87a6i06ytr.wl-maz@kernel.org>
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
In-Reply-To: <87a6i06ytr.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/19/2021 7:18 PM, Marc Zyngier wrote:
> On Mon, 15 Nov 2021 11:33:30 +0000,
> Sai Prakash Ranjan <quic_saipraka@quicinc.com> wrote:
>> The new generic header mmio-instrumented.h will keep arch code clean
>> and separate from instrumented version which traces mmio register
>> accesses. This instrumented header is generic and can be used by other
>> architectures as well. Also add a generic flag (__DISABLE_TRACE_MMIO__)
>> which is used to disable MMIO tracing in nVHE and if required can be
>> used to disable tracing for specific drivers.
>>
>> Signed-off-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
>> ---
>>   arch/arm64/include/asm/io.h       | 25 ++++-------
>>   arch/arm64/kvm/hyp/nvhe/Makefile  |  2 +-
>>   include/linux/mmio-instrumented.h | 70 +++++++++++++++++++++++++++++++
>>   3 files changed, 80 insertions(+), 17 deletions(-)
>>   create mode 100644 include/linux/mmio-instrumented.h
>>
>> diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
>> index 7fd836bea7eb..a635aaaf81b9 100644
>> --- a/arch/arm64/include/asm/io.h
>> +++ b/arch/arm64/include/asm/io.h
>> @@ -10,6 +10,7 @@
>>   
>>   #include <linux/types.h>
>>   #include <linux/pgtable.h>
>> +#include <linux/mmio-instrumented.h>
>>   
>>   #include <asm/byteorder.h>
>>   #include <asm/barrier.h>
>> @@ -21,32 +22,27 @@
>>   /*
>>    * Generic IO read/write.  These perform native-endian accesses.
>>    */
>> -#define __raw_writeb __raw_writeb
>> -static inline void __raw_writeb(u8 val, volatile void __iomem *addr)
>> +static inline void arch_raw_writeb(u8 val, volatile void __iomem *addr)
>>   {
>>   	asm volatile("strb %w0, [%1]" : : "rZ" (val), "r" (addr));
>>   }
>>   
>> -#define __raw_writew __raw_writew
>> -static inline void __raw_writew(u16 val, volatile void __iomem *addr)
>> +static inline void arch_raw_writew(u16 val, volatile void __iomem *addr)
>>   {
>>   	asm volatile("strh %w0, [%1]" : : "rZ" (val), "r" (addr));
>>   }
>>   
>> -#define __raw_writel __raw_writel
>> -static __always_inline void __raw_writel(u32 val, volatile void __iomem *addr)
>> +static __always_inline void arch_raw_writel(u32 val, volatile void __iomem *addr)
>>   {
>>   	asm volatile("str %w0, [%1]" : : "rZ" (val), "r" (addr));
>>   }
>>   
>> -#define __raw_writeq __raw_writeq
>> -static inline void __raw_writeq(u64 val, volatile void __iomem *addr)
>> +static inline void arch_raw_writeq(u64 val, volatile void __iomem *addr)
>>   {
>>   	asm volatile("str %x0, [%1]" : : "rZ" (val), "r" (addr));
>>   }
>>   
>> -#define __raw_readb __raw_readb
>> -static inline u8 __raw_readb(const volatile void __iomem *addr)
>> +static inline u8 arch_raw_readb(const volatile void __iomem *addr)
>>   {
>>   	u8 val;
>>   	asm volatile(ALTERNATIVE("ldrb %w0, [%1]",
>> @@ -56,8 +52,7 @@ static inline u8 __raw_readb(const volatile void __iomem *addr)
>>   	return val;
>>   }
>>   
>> -#define __raw_readw __raw_readw
>> -static inline u16 __raw_readw(const volatile void __iomem *addr)
>> +static inline u16 arch_raw_readw(const volatile void __iomem *addr)
>>   {
>>   	u16 val;
>>   
>> @@ -68,8 +63,7 @@ static inline u16 __raw_readw(const volatile void __iomem *addr)
>>   	return val;
>>   }
>>   
>> -#define __raw_readl __raw_readl
>> -static __always_inline u32 __raw_readl(const volatile void __iomem *addr)
>> +static __always_inline u32 arch_raw_readl(const volatile void __iomem *addr)
>>   {
>>   	u32 val;
>>   	asm volatile(ALTERNATIVE("ldr %w0, [%1]",
>> @@ -79,8 +73,7 @@ static __always_inline u32 __raw_readl(const volatile void __iomem *addr)
>>   	return val;
>>   }
>>   
>> -#define __raw_readq __raw_readq
>> -static inline u64 __raw_readq(const volatile void __iomem *addr)
>> +static inline u64 arch_raw_readq(const volatile void __iomem *addr)
>>   {
>>   	u64 val;
>>   	asm volatile(ALTERNATIVE("ldr %0, [%1]",
>> diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
>> index c3c11974fa3b..ff56d2165ea9 100644
>> --- a/arch/arm64/kvm/hyp/nvhe/Makefile
>> +++ b/arch/arm64/kvm/hyp/nvhe/Makefile
>> @@ -4,7 +4,7 @@
>>   #
>>   
>>   asflags-y := -D__KVM_NVHE_HYPERVISOR__ -D__DISABLE_EXPORTS
>> -ccflags-y := -D__KVM_NVHE_HYPERVISOR__ -D__DISABLE_EXPORTS
>> +ccflags-y := -D__KVM_NVHE_HYPERVISOR__ -D__DISABLE_EXPORTS -D__DISABLE_TRACE_MMIO__
>>   
>>   hostprogs := gen-hyprel
>>   HOST_EXTRACFLAGS += -I$(objtree)/include
>> diff --git a/include/linux/mmio-instrumented.h b/include/linux/mmio-instrumented.h
>> new file mode 100644
>> index 000000000000..99979c025cc1
>> --- /dev/null
>> +++ b/include/linux/mmio-instrumented.h
>> @@ -0,0 +1,70 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef _LINUX_MMIO_INSTRUMENTED_H
>> +#define _LINUX_MMIO_INSTRUMENTED_H
>> +
>> +#include <linux/tracepoint-defs.h>
>> +
>> +/*
>> + * Tracepoint and MMIO logging symbols should not be visible at EL2(HYP) as
>> + * there is no way to execute them and any such MMIO access from EL2 will
>> + * explode instantly (Words of Marc Zyngier). So introduce a generic flag
>> + * __DISABLE_TRACE_MMIO__ to disable MMIO tracing in nVHE and other drivers
>> + * if required.
>> + */
> This Gospel would be better placed next to the code that defines the
> macro, given that this is an arch-independent include file, and hardly
> anyone understands the quirks of a nVHE KVM (and only nVHE, something
> that the comment fails to capture).
>
> 	M.
>

I'll move the comment and include nVHE in the comment as well.

Thanks,
Sai
