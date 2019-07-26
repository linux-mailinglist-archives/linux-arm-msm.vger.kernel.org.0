Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B7A1762BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2019 11:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbfGZJoo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jul 2019 05:44:44 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:41994 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbfGZJoo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jul 2019 05:44:44 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B4EDE60314; Fri, 26 Jul 2019 09:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564134282;
        bh=DqzQ5qY0NO7gSJyUiush9XGVY08AQ8ZisKSAGHrDwHc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=hwpDxOl0i0UX0naJTHi4/51abo1tk+sVdUb4QjDgvT3ncxZ+TKz8u0PxC+aVXwklE
         oirH8mtMeNvO7pXIyc26sD94OYmYUVZxXoIgKXdeFXNg1lh9ayla/0lFS2JSTjJRkL
         xJf++EVVFbKf194knlhx4ESkKEMHX/SQQ9H9q8Wo=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.136.27] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 33F7460132;
        Fri, 26 Jul 2019 09:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564134282;
        bh=DqzQ5qY0NO7gSJyUiush9XGVY08AQ8ZisKSAGHrDwHc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=hwpDxOl0i0UX0naJTHi4/51abo1tk+sVdUb4QjDgvT3ncxZ+TKz8u0PxC+aVXwklE
         oirH8mtMeNvO7pXIyc26sD94OYmYUVZxXoIgKXdeFXNg1lh9ayla/0lFS2JSTjJRkL
         xJf++EVVFbKf194knlhx4ESkKEMHX/SQQ9H9q8Wo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 33F7460132
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
Subject: Re: [Regression] Missing device nodes for ETR, ETF and STM after
 CONFIG_UEVENT_HELPER=n
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Leo Yan <leo.yan@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cfe09a46-462f-633a-37c2-52f8bfc0ffb2@codeaurora.org>
 <20190726070429.GA15714@kroah.com>
 <165028a7-ff12-dd28-cc4c-57a3961dbb40@codeaurora.org>
 <20190726084127.GA28470@kroah.com>
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Message-ID: <097942a1-6914-2542-450f-65a6147dc7aa@codeaurora.org>
Date:   Fri, 26 Jul 2019 15:14:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726084127.GA28470@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/26/2019 2:11 PM, Greg Kroah-Hartman wrote:
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
> 

I am not mounting devtmpfs. However

  CONFIG_DEVTMPFS=y
  CONFIG_DEVTMPFS_MOUNT=y

> If you enable this option, what does:
> 	ls -l /dev/etr
> 	ls -l /dev/etf
> 	ls -l /dev/stm
> result in?
> 

/ # ls -l /dev/tmc_etr0
crw-rw----    1 root     0          10,  57 Jan  1 00:00 /dev/tmc_etr0
/ #
/ # ls -l /dev/tmc_etf0
crw-rw----    1 root     0          10,  58 Jan  1 00:00 /dev/tmc_etf0
/ #
/ # ls -l /dev/stm0
crw-rw----    1 root     0         236,   0 Jan  1 00:00 /dev/stm0

> What are these device nodes for?  Are they symlinks?  Real devices that
> show up in /sys/dev/char/ as a real value?  Or something else?
> 

They are not symlinks.

These device node names represent coresight sinks(collect traces) like 
ETR, ETF, ETB and coresight sources(generates traces) like STM.

ETR and ETF are misc device registered in drivers/hwtracing/coresight
/coresight-tmc.c. However STM is not a misc device.

> Do you have udev rules that create these nodes somehow?
> 

No I do not have any udev rules.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
