Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E87CB5F47A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2019 10:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbfGDIUX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jul 2019 04:20:23 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45518 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727119AbfGDIUW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jul 2019 04:20:22 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id AE08360A43; Thu,  4 Jul 2019 08:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562228421;
        bh=e3LVeam8xHza2h/bBVN0DBF1TS9LLsikvz2by4TYNK0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=o1nX1rIEVX9PmkpL9vvaoLrYmqRl7250ucDcDKod4rWv9BrXOBrFwu3ZavYcYTjJp
         oWLs7uGXh6If3cJblrTvTrXX4S2qRdfoWW25TH6fZ/I3FaAEA3tVVjRCIYdgXNAf3L
         B4naa3JpCdNJQuzyy++1jjqlMzxUbEUAvXZfmOL8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.136.27] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8C8BE607B9;
        Thu,  4 Jul 2019 08:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562228420;
        bh=e3LVeam8xHza2h/bBVN0DBF1TS9LLsikvz2by4TYNK0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=kTRnmF5qslu9CZ531rF3c/nEm0w4Yu7ojSWtAGuRTX9wwBfX1aR4auTv50AgrWsNk
         Hg0tJNEH9ChCSVuNGtps9ha6eBoE/JILUeAtmg4kwIQa9sc5vmmWEHIcqiNwWwNBs9
         BKTcX9aj6xdWtESurCHYnD2wsnH0dz/1CITGFN8k=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8C8BE607B9
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCHv5 1/2] dt-bindings: coresight: Change CPU phandle to
 required property
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        MSM <linux-arm-msm@vger.kernel.org>
References: <cover.1561659046.git.saiprakash.ranjan@codeaurora.org>
 <2afedb941294af7ba0658496b4aca3759a4e43ff.1561659046.git.saiprakash.ranjan@codeaurora.org>
 <CANLsYkxvh+qUDvqG45o7qh61Noq=a=BJ4-p68ipdzxYt6n5bNA@mail.gmail.com>
 <8fb5947e-acf8-faff-5594-2a32151ebee7@codeaurora.org>
 <20190704070239.GB32707@kroah.com>
 <72dff807-7172-7882-83fc-d7ff4cafe39f@free.fr>
 <20190704081822.GD6438@kroah.com>
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Message-ID: <7497db57-4462-87a0-6719-6db1330ce0a7@codeaurora.org>
Date:   Thu, 4 Jul 2019 13:50:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190704081822.GD6438@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/4/2019 1:48 PM, Greg Kroah-Hartman wrote:
> On Thu, Jul 04, 2019 at 10:08:24AM +0200, Marc Gonzalez wrote:
>> [ Trimming recipients list ]
>>
>> On 04/07/2019 09:02, Greg Kroah-Hartman wrote:
>>
>>> On Thu, Jul 04, 2019 at 12:13:40PM +0530, Sai Prakash Ranjan wrote:
>>>
>>>> On 7/4/2019 1:32 AM, Mathieu Poirier wrote:
>>>>
>>>>> Hi Greg,
>>>>>
>>>>> On Thu, 27 Jun 2019 at 12:15, Sai Prakash Ranjan wrote:
>>>>>>
>>>>>> Do not assume the affinity to CPU0 if cpu phandle is omitted.
>>>>>> Update the DT binding rules to reflect the same by changing it
>>>>>> to a required property.
>>>>>>
>>>>>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>>>>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>>>>
>>>>> I'm all good with this patch - can you pick this up for the coming
>>>>> merge window?  If not I'll simply keep it in my tree for 5.4.
>>>>>
>>>>> Tested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>>> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>>
>>>> I think you missed adding Greg, adding him now ;)
>>>
>>> I don't see any patch here for me to actually take :(
>>
>> I see what you're doing here ^_^
>>
>> https://lore.kernel.org/patchwork/patch/1094935/
> 
> What can I do with a random url?
> 
> Please send patches as emails, if you want me to be able to actually
> take it.
> 
> greg k-h
> 

No worries I will resend them. And thanks Marc :)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
