Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 767EE179186
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2020 14:38:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729386AbgCDNi4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Mar 2020 08:38:56 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:13139 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729118AbgCDNi4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Mar 2020 08:38:56 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583329135; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Hr/VA6ezPuA2jJjtVJqg1r1s/E5G0dTBBd2WX54vlnQ=;
 b=g04UklFkF24pJKk0R//XGG+UazaRBQtNw4meJiFg//zfV7gVRc1h1xMPeG7/N316B28OFHop
 tYuH5iJLCfyHP3vP+HQkNIh7iCD5r4h1xy1nYo3NYSjNttmIMxCIXyHBGK89QGdmKx9WoFYa
 zwkDrr/5xiVvtj3ZggVX/6ssPsM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5faf6e.7fe30c1fdea0-smtp-out-n01;
 Wed, 04 Mar 2020 13:38:54 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0001FC4479F; Wed,  4 Mar 2020 13:38:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 495B2C43383;
        Wed,  4 Mar 2020 13:38:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 04 Mar 2020 19:08:53 +0530
From:   skakit@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     gregkh@linuxfoundation.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        akashast@codeaurora.org, rojay@codeaurora.org,
        msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V2 1/2] tty: serial: qcom_geni_serial: Allocate
 port->rx_fifo buffer in probe
In-Reply-To: <158293049615.112031.13967218907878863371@swboyd.mtv.corp.google.com>
References: <1582638862-9344-1-git-send-email-skakit@codeaurora.org>
 <1582638862-9344-2-git-send-email-skakit@codeaurora.org>
 <158293049615.112031.13967218907878863371@swboyd.mtv.corp.google.com>
Message-ID: <10271d550b48a61e1fc7a61b69b64d31@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-02-29 04:24, Stephen Boyd wrote:
> Quoting satya priya (2020-02-25 05:54:21)
>> To fix the RX cancel command failure, rx_fifo buffer needs to be
>> flushed in stop_rx() by calling handle_rx().
>> 
>> If set_termios is called before startup, by this time memory is not
>> allocated to port->rx_fifo buffer, which leads to a NULL pointer
>> dereference.
>> 
>> To avoid this NULL pointer dereference allocate memory to 
>> port->rx_fifo
>> in probe itself.
>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
> 
> Please give me reported-by credit.
> 
> Reported-by: Stephen Boyd <swboyd@chromium.org>

Ok.

> 
>> ---
>>  drivers/tty/serial/qcom_geni_serial.c | 13 +++++++------
>>  1 file changed, 7 insertions(+), 6 deletions(-)
>> 
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c 
>> b/drivers/tty/serial/qcom_geni_serial.c
>> index 191abb1..d2a909c 100644
>> --- a/drivers/tty/serial/qcom_geni_serial.c
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>> @@ -858,12 +858,6 @@ static int qcom_geni_serial_port_setup(struct 
>> uart_port *uport)
>>                                                 false, false, true);
>>         geni_se_init(&port->se, UART_RX_WM, port->rx_fifo_depth - 2);
>>         geni_se_select_mode(&port->se, GENI_SE_FIFO);
>> -       if (!uart_console(uport)) {
>> -               port->rx_fifo = devm_kcalloc(uport->dev,
>> -                       port->rx_fifo_depth, sizeof(u32), GFP_KERNEL);
>> -               if (!port->rx_fifo)
>> -                       return -ENOMEM;
>> -       }
>>         port->setup = true;
>> 
>>         return 0;
>> @@ -1274,6 +1268,13 @@ static int qcom_geni_serial_probe(struct 
>> platform_device *pdev)
>>         port->rx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
>>         port->tx_fifo_width = DEF_FIFO_WIDTH_BITS;
>> 
>> +       if (!console) {
>> +               port->rx_fifo = devm_kcalloc(uport->dev,
>> +                       port->rx_fifo_depth, sizeof(u32), GFP_KERNEL);
>> +               if (!port->rx_fifo)
>> +                       return -ENOMEM;
>> +       }
> 
> Is there any reason the rx_fifo pointer is a u32 instead of a u8 or 
> void
> pointer? ioread32_rep() doesn't care what the pointer is and then we
> have to cast it, so it seems like we should do something like below 
> too.
> 

Yes, we can use void instead of u32, will add this change in next patch.

> -----8<-----
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c
> b/drivers/tty/serial/qcom_geni_serial.c
> index 191abb18fc2a..b4875dfef6aa 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -113,7 +113,7 @@ struct qcom_geni_serial_port {
>  	unsigned int baud;
>  	unsigned int tx_bytes_pw;
>  	unsigned int rx_bytes_pw;
> -	u32 *rx_fifo;
> +	u8 *rx_fifo;
>  	u32 loopback;
>  	bool brk;
> 
> @@ -504,7 +504,6 @@ static int handle_rx_console(struct uart_port
> *uport, u32 bytes, bool drop)
> 
>  static int handle_rx_uart(struct uart_port *uport, u32 bytes, bool 
> drop)
>  {
> -	unsigned char *buf;
>  	struct tty_port *tport;
>  	struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
>  	u32 num_bytes_pw = port->tx_fifo_width / BITS_PER_BYTE;
> @@ -516,8 +515,7 @@ static int handle_rx_uart(struct uart_port *uport,
> u32 bytes, bool drop)
>  	if (drop)
>  		return 0;
> 
> -	buf = (unsigned char *)port->rx_fifo;
> -	ret = tty_insert_flip_string(tport, buf, bytes);
> +	ret = tty_insert_flip_string(tport, port->rx_fifo, bytes);
>  	if (ret != bytes) {
>  		dev_err(uport->dev, "%s:Unable to push data ret %d_bytes %d\n",
>  				__func__, ret, bytes);
