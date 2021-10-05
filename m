Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 184EA423412
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 01:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236902AbhJEXGz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 19:06:55 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:16356 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236909AbhJEXGy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 19:06:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633475103; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=uG0DDsxj9ZrKdIW3DNhGgroyzNQbGUiq4kmEFJgIQnA=;
 b=fKprs+nUSf0R3EDpBLP40YtpGdQ3wScTh2IjTcpCSK55CIQDQSblnyQxG0fZtac1Il7ipOvI
 7QPwsUacEVquIR1IcvHuq0fcWD+0GDVltLeFmkLOa5CJOuX1IXMM1KqxvflAASGvSMqNNTEI
 4CjPkOFROuz9CQIoP7iBXkoYQHc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 615cda0b003e680efb14b9e0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 23:04:43
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3C90BC4360D; Tue,  5 Oct 2021 23:04:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5212FC4338F;
        Tue,  5 Oct 2021 23:04:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 05 Oct 2021 16:04:40 -0700
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Sankeerth Billakanti <sbillaka@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: Shorten SETUP timeout
In-Reply-To: <CAE-0n53FC7JCCJoye_uKeqaLKrZeHXLtvObxWFedaUzjirmBaA@mail.gmail.com>
References: <20211005023750.2037631-1-bjorn.andersson@linaro.org>
 <CAE-0n52wN1s=Ph4r4iLposxNPfa562Bv1mM81j1KvNmWOQS1-Q@mail.gmail.com>
 <YVzGVmJXEDH0HfIL@ripper>
 <CAE-0n53FC7JCCJoye_uKeqaLKrZeHXLtvObxWFedaUzjirmBaA@mail.gmail.com>
Message-ID: <a4a4980e586a70e3b7de989bc61a3e33@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-10-05 15:36, Stephen Boyd wrote:
> Quoting Bjorn Andersson (2021-10-05 14:40:38)
>> On Tue 05 Oct 11:45 PDT 2021, Stephen Boyd wrote:
>> 
>> > Quoting Bjorn Andersson (2021-10-04 19:37:50)
>> > > Found in the middle of a patch from Sankeerth was the reduction of the
>> > > INIT_SETUP timeout from 10s to 100ms. Upon INIT_SETUP timeout the host
>> > > is initalized and HPD interrupt start to be serviced, so in the case of
>> > > eDP this reduction improves the user experience dramatically - i.e.
>> > > removes 9.9s of bland screen time at boot.
>> > >
>> > > Suggested-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
>> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> > > ---
>> >
>> > Any Fixes tag? BTW, the delay design is pretty convoluted. I had to go
>> > re-read the code a couple times to understand that it's waiting 100ms
>> > times the 'delay' number. Whaaaaat?
>> >
>> 
>> I assume you're happy with the current 10s delay on the current
>> devices, so I don't think we should push for this to be backported.
>> I have no need for it to be backported on my side at least.
>> 
> 
> Sure. Fixes tag != backported to stable trees but it is close.
> 
>> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>> 
   dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 1); <== to 100ms

This patch will prevent usb3 from working due to dp driver initialize 
phy earlier than usb3 which cause timeout error at power up usb3 phy 
when both edp and dp are enabled.
I had prepared a patch (drm/msm/dp: do not initialize combo phy until 
plugin interrupt) to fix this problem.
Unfortunately, my patch is depend on Bjorn's patch (PATCH v3 3/5] 
drm/msm/dp: Support up to 3 DP controllers).
I will submit my patch for review once Bjorn's patches merged in.
Therefore I would think this patch should go after both Bjorn's patches 
and my patch.



