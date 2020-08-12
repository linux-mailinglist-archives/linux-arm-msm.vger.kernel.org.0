Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD77242739
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 11:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbgHLJMD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 05:12:03 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:43573 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726409AbgHLJMD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 05:12:03 -0400
Received: by mail-ej1-f65.google.com with SMTP id m22so1416760eje.10;
        Wed, 12 Aug 2020 02:12:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OTisqPWsNaLTBYitGN0ANbWIWidBebEjPE1GGi+XHPo=;
        b=WCUHjJcRRwnGAq9VOuOmTvmvip3lFPELMqiMREB4HgYk75LxdFGk5cszIv0f2c6crd
         cJj0Dxgj82uhRS+RUN4CnouF7qJayJMvZ9h8odbQOWue6jIdkuC3k/W+Q+UK2NdajNCx
         4LsVQXPmzTNKGpK9NkZxk/7U6SjCHHysjrn4rh4ow008TZscUgfmUiNWvO9LG3fsoF2U
         f2RJLIwNp30CUtsJJEbpOzP7Ynh6M0EB6grrJaHOru2o/ADy4ubrCNrVaG1vAfzaNac0
         PcdP9L5RokNlHBPtq8m5EWFtrFzRIK22tQ3H3L3IARhpsQsvj57oYaAEtn9up9rbONdT
         Pjgw==
X-Gm-Message-State: AOAM530972VnIAy31LcF0NTiWq/0i8RMAGLGcGzwcV4CBg5hwcFKvIX6
        8lHepuQNNyTT/m2TXk1g/gjevcMH
X-Google-Smtp-Source: ABdhPJx4Ji37nXDxN20tn3PvjQIZPTdXvsFQViO+KYO2t3kFaOFPoZTfU7qrcm4UESPYpxrGCY3/WA==
X-Received: by 2002:a17:906:e0e:: with SMTP id l14mr28652549eji.398.1597223521309;
        Wed, 12 Aug 2020 02:12:01 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::ee2? ([2a0b:e7c0:0:107::ee2])
        by smtp.gmail.com with ESMTPSA id p3sm1053769edx.75.2020.08.12.02.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2020 02:12:00 -0700 (PDT)
Subject: Re: [RFC][PATCH] tty: serial: qcom_geni_serial: Drop __init from
 qcom_geni_console_setup
To:     John Stultz <john.stultz@linaro.org>,
        Saravana Kannan <saravanak@google.com>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Todd Kjos <tkjos@google.com>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org
References: <20200811025044.70626-1-john.stultz@linaro.org>
 <CAGETcx8qjnVNNB_z-Ar8gxKAy7Sc8kcj8oAWQ76mXcBpaqnagg@mail.gmail.com>
 <CALAqxLUhX0JLLvn=4fNXk0z6dm=teqCaBmz2VDPEKGfZ+EDFZw@mail.gmail.com>
From:   Jiri Slaby <jirislaby@kernel.org>
Message-ID: <74bc87df-db5a-4388-9b8d-4eed78196685@kernel.org>
Date:   Wed, 12 Aug 2020 11:11:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CALAqxLUhX0JLLvn=4fNXk0z6dm=teqCaBmz2VDPEKGfZ+EDFZw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11. 08. 20, 22:02, John Stultz wrote:
> On Tue, Aug 11, 2020 at 10:00 AM Saravana Kannan <saravanak@google.com> wrote:
>>
>> On Mon, Aug 10, 2020 at 7:50 PM John Stultz <john.stultz@linaro.org> wrote:
>>>
>>> When booting with heavily modularized config, the serial console
>>> may not be able to load until after init when modules that
>>> satisfy needed dependencies have time to load.
>>>
>>> Unfortunately, as qcom_geni_console_setup is marked as __init,
>>> the function may have been freed before we get to run it,
>>> causing boot time crashes such as:
>>
>> Btw, I thought non-__init functions calling __init functions would be
>> caught by the build system. Is that not correct? If it's correct, do
>> we know how this gets past that check?
> 
> I think it's because it's indirectly called through a function pointer.

Definitely.

Given there are lots of __init by *_console_setup, I wonder how many
console drivers return EPROBE_DEFER from probe and then register the
console from the same (but deferred) probe like this driver does...

In fact, it doesn't even matter if the probe returns EPROBE_DEFER. The
probe is not marked __init, so the setup shouldn't be either.

thanks,
-- 
js
