Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC12439AD5D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jun 2021 23:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhFCWBk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 18:01:40 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:43078 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230316AbhFCWBk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 18:01:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622757595; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=JopR8lsZRXcBqVt7w6KYKzZfR6Rv2Sc1+2IbY1eLLm0=;
 b=O2CJomK7j1FyahTmbqy2Ps/5DLCFWLhYYwXLJn1gAPNIe5LZSYSr2+hZKpY8XTTUpI24OByJ
 5lAK958/TP+TKNNyIxTaQ0zUHH+PcX1xRZkz9AZy1Yzk7jVqGxyITHPFp4zDXsoTafAxAJ82
 HYcBSWzkx17MmC6P25TK9LdE/aM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60b950d7f726fa41884e201b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Jun 2021 21:59:51
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A1E47C433F1; Thu,  3 Jun 2021 21:59:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 25277C4338A;
        Thu,  3 Jun 2021 21:59:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 03 Jun 2021 14:59:49 -0700
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robdclark@gmail.com,
        sean@poorly.run, vkoul@kernel.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] drm/msm/dp: power off DP phy at suspend
In-Reply-To: <CAE-0n51-CsHPwYmceUq1kTaG=L+ifG3kX2pxJxTG_=r4Xm67_g@mail.gmail.com>
References: <1622734846-14179-1-git-send-email-khsieh@codeaurora.org>
 <CAE-0n51-CsHPwYmceUq1kTaG=L+ifG3kX2pxJxTG_=r4Xm67_g@mail.gmail.com>
Message-ID: <3f62fc2142f6089c43ec3a4b7b10cadc@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-03 13:22, Stephen Boyd wrote:
> Can you Cc dri-devel?
> 
Sorry for dropping this cc.
Should I re submit this v5 with cc=dri-devel?



> Quoting Kuogee Hsieh (2021-06-03 08:40:46)
>> Normal DP suspend operation contains two steps, display off followed
>> by dp suspend, to complete system wide suspending cycle if display is
>> up at that time. In this case, DP phy will be powered off at display
>> off. However there is an exception case that depending on the timing
>> of dongle plug in during system wide suspending, sometimes display off
>> procedure may be skipped and dp suspend was called directly. In this
>> case, dp phy is stay at powered on (phy->power_count = 1) so that at
>> next resume dp driver crash at main link clock enable due to phy is
>> not physically powered on. This patch will call 
>> dp_ctrl_off_link_stream()
>> to tear down main link and power off phy at dp_pm_suspend() if main 
>> link
>> had been brought up.
>> 
