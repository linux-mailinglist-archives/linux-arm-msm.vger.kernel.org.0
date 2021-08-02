Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE6B3DDD44
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Aug 2021 18:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232127AbhHBQKy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 12:10:54 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:49240 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229946AbhHBQKy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 12:10:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627920644; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=RcmCVefjMH6l9oNkIcTgBxKj15suM9Nyc7u4Bfq5P6s=;
 b=AU+Pefk8LNRWkvMqTIxyGXqvUxP5gM7aYdjjoLVm8/4U59bVqmVzOj33fftUZRp3Jx8iaxT0
 BXGc4u5qEbHTCpz2w4ZC+gn3ItFG6/DvlQoG+Jct9u9sHCg++F4ua0ta53ZIkgrID5YZdtzy
 ewAh8KXybix6+EQY3aG0Chp7QSs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 610818e117c2b4047dcb83d8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 02 Aug 2021 16:10:09
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9181FC43217; Mon,  2 Aug 2021 16:10:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 436C1C433D3;
        Mon,  2 Aug 2021 16:10:06 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 02 Aug 2021 09:10:06 -0700
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robdclark@gmail.com,
        sean@poorly.run, vkoul@kernel.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: update is_connected status base on sink count
 at dp_pm_resume()
In-Reply-To: <CAE-0n51cNywB2ThQxqS4iX-d7wR+rYXt8P33o9cUq9J6tT915A@mail.gmail.com>
References: <1627507854-16733-1-git-send-email-khsieh@codeaurora.org>
 <CAE-0n51cNywB2ThQxqS4iX-d7wR+rYXt8P33o9cUq9J6tT915A@mail.gmail.com>
Message-ID: <781ad3c4973b3f8dd83933a451b266b9@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-30 11:57, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-07-28 14:30:54)
>> Currently at dp_pm_resume() is_connected state is decided base on hpd 
>> connection
>> status only. This will put is_connected in wrongly "true" state at the 
>> scenario
>> that dongle attached to DUT but without hmdi cable connecting to it. 
>> Fix this
>> problem by adding read sink count from dongle and decided is_connected 
>> state base
>> on both sink count and hpd connection status.
>> 
> 
> Please add a Fixes tag.
> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_display.c | 23 +++++++++++++++++++++--
>>  1 file changed, 21 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 2b660e9..9bcb261 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1308,6 +1308,17 @@ static int dp_display_remove(struct 
>> platform_device *pdev)
>>         return 0;
>>  }
>> 
>> +static int dp_get_sink_count(struct dp_display_private *dp)
>> +{
>> +       u8 sink_count;
>> +
>> +       sink_count = drm_dp_read_sink_count(dp->aux);
> 
> drm_dp_read_sink_count() returns an int, not a u8. Comparing a u8 to
> less than zero doesn't make any sense as it isn't signed.
> 
>> +       if (sink_count < 0)
>> +               return 0;
>> +
>> +       return sink_count;
>> +}
> 
> We can drop this function and just have an int count in dp_pm_resume()
> that is compared to < 0 and then ignored.
> 
>> +
>>  static int dp_pm_resume(struct device *dev)
>>  {
>>         struct platform_device *pdev = to_platform_device(dev);
>> @@ -1327,14 +1338,22 @@ static int dp_pm_resume(struct device *dev)
>> 
>>         dp_catalog_ctrl_hpd_config(dp->catalog);
>> 
>> -       status = dp_catalog_link_is_connected(dp->catalog);
>> +       /*
>> +        * set sink to normal operation mode -- D0
>> +        * before dpcd read
>> +        */
>> +       dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>> 
>> +       if ((status = dp_catalog_link_is_connected(dp->catalog)))
>> +               dp->link->sink_count = dp_get_sink_count(dp);
> 
> Do we need to call drm_dp_read_sink_count_cap() as well?
no, we only need sink_count
> 
>> +       else
>> +               dp->link->sink_count = 0;
>>         /*
>>          * can not declared display is connected unless
>>          * HDMI cable is plugged in and sink_count of
>>          * dongle become 1
>>          */
>> -       if (status && dp->link->sink_count)
> 
> Is 'status' used anymore? If not, please remove it.
Yes, it still used which used to decided to perform dpcd read sink count 
or not
> 
>> +       if (dp->link->sink_count)
>>                 dp->dp_display.is_connected = true;
>>         else
>>                 dp->dp_display.is_connected = false;
