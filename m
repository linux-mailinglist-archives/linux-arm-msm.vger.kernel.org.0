Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9369B3E83C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 21:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232664AbhHJTbR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 15:31:17 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:54571 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231143AbhHJTbR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 15:31:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628623855; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=yEtLPU+7rsrGp6+MiBeIiNEocUtKpTm9TPGhXhGZqwg=;
 b=JIbbpeYlhmwcdJv7OMuY6CBy/uHRPN/k61ifFyi+2Hqvwp91xZWiU2VnBnPGNskfu+qMCpQ3
 lZ9RYXI5hB52PqTvJZgXzoeJg/Y2zypYTwbqdZShZhEhBqxuMrTAQ6uI7rPsTbIHZVe1msfV
 4ffNb/Z8bM8Lc2LS22m+uGpRsw0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6112d3c7f746c298d95e5b67 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Aug 2021 19:30:15
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5C04FC43460; Tue, 10 Aug 2021 19:30:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A88D1C433D3;
        Tue, 10 Aug 2021 19:30:12 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 10 Aug 2021 12:30:12 -0700
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robdclark@gmail.com,
        sean@poorly.run, vkoul@kernel.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dp: add drm debug logs to dp_pm_resume/suspend
In-Reply-To: <CAE-0n51NsjfT62anGiQ7FaBgs=bThVq89j3UMp4rNj9raGkwOw@mail.gmail.com>
References: <1628609362-2109-1-git-send-email-khsieh@codeaurora.org>
 <CAE-0n52a8i-2oNxtqKaS+XGBE0+wcp0Jx05VgL2KnHoQLW-vDQ@mail.gmail.com>
 <abd00c9d395473875c31379ca0288116@codeaurora.org>
 <CAE-0n51NsjfT62anGiQ7FaBgs=bThVq89j3UMp4rNj9raGkwOw@mail.gmail.com>
Message-ID: <fb5fb363e91fd70236674de8b6f3cf88@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-10 12:23, Stephen Boyd wrote:
> Quoting khsieh@codeaurora.org (2021-08-10 12:18:02)
>> On 2021-08-10 11:33, Stephen Boyd wrote:
>> > Quoting Kuogee Hsieh (2021-08-10 08:29:22)
>> >> Changes in V2:
>> >> -- correct Fixes text
>> >> -- drop commit text
>> >>
>> >> Fixes: 601f0479c583 ("drm/msm/dp: add logs across DP driver for ease
>> >> of debugging")
>> >> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> >> ---
>> >>  drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++++++++++
>> >>  1 file changed, 13 insertions(+)
>> >
>> > BTW, this conflicts with commit
>> > e8a767e04dbc7b201cb17ab99dca723a3488b6d4
>> > in msm-next. The resolution is trivial but just wanted to mention it.
>> 
>> I Just fetched msm-next and cherry-pick this patch over, no conflict
>> seen.
>> Is this conflict need to be fixed?
>> 
> 
> Oh sorry, I mean commit afc9b8b6bab8 ("drm/msm/dp: signal audio plugged
> change at dp_pm_resume") which doesn't seem to be in msm-next. Maybe 
> Rob
> will resolve the conflict directly.
Yes, I just found that  commit afc9b8b6bab8 ("drm/msm/dp: signal audio 
plugged
> change at dp_pm_resume") is not merged in msm-next.
