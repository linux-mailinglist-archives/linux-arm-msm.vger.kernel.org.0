Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F24703996E4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jun 2021 02:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbhFCAYu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 20:24:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbhFCAYt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 20:24:49 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67344C06174A
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jun 2021 17:23:05 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id z3so4536569oib.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 17:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=sf9HPjX/QRw5TUCBPMkwIobQvyDUNSU8DnXWCThttng=;
        b=lXyYsmHjMCk031tkWhLnBU8kbmJTb+chywkiYEpXQeAU+2q/dSOjy3z1Cgk8KSjA9l
         j+ZetNlnwdTzYQz1XalYZazk9biXAeuqG7EJRxw6mND10vlWJBJ6oY9szlC7B40w1baY
         HwN3g6HA8M9ppv3NmmfcNnSKHX2k/2Ls1vF+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=sf9HPjX/QRw5TUCBPMkwIobQvyDUNSU8DnXWCThttng=;
        b=eovs2+3P5+2Gp9+lmAAKLfZmnzmdduPvb1wDgTOQeVxDWh9CuRAMB4u2SyGo0QYmZ7
         UvuaWTtUAUgYfEFVUEwRqpqnQ2wg2IEebKB7u0CwIrFJWvYA1vUqrsxJ/lOczHCLP8eG
         yUbO2+t89CUwUUxLh5neI8l0YUWF+Hfd332HY+F/OFeCqOV3ugpQfebTGZtrO/oigPql
         Cusc5KhqJQhyIAuBd+sPOMcwTOfcws86fLoD0+6QwFhVf9zt/ERdBwJiT06NXpRpwlWp
         KH7InCxt9EvbrviUiDUm7Esvp7z8Y9XJ+GiB9oyBh90J8HoB8FXiE28meeN93eX1ivXB
         51JQ==
X-Gm-Message-State: AOAM533zocVHx8YW4XGs/Rs9mrTOZlmu479KsUjVZBBNAuEEzHYZK3Kl
        tjk+l1smcoIe5DDNokMUapFbbXQX6bHyCw/9tljQKw==
X-Google-Smtp-Source: ABdhPJyY5laFn5SRHNT37MHyapZ0GwE1ObVpQfvDvSQd6CoIw7eXVr3cYfAO4YpBf2ZSmCLl+Qq0taNnfzOtiSyKJMA=
X-Received: by 2002:aca:654d:: with SMTP id j13mr5653421oiw.125.1622679784640;
 Wed, 02 Jun 2021 17:23:04 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Jun 2021 17:23:04 -0700
MIME-Version: 1.0
In-Reply-To: <1622652185-7157-1-git-send-email-khsieh@codeaurora.org>
References: <1622652185-7157-1-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 2 Jun 2021 17:23:04 -0700
Message-ID: <CAE-0n522L0hmAK40xj3TGimBjeqQgqO2YWsGOrYv-BPqr33tkA@mail.gmail.com>
Subject: Re: [PATCH v4] drm/msm/dp: power off DP phy at suspend
To:     Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-06-02 09:43:05)
> Normal DP suspend operation contains two steps, display off followed
> by dp suspend, to complete system wide suspending cycle if display is
> up at that time. In this case, DP phy will be powered off at display
> off. However there is an exception case that depending on the timing
> of dongle plug in during system wide suspending, sometimes display off
> procedure may be skipped and dp suspend was called directly. In this
> case, dp phy is stay at powered on (phy->power_count = 1) so that at
> next resume dp driver crash at main link clock enable due to phy is
> not physically powered on. This patch will call dp_ctrl_off_link_stream()
> to tear down main link and power off phy at dp_pm_suspend() if main link
> had been brought up.
>
> Changes in V2:
> -- stashed changes into dp_ctrl.c
> -- add is_phy_on to monitor phy state
>
> Changes in V3:
> -- delete is_phy_on
> -- call dp_ctrl_off_link_stream() from dp_pm_suspend()
>
> Changes in V4:
> -- delete changes made at dp_power.c
> -- move main link status checking to dp_pm_suspend
>
> Fixes: 0114f31a2903 ("drm/msm/dp: handle irq_hpd with sink_count = 0 correctly)
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Ok, this seems to work and is nice and small

Tested-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
