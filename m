Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB5731DE72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 18:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234627AbhBQRh7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 12:37:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234519AbhBQRhD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 12:37:03 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B75D2C0613D6
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Feb 2021 09:36:22 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id d2so2085239pjs.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Feb 2021 09:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=WY6BWQE+OiB63lkzsmOgRmOC11+SnGhNqoMsqPgupK0=;
        b=GprgssCWFqAFmY0cF2yEF2MPhDCjdfUL8SjA6Y++eq8i4XcOu4c8qwI3dKrBcZABFQ
         McRxKZJkcg7vkbxQJFUJwisk5b9MME3e2RUDKt+voxBDyp+sc7W7UNA9z41HvXUI7KpG
         G/CgtqDUunpMsp4gDi7IUyw+U4sU+HoYw8OwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=WY6BWQE+OiB63lkzsmOgRmOC11+SnGhNqoMsqPgupK0=;
        b=BgdwG0fIpkW5AUIfNgRFGQL3nTgLlRXTTXXEAPDidJVYcPmcycbzwymqhABOuhA9X+
         UpWsEOB0lROgCQsMLjhqQ3ZHdEcW7RYs+YxmuSaKkLCo5YmhbdwrrlGIvPsu62DZxAfD
         422U+OYh+XvOUXPxpuCV+1UHIH5piJIDCwCrfUvFhf9ugweZiv3wiw8Qo8yTzY0fTd0N
         9usDZZ/xeoYjYxCQQFTuVEoZdqbIndZy9l7EC6FQnwSezryBxrAIIxsqyvNjFFRmTJS7
         VPq6CeeMj+nhrWmQIv3e4U7evvkkIBXsaWfTr7QUnOZX74pWPVnyvvwQz4DuLT8If9Tj
         AW8w==
X-Gm-Message-State: AOAM533P/942aJFt6enm3dl4GR86i+DfqeUcF3QQO36ex3szZxJR6aBq
        gVJPtWUIFqKnqp3d/53bevCPtw==
X-Google-Smtp-Source: ABdhPJyhWhQ9ajxWuvuPPlk0WDsx0eU1nYFqyGy8fAj+49lGy1XE7lbsHVRetwAlivzQsGqhK0yUdQ==
X-Received: by 2002:a17:90a:aa0d:: with SMTP id k13mr10652749pjq.210.1613583382027;
        Wed, 17 Feb 2021 09:36:22 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:e915:2799:f43d:3184])
        by smtp.gmail.com with ESMTPSA id np7sm2638673pjb.10.2021.02.17.09.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 09:36:21 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1613581122-8473-1-git-send-email-khsieh@codeaurora.org>
References: <1613581122-8473-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: add support of HBR3 link rate
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
To:     Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
        sean@poorly.run, Vinod Koul <vkoul@kernel.org>
Date:   Wed, 17 Feb 2021 09:36:18 -0800
Message-ID: <161358337887.1254594.12898848287081049541@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-02-17 08:58:42)
> Add hbr3_hbr2 voltage and pre-emphasis swing table to support
> HBR3 link rate
>=20
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_panel.c   |  4 ----
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 24 ++++++++++++++++++++++--

This spans to subsystems so at least you should run get_maintainers and
include phy maintainers. Maybe it should be split into two patches too
so it can go via different trees.

>  2 files changed, 22 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/d=
p_panel.c
> index 9cc8166..63112fa 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -76,10 +76,6 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_pane=
l)
>         if (link_info->num_lanes > dp_panel->max_dp_lanes)
>                 link_info->num_lanes =3D dp_panel->max_dp_lanes;
> =20
> -       /* Limit support upto HBR2 until HBR3 support is added */
> -       if (link_info->rate >=3D (drm_dp_bw_code_to_link_rate(DP_LINK_BW_=
5_4)))
> -               link_info->rate =3D drm_dp_bw_code_to_link_rate(DP_LINK_B=
W_5_4);
> -
>         DRM_DEBUG_DP("version: %d.%d\n", major, minor);
>         DRM_DEBUG_DP("link_rate=3D%d\n", link_info->rate);
>         DRM_DEBUG_DP("lane_count=3D%d\n", link_info->num_lanes);
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/p=
hy-qcom-qmp.c
> index 0939a9e..cc5ef59 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -2965,6 +2965,21 @@ static void qcom_qmp_phy_dp_aux_init(struct qmp_ph=
y *qphy)
>                qphy->pcs + QSERDES_V3_DP_PHY_AUX_INTERRUPT_MASK);
>  }
> =20
> +
> +static u8 const qmp_dp_v3_pre_emphasis_hbr3_hbr2[4][4] =3D {

Should be static const u8 qmp_dp...

> +        {0x00, 0x0C, 0x15, 0x1A},
> +        {0x02, 0x0E, 0x16, 0xFF},
> +        {0x02, 0x11, 0xFF, 0xFF},
> +        {0x04, 0xFF, 0xFF, 0xFF}
> +};
> +
> +static u8 const qmp_dp_v3_voltage_swing_hbr3_hbr2[4][4] =3D {

Same.

> +        {0x02, 0x12, 0x16, 0x1A},

Please add a space after { and before } and use lowercase hex to match
the qmp_dp_v3_pre_emphasis_hbr_rbr design.

> +        {0x09, 0x19, 0x1F, 0xFF},
> +        {0x10, 0x1F, 0xFF, 0xFF},
> +        {0x1F, 0xFF, 0xFF, 0xFF}
> +};
> +
>  static const u8 qmp_dp_v3_pre_emphasis_hbr_rbr[4][4] =3D {
>         { 0x00, 0x0c, 0x14, 0x19 },
>         { 0x00, 0x0b, 0x12, 0xff },
> @@ -3000,8 +3015,13 @@ static void qcom_qmp_phy_configure_dp_tx(struct qm=
p_phy *qphy)
>                 drvr_en =3D 0x10;
>         }
> =20
> -       voltage_swing_cfg =3D qmp_dp_v3_voltage_swing_hbr_rbr[v_level][p_=
level];
> -       pre_emphasis_cfg =3D qmp_dp_v3_pre_emphasis_hbr_rbr[v_level][p_le=
vel];
> +       if (dp_opts->link_rate <=3D 2700) {
> +               voltage_swing_cfg =3D qmp_dp_v3_voltage_swing_hbr_rbr[v_l=
evel][p_level];
> +               pre_emphasis_cfg =3D qmp_dp_v3_pre_emphasis_hbr_rbr[v_lev=
el][p_level];
> +       } else {
> +               voltage_swing_cfg =3D qmp_dp_v3_voltage_swing_hbr3_hbr2[v=
_level][p_level];
> +               pre_emphasis_cfg =3D qmp_dp_v3_pre_emphasis_hbr3_hbr2[v_l=
evel][p_level];
> +       }
