Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AC2D2A4C2A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 18:02:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727999AbgKCRCl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 12:02:41 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:40877 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727971AbgKCRCl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 12:02:41 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604422960; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=FOhbWz4gRfs3rCg5R5uOtLqn0IGJgDb4wNO+hqzeXBk=;
 b=M1hsDnsglsxJsGGQMsGlSbyVTmEi+RYUhcpryyMV59UjDnd+EvwHgFpVDbZ664yi+bargdlF
 WCil4xUjCxCD742YTuwjRwaUHAE0enMxfLpKNZJWxckQ7t3wn271sa/vrlzjalFUd5bX5pC/
 E9fnWmfT4gllnZM1/iTj/WfxZGQ=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5fa18d2db79ce7b2cd1bdd2b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Nov 2020 17:02:37
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 00D8DC433FE; Tue,  3 Nov 2020 17:02:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 079D6C433C8;
        Tue,  3 Nov 2020 17:02:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 03 Nov 2020 09:02:35 -0800
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     robdclark@gmail.com, sean@poorly.run, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, aravindh@codeaurora.org,
        rnayak@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: promote irq_hpd handle to handle link
 trainign correctly
In-Reply-To: <160434536802.884498.16389146296525781476@swboyd.mtv.corp.google.com>
References: <20201030232324.11170-1-khsieh@codeaurora.org>
 <160434536802.884498.16389146296525781476@swboyd.mtv.corp.google.com>
Message-ID: <2e63aa17a3b81f452b972160365b1f64@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-02 11:29, Stephen Boyd wrote:
> Subject has a typo in "training".
> 
> Quoting Kuogee Hsieh (2020-10-30 16:23:24)
>> Some dongles, such as Apple, required link training done at irq_hpd
> 
> s/required/require/
> 
>> request instead of plugin request. This patch promote irq_hpd hanlder
> 
> s/hanlder/handler/
> 
>> to handle link training and setup hpd_state correctly.
>> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> ---
> 
> Any Fixes tag?
> 
>>  drivers/gpu/drm/msm/dp/dp_display.c | 20 ++++++++++++++++++--
>>  1 file changed, 18 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 13b66266cd69..55627530957c 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -483,10 +485,24 @@ static int dp_display_usbpd_attention_cb(struct 
>> device *dev)
>>                 return -ENODEV;
>>         }
>> 
>> +       hpd = dp->usbpd;
>> +
>>         /* check for any test request issued by sink */
>>         rc = dp_link_process_request(dp->link);
>> -       if (!rc)
>> -               dp_display_handle_irq_hpd(dp);
>> +       if (!rc) {
>> +               sink_request = dp->link->sink_request;
>> +               if (sink_request & DS_PORT_STATUS_CHANGED) {
>> +                       dp->hpd_state = ST_CONNECT_PENDING;
>> +                       hpd->hpd_high = 1;
>> +               }
>> +
>> +               rc = dp_display_handle_irq_hpd(dp);
>> +
>> +               if (rc && sink_request & DS_PORT_STATUS_CHANGED) {
> 
> Can you add parenthesis around this?
> 
> 		if (rc && (sink_request & DS_PORT_STATUS_CHANGED)) {
> 
> 
> I honestly don't know what's going on in this patch. It talks about
> making link training happen during irq hpd handler but this is the
> attention handler and we're checking port status changed? This is
> related? The code is really not clear.
irq_hpd request is generated by sinker to ask host attention that 
something has changed.
POST_STATUS_CHNAGED bit set  by sinker to indicated link had loss of 
sync. Therefore
host need to restart link retaining to fix the link loss of sync 
problem.

> 
>> +                       hpd->hpd_high = 0;
>> +                       dp->hpd_state = ST_DISCONNECTED;
>> +               }
>> +       }
>> 
>>         return rc;
>>  }
>> 
>> base-commit: 0e162b10644605428cd2596c12f8ed410cf9d2d9
> 
> What commit is this?
