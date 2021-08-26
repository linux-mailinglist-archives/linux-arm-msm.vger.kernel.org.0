Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97AD13F8B5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 17:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242940AbhHZPz0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 11:55:26 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:60562 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbhHZPz0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 11:55:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1629993279; x=1661529279;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=lYVeHISZQAyQvD77bpxgjkMpC8zuBoVQZ8+/CjlrXWc=;
  b=A9vPa49/Tw0EdQMwFdNGQ9aHi/ezzbAWvRKJZJR3c1av0zHhb+0j3okl
   HGacb70HA2TZoYBcaXTYvdC4NVQjCG0Cpaub760sIBZUdF+JwLOacxY8U
   ryF+2a638wEOzrH1INI8tnYnfEbKQvjoCGiwLq4a40IdGnZeuOJiwS4o0
   c=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 26 Aug 2021 08:54:39 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2021 08:54:37 -0700
Received: from [10.226.59.216] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.922.7; Thu, 26 Aug 2021
 08:54:37 -0700
Subject: Re: bus: mhi: parse_xfer_event running transfer completion callbacks
 more than once for a given buffer
To:     Paul Davey <Paul.Davey@alliedtelesis.co.nz>,
        "bbhatt@codeaurora.org" <bbhatt@codeaurora.org>,
        "loic.poulain@linaro.org" <loic.poulain@linaro.org>,
        "hemantk@codeaurora.org" <hemantk@codeaurora.org>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
References: <9a6a00acc60c676f39f89a8ce2989416bed1b24d.camel@alliedtelesis.co.nz>
 <CAMZdPi812vx7cjvLXpj_NnbZPOmcierQMFikVHwsUd9gYawHVw@mail.gmail.com>
 <544b3db2-b135-d870-8dd8-ec4450576cb7@codeaurora.org>
 <ce8082f8ecd6bea2961d8841ea6eb1c14b5a34dd.camel@alliedtelesis.co.nz>
 <2b1cbecf50a57a229e30d1bff060d0e241e2841a.camel@alliedtelesis.co.nz>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
Message-ID: <05e4ff6f-5118-6afb-a000-81d07e5b1078@quicinc.com>
Date:   Thu, 26 Aug 2021 09:54:36 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2b1cbecf50a57a229e30d1bff060d0e241e2841a.camel@alliedtelesis.co.nz>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03g.na.qualcomm.com (10.85.0.49) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/23/2021 12:47 AM, Paul Davey wrote:
> Hi Hemant, Jeffery
> 
> I have some more information after some testing.
> 
>>> Do you have a log which prints the TRE being processed? Basically i
>>> am
>>> trying understand this : by the time you get double free issue, is
>>> there
>>> any pattern with respect to the TRE that is being processed. For
>>> example
>>> when host processed the given TRE for the first time with RP1,
>>> stale
>>> TRE
>>> was posted by Event RP2 right after RP1
>>>
>>> ->RP1 [TRE1]
>>> ->RP2 [TRE1]
>>>
>>> or occurrence of stale TRE event is random?
>>
> I have now collected some information by adding buffers which record
> some of the information desired and searching or printing this
> information only when the issue is detected in order to avoid constant
> verbose debug information and potential slowdowns.
> 
>  From this information I can report that when this issue happens two
> consecutive transfer completion events occur with the same TRE pointer
> in them, I did not record events which are not transfer completion
> events or the event ring RP during processing.
> 
> So the event is as follows:
> 
> mhi mhi0: (IP_HW0_MBIM-Up) Completion Event code: 2 length: 5e2 ptr:
> 77c94780
> mhi mhi0: (IP_HW0_MBIM-Up) Completion Event code: 2 length: 5e2 ptr:
> 77c94780

This isn't good.  I would suspect that the device is glitching then, 
which should be fixed on the device side, but that doesn't help you here 
and now.

I'm thinking your change is probably a good idea based on this, but I 
have additional questions.

Can you check the address of the completion events in the shared memory 
(basically the event ring) when you see this?  I want to rule out the 
possibility that host is double processing the same event, and this is 
truly a case of the device duplicating an event.

I hope that makes sense to you.

> Where the ptr value in the event being parsed is this value.
> 
> I have also seen a case where a completion event would attempt to run
> possibly more than once but is not caught by the check I posted in my
> initial question.
> 
> I added code to zero out some buf_info fields when processing
> completion events and produce logs if the cb_buf that would be passed
> to the completion callback is NULL.
> 
> I am investigating this further and will collect similar information as
> provided above for this case.
> 
>>
>>> If you can log all the events you are processing, so that we can
>>> check
>>> when second event arrives for already processed TRE, is the
>>> transfer
>>> length same as originally processed TRE or it is different. In case
>>> it
>>> is different length, is the length matching to the TRE which was
>>> queue
>>> but not processed yet. You can print the mhi_queue_skb TRE content
>>> while
>>> queuing skb. How easy to reproduce this issue ? Is this showing up
>>> in
>>> high throughput use case or it is random? any specific step to
>>> reproduce
>>> this issue?
> 
> This TRE address matches one in the buffer of TREs added in gen_tre:
> 
> mhi mhi0: (IP_HW0_MBIM-Up) Event TRE addr: 8000000077c94780, ev_len:
> 5e2, tre_len: 5e2
> 
> And here we see the length's match between these.
> 
>> I would wonder, what is the codebase being testing?  Are the latest
>> MHI
>> patches included?  When we saw something similar on AIC100, it was
>> addressed by the sanity check changes I upstreamed.
> 
> This is a bit complicated to answer, the codebase being tested is our
> kernel, based off 5.7.19 with the mhi drivers being updated to the
> upstream mainline kernel state as of around late June this year by
> cherry-picking all commits to relevant paths.  Additionally the change
> I submitted to this list for making the driver function on big endian
> systems and changes to the PCI driver to customize the channels to the
> EM9191 module and some changes to the MBIM net driver MRU for
> performance reasons.  Additionally I have added one change to increase
> the time that is waited at poweron for the modem to enter ready state
> without increasing the timeout as this interfered with latency at
> shutdown but I suspect using the upstream patch to resolve the shutdown
> latency will remove the need for this and we can just increase the
> timeout limit for the modem.
> 
> I can confirm that the tested codebase has the following commit
> included:
> ec32332df764 bus: mhi: core: Sanity check values from remote device
> before use

Ok.  Sounds like it wouldn't catch the issue you describe above anyways. 
  Thanks for confirming though, so we can eliminate what I saw as a 
possible cause.
