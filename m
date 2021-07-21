Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22E2A3D0850
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 07:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231926AbhGUEvw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 00:51:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232477AbhGUEvb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 00:51:31 -0400
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA9DDC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jul 2021 22:31:16 -0700 (PDT)
Received: by mail-oo1-xc2e.google.com with SMTP id i11-20020a4adf0b0000b0290263e1ba7ff9so317057oou.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jul 2021 22:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=AziQaKgOzZUdFImL39sMy7YXJdQjDBARvL6h2OcgT2I=;
        b=a4ru4eiW3xPSP8N5PGXQjfNDTp4fhMwakS2V6G/XjLGrPXHmoP6xtF86l/0AXm3/sQ
         Fz2nmqQz3GgbbIwktYanCYu32ipOjxIXh8fNbPRbs1C1YTrjAUy41rzxsTuyXED1ZLDa
         MMfCgwNmk19mF/1yAFudoBRMn+l6RcZ/nAv+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=AziQaKgOzZUdFImL39sMy7YXJdQjDBARvL6h2OcgT2I=;
        b=TuAnwsSyLV2cWlSYEqeAHs+2ChvhYi3PRyS/UTgmMOXCemcrOf1wTAe/1fC9JOHPQ3
         0C+fMUVKxW1D5gPBEdrebfowgeWEVWcfuHy7zG6OkHkyPybiwVIwUAWr0lfPiGJllDtk
         IJap37huXa88lyrjT91cbqutAMk89+BhxDWwrIldhARUtTam9Ef431gMnZOTvEWy3LeV
         ribTkW0N3xPVRBzlqKfYe2hE17sbSiNTsc8NL6wHAXA+Czv+aWDPYMpQp080HD9k1sCC
         CV797uRwcG8P90S+43tsp8ybtu9mvQr2nSfh+QkpVa9wYAnkmxTLNBtarYj0+7bf4Ci8
         oJ9A==
X-Gm-Message-State: AOAM531IXmkcs96quHhGLfOg0N+zV/rTJ9bqf1AI3BQPA7+9CqRi71vC
        79TcYAT0ENi2NTY/+Cr/+7EtRN/I0sfZmoEWlCKopg==
X-Google-Smtp-Source: ABdhPJzBLUzjbGsYAqGoi/pDY5vm7sdHcdIspq2qL0j/Yu9mQneMPHNpkEf6T2iJ8i9LmcG7vFrwUcyotsgzJI4fTP4=
X-Received: by 2002:a4a:9783:: with SMTP id w3mr19466639ooi.80.1626845476096;
 Tue, 20 Jul 2021 22:31:16 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 05:31:15 +0000
MIME-Version: 1.0
In-Reply-To: <1626820770-28158-1-git-send-email-maitreye@codeaurora.org>
References: <1626820770-28158-1-git-send-email-maitreye@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 21 Jul 2021 05:31:15 +0000
Message-ID: <CAE-0n52+E0eTgK_4x3OVnqv+U_12tMqxZYtcu3t+FiCJeaq2_g@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dp: add logs across DP driver for ease of debugging
To:     dri-devel@lists.freedesktop.org, maitreye <maitreye@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org,
        abhinavk@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting maitreye (2021-07-20 15:39:30)
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index be986da..316e8e6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -1036,43 +1036,46 @@ int dp_link_process_request(struct dp_link *dp_link)
>
>         if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
>                 dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
> -               return ret;
> +               goto out;
>         }
>
>         ret = dp_link_process_ds_port_status_change(link);
>         if (!ret) {
>                 dp_link->sink_request |= DS_PORT_STATUS_CHANGED;
> -               return ret;
> +               goto out;
>         }
>
>         ret = dp_link_process_link_training_request(link);
>         if (!ret) {
>                 dp_link->sink_request |= DP_TEST_LINK_TRAINING;
> -               return ret;
> +               goto out;
>         }
>
>         ret = dp_link_process_phy_test_pattern_request(link);
>         if (!ret) {
>                 dp_link->sink_request |= DP_TEST_LINK_PHY_TEST_PATTERN;
> -               return ret;
> +               goto out;
>         }
>
>         ret = dp_link_process_link_status_update(link);

if ret == 0 we go into the if below and goto out.

>         if (!ret) {
>                 dp_link->sink_request |= DP_LINK_STATUS_UPDATED;
> -               return ret;
> +               goto out;
>         }

At this point ret != 0 due to the goto above.

>
>         if (dp_link_is_video_pattern_requested(link)) {
> -               ret = 0;

And now we've removed the ret = 0 assignment from here.

>                 dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;
> +               goto out;

And then we goto out. Isn't this a behavior change? Still feels like we
should be using if/else-if logic here instead of this goto maze.

>         }
>
>         if (dp_link_is_audio_pattern_requested(link)) {
>                 dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
> -               return -EINVAL;
> +               ret = -EINVAL;
> +               goto out;
>         }
>
> +out:
> +       DRM_DEBUG_DP("sink request=%#x", dp_link->sink_request);
>         return ret;
>  }
>
