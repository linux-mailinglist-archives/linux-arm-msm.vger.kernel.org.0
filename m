Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67930458F80
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 14:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239142AbhKVNiw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 08:38:52 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:50170 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239596AbhKVNim (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 08:38:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637588136; x=1669124136;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=cBKE7DsIO9ldDXiWzOxodyQ42xZOcS0Is5uPiU7XjQ0=;
  b=bs5LLuOXEfsis2yjBJ/0HR5meW5zoe7QvX9J5VHsYYLhLNokH5uoBPnp
   m7VWp3Wd5A2ciCWcrLX8yCf0BNSyXvvg4FkwJGjMk5X/EWjjxYT5NduM3
   +640JrOwIk4VVIzOP9QnypMhBtk13dgLJWXVuinvpTGJ4mvSRYWZ2KX84
   s=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 22 Nov 2021 05:35:36 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2021 05:35:35 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 22 Nov 2021 05:35:34 -0800
Received: from [10.50.57.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Mon, 22 Nov
 2021 05:35:31 -0800
Message-ID: <1609f1f7-6f61-6e17-d907-c526f09bffe5@quicinc.com>
Date:   Mon, 22 Nov 2021 19:05:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCHv4 2/2] arm64/io: Add a header for mmio access
 instrumentation
Content-Language: en-US
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
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
In-Reply-To: <b07e339c-530d-683c-c626-14b73b42e72a@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/19/2021 9:36 AM, Sai Prakash Ranjan wrote:
> Hi Arnd,
>
> On 11/18/2021 8:54 PM, Arnd Bergmann wrote:
>> On Mon, Nov 15, 2021 at 12:33 PM Sai Prakash Ranjan
>> <quic_saipraka@quicinc.com> wrote:
>>>   /*
>>>    * Generic IO read/write.  These perform native-endian accesses.
>>>    */
>>> -#define __raw_writeb __raw_writeb
>>> -static inline void __raw_writeb(u8 val, volatile void __iomem *addr)
>>> +static inline void arch_raw_writeb(u8 val, volatile void __iomem 
>>> *addr)
>>>   {
>>>          asm volatile("strb %w0, [%1]" : : "rZ" (val), "r" (addr));
>>>   }
>> Woundn't removing the #define here will break the logic in
>> include/asm-generic/io.h,
>> making it fall back to the pointer-dereference version for the actual 
>> access?
>
> #defines for these are added in mmio-instrumented.h header which is 
> included in
> arm64/asm/io.h, so it won't break the logic by falling back to 
> pointer-dereference.
>
>>> +#if IS_ENABLED(CONFIG_TRACE_MMIO_ACCESS) && 
>>> !(defined(__DISABLE_TRACE_MMIO__))
>>> +DECLARE_TRACEPOINT(rwmmio_write);
>>> +DECLARE_TRACEPOINT(rwmmio_read);
>>> +
>>> +void log_write_mmio(const char *width, volatile void __iomem *addr);
>>> +void log_read_mmio(const char *width, const volatile void __iomem 
>>> *addr);
>>> +
>>> +#define __raw_write(v, a, _l) ({                              \
>>> +       volatile void __iomem *_a = (a);                        \
>>> +       if (tracepoint_enabled(rwmmio_write))                   \
>>> +               log_write_mmio(__stringify(write##_l), _a);     \
>>> +       arch_raw_write##_l((v), _a);                            \
>>> +       })
>> This feels like it's getting too big to be inlined. Have you considered
>> integrating this with the lib/logic_iomem.c infrastructure instead?
>>
>> That already provides a way to override MMIO areas, and it lets you do
>> the logging from a single place rather than having it duplicated in 
>> every
>> single caller. It also provides a way of filtering it based on the 
>> ioremap()
>> call.
>>
>
> Thanks for the suggestion, will look at the logic_iomem.c and see if 
> it fits our
> usecase.
>
>

So I looked at logic_iomem.c which seems to be useful for emulated IO 
for virtio drivers
but our usecase just needs to log the mmio operations and no additional 
stuff, similar to
the logging access of x86 msr registers via tracepoint 
(arch/x86/include/asm/msr-trace.h).
Also raw read/write macros in logic_iomem.c have the callbacks which 
seems to be pretty costly
than inlining or direct function call given it has to be called for 
every register read and write
which are going to be thousands in our case. In their usecase, read and 
write callbacks are just
pci cfgspace reads and writes which may not be that frequently called 
and the latency might not
be visible but in our case, I think it would be visible if we have a 
callback as such. I know this is a
debug feature and perf isn't expected much but that wouldn't mean we 
should not have a debug
feature which performs better right.

On the second point, filtering by ioremap isn't much useful for our 
usecase since ioremapped
region can have 100s of registers and we are interested in the exact 
register read/write which
would cause any of the issues mentioned in the description of this patchset.

So I feel like the current way where we consolidate the instrumentation 
in mmio-instrumented.h
seems like the better way than adding tracing to an emulated iomem library.

Thanks,
Sai
