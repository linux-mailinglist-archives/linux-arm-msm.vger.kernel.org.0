Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98B0BFDA41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 11:00:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbfKOKAx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 05:00:53 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:60202 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbfKOKAx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 05:00:53 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id BA4DC61647; Fri, 15 Nov 2019 10:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573812052;
        bh=wv3wn4UbKpryZVwwgmgzriaxUocydhMeJGuHKVgs3Bw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=LQ7BBvA44sNlch11hqYqRzuGBkuoiDgfBxb7a4cAM/EKy6jxjA/HW5qAukAvUSkPK
         jXVGIZjPMNEZL7/XGGf1JjbQAq1UTheUKsJ2aa9TK0FBx9UP3RwBHC1SB4Fm59t/Bb
         C+s7vBonGMGbvvXLaBYfThSv4XdSOKBsBoWeojNk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.0.8] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 53173611F3;
        Fri, 15 Nov 2019 10:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573812050;
        bh=wv3wn4UbKpryZVwwgmgzriaxUocydhMeJGuHKVgs3Bw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=LTyE2hWYkPSbjydXsgIXUJ1evzQivx3vOTjWFkH27EZIvFH2ZtsfQ81IA5ufQKz0W
         ozh7xAT99/djNqwm3iwc7uuGFMCFSsbAlvpk5uIlFRX1k9soIxj6GR4JAvu7oju311
         idy/LKX4k7+Zjp9DoLVZfUTa/SCaNTsz07cZ1woI=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 53173611F3
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH v5 2/3] tty: serial: qcom_geni_serial: Wakeup over UART RX
To:     Stephen Boyd <swboyd@chromium.org>, gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mgautam@codeaurora.org, msavaliy@codeaurora.org
References: <1573642136-30488-1-git-send-email-akashast@codeaurora.org>
 <5dcd919d.1c69fb81.1c304.2dc5@mx.google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <55a02d0f-2dec-2ba7-82e6-f21a8c86792a@codeaurora.org>
Date:   Fri, 15 Nov 2019 15:30:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <5dcd919d.1c69fb81.1c304.2dc5@mx.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/14/2019 11:10 PM, Stephen Boyd wrote:
> Quoting Akash Asthana (2019-11-13 02:48:56)
>> Add system wakeup capability over UART RX line for wakeup capable UART.
>> When system is suspended, RX line act as an interrupt to wakeup system
>> for any communication requests from peer.
> How does the RX line get remuxed as a GPIO interrupt here? Is that
> through some pinctrl magic in DT or just via enabling/disabling the
> interrupt?
Yes, For wakeup capable UART node, we have registered UART RX line with 
TLMM interrupt controller in DT file . Example: if GPIO48 is UART RX line

interrupts-extended =  <&intc GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>,  <&tlmm 
48 IRQ_TYPE_EDGE_FALLING>;
>
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
>> index 634054a..56dad67 100644
>> --- a/drivers/tty/serial/qcom_geni_serial.c
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>> @@ -1321,6 +1327,23 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>                  return ret;
>>          }
>>   
>> +       if (port->wakeup_irq > 0) {
>> +               /*
>> +                * Set pm_runtime status as ACTIVE so that wakeup_irq gets
>> +                * enabled/disabled from dev_pm_arm_wake_irq  during  system
>> +                * suspend/resume respectively.
>> +                */
>> +               pm_runtime_set_active(&pdev->dev);
> We can always set this device as active regardless of wakeup interrupt,
> right? Can we move this call outside of this if?
Ok, Yes we can move this call outside of if. I will update in next version.
>
>> +               device_init_wakeup(&pdev->dev, true);
>> +               ret = dev_pm_set_dedicated_wake_irq(&pdev->dev,
>> +                                               port->wakeup_irq);
>> +               if (ret) {
>> +                       device_init_wakeup(&pdev->dev, false);
>> +                       uart_remove_one_port(drv, uport);
>> +                       return ret;
>> +               }
>> +       }
>> +
>>          return ret;
>>   }
>>   

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

