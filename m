Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 324D43D1989
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 00:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbhGUVV0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 17:21:26 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:41435 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbhGUVV0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 17:21:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626904922; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=7vRGE34N61OuHbeVIFZohOnu8Yd2PzAcJNw5QsqFPog=;
 b=RIXXyYLzibNEhLlIw2hvaofT8D+PkAhMPgK8A2lWdLW664iicCE6T/O39QWtBx2BG1FS4JxH
 q5LONkZuaWi1BD+PEdzNq1QD20SAgFsOhVV0EhaRCSfQafjGmtOejcvECzCcccH112FeG/qC
 IJ7OSvgAV4dsFfC0nJV0+VtbsQ4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60f8991e290ea35ee65f6568 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 22:01:02
 GMT
Sender: maitreye=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A7B1AC43460; Wed, 21 Jul 2021 22:01:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: maitreye)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 15032C4338A;
        Wed, 21 Jul 2021 22:01:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 21 Jul 2021 15:01:00 -0700
From:   maitreye@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        abhinavk@codeaurora.org, khsieh@codeaurora.org,
        seanpaul@chromium.org, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/msm/dp: add logs across DP driver for ease of
 debugging
In-Reply-To: <CAE-0n52+E0eTgK_4x3OVnqv+U_12tMqxZYtcu3t+FiCJeaq2_g@mail.gmail.com>
References: <1626820770-28158-1-git-send-email-maitreye@codeaurora.org>
 <CAE-0n52+E0eTgK_4x3OVnqv+U_12tMqxZYtcu3t+FiCJeaq2_g@mail.gmail.com>
Message-ID: <d4daea9cdacc8a5544cefde5b64fdb78@codeaurora.org>
X-Sender: maitreye@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Stephen,
Thanks again for the review comments



On 2021-07-20 22:31, Stephen Boyd wrote:
> Quoting maitreye (2021-07-20 15:39:30)
>> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c 
>> b/drivers/gpu/drm/msm/dp/dp_link.c
>> index be986da..316e8e6 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_link.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
>> @@ -1036,43 +1036,46 @@ int dp_link_process_request(struct dp_link 
>> *dp_link)
>> 
>>         if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
>>                 dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
>> -               return ret;
>> +               goto out;
>>         }
>> 
>>         ret = dp_link_process_ds_port_status_change(link);
>>         if (!ret) {
>>                 dp_link->sink_request |= DS_PORT_STATUS_CHANGED;
>> -               return ret;
>> +               goto out;
>>         }
>> 
>>         ret = dp_link_process_link_training_request(link);
>>         if (!ret) {
>>                 dp_link->sink_request |= DP_TEST_LINK_TRAINING;
>> -               return ret;
>> +               goto out;
>>         }
>> 
>>         ret = dp_link_process_phy_test_pattern_request(link);
>>         if (!ret) {
>>                 dp_link->sink_request |= 
>> DP_TEST_LINK_PHY_TEST_PATTERN;
>> -               return ret;
>> +               goto out;
>>         }
>> 
>>         ret = dp_link_process_link_status_update(link);
> 
> if ret == 0 we go into the if below and goto out.
> 
>>         if (!ret) {
>>                 dp_link->sink_request |= DP_LINK_STATUS_UPDATED;
>> -               return ret;
>> +               goto out;
>>         }
> 
> At this point ret != 0 due to the goto above.
> 
>> 
>>         if (dp_link_is_video_pattern_requested(link)) {
>> -               ret = 0;
> 
> And now we've removed the ret = 0 assignment from here.
> 
>>                 dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;
>> +               goto out;
> 
> And then we goto out. Isn't this a behavior change? Still feels like we
> should be using if/else-if logic here instead of this goto maze.
> 
>>         }
>> 
>>         if (dp_link_is_audio_pattern_requested(link)) {
>>                 dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
>> -               return -EINVAL;
>> +               ret = -EINVAL;
>> +               goto out;
>>         }
>> 
>> +out:
>> +       DRM_DEBUG_DP("sink request=%#x", dp_link->sink_request);
>>         return ret;
>>  }
>> 

Thank you. I see what you are saying, and yes it makes sense, I'll 
change it to if else-if logic.
