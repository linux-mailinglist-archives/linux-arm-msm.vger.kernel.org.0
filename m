Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69646F6EE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2019 08:05:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbfKKHFj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Nov 2019 02:05:39 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:42460 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbfKKHFj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Nov 2019 02:05:39 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 13F7860913; Mon, 11 Nov 2019 07:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573455938;
        bh=I8aSTr3qVF9CMuqm+HZ1OtWozQzCjYgWiyY8oaUhshA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=D5FwlQCFe46wV0MPk+Do5qx4GHln7Wmjpg75IynzbRo1P/LO1xOKtny8nKC87xxwI
         0XBgEMfN4MpcajfUakqrD1+nCiKe6gI8CWnROVEDQn2UQRbr0SkjQgpHHXqEONL8RA
         SiNFa711hMEWeXkMJNQzwgYO03E2fAy0pMY5rV4k=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 74FA760913;
        Mon, 11 Nov 2019 07:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573455931;
        bh=I8aSTr3qVF9CMuqm+HZ1OtWozQzCjYgWiyY8oaUhshA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=eaucNagCwvupOBohEBsAYRMYmD6TCwW9IDxr3wlEVGyS0QBnBmxm8t2xXU33GDneA
         +SHa6PJ5N8lF76mSKSkmd+Bbwm4kMsQinYtJ8K9SeXBmCeXdXPv63QKZZG4GBSVQ5Q
         gWtcJoKnJt5p62RxDbsA4sHMMO7Ze4jTqiyxZmTU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 74FA760913
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH v4 1/2] tty: serial: qcom_geni_serial: IRQ cleanup
To:     Stephen Boyd <swboyd@chromium.org>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mgautam@codeaurora.org
References: <1572947835-30600-1-git-send-email-akashast@codeaurora.org>
 <20191105171705.GB2815774@kroah.com>
 <5dc21b1d.1c69fb81.8f924.e6e1@mx.google.com>
 <20191106121600.GA3105139@kroah.com>
 <5dc2f5c6.1c69fb81.3483d.c535@mx.google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <31e62cb8-d169-dc56-d4b1-e60bffff93d0@codeaurora.org>
Date:   Mon, 11 Nov 2019 12:35:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <5dc2f5c6.1c69fb81.3483d.c535@mx.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/6/2019 10:03 PM, Stephen Boyd wrote:
Thanks for reviewing.
> Quoting Greg KH (2019-11-06 04:16:00)
>> On Tue, Nov 05, 2019 at 05:00:12PM -0800, Stephen Boyd wrote:
>>> Quoting Greg KH (2019-11-05 09:17:05)
>>>> On Tue, Nov 05, 2019 at 03:27:15PM +0530, Akash Asthana wrote:
>>>>> @@ -1307,7 +1307,21 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>>>>        port->handle_rx = console ? handle_rx_console : handle_rx_uart;
>>>>>        if (!console)
>>>>>                device_create_file(uport->dev, &dev_attr_loopback);
>>>>> -     return uart_add_one_port(drv, uport);
>>>>> +
>>>>> +     ret = uart_add_one_port(drv, uport);
>>>>> +     if (ret)
>>>>> +             return ret;
>>>> What is going to remove the sysfs file you just created above (in a racy
>>>> way, it's broken and needs to be fixed, but that's a different issue
>>>> here...)?
>>>>
>>>>
>>>>> +
>>>>> +     irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
>>>>> +     ret = devm_request_irq(uport->dev, uport->irq, qcom_geni_serial_isr,
>>>>> +                     IRQF_TRIGGER_HIGH, port->name, uport);
>>>>> +     if (ret) {
>>>>> +             dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
>>>>> +             uart_remove_one_port(drv, uport);
>>>>> +             return ret;
>>>> Does this remove the sysfs file?
>>>>
>>> The loopback file isn't documented. It isn't removed when the driver is
>>> removed either. Can we just remove the whole thing? It would be nicer if
>>> that sort of thing was supported in the tty layer somehow. Is it?
>> I don't know what that file does, so yes, please delete it :)

This sysfs file was exposed to user to configure hardware to run in 
loopback mode (sorting TX and RX lines).

We use this mode to sanity test TX and RX path of the driver after 
making any code changes.

But we can remove this sysfs file and use TIOCM_LOOP to set HW in 
loopback mode as suggested by stephen.

>> And as for support in the tty layer itself, if you figure out what it
>> does, sure, we can add support if needed.
>>
> I think it may be supported in the tty layer with TIOCM_LOOP already.
> Akash, can you confirm?

Yeah, its already supported in tty layer. We can call TIOCMSET ioctl 
from user space test application with TIOCM_LOOP argument to configure 
our HW in loopback mode.

I will remove all the code related to loopback sysfs.

Thanks for this suggestion.

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

