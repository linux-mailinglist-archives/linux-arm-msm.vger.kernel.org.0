Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F75F2F5B24
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 08:18:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbhANHQf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 02:16:35 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:14169 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbhANHQf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 02:16:35 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610608577; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=FN3E/oAA1UAVugKo11WqqqWS0f5OjU9KG4IozIMrmA8=; b=lKD8HGwemigh9DviuS0a1/hizm4i4UWzJcq6bgcZbQyAHVW2FC03zTOArYB5e7u1PUE9r2vn
 9Jm0zmYD4Cj5aRAleReYHeDi1py2uoGF6wghEUz+SA80CNPRVz7ncERc0m9WE73JzD62LxLx
 uKPvngJrC5IgRaUAUndqy2wGSks=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5fffefa5d84bad3547c4b634 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 14 Jan 2021 07:15:49
 GMT
Sender: sramana=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F3C48C43464; Thu, 14 Jan 2021 07:15:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.1.11] (cpe-70-95-74-122.san.res.rr.com [70.95.74.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sramana)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BDD78C433C6;
        Thu, 14 Jan 2021 07:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BDD78C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sramana@codeaurora.org
Subject: Re: [PATCH 0/3] arm64: cpufeature: Add filter function to control
To:     Marc Zyngier <maz@kernel.org>
Cc:     catalin.marinas@arm.com, will@kernel.org, pajay@qti.qualcomm.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <1610152163-16554-1-git-send-email-sramana@codeaurora.org>
 <6dfdf691b5ed57df81c4c61422949af5@misterjones.org>
From:   Srinivas Ramana <sramana@codeaurora.org>
Message-ID: <c028d65d-27c3-826a-b16c-407e9cf48aac@codeaurora.org>
Date:   Wed, 13 Jan 2021 23:15:47 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <6dfdf691b5ed57df81c4c61422949af5@misterjones.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Marc,

On 1/11/2021 5:40 AM, Marc Zyngier wrote:
> Hi Srinivas,
>
> On 2021-01-09 00:29, Srinivas Ramana wrote:
>> This patchset adds a control function for cpufeature framework
>> so that the feature can be controlled at runtime.
>>
>> Defer PAC on boot core and use the filter function added to disable
>> PAC from command line. This will help toggling the feature on systems
>> that do not support PAC or where PAC needs to be disabled at runtime,
>> without modifying the core kernel.
>>
>> The idea of adding the filter function for cpufeature is taken from
>> https://lore.kernel.org/linux-arm-kernel/20200515171612.1020-25-catalin.marinas@arm.com/ 
>>
>> https://lore.kernel.org/linux-arm-kernel/20200515171612.1020-24-catalin.marinas@arm.com/ 
>>
>>
>> Srinivas Ramana (3):
>>   arm64: Defer enabling pointer authentication on boot core
>>   arm64: cpufeature: Add a filter function to cpufeature
>>   arm64: Enable control of pointer authentication using early param
>>
>>  Documentation/admin-guide/kernel-parameters.txt |  6 +++
>>  arch/arm64/include/asm/cpufeature.h             |  8 +++-
>>  arch/arm64/include/asm/pointer_auth.h           | 10 +++++
>>  arch/arm64/include/asm/stackprotector.h         |  1 +
>>  arch/arm64/kernel/cpufeature.c                  | 53 
>> +++++++++++++++++++------
>>  arch/arm64/kernel/head.S                        |  4 --
>>  6 files changed, 64 insertions(+), 18 deletions(-)
>
> I've been working for some time on a similar series to allow a feature
> set to be disabled during the early boot phase, initially to prevent
> booting a kernel with VHE, but the mechanism is generic enough to
> deal with most architectural features.
>
> I took the liberty to lift your first patch and to add it to my 
> series[1],
> further allowing PAuth to be disabled at boot time on top of BTI and VHE.
>
> I'd appreciate your comments on this.
Thanks for sending this series. It seems to be more flexible compared 
you what we did.
Following your discussion on allowing EXACT ftr_reg values.


Btw, do you have plan to add MTE in similar lines to control the feature?
We may be needing this on some systems.
>
> Thanks,
>
>         M.
>
> [1] https://lore.kernel.org/r/20210111132811.2455113-1-maz@kernel.org


Thanks,

-- Srinivas R

