Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3D9F459014
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 15:19:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232953AbhKVOWv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 09:22:51 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:38246 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232494AbhKVOWv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 09:22:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637590785; x=1669126785;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=I9ebxfumPwSxxuTXx4pBRCT0xR9BrzcnkFJgGqjL7l8=;
  b=Tpxw5vBmLBhBKE1UVBr2KekZP6sPs91RBZ0w5x2uSpF1+XmqQMAGL6ku
   xHTuT52thWiJx7yUXIXlJDXm0VPCnQMM0FEPMmMTrz6w10C9ZSr3UG1iO
   YkLMIgo28Tvfl0IlDznasnp2M4skz6GXTwKghpEFlm785OxchKkcDxwtx
   M=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 22 Nov 2021 06:19:44 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2021 06:19:44 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 22 Nov 2021 06:19:44 -0800
Received: from [10.50.17.71] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Mon, 22 Nov
 2021 06:19:40 -0800
Message-ID: <9ef8b483-f15f-eda8-d430-2d01e6cad70e@quicinc.com>
Date:   Mon, 22 Nov 2021 19:49:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCHv4 2/2] arm64/io: Add a header for mmio access
 instrumentation
Content-Language: en-US
To:     Arnd Bergmann <arnd@arndb.de>
CC:     Will Deacon <will@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <quic_psodagud@quicinc.com>, "Marc Zyngier" <maz@kernel.org>,
        gregkh <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>
References: <cover.1636973694.git.quic_saipraka@quicinc.com>
 <9396fbdc415a3096ab271868960372b21479e4fb.1636973694.git.quic_saipraka@quicinc.com>
 <CAK8P3a2Bp4LP7C1-XLKvjyxV-e1vrHb-=3zpm75CRgPYNbY2jA@mail.gmail.com>
 <b07e339c-530d-683c-c626-14b73b42e72a@quicinc.com>
 <1609f1f7-6f61-6e17-d907-c526f09bffe5@quicinc.com>
 <CAK8P3a1KxJFwgock3XiRDZYzT=5PZ=Hsh_8uFv9heoa1rwNqtA@mail.gmail.com>
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
In-Reply-To: <CAK8P3a1KxJFwgock3XiRDZYzT=5PZ=Hsh_8uFv9heoa1rwNqtA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/22/2021 7:29 PM, Arnd Bergmann wrote:
> On Mon, Nov 22, 2021 at 2:35 PM Sai Prakash Ranjan
> <quic_saipraka@quicinc.com> wrote:
>> On 11/19/2021 9:36 AM, Sai Prakash Ranjan wrote:
>>
>> So I looked at logic_iomem.c which seems to be useful for emulated IO
>> for virtio drivers
>> but our usecase just needs to log the mmio operations and no additional
>> stuff, similar to
>> the logging access of x86 msr registers via tracepoint
>> (arch/x86/include/asm/msr-trace.h).
> I think it depends on whether one wants to filter the MMIO access based
> on the device, or based on the caller.
>
>> Also raw read/write macros in logic_iomem.c have the callbacks which
>> seems to be pretty costly
>> than inlining or direct function call given it has to be called for
>> every register read and write
>> which are going to be thousands in our case. In their usecase, read and
>> write callbacks are just
>> pci cfgspace reads and writes which may not be that frequently called
>> and the latency might not
>> be visible but in our case, I think it would be visible if we have a
>> callback as such. I know this is a
>> debug feature and perf isn't expected much but that wouldn't mean we
>> should not have a debug
>> feature which performs better right.
> I would expect the cost of a bus access to always dwarf the cost of
> indirect function calls and instrumentation. On the other hand,
> the cost of an inline trace call is nontrivial in terms of code size,
> which may lead to wasting significant amounts of both RAM and
> instruction cache on small machines. If you want to continue with
> your approach, it would help to include code size numbers before/after
> for a defconfig kernel, and maybe some performance numbers to
> show what this does when you enable tracing for all registers of
> a device with a lot of accesses.

Sure, I will get the numbers for both cases(inline and indirect calls) 
and run some
benchmark tests with register tracing enabled for both cases.


>> On the second point, filtering by ioremap isn't much useful for our
>> usecase since ioremapped
>> region can have 100s of registers and we are interested in the exact
>> register read/write which
>> would cause any of the issues mentioned in the description of this patchset.
>>
>> So I feel like the current way where we consolidate the instrumentation
>> in mmio-instrumented.h
>> seems like the better way than adding tracing to an emulated iomem
>> library.
> There is another point that I don't like in the implementation, which is
> the extra indirection. If we end up with your approach of doing it
> inline per caller, I would prefer having the instrumentation in
> include/asm-generic/io.h, like
>
> #ifndef readl
> #define readl readl
> static inline u32 readl(const volatile void __iomem *addr)
> {
>          u32 val;
>
>          __io_br();
>          val = __le32_to_cpu((__le32 __force)__raw_readl(addr));
>          __io_ar(val);
>          if (tracepoint_enabled(rwmmio_read))
>                 log_read_mmio("readl", addr, val);
>          return val;
> }
> #endif
>
> I think this would be a lot less confusing to readers, as it is implemented
> exactly in the place that has the normal definition, and it can also have
> somewhat more logical semantics by only instrumenting the
> normal/relaxed/ioport accessors but not the __raw_* versions that
> are meant to be little more than a pointer dereference.
>
>           Arnd

But how is this different from logic in atomic-instrumented.h which also 
has asm-generic version?
Initial review few years back mentioned about having something similar 
to atomic instrumentation
and hence it was implemented with the similar approach keeping 
instrumentation out of arch specific
details.
And if we do move this instrumentation to asm-generic/io.h, how will 
that be executed since
the arch specifc read{b,w,l,q} overrides this generic version?

Thanks,
Sai
