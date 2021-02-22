Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D448A321D0D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Feb 2021 17:34:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbhBVQdU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Feb 2021 11:33:20 -0500
Received: from z11.mailgun.us ([104.130.96.11]:22527 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231179AbhBVQcW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Feb 2021 11:32:22 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614011524; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=dCdhlnGttsQALHTe0ST0kOVHzzKLcqYwXO4t7pO+g9g=;
 b=uoFBlcQzifiCeZyusjPFj4J+I3uKycQ4Ye4pZscKvlkHNwDmLZRSBsvk33UumK/rb+Gwv2hs
 v2fKepV9H6RiuMI/dU1kRLj+kizsJz6rjivh0ukPk6TYmfr2m0oO8mmHaCQUhFp6EEWbNxXu
 GtleHrKSIZjj6aEsskDc05yKOJQ=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6033dc42090a7742877fd43f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Feb 2021 16:30:58
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8D43DC433ED; Mon, 22 Feb 2021 16:30:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A3707C433C6;
        Mon, 22 Feb 2021 16:30:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 22 Feb 2021 08:30:57 -0800
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     robdclark@gmail.com, sean@poorly.run, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/msm/dp: add supported max link rate specified
 from dtsi
In-Reply-To: <161377480166.1254594.16557636343276220817@swboyd.mtv.corp.google.com>
References: <1613681704-12539-1-git-send-email-khsieh@codeaurora.org>
 <161368935031.1254594.14384765673800900954@swboyd.mtv.corp.google.com>
 <7af07dcacd5b68087cc61e467e9c57ea@codeaurora.org>
 <161377480166.1254594.16557636343276220817@swboyd.mtv.corp.google.com>
Message-ID: <1782d03506bebe7751d33ae12a38d21c@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-19 14:46, Stephen Boyd wrote:
> Quoting khsieh@codeaurora.org (2021-02-19 08:39:38)
>> On 2021-02-18 15:02, Stephen Boyd wrote:
>> > Quoting Kuogee Hsieh (2021-02-18 12:55:04)
>> >> Allow supported link rate to be limited to the value specified at
>> >> dtsi. If it is not specified, then link rate is derived from dpcd
>> >> directly. Below are examples,
>> >> link-rate = <162000> for max link rate limited at 1.62G
>> >> link-rate = <270000> for max link rate limited at 2.7G
>> >> link-rate = <540000> for max link rate limited at 5.4G
>> >> link-rate = <810000> for max link rate limited at 8.1G
>> >>
>> >> Changes in V2:
>> >> -- allow supported max link rate specified from dtsi
>> >
>> > Please don't roll this into the patch that removes the limit. The
>> > previous version of this patch was fine. The part that lowers the limit
>> > back down should be another patch.
>> >
>> > We rejected link-rate in DT before and we should reject it upstream
>> > again. As far as I can tell, the maximum link rate should be determined
>> > based on the panel or the type-c port on the board. The dp controller
>> > can always achieve HBR3, so limiting it at the dp controller is
>> > incorrect. The driver should query the endpoints to figure out if they
>> > want to limit the link rate. Is that done automatically sometimes by
>> > intercepting the DPCD?
>> 
>> ok, i will roll back to original patch and add the second patch for 
>> max
>> link rate limited purpose.
>> panel dpcd specified max link rate it supported.
>> At driver, link rate is derived from dpcd directly since driver will 
>> try
>> to use the maximum supported link rate and less lane to save power.
>> Therefore it is not possible that limit link rate base on dpcd.
>> AS i understand we are going to do max link rate limitation is due to
>> old redriver chip can not support HBR3.
>> How can I acquire which type-c port on the board so that I can trigger
>> max link rate limitation?
>> 
>> 
> 
> The driver already seems to support lowering the link rate during link
> training. Can't we try to train at the highest rate and then downgrade
> the link speed until it trains properly? I sort of fail to see why we
> need to introduce a bunch of complexity around limiting the link rate 
> on
> certain boards if the driver can figure out that link training doesn't
> work at HBR3 so it should try to train at HBR2 instead.

yes, dp driver did support down grade link rate during link training 
procedure.
But link training is kind of setting up agreement between host and panel 
with assumption that there are no other limitations in between.
The problem we are discussing here is the limitation of usb re driver 
link rate support.
Since we do not know how usb re driver behavior, I am not sure link 
training will work appropriately for this case.
It may end up link status keep toggling up and down.

Both link-lane and link-rate specified at dtsi are for the limitation of 
Trogdor hardware platform.
Both link-lane and link-rate specified at dtsi are NOT for panel since 
panel have specified its capability at its DPCD.








