Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 049EE1A6765
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 15:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730188AbgDMN6v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 09:58:51 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:48381 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729430AbgDMN6u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 09:58:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586786328; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Y/gdVVe6BVm6JgYV9eCeY9S+PgE2k5W+l+hDimM0Yso=; b=GYder3mcikefBVmagln+TyPRzgqLmSsfHM2gLXqWHg7l/prUvgf2lJHnJ1apHwqqX1u2knFZ
 7khhLCXACfS36n1kwlbbfkm/YGPvzFkTXY4UXN18e0HL6kOMnpnid+9KKQr6PCTxGqjDVl/D
 XgHjGnC2FDaT32oHQ/FPxU728Ys=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e947017.7f6220e1cd18-smtp-out-n01;
 Mon, 13 Apr 2020 13:58:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BB972C433F2; Mon, 13 Apr 2020 13:58:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.111.193.245] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EF2DFC433CB;
        Mon, 13 Apr 2020 13:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EF2DFC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 02/21] tty: serial: qcom_geni_serial: Use OPP API to set
 clk/perf state
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akash Asthana <akashast@codeaurora.org>,
        linux-serial@vger.kernel.org
References: <1586353607-32222-1-git-send-email-rnayak@codeaurora.org>
 <1586353607-32222-3-git-send-email-rnayak@codeaurora.org>
 <20200409174511.GS199755@google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <e3aa9e6f-14f5-de51-7087-094b5089d16b@codeaurora.org>
Date:   Mon, 13 Apr 2020 19:28:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200409174511.GS199755@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias,

On 4/9/2020 11:15 PM, Matthias Kaehlcke wrote:
> Hi Rajendra,
> 
> On Wed, Apr 08, 2020 at 07:16:28PM +0530, Rajendra Nayak wrote:
>> geni serial needs to express a perforamnce state requirement on CX
>> depending on the frequency of the clock rates. Use OPP table from
>> DT to register with OPP framework and use dev_pm_opp_set_rate() to
>> set the clk/perf state.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> Cc: Akash Asthana <akashast@codeaurora.org>
>> Cc: linux-serial@vger.kernel.org
>> ---
>>   drivers/tty/serial/qcom_geni_serial.c | 20 +++++++++++++++-----
>>   include/linux/qcom-geni-se.h          |  2 ++
>>   2 files changed, 17 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
>> index 6119090..754eaf6 100644
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
>> @@ -961,7 +962,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>>   		goto out_restart_rx;
>>   
>>   	uport->uartclk = clk_rate;
>> -	clk_set_rate(port->se.clk, clk_rate);
>> +	dev_pm_opp_set_rate(uport->dev, clk_rate);
>>   	ser_clk_cfg = SER_CLK_EN;
>>   	ser_clk_cfg |= clk_div << CLK_DIV_SHFT;
>>   
>> @@ -1198,8 +1199,10 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
>>   	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
>>   		geni_se_resources_on(&port->se);
>>   	else if (new_state == UART_PM_STATE_OFF &&
>> -			old_state == UART_PM_STATE_ON)
>> +			old_state == UART_PM_STATE_ON) {
>> +		dev_pm_opp_set_rate(uport->dev, 0);
>>   		geni_se_resources_off(&port->se);
>> +	}
>>   }
>>   
>>   static const struct uart_ops qcom_geni_console_pops = {
>> @@ -1318,13 +1321,16 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>   	if (of_property_read_bool(pdev->dev.of_node, "cts-rts-swap"))
>>   		port->cts_rts_swap = true;
>>   
>> +	port->se.opp = dev_pm_opp_set_clkname(&pdev->dev, "se");
> 
> dev_pm_opp_set_clkname() can fail for multiple reasons, it seems an error
> check would be warranted.

right, looks like I should put some error check there

> Is it actually necessary to save the OPP table in 'struct geni_se'? Both
> the serial and the SPI driver save the table, but don't use it later (nor
> does the SE driver).

I think I did that initially because I wanted to use that to call into
dev_pm_opp_put_clkname during cleanup. That however never worked since
the way the clk_put is done in dev_pm_opp_put_clkname() and _opp_table_kref_release()
seems buggy. I kind of forgot about fixing it up, I will figure our whats the right
way to do it, and either not call dev_pm_opp_put_clkname() or not store the
opp table returned by it.

thanks for taking time to review.

- Rajendra
  

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
