Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 384AC147998
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2020 09:48:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729679AbgAXIsR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jan 2020 03:48:17 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:64781 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729225AbgAXIsR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jan 2020 03:48:17 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579855696; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=qJBBtjitA++VUyWFDcRJ0WyV5UvQnNj9dtREvFgLIhA=;
 b=WMEmUFFaWgG+AGTYdZ6w/we1phjdv77x3M0D7Lx35wpg68teFTFUdWAF4b/aMYC3PttjuMne
 4SVeThzb0z7heHqFp9k/uh6yVYBMUXidFEmPNUNb/mtU75ALz+AUFZp8uVYKNp4hyLcdrHfi
 zDIXJYc6Sese6ECjCpAUbReZQrE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e2aaf4f.7ff60a107df8-smtp-out-n01;
 Fri, 24 Jan 2020 08:48:15 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 15E17C4479C; Fri, 24 Jan 2020 08:48:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 529C6C43383;
        Fri, 24 Jan 2020 08:48:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 24 Jan 2020 14:18:14 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] pstore: Fix printing of duplicate boot messages to
 console
In-Reply-To: <5e29f8df.1c69fb81.fc97b.8df8@mx.google.com>
References: <20200123160031.9853-1-saiprakash.ranjan@codeaurora.org>
 <5e29f8df.1c69fb81.fc97b.8df8@mx.google.com>
Message-ID: <80957b8f069b513fd2b6f031a94a3474@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-01-24 01:19, Stephen Boyd wrote:
> Quoting Sai Prakash Ranjan (2020-01-23 08:00:31)
>> Since commit f92b070f2dc8 ("printk: Do not miss new messages
>> when replaying the log"), CON_PRINTBUFFER flag causes the
>> duplicate boot messages to be printed on the console when
>> PSTORE_CONSOLE and earlycon (boot console) is enabled.
>> Pstore console registers to boot console when earlycon is
>> enabled during pstore_register_console as a part of ramoops
>> initialization in postcore_initcall and the printk core
>> checks for CON_PRINTBUFFER flag and replays the log buffer
>> to registered console (in this case pstore console which
>> just registered to boot console) causing duplicate messages
>> to be printed. Remove the CON_PRINTBUFFER flag from pstore
>> console since pstore is not concerned with the printing of
>> buffer to console but with writing of the buffer to the
>> backend.
>> 
>> Console log with earlycon and pstore console enabled:
>> 
>> [    0.008342] Console: colour dummy device 80x25
>> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x51df805e]
>> ...
>> [    1.244049] hw-breakpoint: found 6 breakpoint and 4 watchpoint 
>> registers.
>> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x51df805e]
>> 
>> Fixes: f92b070f2dc8 ("printk: Do not miss new messages when replaying 
>> the log")
>> Reported-by: Douglas Anderson <dianders@chromium.org>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
> 
> While I like the idea, it seems that this breaks console-ramoops by
> removing all the text that is printed in the kernel log before this
> console is registered. I reboot and see that
> /sys/fs/pstore/console-ramoops-1 starts like this now:
> 
> 	localhost ~ # cat /sys/fs/pstore/console-ramoops-0
> 	[    0.943472] printk: console [pstore-1] enabled
> 
> Maybe this console can be "special" and not require anything to be
> printed out to visible consoles but still get the entire log contents?
> Or we should just not worry about it.

Thanks for testing this out Stephen, I should have tested this some 
more.
Lets drop this patch.

-Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
