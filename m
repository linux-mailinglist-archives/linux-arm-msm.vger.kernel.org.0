Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A31CB315E3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 05:38:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbhBJEiJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 23:38:09 -0500
Received: from mail29.static.mailgun.info ([104.130.122.29]:46835 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230239AbhBJEiJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 23:38:09 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612931868; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=N3xnd6tq+GFGxbplmh9oJkDWRssF3z3HwqbOit9w3xA=;
 b=IvCeyd80IAMbxAPd0bLcGSssG8ob5VI/ykPIBzdsyTqVkBYGnKLWlpIIraUPpLmHLYJPtVqN
 u1k9mySHlNmrMLgV7xApMnpdfPwJd+lOBRgMUOnZ9lCKajyGGVOD4M9eMIOX6eqF9hsNQ1nT
 XiwnhlkQ28JUGGdmiizJ8k0Cq8I=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 602363033919dfb455a76aba (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Feb 2021 04:37:23
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 412CDC433C6; Wed, 10 Feb 2021 04:37:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7B767C433CA;
        Wed, 10 Feb 2021 04:37:21 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 09 Feb 2021 20:37:21 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] mhi: Fix double dma free
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <CAMZdPi-3PBGLE7KYoSkKWOT7YrbrpA70NRJo2Lrc-MQr=oKUyg@mail.gmail.com>
References: <1612885989-12288-1-git-send-email-loic.poulain@linaro.org>
 <f2612a01-2c10-9735-d4ba-46ea87c70379@codeaurora.org>
 <CAMZdPi_16SfDoYC0vqqhRfEOqn3SHc6EUmfpVz0RRLaGek7_PQ@mail.gmail.com>
 <7a641d95c2e8c74c7dfc537c74a7ae1a@codeaurora.org>
 <CAMZdPi-3PBGLE7KYoSkKWOT7YrbrpA70NRJo2Lrc-MQr=oKUyg@mail.gmail.com>
Message-ID: <9916d2b982f8ad407c7d5297da7d946d@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic, Mani, Hemant,

On 2021-02-09 10:17 AM, Loic Poulain wrote:
> Hi Bhaumik,
> 
> On Tue, 9 Feb 2021 at 18:27, Bhaumik Bhatt <bbhatt@codeaurora.org> 
> wrote:
>> 
>> On 2021-02-09 08:06 AM, Loic Poulain wrote:
>> > On Tue, 9 Feb 2021 at 16:55, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>> >>
>> >> On 2/9/2021 8:53 AM, Loic Poulain wrote:
>> >> > mhi_deinit_chan_ctxt functionthat takes care of unitializing channel
>> >> > resources, including unmapping coherent MHI areas, can be called
>> >> > from different path in case of controller unregistering/removal:
>> >> >   - From a client driver remove callback, via mhi_unprepare_channel
>> >> >   - From mhi_driver_remove that unitialize all channels
>> >> >
>> >> > mhi_driver_remove()
>> >> > |-> driver->remove()
>> >> > |    |-> mhi_unprepare_channel()
>> >> > |        |-> mhi_deinit_chan_ctxt()
>> >> > |...
>> >> > |-> mhi_deinit_chan_ctxt()
>> >> >
>> >> > This leads to double dma freeing...
>> >> >
>> >> > Fix that by preventing deinit for already uninitialized channel.
>> >> >
>> >> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>> >> > Reported-by: Kalle Valo <kvalo@codeaurora.org>
>> >> > ---
>> >>
>> >> Seems like this should have a Fixes: tag, no?
>> >
>> > Right, thanks, i'll add it in V2 once I get feedback.
>> 
>> Hi Loic, Mani,
>> 
>> I saw this same issue a while back but could not collect the logs for
>> it.
>> 
>> I had already pushed a patch to fix this differently [1] which was
>> recently reviewed by Hemant.
>> 
>> Although there wasn't a purposeful fixes tag for it. I think the 
>> culprit
>> for this issue is [2]:
>> 
>> As it allows the unprepare to go through on remove(), which was
>> traditionally not allowed and
>> ends up uncovering this issue as it fixes another.
>> 
>> Channel updates [3] address that and provide a bunch of other
>> improvements. Please consider them.
> 
> Yes, patch [2] is the culprit. I would recommend merging this tiny fix
> so that it can be easily grab for 5.11 or backported, and keep your
> series (rebased on top), for mhi-next (going to review/test it btw).
> 
> Regards,
> Loic

If priority is to get this fix in ASAP, your suggestion is OK. I just 
see some
typo fixes and a title update to "bus: mhi: core: Fix double dma free() 
call"
or something as review comments for your patch.

Another option is that I can send my patch [1] separately and remove it 
from my
"channel updates" patch series, if that helps.

I'd like to see what Mani and Hemant on what they prefer. Please advise.

Thanks,
Bhaumik

[1] https://lkml.org/lkml/2021/2/4/1161

---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
