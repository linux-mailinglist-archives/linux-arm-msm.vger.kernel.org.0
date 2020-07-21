Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF6D228A77
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 23:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731171AbgGUVPr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 17:15:47 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:33581 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728195AbgGUVPr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 17:15:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595366146; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=QIFHHn9Bz6CS1awEQLVI1+5x4m0PpVAHkNs3N45sppE=;
 b=KIm+nGNTKcxf4xWvJiDsY79FRqRF0Gg/CDlnQh9N5UzXhwmkjKvN2Elz+DUqLTyznXuadlRz
 7motFNG+4aa25dvI+e/6zDgQdDwrxO5dPTPYX9PfRJ+U+QqVRDKXhmH3CL0lP3B2AEJ4j7Ps
 o9uRSCVzjfHk8VK1HRYPiIVg5/Y=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f175af98423214e13d2f122 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Jul 2020 21:15:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4F19DC43391; Tue, 21 Jul 2020 21:15:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9FDE8C433C6;
        Tue, 21 Jul 2020 21:15:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 21 Jul 2020 14:15:35 -0700
From:   khsieh@codeaurora.org
To:     Rob Clark <robdclark@gmail.com>
Cc:     Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        aravindh@codeaurora.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/dp: Add DP compliance tests on Snapdragon
 Chipsets
In-Reply-To: <CAF6AEGs0+=tpOWtY0kUc=Vt7EdEEwQjEffMXxFtDo142gRYRhQ@mail.gmail.com>
References: <20200707184125.15114-1-khsieh@codeaurora.org>
 <159527632812.1987609.6364896740387949838@swboyd.mtv.corp.google.com>
 <91a8eef836c1939cb57942c6fdcf2772@codeaurora.org>
 <159528794676.3847286.1584696687662833591@swboyd.mtv.corp.google.com>
 <CAF6AEGs0+=tpOWtY0kUc=Vt7EdEEwQjEffMXxFtDo142gRYRhQ@mail.gmail.com>
Message-ID: <9fa6328419fa5ddcca856d3c505394f8@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-07-20 19:57, Rob Clark wrote:
> On Mon, Jul 20, 2020 at 4:32 PM Stephen Boyd <swboyd@chromium.org> 
> wrote:
>> 
>> Quoting khsieh@codeaurora.org (2020-07-20 15:48:13)
>> > On 2020-07-20 13:18, Stephen Boyd wrote:
>> > > Quoting Kuogee Hsieh (2020-07-07 11:41:25)
>> > >>  drivers/gpu/drm/msm/dp/dp_power.c           |  32 +-
>> > >>  drivers/gpu/drm/msm/dp/dp_power.h           |   1 +
>> > >>  drivers/gpu/drm/msm/dp/dp_reg.h             |   1 +
>> > >>  17 files changed, 861 insertions(+), 424 deletions(-)
>> > >
>> > > It seems to spread various changes throughout the DP bits and only has
>> > > a
>> > > short description about what's changing. Given that the series above
>> > > isn't merged it would be better to get rid of this change and make the
>> > > changes in the patches that introduce these files.
>> > >
>> >
>> > Yes, the base DP driver is not yet merged as its still in reviews and
>> > has been for a while.
>> > While it is being reviewed, different developers are working on
>> > different aspects of DP such as base DP driver, DP compliance, audio etc
>> > to keep things going in parallel.
>> > To maintain the authorship of the different developers, we prefer having
>> > them as separate changes and not merge them.
>> > We can make all these changes as part of the same series if that shall
>> > help to keep things together but would prefer the changes themselves to
>> > be separate.
>> > Please consider this and let us know if that works.
>> >
>> 
>> I'm not the maintainer here so it's not really up to me, but this is 
>> why
>> we have the Co-developed-by tag, to show that multiple people worked 
>> on
>> some patch. The patch is supposed to logically stand on its own
>> regardless of how many people worked on it. Authorship is a single
>> person but the Co-developed-by tag helps express that more than one
>> person is the actual author of the patch. Can you use that tag instead
>> and then squash this into the other DP patches?
> 
> The dpu mega-patches are hard enough to review already.. I'd really
> appreciated it if the dpu dev's sort out some way to squash later
> fixups into earlier patches
> 
> BR,
> -R
as per discussion on IRC, I have separated the parts of this change 
which are
unrelated to compliance and we have merged it to the base DP driver and 
added
the Co-developed-by tag there. Since this change adds supports for DP 
compliance
on MSM chipsets which is a new feature and not fixes to the base driver, 
we will
prefer to have this as a separate change as it will make it easier for 
you to
review it instead of continuing to expand the base DP driver
