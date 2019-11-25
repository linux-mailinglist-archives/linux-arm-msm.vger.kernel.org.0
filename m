Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87348108D8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2019 13:06:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbfKYMGl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Nov 2019 07:06:41 -0500
Received: from a27-185.smtp-out.us-west-2.amazonses.com ([54.240.27.185]:53352
        "EHLO a27-185.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725828AbfKYMGl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Nov 2019 07:06:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574683600;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=595DCUC5jASodhND6Dyz3nJi/9LCgTIT7WhDvVYaUmE=;
        b=NCOCTfUwG4lNn9ldI273AZQY7wv+PGXUhIy+OXwPGuQgAHU2gqSB6AYzNbQcvrsx
        OAJVmkYZSYMot2pgS5TfRLs1ZfqXI7WakuNHeA0+z+J4Lry98+3W/zoleLfhkFua9km
        auqLBAjTDUC8gJcBibQTEcb/ad0ci72/8K3/B43g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574683600;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=595DCUC5jASodhND6Dyz3nJi/9LCgTIT7WhDvVYaUmE=;
        b=UyrRb5BCkWwPcmNsiT64qNWuTLRdK0TdK3DfYjYTRob7m3V1FvsHxX2wRWs/DdST
        hbIKnNEuN1/AIIRMlQCACDM2aq0PKSQlS1ti4GYc6f6sSPLlnLhFNkdgewv1vwj4YWd
        OfaEe4upPFmF6dYeZXSUYct0cUGySdDFRSQ0TT5E=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E0756C447A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH v6 4/5] tty: serial: qcom_geni_serial: Wakeup over UART RX
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     gregkh@linuxfoundation.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <1574432266-20732-1-git-send-email-akashast@codeaurora.org>
 <0101016e937a5b83-1c5c4e0e-ae63-447a-8724-52477b11dff4-000000@us-west-2.amazonses.com>
 <20191122191147.GO27773@google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <0101016ea274e5c0-c415ca3d-9707-481d-873a-6f23a13642e8-000000@us-west-2.amazonses.com>
Date:   Mon, 25 Nov 2019 12:06:40 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191122191147.GO27773@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-SES-Outgoing: 2019.11.25-54.240.27.185
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/23/2019 12:41 AM, Matthias Kaehlcke wrote:
> On Fri, Nov 22, 2019 at 02:18:19PM +0000, Akash Asthana wrote:
>> Add system wakeup capability over UART RX line for wakeup capable UART.
>> When system is suspended, RX line act as an interrupt to wakeup system
>> for any communication requests from peer.
>>
>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
>> ---
>> Changes in V6:
>>   - Rebased on top of tty-next branch.
>>   - As per stephen's comment mark devices runtime status as active
>>     irrespective of wakeup feature.
>>
>> Changes in V5:
>>   - No change.
>>
>> Changes in V4:
>>   - As per Greg's comment, removed extra dev_err logging.
>>   - As per Stephen's comment, using common code that manage wakeirq irqs for
>>     devices. Using dev_pm_set_dedicated_wake_irq API that will take care of
>>     requesting and attaching wakeup irqs for devices. Also, it sets wakeirq
>>     status to WAKE_IRQ_DEDICATED_ALLOCATED as a result enabling/disabling of
>>     wake irq will be managed by suspend/resume framework so, removed the code
>>     for enabling and disabling of wake irq from the driver.
>>
>> Changes in V3:
>>   - As per Stephen's comment, using platform_get_irq_optional API to get wakeup
>>     IRQ for device.
>>
>> Changes in V2:
>>   - As per Stephen's comment, splitted V1 patch into 2 seperate patch.
>>     a) Clean up of core IRQ registration b) Add wakeup feature.
>>
>>   drivers/tty/serial/qcom_geni_serial.c | 28 ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
>> index 634054a..b952509 100644
>> --- a/drivers/tty/serial/qcom_geni_serial.c
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>> @@ -14,6 +14,8 @@
>>   #include <linux/of.h>
>>   #include <linux/of_device.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/pm_wakeirq.h>
>>   #include <linux/qcom-geni-se.h>
>>   #include <linux/serial.h>
>>   #include <linux/serial_core.h>
>> @@ -116,6 +118,7 @@ struct qcom_geni_serial_port {
>>   	bool brk;
>>   
>>   	unsigned int tx_remaining;
>> +	int wakeup_irq;
>>   };
>>   
>>   static const struct uart_ops qcom_geni_console_pops;
>> @@ -1302,6 +1305,9 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>   		return irq;
>>   	uport->irq = irq;
>>   
>> +	if (!console)
>> +		port->wakeup_irq = platform_get_irq_optional(pdev, 1);
>> +
>>   	uport->private_data = drv;
>>   	platform_set_drvdata(pdev, port);
>>   	port->handle_rx = console ? handle_rx_console : handle_rx_uart;
>> @@ -1321,6 +1327,24 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>   		return ret;
>>   	}
>>   
>> +	/*
>> +	 * Set pm_runtime status as ACTIVE so that wakeup_irq gets
>> +	 * enabled/disabled from dev_pm_arm_wake_irq  during  system
> nit: remove one of the two blanks before/after 'during'.
ok
>
>> +	 * suspend/resume respectively.
>> +	 */
>> +	pm_runtime_set_active(&pdev->dev);
>> +
>> +	if (port->wakeup_irq > 0) {
>> +		device_init_wakeup(&pdev->dev, true);
>> +		ret = dev_pm_set_dedicated_wake_irq(&pdev->dev,
>> +						port->wakeup_irq);
>> +		if (ret) {
>> +			device_init_wakeup(&pdev->dev, false);
>> +			uart_remove_one_port(drv, uport);
>> +			return ret;
>> +		}
>> +	}
>> +
>>   	return ret;
>>   }
>>   
>> @@ -1330,6 +1354,10 @@ static int qcom_geni_serial_remove(struct platform_device *pdev)
>>   	struct uart_driver *drv = port->uport.private_data;
>>   
>>   	uart_remove_one_port(drv, &port->uport);
>> +
>> +	device_init_wakeup(&pdev->dev, false);
>> +	dev_pm_clear_wake_irq(&pdev->dev);
>> +
>>   	return 0;
>>   }
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

