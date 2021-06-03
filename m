Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8309D399A64
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jun 2021 08:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbhFCGEx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 02:04:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbhFCGEx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 02:04:53 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34F9FC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jun 2021 23:03:09 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id x196so4818930oif.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 23:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=W4MRGvvlAsIvztCMODsejOnW9x+vcPEBs+GlUbnr7QU=;
        b=kPUJ5NjxGkUGtAhRbO5ZjIIXgnTH7iqzJmf4glxC699yJkOagEj5NCwDVwwBa4Kcn5
         UZaVpRJ+dogRyu9PWzJ+xA6ZJcmzaSWPbARjEQ6ZmY+VwM0+UH4dQTSjqrps7gu6iDPe
         XmUjSru4mP+DCOXotRSPPv1R1WLyOW0IH/CI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=W4MRGvvlAsIvztCMODsejOnW9x+vcPEBs+GlUbnr7QU=;
        b=nKIQjAreQK9cuE+XcIgUYWUZkJNTiW1pMaLIVanwvGIHivYsGKVWdzEeOxelFhfy+d
         0iJYTJ3qZ2RWapJZEQjKCXvJuqLLqZ7/t1cnywicXtDSfYkTNGiawXFpgYO4Nrcar631
         ZXCNOvQEpRujEpJX3rAtCxJz2WbMGVAS0w6hY1+ZnavZHv+5FjbZbHKNtYmwcJYR5N8d
         5H3GxS0jdRN4LcSM8PmA9+3qtBlOk8IgOdevQALR82RH2JPLzcv24yTynMIT9XHU5bk+
         g7F/ME1yWMNooTESF5oIZCuAAwEj6CcNHt5NboviwdCZvBgbfYPQAYGd1vCSTJvmHFQE
         XB3Q==
X-Gm-Message-State: AOAM533WJL44zvFWb55Q7cqJhhaFckrO/gbLvMx1uq/05XTQ32SaQ8FK
        KvUTYzG7Ynx2kZS9SUfHpC3LI343orbKnekW7LSmkQ==
X-Google-Smtp-Source: ABdhPJwbZadfDpzhFToZSrCDEjvue32gZ2YzP9LLNu6q7SP0cOQDP7qleH6aBFPvVofyULuDdYDDPf7Y1Yeb6ZUQdwE=
X-Received: by 2002:aca:654d:: with SMTP id j13mr6376997oiw.125.1622700188427;
 Wed, 02 Jun 2021 23:03:08 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Jun 2021 23:03:07 -0700
MIME-Version: 1.0
In-Reply-To: <1622652185-7157-1-git-send-email-khsieh@codeaurora.org>
References: <1622652185-7157-1-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 2 Jun 2021 23:03:07 -0700
Message-ID: <CAE-0n516E_x+h2BFze0mozjdpwqa3_kb10cKWdcFURXkNj8k6w@mail.gmail.com>
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

This should be 8dbde399044b
