Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80E462D1BAD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Dec 2020 22:08:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727653AbgLGVIH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Dec 2020 16:08:07 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:20060 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727599AbgLGVIG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Dec 2020 16:08:06 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607375268; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=PmbWDaJG2mv+6tH9TC93HycSG+bcbHfVywi/l52q+fo=;
 b=O6b2KsWVvlemC/Evf4QlKPaV0ve77EzYGR615jlbtLMPaF0FZXEfLk/NuRjtT2CiyLbNmcRw
 ToEikfRi4ZOsmnysF2Jk4M2XNiGEgv4vCgf6JBhItyMNS3WmaKxOaJ9nnDZ249HCJP115YtC
 GSOEsmA9w893Uvcdc28E7zzq+6k=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5fce997eeb348d1ba26aac1c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 07 Dec 2020 21:07:10
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 432CCC433ED; Mon,  7 Dec 2020 21:07:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 51619C433CA;
        Mon,  7 Dec 2020 21:07:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 07 Dec 2020 13:07:08 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: The MHI interrupt handling issue
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <CAMZdPi9oxXhry94HmnSsBqa6oP3GvTWTmy9CSLUphYjR3e+-ew@mail.gmail.com>
References: <CAMZdPi-LHmeLXGDjsb3kEhXrrv2do5eJ=HrHOnS5r+DqtAwKcQ@mail.gmail.com>
 <4098d0e6-4cb7-32ba-3b40-cfb0412bac6d@codeaurora.org>
 <CAMZdPi9oxXhry94HmnSsBqa6oP3GvTWTmy9CSLUphYjR3e+-ew@mail.gmail.com>
Message-ID: <c93eb868cf7ddb5678c99af1f7da8fe8@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-12-07 09:02 AM, Loic Poulain wrote:
> Hi Jeffrey,
> 
> On Mon, 7 Dec 2020 at 16:48, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>> 
>> On 12/7/2020 6:20 AM, Loic Poulain wrote:
>> > Hi folks,
>> >
>> > Before putting my hands into that, I wanted to expose a MHI interrupt
>> > problem, comments are welcome.
>> >
>> > Currently, the hard IRQ handler for event rings do nothing except
>> > triggering a tasklet as bottom half that in turn will take care of
>> > retrieving buffer(s). That leads to have an unexpected high amount of
>> > interrupts when I perform throughput testing with mhi-net (though it
>> > applies for any mhi client driver).
>> >
>> > The point is that usually, an hard interrupt handler is responsible
>> > for triggering the bottom half handler but also for
>> > clearing/suspending interrupt on device side. However, AFAIK, there is
>> > no such possibility in the MHI protocol. Since the interrupt is not
>> 
>> I think Linux side improvements would always be welcome, but have you
>> looked at BEI and INTMODT?  They are features defined in the MHI spec
>> for addressing interrupt storms.
> 
> Yes, that interrupt coalescing feature is working well, and I use it
> in that context. But Actually the problem is not really that the
> device generates too many interrupts, but that the driver does not
> mask the interrupt while handling it, causing replicated interrupts,
> and so useless hard interrupt handler executions. I need to
> investigate how bad it impact the system/transfers though.
> 
> 
>> 
>> 
>> > handled in the hard irq handler, it is triggered again once interrupt
>> > are re-enabled, and even during the tasklet execution... at the end,
>> > that makes a lot of unnecessary interrupts, that introduce latency and
>> > participate to system load...
>> >
>> > I added some printk to highlight that issue:
>> > [11564.689202] mhi_irq_handler 55d32b8
>> > [11564.689485] mhi_irq_handler 55d32b8
>> > [11564.690011] mhi_irq_handler 55d32b8
>> > [11564.690397] [55d32b8] mhi_process_data_event_ring start
>> > [11564.690667] mhi_irq_handler 55d32b8
>> > [11564.690937] mhi_irq_handler 55d32b8
>> > [11564.691207] mhi_irq_handler 55d32b8
>> > [11564.691475] mhi_irq_handler 55d32b8
>> > [11564.692076] [55d32b8] mhi_process_data_event_ring done
>> > [...]
>> >
>> > I see two solutions to fix that problem:
>> > - Manage events directly in the hard-irq handler (no more tasklet)
>> > - Use threaded IRQ with IRQF_ONESHOT flag, to keep interrupt masked
>> > until threaded handler has completed.
>> >
>> > Regards,
>> > Loic

I remember from an earlier conversation with Jeff and Mani that 
IRQF_ONESHOT
cannot be used when a IRQF_SHARED flag is also present when we have a 
single
shared IRQ line.

Jeff has this use case where BHI intvec and rest of the MHI event rings 
are
sharing the same IRQ line.

We have been using napi_poll() with 5msec INTMODT for high TPUT data 
transfers.

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
