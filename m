Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC1938CE55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 21:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbhEUTrN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 15:47:13 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:33643 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229517AbhEUTrN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 15:47:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621626349; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=zFQeR15yIV/MRBDjlnj5bg2b1g+GsEMnzWlVJyF+4vU=;
 b=XWzP9idNKLzoJ8X12Kp6TdZgnXQljMzBqJZh0TjYyx3M7otOi/RLkH8ODbEfPrA/OUB05YfN
 x+IUsnAGCSSShuqcUgJ0bWNDm/MDxDjY3B6KBYUWZkyJg3hA5reo7WzrRXy05qV+npxSIHbg
 WKObkkOqfpjyBMVXPfAcujXhIVk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60a80de0c229adfeff6ea01c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 21 May 2021 19:45:36
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CB70AC4323A; Fri, 21 May 2021 19:45:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3AA00C4338A;
        Fri, 21 May 2021 19:45:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 21 May 2021 12:45:35 -0700
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robdclark@gmail.com,
        sean@poorly.run, vkoul@kernel.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] drm/msm/dp: handle irq_hpd with sink_count = 0
 correctly
In-Reply-To: <CAE-0n50BOV6UofBzqqb+KzcOR7W=h3VD2g4CzeqB6+a0v-aZUQ@mail.gmail.com>
References: <1621013713-6860-1-git-send-email-khsieh@codeaurora.org>
 <c1a3ced9ac4682bae310712a11576322@codeaurora.org>
 <CAE-0n50yRCA00ck_FtXwzKw_R8UcocMzTh8V7NOe4ob__3G3bg@mail.gmail.com>
 <e071434531947e5c4275a1a14b77b2c3@codeaurora.org>
 <CAE-0n52rBrjy-=dpqK+dae2GNk1rAaQnKqCjzdqiAoS13gHpSQ@mail.gmail.com>
 <f476d82d0798e0d7eb9e12949aa2c8f1@codeaurora.org>
 <CAE-0n51+mbCAqWWTOMDA4Rx_=96V4tK8g+UWVZ-nnp50dFzRPA@mail.gmail.com>
 <5d341df202facb3240a72cfb35e18167@codeaurora.org>
 <CAE-0n50u-qGvqzJThc+ggghv6ZErPr8g8dhvgequBm5CWOR2Kw@mail.gmail.com>
 <1e9970ee1a7109e336bc6ed51e727442@codeaurora.org>
 <CAE-0n50BOV6UofBzqqb+KzcOR7W=h3VD2g4CzeqB6+a0v-aZUQ@mail.gmail.com>
Message-ID: <fc6542f2e760fa92aef73fdb9a789b2d@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-21 12:18, Stephen Boyd wrote:
> Quoting khsieh@codeaurora.org (2021-05-21 08:21:58)
>> >
>> > Ok. So you're saying that we want to put both events on the queue
>> > regardless, and put IRQ_HPD there first because we want to check the
>> > status bit? Doesn't reading the status bit require the dongle to be
>> > connected though? So if an unplug came in along with an irq_hpd we may
>> > queue both the irq_hpd and the unplug, but when it comes time to
>> > process
>> > the irq_hpd in the kthread the link will be gone and so trying the dpcd
>> > read for the link status will fail?
>> >
>> yes,
>> we had a previous bug with this scenarios already.
>> https://partnerissuetracker.corp.google.com/issues/170598152
>> At this case, dongle produce two interrupts, irq_hpd followed by 
>> unplug
>> immediately (not presented at isr status register at same time), at 
>> the
>> time dongle unplugged form DTU.
>> But due to dp ctrl reset at handling irq_hpd which cause unplug mask 
>> bit
>> be cleared so that unplug interrupt got lost.
>> 
> 
> Again, wouldn't that be too late if the hardirq handler is delayed to
> the point that the two irqs are pending in the isr status register?

yes,
but that not much dp driver can do.
As long as DP driver can recovery (shut down gracefully) and ready for 
next plugin, then i think it should be fine.


