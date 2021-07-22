Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D40453D2CB2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 21:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbhGVSm5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 14:42:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbhGVSm4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 14:42:56 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79FB8C061575
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 12:23:30 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id 128-20020a4a11860000b029024b19a4d98eso1568869ooc.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 12:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Tukn/VFkq/zbIvAQBZJ2D2pBDgI6O7uP6V5gIA4z0Cs=;
        b=izcRIsj/EbWJh2UlEyRKj40y1KJNwWt0Q2c1z272aeGQMkliR2QZrhh6QNUdoR5Es9
         V7pk9F6usbRo2am9EmW+nMLQuE1okDufGPdBXN7H1h4O/JeHfh9UN2viQ0WoQufBZdph
         iaC04st/zMeCrBtvGKAC1cuw8RO+Evjuza5s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Tukn/VFkq/zbIvAQBZJ2D2pBDgI6O7uP6V5gIA4z0Cs=;
        b=F1naNbt56mZfDuW92YTAknxSMKMUJpAUgM1xPmdfOztcIyn+03sRDJhuhvCjIszCQ/
         NPkaB3UCuNRRBkI0SGHE8kMaNMxtIWxNP80fSgA/bZsu9+v0WBBiDcm6uNNwWfG8/gkN
         MjCLKS+3GXTYyuXGV3I8gqzTUiFnMvkFWGK83a9XxBT1+LSd0/RA65wfSGKcAxY0yYmq
         DKqwiVv2Rmv7zEUYZ9avrKwFvtVom3eyrth2oX6ygEAhuyL6THop8f4Y8mCwRZL3pE4P
         RbFupUwZpwoCkhwmOU2KZZYKJv+X3kkArj3Suf0pQ5Tg7/SJyP3swLKLeH/s+BelgVFW
         428Q==
X-Gm-Message-State: AOAM533R67kPZmJK4cLt0ipfG2MD7+ffSPmHh/1g0Bs/oQuSR7KfTUDq
        U+HnXjnTNDkEYdxN2qDHwI+jUcMacg8VDg7KP7xWXw==
X-Google-Smtp-Source: ABdhPJwOn1Wqvg6925aBRm1hyQfmTcQevAAVZRd+qWgj03ySy8FvBlagvUplNKj1BkW0pcDmQUOYtYNffSKp8cW+XBM=
X-Received: by 2002:a4a:9783:: with SMTP id w3mr646286ooi.80.1626981809874;
 Thu, 22 Jul 2021 12:23:29 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 19:23:29 +0000
MIME-Version: 1.0
In-Reply-To: <1626191647-13901-6-git-send-email-khsieh@codeaurora.org>
References: <1626191647-13901-1-git-send-email-khsieh@codeaurora.org> <1626191647-13901-6-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 22 Jul 2021 19:23:29 +0000
Message-ID: <CAE-0n539r5zQx7zX9bECspKUAypQ8VucgeMNTmqAjHOCemVmOg@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] drm/msm/dp: return correct edid checksum after
 corrupted edid checksum read
To:     Kuogee Hsieh <khsieh@codeaurora.org>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-07-13 08:54:05)
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 88196f7..0fdb551 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -303,7 +303,12 @@ void dp_panel_handle_sink_request(struct dp_panel *dp_panel)
>         panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
>
>         if (panel->link->sink_request & DP_TEST_LINK_EDID_READ) {
> -               u8 checksum = dp_panel_get_edid_checksum(dp_panel->edid);
> +               u8 checksum;
> +
> +               if (dp_panel->edid)
> +                       checksum = dp_panel_get_edid_checksum(dp_panel->edid);
> +               else
> +                       checksum = dp_panel->connector->real_edid_checksum;

Is there any reason why we can't use connector->real_edid_checksum all
the time?

>
>                 dp_link_send_edid_checksum(panel->link, checksum);
>                 dp_link_send_test_response(panel->link);
