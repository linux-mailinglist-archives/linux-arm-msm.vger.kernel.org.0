Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F01702A35A2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Nov 2020 21:59:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725940AbgKBU7w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 15:59:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbgKBU7v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 15:59:51 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 253DEC0617A6
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2020 12:59:51 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id 72so5521770pfv.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2020 12:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=q5hRvg/6DcxtLnxjORl58B2jfVZHXF3KMM5lzOgdOn8=;
        b=WXN69DxJRYJaU89iA6C2pmGpQL77jy5U0jrVQodzYXRCCdAdOg9KwFE3ExQf0m4LHw
         xW51LYrHhEISI2WyLtV5h0ymbtc652jMW0sVwFZGuATC9s/0gqElIq6FJShqYlVee7yP
         NmmIyz4G6EWyvZ+upWJY8R9WH678D/3vZ2yA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=q5hRvg/6DcxtLnxjORl58B2jfVZHXF3KMM5lzOgdOn8=;
        b=SvG7hS140VbkpnrOO6t+MLPQ7Ysu05qoyRVl8MmbnR1srhsXifGO0/4nDZO4+kBLz9
         A4iWeKGjyuKGjapZj5mWUc+ImV/6QY0YSiZqsPqlRT4Lm+h4tDlwiuZzajP6gJHyUgqx
         ehO5Zj/DWfYGyoKl/OaZqZXy1+C8+6cnQYz1qnUpcmsi35H6DIyTs5DcpMIttxrlKGtk
         qQb6NXAVkhP64Lpgbp+Vhqq8GCXy4D9eRTuGf2bNxk/SGKGvHI0GRw0N8ZcrP3qxqR4h
         OlMMGn66NVRNUNP4onYtGAuqjukQ/UTnehoZ0i33iLAGafsUOidVLvcitpp25flm/E3B
         etTw==
X-Gm-Message-State: AOAM533edAJwrhVZ1KxPPaa0VKWw9OhXHgBeVDcus3WZkq91i43VQfBV
        KGR3PbBKrFS9UpNBhQS6bQlhqA==
X-Google-Smtp-Source: ABdhPJwnIySJ6epBGGGPfeprbUrDnqAx9bdhANANxFSbp8CC2E/eKgMoO1YKlBDE6hCkoXzIyXYzmw==
X-Received: by 2002:a63:1e5e:: with SMTP id p30mr14585323pgm.159.1604350790604;
        Mon, 02 Nov 2020 12:59:50 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id w19sm10682371pff.76.2020.11.02.12.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 12:59:50 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201030232253.11049-1-khsieh@codeaurora.org>
References: <20201030232253.11049-1-khsieh@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: deinitialize mainlink if link training failedo
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org,
        rnayak@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
To:     Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
        sean@poorly.run
Date:   Mon, 02 Nov 2020 12:59:48 -0800
Message-ID: <160435078857.884498.13223713108695196370@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2020-10-30 16:22:53)
> DP compo phy have to be enable to start link training. When
> link training failed phy need to be disabled so that next
> link trainng can be proceed smoothly at next plug in. This

s/trainng/training/

> patch de initialize mainlink to disable phy if link training

s/de/de-/

> failed. This prevent system crash due to
> disp_cc_mdss_dp_link_intf_clk stuck at "off" state.  This patch
> also perform checking power_on flag at dp_display_enable() and
> dp_display_disable() to avoid crashing when unplug cable while
> display is off.
>=20
> Fixes: fdaf9a5e3c15 (drm/msm/dp: fixes wrong connection state caused by f=
ailure of link train
>=20

Drop newline please.

> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Can you send this as a patch series? There were three patches sent near
each other and presumably they're related.

>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 34 +++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++++++++
>  2 files changed, 45 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp=
_ctrl.c
> index cee161c8ecc6..904698dfc7f7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1468,6 +1468,29 @@ static int dp_ctrl_reinitialize_mainlink(struct dp=
_ctrl_private *ctrl)
>         return ret;
>  }
> =20
> +static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
> +{
> +       struct dp_io *dp_io;
> +       struct phy *phy;
> +       int ret =3D 0;

Please drop this initialization to 0.

> +
> +       dp_io =3D &ctrl->parser->io;
> +       phy =3D dp_io->phy;
> +
> +       dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
> +
> +       dp_catalog_ctrl_reset(ctrl->catalog);
> +
> +       ret =3D dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);

As it's overwritten here.

> +       if (ret)
> +               DRM_ERROR("Failed to disable link clocks. ret=3D%d\n", re=
t);
> +
> +       phy_power_off(phy);
> +       phy_exit(phy);
> +
> +       return -ECONNRESET;

Isn't this an error for networking connections getting reset? Really it
should return 0 because it didn't fail.

> +}
> +
>  static int dp_ctrl_link_maintenance(struct dp_ctrl_private *ctrl)
>  {
>         int ret =3D 0;
> @@ -1648,8 +1671,7 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>         if (rc)
>                 return rc;
> =20
> -       while (--link_train_max_retries &&
> -               !atomic_read(&ctrl->dp_ctrl.aborted)) {
> +       while (--link_train_max_retries) {
>                 rc =3D dp_ctrl_reinitialize_mainlink(ctrl);
>                 if (rc) {
>                         DRM_ERROR("Failed to reinitialize mainlink. rc=3D=
%d\n",
> @@ -1664,6 +1686,9 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>                         break;
>                 } else if (training_step =3D=3D DP_TRAINING_1) {
>                         /* link train_1 failed */
> +                       if (!dp_catalog_hpd_get_state_status(ctrl->catalo=
g))
> +                               break;          /* link cable unplugged */
> +
>                         rc =3D dp_ctrl_link_rate_down_shift(ctrl);
>                         if (rc < 0) { /* already in RBR =3D 1.6G */
>                                 if (cr.lane_0_1 & DP_LANE0_1_CR_DONE) {
> @@ -1683,6 +1708,9 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>                         }
>                 } else if (training_step =3D=3D DP_TRAINING_2) {
>                         /* link train_2 failed, lower lane rate */
> +                       if (!dp_catalog_hpd_get_state_status(ctrl->catalo=
g))

Maybe make a function called dp_catalog_link_disconnected()? Then the
comment isn't needed.

> +                               break;          /* link cable unplugged */
> +
>                         rc =3D dp_ctrl_link_lane_down_shift(ctrl);
>                         if (rc < 0) {
>                                 /* end with failure */
> @@ -1703,6 +1731,8 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>          */
>         if (rc =3D=3D 0)  /* link train successfully */
>                 dp_ctrl_push_idle(dp_ctrl);
> +       else
> +               rc =3D dp_ctrl_deinitialize_mainlink(ctrl);

So if it fails we deinitialize and then return success? Shouldn't we
keep the error code from the link train attempt instead of overwrite it
with (most likely) zero? I see that it returns -ECONNRESET but that's
really odd and seeing this code here means you have to look at the
function to figure out that it's still returning an error code. Please
don't do that, just ignore the error code from this function.

> =20
>         return rc;
>  }
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp=
/dp_display.c
> index 3eb0d428abf7..13b66266cd69 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -529,6 +529,11 @@ static int dp_hpd_plug_handle(struct dp_display_priv=
ate *dp, u32 data)
>         if (ret) {      /* link train failed */
>                 hpd->hpd_high =3D 0;
>                 dp->hpd_state =3D ST_DISCONNECTED;
> +
> +               if (ret =3D=3D -ECONNRESET) { /* cable unplugged */
> +                       dp->core_initialized =3D false;
> +               }

Style: Drop braces on single line if statements.

> +
>         } else {
>                 /* start sentinel checking in case of missing uevent */
>                 dp_add_event(dp, EV_CONNECT_PENDING_TIMEOUT, 0, tout);
> @@ -794,6 +799,11 @@ static int dp_display_enable(struct dp_display_priva=
te *dp, u32 data)
> =20
>         dp_display =3D g_dp_display;
> =20
> +       if (dp_display->power_on) {
> +               DRM_DEBUG_DP("Link already setup, return\n");
> +               return 0;
> +       }
> +
>         rc =3D dp_ctrl_on_stream(dp->ctrl);
>         if (!rc)
>                 dp_display->power_on =3D true;
> @@ -826,6 +836,9 @@ static int dp_display_disable(struct dp_display_priva=
te *dp, u32 data)
> =20
>         dp_display =3D g_dp_display;
> =20
> +       if (!dp_display->power_on)
> +               return -EINVAL;
> +
>         /* wait only if audio was enabled */
>         if (dp_display->audio_enabled) {
>                 if (!wait_for_completion_timeout(&dp->audio_comp,
>=20
> base-commit: fd4a29bed29b3d8f15942fdf77e7a0a52796d836

What is this commit?
