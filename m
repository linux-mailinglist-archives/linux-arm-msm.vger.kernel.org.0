Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A48C440124
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 19:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbhJ2RXR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 13:23:17 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:41141 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbhJ2RXO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 13:23:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635528046; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=4HPL9sczbdymRv+oWzyjAE0VxVTQXhBhxNzHHsXiKw0=;
 b=hj+3sS8Pk6kzlucZVnBsgk7EWpjpuDvM+q6N/K7IU1EMSuDaUapBnKdZERj0Lps5YIxhusCk
 4pfSTTDa6xoUnntlZav36qiZw1YB535Bxf0qJlrItAe1JZeyey6ZupfdZr4E7GZIRJmJAmHT
 Xait4/fz1kMxyAup9igqlze4eBw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 617c2d5ec8c1b282a595d8f7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 29 Oct 2021 17:20:30
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 59D3DC43616; Fri, 29 Oct 2021 17:20:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8BE25C4338F;
        Fri, 29 Oct 2021 17:20:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 29 Oct 2021 10:20:28 -0700
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robdclark@gmail.com, seanpaul@chromium.org,
        kalyan_t@codeaurora.org, abhinavk@codeaurora.org,
        dianders@chromium.org, mkrishn@codeaurora.org,
        sbillaka@codeaurora.org
Subject: Re: [PATCH v3 6/6] drm/msm/dp: Remove the hpd init delay for eDP
In-Reply-To: <CAE-0n50YcX6sCoTR0bUy_GrZM7=UdHPAGYNwE3Nvj6GL4iTmMg@mail.gmail.com>
References: <1635386088-18089-1-git-send-email-quic_sbillaka@quicinc.com>
 <1635386088-18089-7-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n50YcX6sCoTR0bUy_GrZM7=UdHPAGYNwE3Nvj6GL4iTmMg@mail.gmail.com>
Message-ID: <d04f4082266e599cbba458d5e39e75e9@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-10-27 23:38, Stephen Boyd wrote:
> Quoting Sankeerth Billakanti (2021-10-27 18:54:48)
>> DP driver needs a 10 second delay before phy_init so that
>> the usb combo phy initializes and sets up the necessary
>> clocks for usb devices such as keyboard and mouse.
>> 
>> eDP controller uses a standalone phy and need not wait for
>> phy initialization from any other component. This change
>> will remove the delay for eDP controller.
>> 
>> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_display.c | 11 ++++++++++-
>>  1 file changed, 10 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 61385d6..de6a1fd 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1438,7 +1439,15 @@ void msm_dp_irq_postinstall(struct msm_dp 
>> *dp_display)
>> 
>>         dp_hpd_event_setup(dp);
>> 
>> -       dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
>> +       if (dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP) {
>> +               /* eDP does not need any delay before phy init */
>> +               delay = 0;
>> +       } else {
>> +               /* DP needs 10 second delay to let usb combo phy 
>> initialize */
> 
> This seems to be a different approach to the patch Kuogee sent a week 
> or
> two ago. Can we figure out what's wrong with the DP phy starting before
> the USB phy? I suppose this patch is OK as a temporary hack to keep
> moving with eDP, but we really need to figure out what's wrong with DP
> so this delay can be removed entirely. Has any progress been made on
> that?
> 
Sankeerth,
Can you drop this patch for now.
Let's discuss more.

>> +               delay = 100;
>> +       }
>> +
>> +       dp_add_event(dp, EV_HPD_INIT_SETUP, 0, delay);
