Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC1F372518
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 May 2021 06:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbhEDEbk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 May 2021 00:31:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbhEDEbk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 May 2021 00:31:40 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 913CAC06174A
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 May 2021 21:30:45 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id q7-20020a9d57870000b02902a5c2bd8c17so6496488oth.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 May 2021 21:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=uW8f+s6xq4qAcq3HteqNyRrQN93bF04v9vZ/QplP8pc=;
        b=n07xEkrQlpcNFHZtxrsbxZDJwL4UA2XXfU57czlJaBZdhz5dhG2P0aX3piaOhtfaYk
         mZxQDWRyM2Q0bBkDd/Sf5YcxIjE3igvPrYlfaQW0PbFon2KVErZwDxLzOcJX8R6hlWnp
         hvflSpdfnmEV0kTYIFbtFLVmseavbB/WvPUTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=uW8f+s6xq4qAcq3HteqNyRrQN93bF04v9vZ/QplP8pc=;
        b=KBGkI4+1dHJDcBRnrkBBlwFJ0l6wo5JOFf4BOuGMW7vASIlr9BNGgA36icy93Dj9GP
         56zgnjEw08+GgrCa/WHWkKPPoAzWoPaJQklFVATG5VB9fG88KALktPbOKx7KCux61nbA
         CdBxfzQ8laK2pVj352viBbTD+NcG1d6FpCthP2giUKgAsXmTbXYKth520/861amBNUH0
         94o34R353igPqa88O0+zjwyeOlb0nwNBC03jihH7cju+wqbtRiESW5LH8gM4Hka83yTy
         /rNe0QilZiM/kJnJNoCZyAuUN+UtJeFkz3xARTEAOfPnU7qBlN8K5NOjyFh7IfMQxhKB
         DdaQ==
X-Gm-Message-State: AOAM533IPZDJomTRoT0U2rV7sdvuWRdXrMRf2t0Hzjnh1i1Xzu56/caM
        uN1937Lk1FjiT0uMcctIe7xs2NNfBj2QJ5+c2pFKOw==
X-Google-Smtp-Source: ABdhPJwq6mdnfPJ4VcbDYA3afNLoRfzA/g9YDHhjK7Sh6BJt5OqOsgrHpb7zBzgoWlk7yUMrL73oVH49hU1RgHE5DN0=
X-Received: by 2002:a9d:222a:: with SMTP id o39mr16982065ota.246.1620102644899;
 Mon, 03 May 2021 21:30:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 3 May 2021 21:30:44 -0700
MIME-Version: 1.0
In-Reply-To: <1619048258-8717-2-git-send-email-khsieh@codeaurora.org>
References: <1619048258-8717-1-git-send-email-khsieh@codeaurora.org> <1619048258-8717-2-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 3 May 2021 21:30:44 -0700
Message-ID: <CAE-0n53_CMed87hPgBFjN_dmRrPkfG3ZBjHCni2+2kxp_QfFpw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] drm/msm/dp: check sink_count before update
 is_connected status
To:     Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
        sean@poorly.run
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-04-21 16:37:35)
> Link status is different from display connected status in the case
> of something like an Apple dongle where the type-c plug can be
> connected, and therefore the link is connected, but no sink is
> connected until an HDMI cable is plugged into the dongle.
> The sink_count of DPCD of dongle will increase to 1 once an HDMI
> cable is plugged into the dongle so that display connected status
> will become true. This checking also apply at pm_resume.
>
> Changes in v4:
> -- none
>
> Fixes: 94e58e2d06e3 ("drm/msm/dp: reset dp controller only at boot up and pm_resume")
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Tested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5a39da6..0ba71c7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -586,10 +586,8 @@ static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
>         mutex_lock(&dp->event_mutex);
>
>         state = dp->hpd_state;
> -       if (state == ST_CONNECT_PENDING) {
> -               dp_display_enable(dp, 0);
> +       if (state == ST_CONNECT_PENDING)
>                 dp->hpd_state = ST_CONNECTED;
> -       }

This part has been there since commit 8ede2ecc3e5e ("drm/msm/dp: Add DP
compliance tests on Snapdragon Chipsets") so we should add that tag here
too, like

Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on
Snapdragon Chipsets")

It would also be nice if this hunk was explained. It doesn't make sense
to me that a timeout would enable the display so maybe that can be
called out in the commit text about why we remove the call here.
