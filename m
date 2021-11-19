Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA5A245718E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 16:20:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233116AbhKSPXw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Nov 2021 10:23:52 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:43782 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230064AbhKSPXv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Nov 2021 10:23:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637335250; x=1668871250;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Mt3C3Hu5WtObbim4daMDmr125MdIPSYL7I7jQTBfW5E=;
  b=B4qqhWrnjZ5qmOz7COmzzdD+75qHXCH9YVPLgGE5L/8zQ4CnovTKYG5l
   SgTj2oLjywWtteU6e+CYmhiWj4GGXIkt5CgrC1e67FaKO90mSnkSV+bUo
   wRGwTiBvh3isEo7Gf/dPfQPfzgP2mFS3rvxaAxsvLQQFqQsMIEU86msCQ
   Y=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 19 Nov 2021 07:20:49 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2021 07:20:49 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 19 Nov 2021 07:20:48 -0800
Received: from [10.50.57.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Fri, 19 Nov
 2021 07:20:02 -0800
Message-ID: <440b7e8b-a15b-c394-9797-65226717b1d4@quicinc.com>
Date:   Fri, 19 Nov 2021 20:49:53 +0530
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
 <6148397c-0565-d1ca-2f53-d15adcb9b6b8@quicinc.com>
 <878rxk6xhg.wl-maz@kernel.org>
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
In-Reply-To: <878rxk6xhg.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/19/2021 7:47 PM, Marc Zyngier wrote:
> On Fri, 19 Nov 2021 14:07:09 +0000,
> Sai Prakash Ranjan <quic_saipraka@quicinc.com> wrote:
>> On 11/19/2021 7:13 PM, Marc Zyngier wrote:
>>> On Mon, 15 Nov 2021 11:33:29 +0000,
>>> Sai Prakash Ranjan <quic_saipraka@quicinc.com> wrote:
>>>> From: Prasad Sodagudi <psodagud@codeaurora.org>
>>>>
> [...]
>
>>>> Reason why we wouldn't need value along with mmio write log is
>>>> that value can be easily deduced from the caller_name+offset which is
>>>> printed already by the rwmmio trace events which gives the exact
>>>> location of mmio writes and the value is easily known from the driver.
>>> That's a very narrow view of what can be written in an MMIO
>>> registers. We write dynamic values at all times, and if we are able to
>>> trace MMIO writes, then the value written out must be part of the trace.
>>>
>>> I'd rather you try and get to the bottom of this issue rather than
>>> paper over it.
>>>
>>> Thanks,
>>>
>>> 	M.
>>>
>> Sure, idea was to put it out in the open if anyone has any idea as
>> to what might be happening there since the version where directly
>> instrumenting the raw read/write accessors in arm64/asm/io.h was
>> working fine casting doubts if this has to do something with
>> inlining as Arnd mentioned before.
> Yup. I wouldn't be surprised if MMIO accessors were getting directly
> inlined at the wrong location and creating havoc. For example:
>
> 	writel(readl(addr1) | 1, addr2);
>
> If you're not careful about capturing the result of the read rather
> than the read itself, you can end-up with something really funky. No
> idea if that's what is happening, but a disassembly of the generated
> code could tell you.
>
> 	M.
>

I did that initially (compare the disassembly in working and non-working 
case) but didn't find
anything noticeable, maybe I need to look some more. Thanks for the 
suggestion.

Thanks,
Sai
