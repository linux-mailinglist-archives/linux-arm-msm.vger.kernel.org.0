Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61033546EF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 23:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344735AbiFJVEr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 17:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346839AbiFJVEp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 17:04:45 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08A9B245A0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 14:04:44 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id bl34so722988oib.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 14:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=6BSSJ/rWsXUBg5MMoeJBHI5sh4Vg+Gf+Lk7kJ6t8nrM=;
        b=ldlk36TEpLb8bKM9kbq6yMC+kG1oiGHmPqVQxcVdRKo79hJxr7pqzJPr/BfNqZZJlT
         XSswpqq4c+gHIsrn8uVopdU6inApeuSxfIzbubd0SWZLVr1Q/SD6zdImR0WiqMGuATFR
         8QB4g9Dvv645HlH5d+XtOqkStx++qXkKgy4II=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=6BSSJ/rWsXUBg5MMoeJBHI5sh4Vg+Gf+Lk7kJ6t8nrM=;
        b=Dzg0LonBvcvLpABrhOfjpe3PRYFl0lL+3gaGUyQSbafisQHjtVi0E9aWfO2HLpgAnS
         cvEzYdBXLfsZUS7ssP2StnDvKLTFFZQmSPSCgFU41G1OoN38zblEjjJIivax1oLCvn4H
         FEoGDuHpEZu47Dlcm2RtfA/IOYxfoLZhONJLTsPGkHAhMG6Sjcl/3zRSRciUzuLNCP6n
         LRittlMJdk9kh6Bv4s3Ojpwml4ZNvbtCZWoDGDdDuZHnFtkW0bfbgHis6RNTKZ/rJxIX
         juKbfFqR8irF1vkMBkWwY5COMI079nFqAlXNCPh0EM/1218z91HD9iSO+CbSCMqIDsUX
         iOlw==
X-Gm-Message-State: AOAM532p0pcnI2PAUt2z8FIodbDyAkC5fppxG14l8yh/jL0V3WEfgXP2
        GZmHdmJCNiZqFQAbao6GJz8gslKApwYbg2RC3yDdqA==
X-Google-Smtp-Source: ABdhPJzGn0kc0KitEDzC39ApVuo0Gabefuaw+3AKA6iKU3xzQfk8aDXBAJ2dQY9eYenZKctLFWTXf3x1wQcbiYQgVe8=
X-Received: by 2002:a05:6808:1703:b0:32e:851e:7f81 with SMTP id
 bc3-20020a056808170300b0032e851e7f81mr924613oib.63.1654895083399; Fri, 10 Jun
 2022 14:04:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 10 Jun 2022 14:04:42 -0700
MIME-Version: 1.0
In-Reply-To: <1653687133-32331-1-git-send-email-quic_khsieh@quicinc.com>
References: <1653687133-32331-1-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 10 Jun 2022 14:04:42 -0700
Message-ID: <CAE-0n519jUEQK565OFVevvyoF49rgTazf4McjKmDS8mfDrWwyQ@mail.gmail.com>
Subject: Re: [PATCH v4] drm/msm/dp: force link training for display resolution change
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dianders@chromium.org, dmitry.baryshkov@linaro.org,
        robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-05-27 14:32:13)
> During display resolution changes display have to be disabled first
> followed by display enabling with new resolution. Display disable
> will turn off both pixel clock and main link clock so that main link
> have to be re trained during display enable to have new video stream

s/re/re-/

> flow again. At current implementation, display enable function manually
> kicks up irq_hpd_handle which will read panel link status and start link
> training if link status is not in sync state. However, there is rare
> case that a particular panel links status keep staying in sync for
> some period of time after main link had been shut down previously at
> display disabled. Main link retraining will not be executed by
> irq_hdp_handle() if the link status read from pane shows it is in

s/pane/panel/

> sync state. If this was happen, then video stream of newer display
> resolution will fail to be transmitted to panel due to main link is
> not in sync between host and panel. This patch force main link always
> be retrained during display enable procedure to prevent this rare
> failed case from happening. Also this implementation are more
> efficient than manual kicking off irq_hpd_handle function.

The description makes it sound like the link status is not updated,
sometimes. Isn't that the real issue here? Not that link training needs
to be done again (which it always does apparently), but that disabling
the display doesn't wait for the link to go down. Or disabling the link
is causing some sort of glitch on the sink causing it to report the
status as OK when it really isn't.

>
> Changes in v2:
> -- set force_link_train flag on DP only (is_edp == false)
>
> Changes in v3:
> -- revise commit  text
> -- add Fixes tag
>
> Changes in v4:
> -- revise commit  text
>
> Fixes: 62671d2ef24b ("drm/msm/dp: fixes wrong connection state caused by failure of link train")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index c388323..370348d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1688,10 +1689,14 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
>
>         state =  dp_display->hpd_state;
>
> -       if (state == ST_DISPLAY_OFF)
> +       if (state == ST_DISPLAY_OFF) {
>                 dp_display_host_phy_init(dp_display);
>
> -       dp_display_enable(dp_display, 0);
> +               if (!dp->is_edp)

Does this assume eDP has one resolution? I don't understand why eDP is
special here, especially if eDP has more than one resolution available
it seems like we would want to retrain the link regardless.

> +                       force_link_train = true;
> +       }
> +
> +       dp_display_enable(dp_display, force_link_train);
>
>         rc = dp_display_post_enable(dp);
>         if (rc) {
