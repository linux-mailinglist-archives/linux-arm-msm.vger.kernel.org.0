Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5B043227FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Feb 2021 10:46:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbhBWJoo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Feb 2021 04:44:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231143AbhBWJoh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Feb 2021 04:44:37 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B80C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Feb 2021 01:43:56 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id n4so21900156wrx.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Feb 2021 01:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5HjcQcw/Ald4xq8xuER0hHWSYmC2S2pM+LWmu1YDUFg=;
        b=YhIzw7NMjK7fZ9r4sIZ6JMc3SOabtdNo98URW7G54PLRXBxt7T5dakO9MPLB/zpXmX
         T2uKcKgTVixxp/FJKV5a3XgFlBEh/0P8kH3Xcm3itO3h2ST04G9Ygi88x4Yl8trqsg9L
         /MshF2JDTAoaKMLydYeNn1hXyC6oD4Swv4KoBpj1XHhunHMxd2liVUoEseqN3STQ8Ac7
         FSqfu0rgWsJcm58HW6ibg/dNHWF5D57HbP7Kns31YtabZolUU5eumg1eeIQ6+eWJje8c
         u8zDVWOdhDPyviHNMrmTQU4HxpMTyjstUQlL3mg1KVHPHPOQffI5pjlJXvJiv9kwnYow
         m5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5HjcQcw/Ald4xq8xuER0hHWSYmC2S2pM+LWmu1YDUFg=;
        b=sI46OSLVXawQ4OwXKGuy+31twJF5CzYduzUpf99kMQfbv3MfWtrt5Cw+nY1/6N4nY+
         VN8JJiqnOjPQFna/JYEb0n3YzZW1mKnStRsohOP9sjKozdNfi4FIh8R0jKOsc3LqG0LK
         +VMeLZzkBgO5nQ2koP+60oC65RWmajkr+Z/LQaojENoEppr55MIaNQEQaMY7PMP8KGJm
         E2OzYoQXL9XLoQDvyvGsWVBzB1t+BHFCXGCdtkO3U+paIFsdNHdceda7HUr+lJxrcTTD
         tanwzNwLWz3rBFIb5SaLd2Z+bwWCe5DKDpD/AJz3TZLfFQHeHOklSOKplkt0djWaG20q
         fCPg==
X-Gm-Message-State: AOAM5329mmrk4omh+minnvKhM1fyc0IV+6/35sSop02LzCb9+R5HlQxe
        2+61dxW8gDFSX/xdb0jdGDoYNw==
X-Google-Smtp-Source: ABdhPJwi3oa0kRGcTkHkdVXlkZy03EfM2ydbvRkDCfEkn6mEd7ugHC49Yq2Uhpp+4Xgdd0WtHqqYSw==
X-Received: by 2002:a5d:47af:: with SMTP id 15mr25687675wrb.205.1614073435047;
        Tue, 23 Feb 2021 01:43:55 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id l22sm26589261wrb.4.2021.02.23.01.43.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Feb 2021 01:43:54 -0800 (PST)
Subject: Re: [PATCH 3/3] fastrpc: remove redundant fastrpc_map_create() call
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210218032055.28247-1-jonathan@marek.ca>
 <20210218032055.28247-4-jonathan@marek.ca>
 <58e361e0-441e-fd71-362a-398dcb84f888@linaro.org>
 <66afb839-7cd9-875c-72ea-f3236678f9f9@marek.ca>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <9af55046-043b-13e1-a2bb-14b21272ea32@linaro.org>
Date:   Tue, 23 Feb 2021 09:43:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <66afb839-7cd9-875c-72ea-f3236678f9f9@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22/02/2021 13:53, Jonathan Marek wrote:
> On 2/22/21 7:37 AM, Srinivas Kandagatla wrote:
>>
>>
>> On 18/02/2021 03:20, Jonathan Marek wrote:
>>> fastrpc_internal_invoke() will call fastrpc_map_create, so there is no
>>> point in having it called here. This does change the behavior 
>>> somewhat as
>>> fastrpc_internal_invoke() will release the map afterwards, but that's 
>>> what
>>> we want to happen in this case.
>>
>> This will crash the DSP as you will be freeing the init process memory 
>> while it is actively using it!
>>
>> The shell/init process is created as part of user process and it 
>> should be valid until the user process is valid! We can not free it 
>> when the invoke is finished/acked as we normally do for other invoke 
>> context!
>>
>> In some firmwares the shell process is statically built into the DSP 
>> firmware which might work! But other normal cases are totally broken 
>> by this patch!
>>
>> --srini
>>
> 
> I am not using the static guest process, I am using the 
> FASTRPC_IOCTL_INIT_CREATE to load a fastrpc shell process. It doesn't 
> crash.
> 
> AFAIK the DSP does not need the process memory after the process 
> creation - this would allow userspace to modify the executable after the 

This process memory includes memory to load shell and the heap(complete 
process memory) so it should be kept till the process dies!

--srini


> DSP verifies the hash/signature. So the DSP absolutely needs to make a 
> copy of it before verifying it (otherwise this would be a pretty serious 
> and obvious security flaw in qcom's fastrpc system. but I wouldn't be 
> surprised!).




> 
>>>
>>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>>> ---
>>>   drivers/misc/fastrpc.c | 12 +-----------
>>>   1 file changed, 1 insertion(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>> index 170352b43ab6..ccad9f5f5e2f 100644
>>> --- a/drivers/misc/fastrpc.c
>>> +++ b/drivers/misc/fastrpc.c
>>> @@ -1013,7 +1013,6 @@ static int fastrpc_init_create_process(struct 
>>> fastrpc_user *fl,
>>>       struct fastrpc_init_create init;
>>>       struct fastrpc_invoke_args *args;
>>>       struct fastrpc_phy_page pages[1];
>>> -    struct fastrpc_map *map = NULL;
>>>       struct fastrpc_buf *imem = NULL;
>>>       int memlen;
>>>       int err;
>>> @@ -1049,18 +1048,12 @@ static int fastrpc_init_create_process(struct 
>>> fastrpc_user *fl,
>>>       inbuf.siglen = init.siglen;
>>>       fl->pd = USER_PD;
>>> -    if (init.filelen && init.filefd) {
>>> -        err = fastrpc_map_create(fl, init.filefd, init.filelen, &map);
>>> -        if (err)
>>> -            goto err;
>>> -    }
>>> - >       memlen = ALIGN(max(INIT_FILELEN_MAX, (int)init.filelen * 4),
>>>                  1024 * 1024);
>>>       err = fastrpc_buf_alloc(fl, fl->sctx->dev, memlen,
>>>                   &imem);
>>>       if (err)
>>> -        goto err_alloc;
>>> +        goto err;
>>>       fl->init_mem = imem;
>>>       args[0].ptr = (u64)(uintptr_t)&inbuf;
>>> @@ -1106,9 +1099,6 @@ static int fastrpc_init_create_process(struct 
>>> fastrpc_user *fl,
>>>   err_invoke:
>>>       fl->init_mem = NULL;
>>>       fastrpc_buf_free(imem);
>>> -err_alloc:
>>> -    if (map)
>>> -        fastrpc_map_put(map);
>>>   err:
>>>       kfree(args);
>>>
