Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF10D3D685C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jul 2021 23:02:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233101AbhGZUVb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 16:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232876AbhGZUVa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 16:21:30 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 366CAC061757
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 14:01:58 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id q6so12515963oiw.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 14:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=qmP+nvFdiGyxe0rj0aQYB75xMol5kzYi2IuKWY30b+E=;
        b=HcCfoB6PsDvFiCdKkUBvoH+mjMQf2ALTf9fhKLE/VjZ40hTKVuYuqbLnGBDUxHfxAT
         RHM5WJnd2hxeq1PTA0sGFMwF/UaO8yBbNY4WMZ7M4XFoki+iBfoUq6vM1TyoEawMx/bW
         eI0cTwTUN6xfERJ60Y4fIMo5CzpKfr9eewgqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=qmP+nvFdiGyxe0rj0aQYB75xMol5kzYi2IuKWY30b+E=;
        b=TvpnNH3ZH/bi6whDQKV6DT3OC3yCZCfldwqMV8Sj+xryBT+2/fQTlcUX/i5UFKfmYT
         5Y1Fubhv7Wzpwf//psQ9C1iCr7oW7ZiRGbg+BdFH4yJ1wF3kLoDxhJMEVRT7oAQqOaKI
         p+7Bysp/E8BkqESNbTicia9J4SPtslL5ptBzUjxqaF9D9nAh1iDB4vutK6Q1HiUO+GUg
         6iPApfUFBgEtmOpUOya8khtQ8ARnKrpz84J2U4TvrVYm14DcorI1WUBWJ5WUD8alHhoW
         UroPJk+5NbIrysqHtcGzcZTSow+qTVwyl+whGGzmf1tUUnXSJcuXn2AOtvy9UUsNgJ1D
         43Zw==
X-Gm-Message-State: AOAM5310lqKxS5uUxqWo6SxltEWmghTQzsU3+vx2z6cDTWzK0c3+7poM
        jor30eRGRYy+ffkj+lR6RKIlv7DehjriBG7L55LscA==
X-Google-Smtp-Source: ABdhPJy+zOV5H5QT2ONLq6/MZa4bLjvvPnTfl/f+51Qfcb8grTupNAQqi5h8GLKoIRhK4zyX3pBhEOFnFHlKvFHlnMU=
X-Received: by 2002:aca:afd7:: with SMTP id y206mr139164oie.1.1627333317558;
 Mon, 26 Jul 2021 14:01:57 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Jul 2021 17:01:57 -0400
MIME-Version: 1.0
In-Reply-To: <1627059339-12142-1-git-send-email-khsieh@codeaurora.org>
References: <1627059339-12142-1-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 26 Jul 2021 17:01:57 -0400
Message-ID: <CAE-0n51HF8E7x71Ru4EXoyYePoBNcrngwUE6H7b=tpgXuHdxHQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: signal audio plugged change at dp_pm_resume
To:     Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-07-23 09:55:39)
> There is a scenario that dp cable is unplugged from DUT during system
> suspended  will cause audio option state does not match real connection
> state. Fix this problem by Signaling audio plugged change with realtime
> connection status at dp_pm_resume() so that audio option will be in
> correct state after system resumed.
>
> Changes in V2:
> -- correct Fixes tag commit id.
>
> Fixes: f591dbb5fb8c ("drm/msm/dp: power off DP phy at suspend")
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 78c5301..2b660e9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1339,6 +1339,10 @@ static int dp_pm_resume(struct device *dev)
>         else
>                 dp->dp_display.is_connected = false;
>
> +       dp_display_handle_plugged_change(g_dp_display,

Can this be dp_display instead of g_dp_display?

> +                               dp->dp_display.is_connected);
> +
> +
>         mutex_unlock(&dp->event_mutex);
>
>         return 0;
