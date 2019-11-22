Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D945510669E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2019 07:47:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbfKVGrU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Nov 2019 01:47:20 -0500
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55]:52716
        "EHLO a27-55.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726018AbfKVGrU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Nov 2019 01:47:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574405239;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=WWYwfs3cuiJBDVcZ2jgcRhOr1Q+oZNIB1qvMOKenDY0=;
        b=dFREYHKrJDo8qblmxdDzFldvLbwIvj4t6NhJ5Atre7BmQ9ASulAdtb3xWTvFHWKH
        RKydwkcmwr/s0Ix6tVEs9dGrnDCDMv+QRmAL0FQrnicTeeLaqlJzN87haR//OlI5aty
        Olv+uDqnjtHGw4o6F9QeP7wNebgEl2N69UYttgqc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574405239;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=WWYwfs3cuiJBDVcZ2jgcRhOr1Q+oZNIB1qvMOKenDY0=;
        b=K5/a6t5ys2DxJHK6bdNoR9GwWZRPqMBgsP60wY1wGGgf4v0kOPnkz0a6KCcq0eb4
        BkX8gmTLdg8w8oSJUqQG0cZSvHxeOk9IUrQaD1xia1xABI74stVYGkZivK0HRn5FaHm
        9g+cJ+BM9PLz4YlFilVzlYBOCRlCzRQSSWuC5qq4=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A8641C93001
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH v5 3/3] tty: serial: qcom_geni_serial: Remove sysfs file
To:     Stephen Boyd <swboyd@chromium.org>, gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mgautam@codeaurora.org, msavaliy@codeaurora.org
References: <1573642161-14189-1-git-send-email-akashast@codeaurora.org>
 <5dcd90a4.1c69fb81.757a7.37e8@mx.google.com>
 <04363987-0d4e-645f-87d0-79888913b8c3@codeaurora.org>
 <5dcf0055.1c69fb81.258d1.5380@mx.google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <0101016e91dd7270-2d8fa1f1-48b8-4583-a30c-343ea1c5cdea-000000@us-west-2.amazonses.com>
Date:   Fri, 22 Nov 2019 06:47:19 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <5dcf0055.1c69fb81.258d1.5380@mx.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-SES-Outgoing: 2019.11.22-54.240.27.55
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/16/2019 1:15 AM, Stephen Boyd wrote:
> Quoting Akash Asthana (2019-11-15 01:57:48)
>> On 11/14/2019 11:06 PM, Stephen Boyd wrote:
>>> Please update the subject. This patch does more than remove the sysfs
>>> file. "Move loopback support to TIOCM_LOOP"?
>> Ok, I will update this in next version.
>>> Quoting Akash Asthana (2019-11-13 02:49:21)
>>>> Remove code from the driver that create and maintain loopback sysfs node.
>>>> Instead use the ioctl TIOCMSET with TIOCM_LOOP argument to set HW to
>>>> loopback mode.
>>>>
>>>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
>>>> ---
>>>> Changes in V5:
>>>>    - As per Greg's and Stephen's comment on v4 patch, removed loopback sysfs
>>>>      file related code.
>>>>
>>>>    drivers/tty/serial/qcom_geni_serial.c | 30 ++++--------------------------
>>>>    1 file changed, 4 insertions(+), 26 deletions(-)
>>>>
>>>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
>>>> index 56dad67..52f5ea2 100644
>>>> --- a/drivers/tty/serial/qcom_geni_serial.c
>>>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>>>> @@ -238,10 +214,14 @@ static void qcom_geni_serial_set_mctrl(struct uart_port *uport,
>>>>                                                           unsigned int mctrl)
>>>>    {
>>>>           u32 uart_manual_rfr = 0;
>>>> +       struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
>>>>    
>>>>           if (uart_console(uport))
>>>>                   return;
>>>>    
>>>> +       if (mctrl & TIOCM_LOOP)
>>>> +               port->loopback = MAX_LOOPBACK_CFG;
>>> How does this work? The loopback is supposed to be the max all the time
>>> and not match some qup number or something?
>> port->loopback is unrelated to QUP number. However we have different
>> modes to run loopback test, 1(rx-tx sorted), 2(cts-rts sorted),
>>
>> 3 or Max(rx-tx sorted and cts-rts sorted). In our internal testing we
>> only use mode 3 hence we are initializing port->loopback variable
>>
>> to 3 and eventually it will be written to HW register from set_termios
>> call.
> Ok. Thanks for clarifying. Can you rename this macro to
> RX_TX_CTS_RTS_SORTED? I imagine seeing something like:
>
> 	/* SE_UART_LOOPBACK_CFG */
> 	#define RX_TX_SORTED		BIT(0)
> 	#define CTS_RTS_SORTED		BIT(1)
> 	#define RX_TX_CTS_RTS_SORTED	RX_TX_SORTED | CTS_RTS_SORTED
>
> or whatever the bit field names really are.
Ok, I will update this is v6.

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

