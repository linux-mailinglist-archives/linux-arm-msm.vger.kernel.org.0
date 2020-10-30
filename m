Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0A62A10A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 23:06:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbgJ3WGi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 18:06:38 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:24217 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725816AbgJ3WGh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 18:06:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604095595; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=lGkiIC6aCmxVlnP+kS5/v1V4Xiy5BR0zSGoVebzuAD4=;
 b=qxt3BuiQ7gQZu1u9ZuA49Z0c3tajWpyQZFw1KeJ0gIMAKTrz0hFxMgBkJBgPpQIl8XR64tD9
 vS91fm/PoK/1/SgCwI1a5BFrsCMZVxuglkDjry1jNgTwAHbpS5cm0M4n6RBmv+YJENTSmT/n
 fryYcpGQedfhIid+ydwgnBuW2P8=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f9c8e6bd306da06745d2c2c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Oct 2020 22:06:35
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D21C6C43382; Fri, 30 Oct 2020 22:06:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F1979C433C8;
        Fri, 30 Oct 2020 22:06:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 30 Oct 2020 15:06:33 -0700
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     robdclark@gmail.com, sean@poorly.run, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: skip checking LINK_STATUS_UPDATED bit
In-Reply-To: <160323215566.884498.14018580767640192186@swboyd.mtv.corp.google.com>
References: <20201020165959.7441-1-khsieh@codeaurora.org>
 <160323215566.884498.14018580767640192186@swboyd.mtv.corp.google.com>
Message-ID: <546018237be3f05b4eb33c916ed1d939@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-10-20 15:15, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2020-10-20 09:59:59)
>> No need to check LINK_STATuS_UPDATED bit before
> 
> LINK_STATUS_UPDATED?
> 
>> return 6 bytes of link status during link training.
> 
> Why?
> 
>> This patch also fix phy compliance test link rate
>> conversion error.
> 
> How?
> 
>> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> ---
> 
> Any Fixes: tag?
> 
>>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 20 ++++++--------------
>>  drivers/gpu/drm/msm/dp/dp_link.c | 24 +++++++++++-------------
>>  2 files changed, 17 insertions(+), 27 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c 
>> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 6bdaec778c4c..76e891c91c6e 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1061,23 +1061,15 @@ static bool dp_ctrl_train_pattern_set(struct 
>> dp_ctrl_private *ctrl,
>>  static int dp_ctrl_read_link_status(struct dp_ctrl_private *ctrl,
>>                                     u8 *link_status)
>>  {
>> -       int len = 0;
>> -       u32 const offset = DP_LANE_ALIGN_STATUS_UPDATED - 
>> DP_LANE0_1_STATUS;
>> -       u32 link_status_read_max_retries = 100;
>> -
>> -       while (--link_status_read_max_retries) {
>> -               len = drm_dp_dpcd_read_link_status(ctrl->aux,
>> -                       link_status);
>> -               if (len != DP_LINK_STATUS_SIZE) {
>> -                       DRM_ERROR("DP link status read failed, err: 
>> %d\n", len);
>> -                       return len;
>> -               }
>> +       int ret = 0, len;
>> 
>> -               if (!(link_status[offset] & DP_LINK_STATUS_UPDATED))
>> -                       return 0;
>> +       len = drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
>> +       if (len != DP_LINK_STATUS_SIZE) {
>> +               DRM_ERROR("DP link status read failed, err: %d\n", 
>> len);
>> +               ret = len;
> 
> Could this be positive if the len is greater than 0 but not
> DP_LINK_STATUS_SIZE? Maybe the check should be len < 0? We certainly
> don't want to return some smaller size from this function, right?
> 

no, it should be exactly the byte number requested to read.
otherwise, it should be failed and will re read at next run.

>>         }
>> 
>> -       return -ETIMEDOUT;
>> +       return ret;
>>  }
>> 
>>  static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
>> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c 
>> b/drivers/gpu/drm/msm/dp/dp_link.c
>> index c811da515fb3..58d65daae3b3 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_link.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
>> @@ -773,7 +773,8 @@ static int 
>> dp_link_process_link_training_request(struct dp_link_private *link)
>>                         link->request.test_lane_count);
>> 
>>         link->dp_link.link_params.num_lanes = 
>> link->request.test_lane_count;
>> -       link->dp_link.link_params.rate = link->request.test_link_rate;
>> +       link->dp_link.link_params.rate =
>> +               
>> drm_dp_bw_code_to_link_rate(link->request.test_link_rate);
> 
> Why are we storing bw_code in test_link_rate? This looks very 
> confusing.

Test_link_rate contains link rate from dpcd read. it need to be convert 
to real
rate by timing 2.7Mb before start phy compliance test.

> 
>> 
>>         return 0;
>>  }
