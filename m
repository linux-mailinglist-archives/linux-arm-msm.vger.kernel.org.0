Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3E6645704B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 15:07:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230296AbhKSOK2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Nov 2021 09:10:28 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:30797 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbhKSOK1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Nov 2021 09:10:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637330846; x=1668866846;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5I3N5IfAvO2BfTMzWJajgsfZI/vacIAWuRSlbSeMXbg=;
  b=WFuJKZPHpmbf5EdoXKz25O0wmSRicEOMYAdzTU4+yDnfxyH7ydNQjBI1
   rlNdrUrUW3409jRtt42g1+3LRR33TmXLyqznJCg3OSeZSdn8ORPKECDQt
   /qIHG8ekzROEvyVdXetw9rYxpV1CsFV2tqdPjPTmWaMFhUHLYPkWzrBXw
   I=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 19 Nov 2021 06:07:25 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2021 06:07:24 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 19 Nov 2021 06:07:17 -0800
Received: from [10.50.57.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Fri, 19 Nov
 2021 06:07:12 -0800
Message-ID: <6148397c-0565-d1ca-2f53-d15adcb9b6b8@quicinc.com>
Date:   Fri, 19 Nov 2021 19:37:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCHv4 1/2] tracing: Add register read/write tracing support
Content-Language: en-US
To:     Marc Zyngier <maz@kernel.org>
CC:     Will Deacon <will@kernel.org>, <rostedt@goodmis.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <quic_psodagud@quicinc.com>, <gregkh@linuxfoundation.org>,
        <arnd@arndb.de>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <mingo@redhat.com>, Prasad Sodagudi <psodagud@codeaurora.org>
References: <cover.1636973694.git.quic_saipraka@quicinc.com>
 <4bd519d008cac6b319be7c5ce144e741f7210031.1636973694.git.quic_saipraka@quicinc.com>
 <87bl2g6z2v.wl-maz@kernel.org>
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
In-Reply-To: <87bl2g6z2v.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/19/2021 7:13 PM, Marc Zyngier wrote:
> On Mon, 15 Nov 2021 11:33:29 +0000,
> Sai Prakash Ranjan <quic_saipraka@quicinc.com> wrote:
>> From: Prasad Sodagudi <psodagud@codeaurora.org>
>>
>> Generic MMIO read/write i.e., __raw_{read,write}{b,l,w,q} accessors
>> are typically used to read/write from/to memory mapped registers
>> and can cause hangs or some undefined behaviour in following few
>> cases,
>>
>> * If the access to the register space is unclocked, for example: if
>>    there is an access to multimedia(MM) block registers without MM
>>    clocks.
>>
>> * If the register space is protected and not set to be accessible from
>>    non-secure world, for example: only EL3 (EL: Exception level) access
>>    is allowed and any EL2/EL1 access is forbidden.
>>
>> * If xPU(memory/register protection units) is controlling access to
>>    certain memory/register space for specific clients.
>>
>> and more...
>>
>> Such cases usually results in instant reboot/SErrors/NOC or interconnect
>> hangs and tracing these register accesses can be very helpful to debug
>> such issues during initial development stages and also in later stages.
>>
>> So use ftrace trace events to log such MMIO register accesses which
>> provides rich feature set such as early enablement of trace events,
>> filtering capability, dumping ftrace logs on console and many more.
>>
>> Sample output:
>>
>> rwmmio_read: gic_peek_irq+0xd0/0xd8 readl addr=0xffff800010040104
>> rwmmio_write: gic_poke_irq+0xe4/0xf0 writel addr=0xffff800010040184
>> rwmmio_read: gic_do_wait_for_rwp+0x54/0x90 readl addr=0xffff800010040000
>> rwmmio_write: gic_set_affinity+0x1bc/0x1e8 writeq addr=0xffff800010046130
>>
>> Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
>> [saiprakash: Rewrote commit msg and trace event field edits]
>> Signed-off-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
>> ---
>>
>> Have dropped value parameter for mmio write trace event as that
>> was causing hangs in strange ways, i.e., if we pass any other
>> 64bit value, it works fine but passing value would just hang.
>> Not just using the log apis, even simple trace_printk with value
>> printed would cause hang. It wasn't noticed in early version
>> because dyndbg would filter the logging in my system (I had
>> set it to trace only specific qcom directory) but once this
>> version starts recording all the reads/writes with value passed,
>> it just hangs system when rwmmio write event tracing is enabled.
> Why is that so? Not being able to track the value written out makes
> the feature pretty useless if you're not writing fixed values.
>
>> Reason why we wouldn't need value along with mmio write log is
>> that value can be easily deduced from the caller_name+offset which is
>> printed already by the rwmmio trace events which gives the exact
>> location of mmio writes and the value is easily known from the driver.
> That's a very narrow view of what can be written in an MMIO
> registers. We write dynamic values at all times, and if we are able to
> trace MMIO writes, then the value written out must be part of the trace.
>
> I'd rather you try and get to the bottom of this issue rather than
> paper over it.
>
> Thanks,
>
> 	M.
>

Sure, idea was to put it out in the open if anyone has any idea as to 
what might be happening
there since the version where directly instrumenting the raw read/write 
accessors in arm64/asm/io.h
was working fine casting doubts if this has to do something with 
inlining as Arnd mentioned before.

Thanks,
Sai
