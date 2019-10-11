Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7973D3A1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2019 09:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727167AbfJKHjV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Oct 2019 03:39:21 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39392 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726853AbfJKHjV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Oct 2019 03:39:21 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 27626606CF; Fri, 11 Oct 2019 07:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570779560;
        bh=igbGnpEs+8yznnX8LP1VDR520YvxYge06B1VKFmy1Hg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=EQ/l29+SfWAyCV6OvGCPRabfmj4xvVKrIe1lrq0YiT2nS+JhdggQ2080rfe3uN4Vw
         xORmOC15dHBT21Geuj7S18/UNBIaSHiL5unHxpSEd2ylqV6Lacz+MPoIv7QRGL4Lb1
         xKV8rKthA0kwZwrn8H37kMr2KkiS0kZOR6kIBhWE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.252.222.65] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 09EF2606CF;
        Fri, 11 Oct 2019 07:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570779559;
        bh=igbGnpEs+8yznnX8LP1VDR520YvxYge06B1VKFmy1Hg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=amdASn4+H2sls1+4W2CIwYjd3prMQKARYT4/DrKPaOnXTlPCZJy6S8VXtddxr05u0
         vBa2YdCFLp4voq18fKdPhj8VeOtBJpgT6FN6Z6N0x5ktL+Mjb06IBUFgPYNGtqcHjl
         W94vun3/UZ+vyNNBv9IR6NSQfEHzNi7viv+5MpRg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 09EF2606CF
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V2 1/2] tty: serial: qcom_geni_serial: IRQ cleanup
To:     Stephen Boyd <swboyd@chromium.org>, gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mgautam@codeaurora.org, bjorn.andersson@linaro.org
References: <1570700763-17319-1-git-send-email-akashast@codeaurora.org>
 <5d9f3dfa.1c69fb81.84c4b.30bf@mx.google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <010dd569-d172-fdcf-0bfa-8caaf41a4d46@codeaurora.org>
Date:   Fri, 11 Oct 2019 13:09:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5d9f3dfa.1c69fb81.84c4b.30bf@mx.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/10/2019 7:49 PM, Stephen Boyd wrote:
> Quoting Akash Asthana (2019-10-10 02:46:03)
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
>> index 14c6306..5180cd8 100644
>> --- a/drivers/tty/serial/qcom_geni_serial.c
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>> @@ -1297,11 +1291,21 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>          port->rx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
>>          port->tx_fifo_width = DEF_FIFO_WIDTH_BITS;
>>   
>> +       scnprintf(port->name, sizeof(port->name), "qcom_geni_serial_%s%d",
>> +               (uart_console(uport) ? "console" : "uart"), uport->line);
> Drop useless parenthesis. Also, it might make more sense to make this a
> devm_kasprintf() call now.

OK

>>          irq = platform_get_irq(pdev, 0);
>>          if (irq < 0)
>>                  return irq;
>>          uport->irq = irq;
>>   
>> +       irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
> Is there a reason why we can't always leave the irq enabled and request
> it later once the uart structure has been fully initialized?

According to current design we are requesting IRQ handler in probe, and 
we enable and disable it from the startup(port open) and shutdown(port 
close) function respectively.

We need to call for disable_irq in shutdown function because client has 
closed the port and we don't expect any transfer requests after it.

>>request it later once the uart structure has been fully initialized?

     Is the ask is to move request irq later in probe after the uport is 
fully initialized?

>> +       ret = devm_request_irq(uport->dev, uport->irq, qcom_geni_serial_isr,
>> +                       IRQF_TRIGGER_HIGH, port->name, uport);
>> +       if (ret) {
>> +               dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
>> +               return ret;
>> +       }
>> +
>>          uport->private_data = drv;
>>          platform_set_drvdata(pdev, port);
>>          port->handle_rx = console ? handle_rx_console : handle_rx_uart;

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

