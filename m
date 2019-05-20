Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D44F23BEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2019 17:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387927AbfETPUw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 May 2019 11:20:52 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39403 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387917AbfETPUw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 May 2019 11:20:52 -0400
Received: by mail-wm1-f68.google.com with SMTP id n25so13052285wmk.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2019 08:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3M5aOGI1qzRY2VLgEKYCzcXoZ/MVQvoNw6e4i8AFNJU=;
        b=Y2LC56M7HK9juDM9pq6OI4F2G5ICKaakVBqjH4N2YgIX59hIG1aANpMi8k0QOis9b6
         JjR9QWNyx8vHysLC7eGy38WvWFu2n7pW7vj1splJJijiXcTPbRaBEVqXZzXLjIeunMtY
         hcvmOVKvZfrdZL2MEHax7jSkLfPL2mtTz9VadkUtyVan2KtFY0XfT38N/eUHIez+z5m2
         skX6mLGNbMFHpg2Pt//AvzqthbX2BskAiedo9dMmQjpnbtNNHD/2oyD0SXJO8rYK1Oet
         BsgOSRhRWNiQ3VfrQ3FJT4NEFK8tx7zKnoph0SHDTnSdZCTn+MlEEa8ZYo5Fbjj/EyWV
         QWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3M5aOGI1qzRY2VLgEKYCzcXoZ/MVQvoNw6e4i8AFNJU=;
        b=ITq80K3BCuMXho1l6wc34tSrYlf9bu+y6eggTe1A64/IPTvCo9yHp0tM7EVkEhcGiP
         ur1EA/eduiRO1v/fd+NAApLwgm3rm8TMUFrLtNPlKh5a04LcosQwW+MlAOgBpW+v7mSV
         9VwWlyN67xHDD34hkPFD5ESOMk/r05jwrezMGCurlpgXycd1xXA3qjMc5qARp5zqs1kY
         pn8+2Hl1unKkJqY0+aJzjqWYH8umTBu3uujk0tq7P59xxRHPQVNc57Y6x81N42hCSDTh
         9EH8e10qKxWMKuIaTEKZYHSQzsVtUu/Bul0kFMn0HAAxZSbwLygXGNy+i+XG64Tv+pmW
         sSqA==
X-Gm-Message-State: APjAAAXiLhAr6uKyhm8djds/ny5nfhlyYFBgavZtfhHVFUPf88CEC710
        5QXIgrOnoBeRC+NUd4wtW9gxSQ==
X-Google-Smtp-Source: APXvYqzwZW5KoeEUuhR/xpSG+UBByKq2L/Vi+sXdIEsuAE0RrrjVjkzsfcnOrSJ6cMecgwCorxKBag==
X-Received: by 2002:a1c:a9d4:: with SMTP id s203mr10920301wme.27.1558365650358;
        Mon, 20 May 2019 08:20:50 -0700 (PDT)
Received: from [192.168.1.7] (139.red-79-146-81.dynamicip.rima-tde.net. [79.146.81.139])
        by smtp.gmail.com with ESMTPSA id f81sm16242173wmf.10.2019.05.20.08.20.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 08:20:49 -0700 (PDT)
Subject: Re: [PATCH] tty: serial: msm_serial: Fix XON/XOFF
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, agross@kernel.org,
        david.brown@linaro.org, gregkh@linuxfoundation.org,
        jslaby@suse.com, keescook@chromium.org, anton@enomsg.org,
        ccross@android.com, tony.luck@intel.com,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, khasim.mohammed@linaro.org,
        agsumit@qti.qualcomm.com
References: <20190520103435.30850-1-jorge.ramirez-ortiz@linaro.org>
 <20190520145110.7BDAE21721@mail.kernel.org>
 <254704a2-ee20-30cd-8362-6e1bd23ec090@linaro.org>
 <f0c89b84-7c3d-596d-06e1-cb5172e62970@linaro.org>
 <20190520151101.GN2085@tuxbook-pro> <20190520151206.GO2085@tuxbook-pro>
From:   Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <13116b66-451b-bdf9-d631-abb8ada66e01@linaro.org>
Date:   Mon, 20 May 2019 17:20:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190520151206.GO2085@tuxbook-pro>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/20/19 17:12, Bjorn Andersson wrote:
> On Mon 20 May 08:11 PDT 2019, Bjorn Andersson wrote:
> 
>> On Mon 20 May 07:58 PDT 2019, Jorge Ramirez wrote:
>>
>>> On 5/20/19 16:56, Jorge Ramirez wrote:
>>>> On 5/20/19 16:51, Stephen Boyd wrote:
>>>>> Quoting Jorge Ramirez-Ortiz (2019-05-20 03:34:35)
>>>>>> When the tty layer requests the uart to throttle, the current code
>>>>>> executing in msm_serial will trigger "Bad mode in Error Handler" and
>>>>>> generate an invalid stack frame in pstore before rebooting (that is if
>>>>>> pstore is indeed configured: otherwise the user shall just notice a
>>>>>> reboot with no further information dumped to the console).
>>>>>>
>>>>>> This patch replaces the PIO byte accessor with the word accessor
>>>>>> already used in PIO mode.
>>>>>
>>>>> Because the hardware only accepts word based accessors and fails
>>>>> otherwise? I can believe that.
>>>>>
>>>>> I wonder if the earlier UART hardware this driver used to support (i.e.
>>>>> pre-DM) would accept byte access to the registers. It's possible, but we
>>>>> don't really care because those boards aren't supported.
>>>>
>>>> ok.
>>>>
>>>> also the PIO path uses iowrite32_rep to write a number of bytes (from 1
>>>> to 4) so I think it is also appropriate to use it for XON/XOFF.
>>>>
>>>>>
>>>>>>
>>>>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
>>>>>> ---
>>>>>
>>>>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>>>>>
>>>>>>  drivers/tty/serial/msm_serial.c | 5 ++++-
>>>>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
>>>>>> index 109096033bb1..23833ad952ba 100644
>>>>>> --- a/drivers/tty/serial/msm_serial.c
>>>>>> +++ b/drivers/tty/serial/msm_serial.c
>>>>>> @@ -869,10 +870,12 @@ static void msm_handle_tx(struct uart_port *port)
>>>>>>                 else
>>>>>>                         tf = port->membase + UART_TF;
>>>>>>  
>>>>>> +               buf[0] = port->x_char;
>>>>>> +
>>>>>>                 if (msm_port->is_uartdm)
>>>>>>                         msm_reset_dm_count(port, 1);
>>>>>>  
>>>>>> -               iowrite8_rep(tf, &port->x_char, 1);
>>>>>> +               iowrite32_rep(tf, buf, 1);
>>>>>
>>>>> I suppose it's OK to write some extra zeroes here?
>>>>>
>>>>>
>>>>
>>>> yeah, semantically confusing msm_reset_dm_count is what really matters:
>>>> it tells the hardware to only take n bytes (in this case only one) so
>>>> the others will be ignored
>>>
>>> um after I said this, maybe iowrite32_rep should only be applied to
>>> uartdm ... what do you think?
>>>
>>
>> If I read the history correctly this write was a writel() up until
>> 68252424a7c7 ("tty: serial: msm: Support big-endian CPUs").
>>
>> So I think you should just change this back to a iowrite32_rep() and add
>> a Fixes tag.
>>
> 
> I mean...

ok. cool

> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Regards,
> Bjorn
> 

