Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8ED32197A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Feb 2021 14:55:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231292AbhBVNzR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Feb 2021 08:55:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231577AbhBVNzA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Feb 2021 08:55:00 -0500
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5EC8C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 05:54:19 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id f17so12568261qkl.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 05:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VS1uCxsWaVilHSWQLWzKvqKOZiAU0WU2yxAA9RpL/c0=;
        b=Z+KR4S7gV0fXuSykElAqDeqMUe9jKg9pfUKRXrc6MunV0THzthsxBra0PKaSMzrVn3
         N5ZnXtfZVkjINMlWtBRBxl3P433+m9uKOQ35C9nh7tm35GPi/QquSo7zZc3khPk30Xs1
         XcnONlusrw5tUQa4cVyo8n0Z+JaBubkgfq8mQCaJ6kM3KBnexLBagMyz5cAF+7uVNBAH
         R4nIjDJ7FouotOW2kjTQynetZMKfBazOsK98tsQgSaCWixFrl6JQeYRDKIy4DltnIBOv
         rUN0ZBHON+5XNIvdAf5NN9f1O/qGuywhOPI1F91hfD1OvZA7KvJHjiZIaxHmBD8+tM1h
         JC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VS1uCxsWaVilHSWQLWzKvqKOZiAU0WU2yxAA9RpL/c0=;
        b=h2k/OhscI2l9nTPCydWoXxIqGaJxgg4/jjRSJUsVJaXmWDBUbccvlQvRSkPN6t6D6i
         +a1GRkJd62nMSr31j4RP2JUWd2wsDGEj/q6uRMAY08tyZHAOJKG6CxJR/KDn87R55Gox
         cy9Vw/KFU8Owxf5l7rSi1bo4tinLpQ8O/EFByd42c33AZ3iTFh+e551QIUGCE2/+1pQT
         s/wCC6jdACybEgyO5McoNMxQSsEgmP7IvBPhngmPb+34rpFWmrRaCvEo0+1RdwLEVL/b
         6enXDOW0XZ61xGDm8nl0bUDaN1l84i2tBsSUrc3uKBuVDb2yLb0hwUBWy4GwqUNTdKeG
         HKzA==
X-Gm-Message-State: AOAM533KpEkKK/3ZEmTt1Tlj+HQGmIQ5EahHocvp8fT7lbe7KSEHl54e
        pcQHaQd2g0K/wTvI4Xf1RkkNBhTEeqDV9yb/
X-Google-Smtp-Source: ABdhPJwYPrXA6xdc4ibfHhqwX32rHtCdgIVve5gfRyjL7cmibmPzvg6CIis4fH2S8Y0oa9dnnEjVww==
X-Received: by 2002:a37:628e:: with SMTP id w136mr20831297qkb.46.1614002059116;
        Mon, 22 Feb 2021 05:54:19 -0800 (PST)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id r17sm10937838qta.78.2021.02.22.05.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 05:54:18 -0800 (PST)
Subject: Re: [PATCH 3/3] fastrpc: remove redundant fastrpc_map_create() call
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210218032055.28247-1-jonathan@marek.ca>
 <20210218032055.28247-4-jonathan@marek.ca>
 <58e361e0-441e-fd71-362a-398dcb84f888@linaro.org>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <66afb839-7cd9-875c-72ea-f3236678f9f9@marek.ca>
Date:   Mon, 22 Feb 2021 08:53:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <58e361e0-441e-fd71-362a-398dcb84f888@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/22/21 7:37 AM, Srinivas Kandagatla wrote:
> 
> 
> On 18/02/2021 03:20, Jonathan Marek wrote:
>> fastrpc_internal_invoke() will call fastrpc_map_create, so there is no
>> point in having it called here. This does change the behavior somewhat as
>> fastrpc_internal_invoke() will release the map afterwards, but that's 
>> what
>> we want to happen in this case.
> 
> This will crash the DSP as you will be freeing the init process memory 
> while it is actively using it!
> 
> The shell/init process is created as part of user process and it should 
> be valid until the user process is valid! We can not free it when the 
> invoke is finished/acked as we normally do for other invoke context!
> 
> In some firmwares the shell process is statically built into the DSP 
> firmware which might work! But other normal cases are totally broken by 
> this patch!
> 
> --srini
> 

I am not using the static guest process, I am using the 
FASTRPC_IOCTL_INIT_CREATE to load a fastrpc shell process. It doesn't crash.

AFAIK the DSP does not need the process memory after the process 
creation - this would allow userspace to modify the executable after the 
DSP verifies the hash/signature. So the DSP absolutely needs to make a 
copy of it before verifying it (otherwise this would be a pretty serious 
and obvious security flaw in qcom's fastrpc system. but I wouldn't be 
surprised!).

>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   drivers/misc/fastrpc.c | 12 +-----------
>>   1 file changed, 1 insertion(+), 11 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 170352b43ab6..ccad9f5f5e2f 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -1013,7 +1013,6 @@ static int fastrpc_init_create_process(struct 
>> fastrpc_user *fl,
>>       struct fastrpc_init_create init;
>>       struct fastrpc_invoke_args *args;
>>       struct fastrpc_phy_page pages[1];
>> -    struct fastrpc_map *map = NULL;
>>       struct fastrpc_buf *imem = NULL;
>>       int memlen;
>>       int err;
>> @@ -1049,18 +1048,12 @@ static int fastrpc_init_create_process(struct 
>> fastrpc_user *fl,
>>       inbuf.siglen = init.siglen;
>>       fl->pd = USER_PD;
>> -    if (init.filelen && init.filefd) {
>> -        err = fastrpc_map_create(fl, init.filefd, init.filelen, &map);
>> -        if (err)
>> -            goto err;
>> -    }
>> - >       memlen = ALIGN(max(INIT_FILELEN_MAX, (int)init.filelen * 4),
>>                  1024 * 1024);
>>       err = fastrpc_buf_alloc(fl, fl->sctx->dev, memlen,
>>                   &imem);
>>       if (err)
>> -        goto err_alloc;
>> +        goto err;
>>       fl->init_mem = imem;
>>       args[0].ptr = (u64)(uintptr_t)&inbuf;
>> @@ -1106,9 +1099,6 @@ static int fastrpc_init_create_process(struct 
>> fastrpc_user *fl,
>>   err_invoke:
>>       fl->init_mem = NULL;
>>       fastrpc_buf_free(imem);
>> -err_alloc:
>> -    if (map)
>> -        fastrpc_map_put(map);
>>   err:
>>       kfree(args);
>>
