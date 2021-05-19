Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 848DD389861
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 23:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbhESVHz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 17:07:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbhESVHy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 17:07:54 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91760C061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 14:06:34 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id t10-20020a05683022eab0290304ed8bc759so12975964otc.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 14:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=kDU30zLEXE6xwILXMY7R1qs5dorqVFtA3XmZROhbl1M=;
        b=JbtscaLB3JiwU4cKlJn71Bh7UUnQpW7ZCfcpuS6B+AJ+jHiFtZ285O3ALsivlM4ILz
         I0qDFcz6M9/gRMMeQfiVX8Z9x4VMU6zaSQLXRfStXCXV1f7ji6U3h+ehxfzeDvfrI4X8
         11feTu+ykEtPAwrbhEjXYxtTuDQfv6LtKEO5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=kDU30zLEXE6xwILXMY7R1qs5dorqVFtA3XmZROhbl1M=;
        b=hvkOYaxVYAS0FIU7G94tQ0fhzIMfblwFxYn6SAOZYuO0uWkneJkkcqOJOAEEqK4ocH
         iBdT24BsbXZurNu9gBJwFOvFQkMEFge9rDSFRVMionK5r3LdYosn4GBirYecQuqQgZ96
         JrJnhmcShgVPNO8UDHKuRF2Tv+jViZcOsjin2bd9QdfmJse0jfCSm1bQpv0gb0ShPPXQ
         2SjvvWK1Q3WREXGdMoCD8reAJERSVRNirSrkKMF8YoYc0VbxSnU+Nay3rnsPbjGIZGTs
         v73vWJ7aM9s2sxzTXPyFTfn1DqM/GPzv49HvP+wWgXP1NUMZEbL1UFq0xPsnLiNSea4C
         VjCg==
X-Gm-Message-State: AOAM530oCdh76IASR0YfnlinOSCVBRMANZEajPzyC6yoG6X8x3NhfrU3
        pPrZlbKWjl8tUbdDcBDDRSTzZ4GwE/icK7R0J6aXVw==
X-Google-Smtp-Source: ABdhPJzzUvlFY0+2tDUUCra60G1GqUzttYDweVoIP9n5sG+f06VKSyqgjlH5FPO4g/6w5kzveJ+ydtmLA4eeAN9pG08=
X-Received: by 2002:a05:6830:1556:: with SMTP id l22mr1217157otp.34.1621458393963;
 Wed, 19 May 2021 14:06:33 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 19 May 2021 17:06:32 -0400
MIME-Version: 1.0
In-Reply-To: <c1a3ced9ac4682bae310712a11576322@codeaurora.org>
References: <1621013713-6860-1-git-send-email-khsieh@codeaurora.org>
 <CAE-0n53VUr=f=PKnO5HhXZ3BAG_mNBwmQrfQPxHvxLZPDReA+g@mail.gmail.com> <c1a3ced9ac4682bae310712a11576322@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 19 May 2021 17:06:32 -0400
Message-ID: <CAE-0n50yRCA00ck_FtXwzKw_R8UcocMzTh8V7NOe4ob__3G3bg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] drm/msm/dp: handle irq_hpd with sink_count = 0 correctly
To:     khsieh@codeaurora.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robdclark@gmail.com,
        sean@poorly.run, vkoul@kernel.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting khsieh@codeaurora.org (2021-05-19 09:01:02)
> On 2021-05-18 14:42, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2021-05-14 10:35:13)
> >> irq_hpd interrupt should be handled after dongle plugged in and
> >> before dongle unplugged. Hence irq_hpd interrupt is enabled at
> >> the end of the plugin handle and disabled at the beginning of
> >> unplugged handle. Current irq_hpd with sink_count = 0 is wrongly
> >> handled same as the dongle unplugged which tears down the mainlink
> >> and disables the phy. This patch fixes this problem by only tearing
> >> down the mainlink but keeping phy enabled at irq_hpd with
> >> sink_count = 0 handle so that next irq_hpd with sink_count =1 can be
> >> handled by setup mainlink only.
> >>
> >> Changes in v2:
> >> -- add ctrl->phy_Power_count
> >>
> >> Changes in v3:
> >> -- del ctrl->phy_Power_count
> >> -- add phy_power_off to dp_ctrl_off_link_stream()
> >>
> >> Changes in v4:
> >> -- return immediately if clock disable failed at
> >> dp_ctrl_off_link_stream()
> >>
> >> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> >
> > I think we want some Fixes tag. Not sure what it would be though.
> >
> > I also noticed that if I plug and unplug the HDMI cable from my apple
> > dongle that I see this error message
> >
> >   [drm:dp_display_usbpd_attention_cb] *ERROR* Disconnected, no
> > DP_LINK_STATUS_UPDATED
>
> > *ERROR* Disconnected, no DP_LINK_STATUS_UPDATED <== this is caused by
> > dongle generate the second
> irq_hpd with sink_count = 0 after first first irq_hpd with sink_count =
> 0. The fix is you have
> set dongle to D3 (power off) state after first irq_pd with sink_count =
> 0 handled.
> I have a patch fix this problem. I will merge and re submit for review.

That's good. I still don't understand how the kthread can't race with
irq_hpd and hpd going low though. Userspace will have to disable the
display and that could happen far later than the time that the hpd low
interrupt fires and is processed. Can't hpd go high during that time and
then blip before userspace notices and disables the display?

Put another way, putting the dongle into D3 state may make the race
window smaller, but it's not fixing the root cause of the problem which
is that the kthread is running later and userspace is involved in the
state of the dongle while irqs are firing. The three different contexts
have to coordinate work, so it feels like a better approach would be to
shut off the irq_hpd interrupt once hpd goes low for an unplug in
hardirq context so that we don't have to consider the cable state or
userspace changing the state after we notify it.
