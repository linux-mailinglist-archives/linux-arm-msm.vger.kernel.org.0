Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1265344B200
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 18:30:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234677AbhKIRd1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 12:33:27 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:24053 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238382AbhKIRdK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 12:33:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1636479024; x=1668015024;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bUKfBTTjjlA9eFUhmWx/Hg6n+E40zgyh3j2DQSOIXpM=;
  b=sVkca0l5+nuZU0/IT6ZaEDMGxPqw7HatTY7O3L75yNYic+wYjAv3474l
   C5TDuFX/7Hdg+L8VodyWsMgIUlYEgs1aDOd0yuFlYAdiGTw+pOT6VhS1P
   8c0Aq5auXBCGsp2og97ebYQZ7OY7/6dd1JS2gZRHvEUNTasoyrMG1jbKC
   A=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 09 Nov 2021 09:30:23 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 09:30:23 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 9 Nov 2021 09:30:21 -0800
Received: from [10.50.19.148] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Tue, 9 Nov 2021
 09:30:16 -0800
Message-ID: <264b77dd-5509-60f9-248c-a93135b01aa9@quicinc.com>
Date:   Tue, 9 Nov 2021 23:00:11 +0530
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
 <f7c665b9-dc17-5a7f-de80-9fa0605721fc@quicinc.com>
 <20211109115951.1c2b5228@gandalf.local.home>
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
In-Reply-To: <20211109115951.1c2b5228@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Steve,

On 11/9/2021 10:29 PM, Steven Rostedt wrote:
> On Tue, 9 Nov 2021 21:52:26 +0530
> Sai Prakash Ranjan <quic_saipraka@quicinc.com> wrote:
>
>>>>       rwmmio_read: rpmh_rsc_probe+0x35c/0x410 readl addr=0xffff80001071000c
>>>>       rwmmio_read: rpmh_rsc_probe+0x3d0/0x410 readl addr=0xffff800010710004
>>>>       rwmmio_write: rpmh_rsc_probe+0x3b0/0x410 writel addr=0xffff800010710d00 val=0x3
>>>>       rwmmio_write: write_tcs_cmd+0x6c/0x78 writel addr=0xffff800010710d30 val=0x10108
>>> I'd much rather have a module name or something attached to the event that
>>> ca be filtered on via the trace event filters, than having it determined by
>>> some side effect done in another directory.
>> I presume we don't have CALLER_MODULENAME0,1,2.. like CALLER_ADDR0,1,2
>> without which we
>> cannot insert the module name to this trace event since MMIO accessors
>> are defined in low level
>> arch headers and we won't get any useful module information from where
>> these accessors are
>> called. The function name and the offset is good enough to identify the
>> exact line and module after
>> post-processing with tools like GDB, objdump, so I feel we can keep the
>> trace event fields limited?
> I'm thinking we can pass the descriptor to the event and not have it record
> it. We could add a new field type for defining the event. Something like:
>
> 	__filter_field()
>
> that has size zero in the event itself, but is available to the filtering
> logic. Than perhaps we could pass that descriptor to the filter that has
> all the information needed.
>
> 	DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, width);
> 	log_read_mmio(width, addr, descriptor);
>
> Where descriptor is NULL when dynamic debug in disabled.
>
> Have a way to pass that descriptor to the filtering logic (I'll have to
> take a look into it) and then be able to use the normal filtering.
>
> This way you could also create multiple instances, where one instance
> records the events coming from one file, and the other records events from
> another file, and not have just one big switch that disables all calls to
> log_read_mmio().
>
> -- Steve

Ah that's a very good idea, descriptor does contain the module, file name.
We can probably even pass the module name,file name as string from the 
descriptor itself to event?
Perhaps we can do that for all trace events and not just this trace 
event? Just like the trace event name displayed
with trace events, perhaps have file name,module name displayed when 
dynamic debug is enabled? Filtering by
filename is pretty useful since most of these usecases in debugging will 
be with respect to some driver or subsystems.

Thanks,
Sai
