Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1E6182731
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 03:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387731AbgCLC7B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 22:59:01 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:44629 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387674AbgCLC7B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 22:59:01 -0400
Received: by mail-il1-f193.google.com with SMTP id j69so4074188ila.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 19:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TNSqdH25rkbZXOC4Ox8uRLT2VEOtuEyZ2dHYonNu/QI=;
        b=Aq4ppv/J7eWg+XOWpPvu2fVq/Y33XVySaPn7s+6X5oJE9G6zQt2h1+GpCGrKpVUopP
         GXlgVXJzDiG2PZoxTOqhy1tIN3Pqy7qT0Urw0U8NtnVyg8rO9mfwIjxWdfqAvzeLHu9z
         kLmtAFITp6j6hSm9G50l0Mhfs75bsd7QAsKW9j83Y7oSZQHdSIynL+NAVmahGZLvcHKG
         1FwyVXyA31B7jkVvsmtF0g3cR8Q8n1JmF0zrGqEwb689B7zA0P9g7WCu1Yb3jC+wGOKk
         dzi575hgyZAUirhW157cKBzWVQjyBD1H0M5E8JhoF6Z+dpAfBujQZ2tl8oyY7CUamweI
         mxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TNSqdH25rkbZXOC4Ox8uRLT2VEOtuEyZ2dHYonNu/QI=;
        b=Zepq8yy0cGJoN3DeNsUj6jq1oMrZzjcKLOiYZvl8lRVMImiV8po62Tmehsnt8+kDq0
         bbo95k3Cs6RYY79/YZIhw7dD2XnUoxL+OPp9u+i8BBjUCLdq8zs9yiRKzP2yafZHq8zd
         krmIT+oAJYPXGnblfaV7p1LEjhKDPSuZmIJc1jVzi2usGUqAXWjsBP1xST59h0N1mLXg
         MooRKgYDvLTKcbjzsHVWd+sn8ZYHm/lMCA9IlQzmcwQpDJsSO5r6Ur6XB2DF3qDyFCMt
         vGAOsBpcBMRuIMhdz4zyp4SgOiVq0/JpSpsunvXsPcaC/jIbhYj7BnbTdW/EaJa/P0Vc
         +Opg==
X-Gm-Message-State: ANhLgQ0ZHRr9NwtNumhF4cHD/7RIRKeLu3twNBi28sOENNplJJLV0AYl
        ELLqNY2KM/SkaRICGpnJawBTqw==
X-Google-Smtp-Source: ADFU+vsWFFw1PIFdHwO+VpEKjeZH77nIStlDYCQY0Ffmx86909VW1lzaWSIaX0kvVx6B1LLbVJa4cA==
X-Received: by 2002:a92:d341:: with SMTP id a1mr6128327ilh.257.1583981939682;
        Wed, 11 Mar 2020 19:58:59 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id j19sm2058397ioj.41.2020.03.11.19.58.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 19:58:59 -0700 (PDT)
Subject: Re: [PATCH 1/4] remoteproc: re-check state in
 rproc_trigger_recovery()
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200228183359.16229-1-elder@linaro.org>
 <20200228183359.16229-2-elder@linaro.org> <20200309205633.GF1399@xps15>
 <20200311234409.GH14744@builder>
From:   Alex Elder <elder@linaro.org>
Message-ID: <7133ea1c-d50b-a0a0-ab7f-7c99d74771d0@linaro.org>
Date:   Wed, 11 Mar 2020 21:58:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200311234409.GH14744@builder>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/11/20 6:44 PM, Bjorn Andersson wrote:
> On Mon 09 Mar 13:56 PDT 2020, Mathieu Poirier wrote:
> 
>> On Fri, Feb 28, 2020 at 12:33:56PM -0600, Alex Elder wrote:
>>> Two places call rproc_trigger_recovery():
>>>   - rproc_crash_handler_work() sets rproc->state to CRASHED under
>>>     protection of the mutex, then calls it if recovery is not
>>>     disabled.  This function is called in workqueue context when
>>>     scheduled in rproc_report_crash().
>>>   - rproc_recovery_write() calls it in two spots, both of which
>>>     the only call it if the rproc->state is CRASHED.
>>>
>>> The mutex is taken right away in rproc_trigger_recovery().  However,
>>> by the time the mutex is acquired, something else might have changed
>>> rproc->state to something other than CRASHED.
>>
>> I'm interested in the "something might have changed" part.  The only thing I can
>> see is if rproc_trigger_recovery() has been called from debugfs between the time
>> the mutex is released but just before rproc_trigger_recovery() is called in
>> rproc_crash_handler_work().  In this case we would be done twice, something your
>> patch prevents.  Have you found other scenarios?

Sorry I didn't respond earlier, I was on vacation and was
actively trying to avoid getting sucked into work...

I don't expect my answer here will be very satisfying.

I implemented this a long time ago and don't remember all
the details. But regardless, if one case permits the crash
handler to be run twice for a single crash, that's one case
too many.

I started doing some analysis but have stopped for now
because Bjorn has already decided to accept it.  If you
want me to provide some more detail just say so and I'll
spend a little more time on it tomorrow.

					-Alex

> Alex is right, by checking rproc->state outside of the lock
> rproc_recovery_write() allows for multiple contexts to enter
> rproc_trigger_recovery() at once.
> 
> Further more, these multiple context will be held up at the
> mutex_lock_interruptible() and as each one completes the recovery the
> subsequent ones will stop the rproc, generate a coredump and then start
> it again.
> 
> 
> This patch would be to fix the latter problem and allows the next patch
> to move the check in the debugfs interface in under the mutex. As such
> I've picked up patch 1, 2 and 4.
> 
> Regards,
> Bjorn
> 
>> Thanks,
>> Mathieu
>>
>>>
>>> The work that follows that is only appropriate for a remoteproc in
>>> CRASHED state.  So check the state after acquiring the mutex, and
>>> only proceed with the recovery work if the remoteproc is still in
>>> CRASHED state.
>>>
>>> Delay reporting that recovering has begun until after we hold the
>>> mutex and we know the remote processor is in CRASHED state.
>>>
>>> Signed-off-by: Alex Elder <elder@linaro.org>
>>> ---
>>>  drivers/remoteproc/remoteproc_core.c | 12 ++++++++----
>>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>>> index 097f33e4f1f3..d327cb31d5c8 100644
>>> --- a/drivers/remoteproc/remoteproc_core.c
>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>> @@ -1653,12 +1653,16 @@ int rproc_trigger_recovery(struct rproc *rproc)
>>>  	struct device *dev = &rproc->dev;
>>>  	int ret;
>>>  
>>> +	ret = mutex_lock_interruptible(&rproc->lock);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	/* State could have changed before we got the mutex */
>>> +	if (rproc->state != RPROC_CRASHED)
>>> +		goto unlock_mutex;
>>> +
>>>  	dev_err(dev, "recovering %s\n", rproc->name);
>>>  
>>> -	ret = mutex_lock_interruptible(&rproc->lock);
>>> -	if (ret)
>>> -		return ret;
>>> -
>>>  	ret = rproc_stop(rproc, true);
>>>  	if (ret)
>>>  		goto unlock_mutex;
>>> -- 
>>> 2.20.1
>>>

