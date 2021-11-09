Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19F6E44B22A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 18:49:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241348AbhKIRwP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 12:52:15 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:48748 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239360AbhKIRwP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 12:52:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1636480169; x=1668016169;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wGWf/s+/hjinpE7Jq07oJQ20p6yx/FmYg7kNrRKK77Y=;
  b=u3ZLnoYjKmYPMzg0J2b+h25jLQY5trThd3hLPk/RpFZmMNufJIpGX/t4
   7wJUpwxFeca+SNSItYOA5EpaN6pCmvHayNZ8j9gR+Lrft/oqlhM9/FNjz
   TM6Yk6ScJKiYwX9oNT3sjTaekx110Z8x0spHPJ/odUo+e4Y4qP7dZ5uSt
   w=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 09 Nov 2021 09:49:29 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 09:49:28 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 9 Nov 2021 09:49:28 -0800
Received: from [10.50.19.148] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Tue, 9 Nov 2021
 09:49:23 -0800
Message-ID: <c5715db5-965b-c1f5-3e99-04caec3d4f2c@quicinc.com>
Date:   Tue, 9 Nov 2021 23:19:19 +0530
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
 <264b77dd-5509-60f9-248c-a93135b01aa9@quicinc.com>
 <20211109124046.2a772bcb@gandalf.local.home>
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
In-Reply-To: <20211109124046.2a772bcb@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/9/2021 11:10 PM, Steven Rostedt wrote:
> On Tue, 9 Nov 2021 23:00:11 +0530
> Sai Prakash Ranjan <quic_saipraka@quicinc.com> wrote:
>
>> Ah that's a very good idea, descriptor does contain the module, file name.
>> We can probably even pass the module name,file name as string from the
>> descriptor itself to event?
>> Perhaps we can do that for all trace events and not just this trace
>> event? Just like the trace event name displayed
>> with trace events, perhaps have file name,module name displayed when
>> dynamic debug is enabled? Filtering by
>> filename is pretty useful since most of these usecases in debugging will
>> be with respect to some driver or subsystems.
> If we add this for all events, it would require a lot of changes to all
> users of tracepoints, as it would require adding a new parameter to the
> callbacks.
>
> We could add a flag in the registering that states that the callback is OK
> for it, and it passes that data as well.
>
> Let me look into this for a bit. I may not have something this week, but
> we should look into this more before adding little hacks that do this one
> at a time like this patch.
>
> -- Steve

Sure, thanks for the help and review. I can skip this patch adding 
support for dynamic event tracing
till we have something concrete as the previous patches doesn't depend 
on this.

Thanks,
Sai
