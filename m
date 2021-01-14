Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE7522F6730
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 18:15:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728635AbhANROW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 12:14:22 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:14335 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728625AbhANROV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 12:14:21 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610644436; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=qnsx3daK0QJOaPx77SAmwXpHyqM3YCWxidh/gbfT0KI=;
 b=eCuxnGuM2bMw+4aGpwPVkP6xYQHV+t2gBly84odplKxO5kWOcjY/ALFDh42q3wGQ4yRkyTe5
 o37zBCMfcnCTLQHIT4W56FUysv8kyoKhur+InXSdaFpSFROlDq9gFNfwsnlXY6YG9IEd+2BD
 TMoZXKOkvlk6oLK/b5y57QYmg+Q=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60007bba8fb3cda82f98191a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 14 Jan 2021 17:13:30
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BC9C8C433C6; Thu, 14 Jan 2021 17:13:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 50867C433CA;
        Thu, 14 Jan 2021 17:13:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 14 Jan 2021 09:13:28 -0800
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/msm/dp: postpone irq_hpd event during connection
 pending state
In-Reply-To: <161058243505.3661239.4173340912311093207@swboyd.mtv.corp.google.com>
References: <y> <1610051425-20632-1-git-send-email-khsieh@codeaurora.org>
 <1610051425-20632-2-git-send-email-khsieh@codeaurora.org>
 <161039491877.3661239.1387205899512360969@swboyd.mtv.corp.google.com>
 <17a116011ae60194834210a4a0c877b3@codeaurora.org>
 <161056933099.3661239.9450322359293035316@swboyd.mtv.corp.google.com>
 <b4a6e7695d12c3191bff75668f386da9@codeaurora.org>
 <161058243505.3661239.4173340912311093207@swboyd.mtv.corp.google.com>
Message-ID: <7093b80b9304d161259f5f3f4b12d3c1@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-01-13 16:00, Stephen Boyd wrote:
> Quoting khsieh@codeaurora.org (2021-01-13 15:44:32)
>> On 2021-01-13 12:22, Stephen Boyd wrote:
>> > Quoting khsieh@codeaurora.org (2021-01-13 09:44:24)
>> >> On 2021-01-11 11:55, Stephen Boyd wrote:
>> >> > Quoting Kuogee Hsieh (2021-01-07 12:30:24)
>> >> >> irq_hpd event can only be executed at connected state. Therefore
>> >> >> irq_hpd event should be postponed if it happened at connection
>> >> >> pending state. This patch also make sure both link rate and lane
>> >> >
>> >> > Why does it happen at connection pending state?
>> >> plug in need two state to complete it.
>> >> advance to connection pending state once link training completed and
>> >> sent uevent notification to frame work.
>> >> transition to connected state after frame work provided resolution
>> >> timing and start transmit video panel.
>> >> Therefore irq_hpd should not be handled if it occurred before
>> >> connected
>> >> state.
>> >
>> > Sure that's what's going on in the patch but you didn't answer my
>> > question. Why does irq_hpd happen before connected state?
>> 
>> I have no idea why it happen this way.
>> during debug
>> https://partnerissuetracker.corp.google.com/issues/170598152
>> I saw two different scenario
>> 1) irq_hpd followed by unplug with less than 20 ms in between. this 
>> one
>> fixed by this patch set.
>> 2) plug followed by irq_hpd around 300ms in between. it does not cause
>> problem. but it should be handled in order (after connected state).
> 
> Ok. So nobody understands why the hardware is acting this way and we're
> papering over the problem by forcing the HPD state to be what we think
> it should be? That's not great.

irq_hpd is issued from dongle.
it then go through EC ps8805 driver and reach DP driver finally.
Again, to duplicate problem #1 this at my set up, i have to 
intentionally wiggling type-c connector of dongle.
But I can not duplicate problem #2 and only saw it one time from Quantan 
provide logs.






