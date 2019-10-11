Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF8DD3CB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2019 11:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727664AbfJKJst (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Oct 2019 05:48:49 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:34624 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727470AbfJKJst (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Oct 2019 05:48:49 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B032360AA3; Fri, 11 Oct 2019 09:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570787327;
        bh=LZttN4Q6nh1yY9TN0gKFBPwWhpkdhCfv74mQOWuTlZM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=enVIRGGDsEDp2gO/lHIMnF7wqujLvRj59IEJlLi38NjbiAEbJqeB/pmf1mZPM00Ob
         Qv5Gj8GtrZ8tik/3QoS49aYdxRSrC9kPQBgKpVj5cBXBONIQle+kXxW+b06W6eAUtD
         LImrdRQ2NaqOHSWLsYn+P0ZJQjOnOv1ZWcb3G1nA=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E9736606CF;
        Fri, 11 Oct 2019 09:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570787327;
        bh=LZttN4Q6nh1yY9TN0gKFBPwWhpkdhCfv74mQOWuTlZM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=enVIRGGDsEDp2gO/lHIMnF7wqujLvRj59IEJlLi38NjbiAEbJqeB/pmf1mZPM00Ob
         Qv5Gj8GtrZ8tik/3QoS49aYdxRSrC9kPQBgKpVj5cBXBONIQle+kXxW+b06W6eAUtD
         LImrdRQ2NaqOHSWLsYn+P0ZJQjOnOv1ZWcb3G1nA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E9736606CF
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V2 2/2] tty: serial: qcom_geni_serial: Wakeup over UART RX
To:     Stephen Boyd <swboyd@chromium.org>, gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mgautam@codeaurora.org, bjorn.andersson@linaro.org
References: <1570700803-17566-1-git-send-email-akashast@codeaurora.org>
 <5d9f3f4f.1c69fb81.5120f.b90e@mx.google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <a7dabb1d-b6af-acc5-ba4e-923ee5fc6ee3@codeaurora.org>
Date:   Fri, 11 Oct 2019 15:18:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5d9f3f4f.1c69fb81.5120f.b90e@mx.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/10/2019 7:55 PM, Stephen Boyd wrote:
> Quoting Akash Asthana (2019-10-10 02:46:43)
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
>> index 5180cd8..ff63728 100644
>> --- a/drivers/tty/serial/qcom_geni_serial.c
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>> @@ -1306,6 +1317,29 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>                  return ret;
>>          }
>>   
>> +       if (!console) {
>> +               port->wakeup_irq = platform_get_irq(pdev, 1);
> Should use platform_get_irq_optional() it seems.
OK
>
>> +               if (port->wakeup_irq < 0) {
>> +                       dev_err(&pdev->dev, "Failed to get wakeup IRQ %d\n",
>> +                                       port->wakeup_irq);
>> +               } else {
>> +                       irq_set_status_flags(port->wakeup_irq, IRQ_NOAUTOEN);
>> +                       ret = devm_request_irq(uport->dev, port->wakeup_irq,
>> +                               qcom_geni_serial_wakeup_isr,
>> +                               IRQF_TRIGGER_FALLING, "uart_wakeup", uport);
>> +                       if (ret) {
>> +                               dev_err(uport->dev, "Failed to register wakeup IRQ ret %d\n",
>> +                                               ret);
>> +                               return ret;
>> +                       }
>> +
>> +                       device_init_wakeup(&pdev->dev, true);
>> +                       ret = dev_pm_set_wake_irq(&pdev->dev, port->wakeup_irq);
> Why can't we use dev_pm_set_dedicated_wake_irq() here?

If we use this API then handler "handle_threaded_wake_irq" uses device 
specific pm_runtime functions to wake the device and currently this

driver don't support runtime PM callbacks. Also, we want to register 
"qcom_geni_serial_wakeup_isr" as our IRQ handler for wakeup scenario.

>
>> +                       if (unlikely(ret))
>> +                               dev_err(uport->dev, "%s:Failed to set IRQ wake:%d\n",
>> +                                               __func__, ret);
>> +               }
>> +       }
>>          uport->private_data = drv;
>>          platform_set_drvdata(pdev, port);
>>          port->handle_rx = console ? handle_rx_console : handle_rx_uart;
>> @@ -1328,7 +1362,12 @@ static int __maybe_unused qcom_geni_serial_sys_suspend(struct device *dev)
>>          struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
>>          struct uart_port *uport = &port->uport;
>>   
>> -       return uart_suspend_port(uport->private_data, uport);
>> +       uart_suspend_port(uport->private_data, uport);
>> +
>> +       if (port->wakeup_irq > 0)
>> +               enable_irq(port->wakeup_irq);
>> +
> Then this is hopefully done automatically?
>
>> +       return 0;
>>   }
>>   
>>   static int __maybe_unused qcom_geni_serial_sys_resume(struct device *dev)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

