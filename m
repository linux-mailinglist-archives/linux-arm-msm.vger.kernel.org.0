Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9583C198E43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2020 10:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbgCaI0O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Mar 2020 04:26:14 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:37157 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726299AbgCaI0M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Mar 2020 04:26:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585643171; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=d+grUI5NNPTWGY1TGR+JJEiHRsD9XOCJGD3QPIT8u20=; b=orbEX5Tsmfxa1sQb3+BaBRXBluPUpG68W1iBMMhdtwGk4MnyznBdkP1WSi4bJBCYoQYndfws
 V5nykeMBVOKXHAc8c9JY4fTQ/k1vxHx5UNL+0MTMxs/M38a03RTP4rDrv1i/7LOm4F2/9W2v
 atkggCZ3hfuGPcEMCIV9NcnFHlc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e82fea2.7f47f68d8f48-smtp-out-n05;
 Tue, 31 Mar 2020 08:26:10 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3A037C43637; Tue, 31 Mar 2020 08:26:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.183.81])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4E3A2C433F2;
        Tue, 31 Mar 2020 08:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4E3A2C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v14 4/6] soc: qcom: rpmh: Invoke rpmh_flush() for dirty
 caches
To:     Doug Anderson <dianders@chromium.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
References: <1585244270-637-1-git-send-email-mkshah@codeaurora.org>
 <1585244270-637-5-git-send-email-mkshah@codeaurora.org>
 <CAD=FV=UQAbqitmYR7=5+AAL8pqy2imzEWf8BTkBoD6mthAwpKw@mail.gmail.com>
 <7bd2c923-4003-a1c4-610f-548e79a94d35@codeaurora.org>
 <CAD=FV=WEH_A4SvyX0uv9Z_n+z9_SYcdm2LfsLRK7qALEiOyHqQ@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <d76424f3-965e-abaa-9622-185eff94dfe9@codeaurora.org>
Date:   Tue, 31 Mar 2020 13:56:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=WEH_A4SvyX0uv9Z_n+z9_SYcdm2LfsLRK7qALEiOyHqQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 3/27/2020 11:52 PM, Doug Anderson wrote:
> Hi,
>
> On Fri, Mar 27, 2020 at 4:00 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>>    * @ctrlr: controller making request to flush cached data
>>    *
>> - * Return: -EBUSY if the controller is busy, probably waiting on a response
>> - * to a RPMH request sent earlier.
>> + * Return: 0 on success, error number otherwise.
>>    *
>> - * This function is always called from the sleep code from the last CPU
>> - * that is powering down the entire system. Since no other RPMH API would be
>> - * executing at this time, it is safe to run lockless.
>> + * This function can either be called from sleep code on the last CPU
>> + * (thus no spinlock needed) or with the ctrlr->cache_lock already held.
>>
>> Now you can remove the "or with the ctrlr->cache_lock already held"
>> since it's no longer true.
>>
>> It can be true for other RSCs, so i kept as it is.
> I don't really understand this.  The cache_lock is only a concept in
> "rpmh.c".  How could another RSC grab the cache lock?  If nothing
> else, can you remove this comment until support for those other RSCs
> are added and we can evaluate then?
>
> -Doug
Okay i will remove this comment until support for other RSCs are added.

Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
