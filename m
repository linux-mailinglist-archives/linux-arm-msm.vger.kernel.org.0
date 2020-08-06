Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0040B23DED8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Aug 2020 19:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730267AbgHFRdJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Aug 2020 13:33:09 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:60185 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730496AbgHFRdI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Aug 2020 13:33:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596735186; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=KzVFweAIS+EhIpI7ual5fLSHmD+4lkv/Udm9Snff2TA=;
 b=kEmZwxzB651AgGzR7XIzXO2/8lAYJkqbFYX976ClqaViih6s8pj5JkhpuWF1vFxBZVc/wXv1
 BhzjVgu5DzpqDVZCkpN1elaSm3hrUmuLi2GucFTQOXxVTTbu5msT2y2jL8dOHJlW4MX/QJCf
 JVvPENRKQuOWZDanKdnH/gLnWHI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f2c3ed0d5b453ea40097d63 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 Aug 2020 17:33:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1375AC433A0; Thu,  6 Aug 2020 17:33:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 25B06C43391;
        Thu,  6 Aug 2020 17:33:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 06 Aug 2020 23:03:03 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alex Elder <elder@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] soc: qcom: aoss: Don't wait for IRQ if we might be in
 suspend/resume noirq
In-Reply-To: <CAD=FV=Xmf5Qj8obuKdE5CqYL7ek7CQQLPt4j4eTu=RpwcDwM2w@mail.gmail.com>
References: <20200805091141.1.I86b3faaecb0d82997b599b1300f879606c71e116@changeid>
 <159664899840.1360974.7548807728313161626@swboyd.mtv.corp.google.com>
 <CAD=FV=UK+xHV6qsr2AsPB=BzmzN77AT-du8G2tt1QZMQUpGgKg@mail.gmail.com>
 <159666852526.1360974.3062132560884413001@swboyd.mtv.corp.google.com>
 <4c40db0fe88dd9aff6897ebc103aa3e9@codeaurora.org>
 <CAD=FV=Xmf5Qj8obuKdE5CqYL7ek7CQQLPt4j4eTu=RpwcDwM2w@mail.gmail.com>
Message-ID: <8450aff2d16aed092295c61a8e4ca850@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-06 22:40, Doug Anderson wrote:
> Hi,
> 
> On Thu, Aug 6, 2020 at 7:36 AM Sibi Sankar <sibis@codeaurora.org> 
> wrote:
>> 
>> On 2020-08-06 04:32, Stephen Boyd wrote:
>> > +Sibi who wrote the code
>> >
>> > Quoting Doug Anderson (2020-08-05 13:24:06)
>> >>
>> >> On Wed, Aug 5, 2020 at 10:36 AM Stephen Boyd <swboyd@chromium.org>
>> >> wrote:
>> >> >
>> >> > Why is the genpd being powered off at all? It looks like the driver is
>> >> > written in a way that it doesn't expect this to happen. See where
>> >> > adsp_pds_disable() is called from. Looks like the remoteproc "stop"
>> >> > callback should be called or the driver should be detached.
>> >> >
>> >> > It sort of looks like the genpd is expected to be at the max level all
>> >> > the time (it sets INT_MAX in adsp_pds_enable(), cool).
>> >>
>> >> In general in Linux there are some things that, at suspend time, get
>> >> done behind a driver's back.  The regulator API, for instance, allows
>> >> for regulators to be turned off in suspend even if a driver leaves
>> >> them on.  Sure, it's good practice for a driver to be explicit but the
>> >> regulator suspend states do allow for the more heavy-handed approach.
>> >>
>> >> I guess I assume that genpd is a bit similar.  If a driver leaves a
>> >> genpd on all the time then it will still be turned off at suspend time
>> >> and then turned back on at resume time.  It seems like it must be part
>> >> of the genpd API.  Specifically genpd_sync_power_off() says: "Check if
>> >> the given PM domain can be powered off (during system suspend or
>> >> hibernation) and do that if so."  That makes it seem like it's how
>> >> genpd works.
>> >>
>> >> Reading all the descriptions of things like GENPD_FLAG_ALWAYS_ON,
>> >> GENPD_FLAG_ACTIVE_WAKEUP, GENPD_FLAG_RPM_ALWAYS_ON makes me even more
>> >> convinced that it's normal (unless otherwise specified) for genpds to
>> >> get turned off in suspend even if a driver just blindly left them on.
>> >>
>> >> Presumably if this "modem" genpd is supposed to stay on in suspend
>> >> time it should have been marked "always on"?  I'd guess we'd need to
>> >> add "GENPD_FLAG_ALWAYS_ON" in some (or all?) cases in qmp_pd_add() if
>> >> this was true?
>> >
>> > Agreed. I can't read the mind of Sibi so I can only guess that Sibi
>> > wasn't expecting this behavior by reading the driver structure. That
>> > could be a wrong assumption.
>> >
>> >>
>> >>
>> >> > Maybe we need to
>> >> > add some sort of suspend hooks to the remote proc driver instead? Where
>> >> > those suspend hooks are called earlier and drop the genpd performance
>> >> > state request but otherwise leave it enabled across suspend?
>> >>
>> >> I think you're saying:
>> >>
>> >> a) You think it's a bug today that the "modem" genpd is being powered
>> >> off in suspend.  Any evidence to back this up?
>> >>
>> >> b) Assuming it's a bug today, we should mark the "modem" as
>> >> GENPD_FLAG_ALWAYS_ON.
>> >>
>> >> c) If there are genpds that sometimes should be left on in suspend but
>> >> sometimes not (and that doesn't match up with what
>> >> GENPD_FLAG_ACTIVE_WAKEUP does), then we'd have to pass
>> >> GENPD_FLAG_ALWAYS_ON as a flag and then add suspend hooks to make the
>> >> decision for us.
>> 
>> Doug/Stephen,
>> 
>> Yes this is a bug, we wouldn't want
>> to disable aoss_qmp genpd for modem
>> during suspend (when the modem is
>> running). The qmp send for modem
>> is the primary means through which
>> aoss determines whether to wait for
>> modem before proceeding to sleep. So
>> looks like updating the flag with
>> GENPD_FLAG_ACTIVE_WAKEUP is the way
>> to go. But introducing another flag
>> that doesn't touch genpd's during
>> suspend/resume should also work.
> 
> OK, sounds good.  As per out-of-band conversation:
> 
> * You'll plan to post a patch updating the flag.
> 
> * There's still nothing here that says my patch is the wrong thing to
> do also.  It seems like genpd poweroff routine are expected to be able
> to run at "noirq" time so we should make sure we are able to do that.
> 
> I'm also curious: my patch doesn't affect the behavior.  The genpd
> would be powered off with or without my patch, my patch just removes a
> pointless 1 second delay.  Therefore I guess today there is some type
> of bug because the genpd is being turned off.  What would be the
> visible impact of that bug?  ...or is it somehow masked by something
> else keeping this power on so it wasn't an issue right now?

I've been told AOSS decides to wait
for modem suspend if its been notified
that modem is on through qmp_send. AFAIK
we never ran into this because AOSS sleep
sequence starts after xo-shutdown which
wont be reached in the presence of active
rpmh votes from modem.

Regardless we definitely want this genpd left
untouched during suspend/resume.

> 
> -Doug
> 
> 
> -Doug

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
