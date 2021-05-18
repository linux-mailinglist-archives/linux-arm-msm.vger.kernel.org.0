Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3359138824B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 23:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352560AbhERVnk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 17:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352556AbhERVnj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 17:43:39 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 387A2C061573
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 14:42:20 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id v22so11218810oic.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 14:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=P2BFiut883Wk/O9dHYh5DtbSYu9aoR0O90BzeK6m1Ys=;
        b=jy5qlX0rsrDaPRzUFlx4Y9rYQU3p5CxptO5FN7VNVOOi2zC35MEcCaOjsKJIE8sPew
         NWvgQyxLt6SAKvgye1AqhtWqUucNYWri8HHDGg4EJiG8nwZ8LbSebDvIUQNMvZ1eiVlD
         D7wETwfewuPyny4AqbUC2UC5JxM8YKKeMYdZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=P2BFiut883Wk/O9dHYh5DtbSYu9aoR0O90BzeK6m1Ys=;
        b=WQRCqINlkPFK9JsTyeppzNrX4jy4WeIiXGplDCph89RvZxCVoXAR/QFbZiKDU98J87
         me7WcPMDhzMhqtQWwU0MGHGcPqQioFdDkUsma3tfbHXGJSVlcRSrRWU6SOcsdqKyPOYM
         0XIliqw0mNC4JjSTPvIXuN0lrn3tF06OnfiF/yt1T8Dzb1GOtY/g2xu762pKfX6FIlFR
         IdYEtoZSTB+u7y8b2VysLwYb3Xp8HxUpcBNwY5Pk7FIkEiT/ahTVm5Hhu5zbE9hlbYgX
         ZDzV6aVh++9HR15cmPbTvlc9FqbhuZBUA3vxVTMKTK9wvTS07Z/lq0dn4UDlFY+5EYTD
         3rPA==
X-Gm-Message-State: AOAM532BBAugPyixSEdSaC/cZPHLvbJ497ndL1bYZXdHsJK4kzFovxcv
        excExTJw/pyaAi30tiNLEaN5SlQ/NoRyso9Qhwr6nw==
X-Google-Smtp-Source: ABdhPJxs+FM+fIEe7OcwYdDoX96musI15SfqRciK/EHUrjpF6HXRQZqWM6KEFCt81pz9PERMR8kvPnDCM0vwyFr7O4M=
X-Received: by 2002:a54:4501:: with SMTP id l1mr5533426oil.19.1621374139680;
 Tue, 18 May 2021 14:42:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 May 2021 17:42:18 -0400
MIME-Version: 1.0
In-Reply-To: <1621013713-6860-1-git-send-email-khsieh@codeaurora.org>
References: <1621013713-6860-1-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 18 May 2021 17:42:18 -0400
Message-ID: <CAE-0n53VUr=f=PKnO5HhXZ3BAG_mNBwmQrfQPxHvxLZPDReA+g@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] drm/msm/dp: handle irq_hpd with sink_count = 0 correctly
To:     Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-05-14 10:35:13)
> irq_hpd interrupt should be handled after dongle plugged in and
> before dongle unplugged. Hence irq_hpd interrupt is enabled at
> the end of the plugin handle and disabled at the beginning of
> unplugged handle. Current irq_hpd with sink_count = 0 is wrongly
> handled same as the dongle unplugged which tears down the mainlink
> and disables the phy. This patch fixes this problem by only tearing
> down the mainlink but keeping phy enabled at irq_hpd with
> sink_count = 0 handle so that next irq_hpd with sink_count =1 can be
> handled by setup mainlink only.
>
> Changes in v2:
> -- add ctrl->phy_Power_count
>
> Changes in v3:
> -- del ctrl->phy_Power_count
> -- add phy_power_off to dp_ctrl_off_link_stream()
>
> Changes in v4:
> -- return immediately if clock disable failed at dp_ctrl_off_link_stream()
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>

I think we want some Fixes tag. Not sure what it would be though.

I also noticed that if I plug and unplug the HDMI cable from my apple
dongle that I see this error message

  [drm:dp_display_usbpd_attention_cb] *ERROR* Disconnected, no
DP_LINK_STATUS_UPDATED

which looks like the irq_hpd comes in while I'm disconnecting the HDMI
cable but the hpd_state is ST_DISCONNECTED. The state is set to
ST_DISCONNECTED in msm_dp_display_disable() so it seems that userspace
has turned off the external display, and then the kthread runs for the
irq_hpd but it's too late.

Something is missing from this patch then to properly disable the
IRQ_HPD interrupt before telling userspace that the external display is
disconnected. Shouldn't we be toggling the irq enable bits from the
hardirq context when we figure out what it is? The logic would be

 in_hardirq() {

   if (hpd high)
      enable_irq_hpd(); // Probably this can be delayed to the kthread
after enabling the link

   if (hpd_low)
      disable_irq_hpd(); // But this certainly cannot be in the kthread

   else if (irq_hpd) // Notice the else-if so that if hpd is low we
don't even try to handle irq_hpd if it came in at the same time
      handle_irq_hpd();
 }

Because we can't really mess with the irq controls in the kthread when
hpd goes low, it will be too late. For all we know, the kthread could
run seconds later, after an irq_hpd has come bouncing in at the same
time and pushed an irq_hpd handling event onto the kthread.
