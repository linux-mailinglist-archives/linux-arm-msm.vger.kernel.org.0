Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C698459191
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 16:43:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239884AbhKVPq6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 10:46:58 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:64869 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234686AbhKVPq6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 10:46:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637595831; x=1669131831;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HHlZvgmdZ+PFsXOrt+M1Oftp4tKN2JLegGy2ST+BHpM=;
  b=E2X6+PvDC33iYIQhKTnrw7DbybeMM3Wg0i3fZXysYPr+mGRaZdEklJKN
   wNNRG6+7PT48PFk7fb0LpgNO+XFKUbVw3sObnivYWmno67bcalT0gAlsD
   1jFeKGsJ2hqdj2Ni4ixfVkFvsI4jYj1FgDrMtWidpB5cFPtM0ybmBbxZm
   k=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 22 Nov 2021 07:43:51 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2021 07:43:51 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 22 Nov 2021 07:43:50 -0800
Received: from [10.50.17.71] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Mon, 22 Nov
 2021 07:43:41 -0800
Message-ID: <d216f201-183f-c253-495d-1d9203141a63@quicinc.com>
Date:   Mon, 22 Nov 2021 21:13:30 +0530
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
 <4ed41054-3868-d5e2-9958-56250b7f9be0@quicinc.com>
 <CAK8P3a07sMdR9NUz5AOJk+O-op9qLU_PjnhvqvTz9xrHE7NXEg@mail.gmail.com>
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
In-Reply-To: <CAK8P3a07sMdR9NUz5AOJk+O-op9qLU_PjnhvqvTz9xrHE7NXEg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/22/2021 9:05 PM, Arnd Bergmann wrote:
> On Mon, Nov 22, 2021 at 3:59 PM Sai Prakash Ranjan
> <quic_saipraka@quicinc.com> wrote:
>>>> And if we do move this instrumentation to asm-generic/io.h, how will
>>>> that be executed since
>>>> the arch specifc read{b,w,l,q} overrides this generic version?
>>> As I understand it, your version also requires architecture specific
>>> changes, so that would be the same: it only works for architectures
>>> that get the definition of readl()/readl_relaxed()/inl()/... from
>>> include/asm-generic/io.h and only override the __raw version. Arnd
>> Sorry, I didn't get this part, so  I am trying this on ARM64:
>>
>> arm64/include/asm/io.h has read{b,l,w,q} defined.
>> include/asm-generic/io.h has below:
>>     #ifndef readl
>>     #define readl readl
>>     static inline u32 readl(const volatile void __iomem *addr)
>>
>> and we include asm-generic/io.h in arm64/include/asm/io.h at the end
>> after the definitions for arm64 mmio accesors.
>> So arch implementation here overrides generic ones as I see it, am I
>> missing something? I even confirmed this
>> with some trace_printk to generic and arch specific definitions of readl
>> and I see arch specific ones being called.
> Ah, you are right that the arm64 version currently has custom definitions
> of the high-level interfaces. These predate the introduction of the
> __io_{p,}{b,a}{r,w} macros and are currently only used on risc-v.
>
> I think in this case you should start by changing arm64 to use the
> generic readl() etc definitions, by removing the extra definitions and
> using
>
> #define __io_ar(v) __iormb(__v)
> #define __io_bw() dma_wmb()
>
>

Sure, will do that.

Thanks,
Sai
