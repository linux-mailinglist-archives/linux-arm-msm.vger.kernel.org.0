Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35AED3C1B09
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 23:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231285AbhGHVgm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 17:36:42 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:56055 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230492AbhGHVgm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 17:36:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625780040; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=xpgLql9IbuvMj4f8z+D1UneOTXpQth+qs7ZN6prUSAk=;
 b=U/Xu3QlGKYwg3Exf4n9yGalUJ/wTs1Pjxcmpr69aIJr4nLfg/072Y6dfbSn3rnvu84u9gUBa
 BJOPWYlR++HvWwZKmCfIU4ZMYjVDWd3SHmIUt2FZ1gCtw/26MzBLExG84Jd8KXrGFpF8bmkj
 YdtAa5FwGDiThq+zGNUq3QQd+Pg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60e76f405d0d101e386de308 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 08 Jul 2021 21:33:52
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B5ADBC433F1; Thu,  8 Jul 2021 21:33:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4E930C433D3;
        Thu,  8 Jul 2021 21:33:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 08 Jul 2021 14:33:51 -0700
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, abhinavk@codeaurora.org, aravindh@codeaurora.org,
        airlied@linux.ie, daniel@ffwll.ch, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] drm/msm/dp: use dp_ctrl_off_link_stream during PHY
 compliance test run
In-Reply-To: <CAE-0n52SxJx8kOwQddWF096PsPy-0f8bDq_ss=u6i-hisD54Hg@mail.gmail.com>
References: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org>
 <1625592020-22658-2-git-send-email-khsieh@codeaurora.org>
 <CAE-0n52SxJx8kOwQddWF096PsPy-0f8bDq_ss=u6i-hisD54Hg@mail.gmail.com>
Message-ID: <3492b578fdf4e59fe594fb9207782aa1@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-08 00:03, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-07-06 10:20:14)
>> DP cable should always connect to DPU during the entire PHY compliance
>> testing run. Since DP PHY compliance test is executed at irq_hpd event
>> context, dp_ctrl_off_link_stream() should be used instead of 
>> dp_ctrl_off().
>> dp_ctrl_off() is used for unplug event which is triggered when DP 
>> cable is
>> dis connected.
>> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> ---
> 
> Is this
> 
> Fixes: f21c8a276c2d ("drm/msm/dp: handle irq_hpd with sink_count = 0 
> correctly")
> 
> or
> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")

should be fixes at f21c8a276c2d ("drm/msm/dp: handle irq_hpd with 
sink_count = 0 correctly")

> 
> ? It's not clear how dp_ctrl_off() was working for compliance tests
> before commit f21c8a276c2d.
both dp_ctrl_off() and dp_ctrl_off_link_strea() are work for 
dp_ctrl_process_phy_test_request()
The problem is after dp_ctrl_off(), aux channel is down, hence next phy 
test will failed due to dpcd read failed.
So that cable unplugged and replug back to required to run next test 
case.
dp_ctrl_off_link_stream() will keep aux channel up and other phy test 
case can be continued.



>>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c 
>> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index caf71fa..27fb0f0 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1530,7 +1530,7 @@ static int 
>> dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
>>          * running. Add the global reset just before disabling the
>>          * link clocks and core clocks.
>>          */
>> -       ret = dp_ctrl_off(&ctrl->dp_ctrl);
>> +       ret = dp_ctrl_off_link_stream(&ctrl->dp_ctrl);
>>         if (ret) {
>>                 DRM_ERROR("failed to disable DP controller\n");
>>                 return ret;
