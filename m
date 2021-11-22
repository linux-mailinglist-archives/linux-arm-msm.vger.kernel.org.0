Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D0664590AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 15:59:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239555AbhKVPCs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 10:02:48 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:28754 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234298AbhKVPCs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 10:02:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637593182; x=1669129182;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=A95SZUiBMQnSyLdP9iK6Je7MDarxoRjVsAbo3E7jjkc=;
  b=oDUdnExkh4PnHsqDkRblvVs8sWAgjXkEqoku4ccgcdV40WJAbPOTcAAl
   zOpvSBybnYU33E1kV7Uawo3q5kN9lBVVV0KSh/Z7mt/I7tEtDAsGp7lG4
   gzHDD1HXeSP91Cdq3UygyYFG2fP3PJ7EoRlnfAQNpJUPnLpKmdvqBf4a5
   w=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 22 Nov 2021 06:59:41 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2021 06:59:41 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 22 Nov 2021 06:59:41 -0800
Received: from [10.50.17.71] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Mon, 22 Nov
 2021 06:59:09 -0800
Message-ID: <4ed41054-3868-d5e2-9958-56250b7f9be0@quicinc.com>
Date:   Mon, 22 Nov 2021 20:29:05 +0530
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
 <9ef8b483-f15f-eda8-d430-2d01e6cad70e@quicinc.com>
 <CAK8P3a0Zo+PTGAAvisAZamfLUm1ToGZpmHDn-Xk0Eo8TTRGyZg@mail.gmail.com>
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
In-Reply-To: <CAK8P3a0Zo+PTGAAvisAZamfLUm1ToGZpmHDn-Xk0Eo8TTRGyZg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/22/2021 8:00 PM, Arnd Bergmann wrote:
> On Mon, Nov 22, 2021 at 3:19 PM Sai Prakash Ranjan
> <quic_saipraka@quicinc.com> wrote:
>> On 11/22/2021 7:29 PM, Arnd Bergmann wrote:
>>> I think this would be a lot less confusing to readers, as it is implemented
>>> exactly in the place that has the normal definition, and it can also have
>>> somewhat more logical semantics by only instrumenting the
>>> normal/relaxed/ioport accessors but not the __raw_* versions that
>>> are meant to be little more than a pointer dereference.
>> But how is this different from logic in atomic-instrumented.h which also
>> has asm-generic version?
>> Initial review few years back mentioned about having something similar
>> to atomic instrumentation
>> and hence it was implemented with the similar approach keeping
>> instrumentation out of arch specific details.
> This is only a cosmetic difference. I usually prefer fewer indirections,
> and I like the way that include/asm-generic/io.h only has all the
> normal 'static inline' definitions spelled out, and calling the __raw_*
> versions. Your version adds an extra layer with the arch_raw_readl(),
> which I'd prefer to avoid.

I'm ok with your preference as long as we have some way to log these 
MMIO accesses.

>> And if we do move this instrumentation to asm-generic/io.h, how will
>> that be executed since
>> the arch specifc read{b,w,l,q} overrides this generic version?
> As I understand it, your version also requires architecture specific 
> changes, so that would be the same: it only works for architectures 
> that get the definition of readl()/readl_relaxed()/inl()/... from 
> include/asm-generic/io.h and only override the __raw version. Arnd

Sorry, I didn't get this part, so  I am trying this on ARM64:

arm64/include/asm/io.h has read{b,l,w,q} defined.
include/asm-generic/io.h has below:
   #ifndef readl
   #define readl readl
   static inline u32 readl(const volatile void __iomem *addr)

and we include asm-generic/io.h in arm64/include/asm/io.h at the end 
after the definitions for arm64 mmio accesors.
So arch implementation here overrides generic ones as I see it, am I 
missing something? I even confirmed this
with some trace_printk to generic and arch specific definitions of readl 
and I see arch specific ones being called.

Thanks,
Sai
