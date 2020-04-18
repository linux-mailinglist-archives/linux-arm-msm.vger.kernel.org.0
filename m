Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F401A1AEAAB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2020 10:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgDRIGK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Apr 2020 04:06:10 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:10879 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725949AbgDRIGG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Apr 2020 04:06:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587197165; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Ai272o6qy5R6nMdbdlalbR48K7Knpt+f0IeAypOdip0=; b=poiD+xo7iTbEET6KyZPdloSY40ARvPFKjZW2++pLf34j7btzNK9GhJkvNrECjqgTAzLxk2lh
 KDEU0Mh8dFFFKZhNKk2OPqQt6jPjrQAew+522mDTuXuwn5VP34u85oUophsxQuTM44S2ZMLw
 qYrBjHCABFq8SNngUNKOCIuw+/I=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9ab4ec.7f887d6d4490-smtp-out-n01;
 Sat, 18 Apr 2020 08:06:04 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 40007C432C2; Sat, 18 Apr 2020 08:06:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.131.205.89] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BA99CC433F2;
        Sat, 18 Apr 2020 08:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BA99CC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v2 01/17] tty: serial: qcom_geni_serial: Use OPP API to
 set clk/perf state
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Akash Asthana <akashast@codeaurora.org>,
        linux-serial@vger.kernel.org
References: <1587132279-27659-1-git-send-email-rnayak@codeaurora.org>
 <1587132279-27659-2-git-send-email-rnayak@codeaurora.org>
 <20200417180041.GD199755@google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <c7f6922a-47c2-9703-c8fa-92fdbe1f69ec@codeaurora.org>
Date:   Sat, 18 Apr 2020 13:35:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200417180041.GD199755@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 4/17/2020 11:30 PM, Matthias Kaehlcke wrote:
> Hi Rajendra,

Hey Matthias,

> 
> On Fri, Apr 17, 2020 at 07:34:23PM +0530, Rajendra Nayak wrote:
>> geni serial needs to express a perforamnce state requirement on CX
>> powerdomain depending on the frequency of the clock rates.
>> Use OPP table from DT to register with OPP framework and use
>> dev_pm_opp_set_rate() to set the clk/perf state.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Akash Asthana <akashast@codeaurora.org>
>> Cc: linux-serial@vger.kernel.org
>> ---
>>   drivers/tty/serial/qcom_geni_serial.c | 30 +++++++++++++++++++++++++-----
>>   include/linux/qcom-geni-se.h          |  2 ++
>>   2 files changed, 27 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
>> index 6119090..151012c 100644
>> --- a/drivers/tty/serial/qcom_geni_serial.c
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/module.h>
>>   #include <linux/of.h>
>>   #include <linux/of_device.h>
>> +#include <linux/pm_opp.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/pm_wakeirq.h>
>> @@ -128,6 +129,7 @@ struct qcom_geni_serial_port {
>>   	int wakeup_irq;
>>   	bool rx_tx_swap;
>>   	bool cts_rts_swap;
>> +	bool opp_table;
> 
> The name of the variable suggests that it holds a OPP table, something
> like 'has_opp_table' would be clearer.

I agree with your suggestions, I will update the variable names when I respin.

> 
>>   };
>>   
>>   static const struct uart_ops qcom_geni_console_pops;
>> @@ -961,7 +963,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>>   		goto out_restart_rx;
>>   
>>   	uport->uartclk = clk_rate;
>> -	clk_set_rate(port->se.clk, clk_rate);
>> +	dev_pm_opp_set_rate(uport->dev, clk_rate);
>>   	ser_clk_cfg = SER_CLK_EN;
>>   	ser_clk_cfg |= clk_div << CLK_DIV_SHFT;
>>   
>> @@ -1198,8 +1200,11 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
>>   	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
>>   		geni_se_resources_on(&port->se);
>>   	else if (new_state == UART_PM_STATE_OFF &&
>> -			old_state == UART_PM_STATE_ON)
>> +			old_state == UART_PM_STATE_ON) {
>> +		/* Drop the performance state vote */
>> +		dev_pm_opp_set_rate(uport->dev, 0);
>>   		geni_se_resources_off(&port->se);
>> +	}
>>   }
>>   
>>   static const struct uart_ops qcom_geni_console_pops = {
>> @@ -1318,13 +1323,20 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>   	if (of_property_read_bool(pdev->dev.of_node, "cts-rts-swap"))
>>   		port->cts_rts_swap = true;
>>   
>> +	port->se.opp = dev_pm_opp_set_clkname(&pdev->dev, "se");
>> +	if (IS_ERR(port->se.opp))
>> +		return PTR_ERR(port->se.opp);
>> +	/* OPP table is optional */
>> +	if (!dev_pm_opp_of_add_table(&pdev->dev))
> 
> Even if the OPP table is optional you probably want to fail if the error
> is anything other than -ENODEV ("'operating-points' property is not found
> or is invalid data in device node.").

sounds valid. I will fix it up and respin. Will just wait a few days to see if
I get any more reviews and feedback.

> 
>> diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
>> index dd46494..737e713 100644
>> --- a/include/linux/qcom-geni-se.h
>> +++ b/include/linux/qcom-geni-se.h
>> @@ -24,6 +24,7 @@ enum geni_se_protocol_type {
>>   
>>   struct geni_wrapper;
>>   struct clk;
>> +struct opp_table;
>>   
>>   /**
>>    * struct geni_se - GENI Serial Engine
>> @@ -39,6 +40,7 @@ struct geni_se {
>>   	struct device *dev;
>>   	struct geni_wrapper *wrapper;
>>   	struct clk *clk;
>> +	struct opp_table *opp;
> 
> This name suggests that the variable holds a single OPP ('struct
> dev_pm_opp'). Most other code uses the name 'opp_table', which
> also seems a good candidate here.

Agree, thanks again for taking time to review.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
