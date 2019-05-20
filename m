Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5153023B57
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2019 16:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732902AbfETO5D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 May 2019 10:57:03 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46167 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731455AbfETO5D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 May 2019 10:57:03 -0400
Received: by mail-wr1-f67.google.com with SMTP id r7so14934615wrr.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2019 07:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=g4F9hU8J3C+nvQrYfBSkrDIKfockwKfku650J+JBeIg=;
        b=qeBSn7dwzGMdxB68NipEKXOsl8lKlXpo47d1lLKffFwnlr94dsSP77y+IWuurSKD+Q
         EgYH+XE/TQWuZbIwhfuP9BaZFLeCkMBYetrUR5oygTseBT7rCOzUC1stMRSsUND2eNtX
         5dletx1MR5DzHEF0uR06puDFh9Cb273Eg3cc4CwMZHDUWb9fG8ji1zMz7riBpODPRWRs
         qSSqxxVAYX7dmjl4gIZ4Vl2YtFdx7+VPyXKYPy/cwkoOX3VUooee4o1dttwtRn7TWKxc
         DTciSEYXlgkfvLf6OI8QTqmiyCIQJs6C6q+Y2hUl9B+ShP9PenPCwTegCjH0sxrwQ0Xl
         XQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=g4F9hU8J3C+nvQrYfBSkrDIKfockwKfku650J+JBeIg=;
        b=YpSE4fR7/cCn6fjzT7oBtsNaJbNPpaM/8tmhoqJ+YUBQNPCK68mM9iy4Y/T1/tDEjG
         t3C6ide38Q4S/q1rp3Fh8pqxdvL0cOXmWdM0FCpLczGK0z1yYR5+Gd7IHUq/LEgpOy1i
         6gsg59RpBUCHDFD8SZxlfeavXMCBUODG1XxEtu4iQkEHWy+o/7ijTeQa6naonL7rFd4O
         vkXvJsMTRZi5H3gYOAI3PxuNnbJl5T20wdKCpLz93+U+w13hXoBdb0ODTYvLMAd2eN0x
         FUE/Pz4RbfHCSOnQXPBtuAvXxbXUlq4CKJwsha+txe7mjpOuw/XiMn7+u9HPGMS/ZCqE
         sSTA==
X-Gm-Message-State: APjAAAUxODPwZkTcjJZDr7Bq/Z82WvzycUpuXajnubFFGU3o2rxLcPwz
        JFBE/jPThesT4vROmCcpYH1m6g==
X-Google-Smtp-Source: APXvYqwWOG/8r+rAwHpKcfkOrw7ZMVKNgT8mP3L+MxEin0S4ttFlJPx1cpqJXbIkCB+P0j2RORoOzg==
X-Received: by 2002:adf:8189:: with SMTP id 9mr43959318wra.71.1558364221961;
        Mon, 20 May 2019 07:57:01 -0700 (PDT)
Received: from [192.168.1.7] (139.red-79-146-81.dynamicip.rima-tde.net. [79.146.81.139])
        by smtp.gmail.com with ESMTPSA id t13sm37837110wra.81.2019.05.20.07.57.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 07:57:00 -0700 (PDT)
Subject: Re: [PATCH] tty: serial: msm_serial: Fix XON/XOFF
To:     Stephen Boyd <sboyd@kernel.org>, agross@kernel.org,
        david.brown@linaro.org, gregkh@linuxfoundation.org
Cc:     jslaby@suse.com, keescook@chromium.org, anton@enomsg.org,
        ccross@android.com, tony.luck@intel.com,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, khasim.mohammed@linaro.org,
        agsumit@qti.qualcomm.com
References: <20190520103435.30850-1-jorge.ramirez-ortiz@linaro.org>
 <20190520145110.7BDAE21721@mail.kernel.org>
From:   Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <254704a2-ee20-30cd-8362-6e1bd23ec090@linaro.org>
Date:   Mon, 20 May 2019 16:56:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190520145110.7BDAE21721@mail.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/20/19 16:51, Stephen Boyd wrote:
> Quoting Jorge Ramirez-Ortiz (2019-05-20 03:34:35)
>> When the tty layer requests the uart to throttle, the current code
>> executing in msm_serial will trigger "Bad mode in Error Handler" and
>> generate an invalid stack frame in pstore before rebooting (that is if
>> pstore is indeed configured: otherwise the user shall just notice a
>> reboot with no further information dumped to the console).
>>
>> This patch replaces the PIO byte accessor with the word accessor
>> already used in PIO mode.
> 
> Because the hardware only accepts word based accessors and fails
> otherwise? I can believe that.
> 
> I wonder if the earlier UART hardware this driver used to support (i.e.
> pre-DM) would accept byte access to the registers. It's possible, but we
> don't really care because those boards aren't supported.

ok.

also the PIO path uses iowrite32_rep to write a number of bytes (from 1
to 4) so I think it is also appropriate to use it for XON/XOFF.

> 
>>
>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
>> ---
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
>>  drivers/tty/serial/msm_serial.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
>> index 109096033bb1..23833ad952ba 100644
>> --- a/drivers/tty/serial/msm_serial.c
>> +++ b/drivers/tty/serial/msm_serial.c
>> @@ -869,10 +870,12 @@ static void msm_handle_tx(struct uart_port *port)
>>                 else
>>                         tf = port->membase + UART_TF;
>>  
>> +               buf[0] = port->x_char;
>> +
>>                 if (msm_port->is_uartdm)
>>                         msm_reset_dm_count(port, 1);
>>  
>> -               iowrite8_rep(tf, &port->x_char, 1);
>> +               iowrite32_rep(tf, buf, 1);
> 
> I suppose it's OK to write some extra zeroes here?
> 
> 

yeah, semantically confusing msm_reset_dm_count is what really matters:
it tells the hardware to only take n bytes (in this case only one) so
the others will be ignored


