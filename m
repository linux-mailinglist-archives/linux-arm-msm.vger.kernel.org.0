Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07286315519
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 18:29:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233217AbhBIR2i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 12:28:38 -0500
Received: from so15.mailgun.net ([198.61.254.15]:47956 "EHLO so15.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233233AbhBIR1y (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 12:27:54 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612891651; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=hFIXoOz37mmLcTDfDNeP8mo8ZAIUX3YGVOqlZNyoU0Y=;
 b=LyAaFc7DM4cA2Kaj2naTADqHmhwp2hQbkQQ+EWCU/hZNsxduRsid0bzMqSCf+YMQmEIUrtx/
 WKbzyYeGEtDhSTCUCq2k2LG7PihOfNZI6mBQFe1l7xfuxeThMJ07b/thHdm7Pu7XliwdEz+n
 N/TpqHqDbGt0/tb1Y1piCH7J7J4=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6022c5f9e3df861f4b7fb70a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Feb 2021 17:27:21
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 34135C43462; Tue,  9 Feb 2021 17:27:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B92F7C433CA;
        Tue,  9 Feb 2021 17:27:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 09 Feb 2021 09:27:19 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] mhi: Fix double dma free
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <CAMZdPi_16SfDoYC0vqqhRfEOqn3SHc6EUmfpVz0RRLaGek7_PQ@mail.gmail.com>
References: <1612885989-12288-1-git-send-email-loic.poulain@linaro.org>
 <f2612a01-2c10-9735-d4ba-46ea87c70379@codeaurora.org>
 <CAMZdPi_16SfDoYC0vqqhRfEOqn3SHc6EUmfpVz0RRLaGek7_PQ@mail.gmail.com>
Message-ID: <7a641d95c2e8c74c7dfc537c74a7ae1a@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-09 08:06 AM, Loic Poulain wrote:
> On Tue, 9 Feb 2021 at 16:55, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>> 
>> On 2/9/2021 8:53 AM, Loic Poulain wrote:
>> > mhi_deinit_chan_ctxt functionthat takes care of unitializing channel
>> > resources, including unmapping coherent MHI areas, can be called
>> > from different path in case of controller unregistering/removal:
>> >   - From a client driver remove callback, via mhi_unprepare_channel
>> >   - From mhi_driver_remove that unitialize all channels
>> >
>> > mhi_driver_remove()
>> > |-> driver->remove()
>> > |    |-> mhi_unprepare_channel()
>> > |        |-> mhi_deinit_chan_ctxt()
>> > |...
>> > |-> mhi_deinit_chan_ctxt()
>> >
>> > This leads to double dma freeing...
>> >
>> > Fix that by preventing deinit for already uninitialized channel.
>> >
>> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>> > Reported-by: Kalle Valo <kvalo@codeaurora.org>
>> > ---
>> 
>> Seems like this should have a Fixes: tag, no?
> 
> Right, thanks, i'll add it in V2 once I get feedback.

Hi Loic, Mani,

I saw this same issue a while back but could not collect the logs for 
it.

I had already pushed a patch to fix this differently [1] which was 
recently reviewed by Hemant.

Although there wasn't a purposeful fixes tag for it. I think the culprit 
for this issue is [2]:

As it allows the unprepare to go through on remove(), which was 
traditionally not allowed and
ends up uncovering this issue as it fixes another.

Channel updates [3] address that and provide a bunch of other 
improvements. Please consider them.

Thanks,
Bhaumik

[1] https://lkml.org/lkml/2021/2/4/1161
[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/bus/mhi?h=v5.11-rc7&id=a7f422f2f89e7d48aa66e6488444a4c7f01269d5
[3] https://lkml.org/lkml/2021/2/4/1155

---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
