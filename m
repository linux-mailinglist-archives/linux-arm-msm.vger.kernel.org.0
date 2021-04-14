Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 669DE35FD34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Apr 2021 23:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232243AbhDNVXO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Apr 2021 17:23:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbhDNVXN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Apr 2021 17:23:13 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7355C061756
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Apr 2021 14:22:51 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id kb13-20020a17090ae7cdb02901503d67f0beso308452pjb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Apr 2021 14:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=RwOM404YmU1KKr4Np2+NWPRKRhKCplH67w1Du3EIAzQ=;
        b=Q/PrJhcrkB4mA4Y/IyOwo4Y5/jw1VFleUeDObzYvyFXWkXyIsRs8uwsnv1Vyf9uZVn
         X4IK4yTUElUXiM6WM4wgRDVkFR0GnMD4W0hBDAq5xWOD8XwzxYCXZ9xuGVCfvl2IyRhs
         b9Nw/D9ta7A4r3gyOwPYoUo6JxoSjcDyKclUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=RwOM404YmU1KKr4Np2+NWPRKRhKCplH67w1Du3EIAzQ=;
        b=sCANO7jMoeAilRPZgfnySX6weiLOOWOCSEcvAH1NbgST5q1irXVBaCMR3QkaLIdeKB
         0yXW12QaWZWk6N6OWn2nuSvudraxdNU33C8LmRbY4qDbvDi2xl1KOSxHg0n33pzxh6c8
         4cL6u2yI+OSlEXGlZkRfvqrlUBDamqvCXJoQ5ixsQNuObvwNx9d48poMiylJP1hVh+73
         eJ6gL8XC9fqrp4wXqKJDWwhpoC/C8Ox8I7llJknH+24WzHATawj1Tw3RvTuqbutsCaRV
         Pcf0RwmqFGRP6gxntpHf4+Kqf8Ny8PrQi2TVxzN2XLZFZEpLK0mK2wDlQYhpJLesOdYx
         n/dQ==
X-Gm-Message-State: AOAM5320xEJedKJsrPFUZW8HNFouyjYmja+UtQB5CL3gS6E6ZsDVZFIe
        SpSA1Eef7YjNqahUFLzwiz64OLwuaFdDHg==
X-Google-Smtp-Source: ABdhPJx24gNc+irPfeI28vsit1JxAWe901EHCr3I7J4jq9hZYIxfEPuDHg/FpXbn5CxlkVPUjcZb2w==
X-Received: by 2002:a17:90b:3909:: with SMTP id ob9mr133410pjb.181.1618435371367;
        Wed, 14 Apr 2021 14:22:51 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:753e:814e:f002:498a])
        by smtp.gmail.com with ESMTPSA id e190sm301649pfe.3.2021.04.14.14.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 14:22:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1618434170-28302-1-git-send-email-khsieh@codeaurora.org>
References: <1618434170-28302-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [PATCH v2 2/3] drm/msm/dp: initialize audio_comp when audio starts
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
To:     Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
        sean@poorly.run
Date:   Wed, 14 Apr 2021 14:22:49 -0700
Message-ID: <161843536949.46595.14917924989191979850@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-04-14 14:02:50)
> Initialize audio_comp when audio starts and wait for audio_comp at
> dp_display_disable(). This will take care of both dongle unplugged
> and display off (suspend) cases.
>=20
> Changes in v2:
> -- add dp_display_start_audio()
>=20
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>

Looking better. Thanks!

> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp=
/dp_display.c
> index 0ba71c7..8a69bcd 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -177,6 +177,14 @@ static int dp_del_event(struct dp_display_private *d=
p_priv, u32 event)
> =20
>         return 0;
>  }
> +void dp_display_start_audio(struct msm_dp *dp_display)

Please unstick this from previous function by adding a newline above.

> +{
> +       struct dp_display_private *dp;
> +
> +       dp =3D container_of(dp_display, struct dp_display_private, dp_dis=
play);
> +
> +       reinit_completion(&dp->audio_comp);
> +}
> =20
>  void dp_display_signal_audio_complete(struct msm_dp *dp_display)
>  {
> @@ -648,10 +656,6 @@ static int dp_hpd_unplug_handle(struct dp_display_pr=
ivate *dp, u32 data)
>         /* start sentinel checking in case of missing uevent */
>         dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_S=
ECOND);
> =20
> -       /* signal the disconnect event early to ensure proper teardown */

This doesn't need to be done early anymore? Please mention why in the
commit text.

> -       reinit_completion(&dp->audio_comp);
> -       dp_display_handle_plugged_change(g_dp_display, false);
> -
>         dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK |
>                                         DP_DP_IRQ_HPD_INT_MASK, true);
> =20
> @@ -894,7 +898,6 @@ static int dp_display_disable(struct dp_display_priva=
te *dp, u32 data)
>         /* wait only if audio was enabled */
>         if (dp_display->audio_enabled) {
>                 /* signal the disconnect event */
> -               reinit_completion(&dp->audio_comp);
>                 dp_display_handle_plugged_change(dp_display, false);
>                 if (!wait_for_completion_timeout(&dp->audio_comp,
>                                 HZ * 5))
