Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F5A6DAADC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2019 13:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404082AbfJQLIa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Oct 2019 07:08:30 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58618 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393652AbfJQLIa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Oct 2019 07:08:30 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7164860850; Thu, 17 Oct 2019 11:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571310508;
        bh=GPCRlQVMxZHefy3hFpc0A0bqbH8c5xALNX9clcCr67U=;
        h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
        b=m3BKU69AP+IDb+OiEM9Jlxhgx+HnKFSDFqLuARp5zuo9qosCN51gycYxlnf4tDQk1
         sRibrSXq9L1hjDLaXmsjoKwSiB4A570yLkgB3uEgr88MRFsO4lLZ26sDfeOecQNhAl
         vxMNeLgH2KsZaiBPOqtvGxaDJtfDFqeAEnGGCuHE=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7BE3160588;
        Thu, 17 Oct 2019 11:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571310506;
        bh=GPCRlQVMxZHefy3hFpc0A0bqbH8c5xALNX9clcCr67U=;
        h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
        b=g5JUoKKEWQl0dO5PdbUIziIi1N1V5W5jjKkMmXjf1CCD2OM8Nno/1MIeX8xKwmw/d
         gNhyeeg0unBjAalJR0whb9E8sBRYenNtcCTaidzNyosVX2qRvm/mps+WDNLeK2ACvJ
         BSfvjCAnyIFV+lxz4UcVTlhJUDa3xkQD/y0p1g+E=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7BE3160588
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
Subject: Re: [PATCH v3 1/2] tty: serial: qcom_geni_serial: IRQ cleanup
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mgautam@codeaurora.org, bjorn.andersson@linaro.org,
        swboyd@chromium.org, msavaliy@codeaurora.org
References: <1571119863-14105-1-git-send-email-akashast@codeaurora.org>
 <20191015185806.GA1139790@kroah.com>
Message-ID: <1210428a-d02e-0408-f46e-a22cd99d7984@codeaurora.org>
Date:   Thu, 17 Oct 2019 16:38:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191015185806.GA1139790@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/16/2019 12:28 AM, Greg KH wrote:
> On Tue, Oct 15, 2019 at 11:41:03AM +0530, Akash Asthana wrote:
>> Move ISR registration from startup to probe function to avoid registering
>> it everytime when the port open is called for driver.
>>
>> Signed-off-by: Akash Asthana<akashast@codeaurora.org>
>> ---
>> Changes in v3:
>>   - Address review comments on v2 patch.
>>   - Using devm_kasprintf instead of scnprintf API.
>>
>>   drivers/tty/serial/qcom_geni_serial.c | 30 +++++++++++++++++++-----------
>>   1 file changed, 19 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
>> index 14c6306..12dc007 100644
>> --- a/drivers/tty/serial/qcom_geni_serial.c
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/console.h>
>>   #include <linux/io.h>
>>   #include <linux/iopoll.h>
>> +#include <linux/irq.h>
>>   #include <linux/module.h>
>>   #include <linux/of.h>
>>   #include <linux/of_device.h>
>> @@ -101,7 +102,7 @@
>>   struct qcom_geni_serial_port {
>>   	struct uart_port uport;
>>   	struct geni_se se;
>> -	char name[20];
>> +	const char *name;
>>   	u32 tx_fifo_depth;
>>   	u32 tx_fifo_width;
>>   	u32 rx_fifo_depth;
>> @@ -830,7 +831,7 @@ static void qcom_geni_serial_shutdown(struct uart_port *uport)
>>   	if (uart_console(uport))
>>   		console_stop(uport->cons);
>>   
>> -	free_irq(uport->irq, uport);
>> +	disable_irq(uport->irq);
>>   	spin_lock_irqsave(&uport->lock, flags);
>>   	qcom_geni_serial_stop_tx(uport);
>>   	qcom_geni_serial_stop_rx(uport);
>> @@ -890,21 +891,14 @@ static int qcom_geni_serial_startup(struct uart_port *uport)
>>   	int ret;
>>   	struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
>>   
>> -	scnprintf(port->name, sizeof(port->name),
>> -		  "qcom_serial_%s%d",
>> -		(uart_console(uport) ? "console" : "uart"), uport->line);
>> -
>>   	if (!port->setup) {
>>   		ret = qcom_geni_serial_port_setup(uport);
>>   		if (ret)
>>   			return ret;
>>   	}
>> +	enable_irq(uport->irq);
>>   
>> -	ret = request_irq(uport->irq, qcom_geni_serial_isr, IRQF_TRIGGER_HIGH,
>> -							port->name, uport);
>> -	if (ret)
>> -		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
>> -	return ret;
>> +	return 0;
>>   }
>>   
>>   static unsigned long get_clk_cfg(unsigned long clk_freq)
>> @@ -1297,11 +1291,25 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>   	port->rx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
>>   	port->tx_fifo_width = DEF_FIFO_WIDTH_BITS;
>>   
>> +	port->name = devm_kasprintf(uport->dev, GFP_KERNEL,
>> +			"qcom_geni_serial_%s%d",
>> +			uart_console(uport) ? "console" : "uart", uport->line);
>> +	if (!port->name)
>> +		return ERR_PTR(-ENOMEM);
> Why are you returning a pointer when the return type of this function is
> int?  Did the compiler not complain?  Shouldn't this just be -ENOMEM?
Sorry about it! I will take care of this in future. I missed it due to 
compiler setting, every warning was not treated as error.
>> +
>>   	irq = platform_get_irq(pdev, 0);
>>   	if (irq < 0)
>>   		return irq;
>>   	uport->irq = irq;
>>   
>> +	irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
>> +	ret = devm_request_irq(uport->dev, uport->irq, qcom_geni_serial_isr,
>> +			IRQF_TRIGGER_HIGH, port->name, uport);
>> +	if (ret) {
>> +		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
> Why print this out?  Doesn't the function print an error if it fails?
The function doesn't print error for every failure paths.
>> +		return ret;
> See, an int return value :)
>
> thanks,
>
> greg k-h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

