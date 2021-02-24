Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D457324707
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 23:43:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235699AbhBXWmu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 17:42:50 -0500
Received: from z11.mailgun.us ([104.130.96.11]:42826 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235688AbhBXWmt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 17:42:49 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614206549; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=WczKGquSJgnZUlXASNkqZ5WkLYrasNUrNCB5kZMcP5A=;
 b=AmJHl/QWrafEKD9qIwb73ZOIlIpAg3srm5/43RXByg/PdJQvUhh8YyE2BCopCS406L/nf6Ei
 oJXXWg88hoT1YJdreattgaon2pcKiLqhMx9unaVCxkRt3czd3vNuT3emHcdtBm0mB/dY5Z/V
 iylo7HrN0p+zHy62QG1qfj5wMYo=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6036d64cba08663830550c3d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Feb 2021 22:42:20
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1DF91C43462; Wed, 24 Feb 2021 22:42:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 70688C433CA;
        Wed, 24 Feb 2021 22:42:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 24 Feb 2021 14:42:19 -0800
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robdclark@gmail.com,
        sean@poorly.run, vkoul@kernel.org, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, aravindh@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] phy/qualcomm: add hbr3_hbr2 voltage and premphasis
 swing table
In-Reply-To: <161419558963.1254594.762999750680493756@swboyd.mtv.corp.google.com>
References: <1613667070-27613-1-git-send-email-khsieh@codeaurora.org>
 <161367397738.1254594.12158219605796616035@swboyd.mtv.corp.google.com>
 <161419558963.1254594.762999750680493756@swboyd.mtv.corp.google.com>
Message-ID: <3fac13ae8e800f5283fb13cbafac2b21@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-24 11:39, Stephen Boyd wrote:
> Quoting Stephen Boyd (2021-02-18 10:46:17)
>> Quoting Kuogee Hsieh (2021-02-18 08:51:10)
>> > Add hbr3_hbr2 voltage and premphasis swing table to support
>> > HBR3 link rate.
>> >
>> > Changes in V2:
>> > -- replaced upper case with lower case at hbr3_hbr2 table
>> >
>> > Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> > ---
>> 
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>> 
>> BTW, the DP driver already set rates for HBR2, so does that mean this 
>> is
>> fixing the voltage and preemphasis settings for HBR2? If so we should
>> backport this to stable trees and mark it as fixing commit 
>> 52e013d0bffa
>> ("phy: qcom-qmp: Add support for DP in USB3+DP combo phy").
> 
> Yes? No?
yes
