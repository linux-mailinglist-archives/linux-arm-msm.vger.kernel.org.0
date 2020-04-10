Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDF741A4684
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2020 14:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbgDJMwf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Apr 2020 08:52:35 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:39684 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726092AbgDJMwf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Apr 2020 08:52:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586523155; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To: From:
 Subject: Sender; bh=M6+dhOPemioJOqKTwLQya2KFKVQnF9Zhjj6/C0JA9QQ=; b=fQa1u4A48YLWumvFg2jf8XAKAN+vT1ovvXOoC+lxFCE/3jpRShhjREw80o1i7q9pg2bTFaPf
 Y+xuNovf6diCIR/n3dF9Y1ZkIaTO+P2PGcKhn/FlEb5Q2o/cuzxj7ANOhNefCwZDSuSSNqgA
 LakD7buTZUeeutZOhD8NasAod6U=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e906c0d.7fb1fd3b24c8-smtp-out-n05;
 Fri, 10 Apr 2020 12:52:29 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F2E9DC433BA; Fri, 10 Apr 2020 12:52:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.10] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E6E2EC433F2;
        Fri, 10 Apr 2020 12:52:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E6E2EC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH 02/21] tty: serial: qcom_geni_serial: Use OPP API to set
 clk/perf state
From:   Akash Asthana <akashast@codeaurora.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, viresh.kumar@linaro.org,
        sboyd@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
References: <1586353607-32222-1-git-send-email-rnayak@codeaurora.org>
 <1586353607-32222-3-git-send-email-rnayak@codeaurora.org>
 <5eb6c05e-893a-ef8a-c53e-a775b2f837d1@codeaurora.org>
Message-ID: <575b7c8f-6b77-3da2-824e-3f128efeb466@codeaurora.org>
Date:   Fri, 10 Apr 2020 18:22:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <5eb6c05e-893a-ef8a-c53e-a775b2f837d1@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rajendra,

On 4/10/2020 12:26 PM, Akash Asthana wrote:
> Hi Rajendra,
>
> On 4/8/2020 7:16 PM, Rajendra Nayak wrote:
>> geni serial needs to express a perforamnce state requirement on CX
> *performance
>> depending on the frequency of the clock rates. Use OPP table from
>> DT to register with OPP framework and use dev_pm_opp_set_rate() to
>> set the clk/perf state.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> Cc: Akash Asthana <akashast@codeaurora.org>
>> Cc: linux-serial@vger.kernel.org
>> ---
>>   drivers/tty/serial/qcom_geni_serial.c | 20 +++++++++++++++-----
>>   include/linux/qcom-geni-se.h          |  2 ++
>>   2 files changed, 17 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c 
>> b/drivers/tty/serial/qcom_geni_serial.c
>> index 6119090..754eaf6 100644
>> --- a/drivers/tty/serial/qcom_geni_serial.c
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/module.h>
>>   #include <linux/of.h>
>>   #include <linux/of_device.h>
>> +#include <linux/pm_opp.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/pm_wakeirq.h>
>> @@ -961,7 +962,7 @@ static void qcom_geni_serial_set_termios(struct 
>> uart_port *uport,
>>           goto out_restart_rx;
>>         uport->uartclk = clk_rate;
>> -    clk_set_rate(port->se.clk, clk_rate);
>> +    dev_pm_opp_set_rate(uport->dev, clk_rate);
>
> Is this change not intended for backward compatibility? If I don't 
> pick DT change for Geni drivers,  dev_pm_opp_set_rate is failing and 
> causing functionality issues.

oops Sorry, 1st patch is intended for backward compatibility. Which I 
missed earlier.

Regards,

Akash

>
>>       ser_clk_cfg = SER_CLK_EN;
>>       ser_clk_cfg |= clk_div << CLK_DIV_SHFT;
>>   @@ -1198,8 +1199,10 @@ static void qcom_geni_serial_pm(struct 
>> uart_port *uport,
>>       if (new_state == UART_PM_STATE_ON && old_state == 
>> UART_PM_STATE_OFF)
>>           geni_se_resources_on(&port->se);
>>       else if (new_state == UART_PM_STATE_OFF &&
>> -            old_state == UART_PM_STATE_ON)
>> +            old_state == UART_PM_STATE_ON) {
>> +        dev_pm_opp_set_rate(uport->dev, 0);
>>           geni_se_resources_off(&port->se);
>> +    }
>>   }
>>     static const struct uart_ops qcom_geni_console_pops = {
>> @@ -1318,13 +1321,16 @@ static int qcom_geni_serial_probe(struct 
>> platform_device *pdev)
>>       if (of_property_read_bool(pdev->dev.of_node, "cts-rts-swap"))
>>           port->cts_rts_swap = true;
>>   +    port->se.opp = dev_pm_opp_set_clkname(&pdev->dev, "se");
>> +    dev_pm_opp_of_add_table(&pdev->dev);
>> +
>>       uport->private_data = drv;
>>       platform_set_drvdata(pdev, port);
>>       port->handle_rx = console ? handle_rx_console : handle_rx_uart;
>>         ret = uart_add_one_port(drv, uport);
>>       if (ret)
>> -        return ret;
>> +        goto err;
>>         irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
>>       ret = devm_request_irq(uport->dev, uport->irq, 
>> qcom_geni_serial_isr,
>> @@ -1332,7 +1338,7 @@ static int qcom_geni_serial_probe(struct 
>> platform_device *pdev)
>>       if (ret) {
>>           dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
>>           uart_remove_one_port(drv, uport);
>> -        return ret;
>> +        goto err;
>>       }
>>         /*
>> @@ -1349,11 +1355,14 @@ static int qcom_geni_serial_probe(struct 
>> platform_device *pdev)
>>           if (ret) {
>>               device_init_wakeup(&pdev->dev, false);
>>               uart_remove_one_port(drv, uport);
>> -            return ret;
>> +            goto err;
>>           }
>>       }
>>         return 0;
>> +err:
>> +    dev_pm_opp_of_remove_table(&pdev->dev);
> do we need to call "dev_pm_opp_put_clkname" here and in remove to 
> release clk resource grabbed by
>
> dev_pm_opp_set_clkname(&pdev->dev, "se");?
>
> Regards,
> Akash
>
>> +    return ret;
>>   }
>>     static int qcom_geni_serial_remove(struct platform_device *pdev)
>> @@ -1361,6 +1370,7 @@ static int qcom_geni_serial_remove(struct 
>> platform_device *pdev)
>>       struct qcom_geni_serial_port *port = platform_get_drvdata(pdev);
>>       struct uart_driver *drv = port->uport.private_data;
>>   +    dev_pm_opp_of_remove_table(&pdev->dev);
>>       dev_pm_clear_wake_irq(&pdev->dev);
>>       device_init_wakeup(&pdev->dev, false);
>>       uart_remove_one_port(drv, &port->uport);
>> diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
>> index dd46494..737e713 100644
>> --- a/include/linux/qcom-geni-se.h
>> +++ b/include/linux/qcom-geni-se.h
>> @@ -24,6 +24,7 @@ enum geni_se_protocol_type {
>>     struct geni_wrapper;
>>   struct clk;
>> +struct opp_table;
>>     /**
>>    * struct geni_se - GENI Serial Engine
>> @@ -39,6 +40,7 @@ struct geni_se {
>>       struct device *dev;
>>       struct geni_wrapper *wrapper;
>>       struct clk *clk;
>> +    struct opp_table *opp;
>>       unsigned int num_clk_levels;
>>       unsigned long *clk_perf_tbl;
>>   };
>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
