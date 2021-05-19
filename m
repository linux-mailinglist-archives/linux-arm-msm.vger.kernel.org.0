Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FBDE38932D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 18:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347000AbhESQC7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 12:02:59 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:32585 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346958AbhESQC6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 12:02:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621440098; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=f3esNVJWkyreSf7lUucLsVmFEpcwPaQNQn4DlkwCpPk=;
 b=VABrDoTamNhNVNOldPPkY2CSmyNNwECRYvmHAjyUCiB9sGsM3UD2C6VM7eRtKrtETCaOlnGT
 w8U1pEj1rmc9ZqdEmSBv6oHoU4qNAs+ndG4twvRDT4IOpuqrUNrwcjjDZ2FOr6OfpLCmZCfX
 W51EK8sDIGiLnTRbt/kjhAIXOQ8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60a5363fb15734c8f97708f1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 19 May 2021 16:01:03
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 08D2AC4323A; Wed, 19 May 2021 16:01:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 34CC2C433F1;
        Wed, 19 May 2021 16:01:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 19 May 2021 09:01:02 -0700
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robdclark@gmail.com,
        sean@poorly.run, vkoul@kernel.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] drm/msm/dp: handle irq_hpd with sink_count = 0
 correctly
In-Reply-To: <CAE-0n53VUr=f=PKnO5HhXZ3BAG_mNBwmQrfQPxHvxLZPDReA+g@mail.gmail.com>
References: <1621013713-6860-1-git-send-email-khsieh@codeaurora.org>
 <CAE-0n53VUr=f=PKnO5HhXZ3BAG_mNBwmQrfQPxHvxLZPDReA+g@mail.gmail.com>
Message-ID: <c1a3ced9ac4682bae310712a11576322@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-18 14:42, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-05-14 10:35:13)
>> irq_hpd interrupt should be handled after dongle plugged in and
>> before dongle unplugged. Hence irq_hpd interrupt is enabled at
>> the end of the plugin handle and disabled at the beginning of
>> unplugged handle. Current irq_hpd with sink_count = 0 is wrongly
>> handled same as the dongle unplugged which tears down the mainlink
>> and disables the phy. This patch fixes this problem by only tearing
>> down the mainlink but keeping phy enabled at irq_hpd with
>> sink_count = 0 handle so that next irq_hpd with sink_count =1 can be
>> handled by setup mainlink only.
>> 
>> Changes in v2:
>> -- add ctrl->phy_Power_count
>> 
>> Changes in v3:
>> -- del ctrl->phy_Power_count
>> -- add phy_power_off to dp_ctrl_off_link_stream()
>> 
>> Changes in v4:
>> -- return immediately if clock disable failed at 
>> dp_ctrl_off_link_stream()
>> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> 
> I think we want some Fixes tag. Not sure what it would be though.
> 
> I also noticed that if I plug and unplug the HDMI cable from my apple
> dongle that I see this error message
> 
>   [drm:dp_display_usbpd_attention_cb] *ERROR* Disconnected, no
> DP_LINK_STATUS_UPDATED

> *ERROR* Disconnected, no DP_LINK_STATUS_UPDATED <== this is caused by 
> dongle generate the second
irq_hpd with sink_count = 0 after first first irq_hpd with sink_count = 
0. The fix is you have
set dongle to D3 (power off) state after first irq_pd with sink_count = 
0 handled.
I have a patch fix this problem. I will merge and re submit for review.

> which looks like the irq_hpd comes in while I'm disconnecting the HDMI
> cable but the hpd_state is ST_DISCONNECTED. The state is set to
> ST_DISCONNECTED in msm_dp_display_disable() so it seems that userspace
> has turned off the external display, and then the kthread runs for the
> irq_hpd but it's too late.
> 
> Something is missing from this patch then to properly disable the
> IRQ_HPD interrupt before telling userspace that the external display is
> disconnected. Shouldn't we be toggling the irq enable bits from the
> hardirq context when we figure out what it is? The logic would be
> 
>  in_hardirq() {
> 
>    if (hpd high)
>       enable_irq_hpd(); // Probably this can be delayed to the kthread
> after enabling the link
> 
>    if (hpd_low)
>       disable_irq_hpd(); // But this certainly cannot be in the kthread
> 
>    else if (irq_hpd) // Notice the else-if so that if hpd is low we
> don't even try to handle irq_hpd if it came in at the same time
>       handle_irq_hpd();
>  }
> 
> Because we can't really mess with the irq controls in the kthread when
> hpd goes low, it will be too late. For all we know, the kthread could
> run seconds later, after an irq_hpd has come bouncing in at the same
> time and pushed an irq_hpd handling event onto the kthread.
