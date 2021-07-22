Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16BC03D2C82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 21:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbhGVSds (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 14:33:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbhGVSds (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 14:33:48 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EDD2C061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 12:14:23 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id u15so7762108oiw.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 12:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=wSvpCRiJmPrrtav1DmRC8DqUe0S6Omo2vxlNGYfx92Q=;
        b=Go+wWAXUxyLK4e/Lq/KcAs1fXB+LWfLLQGaA8F9OwN0D7tI2y8wDFaSbucrENDCWwg
         wF5r2zdEqu9iOztnA/2aZEePbF7+AIVFkvkIK5FZl2o0Zy0ITF4L9CNjlzoOsS4sRSEF
         V1sSVkDnZA03rV6XsH94QXCNGpRxh4VuKb+28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=wSvpCRiJmPrrtav1DmRC8DqUe0S6Omo2vxlNGYfx92Q=;
        b=eCNhf+a9NgdtvJfbsqeR8TwlGsMcLy9XySzjz00n4dEgDIiTPyPyyEoaaZ3pG4AS7o
         e1eqlAPEfmz7nSl4iBFzvjtjY76KWR0DmWIsY2ciphcpvssh+AGDFZdAHt1V51Z6Ry+M
         g65m9i5dSHH6TxYO3zFLVE4577q1jWx5Yz1CFsm1FzFINLOEZMjYDw+y/W1yp/Tw5YkL
         KU0t2fggAODUKLh5hTZ5CxupN+iidcm39KdTW8XIKgYlwhW358a/n8zAI+AV7W9u3imH
         F48JVjFaUe7fh5g/czsKqcalriODdMr0VX4AoILax6JNvUZDUMhcXrGSt9I/GU5xtpa/
         7T9w==
X-Gm-Message-State: AOAM533U41MRQAw1cly5p1vg6irA28tRnE7L+oAECDFkBwPpB9wzQXpb
        9OtJg5ZTMwUdW+39SzzXcGISioHzHIpZbqgNgiD1Pg==
X-Google-Smtp-Source: ABdhPJw7Jt83PWgkfrVNzrviXsR60shUZD8zaTYGns8S9nFsjxPcFIie+Z6Wfga+wCD/0nvVj837eKPNf/ac32p/eOQ=
X-Received: by 2002:a05:6808:114a:: with SMTP id u10mr1052996oiu.19.1626981262785;
 Thu, 22 Jul 2021 12:14:22 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 19:14:21 +0000
MIME-Version: 1.0
In-Reply-To: <1626191647-13901-8-git-send-email-khsieh@codeaurora.org>
References: <1626191647-13901-1-git-send-email-khsieh@codeaurora.org> <1626191647-13901-8-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 22 Jul 2021 19:14:21 +0000
Message-ID: <CAE-0n525b3V9D+aT_xwHQK-g6SjAXse4j7f1wHQHzeL3EEFV_w@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] drm/msm/dp: retrain link when loss of symbol lock detected
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

Quoting Kuogee Hsieh (2021-07-13 08:54:07)
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 6a013b0..20951c8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1638,6 +1638,25 @@ static bool dp_ctrl_clock_recovery_any_ok(
>         return drm_dp_clock_recovery_ok(link_status, lane_count);
>  }
>
> +static bool dp_ctrl_loss_symbol_lock(struct dp_ctrl_private *ctrl)
> +{
> +       u8 link_status[DP_LINK_STATUS_SIZE];
> +       u8 status;
> +       int i;
> +       int num_lanes = ctrl->link->link_params.num_lanes;
> +
> +       dp_ctrl_read_link_status(ctrl, link_status);
> +
> +       for (i = 0; i < num_lanes; i++) {
> +               status = link_status[i / 2];
> +               status >>= ((i % 2) * 4);
> +               if (!(status & DP_LANE_SYMBOL_LOCKED))
> +                       return true;
> +       }
> +
> +       return false;
> +}

Can this function move to drivers/gpu/drm/drm_dp_helper.c and be called
drm_dp_symbol_locked()?

> +
>  int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>  {
>         int rc = 0;
