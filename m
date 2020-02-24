Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55B3E16A8C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2020 15:47:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727486AbgBXOrh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Feb 2020 09:47:37 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:18625 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727181AbgBXOrh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Feb 2020 09:47:37 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582555656; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=/uUgbLeJp/+Bkvmc2w1qGweaYram/0ZSk0nPcq6znjg=;
 b=LmZEzAraexxjKaqK3mL9bYTR+JvahEBw0+0JjIxL13qHIRKNTC1yhbb4CFW39kSXN2MjiR9n
 JuV6lpAo2pD0o/KCH6QRdKlZbX30nopOC2tU2r91VtlxitND/jLuP5g9hw4mmbwjY1mDQk4K
 ErCnKo749a8F3r3ye2YfRjJtlMU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e53e1fc.7fb0a5e84688-smtp-out-n03;
 Mon, 24 Feb 2020 14:47:24 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C86B1C4479D; Mon, 24 Feb 2020 14:47:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1D293C43383;
        Mon, 24 Feb 2020 14:47:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 24 Feb 2020 20:17:23 +0530
From:   skakit@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     gregkh@linuxfoundation.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        akashast@codeaurora.org, rojay@codeaurora.org,
        msavaliy@qti.qualcomm.com
Subject: Re: [PATCH] tty: serial: qcom_geni_serial: Fix RX cancel command
 failure
In-Reply-To: <158213461988.184098.7165493520823815160@swboyd.mtv.corp.google.com>
References: <1581415982-8793-1-git-send-email-skakit@codeaurora.org>
 <158154775640.184098.13898240474253130921@swboyd.mtv.corp.google.com>
 <254d7b003fdcd6f5fc0c45ab75b4b5f2@codeaurora.org>
 <158213461988.184098.7165493520823815160@swboyd.mtv.corp.google.com>
Message-ID: <52dda56a636e96014b0705a2dcdbbf50@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-02-19 23:20, Stephen Boyd wrote:
> Quoting skakit@codeaurora.org (2020-02-14 05:17:01)
>> On 2020-02-13 04:19, Stephen Boyd wrote:
>> >     driver_probe_device+0x70/0x140
>> >     __driver_attach_async_helper+0x7c/0xa8
>> >     async_run_entry_fn+0x60/0x178
>> >     process_one_work+0x33c/0x640
>> >     worker_thread+0x2a0/0x470
>> >     kthread+0x128/0x138
>> >     ret_from_fork+0x10/0x18
>> >    Code: 1aca096a 911e0129 b940012b 7100054a (b800450b)
>> I think the most probable explanation of the crash is, set_termios 
>> call
>> is starting RX engine and RX engine is sampling some garbage data from
>> line, and by the time startup is called, we have few data to read.
>> How frequently you are able to see this crash? because internally we 
>> are
>> unable to reproduce it.
> 
> How is set_termios involved? Is that starting the RX side before
> uart_startup() is called? Sorry I haven't looked into the code flow 
> very
> deeply here.
> 
> It seems to happen when the bluetooth driver probes so maybe constantly
> adding and removing the hci_uart module will cause this to happen for
> you? I also run the kernel with many debug options enabled, so maybe 
> try
> enabling all the debug stuff? I see it randomly right now so I'm not
> sure.
> 

In general uart_startup() is called before set_termios() ,but as per the 
crash logs shared, it seems RX engine is active(which can only happen 
from set_termios) before startup() is called.

>> >
>> >
>> > This seems to be the problematic line. We didn't call handle_rx() from
>> > the stop_rx() path before. And this qcom_geni_serial_stop_rx() function
>> > is called from qcom_geni_serial_startup(), but most importantly, we
>> > call
>> > into this function from startup before we allocate memory for the
>> > port->rx_fifo member (see the devm_kcalloc() later in
>> > qcom_geni_serial_port_setup() and see how it's after we stop rx).
>> >
>> > Why do we need to flush the rx buffer by reading it into the software
>> > buffer? Can't we simply ack any outstanding RX interrupts in the
>> > hardware when we're stopping receive?
>> We can't simply ack RX_LAST interrupt, there is a sticky bit that get
>> set on HW level(not exposed to SW) with RX last interrupt. The only 
>> way
>> to clear it is flush out RX FIFO HW buffer. The sticky bit can create
>> problem for future transfers if remained uncleared.
>> How about we allocate buffer to port->rx_fifo in probe itself?
> 
> Ok. If we have to read the rx fifo to flush the buffer then perhaps
> write another function that qcom_geni_serial_stop_rx() can use to
> indicate that it wants to throw away whatever is in the rx fifo? Or
> adjust handle_rx() to check for a NULL fifo pointer and throw it away 
> in
> that case? When we're setting up this device I don't understand why we
> would want to read anything out of the rx fifo that was there before 
> the
> driver started.

We cannot adjust handle_rx() to check for a NULL fifo pointer as reading 
from RX FIFO is mandatory to clear the sticky bit set.  We are passing 
"true" to handle_rx function so it will read and discard whatever data 
present in RX FIFO, it won't send to upper layers. We are planning to 
post a patch which has rx_fifo buffer allocated in probe itself, in 
order to avoid the NULL dereference.
