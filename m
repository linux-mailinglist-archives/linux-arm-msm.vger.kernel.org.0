Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3305123B64
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2019 16:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733285AbfETO67 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 May 2019 10:58:59 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33352 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732936AbfETO66 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 May 2019 10:58:58 -0400
Received: by mail-wm1-f65.google.com with SMTP id c66so140914wme.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2019 07:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NfF+wJElm7sO7fUhXmCqvcXujZsDjYgHnoG9GckrRbY=;
        b=UI720Zx/M7niBgl8FlQoFswrGZyl1BV8L6/UeDPhzkzuyQYMk0zgQDA5up9AifRezV
         ywfOAdN8uFrQdjSz5v7RXjHfg/qMjEbF7U/XwdOg57hsSHeET8zY39ra47k00+H4ZpS5
         /Cyotkhhy3HAz/8bdbQk84s9XqN6O6zDnXslwX5z1i2+iw/IGDHWqqhUXmom7/TCXbyq
         hecUd753WqN7tImkYAnej1Fs6eBWwWLZgB/beZSS1C71Vq+TMJFe5GRGjTJQjA+m9j9h
         JEwuMlaPFbKwW1GBTYoJDLbhJlpC4n5SXtqAGKnQ3eBTw+K1IbwVdhnYkYLaB9E6m+Mm
         WRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NfF+wJElm7sO7fUhXmCqvcXujZsDjYgHnoG9GckrRbY=;
        b=kvGncmDEq4TqKUj0cPuAeMai3WlBp4mEV0DwWNydcQ+v3ev/nk/hnWdZo+SZSiXgQO
         L8QwKYjGk8k9T9ASqqiQqrtiiFcW73ZYqd+HrD58c2yLCoc1t+anDs0f3P5GPQKpwUsb
         JCvTMixlzxVr99j5ua0UM7yriEBCAMHZeyjNEEE2IfxdcRf7iVJ02mNaSC2MuZT2Pv5D
         s4ZIkSh6rBH2WHnn74YsIVKZQUP/0NyklkBe8wBwMAG4BDrxV5KKM5NGdV7DTqWAhaY9
         Ug2EiYHHm4UjyKQPtVEsh5unZ1malO72U8kF1McREpHBhJUe4KG5SPNgSNy3yXZRE5pn
         24LA==
X-Gm-Message-State: APjAAAXy6JJS6g7TXma56CxRyybl1YZ3qFka4rhyk8MB6EVoh7aBSgV1
        Ye8tK6fxEuuncu0FnMWsFjmeHg==
X-Google-Smtp-Source: APXvYqzg9jdDOuqXBYlCmStwXnG1dRC2aDcJ8TQa6/x2HBCR9nf23+bIRkXOJiyXiuF8TTMio+Q+RQ==
X-Received: by 2002:a1c:1f47:: with SMTP id f68mr31986725wmf.57.1558364336406;
        Mon, 20 May 2019 07:58:56 -0700 (PDT)
Received: from [192.168.1.7] (139.red-79-146-81.dynamicip.rima-tde.net. [79.146.81.139])
        by smtp.gmail.com with ESMTPSA id f81sm16179742wmf.10.2019.05.20.07.58.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 07:58:55 -0700 (PDT)
Subject: Re: [PATCH] tty: serial: msm_serial: Fix XON/XOFF
From:   Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>, agross@kernel.org,
        david.brown@linaro.org, gregkh@linuxfoundation.org
Cc:     jslaby@suse.com, keescook@chromium.org, anton@enomsg.org,
        ccross@android.com, tony.luck@intel.com,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, khasim.mohammed@linaro.org,
        agsumit@qti.qualcomm.com
References: <20190520103435.30850-1-jorge.ramirez-ortiz@linaro.org>
 <20190520145110.7BDAE21721@mail.kernel.org>
 <254704a2-ee20-30cd-8362-6e1bd23ec090@linaro.org>
Message-ID: <f0c89b84-7c3d-596d-06e1-cb5172e62970@linaro.org>
Date:   Mon, 20 May 2019 16:58:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <254704a2-ee20-30cd-8362-6e1bd23ec090@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/20/19 16:56, Jorge Ramirez wrote:
> On 5/20/19 16:51, Stephen Boyd wrote:
>> Quoting Jorge Ramirez-Ortiz (2019-05-20 03:34:35)
>>> When the tty layer requests the uart to throttle, the current code
>>> executing in msm_serial will trigger "Bad mode in Error Handler" and
>>> generate an invalid stack frame in pstore before rebooting (that is if
>>> pstore is indeed configured: otherwise the user shall just notice a
>>> reboot with no further information dumped to the console).
>>>
>>> This patch replaces the PIO byte accessor with the word accessor
>>> already used in PIO mode.
>>
>> Because the hardware only accepts word based accessors and fails
>> otherwise? I can believe that.
>>
>> I wonder if the earlier UART hardware this driver used to support (i.e.
>> pre-DM) would accept byte access to the registers. It's possible, but we
>> don't really care because those boards aren't supported.
> 
> ok.
> 
> also the PIO path uses iowrite32_rep to write a number of bytes (from 1
> to 4) so I think it is also appropriate to use it for XON/XOFF.
> 
>>
>>>
>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
>>> ---
>>
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>>
>>>  drivers/tty/serial/msm_serial.c | 5 ++++-
>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
>>> index 109096033bb1..23833ad952ba 100644
>>> --- a/drivers/tty/serial/msm_serial.c
>>> +++ b/drivers/tty/serial/msm_serial.c
>>> @@ -869,10 +870,12 @@ static void msm_handle_tx(struct uart_port *port)
>>>                 else
>>>                         tf = port->membase + UART_TF;
>>>  
>>> +               buf[0] = port->x_char;
>>> +
>>>                 if (msm_port->is_uartdm)
>>>                         msm_reset_dm_count(port, 1);
>>>  
>>> -               iowrite8_rep(tf, &port->x_char, 1);
>>> +               iowrite32_rep(tf, buf, 1);
>>
>> I suppose it's OK to write some extra zeroes here?
>>
>>
> 
> yeah, semantically confusing msm_reset_dm_count is what really matters:
> it tells the hardware to only take n bytes (in this case only one) so
> the others will be ignored

um after I said this, maybe iowrite32_rep should only be applied to
uartdm ... what do you think?

> 
> 

