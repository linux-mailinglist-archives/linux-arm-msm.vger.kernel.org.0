Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F834108D8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2019 13:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727275AbfKYMEa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Nov 2019 07:04:30 -0500
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55]:53418
        "EHLO a27-55.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727230AbfKYMEa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Nov 2019 07:04:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574683469;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=R8D+EynuUB0QZabQ5CqG3oAe0nN55ChxBF0X/GWjDBs=;
        b=ouJfu5ROgo3LeCSvcoX6GBzyJMll+4FkGTIUjb4A2lcfw1Y5PBVD0JFAl/vCnZ7i
        HKaiQ7ETWpWY1we7AD3j4gCX7Q6xb1bpyKY/UxVcleL74ggQy0P3D1l6kZ0OMXBywTF
        gq3ur9nmVj3JfaJ51S8E4FUHU5SdV5y4bvd3c2kk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574683469;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=R8D+EynuUB0QZabQ5CqG3oAe0nN55ChxBF0X/GWjDBs=;
        b=BqYvJA2vFMfjy+5nWCo0WGLgH8PXL8paEjGV2C/pjjjTpk/Txsjrl09D77htQ9YF
        bDZxIQDHRWSa4g9otVAed3+r1YdhNEwcn2gWNaXS1zxMgdTwgPMpY79AClplCHr5h2J
        9VgcXlKMWO8dixUc7SRWWyJJKxPDSaZcWif7FoyE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B4778C433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH v6 3/5] tty: serial: qcom_geni_serial: IRQ cleanup
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     gregkh@linuxfoundation.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <1574432266-20732-1-git-send-email-akashast@codeaurora.org>
 <0101016e937a3e05-f74c5c73-a964-45f2-ae71-6daed292e8ee-000000@us-west-2.amazonses.com>
 <20191122184618.GN27773@google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <0101016ea272e602-867139da-a6df-429e-87d0-2e697c35b139-000000@us-west-2.amazonses.com>
Date:   Mon, 25 Nov 2019 12:04:29 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191122184618.GN27773@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-SES-Outgoing: 2019.11.25-54.240.27.55
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/23/2019 12:16 AM, Matthias Kaehlcke wrote:
> On Fri, Nov 22, 2019 at 02:18:12PM +0000, Akash Asthana wrote:
>> Move ISR registration from startup to probe function to avoid registering
>> it everytime when the port open is called for driver.
>>
>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
>> ---
>> Changes in v6:
>>   - Rebased on tty-next branch
>>
>> Changes in v5:
>>   - No change.
>>
>> Changes in v4:
>>   - As per Stephen's comment, move ISR registration(later in probe) after
>>     registering uart port with serial core.
>>   - As per Greg's comment, corrected returning of PTR value from integer type
>>     function(probe).
>>
>> Changes in v3:
>>   - As per Stephen's comment, using devm_kasprintf instead of scnprintf API.
>>
>>   drivers/tty/serial/qcom_geni_serial.c | 38 ++++++++++++++++++++++++-----------
>>   1 file changed, 26 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
>> index 14c6306..634054a 100644
>> --- a/drivers/tty/serial/qcom_geni_serial.c
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>>
>> ...
>>
>> @@ -1307,7 +1307,21 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>   	port->handle_rx = console ? handle_rx_console : handle_rx_uart;
>>   	if (!console)
>>   		device_create_file(uport->dev, &dev_attr_loopback);
>> -	return uart_add_one_port(drv, uport);
>> +
>> +	ret = uart_add_one_port(drv, uport);
>> +	if (ret)
>> +		return ret;
>> +
>> +	irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
>> +	ret = devm_request_irq(uport->dev, uport->irq, qcom_geni_serial_isr,
>> +			IRQF_TRIGGER_HIGH, port->name, uport);
>> +	if (ret) {
>> +		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
>> +		uart_remove_one_port(drv, uport);
>> +		return ret;
> nit: could fall through
>
>> +	}
>> +
>> +	return ret;
> nit: if not falling through above this could/should be 0.
ok, will change it to return 0;
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

