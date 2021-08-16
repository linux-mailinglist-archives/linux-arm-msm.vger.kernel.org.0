Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DCBA3ED7EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Aug 2021 15:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbhHPNtF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Aug 2021 09:49:05 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:4467 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236242AbhHPNtE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Aug 2021 09:49:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1629121713; x=1660657713;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=leZ6zTnKIflUpL4hRqRdqqett5iC4HB+vMYv8TjNv2c=;
  b=YusEOHM/Cti7a7G/6xRNRUhf7ZqyV32XMLY2f290vk5G0AJ3X9FQXKOd
   LPfmfh/uH9u0xDcu4lWctdZGzGeYc7pY6KS7s4HJkGtJ0y7wbhu+F5Kcf
   VNy/JF7NqZNFSxckPms0cam6C1VKczmnXzq/9vFi3OrgUkZY8vUeJxwzM
   A=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 16 Aug 2021 06:48:31 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2021 06:48:31 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Mon, 16 Aug 2021 06:48:30 -0700
Received: from [10.226.59.216] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.858.15; Mon, 16 Aug
 2021 06:48:30 -0700
Subject: Re: bus: mhi: parse_xfer_event running transfer completion callbacks
 more than once for a given buffer
To:     Hemant Kumar <hemantk@codeaurora.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "Paul Davey" <Paul.Davey@alliedtelesis.co.nz>
References: <9a6a00acc60c676f39f89a8ce2989416bed1b24d.camel@alliedtelesis.co.nz>
 <CAMZdPi812vx7cjvLXpj_NnbZPOmcierQMFikVHwsUd9gYawHVw@mail.gmail.com>
 <544b3db2-b135-d870-8dd8-ec4450576cb7@codeaurora.org>
 <9ad7faea-544a-a070-cc00-9a24f237f4c1@codeaurora.org>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
Message-ID: <aee4fa28-76e8-8897-8abb-e6161c864577@quicinc.com>
Date:   Mon, 16 Aug 2021 07:48:29 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9ad7faea-544a-a070-cc00-9a24f237f4c1@codeaurora.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03d.na.qualcomm.com (10.85.0.91) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/13/2021 5:10 PM, Hemant Kumar wrote:
> One more thing to add
> 
> On 8/13/2021 3:55 PM, Hemant Kumar wrote:
>> Hi Paul,
>>
>> On 8/6/2021 2:43 AM, Loic Poulain wrote:
>>> + MHI people
>>>
>>> On Fri, 6 Aug 2021 at 06:20, Paul Davey 
>>> <Paul.Davey@alliedtelesis.co.nz> wrote:
>>>>
>>>> Hi linux-arm-msm list,
>>>>
>>>> We have been using the mhi driver with a Sierra EM9191 5G modem module
>>>> and have seen an occasional issue where the kernel would crash with
>>>> messages showing "BUG: Bad page state" which we debugged further and
>>>> found it was due to mhi_net_ul_callback freeing the same skb multiple
>>>> times, further debugging tracked this down to a case where
>>>> parse_xfer_event computed a dev_rp from the passed event's ev_tre
>>>> which does not lie within the region of valid "in flight" transfers
>>>> for the tre_ring.  See the patch below for how this was detected.
>>>>
>>>> I believe that receiving such an event results in the loop which runs
>>>> completion events for the transfers to re-run some completion
>>>> callbacks as it walks all the way around the ring again to reach the
>>>> invalid dev_rp position.
>> Do you have a log which prints the TRE being processed? Basically i am 
>> trying understand this : by the time you get double free issue, is 
>> there any pattern with respect to the TRE that is being processed. For 
>> example
>> when host processed the given TRE for the first time with RP1, stale 
>> TRE was posted by Event RP2 right after RP1
>>
>> ->RP1 [TRE1]
>> ->RP2 [TRE1]
>>
>> or occurrence of stale TRE event is random?
> If you can log all the events you are processing, so that we can check 
> when second event arrives for already processed TRE, is the transfer 
> length same as originally processed TRE or it is different. In case it 
> is different length, is the length matching to the TRE which was queue 
> but not processed yet. You can print the mhi_queue_skb TRE content while 
> queuing skb. How easy to reproduce this issue ? Is this showing up in 
> high throughput use case or it is random? any specific step to reproduce 
> this issue?

I would wonder, what is the codebase being testing?  Are the latest MHI 
patches included?  When we saw something similar on AIC100, it was 
addressed by the sanity check changes I upstreamed.
