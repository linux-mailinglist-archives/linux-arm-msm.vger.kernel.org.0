Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3BE93D2C54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 21:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbhGVSY6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 14:24:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbhGVSY5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 14:24:57 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F37F4C061575
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 12:05:31 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id o72-20020a9d224e0000b02904bb9756274cso6282455ota.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 12:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=congdFIKNx3UQvjcKCH7cpv7zvqp5GO1L/NygEo3sXY=;
        b=dDIPDFkyDDHfqVGTpIk+wx1GBgHwuS+5k3bX78JBMROdG0Il9Fa6gFRE3N4NL2Qk0f
         SqQZg2RIPA064hM8VFnMY2q+vHBzUFSnc7iN5K2p7p4BJ7A/sYHwrrcq3pXBnJC7CkMX
         6ETr8WW+bTfkdyUukPtX19G0Yed7uhKTttRjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=congdFIKNx3UQvjcKCH7cpv7zvqp5GO1L/NygEo3sXY=;
        b=WezcxYHYJt5IGDY4rVhRbd6wa52nInH67NJCbaQgA0hoTxlQH3qhznKuTev4add1qp
         DNE9OgsLb6jLEFZ/47wo8KlCcJU/WHDCvD8ZxQIM8j9kOX8L3iMFX+Isy4VuxqmXDlFG
         2L7hdlSRnC/6Be2bosqUbSzO+/fy+d81IGZ9dOlOckOs7Sz8GpLhUD7KsK1wwFpXl4yz
         JDdU4YZ4Mz+TqaE3rE7jm2BgmMvaJPKH7ecUybwEns/YhoBjX9jrTJjx26I/SVBJGs6E
         pQHaK+ocvkXUfxoyiqlEw8ms5qyGegNk+XC5TUEfW25jB4Ei+G7aknpe9fPsExictiIC
         p+mw==
X-Gm-Message-State: AOAM531DeTsEDwqc0ip6MlDFX6FcfBF+CZP8TEKWl0e96xO1aoHm1hCw
        xCZ+GCx/tAP4Tu5F8wIITZICgKCw2Cn6hfyhobhJBA==
X-Google-Smtp-Source: ABdhPJxszP1Nvb9QVLAphQ4FMRQGZNgHTiAOHsXtE6VBCSK4Mkx8qQEaF06I/qJbcI+d9b6gULejIcgtbhtlsXTT8NA=
X-Received: by 2002:a9d:8c7:: with SMTP id 65mr842433otf.25.1626980731332;
 Thu, 22 Jul 2021 12:05:31 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 19:05:30 +0000
MIME-Version: 1.0
In-Reply-To: <1626191647-13901-3-git-send-email-khsieh@codeaurora.org>
References: <1626191647-13901-1-git-send-email-khsieh@codeaurora.org> <1626191647-13901-3-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 22 Jul 2021 19:05:30 +0000
Message-ID: <CAE-0n52JWbqwZtSCcLyzpsaFyd8mRLiXxLO-9YDk5xMbj_uQiw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] drm/msm/dp: reduce link rate if failed at link
 training 1
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

Quoting Kuogee Hsieh (2021-07-13 08:54:02)
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 27fb0f0..92cf331 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1634,6 +1617,24 @@ void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl)
>         }
>  }
>
> +static bool dp_ctrl_clock_recovery_any_ok(
> +                       const u8 link_status[DP_LINK_STATUS_SIZE],
> +                       int lane_count)
> +{
> +       int lane_cnt;
> +
> +       /*
> +        * only interested in the lane number after reduced
> +        * lane_cnt = 4, then only interested in 2 lanes
> +        * lane_cnt = 2, then only interested in 1 lane
> +        */
> +       lane_cnt = lane_count >> 1;
> +       if (lane_cnt == 0)
> +               return false;
> +
> +       return drm_dp_clock_recovery_ok(link_status, lane_count);

This doesn't work? Because drm_dp_clock_recovery_ok() requires every
lane to be OK whereas this function wants any lane to be OK? It may make
sense to have drm_dp_clock_recovery_ok() return false if lane_count == 0
too.

> +}
> +
>  int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>  {
>         int rc = 0;
