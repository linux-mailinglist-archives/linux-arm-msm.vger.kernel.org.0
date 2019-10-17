Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5793ADAAF3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2019 13:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502041AbfJQLKq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Oct 2019 07:10:46 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:60052 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392327AbfJQLKq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Oct 2019 07:10:46 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 639476090E; Thu, 17 Oct 2019 11:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571310645;
        bh=UG8zgQw0SlCjZHbnPa0MCSesKKx8ziWMTvC2YcQ9AQQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=X46KqpXys4WYT1/iunmcMWAlcbAuOXzMrPSU4Wpgc+eG9U9dLghPp7CHWa2P9f7N2
         GsRRvX36Oh4/Aq+SCqTdZT2dNl7Kk/vlGIhf/yaUTiCiy0cKD7FnvP0ryiTN1hi+zn
         Tu2E984PQt5RHW2ZTS2X5Ym0sP60QzB1YP1W03fo=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 563716032D;
        Thu, 17 Oct 2019 11:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571310643;
        bh=UG8zgQw0SlCjZHbnPa0MCSesKKx8ziWMTvC2YcQ9AQQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Xc/tz59c9aC86c9EmzAJoaS9HW0rHc4H9s1d15+ZU5oIHh3VVkLQJLT29Yvn+PXrR
         amlX5VNvbjeoQcH9TAF5mBMA3UXmlA2utK3+ujzuV8y8NwBMnz1yyES8M5mR1RVV1W
         6fMVKCXgVOB6+j6Iv2dwQzpvqhpnKzdYjVD1R92Q=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 563716032D
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V2 1/2] tty: serial: qcom_geni_serial: IRQ cleanup
To:     Stephen Boyd <swboyd@chromium.org>, gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mgautam@codeaurora.org, bjorn.andersson@linaro.org
References: <1570700763-17319-1-git-send-email-akashast@codeaurora.org>
 <5d9f3dfa.1c69fb81.84c4b.30bf@mx.google.com>
 <010dd569-d172-fdcf-0bfa-8caaf41a4d46@codeaurora.org>
 <5da627d8.1c69fb81.82267.2a50@mx.google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <2fb874d8-5075-1d46-e0ba-14e37c19943c@codeaurora.org>
Date:   Thu, 17 Oct 2019 16:40:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5da627d8.1c69fb81.82267.2a50@mx.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/16/2019 1:41 AM, Stephen Boyd wrote:
> Quoting Akash Asthana (2019-10-11 00:39:06)
>> On 10/10/2019 7:49 PM, Stephen Boyd wrote:
>>> Quoting Akash Asthana (2019-10-10 02:46:03)
>>>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
>>>> index 14c6306..5180cd8 100644
>>>> --- a/drivers/tty/serial/qcom_geni_serial.c
>>>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>>>> @@ -1297,11 +1291,21 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>>>           port->rx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
>>>>           port->tx_fifo_width = DEF_FIFO_WIDTH_BITS;
>>>>    
>>>> +       scnprintf(port->name, sizeof(port->name), "qcom_geni_serial_%s%d",
>>>> +               (uart_console(uport) ? "console" : "uart"), uport->line);
>>> Drop useless parenthesis. Also, it might make more sense to make this a
>>> devm_kasprintf() call now.
>> OK
>>
>>>>           irq = platform_get_irq(pdev, 0);
>>>>           if (irq < 0)
>>>>                   return irq;
>>>>           uport->irq = irq;
>>>>    
>>>> +       irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
>>> Is there a reason why we can't always leave the irq enabled and request
>>> it later once the uart structure has been fully initialized?
>> According to current design we are requesting IRQ handler in probe, and
>> we enable and disable it from the startup(port open) and shutdown(port
>> close) function respectively.
>>
>> We need to call for disable_irq in shutdown function because client has
>> closed the port and we don't expect any transfer requests after it.
>>
>>>> request it later once the uart structure has been fully initialized?
>>       Is the ask is to move request irq later in probe after the uport is
>> fully initialized?
> Yes I'm wondering if we can get rid of the IRQ_NOAUTOEN and
> irq_enable/disable bits in here and leave the interrupt enabled all the
> time.

Ideally it should work, I will run few experiments to make sure there 
isn't any spurious interrupts problem after port close is called.

If it works, I will post a separate patch for it.

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

