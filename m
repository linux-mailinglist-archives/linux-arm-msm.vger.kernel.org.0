Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 887584568ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 05:06:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232804AbhKSEJt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 23:09:49 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:7611 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232490AbhKSEJt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 23:09:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637294808; x=1668830808;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mc3p1/vze472QUPd1K/un9kqoXLEtMTgCLIFsF/85cI=;
  b=WZna3OQk4pmvxilg/5ZgNSO1X/Gk/4qm7tiuG/nX1YfBaVgHiJ9WUERb
   DsPGSICKtjRNAQL9m8sUJvu6kef2DIzR+prxbALy2G3frshHS/bOnWxSn
   CuCgJLJTUQN7bvuNSaiCmnwddCXiNWlE4Wa3+PRIkjWxXR7CwYoRB43TB
   Q=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 18 Nov 2021 20:06:47 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2021 20:06:46 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 18 Nov 2021 20:06:46 -0800
Received: from [10.50.58.186] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Thu, 18 Nov
 2021 20:06:42 -0800
Message-ID: <b07e339c-530d-683c-c626-14b73b42e72a@quicinc.com>
Date:   Fri, 19 Nov 2021 09:36:39 +0530
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
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
In-Reply-To: <CAK8P3a2Bp4LP7C1-XLKvjyxV-e1vrHb-=3zpm75CRgPYNbY2jA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Arnd,

On 11/18/2021 8:54 PM, Arnd Bergmann wrote:
> On Mon, Nov 15, 2021 at 12:33 PM Sai Prakash Ranjan
> <quic_saipraka@quicinc.com> wrote:
>>   /*
>>    * Generic IO read/write.  These perform native-endian accesses.
>>    */
>> -#define __raw_writeb __raw_writeb
>> -static inline void __raw_writeb(u8 val, volatile void __iomem *addr)
>> +static inline void arch_raw_writeb(u8 val, volatile void __iomem *addr)
>>   {
>>          asm volatile("strb %w0, [%1]" : : "rZ" (val), "r" (addr));
>>   }
> Woundn't removing the #define here will break the logic in
> include/asm-generic/io.h,
> making it fall back to the pointer-dereference version for the actual access?

#defines for these are added in mmio-instrumented.h header which is 
included in
arm64/asm/io.h, so it won't break the logic by falling back to 
pointer-dereference.

>> +#if IS_ENABLED(CONFIG_TRACE_MMIO_ACCESS) && !(defined(__DISABLE_TRACE_MMIO__))
>> +DECLARE_TRACEPOINT(rwmmio_write);
>> +DECLARE_TRACEPOINT(rwmmio_read);
>> +
>> +void log_write_mmio(const char *width, volatile void __iomem *addr);
>> +void log_read_mmio(const char *width, const volatile void __iomem *addr);
>> +
>> +#define __raw_write(v, a, _l)  ({                              \
>> +       volatile void __iomem *_a = (a);                        \
>> +       if (tracepoint_enabled(rwmmio_write))                   \
>> +               log_write_mmio(__stringify(write##_l), _a);     \
>> +       arch_raw_write##_l((v), _a);                            \
>> +       })
> This feels like it's getting too big to be inlined. Have you considered
> integrating this with the lib/logic_iomem.c infrastructure instead?
>
> That already provides a way to override MMIO areas, and it lets you do
> the logging from a single place rather than having it duplicated in every
> single caller. It also provides a way of filtering it based on the ioremap()
> call.
>

Thanks for the suggestion, will look at the logic_iomem.c and see if it 
fits our
usecase.

Thanks,
Sai


