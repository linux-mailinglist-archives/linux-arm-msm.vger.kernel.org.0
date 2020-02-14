Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5D715D83A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2020 14:17:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729070AbgBNNRG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Feb 2020 08:17:06 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:36524 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728336AbgBNNRF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Feb 2020 08:17:05 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581686225; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=yZ7VY4a7auFcsueSBuTqA9/PXcjPj44UrOkGXzw2u/o=;
 b=EAJNzYP25sdfKAo1naSUDaCJhDb5OiV8KvpZPCdBeFhBsImaB9DHIs6EhrVS1RweSFRqjCgn
 RQKazwH/udm4nquoen+evXHDKTcQ+qZf1Z1uG21wNYLqQjD3pW8dRrRulFGY+HM+mJk8k5UL
 Zw/gExWw39SVl6y5xpKxVtNukyo=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e469dd0.7fec4fbbb458-smtp-out-n01;
 Fri, 14 Feb 2020 13:17:04 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9A8C4C4479F; Fri, 14 Feb 2020 13:17:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C1EF8C43383;
        Fri, 14 Feb 2020 13:17:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 14 Feb 2020 18:47:01 +0530
From:   skakit@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     gregkh@linuxfoundation.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        akashast@codeaurora.org, rojay@codeaurora.org
Subject: Re: [PATCH] tty: serial: qcom_geni_serial: Fix RX cancel command
 failure
In-Reply-To: <158154775640.184098.13898240474253130921@swboyd.mtv.corp.google.com>
References: <1581415982-8793-1-git-send-email-skakit@codeaurora.org>
 <158154775640.184098.13898240474253130921@swboyd.mtv.corp.google.com>
Message-ID: <254d7b003fdcd6f5fc0c45ab75b4b5f2@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-02-13 04:19, Stephen Boyd wrote:
> Quoting satya priya (2020-02-11 02:13:02)
>> RX cancel command fails when BT is switched on and off multiple times.
>> 
>> To handle this, poll for the cancel bit in SE_GENI_S_IRQ_STATUS 
>> register
>> instead of SE_GENI_S_CMD_CTRL_REG.
>> 
>> As per the HPG update, handle the RX last bit after cancel command
>> and flush out the RX FIFO buffer.
>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> ---
> 
> I'm pretty sure I saw an oops with this patch.
> 
>    Unable to handle kernel NULL pointer dereference at virtual address
> 0000000000000000
>    Mem abort info:
>      ESR = 0x96000046
>      EC = 0x25: DABT (current EL), IL = 32 bits
>    Bluetooth: hci_ldisc.c:hci_uart_register_proto() HCI UART protocol
> QCA registered
>      SET = 0, FnV = 0
>      EA = 0, S1PTW = 0
>    Data abort info:
>      ISV = 0, ISS = 0x00000046
>      CM = 0, WnR = 1
>    user pgtable: 4k pages, 39-bit VAs, pgdp=00000001b4645000
>    [0000000000000000] pgd=00000001ac579003, pud=00000001ac579003,
> pmd=0000000000000000
>    Internal error: Oops: 96000046 [#1] PREEMPT SMP
>    Modules linked in: hci_uart(+) qcom_spmi_temp_alarm btqca
> qcom_spmi_adc5 qcom_vadc_common bluetooth ecdh_generic ecc venus_core
> v4l2_mem2mem videobuf2_v4l2 videobuf2_common ipa qcom_q6v5_mss
> qcom_q6v5_ipa_notify qcom_common qcom_q6v5 xt_MASQUERADE fuse
> rmtfs_mem iio_trig_sysfs cros_ec_sensors_ring cros_ec_sensors
> cros_ec_sensors_core industrialio_triggered_buffer kfifo_buf
> cros_ec_sensorsupport ath10k_snoc qmi_helpers ath10k_core ath lzo_rle
> lzo_compress mac80211 zram cfg80211 joydev
>    CPU: 7 PID: 258 Comm: kworker/u16:3 Tainted: G S      W         
> 5.4.17 #19
>    Workqueue: events_unbound async_run_entry_fn
>    pstate: 60c00009 (nZCv daif +PAN +UAO)
>    pc : handle_rx_uart+0x64/0x278
>    lr : qcom_geni_serial_handle_rx+0x84/0x90
>    sp : ffffff814348f960
>    x29: ffffff814348f960 x28: ffffffd01ac24288
>    x27: 0000000000000018 x26: 0000000000000002
>    x25: 0000000000000001 x24: ffffff8146341348
>    x23: ffffff8146341000 x22: ffffffd01accc978
>    x21: ffffff8146341000 x20: 0000000000000001
>    x19: 0000000000000001 x18: ffffffd01b22d000
>    x17: 0000000000008000 x16: 00000000000000b0
>    x15: ffffffd01afdbdd0 x14: ffffffd01b3edde0
>    x13: ffffffd01b7fb000 x12: 0000000000000001
>    x11: 0000000000000000 x10: 0000000000000000
>    x9 : ffffffd010344780 x8 : 0000000000000000
>    x7 : ffffffd019d8e768 x6 : 0000000000000000
>    x5 : ffffffd01adbb000 x4 : 0000000000008004
>    x3 : 0000000000000001 x2 : 0000000000000001
>    x1 : 0000000000000001 x0 : ffffffd01accc978
>    Call trace:
>     handle_rx_uart+0x64/0x278
>     qcom_geni_serial_handle_rx+0x84/0x90
>     qcom_geni_serial_stop_rx+0x110/0x180
>     qcom_geni_serial_port_setup+0x68/0x1b0
>     qcom_geni_serial_startup+0x24/0x70
>     uart_startup+0x164/0x28c
>     uart_port_activate+0x6c/0xbc
>     tty_port_open+0xa8/0x114
>     uart_open+0x28/0x38
>     ttyport_open+0x7c/0x164
>     serdev_device_open+0x38/0xe4
>     hci_uart_register_device+0x54/0x2e8 [hci_uart]
>     qca_serdev_probe+0x1c4/0x374 [hci_uart]
>     serdev_drv_probe+0x3c/0x64
>     really_probe+0x144/0x3f8
>     driver_probe_device+0x70/0x140
>     __driver_attach_async_helper+0x7c/0xa8
>     async_run_entry_fn+0x60/0x178
>     process_one_work+0x33c/0x640
>     worker_thread+0x2a0/0x470
>     kthread+0x128/0x138
>     ret_from_fork+0x10/0x18
>    Code: 1aca096a 911e0129 b940012b 7100054a (b800450b)
I think the most probable explanation of the crash is, set_termios call 
is starting RX engine and RX engine is sampling some garbage data from 
line, and by the time startup is called, we have few data to read.
How frequently you are able to see this crash? because internally we are 
unable to reproduce it.
> 
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c 
>> b/drivers/tty/serial/qcom_geni_serial.c
>> index 191abb1..0bd1684 100644
>> --- a/drivers/tty/serial/qcom_geni_serial.c
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>> @@ -599,7 +600,7 @@ static void qcom_geni_serial_stop_rx(struct 
>> uart_port *uport)
>>         u32 irq_en;
>>         u32 status;
>>         struct qcom_geni_serial_port *port = to_dev_port(uport, 
>> uport);
>> -       u32 irq_clear = S_CMD_DONE_EN;
>> +       u32 s_irq_status;
>> 
>>         irq_en = readl(uport->membase + SE_GENI_S_IRQ_EN);
>>         irq_en &= ~(S_RX_FIFO_WATERMARK_EN | S_RX_FIFO_LAST_EN);
>> @@ -615,10 +616,19 @@ static void qcom_geni_serial_stop_rx(struct 
>> uart_port *uport)
>>                 return;
>> 
>>         geni_se_cancel_s_cmd(&port->se);
>> -       qcom_geni_serial_poll_bit(uport, SE_GENI_S_CMD_CTRL_REG,
>> -                                       S_GENI_CMD_CANCEL, false);
>> +       qcom_geni_serial_poll_bit(uport, SE_GENI_S_IRQ_STATUS,
>> +                                       S_CMD_CANCEL_EN, true);
>> +       /*
>> +        * If timeout occurs secondary engine remains active
>> +        * and Abort sequence is executed.
>> +        */
>> +       s_irq_status = readl(uport->membase + SE_GENI_S_IRQ_STATUS);
>> +       /* Flush the Rx buffer */
>> +       if (s_irq_status & S_RX_FIFO_LAST_EN)
>> +               qcom_geni_serial_handle_rx(uport, true);
> 
> This seems to be the problematic line. We didn't call handle_rx() from
> the stop_rx() path before. And this qcom_geni_serial_stop_rx() function
> is called from qcom_geni_serial_startup(), but most importantly, we 
> call
> into this function from startup before we allocate memory for the
> port->rx_fifo member (see the devm_kcalloc() later in
> qcom_geni_serial_port_setup() and see how it's after we stop rx).
> 
> Why do we need to flush the rx buffer by reading it into the software
> buffer? Can't we simply ack any outstanding RX interrupts in the
> hardware when we're stopping receive?
We can't simply ack RX_LAST interrupt, there is a sticky bit that get 
set on HW level(not exposed to SW) with RX last interrupt. The only way 
to clear it is flush out RX FIFO HW buffer. The sticky bit can create 
problem for future transfers if remained uncleared.
How about we allocate buffer to port->rx_fifo in probe itself?
> 
>> +       writel(s_irq_status, uport->membase + SE_GENI_S_IRQ_CLEAR);
>> +
>>         status = readl(uport->membase + SE_GENI_STATUS);
>> -       writel(irq_clear, uport->membase + SE_GENI_S_IRQ_CLEAR);
>>         if (status & S_GENI_CMD_ACTIVE)
>>                 qcom_geni_serial_abort_rx(uport);
