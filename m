Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC0A61A5EE3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2020 16:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbgDLOLS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Apr 2020 10:11:18 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:58324 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726805AbgDLOLR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Apr 2020 10:11:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586700677; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Fs11ZYNs11KRXX0CMgRlVZnl3dBXHk7slByjIz5Iuj4=; b=DmcUhIftEpzZYRPqYmxxJp89cTQJz+GwVpER5IahYOFwaOR6xvJPQY/MZMDlVYW/R/aBedSY
 UjNsERtx4U+EMGE2f2rfssuACrNBCk3fskhkxnmTOQIfH4tH+V9PhBr9tDbceZl0oKcBgi81
 cKj9qvlIPG1M3//HNvrn5qwqaII=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e932174.7f4af2710ed8-smtp-out-n02;
 Sun, 12 Apr 2020 14:11:00 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 886CFC432C2; Sun, 12 Apr 2020 14:11:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.136.116])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AA686C433F2;
        Sun, 12 Apr 2020 14:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AA686C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v16 4/6] soc: qcom: rpmh: Invoke rpmh_flush() for dirty
 caches
To:     Doug Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
References: <1586154741-8293-1-git-send-email-mkshah@codeaurora.org>
 <1586154741-8293-5-git-send-email-mkshah@codeaurora.org>
 <158649213142.77611.5740203322498170248@swboyd.mtv.corp.google.com>
 <CAD=FV=UkiR+xLeowOT+H3ZKNCesf84AJi6mHiHNpJ2P9-DiXaQ@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <11c37c89-aa1f-7297-9ecf-4d77a20deebd@codeaurora.org>
Date:   Sun, 12 Apr 2020 19:40:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=UkiR+xLeowOT+H3ZKNCesf84AJi6mHiHNpJ2P9-DiXaQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 4/10/2020 8:22 PM, Doug Anderson wrote:
> Hi,
>
> On Thu, Apr 9, 2020 at 9:15 PM Stephen Boyd <swboyd@chromium.org> wrote:
>>>   int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>> This function name keeps throwing me off. Can we please call it
>> something like rpmh_configure_tcs_sleep_wake()? The word "flush" seems
>> to imply there's some sort of cache going on, but that's not really the
>> case. We're programming a couple TCS FIFOs so that they can be used
>> across deep CPU sleep states.
> I'm hoping this rename can be deferred until Maulik's series and my
> cleanup series land.  While I agree that rpmh_flush() is a bit of a
> confusing name, it's not a new name and renaming it midway through
> when there are a bunch of patches in-flight is going to be a hassle.
>
> Assuming others agree, my thought is that Maulik will do one more v17
> spin with small nits fixed up, then his series can land early next
> week when (presumably) -rc1 comes out.  If my current cleanup doesn't
> apply cleanly (or if Bjorn/Andy don't want to fix the two nits in
> commit messages when applying) I can repost my series and that can
> land in short order.  Once those land:
>
> * Maulik can post this rpmh_flush() rename atop.
>
> * I can post the patch to remove the "pm_lock" that was introduced in
> this series.  A preview at <https://crrev.com/c/2142823>.
>
> * Maulik can post some of the cleanups that Maulik wanted to do in
> rpmh.c with regards to __fill_rpmh_msg()
>
> ...assuming those are not controversial perhaps they can be reviewed
> quickly and land quickly?  I suppose I can always dream...
>
>
> -Doug

Agree, I can defer rename until this series lands and then post above 
listed changes.

Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
