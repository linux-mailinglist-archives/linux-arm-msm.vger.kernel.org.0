Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ECBE226F93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 22:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731133AbgGTUSv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 16:18:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727123AbgGTUSu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 16:18:50 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6836EC061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 13:18:50 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id m16so9214038pls.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 13:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=IYWIdH+NGn9f+uT9+p8Svev5ztA1QXiSTHkvwPECjIk=;
        b=lzTdQNSBlRpMrLjIcHSSvmo+F43QULnJblFSjXX0+ameOokbH3dbzODrESZLq/8mPW
         pZVyMqvN2PHt+yfQQKSXP86BmNAqOqG8tVFUvlcU2iXKRnc1AlBj122e60gAFWj1ZJMb
         eLBMYBDH3tBBHm01aCnoM0EqfKB+1pFfwBiig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=IYWIdH+NGn9f+uT9+p8Svev5ztA1QXiSTHkvwPECjIk=;
        b=iazNUuPPVOo8JFN64KGO+ldcKBNcTpo+HS54blW2STXjSmeSkeFkt+qpj4wDjR6nlU
         sxsnv/mgChgSb3+9RgJeBc0ClHddkCthnT/tA6RwqD7lxYO03+ntteMmw/MQnhWqzlnf
         1AoCekM781XlFSS5NtZ70OP2vR86dzqcEYR4lkw6aVjLwIkv3NXWcCAoBVuraWokZuNA
         MFti6ScXAsgeQY8U8k54GkTCP339gjNh7dpnRTXHNR8aGQvofwpYrRjvgzz54oAZceSW
         b8H9tv3EL7v9FyJ1j5/ESMyDGqTZkcmxPHmLvZFxagA4sVpV32oYKSNau0dD3/5tqT22
         kE4Q==
X-Gm-Message-State: AOAM531Ucj62Y5e5WNkHBeWq+6aqqIQSbrwSG9yK21eCRJcAyYE/cqbp
        D+G46ctR4rd/6jXz/U5BibzbWw==
X-Google-Smtp-Source: ABdhPJworTTfrzaRNagC5m0TTCXTLt6OYiqnjY8NCoQmRmsnhw2DgNuIH+QZUwEIAu8qd6rM/ZyZ7A==
X-Received: by 2002:a17:90b:1103:: with SMTP id gi3mr1007863pjb.132.1595276329602;
        Mon, 20 Jul 2020 13:18:49 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id f207sm18251219pfa.107.2020.07.20.13.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 13:18:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200707184125.15114-1-khsieh@codeaurora.org>
References: <20200707184125.15114-1-khsieh@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
To:     Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
        sean@poorly.run
Date:   Mon, 20 Jul 2020 13:18:48 -0700
Message-ID: <159527632812.1987609.6364896740387949838@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2020-07-07 11:41:25)
> add event thread to execute events serially from event queue. Also
> timeout mode is supported  which allow an event be deferred to be
> executed at later time. Both link and phy compliant tests had been
> done successfully.
>=20
> This change depends-on following series:
>         https://lore.kernel.org/dri-devel/20200630184507.15589-1-tanmay@c=
odeaurora.org/
>=20

Can this be sent along with that series?=20

> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  12 +-
>  drivers/gpu/drm/msm/dp/dp_aux.c             |   4 +
>  drivers/gpu/drm/msm/dp/dp_aux.h             |   1 +
>  drivers/gpu/drm/msm/dp/dp_catalog.c         |  78 ++-
>  drivers/gpu/drm/msm/dp/dp_ctrl.c            | 361 +++++++----
>  drivers/gpu/drm/msm/dp/dp_ctrl.h            |   3 +-
>  drivers/gpu/drm/msm/dp/dp_display.c         | 654 +++++++++++++-------
>  drivers/gpu/drm/msm/dp/dp_hpd.c             |   2 +-
>  drivers/gpu/drm/msm/dp/dp_hpd.h             |   1 +
>  drivers/gpu/drm/msm/dp/dp_link.c            |  22 +-
>  drivers/gpu/drm/msm/dp/dp_panel.c           |  56 +-
>  drivers/gpu/drm/msm/dp/dp_panel.h           |  10 +-
>  drivers/gpu/drm/msm/dp/dp_parser.c          |  45 +-
>  drivers/gpu/drm/msm/dp/dp_parser.h          |   2 +
>  drivers/gpu/drm/msm/dp/dp_power.c           |  32 +-
>  drivers/gpu/drm/msm/dp/dp_power.h           |   1 +
>  drivers/gpu/drm/msm/dp/dp_reg.h             |   1 +
>  17 files changed, 861 insertions(+), 424 deletions(-)

It seems to spread various changes throughout the DP bits and only has a
short description about what's changing. Given that the series above
isn't merged it would be better to get rid of this change and make the
changes in the patches that introduce these files.

>=20
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_encoder.c
> index b439e482fc80..87b291b8d7b7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1183,13 +1183,6 @@ static void dpu_encoder_virt_disable(struct drm_en=
coder *drm_enc)
>         dpu_kms =3D to_dpu_kms(priv->kms);
>         global_state =3D dpu_kms_get_existing_global_state(dpu_kms);
> =20
> -       if (drm_enc->encoder_type =3D=3D DRM_MODE_ENCODER_TMDS && priv->d=
p) {
> -               if (msm_dp_display_disable(priv->dp, drm_enc)) {
> -                       DPU_ERROR_ENC(dpu_enc, "dp display disable failed=
\n");
> -                       return;
> -               }
> -       }
> -
>         trace_dpu_enc_disable(DRMID(drm_enc));
> =20
>         /* wait for idle */
> @@ -1220,6 +1213,11 @@ static void dpu_encoder_virt_disable(struct drm_en=
coder *drm_enc)
> =20
>         dpu_rm_release(global_state, drm_enc);
> =20
> +       if (drm_enc->encoder_type =3D=3D DRM_MODE_ENCODER_TMDS && priv->d=
p) {
> +               if (msm_dp_display_disable(priv->dp, drm_enc))
> +                       DPU_ERROR_ENC(dpu_enc, "dp display disable failed=
\n");
> +       }
> +
>         mutex_unlock(&dpu_enc->enc_lock);
>  }
> =20
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_=
aux.c
> index 696dc8741f1e..c0e8ad031895 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -189,6 +189,8 @@ static void dp_aux_native_handler(struct dp_aux_priva=
te *aux)
>                 aux->aux_error_num =3D DP_AUX_ERR_TOUT;
>         if (isr & DP_INTR_NACK_DEFER)
>                 aux->aux_error_num =3D DP_AUX_ERR_NACK;
> +       if (isr & DP_INTR_AUX_ERROR)
> +               aux->aux_error_num =3D DP_AUX_ERR_DPPHY_AUX;
> =20
>         complete(&aux->comp);
>  }
> @@ -359,6 +361,8 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_=
aux,
>                                         PHY_AUX_CFG1);
>                         dp_catalog_aux_reset(aux->catalog);
>                 }
> +               if (aux->aux_error_num =3D=3D DP_AUX_ERR_DPPHY_AUX)
> +                       usleep_range(400, 400); /* need 400us before next=
 try */

Typically usleep_range() should be a range, and not the same number
for both ends of the range.

>                 goto unlock_exit;
>         }
> =20
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp=
/dp_catalog.c
> index ab69ae3e2dbd..367eb54c9a68 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -452,7 +452,6 @@ void dp_catalog_aux_setup(struct dp_catalog *dp_catal=
og)
>         dp_write_phy(catalog, REG_DP_PHY_PD_CTL, DP_PHY_PD_CTL_PSR_PWRDN);
> =20
>         /* Make sure that hardware is done with  PSR power down */
> -       wmb();

Is that comment above now not needed?

>         dp_write_phy(catalog, REG_DP_PHY_PD_CTL, DP_PHY_PD_CTL_PWRDN |
>                 DP_PHY_PD_CTL_AUX_PWRDN | DP_PHY_PD_CTL_LANE_0_1_PWRDN
>                 | DP_PHY_PD_CTL_LANE_2_3_PWRDN | DP_PHY_PD_CTL_PLL_PWRDN
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp=
_ctrl.c
> index 98654f39806c..100ab84375f7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -26,6 +26,13 @@
>  #define MR_LINK_SYMBOL_ERM 0x80
>  #define MR_LINK_PRBS7 0x100
>  #define MR_LINK_CUSTOM80 0x200
> +#define MR_LINK_TRAINING4  0x40
> +
> +enum {
> +       DP_TRAINING_NONE,
> +       DP_TRAINING_1,
> +       DP_TRAINING_2,
> +};
> =20
>  struct dp_tu_calc_input {
>         u64 lclk;        /* 162, 270, 540 and 810 */
> @@ -58,7 +65,6 @@ struct dp_vc_tu_mapping_table {
> =20
>  struct dp_ctrl_private {
>         struct dp_ctrl dp_ctrl;
> -
>         struct device *dev;
>         struct drm_dp_aux *aux;
>         struct dp_panel *panel;
> @@ -68,10 +74,16 @@ struct dp_ctrl_private {
>         struct dp_catalog *catalog;
> =20
>         struct completion idle_comp;
> -       struct mutex push_idle_mutex;
>         struct completion video_comp;
>  };
> =20
> +struct dp_cr_status {
> +       u8 lane_0_1;
> +       u8 lane_2_3;
> +};
> +
> +#define DP_LANE0_1_CR_DONE     0x11
> +
>  static int dp_aux_link_configure(struct drm_dp_aux *aux,
>                                         struct dp_link_info *link)
>  {
> @@ -97,8 +109,6 @@ void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl)
> =20
>         ctrl =3D container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> =20
> -       mutex_lock(&ctrl->push_idle_mutex);
> -
>         reinit_completion(&ctrl->idle_comp);
>         dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_PUSH_IDLE=
);
> =20
> @@ -106,7 +116,6 @@ void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl)
>                         IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES))
>                 pr_warn("PUSH_IDLE pattern timedout\n");
> =20
> -       mutex_unlock(&ctrl->push_idle_mutex);
>         pr_debug("mainlink off done\n");
>  }
> =20
> @@ -985,7 +994,7 @@ static int dp_ctrl_wait4video_ready(struct dp_ctrl_pr=
ivate *ctrl)
> =20
>         if (!wait_for_completion_timeout(&ctrl->video_comp,
>                                 WAIT_FOR_VIDEO_READY_TIMEOUT_JIFFIES)) {
> -               DRM_ERROR("Link Train timedout\n");
> +               DRM_ERROR("wait4video timedout\n");
>                 ret =3D -ETIMEDOUT;
>         }
>         return ret;
> @@ -1006,13 +1015,13 @@ static int dp_ctrl_update_vx_px(struct dp_ctrl_pr=
ivate *ctrl)
>         if (ret)
>                 return ret;
> =20
> -       if (voltage_swing_level > DP_TRAIN_VOLTAGE_SWING_MAX) {
> +       if (voltage_swing_level >=3D DP_TRAIN_VOLTAGE_SWING_MAX) {
>                 DRM_DEBUG_DP("max. voltage swing level reached %d\n",
>                                 voltage_swing_level);
>                 max_level_reached |=3D DP_TRAIN_MAX_SWING_REACHED;
>         }
> =20
> -       if (pre_emphasis_level =3D=3D DP_TRAIN_PRE_EMPHASIS_MAX) {
> +       if (pre_emphasis_level >=3D DP_TRAIN_PRE_EMPHASIS_MAX) {
>                 DRM_DEBUG_DP("max. pre-emphasis level reached %d\n",
>                                 pre_emphasis_level);
>                 max_level_reached  |=3D DP_TRAIN_MAX_PRE_EMPHASIS_REACHED;
> @@ -1044,8 +1053,11 @@ static bool dp_ctrl_train_pattern_set(struct dp_ct=
rl_private *ctrl,
>         DRM_DEBUG_DP("sink: pattern=3D%x\n", pattern);
> =20
>         buf =3D pattern;
> -       ret =3D drm_dp_dpcd_writeb(ctrl->aux,
> -                                       DP_TRAINING_PATTERN_SET, buf);
> +
> +       if (pattern && pattern !=3D DP_TRAINING_PATTERN_4)
> +               buf |=3D DP_LINK_SCRAMBLING_DISABLE;
> +
> +       ret =3D drm_dp_dpcd_writeb(ctrl->aux, DP_TRAINING_PATTERN_SET, bu=
f);
>         return ret =3D=3D 1;
>  }
> =20
> @@ -1071,19 +1083,23 @@ static int dp_ctrl_read_link_status(struct dp_ctr=
l_private *ctrl,
>         return -ETIMEDOUT;
>  }
> =20
> -static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl)
> +static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
> +               struct dp_cr_status *cr, int *training_step)
>  {
>         int tries, old_v_level, ret =3D 0;
>         u8 link_status[DP_LINK_STATUS_SIZE];
> -       int const maximum_retries =3D 5;
> +       int const maximum_retries =3D 4;
> =20
>         dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
> =20
> +       *training_step =3D DP_TRAINING_1;
> +
>         ret =3D dp_catalog_ctrl_set_pattern(ctrl->catalog, DP_TRAINING_PA=
TTERN_1);
>         if (ret)
>                 return ret;
>         dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_1 |
>                 DP_LINK_SCRAMBLING_DISABLE);
> +
>         ret =3D dp_ctrl_update_vx_px(ctrl);
>         if (ret)
>                 return ret;
> @@ -1097,12 +1113,15 @@ static int dp_ctrl_link_train_1(struct dp_ctrl_pr=
ivate *ctrl)
>                 if (ret)
>                         return ret;
> =20
> +               cr->lane_0_1 =3D link_status[0];
> +               cr->lane_2_3 =3D link_status[1];
> +
>                 if (drm_dp_clock_recovery_ok(link_status,
>                         ctrl->link->link_params.num_lanes)) {
> -                       return ret;
> +                       return 0;
>                 }
> =20
> -               if (ctrl->link->phy_params.v_level >
> +               if (ctrl->link->phy_params.v_level >=3D
>                         DP_TRAIN_VOLTAGE_SWING_MAX) {
>                         DRM_ERROR_RATELIMITED("max v_level reached\n");
>                         return -EAGAIN;
> @@ -1125,8 +1144,10 @@ static int dp_ctrl_link_train_1(struct dp_ctrl_pri=
vate *ctrl)
>         return -ETIMEDOUT;
>  }
> =20
> -static void dp_ctrl_link_rate_down_shift(struct dp_ctrl_private *ctrl)
> +static int dp_ctrl_link_rate_down_shift(struct dp_ctrl_private *ctrl)
>  {
> +       int ret =3D 0;
> +
>         switch (ctrl->link->link_params.rate) {
>         case 810000:
>                 ctrl->link->link_params.rate =3D 540000;
> @@ -1135,13 +1156,32 @@ static void dp_ctrl_link_rate_down_shift(struct d=
p_ctrl_private *ctrl)
>                 ctrl->link->link_params.rate =3D 270000;
>                 break;
>         case 270000:
> +               ctrl->link->link_params.rate =3D 162000;
> +               break;
>         case 162000:
>         default:
> -               ctrl->link->link_params.rate =3D 162000;
> +               ret =3D -1;

Use a real error code instead of -1?

>                 break;
>         };
> =20
>         DRM_DEBUG_DP("new rate=3D0x%x\n", ctrl->link->link_params.rate);

Maybe this should be under a condition like if (!ret)?

> +
> +       return ret;
> +}
> +
>  static void dp_ctrl_clear_training_pattern(struct dp_ctrl_private *ctrl)
> @@ -1214,18 +1260,20 @@ static int dp_ctrl_link_train(struct dp_ctrl_priv=
ate *ctrl)
>         drm_dp_dpcd_write(ctrl->aux, DP_MAIN_LINK_CHANNEL_CODING_SET,
>                                 &encoding, 1);
> =20
> -       ret =3D dp_ctrl_link_train_1(ctrl);
> +       ret =3D dp_ctrl_link_train_1(ctrl, cr, training_step);
>         if (ret) {
>                 DRM_ERROR("link training #1 failed. ret=3D%d\n", ret);
> +               ret =3D -EAGAIN;
>                 goto end;
>         }
> =20
>         /* print success info as this is a result of user initiated actio=
n */
>         DRM_DEBUG_DP("link training #1 successful\n");
> =20
> -       ret =3D dp_ctrl_link_training_2(ctrl);
> +       ret =3D dp_ctrl_link_train_2(ctrl, cr, training_step);
>         if (ret) {
>                 DRM_ERROR("link training #2 failed. ret=3D%d\n", ret);
> +               ret =3D -EAGAIN;

Why override ret?

>                 goto end;
>         }
> =20
> @@ -1235,58 +1283,36 @@ static int dp_ctrl_link_train(struct dp_ctrl_priv=
ate *ctrl)
> -static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl, bool tr=
ain)
> +static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
> +               struct dp_cr_status *cr, int *training_step)
>  {
> -       bool mainlink_ready =3D false;
>         int ret =3D 0;
> =20
>         dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, true);
> =20
> -       ret =3D dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, f=
alse);
> -       if (ret)
> -               return ret;
> -
>         if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN)
>                 return ret;
> =20
> -       if (train) {
> -               /*
> -                * As part of previous calls, DP controller state might h=
ave
> -                * transitioned to PUSH_IDLE. In order to start transmitt=
ing
> -                * a link training pattern, we have to first do soft rese=
t.
> -                */
> -               dp_catalog_ctrl_reset(ctrl->catalog);
> -
> -               ret =3D dp_ctrl_link_train(ctrl);
> -               if (ret)
> -                       return ret;
> -       }
> -
>         /*
> -        * Set up transfer unit values and set controller state to send
> -        * video.
> +        * As part of previous calls, DP controller state might have
> +        * transitioned to PUSH_IDLE. In order to start transmitting
> +        * a link training pattern, we have to first do soft reset.
>          */
> -       dp_ctrl_setup_tr_unit(ctrl);
> -       dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDE=
O);
> +       dp_catalog_ctrl_reset(ctrl->catalog);
> =20
> -       ret =3D dp_ctrl_wait4video_ready(ctrl);
> -       if (ret)
> -               return ret;
> +       ret =3D dp_ctrl_link_train(ctrl, cr, training_step);
> =20
> -       mainlink_ready =3D dp_catalog_ctrl_mainlink_ready(ctrl->catalog);
> -       DRM_DEBUG_DP("mainlink %s\n", mainlink_ready ? "READY" : "NOT REA=
DY");
>         return ret;
>  }
> =20
>  static void dp_ctrl_set_clock_rate(struct dp_ctrl_private *ctrl,
> -                                  char *name, u32 rate)
> +                       enum dp_pm_type module, char *name, u32 rate)
>  {
> -       u32 num =3D ctrl->parser->mp[DP_CTRL_PM].num_clk;
> -       struct dss_clk *cfg =3D ctrl->parser->mp[DP_CTRL_PM].clk_config;
> +       u32 num =3D ctrl->parser->mp[module].num_clk;
> +       struct dss_clk *cfg =3D ctrl->parser->mp[module].clk_config;
> =20
>         while (num && strcmp(cfg->clk_name, name)) {
>                 num--;
> @@ -1308,16 +1334,33 @@ static int dp_ctrl_enable_mainlink_clocks(struct =
dp_ctrl_private *ctrl)
> =20
>         dp_power_set_link_clk_parent(ctrl->power);
> =20
> -       dp_ctrl_set_clock_rate(ctrl, "ctrl_link",
> +       dp_ctrl_set_clock_rate(ctrl, DP_CTRL_PM, "ctrl_link",
>                                         ctrl->link->link_params.rate);
> =20
> -       dp_ctrl_set_clock_rate(ctrl, "stream_pixel",
> -                                       ctrl->dp_ctrl.pixel_rate);
> -
>         ret =3D dp_power_clk_enable(ctrl->power, DP_CTRL_PM, true);
>         if (ret)
>                 DRM_ERROR("Unable to start link clocks. ret=3D%d\n", ret);
> =20
> +       DRM_DEBUG_DP("link rate=3D%d pixel_clk=3D%d\n",
> +               ctrl->link->link_params.rate, ctrl->dp_ctrl.pixel_rate);
> +
> +       return ret;
> +}
> +
> +static int dp_ctrl_enable_stream_clocks(struct dp_ctrl_private *ctrl)
> +{
> +       int ret =3D 0;
> +
> +       dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel",
> +                                       ctrl->dp_ctrl.pixel_rate);
> +
> +       ret =3D dp_power_clk_enable(ctrl->power, DP_STREAM_PM, true);
> +       if (ret)
> +               DRM_ERROR("Unabled to start pixel clocks. ret=3D%d\n", re=
t);
> +
> +       DRM_DEBUG_DP("link rate=3D%d pixel_clk=3D%d\n",
> +                       ctrl->link->link_params.rate, ctrl->dp_ctrl.pixel=
_rate);
> +
>         return ret;
>  }
> =20
> @@ -1407,37 +1450,30 @@ static int dp_ctrl_reinitialize_mainlink(struct d=
p_ctrl_private *ctrl)
>                 return ret;
>         }
> =20
> -       dp_ctrl_configure_source_params(ctrl);
> -       dp_catalog_ctrl_config_msa(ctrl->catalog,
> -               ctrl->link->link_params.rate,
> -               ctrl->dp_ctrl.pixel_rate, dp_ctrl_use_fixed_nvid(ctrl));
> -       reinit_completion(&ctrl->idle_comp);
> -
>         return ret;
>  }
> =20
>  static int dp_ctrl_link_maintenance(struct dp_ctrl_private *ctrl)
>  {
>         int ret =3D 0;
> -       int tries;
> +       struct dp_cr_status cr;
> +       int training_step =3D DP_TRAINING_NONE;
> =20
>         dp_ctrl_push_idle(&ctrl->dp_ctrl);
>         dp_catalog_ctrl_reset(ctrl->catalog);
> =20
>         ctrl->dp_ctrl.pixel_rate =3D ctrl->panel->dp_mode.drm_mode.clock;
> =20
> -       for (tries =3D 0; tries < 10; tries++) {
> -               ret =3D dp_ctrl_reinitialize_mainlink(ctrl);
> -               if (ret) {
> -                       DRM_ERROR("Failed to reinitialize mainlink. ret=
=3D%d\n",
> -                                       ret);
> -                       break;
> -               }
> +       ret =3D dp_ctrl_setup_main_link(ctrl, &cr, &training_step);
> +       if (ret)
> +               goto end;
> =20
> -               ret =3D dp_ctrl_setup_main_link(ctrl, true);
> -               if (ret =3D=3D -EAGAIN) /* try with lower link rate */
> -                       dp_ctrl_link_rate_down_shift(ctrl);
> -       }
> +       dp_ctrl_clear_training_pattern(ctrl);
> +
> +       dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDE=
O);
> +
> +       ret =3D dp_ctrl_wait4video_ready(ctrl);
> +end:
>         return ret;
>  }
> =20
> @@ -1450,22 +1486,22 @@ static int dp_ctrl_process_phy_test_request(struc=
t dp_ctrl_private *ctrl)
>                 return ret;
>         }
> =20
> -       dp_ctrl_push_idle(&ctrl->dp_ctrl);
>         /*
>          * The global reset will need DP link related clocks to be
>          * running. Add the global reset just before disabling the
>          * link clocks and core clocks.
>          */
> -       dp_catalog_ctrl_reset(ctrl->catalog);
>         ret =3D dp_ctrl_off(&ctrl->dp_ctrl);
>         if (ret) {
>                 DRM_ERROR("failed to disable DP controller\n");
>                 return ret;
>         }
> =20
> -       ret =3D dp_ctrl_on(&ctrl->dp_ctrl);
> -       if (ret)
> -               DRM_ERROR("failed to enable DP controller\n");
> +       ret =3D dp_ctrl_on_link(&ctrl->dp_ctrl);
> +       if (!ret)
> +               ret =3D dp_ctrl_on_stream(&ctrl->dp_ctrl);
> +       else
> +               DRM_ERROR("failed to enable DP link controller\n");
> =20
>         return ret;
>  }
> @@ -1485,27 +1521,33 @@ static bool dp_ctrl_send_phy_test_pattern(struct =
dp_ctrl_private *ctrl)
>                 return false;
>         }
>         dp_catalog_ctrl_send_phy_pattern(ctrl->catalog, pattern_requested=
);
> +       dp_ctrl_update_vx_px(ctrl);
>         dp_link_send_test_response(ctrl->link);
> =20
>         pattern_sent =3D dp_catalog_ctrl_read_phy_pattern(ctrl->catalog);
> =20
>         switch (pattern_sent) {
>         case MR_LINK_TRAINING1:
> -               success =3D pattern_requested =3D=3D
> -                               DP_LINK_QUAL_PATTERN_D10_2;
> +               success =3D (pattern_requested =3D=3D
> +                               DP_PHY_TEST_PATTERN_D10_2);
>                 break;
>         case MR_LINK_SYMBOL_ERM:
> -               success =3D (pattern_requested =3D=3D
> -                               DP_LINK_QUAL_PATTERN_ERROR_RATE)
> -                       || (pattern_requested =3D=3D
> -                               DP_LINK_QUAL_PATTERN_HBR2_EYE);
> +               success =3D ((pattern_requested =3D=3D
> +                               DP_PHY_TEST_PATTERN_ERROR_COUNT) ||
> +                               (pattern_requested =3D=3D
> +                               DP_PHY_TEST_PATTERN_CP2520));
>                 break;
>         case MR_LINK_PRBS7:
> -               success =3D pattern_requested =3D=3D DP_LINK_QUAL_PATTERN=
_PRBS7;
> +               success =3D (pattern_requested =3D=3D
> +                               DP_PHY_TEST_PATTERN_PRBS7);
>                 break;
>         case MR_LINK_CUSTOM80:
> -               success =3D pattern_requested =3D=3D
> -                               DP_LINK_QUAL_PATTERN_80BIT_CUSTOM;
> +               success =3D (pattern_requested =3D=3D
> +                               DP_PHY_TEST_PATTERN_80BIT_CUSTOM);
> +               break;
> +       case MR_LINK_TRAINING4:
> +               success =3D (pattern_requested =3D=3D
> +                               DP_PHY_TEST_PATTERN_SEL_MASK);
>                 break;
>         default:
>                 success =3D false;
> @@ -1537,12 +1579,12 @@ void dp_ctrl_handle_sink_request(struct dp_ctrl *=
dp_ctrl)
>                 }
>         }
> =20
> -       if (sink_request & DP_LINK_STATUS_UPDATED)
> +       if (sink_request & DP_LINK_STATUS_UPDATED) {
>                 if (dp_ctrl_link_maintenance(ctrl)) {
> -                       DRM_ERROR("LM failed: STATUS_UPDATED\n");
> +                       DRM_ERROR("LM failed: TEST_LINK_TRAINING\n");
>                         return;
>                 }
> -
> +       }
> =20
>         if (sink_request & DP_TEST_LINK_TRAINING) {
>                 dp_link_send_test_response(ctrl->link);
> @@ -1553,13 +1595,15 @@ void dp_ctrl_handle_sink_request(struct dp_ctrl *=
dp_ctrl)
>         }
>  }
> =20
> -int dp_ctrl_on(struct dp_ctrl *dp_ctrl)
> +int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>  {
>         int rc =3D 0;
>         struct dp_ctrl_private *ctrl;
>         u32 rate =3D 0;
> -       u32 link_train_max_retries =3D 10;
> +       u32 link_train_max_retries =3D 5;

Any reason these variables are u32 instead of unsigned int? Does the
size of the variable matter if we're counting things?

>         u32 const phy_cts_pixel_clk_khz =3D 148500;
> +       struct dp_cr_status cr;
> +       int training_step;

Any reason to be int vs unsigned int?

> =20
>         if (!dp_ctrl)
>                 return -EINVAL;
> @@ -1601,16 +1648,115 @@ int dp_ctrl_on(struct dp_ctrl *dp_ctrl)
>                                         rc);
>                         break;
>                 }
> -               rc =3D dp_ctrl_setup_main_link(ctrl, true);
> -               if (!rc)
> +
> +               training_step =3D DP_TRAINING_NONE;
> +               rc =3D dp_ctrl_setup_main_link(ctrl, &cr, &training_step);
> +               if (rc =3D=3D 0) {
> +                       /* training completed successfully */
>                         break;
> -               /* try with lower link rate */
> -               dp_ctrl_link_rate_down_shift(ctrl);
> +               } else if (training_step =3D=3D DP_TRAINING_1) {
> +                       /* link train_1 failed */
> +                       rc =3D dp_ctrl_link_rate_down_shift(ctrl);
> +                       if (rc < 0) { /* alread in RBR =3D 1.6G */

already?

> +                               if (cr.lane_0_1 & DP_LANE0_1_CR_DONE) {
> +                                       /*
> +                                        * some lanes are ready,
> +                                        * reduce lane number
> +                                        */
> +                                       rc =3D dp_ctrl_link_lane_down_shi=
ft(ctrl);
> +                                       if (rc < 0) { /* lane =3D=3D 1 al=
ready */
> +                                               /* end with failure */
> +                                               break;
[..]
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp=
/dp_display.c
> index 36b6ee4131bb..23ff23a5259f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -783,6 +807,182 @@ int dp_display_get_test_bpp(struct msm_dp *dp)
>                 dp_display->link->test_video.test_bit_depth);
>  }
> =20
> +static void dp_display_config_hpd(struct dp_display_private *dp)
> +{
> +
> +       dp_display_host_init(dp);
> +       dp_catalog_ctrl_hpd_config(dp->catalog);
> +
> +       /* Enable interrupt first time
> +        * we are leaving dp clocks on during disconnect
> +        * and never disable interrupt
> +        */
> +       enable_irq(dp->irq);
> +}
> +
> +static int hpd_event_thread(void *data)
> +{
> +       struct dp_display_private *dp_priv;
> +       unsigned long flag;
> +       struct dp_event *todo;
> +       int timeout_mode =3D 0;
> +       int ret;
> +
> +       dp_priv =3D (struct dp_display_private *)data;
> +
> +       while (1) {
> +               if (timeout_mode) {
> +                       ret =3D wait_event_timeout(dp_priv->event_q,
> +                               (dp_priv->event_pndx =3D=3D dp_priv->even=
t_gndx),
> +                                               EVENT_TIMEOUT);
> +               } else {
> +                       ret =3D wait_event_timeout(dp_priv->event_q,
> +                               (dp_priv->event_pndx !=3D dp_priv->event_=
gndx),
> +                                               EVENT_TIMEOUT);
> +               }
> +               spin_lock_irqsave(&dp_priv->event_lock, flag);
> +               todo =3D &dp_priv->event_list[dp_priv->event_gndx];
> +               if (todo->delay) {
> +                       struct dp_event *todo_next;
> +
> +                       dp_priv->event_gndx++;
> +                       dp_priv->event_gndx %=3D DP_EVENT_Q_MAX;
> +
> +                       /* re enter delay event into q */
> +                       todo_next =3D &dp_priv->event_list[dp_priv->event=
_pndx++];
> +                       dp_priv->event_pndx %=3D DP_EVENT_Q_MAX;
> +                       todo_next->event_id =3D todo->event_id;
> +                       todo_next->data =3D todo->data;
> +                       todo_next->delay =3D todo->delay - 1;
> +
> +                       /* clean up older event */
> +                       todo->event_id =3D EV_NO_EVENT;
> +                       todo->delay =3D 0;
> +
> +                       /* switch to timeout mode */
> +                       timeout_mode =3D 1;
> +                       spin_unlock_irqrestore(&dp_priv->event_lock, flag=
);
> +                       continue;
> +               }
> +
> +               /* timeout with no events in q */
> +               if (dp_priv->event_pndx =3D=3D dp_priv->event_gndx) {
> +                       spin_unlock_irqrestore(&dp_priv->event_lock, flag=
);
> +                       continue;
> +               }
> +
> +               dp_priv->event_gndx++;
> +               dp_priv->event_gndx %=3D DP_EVENT_Q_MAX;
> +               timeout_mode =3D 0;
> +               spin_unlock_irqrestore(&dp_priv->event_lock, flag);
> +
> +               switch (todo->event_id) {
> +               case EV_HPD_INIT_SETUP:
> +                       dp_display_config_hpd(dp_priv);
> +                       break;
> +               case EV_HPD_PLUG_INT:
> +                       dp_hpd_plug_handle(dp_priv, todo->data);
> +                       break;
> +               case EV_HPD_UNPLUG_INT:
> +                       dp_hpd_unplug_handle(dp_priv, todo->data);
> +                       break;
> +               case EV_IRQ_HPD_INT:
> +                       dp_irq_hpd_handle(dp_priv, todo->data);
> +                       break;
> +               case EV_HPD_REPLUG_INT:
> +                       /* do nothing */
> +                       break;
> +               case EV_USER_NOTIFICATION:
> +                       dp_display_send_hpd_notification(dp_priv,
> +                                               todo->data);
> +                       break;
> +               default:
> +                       break;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static void dp_hpd_event_setup(struct dp_display_private *dp_priv)
> +{
> +       init_waitqueue_head(&dp_priv->event_q);
> +       spin_lock_init(&dp_priv->event_lock);
> +
> +       kthread_run(hpd_event_thread, (void *)dp_priv, "dp_hpd_handler");

Is the cast necessary?

> +}
> +
> @@ -890,8 +1069,13 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_displ=
ay)
> =20
>         dp =3D container_of(dp_display, struct dp_display_private, dp_dis=
play);
> =20
> -       INIT_DELAYED_WORK(&dp->config_hpd_work, dp_display_config_hpd_wor=
k);
> -       queue_delayed_work(system_wq, &dp->config_hpd_work, HZ * 10);
> +       dp_hpd_event_setup(dp);
> +
> +       /* This hack Delays HPD configuration by 10 sec
> +        * ToDo(User): Implement correct boot sequence of

Typically todo is written "TODO(email@domain)" instead of User.

> +        * HPD configuration and remove this hack
> +        */
> +       dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
>  }
> =20
>  int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *de=
v,
> @@ -938,37 +1122,47 @@ int msm_dp_display_enable(struct msm_dp *dp, struc=
t drm_encoder *encoder)
>                 return -EINVAL;
>         }
> =20
> +       mutex_lock(&dp_display->event_mutex);
> +
>         rc =3D dp_display_set_mode(dp, &dp_display->dp_mode);
>         if (rc) {
>                 DRM_ERROR("Failed to perform a mode set, rc=3D%d\n", rc);
> +               mutex_unlock(&dp_display->event_mutex);
>                 return rc;
>         }
> =20
>         rc =3D dp_display_prepare(dp);
>         if (rc) {
>                 DRM_ERROR("DP display prepare failed, rc=3D%d\n", rc);
> +               mutex_unlock(&dp_display->event_mutex);
>                 return rc;
>         }
> =20
> -       rc =3D dp_display_enable(dp);
> -       if (rc) {
> -               DRM_ERROR("DP display enable failed, rc=3D%d\n", rc);
> -               dp_display_unprepare(dp);
> -               return rc;
> -       }
> +       dp_display_enable(dp_display, 0);
> =20
>         rc =3D dp_display_post_enable(dp);
>         if (rc) {
>                 DRM_ERROR("DP display post enable failed, rc=3D%d\n", rc);
> -               dp_display_disable(dp);
> +               dp_display_disable(dp_display, 0);
>                 dp_display_unprepare(dp);
>         }
> +
> +       /* completed connection */
> +       atomic_set(&dp_display->hpd_state, ST_CONNECTED);
> +
> +       mutex_unlock(&dp_display->event_mutex);
> +
>         return rc;
>  }
> =20
>  int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encode=
r)
>  {
>         int rc =3D 0;
> +       struct dp_display_private *dp_display;
> +
> +       dp_display =3D container_of(dp, struct dp_display_private, dp_dis=
play);
> +
> +       mutex_lock(&dp_display->event_mutex);
> =20
>         rc =3D dp_display_pre_disable(dp);
>         if (rc) {
> @@ -976,16 +1170,16 @@ int msm_dp_display_disable(struct msm_dp *dp, stru=
ct drm_encoder *encoder)
>                 return rc;
>         }
> =20
> -       rc =3D dp_display_disable(dp);
> -       if (rc) {
> -               DRM_ERROR("DP display disable failed, rc=3D%d\n", rc);
> -               return rc;
> -       }
> +       dp_display_disable(dp_display, 0);
> =20
>         rc =3D dp_display_unprepare(dp);
>         if (rc)
>                 DRM_ERROR("DP display unprepare failed, rc=3D%d\n", rc);
> =20
> +       /* completed disconnection */
> +       atomic_set(&dp_display->hpd_state, ST_DISCONNECTED);
> +
> +       mutex_unlock(&dp_display->event_mutex);
>         return rc;
>  }
> =20
> diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.c b/drivers/gpu/drm/msm/dp/dp_=
hpd.c
> index 5b08ce580702..5b8fe32022b5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_hpd.c
> +++ b/drivers/gpu/drm/msm/dp/dp_hpd.c
> @@ -24,7 +24,7 @@ struct dp_hpd_private {
>         struct dp_usbpd dp_usbpd;
>  };
> =20
> -static int dp_hpd_connect(struct dp_usbpd *dp_usbpd, bool hpd)
> +int dp_hpd_connect(struct dp_usbpd *dp_usbpd, bool hpd)
>  {
>         int rc =3D 0;
>         struct dp_hpd_private *hpd_priv;
> diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.h b/drivers/gpu/drm/msm/dp/dp_=
hpd.h
> index c0178524bec7..5bc5bb64680f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_hpd.h
> +++ b/drivers/gpu/drm/msm/dp/dp_hpd.h
> @@ -75,5 +75,6 @@ struct dp_usbpd *dp_hpd_get(struct device *dev, struct =
dp_usbpd_cb *cb);
> =20
>  int dp_hpd_register(struct dp_usbpd *dp_usbpd);
>  void dp_hpd_unregister(struct dp_usbpd *dp_usbpd);
> +int dp_hpd_connect(struct dp_usbpd *dp_usbpd, bool hpd);
> =20
>  #endif /* _DP_HPD_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp=
_link.c
> index 9c75a4d327bb..f5e51c7988cb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -661,7 +661,6 @@ static int dp_link_parse_request(struct dp_link_priva=
te *link)
> =20
>         DRM_DEBUG_DP("Test:(0x%x) requested\n", data);
>         link->request.test_requested =3D data;
> -
>         if (link->request.test_requested =3D=3D DP_TEST_LINK_PHY_TEST_PAT=
TERN) {
>                 ret =3D dp_link_parse_phy_test_params(link);
>                 if (ret)

Drop this hunk?
