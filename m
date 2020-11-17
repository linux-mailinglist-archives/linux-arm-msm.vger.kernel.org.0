Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 279912B55EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 02:00:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731007AbgKQBAQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 20:00:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbgKQBAQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 20:00:16 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14CE1C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2020 17:00:16 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id v21so2073665pgi.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2020 17:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=PuExbIj6CoeitWmQQjoOETDlqV6PNYzOVzDyJ83+bUM=;
        b=QIK29EeQBxKfUcrXB/o0zASZ0enH3DTfkTyOtmZv/6Kul0xepHNOrP6vcXrexOXTZr
         Jf7WPzyY+x36w8kkS6fijV02icwrKxoMEsT1/hK/7Xh4GJpYHbrJ1Lqf4YHYmRAKzw+2
         pQRmRF1jExMSGgLX1pwTHAY5KixKcCiArNfhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=PuExbIj6CoeitWmQQjoOETDlqV6PNYzOVzDyJ83+bUM=;
        b=D3ni9YGfMTY2o5XQIrskc1kGSi7xdA829MZq7EMYmh2Sio31f0efKCARLHfAg/NqVK
         zA9rHR7HnPXXZUhM5tbH9qO2nStiCJQPiy2O9MyCt4+gAaJRl471rQkT37F0zjjg4W+I
         FFci8mBoR1e4fiiLYMtMjTXvNTv71SSs2cxMEesOgKCP2Fl0e39Sz1Mx3g7LBfQWfH/N
         zWecDdIhdJ92FXFPG2tX5QJm89NZpqL29YipAERss3t7IAjSUn6A3vnH0C5JU/U3theV
         6Aas6NIbNgilEUsC3PwQJvKRtoxVYeKAa9FA4K90YfhrChCUDPx8tV/3n5UXPu9FsS9/
         lCgw==
X-Gm-Message-State: AOAM531QjmOzvvbNbZ6EhRoVNgjIUSd61XLb8scFZKb7ZaEqUrRI1RB4
        ByGhKFrUvMZwFx+OujuGGdO/uA==
X-Google-Smtp-Source: ABdhPJzohwSM2vGqzunfEj57/N7SS+yFjY7d2u20TWgXUDIMq5bsYUDz2+kVu7HVvVFWXPnuOH+lQw==
X-Received: by 2002:a63:565d:: with SMTP id g29mr1448743pgm.249.1605574815376;
        Mon, 16 Nov 2020 17:00:15 -0800 (PST)
Received: from chromium.org ([100.99.132.239])
        by smtp.gmail.com with ESMTPSA id i6sm641469pjt.49.2020.11.16.17.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 17:00:14 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201113222639.18786-1-khsieh@codeaurora.org>
References: <20201113222639.18786-1-khsieh@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: fix connect/disconnect handled at ir_hdp
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
To:     Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
        sean@poorly.run
Date:   Mon, 16 Nov 2020 17:00:12 -0800
Message-ID: <160557481298.60232.17821932910000059522@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2020-11-13 14:26:39)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp=
/dp_display.c
> index 27e7e27b8b90..4e84f500b721 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -279,13 +279,25 @@ static void dp_display_send_hpd_event(struct msm_dp=
 *dp_display)
>         drm_helper_hpd_irq_event(connector->dev);
>  }
> =20
> -static int dp_display_send_hpd_notification(struct dp_display_private *d=
p,
> -                                           bool hpd)
> +
> +static void dp_display_set_encoder_mode(struct dp_display_private *dp)
>  {
> -       static bool encoder_mode_set;
>         struct msm_drm_private *priv =3D dp->dp_display.drm_dev->dev_priv=
ate;
>         struct msm_kms *kms =3D priv->kms;
> +       static bool encoder_mode_set;

Can this be stored in the dp_display_private structure instead? No
singletons please.

> +
> +       if (!encoder_mode_set && dp->dp_display.encoder &&
> +                               kms->funcs->set_encoder_mode) {
> +               kms->funcs->set_encoder_mode(kms,
> +                               dp->dp_display.encoder, false);
> =20
> +               encoder_mode_set =3D true;
> +       }
> +}
> +
> +static int dp_display_send_hpd_notification(struct dp_display_private *d=
p,
> +                                           bool hpd)
> +{
>         if ((hpd && dp->dp_display.is_connected) ||
>                         (!hpd && !dp->dp_display.is_connected)) {
>                 DRM_DEBUG_DP("HPD already %s\n", (hpd ? "on" : "off"));
> @@ -491,17 +487,29 @@ static int dp_display_usbpd_attention_cb(struct dev=
ice *dev)
>         if (!rc) {
>                 sink_request =3D dp->link->sink_request;
>                 if (sink_request & DS_PORT_STATUS_CHANGED) {
> -                       /* same as unplugged */
> -                       hpd->hpd_high =3D 0;
> -                       dp->hpd_state =3D ST_DISCONNECT_PENDING;
> -                       dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
> -               }
> -
> -               rc =3D dp_display_handle_irq_hpd(dp);
> -
> -               if (!rc && (sink_request & DS_PORT_STATUS_CHANGED)) {
> -                       hpd->hpd_high =3D 1;
> -                       dp->hpd_state =3D ST_CONNECT_PENDING;
> +                       if (dp_display_is_sink_count_zero(dp)) {
> +                               DRM_DEBUG_DP("sink count is zero, nothing=
 to do\n");
> +                               if (dp->hpd_state !=3D ST_DISCONNECTED) {
> +                                       hpd->hpd_high =3D 0;
> +                                       dp->hpd_state =3D ST_DISCONNECT_P=
ENDING;
> +                                       dp_add_event(dp, EV_USER_NOTIFICA=
TION, false, 0);
> +                               }
> +                               rc =3D -ENOTCONN;
> +                       } else {
> +                               if (dp->hpd_state =3D=3D ST_DISCONNECTED)=
 {
> +                                       hpd->hpd_high =3D 1;

This else and then if can be an else if, right?

> +                                       dp->hpd_state =3D ST_CONNECT_PEND=
ING;
> +
> +                                       rc =3D dp_display_process_hpd_hig=
h(dp);
> +                                       if (rc) {
> +                                               hpd->hpd_high =3D 0;
> +                                               dp->hpd_state =3D ST_DISC=
ONNECTED;
> +                                       }
> +                               }
> +                       }
> +               } else {
> +                       if (!dp_display_is_ds_bridge(dp->panel))
> +                               rc =3D dp_display_handle_irq_hpd(dp);
>                 }
>         }
>
