Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC9D9FD6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2019 10:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbfH1IsH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Aug 2019 04:48:07 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46172 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726246AbfH1IsH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Aug 2019 04:48:07 -0400
Received: by mail-wr1-f65.google.com with SMTP id z1so1575684wru.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2019 01:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Lh087UDN3bHwxNKU9oXqXSmgDMXMIewzXIKR9m+6i0E=;
        b=V8Wo5R1gkblbmEBDK8foSh7C8UDtmz4d0IduZExmjWX/5IB95wO3kIXkuEoGhrZfEH
         L4H0pBBEJbHaUC8rJ9oAlPItBkDc137JyPrs4bGEaDbmUcknCxqVixzEYbiGA0tnaS4L
         NYkXtgo3FO3XYNGTGrJisbxOoQDaE0Qzs20m0+fEo2BCdhg5vj5TWvOuR4qaUeToYlC9
         vjsbILLTw5rhfyHlSFy6LHBIMVv9idAS0aptNCnv5kyuoRFbJju58nUWXVsAo01L+JPu
         aNbsuPL8QbptuLmqEQ9Tbp9m3YoE0oHfBiBCorWXxDVeN1QNsdVPKrOnGQvXSe9tGYD9
         w22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Lh087UDN3bHwxNKU9oXqXSmgDMXMIewzXIKR9m+6i0E=;
        b=QHjHUXRIwApTDGFULSVEYHoCHQ4/2Q08vA/bh064hiSnubPI5383sqUiClF3Su0mwz
         DFSKNg6YZ9Mwc9l9JF5+DdXfTQ0Lnyg/wFvkqKm6frWsVZwl9w364zLTulN0koTqA+On
         sUJ4iPyw9P2E1RqmlvbI9Ziy9MZI+x+Mxvd/k95jD/Wy6kzHa3XEW5OoY0pad7Sk/o7x
         8eOp2Lx6XJphd2SqjJXkprKEJccatMvvl4gujm4Oc5tO43j/rG/xTPRwv3l46vhUyHo6
         wIUlsLq+Qh6Sp1UuwyZk0sdm4kGYQsCqTremUi3UqRvXWiZkyVtpjIdtG/tfYKpTY2W1
         fRaQ==
X-Gm-Message-State: APjAAAW1gUTv/4kNvmfqDkzNE4DBLthIQ3rRA4Kmz0pJy3zyGe1AeJCT
        QLML0FlR+CcKit03Xp8RhWIWUQ==
X-Google-Smtp-Source: APXvYqw11HbEWphGzvuO4I/UDjUNi1JYA+PodKeI/bgO/Z9c9hO+gqsdJmZDyLNbvSJsSL/ArGZH0w==
X-Received: by 2002:adf:ce8d:: with SMTP id r13mr3127105wrn.37.1566982085434;
        Wed, 28 Aug 2019 01:48:05 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id u6sm1488731wmm.26.2019.08.28.01.48.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Aug 2019 01:48:04 -0700 (PDT)
Subject: Re: [PATCH 4/5] misc: fastrpc: fix double refcounting on dmabuf
To:     Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, arnd@arndb.de,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mayank Chopra <mak.chopra@codeaurora.org>
References: <20190823100622.3892-1-srinivas.kandagatla@linaro.org>
 <20190823100622.3892-5-srinivas.kandagatla@linaro.org>
 <CAC8LzUAnz+RZYh+bBbJbXJYP3QDq4H1847W8rJxj-aF1B1J9QQ@mail.gmail.com>
 <cb003c11-d331-a2c7-1eb4-a89ba025f4c6@linaro.org>
 <d545f7fc-fc97-c250-b9d2-ebfbc9709780@linaro.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <6a34823b-4a1d-c7de-a4c7-87587705708b@linaro.org>
Date:   Wed, 28 Aug 2019 09:48:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d545f7fc-fc97-c250-b9d2-ebfbc9709780@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 28/08/2019 08:50, Jorge Ramirez wrote:
> On 8/27/19 23:45, Srinivas Kandagatla wrote:
>> On 23/08/2019 16:23, Jorge Ramirez-Ortiz wrote:
>>> can you add me as a co-author to this patch please?
>> No problem I can do that if you feel so!
> yes please. thanks!
> 
>>> since I spent about a day doing the analysis, sent you  a fix that
>>> maintained the API used by the library and explained you how to
>>> reproduce the issue I think it is just fair. > the  fact that the api
>>> could be be modified and the fix be done a bit
>>> differently- free dma buf ioctl removed- seems just a minor
>>> implementation detail to me.
>> No, that's not true, this is a clear fastrpc design issue.
> IMO the ioctls defines the contract with userspace and the contract
> establishes that userspace must call deallocate. the kernel wrongly
> implemented to that contract since it doesn't handle the cases where
> userspace can't send the release calls which leads to memory leaks. this
> is what I meant by and implementation issue.
> 
> if we had many fastrpc users, rolling out the design change that you
> propose - removing an ioctl- would definitively have an impact. But
> since that is not yet the case, there is not doubt that your patch makes
> more sense.

Exactly before it make a way into other projects!

> 
> but my point was that there is not a huge gap in efforts between doing
> one or the other.

Thats not the point, point is about right fix!

> 
>> Userspace is already doing a refcount via mmap/unmap on that dmabuf fd,
>> having an additional api adds another level of refcount which is totally
>> redundant and is the root cause for this leak.
> yes it is redundant but is not the root cause for this leak. the root
> cause is that the driver doesnt handle the case where userspace didnt or
> was not able to call release (and that is no more than adding allocated
> buffers to a list and clean on exit)

I don't agree with you on that. We should not take an extra refcount in 
first place in driver.

let me explain it one more time!

dmabuf has to be mmaped in userspace app before it is used, and
"Memory mappings that were created in the process shall be unmapped 
before the process is destroyed" so the refcount is taken care by 
mmap/unmap automatically.

--srini


> 
