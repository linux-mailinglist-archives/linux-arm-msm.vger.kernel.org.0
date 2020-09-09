Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4382630CF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Sep 2020 17:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730361AbgIIPoa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Sep 2020 11:44:30 -0400
Received: from a27-10.smtp-out.us-west-2.amazonses.com ([54.240.27.10]:47568
        "EHLO a27-10.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730368AbgIIPnp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Sep 2020 11:43:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599661265;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=Nr4GXrAKQEOvxB4xB00+a/NEFECU2vP5J134KY5qblo=;
        b=VZkkPOGHAsSfhD1kEepDMgyMTwzELcSNxX6dLiuhXRZnaJZy1X/lU2NwmHN4tvlb
        Xj3JIQHFSLHUZfXmrh7MwoHI7c4N0fFHyczP2Jgi4coUFQZq1e/PapNykDkOPyn7uHd
        OwZzwE0gokI8rn/B2P6WPWz7pn5Kos/jnRywJSPY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599661265;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=Nr4GXrAKQEOvxB4xB00+a/NEFECU2vP5J134KY5qblo=;
        b=jLQhpCQvCA7iTWSJZZ2VoAQNIVhMbgNMcBZbiL71m4vAqscFYVnPGSMoah9OTZ1A
        rCA/2FVdVPKERcElC+qlx7VzG/4dhJ/4cOyvgiBxL82bbgmAsJ8WTvSDYAYXs52CwVU
        DbRErXgtsLptA0snYPSLmm2ooWI+VX7M4DZNMxtc=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 9 Sep 2020 14:21:04 +0000
From:   skakit@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        gregkh@linuxfoundation.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V4 4/4] tty: serial: qcom_geni_serial: Fix the UART wakeup
 issue
In-Reply-To: <20200903165058.GK3419728@google.com>
References: <1599145498-20707-1-git-send-email-skakit@codeaurora.org>
 <1599145498-20707-5-git-send-email-skakit@codeaurora.org>
 <20200903165058.GK3419728@google.com>
Message-ID: <01010174733dcefc-01bf923c-1fdd-4d80-b7a8-d360c2f6cbf5-000000@us-west-2.amazonses.com>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.09-54.240.27.10
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-03 22:20, Matthias Kaehlcke wrote:
> On Thu, Sep 03, 2020 at 08:34:58PM +0530, satya priya wrote:
>> As a part of system suspend uart_port_suspend is called from the
>> Serial driver, which calls set_mctrl passing mctrl as NULL. This
> 
> nit: s/NULL/0/
> 

Okay, will correct it.

>> makes RFR high(NOT_READY) during suspend.
>> 
>> Due to this BT SoC is not able to send wakeup bytes to UART during
>> suspend. Include if check for non-suspend case to keep RFR low
>> during suspend.
> 
> Is this patch actually needed?
> 
> With the other patches in this series the UART doesn't control RFR
> on IDP, and I suppose corresponding pinconf changes should also be
> done on other devices that want to support wakeup. Effectively,
> I see Bluetooth wakeup working without this patch on a sc7180
> device.
> 

I am also seeing the same observation now on the tip (checked on IDP), 
but previously if this patch is not present the RFR line would go high 
during suspend (even though GPIO mode is configured in sleep state), not 
sure how it is being low now. Theoretically, this fix is good to have, 
because in suspend UART_MANUAL_RFR is getting set to not ready state and 
if QUP gets power to drive this line, it may go high and wakeup from BT 
will fail.

>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Reviewed-by: Akash Asthana <akashast@codeaurora.org>
>> ---
>> Changes in V2:
>>  - This patch fixes the UART flow control issue during suspend.
>>    Newly added in V2.
>> 
>> Changes in V3:
>>  - As per Matthias's comment removed the extra parentheses.
>> 
>> Changes in V4:
>>  - No change.
>> 
>>  drivers/tty/serial/qcom_geni_serial.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c 
>> b/drivers/tty/serial/qcom_geni_serial.c
>> index 07b7b6b..2aad9d7 100644
>> --- a/drivers/tty/serial/qcom_geni_serial.c
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>> @@ -242,7 +242,7 @@ static void qcom_geni_serial_set_mctrl(struct 
>> uart_port *uport,
>>  	if (mctrl & TIOCM_LOOP)
>>  		port->loopback = RX_TX_CTS_RTS_SORTED;
>> 
>> -	if (!(mctrl & TIOCM_RTS))
>> +	if (!(mctrl & TIOCM_RTS) && !uport->suspended)
>>  		uart_manual_rfr = UART_MANUAL_RFR_EN | UART_RFR_NOT_READY;
>>  	writel(uart_manual_rfr, uport->membase + SE_UART_MANUAL_RFR);
>>  }
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>> member
>> of Code Aurora Forum, hosted by The Linux Foundation
>> 
