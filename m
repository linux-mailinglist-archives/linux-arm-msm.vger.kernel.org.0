Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0C03EBE67
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Aug 2021 00:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235309AbhHMW4I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Aug 2021 18:56:08 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:36288 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235029AbhHMW4H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Aug 2021 18:56:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628895340; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=FRbyNR5RRIMVk0SdG/TzavqHfTqGYR93hOAv0LolOSI=; b=pM5PqgezKM30MmnB0ahRwX6dp9TefKkbiLp4fce/ooE0ec4+JLEOtYkkETtZmDKl6H0rVkG5
 m9J7uetxGhLKgnf/MkRTxb8nfzBzDGs3R2J7xZWqc/r0f5+LaCg+kgL+1jW7AdRVHZ6n3FRB
 ARawiVzkGlj5tM7rOVPWrbQNmIQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6116f86c91487ad52054b4b1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 13 Aug 2021 22:55:40
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 61D12C433D3; Fri, 13 Aug 2021 22:55:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.110.91.32] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9701AC4338A;
        Fri, 13 Aug 2021 22:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9701AC4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: bus: mhi: parse_xfer_event running transfer completion callbacks
 more than once for a given buffer
To:     Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Paul Davey <Paul.Davey@alliedtelesis.co.nz>
References: <9a6a00acc60c676f39f89a8ce2989416bed1b24d.camel@alliedtelesis.co.nz>
 <CAMZdPi812vx7cjvLXpj_NnbZPOmcierQMFikVHwsUd9gYawHVw@mail.gmail.com>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <544b3db2-b135-d870-8dd8-ec4450576cb7@codeaurora.org>
Date:   Fri, 13 Aug 2021 15:55:36 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAMZdPi812vx7cjvLXpj_NnbZPOmcierQMFikVHwsUd9gYawHVw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Paul,

On 8/6/2021 2:43 AM, Loic Poulain wrote:
> + MHI people
> 
> On Fri, 6 Aug 2021 at 06:20, Paul Davey <Paul.Davey@alliedtelesis.co.nz> wrote:
>>
>> Hi linux-arm-msm list,
>>
>> We have been using the mhi driver with a Sierra EM9191 5G modem module
>> and have seen an occasional issue where the kernel would crash with
>> messages showing "BUG: Bad page state" which we debugged further and
>> found it was due to mhi_net_ul_callback freeing the same skb multiple
>> times, further debugging tracked this down to a case where
>> parse_xfer_event computed a dev_rp from the passed event's ev_tre
>> which does not lie within the region of valid "in flight" transfers
>> for the tre_ring.  See the patch below for how this was detected.
>>
>> I believe that receiving such an event results in the loop which runs
>> completion events for the transfers to re-run some completion
>> callbacks as it walks all the way around the ring again to reach the
>> invalid dev_rp position.
Do you have a log which prints the TRE being processed? Basically i am 
trying understand this : by the time you get double free issue, is there 
any pattern with respect to the TRE that is being processed. For example
when host processed the given TRE for the first time with RP1, stale TRE 
was posted by Event RP2 right after RP1

->RP1 [TRE1]
->RP2 [TRE1]

or occurrence of stale TRE event is random?

>>
>> What could cause parse_xfer_event to receive a transfer event with a
>> tre pointer which would be outside the range of in-flight transfers?
>> For example receiving events where the tre pointers do not only
>> increase or receive a second event of types MHI_EV_CC_OVERFLOW,
>> MHI_EV_CC_EOB, or MHI_EV_CC_EOT for a previous tre.
In theory this is not suppose to happen. once a xfer completion event is 
posted on event ring TRE belongs to Host MHI, Device is not suppose to
work on this TRE any more.
>>
>> The existing mhi driver code appears to assume that transfer events
>> are received strictly in order such that you can never receive a
>> transfer completion event for a transfer descriptor outside the
>> current set of "in flight" transfers in the tre ring (those between
>> the read pointer and write pointer).
This assumption is as per MHI spec.

I am checking internally if there is any know issue on device side. This 
model seems to be Qualcomm® Snapdragon™ X55 ?
[..]

Thanks,
Hemant
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project
