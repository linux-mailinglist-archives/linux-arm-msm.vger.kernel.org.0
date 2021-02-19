Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9145231FD4F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Feb 2021 17:41:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhBSQkf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Feb 2021 11:40:35 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:60969 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230163AbhBSQke (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Feb 2021 11:40:34 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613752808; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=bGYuBowdCAf1ux6PDCOPxHG/ip7+T+wrGkBIdOPIiaM=;
 b=i7GGJHoJLmzxmUFpF19Ac8rEm1Z0VkHoZJhJo1kca+JDC15B7zGeOWObJORhjyS32YOLFTQg
 weK0Uy3iU+eeeU1ag9VhiHfbjatG9waYo/to4dFXBrYVyiHqo3ORIiAwXguKI5+jMzhZUKDW
 HEmWymsS3q0L/ju/zcFZZEVozkc=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 602fe9cb37f02eb71496c18b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Feb 2021 16:39:39
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 27A01C433C6; Fri, 19 Feb 2021 16:39:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 89D79C433CA;
        Fri, 19 Feb 2021 16:39:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 19 Feb 2021 08:39:38 -0800
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     robdclark@gmail.com, sean@poorly.run, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/msm/dp: add supported max link rate specified
 from dtsi
In-Reply-To: <161368935031.1254594.14384765673800900954@swboyd.mtv.corp.google.com>
References: <1613681704-12539-1-git-send-email-khsieh@codeaurora.org>
 <161368935031.1254594.14384765673800900954@swboyd.mtv.corp.google.com>
Message-ID: <7af07dcacd5b68087cc61e467e9c57ea@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-18 15:02, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-02-18 12:55:04)
>> Allow supported link rate to be limited to the value specified at
>> dtsi. If it is not specified, then link rate is derived from dpcd
>> directly. Below are examples,
>> link-rate = <162000> for max link rate limited at 1.62G
>> link-rate = <270000> for max link rate limited at 2.7G
>> link-rate = <540000> for max link rate limited at 5.4G
>> link-rate = <810000> for max link rate limited at 8.1G
>> 
>> Changes in V2:
>> -- allow supported max link rate specified from dtsi
> 
> Please don't roll this into the patch that removes the limit. The
> previous version of this patch was fine. The part that lowers the limit
> back down should be another patch.
> 
> We rejected link-rate in DT before and we should reject it upstream
> again. As far as I can tell, the maximum link rate should be determined
> based on the panel or the type-c port on the board. The dp controller
> can always achieve HBR3, so limiting it at the dp controller is
> incorrect. The driver should query the endpoints to figure out if they
> want to limit the link rate. Is that done automatically sometimes by
> intercepting the DPCD?

ok, i will roll back to original patch and add the second patch for max 
link rate limited purpose.
panel dpcd specified max link rate it supported.
At driver, link rate is derived from dpcd directly since driver will try 
to use the maximum supported link rate and less lane to save power.
Therefore it is not possible that limit link rate base on dpcd.
AS i understand we are going to do max link rate limitation is due to 
old redriver chip can not support HBR3.
How can I acquire which type-c port on the board so that I can trigger 
max link rate limitation?


