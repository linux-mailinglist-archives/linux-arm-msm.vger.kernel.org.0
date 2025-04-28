Return-Path: <linux-arm-msm+bounces-55945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EB8A9FA2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 22:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECB6D461008
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 20:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF7A296D32;
	Mon, 28 Apr 2025 20:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqB5qKFx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9A3204C07;
	Mon, 28 Apr 2025 20:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745870884; cv=none; b=S1552D8bpoT9vJgneAyx31YUZJlivKc/tsQGr6cPyqrQUuDtXB8RLF31FwKY7yLyBOXo1BoTZ0aw81Z9+1zdVxQe4JkEuHmtbez3++vYbeB5lWQPB/XETakuH1YjYpmTBNNxokyBp1wMau0q7S0ycUh1ufxCK+AxY/VppKYdwzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745870884; c=relaxed/simple;
	bh=wV4b6XWSl2J/Un+idA9x5MLiFe/FUVc4qm5OcHyJqKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bTzVwsz8LcpgIOpTtAwq+5ThNU/XlZi9rjnNL8LcXTZ4DHQMDILH6VN1GHRrBfrw3hhy7pwq0tH95KxjoKeIN7dujDax3Ivj5oYEt3NRa9Am7p6HDVfOjvp9c+mDcrYRZYHVuyW6BnodjwHa/CPJs2RG7tCCyW1TrRV3kAw5LHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqB5qKFx; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3d8e9f26b96so43567915ab.1;
        Mon, 28 Apr 2025 13:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745870881; x=1746475681; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWnIADilPROQfhZbcZuvpmZDw5u9UHe9ZdLyBfiumno=;
        b=dqB5qKFx2fJ8jPej0P/ntPIwou8Lu6s+eftd61bs3qtTTlTvh7yC0oPDUrhnDKdPeF
         1IFJKcQtVUm4VOSqCKzREGS7mCKYlODZnRzGVA5OpAbhBy7Sb95leCHHEgWK1AIE+lRm
         Ar4jFz3HXgTIbuS7B5z21ZXpqZMDxxLePnqoaLLNAAuPEOVmT6RIXPrURI0DBcCY3tE4
         zhEVhhotJL1gUr2u/qv9684HAjAS/gl5D0m1nXjVRBl7MJsKoZB3pIiSJSelDDOz8kEH
         LhaaM1WRWeDIL4d9nNJR/EHMVpv01uXNwPOwfELmxe7e3okGJCVbSPYlw6fsfb6re2pU
         EnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745870881; x=1746475681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iWnIADilPROQfhZbcZuvpmZDw5u9UHe9ZdLyBfiumno=;
        b=Q3i+mbg3RaoJLwLYXv3N9NzyH+Z1myTUGRObig/147qpJ2iuKIr4cgnL/AaU2AoX0f
         xmzgvl0oWUbT9c+QmDS4YlH6Uo6bOp41W0kpnkZyhq76KUlqF5NZqFCadgax8iLA+jwz
         Lv+0GuHm7PQ3NBKoLDGJHHLYbJz5C7onCTRkGooH++Nqq7GljNZrBLwqPUsjSrTFfJVs
         y2bEoaO2pZKDSuQ+JlV+GRbAMLaWEh9iWg9WEOvvM65WyvSbnClNVQggsErWqKy4EO3f
         /8UiS8/c8SQ33XckB1CS0q61L3QxKf1ililvHEB6j7cp5pjVd3GgeMYppR5z30KF2bPt
         G8Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUH+5eOYsLNBiomIFf40ojZ3yH22w0CcURrmJYQtJm3SBuVkyWbq9KyzFLm7+YOZgSK6gL8N/iC+u4cY2KR@vger.kernel.org, AJvYcCW64YhzOqksjSIG3SmL7wV645fkG13jzKQX9J95dDdZyU9xVQRlgEPfSAr0hlIpn/guQqEVvEbFlLfl6IHc@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4YYIvpQuOiyb/pL4vyf64G2JlvWQWHu2Q3kz5QtaXd0r3GJiO
	o542/Bgph2ckjOr5QIdBx7+Ve3AMUXlTkQadyxtOaK7zD8gq4my83XP6aK8jAjYjGDWI8iGuel0
	bkpWhV3CyRPvNWcSNTuf52dKIknc=
X-Gm-Gg: ASbGncuVzhop9znCM/yH+rP7Ie2ZaJOMbRYHJA7bMm5NZHVkZFOe51KOxLD1d/MEqaf
	XEjFAfJdmwwdxS8MYLnd1oJSPDdNIZXwE3gsw+HNo7dbXVM/KT2iy+I8PprLoRquEtFJLmm3pLh
	KIKRv2B6iNE+9p78pJyl1y/Z53Q8YI3vEuVDZERN2L4d6zzbCvDG0wDUguv0jV3g==
X-Google-Smtp-Source: AGHT+IGDbHc+XXH/VJsWaa/q+U93uQ0j65YLwG7dYwBdeOSNwdWZZPSWoJyHJ5h3dCN88knlUGjt2Zxrhk59XMqyboY=
X-Received: by 2002:a05:6e02:3008:b0:3d3:d00c:3602 with SMTP id
 e9e14a558f8ab-3d95d835c48mr6761235ab.10.1745870880979; Mon, 28 Apr 2025
 13:08:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417021349.148911-1-alex.vinarskis@gmail.com> <20250417021349.148911-5-alex.vinarskis@gmail.com>
In-Reply-To: <20250417021349.148911-5-alex.vinarskis@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 28 Apr 2025 13:07:47 -0700
X-Gm-Features: ATxdqUF-RmOIWHo9oUJkhHpXg4mf9bDj4Qpn8L9zs5EASxERcQwU6fnR6TdGa3c
Message-ID: <CAF6AEGvcD1EMJOgWEpBZkeecrCuic0qBbc4=kRFNL1GiyHf+vQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm/msm/dp: Introduce link training per-segment
 for LTTPRs
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, laurentiu.tudor1@dell.com, abel.vesa@linaro.org, 
	johan@kernel.org, Stefan Schmidt <stefan.schmidt@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 7:13=E2=80=AFPM Aleksandrs Vinarskis
<alex.vinarskis@gmail.com> wrote:
>
> DisplayPort requires per-segment link training when LTTPR are switched
> to non-transparent mode, starting with LTTPR closest to the source.
> Only when each segment is trained individually, source can link train
> to sink.
>
> Implement per-segment link traning when LTTPR(s) are detected, to
> support external docking stations. On higher level, changes are:
>
> * Pass phy being trained down to all required helpers
> * Run CR, EQ link training per phy
> * Set voltage swing, pre-emphasis levels per phy
>
> This ensures successful link training both when connected directly to
> the monitor (single LTTPR onboard most X1E laptops) and via the docking
> station (at least two LTTPRs).
>
> Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

Tested-by: Rob Clark <robdclark@gmail.com>  # yoga slim 7x

> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 126 ++++++++++++++++++++++---------
>  1 file changed, 89 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp=
_ctrl.c
> index 69a26bb5fabd..a50bfafbb4ea 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1034,10 +1034,12 @@ static int msm_dp_ctrl_set_vx_px(struct msm_dp_ct=
rl_private *ctrl,
>         return 0;
>  }
>
> -static int msm_dp_ctrl_update_vx_px(struct msm_dp_ctrl_private *ctrl)
> +static int msm_dp_ctrl_update_phy_vx_px(struct msm_dp_ctrl_private *ctrl=
,
> +                                       enum drm_dp_phy dp_phy)
>  {
>         struct msm_dp_link *link =3D ctrl->link;
> -       int ret =3D 0, lane, lane_cnt;
> +       int lane, lane_cnt, reg;
> +       int ret =3D 0;
>         u8 buf[4];
>         u32 max_level_reached =3D 0;
>         u32 voltage_swing_level =3D link->phy_params.v_level;
> @@ -1075,8 +1077,13 @@ static int msm_dp_ctrl_update_vx_px(struct msm_dp_=
ctrl_private *ctrl)
>
>         drm_dbg_dp(ctrl->drm_dev, "sink: p|v=3D0x%x\n",
>                         voltage_swing_level | pre_emphasis_level);
> -       ret =3D drm_dp_dpcd_write(ctrl->aux, DP_TRAINING_LANE0_SET,
> -                                       buf, lane_cnt);
> +
> +       if (dp_phy =3D=3D DP_PHY_DPRX)
> +               reg =3D DP_TRAINING_LANE0_SET;
> +       else
> +               reg =3D DP_TRAINING_LANE0_SET_PHY_REPEATER(dp_phy);
> +
> +       ret =3D drm_dp_dpcd_write(ctrl->aux, reg, buf, lane_cnt);
>         if (ret =3D=3D lane_cnt)
>                 ret =3D 0;
>
> @@ -1084,9 +1091,10 @@ static int msm_dp_ctrl_update_vx_px(struct msm_dp_=
ctrl_private *ctrl)
>  }
>
>  static bool msm_dp_ctrl_train_pattern_set(struct msm_dp_ctrl_private *ct=
rl,
> -               u8 pattern)
> +               u8 pattern, enum drm_dp_phy dp_phy)
>  {
>         u8 buf;
> +       int reg;
>         int ret =3D 0;
>
>         drm_dbg_dp(ctrl->drm_dev, "sink: pattern=3D%x\n", pattern);
> @@ -1096,17 +1104,26 @@ static bool msm_dp_ctrl_train_pattern_set(struct =
msm_dp_ctrl_private *ctrl,
>         if (pattern && pattern !=3D DP_TRAINING_PATTERN_4)
>                 buf |=3D DP_LINK_SCRAMBLING_DISABLE;
>
> -       ret =3D drm_dp_dpcd_writeb(ctrl->aux, DP_TRAINING_PATTERN_SET, bu=
f);
> +       if (dp_phy =3D=3D DP_PHY_DPRX)
> +               reg =3D DP_TRAINING_PATTERN_SET;
> +       else
> +               reg =3D DP_TRAINING_PATTERN_SET_PHY_REPEATER(dp_phy);
> +
> +       ret =3D drm_dp_dpcd_writeb(ctrl->aux, reg, buf);
>         return ret =3D=3D 1;
>  }
>
>  static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
> -                       int *training_step)
> +                       int *training_step, enum drm_dp_phy dp_phy)
>  {
> +       int delay_us;
>         int tries, old_v_level, ret =3D 0;
>         u8 link_status[DP_LINK_STATUS_SIZE];
>         int const maximum_retries =3D 4;
>
> +       delay_us =3D drm_dp_read_clock_recovery_delay(ctrl->aux,
> +                                                   ctrl->panel->dpcd, dp=
_phy, false);
> +
>         msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
>
>         *training_step =3D DP_TRAINING_1;
> @@ -1115,18 +1132,19 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp=
_ctrl_private *ctrl,
>         if (ret)
>                 return ret;
>         msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_1 |
> -               DP_LINK_SCRAMBLING_DISABLE);
> +               DP_LINK_SCRAMBLING_DISABLE, dp_phy);
>
> -       ret =3D msm_dp_ctrl_update_vx_px(ctrl);
> +       msm_dp_link_reset_phy_params_vx_px(ctrl->link);
> +       ret =3D msm_dp_ctrl_update_phy_vx_px(ctrl, dp_phy);
>         if (ret)
>                 return ret;
>
>         tries =3D 0;
>         old_v_level =3D ctrl->link->phy_params.v_level;
>         for (tries =3D 0; tries < maximum_retries; tries++) {
> -               drm_dp_link_train_clock_recovery_delay(ctrl->aux, ctrl->p=
anel->dpcd);
> +               fsleep(delay_us);
>
> -               ret =3D drm_dp_dpcd_read_link_status(ctrl->aux, link_stat=
us);
> +               ret =3D drm_dp_dpcd_read_phy_link_status(ctrl->aux, dp_ph=
y, link_status);
>                 if (ret)
>                         return ret;
>
> @@ -1147,7 +1165,7 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_c=
trl_private *ctrl,
>                 }
>
>                 msm_dp_link_adjust_levels(ctrl->link, link_status);
> -               ret =3D msm_dp_ctrl_update_vx_px(ctrl);
> +               ret =3D msm_dp_ctrl_update_phy_vx_px(ctrl, dp_phy);
>                 if (ret)
>                         return ret;
>         }
> @@ -1199,21 +1217,31 @@ static int msm_dp_ctrl_link_lane_down_shift(struc=
t msm_dp_ctrl_private *ctrl)
>         return 0;
>  }
>
> -static void msm_dp_ctrl_clear_training_pattern(struct msm_dp_ctrl_privat=
e *ctrl)
> +static void msm_dp_ctrl_clear_training_pattern(struct msm_dp_ctrl_privat=
e *ctrl,
> +                                              enum drm_dp_phy dp_phy)
>  {
> -       msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_DISABLE);
> -       drm_dp_link_train_channel_eq_delay(ctrl->aux, ctrl->panel->dpcd);
> +       int delay_us;
> +
> +       msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_DISABLE, =
dp_phy);
> +
> +       delay_us =3D drm_dp_read_channel_eq_delay(ctrl->aux,
> +                                               ctrl->panel->dpcd, dp_phy=
, false);
> +       fsleep(delay_us);
>  }
>
>  static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
> -                       int *training_step)
> +                       int *training_step, enum drm_dp_phy dp_phy)
>  {
> +       int delay_us;
>         int tries =3D 0, ret =3D 0;
>         u8 pattern;
>         u32 state_ctrl_bit;
>         int const maximum_retries =3D 5;
>         u8 link_status[DP_LINK_STATUS_SIZE];
>
> +       delay_us =3D drm_dp_read_channel_eq_delay(ctrl->aux,
> +                                               ctrl->panel->dpcd, dp_phy=
, false);
> +
>         msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
>
>         *training_step =3D DP_TRAINING_2;
> @@ -1233,12 +1261,12 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp=
_ctrl_private *ctrl,
>         if (ret)
>                 return ret;
>
> -       msm_dp_ctrl_train_pattern_set(ctrl, pattern);
> +       msm_dp_ctrl_train_pattern_set(ctrl, pattern, dp_phy);
>
>         for (tries =3D 0; tries <=3D maximum_retries; tries++) {
> -               drm_dp_link_train_channel_eq_delay(ctrl->aux, ctrl->panel=
->dpcd);
> +               fsleep(delay_us);
>
> -               ret =3D drm_dp_dpcd_read_link_status(ctrl->aux, link_stat=
us);
> +               ret =3D drm_dp_dpcd_read_phy_link_status(ctrl->aux, dp_ph=
y, link_status);
>                 if (ret)
>                         return ret;
>
> @@ -1248,7 +1276,7 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_c=
trl_private *ctrl,
>                 }
>
>                 msm_dp_link_adjust_levels(ctrl->link, link_status);
> -               ret =3D msm_dp_ctrl_update_vx_px(ctrl);
> +               ret =3D msm_dp_ctrl_update_phy_vx_px(ctrl, dp_phy);
>                 if (ret)
>                         return ret;
>
> @@ -1257,9 +1285,32 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_=
ctrl_private *ctrl,
>         return -ETIMEDOUT;
>  }
>
> +static int msm_dp_ctrl_link_train_1_2(struct msm_dp_ctrl_private *ctrl,
> +                                     int *training_step, enum drm_dp_phy=
 dp_phy)
> +{
> +       int ret;
> +
> +       ret =3D msm_dp_ctrl_link_train_1(ctrl, training_step, dp_phy);
> +       if (ret) {
> +               DRM_ERROR("link training #1 on phy %d failed. ret=3D%d\n"=
, dp_phy, ret);
> +               return ret;
> +       }
> +       drm_dbg_dp(ctrl->drm_dev, "link training #1 on phy %d successful\=
n", dp_phy);
> +
> +       ret =3D msm_dp_ctrl_link_train_2(ctrl, training_step, dp_phy);
> +       if (ret) {
> +               DRM_ERROR("link training #2 on phy %d failed. ret=3D%d\n"=
, dp_phy, ret);
> +               return ret;
> +       }
> +       drm_dbg_dp(ctrl->drm_dev, "link training #2 on phy %d successful\=
n", dp_phy);
> +
> +       return 0;
> +}
> +
>  static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
>                         int *training_step)
>  {
> +       int i;
>         int ret =3D 0;
>         const u8 *dpcd =3D ctrl->panel->dpcd;
>         u8 encoding[] =3D { 0, DP_SET_ANSI_8B10B };
> @@ -1272,8 +1323,6 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctr=
l_private *ctrl,
>         link_info.rate =3D ctrl->link->link_params.rate;
>         link_info.capabilities =3D DP_LINK_CAP_ENHANCED_FRAMING;
>
> -       msm_dp_link_reset_phy_params_vx_px(ctrl->link);
> -
>         msm_dp_aux_link_configure(ctrl->aux, &link_info);
>
>         if (drm_dp_max_downspread(dpcd))
> @@ -1288,24 +1337,27 @@ static int msm_dp_ctrl_link_train(struct msm_dp_c=
trl_private *ctrl,
>                                 &assr, 1);
>         }
>
> -       ret =3D msm_dp_ctrl_link_train_1(ctrl, training_step);
> +       for (i =3D ctrl->link->lttpr_count - 1; i >=3D 0; i--) {
> +               enum drm_dp_phy dp_phy =3D DP_PHY_LTTPR(i);
> +
> +               ret =3D msm_dp_ctrl_link_train_1_2(ctrl, training_step, d=
p_phy);
> +               msm_dp_ctrl_clear_training_pattern(ctrl, dp_phy);
> +
> +               if (ret)
> +                       break;
> +       }
> +
>         if (ret) {
> -               DRM_ERROR("link training #1 failed. ret=3D%d\n", ret);
> +               DRM_ERROR("link training of LTTPR(s) failed. ret=3D%d\n",=
 ret);
>                 goto end;
>         }
>
> -       /* print success info as this is a result of user initiated actio=
n */
> -       drm_dbg_dp(ctrl->drm_dev, "link training #1 successful\n");
> -
> -       ret =3D msm_dp_ctrl_link_train_2(ctrl, training_step);
> +       ret =3D msm_dp_ctrl_link_train_1_2(ctrl, training_step, DP_PHY_DP=
RX);
>         if (ret) {
> -               DRM_ERROR("link training #2 failed. ret=3D%d\n", ret);
> +               DRM_ERROR("link training on sink failed. ret=3D%d\n", ret=
);
>                 goto end;
>         }
>
> -       /* print success info as this is a result of user initiated actio=
n */
> -       drm_dbg_dp(ctrl->drm_dev, "link training #2 successful\n");
> -
>  end:
>         msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
>
> @@ -1622,7 +1674,7 @@ static int msm_dp_ctrl_link_maintenance(struct msm_=
dp_ctrl_private *ctrl)
>         if (ret)
>                 goto end;
>
> -       msm_dp_ctrl_clear_training_pattern(ctrl);
> +       msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
>
>         msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_=
VIDEO);
>
> @@ -1646,7 +1698,7 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struc=
t msm_dp_ctrl_private *ctrl)
>                 return false;
>         }
>         msm_dp_catalog_ctrl_send_phy_pattern(ctrl->catalog, pattern_reque=
sted);
> -       msm_dp_ctrl_update_vx_px(ctrl);
> +       msm_dp_ctrl_update_phy_vx_px(ctrl, DP_PHY_DPRX);
>         msm_dp_link_send_test_response(ctrl->link);
>
>         pattern_sent =3D msm_dp_catalog_ctrl_read_phy_pattern(ctrl->catal=
og);
> @@ -1888,7 +1940,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_=
ctrl)
>                         }
>
>                         /* stop link training before start re training  *=
/
> -                       msm_dp_ctrl_clear_training_pattern(ctrl);
> +                       msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_D=
PRX);
>                 }
>
>                 rc =3D msm_dp_ctrl_reinitialize_mainlink(ctrl);
> @@ -1912,7 +1964,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_=
ctrl)
>                  * link training failed
>                  * end txing train pattern here
>                  */
> -               msm_dp_ctrl_clear_training_pattern(ctrl);
> +               msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
>
>                 msm_dp_ctrl_deinitialize_mainlink(ctrl);
>                 rc =3D -ECONNRESET;
> @@ -1983,7 +2035,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_d=
p_ctrl, bool force_link_train
>                 msm_dp_ctrl_link_retrain(ctrl);
>
>         /* stop txing train pattern to end link training */
> -       msm_dp_ctrl_clear_training_pattern(ctrl);
> +       msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
>
>         /*
>          * Set up transfer unit values and set controller state to send
> --
> 2.45.2
>

