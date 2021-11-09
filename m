Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 685BF44B111
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 17:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238703AbhKIQZX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 11:25:23 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:17281 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238397AbhKIQZX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 11:25:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1636474957; x=1668010957;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=arA5NuLJ5w1GwDIRETabm4JkNQQtn8VKJ8rknKRj7tQ=;
  b=tUEz+xggtXFmVp97lOJAA+hJaiSjYaIuP7SQD1+cS8qxLDKtvHapuLnP
   BwJsAXq1Ly1tM4e456tpxCu70oxO5WPAIXDia972njxkTurWkU9YuFTPR
   YbgtQ8Qawg9JOqsNAJo2sUbbUC3V9SSZ5EQy6w+FIXlFgCO7DYff38HK2
   s=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 09 Nov 2021 08:22:36 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 08:22:36 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 9 Nov 2021 08:22:36 -0800
Received: from [10.50.19.148] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Tue, 9 Nov 2021
 08:22:30 -0800
Message-ID: <f7c665b9-dc17-5a7f-de80-9fa0605721fc@quicinc.com>
Date:   Tue, 9 Nov 2021 21:52:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCHv3 3/3] dynamic_debug: Add a flag for dynamic event tracing
Content-Language: en-US
To:     Steven Rostedt <rostedt@goodmis.org>
CC:     Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <quic_psodagud@quicinc.com>, Marc Zyngier <maz@kernel.org>,
        <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <mingo@redhat.com>, <jbaron@akamai.com>, <jim.cromie@gmail.com>
References: <cover.1636452784.git.quic_saipraka@quicinc.com>
 <3706af20bc64a320ff8f3ff8950738b988f4bdf5.1636452784.git.quic_saipraka@quicinc.com>
 <20211109104941.2d50eafc@gandalf.local.home>
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
In-Reply-To: <20211109104941.2d50eafc@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Steve,

On 11/9/2021 9:19 PM, Steven Rostedt wrote:
> On Tue, 9 Nov 2021 17:38:21 +0530
> Sai Prakash Ranjan <quic_saipraka@quicinc.com> wrote:
>
>> Debugging a specific driver or subsystem can be a lot easier if we can
>> trace events specific to that driver or subsystem. This type of
>> filtering can be achieved using existing dynamic debug library which
>> provides a way to filter based on files, functions and modules.
>>
>> Using this, provide an additional flag 'e' to filter event tracing to
>> specified input.
>>
>> For example, tracing all MMIO read/write can be overwhelming and of no
>> use when debugging a specific driver or a subsystem. So switch to
>> dynamic event tracing for register accesses.
>>
>> Example: Tracing register accesses for all drivers in drivers/soc/qcom/*
>> and the trace output is given below:
>>
>>    # dyndbg="file drivers/soc/qcom/* +e" trace_event=rwmmio
>>      or
>>    # echo "file drivers/soc/qcom/* +e" > /sys/kernel/debug/dynamic_debug/control
>>    # cat /sys/kernel/debug/tracing/trace
> FYI, it's best to use /sys/kernel/tracing, as the debug/tracing is only
> there for backward compatibility.

Ah I see, will correct it.


>>      rwmmio_read: rpmh_rsc_probe+0x35c/0x410 readl addr=0xffff80001071000c
>>      rwmmio_read: rpmh_rsc_probe+0x3d0/0x410 readl addr=0xffff800010710004
>>      rwmmio_write: rpmh_rsc_probe+0x3b0/0x410 writel addr=0xffff800010710d00 val=0x3
>>      rwmmio_write: write_tcs_cmd+0x6c/0x78 writel addr=0xffff800010710d30 val=0x10108
> I'd much rather have a module name or something attached to the event that
> ca be filtered on via the trace event filters, than having it determined by
> some side effect done in another directory.

I presume we don't have CALLER_MODULENAME0,1,2.. like CALLER_ADDR0,1,2 
without which we
cannot insert the module name to this trace event since MMIO accessors 
are defined in low level
arch headers and we won't get any useful module information from where 
these accessors are
called. The function name and the offset is good enough to identify the 
exact line and module after
post-processing with tools like GDB, objdump, so I feel we can keep the 
trace event fields limited?

Thanks,
Sai

>
> -- Steve


