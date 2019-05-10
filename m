Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDDAE1971D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2019 05:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbfEJDbV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 May 2019 23:31:21 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59128 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726882AbfEJDbU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 May 2019 23:31:20 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id F07C4607EB; Fri, 10 May 2019 03:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557459080;
        bh=ZdJ/UhXjQBUu2fWsqDO0l9IHAfnLU9pcY6tmqkKnt/I=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=eWgPmiy8q3KCGwv+cC+BJ7tbr7F/+kB1ksNKBz6GrsHwUjWYXd5wKBhOh2Sb7xdAn
         9rjvXMrwFP+bmTzdMaObGYXHy1gONAKqfZZJlGe3JGN1Mwqm/fxaOME19CTHy6Sv29
         TlpaS/Eoa/rRkGm/GXMywKmgCBnXRvSk1pkhcGVY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from [10.204.78.109] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: gkohli@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 86DDC60592;
        Fri, 10 May 2019 03:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557459079;
        bh=ZdJ/UhXjQBUu2fWsqDO0l9IHAfnLU9pcY6tmqkKnt/I=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=IwYvbwHyjQBccR78yGpBpQQhaLwWMAnjUYY0tes3ePguKuTyPPWPHW6vzlJ7d83bU
         NTaVcZY5ldVw0WtlZK1QYHmZFcPUKeWf8CiqCGJbHYdCGIX5SscsO0jl/DsjGCQ7ng
         8dQREHYyuK6fINknqSgt3oi3olZm5JrEyFriRmKY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 86DDC60592
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=gkohli@codeaurora.org
Subject: Re: [PATCH] driver core: Fix use-after-free and double free on glue
 directory
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Muchun Song <smuchun@gmail.com>
Cc:     rafael@kernel.org, linux-kernel <linux-kernel@vger.kernel.org>,
        zhaowuyun@wingtech.com, linux-arm-msm@vger.kernel.org
References: <20190423143258.96706-1-smuchun@gmail.com>
 <24b0fff3775147c04b006282727d94fea7f408b4.camel@kernel.crashing.org>
 <CAPSr9jHhwASv7=83hU+81mC0JJyuyt2gGxLmyzpCOfmc9vKgGQ@mail.gmail.com>
 <a37e7a49c3e7fa6ece2be2b76798fef3e51ade4e.camel@kernel.crashing.org>
 <CAPSr9jHCVCHNK+AmKkUBgs4dPC0UC5KdYKqMinkauyL3OL6qrQ@mail.gmail.com>
 <79fbc203bc9fa09d88ab2c4bff8635be4c293d49.camel@kernel.crashing.org>
 <CAPSr9jHw9hgAZo2TuDAKdSLEG1c6EtJG005MWxsxfnbsk1AXow@mail.gmail.com>
 <20190504153440.GB19654@kroah.com>
 <e79201c2-a00b-d226-adc2-62769ae1ad81@codeaurora.org>
 <73b783e634551420dfa249816514fb31ed3487b6.camel@kernel.crashing.org>
From:   Gaurav Kohli <gkohli@codeaurora.org>
Message-ID: <6d755534-714b-5d04-3280-b27fd8a1df1b@codeaurora.org>
Date:   Fri, 10 May 2019 09:01:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <73b783e634551420dfa249816514fb31ed3487b6.camel@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks for the comment, will check the patch and update.

Regards
Gaurav

On 5/10/2019 4:52 AM, Benjamin Herrenschmidt wrote:
> On Thu, 2019-05-09 at 20:08 +0530, Gaurav Kohli wrote:
>> Hi ,
>>
>> Last patch will serialize the addition of child to parent directory,
>> won't it affect performance.
> 
> I doubt this is a significant issue, and there's already a global lock
> taken once or twice in that path, the fix is purely to make sure that
> the some locked section is used both for the lookup and the addition as
> the bug comes from the window in between those two operations allowing
> the object to be removed after it was "found".
> 
> Cheers,
> Ben.
>   
>>
>> Regards
>> Gaurav
>>
>> On 5/4/2019 9:04 PM, Greg KH wrote:
>>> On Sat, May 04, 2019 at 10:47:07PM +0800, Muchun Song wrote:
>>>> Benjamin Herrenschmidt <benh@kernel.crashing.org> 于2019年5月2日周四
>>>> 下午2:25写道：
>>>>
>>>>>>> The basic idea yes, the whole bool *locked is horrid
>>>>>>> though.
>>>>>>> Wouldn't it
>>>>>>> work to have a get_device_parent_locked that always returns
>>>>>>> with
>>>>>>> the mutex held,
>>>>>>> or just move the mutex to the caller or something simpler
>>>>>>> like this
>>>>>>> ?
>>>>>>>
>>>>>>
>>>>>> Greg and Rafael, do you have any suggestions for this? Or you
>>>>>> also
>>>>>> agree with Ben?
>>>>>
>>>>> Ping guys ? This is worth fixing...
>>>>
>>>> I also agree with you. But Greg and Rafael seem to be high
>>>> latency right now.
>>>
>>> It's in my list of patches to get to, sorry, hopefully will dig out
>>> of
>>> that next week with the buffer that the merge window provides me.
>>>
>>> thanks,
>>>
>>> greg k-h
>>>
>>
>>
> 

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center,
Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
