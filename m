Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB63027783B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Sep 2020 20:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728589AbgIXSGm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Sep 2020 14:06:42 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:40786 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727753AbgIXSGm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Sep 2020 14:06:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600970801; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ALhUP7sAqZrosBEby/VQO6Cy4FEeZWO8qfo6Ml+PqXc=;
 b=CFiGnTcffLvLbkBMA/M7TLqfGyGiYGJyXZh2PErU7d+FFzkx6YFl8VLRoCZqVQ3AQIliiy30
 6Lv8BLsZ37dTRXaQbSCU0M0UHDcvbzty26Pzsp67sLsQcHkVjm2K3DN6fvbHXkpElifEMh3w
 Ur5OC35CCTV5hW8c+c13F3AA0Qo=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f6ce02f5fb64f6e3755e9dd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 24 Sep 2020 18:06:39
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5D7EAC433FF; Thu, 24 Sep 2020 18:06:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8C519C433CA;
        Thu, 24 Sep 2020 18:06:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 24 Sep 2020 11:06:38 -0700
From:   abhinavk@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
        linux-arm-msm@vger.kernel.org, khsieh@codeaurora.org,
        seanpaul@chromium.org, tanmay@codeaurora.org,
        aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dp: fix incorrect function prototype of
 dp_debug_get()
In-Reply-To: <160092913200.310579.7777419545906412437@swboyd.mtv.corp.google.com>
References: <20200923232448.24516-1-abhinavk@codeaurora.org>
 <160092913200.310579.7777419545906412437@swboyd.mtv.corp.google.com>
Message-ID: <9b14d270ac94a7b17e13a2d4ac86ffdc@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen

Thanks for the review.

On 2020-09-23 23:32, Stephen Boyd wrote:
> Quoting Abhinav Kumar (2020-09-23 16:24:48)
>> Fix the incorrect function prototype for dp_debug_get()
>> in the dp_debug module to address compilation warning.
>> 
>> Fixes: f913454aae8e ("drm/msm/dp: move debugfs node to 
>> /sys/kernel/debug/dri/*/")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
>> ---
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
> Will the compliance testing parts be moved out of debugfs at some 
> point?
> Just curious what the plan is there.

No, the video pattern compliance testing parts will remain in debugfs as 
they use
IGT as the userspace entity which is debugfs based for DP compliance 
tests.

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
