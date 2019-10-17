Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03C25DAAE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2019 13:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405080AbfJQLJl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Oct 2019 07:09:41 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58764 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393652AbfJQLJl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Oct 2019 07:09:41 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id D7566606AC; Thu, 17 Oct 2019 11:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571310579;
        bh=gEC13Kcn+Ed3DcGDHnkWG54hZ+B0ZIdzgGKNjngBgTE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=aUDupgR4MVrPujCPwai3ojqTVR6dlR0fJy5F/35Nul+vtbWOA6LkfuOJaxos90RFn
         Wmd6vis48SdTCV9n/G1bmSu60egfgjx0PdBAbrWsU+/dwEIEL5fus66Li/rBypX89F
         ojSNMq0TPqlCQ1qY4d0OvrtifSpq6O5e/pvwXmkU=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E655060588;
        Thu, 17 Oct 2019 11:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571310579;
        bh=gEC13Kcn+Ed3DcGDHnkWG54hZ+B0ZIdzgGKNjngBgTE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=aUDupgR4MVrPujCPwai3ojqTVR6dlR0fJy5F/35Nul+vtbWOA6LkfuOJaxos90RFn
         Wmd6vis48SdTCV9n/G1bmSu60egfgjx0PdBAbrWsU+/dwEIEL5fus66Li/rBypX89F
         ojSNMq0TPqlCQ1qY4d0OvrtifSpq6O5e/pvwXmkU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E655060588
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH v3 2/2] tty: serial: qcom_geni_serial: Wakeup over UART RX
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mgautam@codeaurora.org, bjorn.andersson@linaro.org,
        swboyd@chromium.org, msavaliy@codeaurora.org
References: <1571119902-14169-1-git-send-email-akashast@codeaurora.org>
 <20191015185955.GB1139790@kroah.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <ed05d99c-6154-eff4-259b-0eef9497852a@codeaurora.org>
Date:   Thu, 17 Oct 2019 16:39:34 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191015185955.GB1139790@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/16/2019 12:29 AM, Greg KH wrote:
> On Tue, Oct 15, 2019 at 11:41:42AM +0530, Akash Asthana wrote:
>> Add system wakeup capability over UART RX line for wakeup capable UART.
>> When system is suspended, RX line act as an interrupt to wakeup system
>> for any communication requests from peer.
>>
>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
>> ---
>> Changes in V3:
>>   - Address review comments on v2 patch.
> That's horribly vague, please be specific as to what you changed.
Ok, I will take care of this in future.
>
>>   drivers/tty/serial/qcom_geni_serial.c | 44 ++++++++++++++++++++++++++++++++++-
>>   1 file changed, 43 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
>> index 12dc007..bc828e49 100644
>> --- a/drivers/tty/serial/qcom_geni_serial.c
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>> @@ -14,6 +14,7 @@
>>   #include <linux/of.h>
>>   #include <linux/of_device.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/pm_wakeirq.h>
>>   #include <linux/qcom-geni-se.h>
>>   #include <linux/serial.h>
>>   #include <linux/serial_core.h>
>> @@ -116,6 +117,7 @@ struct qcom_geni_serial_port {
>>   	bool brk;
>>   
>>   	unsigned int tx_remaining;
>> +	int wakeup_irq;
>>   };
>>   
>>   static const struct uart_ops qcom_geni_console_pops;
>> @@ -755,6 +757,15 @@ static void qcom_geni_serial_handle_tx(struct uart_port *uport, bool done,
>>   		uart_write_wakeup(uport);
>>   }
>>   
>> +static irqreturn_t qcom_geni_serial_wakeup_isr(int isr, void *dev)
>> +{
>> +	struct uart_port *uport = dev;
>> +
>> +	pm_wakeup_event(uport->dev, 2000);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>>   static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
>>   {
>>   	u32 m_irq_en;
>> @@ -1310,6 +1321,29 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>   		return ret;
>>   	}
>>   
>> +	if (!console) {
>> +		port->wakeup_irq = platform_get_irq_optional(pdev, 1);
>> +		if (port->wakeup_irq < 0) {
>> +			dev_err(&pdev->dev, "Failed to get wakeup IRQ %d\n",
>> +					port->wakeup_irq);
> Is this error message needed?
I will remove this.
>> +		} else {
>> +			irq_set_status_flags(port->wakeup_irq, IRQ_NOAUTOEN);
>> +			ret = devm_request_irq(uport->dev, port->wakeup_irq,
>> +				qcom_geni_serial_wakeup_isr,
>> +				IRQF_TRIGGER_FALLING, "uart_wakeup", uport);
>> +			if (ret) {
>> +				dev_err(uport->dev, "Failed to register wakeup IRQ ret %d\n",
>> +						ret);
> Same here.
devm_request_irq function doesn't print error for every failure paths.
>
>> +				return ret;
>> +			}
>> +
>> +			device_init_wakeup(&pdev->dev, true);
>> +			ret = dev_pm_set_wake_irq(&pdev->dev, port->wakeup_irq);
>> +			if (unlikely(ret))
> ONLY ever use likely/unlikely if you can benchmark the difference.
> Otherwise don't use it, as you will get it wrong and cpus and compliers
> know how to do this much better than we do.
Ok, I will remove it.
>> +				dev_err(uport->dev, "%s:Failed to set IRQ wake:%d\n",
>> +						__func__, ret);
> Again, is this needed?  And why the function name if it is, the other
> error messages you created didn't have that in it.
  I will remove this.
> Consistancy is key.
>
> thanks,
>
> greg k-h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

