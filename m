Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10D063E8577
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 23:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234974AbhHJVgX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 17:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234919AbhHJVgT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 17:36:19 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A454EC0617A0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 14:35:55 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 108-20020a9d01750000b029050e5cc11ae3so818281otu.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 14:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=+XhXVGH3fkIOnE1t2XNmliygvN33fb2RS+mFgm8hrtU=;
        b=nssXy17hVHdZO0veyfk+XdCrAZ190q+aijoQHy4Dd8jrwccS37npEBDWKfa3tVRsX/
         +Fl4rkROGtig5v474uHf01f0pMk20xiMuc0h1oIPnL+D2G1YT6fL3foT9JFhM9c//9dr
         RsidGeTpYH3eYySbmAdTb06F49h/EbOOXoBT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=+XhXVGH3fkIOnE1t2XNmliygvN33fb2RS+mFgm8hrtU=;
        b=EC10rRTAtR2UIeAKm7wgfOvh/5lZEnn03bZLDXV05rJwh4AB6G1O0IsjoyLZ6aDXfT
         DwjHL9n0b6oKHhtby1wy2Uvb3LNQBM3Ya12X7x76qqdprajD6byYmqzBwSbgp++kAymr
         PVNH7W6Tm1q3hSBQfk2Oe89CvgFu4YkXhD6jTv/v8oYu1J3ObZ7GNrWfBPIaTafYrO3L
         86HbgbSQpccZuidl7s/zCQjtY0QGw0RmjgryS3LpBGHS0b/KxmGHNoglIRWiuMYU4WiQ
         G0pZlHUckByDHwt8ct6+RVe/fkQw5Za46muXNqs1MojczQ6ur8E+HMhzD5kaPmLbVBsO
         JaSg==
X-Gm-Message-State: AOAM532o+Yprk4GK8IUZDcAPF3pnKFw031n3dwOP42nCbgaU1weKkmiQ
        Km19TFWVbnuc7NGPMPZZkGwALA/AmXJS4kt0itSBVA==
X-Google-Smtp-Source: ABdhPJyiH0XE2MMSHvDD3YnTgiPVuRbdk1llKiBAiTDs/gIGZngoYWW5dJsF6iglEkjwRPIOdlrPTB7kIDitYcTjbyY=
X-Received: by 2002:a05:6830:1490:: with SMTP id s16mr22748568otq.233.1628631355080;
 Tue, 10 Aug 2021 14:35:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Aug 2021 14:35:54 -0700
MIME-Version: 1.0
In-Reply-To: <1628196295-7382-7-git-send-email-khsieh@codeaurora.org>
References: <1628196295-7382-1-git-send-email-khsieh@codeaurora.org> <1628196295-7382-7-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 10 Aug 2021 14:35:54 -0700
Message-ID: <CAE-0n52n6ypCLrA3mWHekh9Caq8rT5ngV2X5MWdGYA8DJQb92g@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] drm/msm/dp: do not end dp link training until
 video is ready
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

Quoting Kuogee Hsieh (2021-08-05 13:44:55)
> Initialize both pre-emphasis and voltage swing level to 0 before
> start link training and do not end link training until video is
> ready to reduce the period between end of link training and video
> start to meet Link Layer CTS requirement.  Some dongle main link
> symbol may become unlocked again if host did not end link training
> soon enough after completion of link training 2. Host have to re
> train main link if loss of symbol locked detected before end link
> training so that the coming video stream can be transmitted to sink
> properly. This fixes Link Layer CTS cases 4.3.2.1, 4.3.2.2, 4.3.2.3
> and 4.3.2.4.
>
> Changes in v3:
> -- merge retrain link if loss of symbol locked happen into this patch
> -- replace dp_ctrl_loss_symbol_lock() with dp_ctrl_channel_eq_ok()
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
