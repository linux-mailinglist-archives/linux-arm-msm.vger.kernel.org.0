Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A50A761F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2019 11:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbfGZJZj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jul 2019 05:25:39 -0400
Received: from foss.arm.com ([217.140.110.172]:40132 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725903AbfGZJZj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jul 2019 05:25:39 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0630344;
        Fri, 26 Jul 2019 02:25:38 -0700 (PDT)
Received: from [192.168.0.21] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B4C23F71A;
        Fri, 26 Jul 2019 02:25:37 -0700 (PDT)
Subject: Re: [Regression] Missing device nodes for ETR, ETF and STM after
 CONFIG_UEVENT_HELPER=n
To:     gregkh@linuxfoundation.org, saiprakash.ranjan@codeaurora.org
Cc:     geert+renesas@glider.be, mathieu.poirier@linaro.org,
        leo.yan@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cfe09a46-462f-633a-37c2-52f8bfc0ffb2@codeaurora.org>
 <20190726070429.GA15714@kroah.com>
 <165028a7-ff12-dd28-cc4c-57a3961dbb40@codeaurora.org>
 <20190726084127.GA28470@kroah.com>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <f72f2fa1-7b1b-d7de-c9b4-cd574400d8e5@arm.com>
Date:   Fri, 26 Jul 2019 10:28:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20190726084127.GA28470@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 07/26/2019 09:41 AM, Greg Kroah-Hartman wrote:
> On Fri, Jul 26, 2019 at 01:50:27PM +0530, Sai Prakash Ranjan wrote:
>> On 7/26/2019 12:34 PM, Greg Kroah-Hartman wrote:
>>> On Fri, Jul 26, 2019 at 11:49:19AM +0530, Sai Prakash Ranjan wrote:
>>>> Hi,
>>>>
>>>> When trying to test my coresight patches, I found that etr,etf and stm
>>>> device nodes are missing from /dev.
>>>
>>> I have no idea what those device nodes are.
>>>
>>>> Bisection gives this as the bad commit.
>>>>
>>>> 1be01d4a57142ded23bdb9e0c8d9369e693b26cc is the first bad commit
>>>> commit 1be01d4a57142ded23bdb9e0c8d9369e693b26cc
>>>> Author: Geert Uytterhoeven <geert+renesas@glider.be>
>>>> Date:   Thu Mar 14 12:13:50 2019 +0100
>>>>
>>>>       driver: base: Disable CONFIG_UEVENT_HELPER by default
>>>>
>>>>       Since commit 7934779a69f1184f ("Driver-Core: disable /sbin/hotplug by
>>>>       default"), the help text for the /sbin/hotplug fork-bomb says
>>>>       "This should not be used today [...] creates a high system load, or
>>>>       [...] out-of-memory situations during bootup".  The rationale for this
>>>>       was that no recent mainstream system used this anymore (in 2010!).
>>>>
>>>>       A few years later, the complete uevent helper support was made optional
>>>>       in commit 86d56134f1b67d0c ("kobject: Make support for uevent_helper
>>>>       optional.").  However, if was still left enabled by default, to support
>>>>       ancient userland.
>>>>
>>>>       Time passed by, and nothing should use this anymore, so it can be
>>>>       disabled by default.
>>>>
>>>>       Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>       Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>>
>>>>    drivers/base/Kconfig | 1 -
>>>>    1 file changed, 1 deletion(-)
>>>>
>>>>
>>>> Any idea on this?
>>>
>>> That means that who ever created those device nodes is relying on udev
>>> to do this, and is not doing the correct thing within the kernel and
>>> using devtmpfs.
>>>
>>> Any pointers to where in the kernel those devices are trying to be
>>> created?
>>>
>>
>> Somewhere in drivers/hwtracing/coresight/* probably. I am not sure,
>> Mathieu/Suzuki would be able to point you to the exact code.
>>
>> Also just to add on some more details, I am using *initramfs*

> 
> Are you using devtmpfs for your /dev/ mount?

I think that should solve the issue ^^

> 
> If you enable this option, what does:
> 	ls -l /dev/etr
> 	ls -l /dev/etf
> 	ls -l /dev/stm
> result in?
> 
> What are these device nodes for?  Are they symlinks?  Real devices that
> show up in /sys/dev/char/ as a real value?  Or something else?

Greg, those are registered as miscellaneous devices to export the trace 
collected (for etfs and etrs) in sysfs mode and for user-space access to
allow STM tracing. So they are real devices.


Suzuki
