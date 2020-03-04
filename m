Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB4D017915B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2020 14:34:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728244AbgCDNeZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Mar 2020 08:34:25 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:10382 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729267AbgCDNeY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Mar 2020 08:34:24 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583328864; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=xv6MFMlXOagU3QnPD0NNvJ0Ra8WTeSkwaEz39tcnliI=;
 b=bJ/22Svppfd1n4Es0gvVSaeWFSeSIpdkx1Dy48y6YJ5xOvszkpEnutSJA02F0IVS+qvV4LMj
 BqiWgXqmveUEQkXnijQncgtL8kQt1htljSXOoJdcOnHGOqIKfUZaAHmI2BA5yTS/G8woxz5V
 KmUHPPGqJnzfHajMo9/hbY7RlBg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5fae5d.7f0c635c2d88-smtp-out-n01;
 Wed, 04 Mar 2020 13:34:21 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6F9C8C4479D; Wed,  4 Mar 2020 13:34:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D18D1C43383;
        Wed,  4 Mar 2020 13:34:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 04 Mar 2020 19:04:20 +0530
From:   skakit@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     gregkh@linuxfoundation.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        akashast@codeaurora.org, rojay@codeaurora.org,
        msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V2 1/2] tty: serial: qcom_geni_serial: Allocate
 port->rx_fifo buffer in probe
In-Reply-To: <158293088963.112031.11417422453396901116@swboyd.mtv.corp.google.com>
References: <1582638862-9344-1-git-send-email-skakit@codeaurora.org>
 <1582638862-9344-2-git-send-email-skakit@codeaurora.org>
 <158293088963.112031.11417422453396901116@swboyd.mtv.corp.google.com>
Message-ID: <f7cfe1e4101af5133cc8b70753d20beb@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-02-29 04:31, Stephen Boyd wrote:
> Quoting satya priya (2020-02-25 05:54:21)
>> To fix the RX cancel command failure, rx_fifo buffer needs to be
>> flushed in stop_rx() by calling handle_rx().
>> 
>> If set_termios is called before startup, by this time memory is not
>> allocated to port->rx_fifo buffer, which leads to a NULL pointer
>> dereference.
> 
> Also, clearly set_termios() isn't being called in the warning stack 
> that
> I sent last round:
> 
>      pc : handle_rx_uart+0x64/0x278
> 
> 
>      lr : qcom_geni_serial_handle_rx+0x84/0x90
> 
> 
>      sp : ffffff814348f960
> 
> 
>      x29: ffffff814348f960 x28: ffffffd01ac24288
> 
> 
>      x27: 0000000000000018 x26: 0000000000000002
> 
> 
>      x25: 0000000000000001 x24: ffffff8146341348
> 
> 
>      x23: ffffff8146341000 x22: ffffffd01accc978
> 
> 
>      x21: ffffff8146341000 x20: 0000000000000001
> 
> 
>      x19: 0000000000000001 x18: ffffffd01b22d000
> 
> 
>      x17: 0000000000008000 x16: 00000000000000b0
> 
> 
>      x15: ffffffd01afdbdd0 x14: ffffffd01b3edde0
> 
> 
>      x13: ffffffd01b7fb000 x12: 0000000000000001
> 
> 
>      x11: 0000000000000000 x10: 0000000000000000
> 
> 
>      x9 : ffffffd010344780 x8 : 0000000000000000
> 
> 
>      x7 : ffffffd019d8e768 x6 : 0000000000000000
> 
> 
>      x5 : ffffffd01adbb000 x4 : 0000000000008004
> 
> 
>      x3 : 0000000000000001 x2 : 0000000000000001
> 
> 
>      x1 : 0000000000000001 x0 : ffffffd01accc978
> 
> 
>      Call trace:
> 
> 
>       handle_rx_uart+0x64/0x278
> 
> 
>       qcom_geni_serial_handle_rx+0x84/0x90
> 
> 
>       qcom_geni_serial_stop_rx+0x110/0x180
> 
> 
>       qcom_geni_serial_port_setup+0x68/0x1b0
> 
> 
>       qcom_geni_serial_startup+0x24/0x70
> 
> 
>       uart_startup+0x164/0x28c
> 
> 
>       uart_port_activate+0x6c/0xbc
> 
> 
>       tty_port_open+0xa8/0x114
> 
> 
>       uart_open+0x28/0x38
> 
> 
>       ttyport_open+0x7c/0x164
> 
> 
>       serdev_device_open+0x38/0xe4
> 
> 
>       hci_uart_register_device+0x54/0x2e8 [hci_uart]
> 
> 
>       qca_serdev_probe+0x1c4/0x374 [hci_uart]
> 
> 
>       serdev_drv_probe+0x3c/0x64
> 
> 
>       really_probe+0x144/0x3f8
> 
> 
>       driver_probe_device+0x70/0x140
> 
> 
>       __driver_attach_async_helper+0x7c/0xa8
> 
> 
>       async_run_entry_fn+0x60/0x178
> 
> 
>       process_one_work+0x33c/0x640
> 
> 
>       worker_thread+0x2a0/0x470
> 
> 
>       kthread+0x128/0x138
> 
> 
>       ret_from_fork+0x10/0x18
> 
> 
>      Code: 1aca096a 911e0129 b940012b 7100054a (b800450b)
> 
> 
> This shows that uart_startup() is the one that is calling
> qcom_geni_serial_startup() and that's running the newly added cancel
> path. So even if we allocate the buffer in probe vs. in startup we're
> going to flip a buffer full of junk that we're trying to cancel out of
> the fifo into the tty layer. That seems wrong. We should have a
> different qcom_geni_serial_stop_rx() function that knows we're starting
> up vs. handling a normal rx event and call something besides 
> handle_rx()
> because that pushes bytes up into the tty layer.
> 

As we mentioned in the V1 patch, we are passing drop="true" to handle_rx 
function so it will read and discard whatever data present in RX FIFO, 
it won't send to upper layers.
static int handle_rx_uart(struct uart_port *uport, u32 bytes, bool drop)
{
           ....
       ioread32_rep(uport->membase + SE_GENI_RX_FIFOn, port->rx_fifo, 
words);
         if (drop)
                 return 0;
           ....
}
In general uart_startup() is called before set_termios() ,but as per the 
crash logs shared, it seems RX engine is active(which can only happen 
from set_termios) before startup() is called.So, if we allocate 
port->rx_fifo in probe we can overcome this crash.

>> 
>> To avoid this NULL pointer dereference allocate memory to 
>> port->rx_fifo
>> in probe itself.
>> 
