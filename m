Return-Path: <linux-arm-msm+bounces-53598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5B5A8188F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 00:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BEE67B31D3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 22:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5DB25523A;
	Tue,  8 Apr 2025 22:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Laqpi3gP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B082550CE;
	Tue,  8 Apr 2025 22:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151398; cv=none; b=BCqMWYsZaERFMP+jFBvTAVN677FaZBX5J5hn+et09o63j0dtMmC4sRIdyTtJ4m+pD3M4/3aD0UrJ4VbnuzVNzHK9R66Gj2nKamUIaMlbzX7gRZnqKWi53bJD3IhcmoVFs4ouYF6CSHYkXSWIO9iw3CPUek6ePZpiWFR1M3KX7xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151398; c=relaxed/simple;
	bh=hdUkBzlMMR7/m9Ks7sR9FCklkw0x2yc+Iv5XlHoahsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iXQm3UvBQxKukUDLkHG2zgbzpAes4sFVkqS0GCx37JRA3xwIdKNBpI21TnJN/6lLOGR3GCl6hmUZ8FjqdrPz4IpSb4X8uYn4xPJOVkzvMh5f+1LVx5snQxTGZIvVhVISkx/J9g2xBDa9i4NmOceSnHOj3CYKjlh792JZEzVpwIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Laqpi3gP; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so36836175e9.3;
        Tue, 08 Apr 2025 15:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744151394; x=1744756194; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=trYnNMkpMxvHvEGlTFlPN0SIFfLLkw2QH1P3nATN+eY=;
        b=Laqpi3gPstDwL+6nEdrySHgGSOVYl5KMyvKDRSD2zWA4OayMv54R4H5+/X8hWPw19w
         iVGFQSjuWtb4uDouUyGcKdjbeIqET7Jf3l9k61amRZlPt7D3skJVxuKJjFfzYIrbemLw
         Tqzz/2jJLeXIqR5vN5MCyIeB6KJDfFxEcf0Z392ktWOCMe8VKxUBCyTC2POO8u3sOynK
         d+nc5C7YHzJZ6jwA1e6YiOVQxrw4IqyUcDCmnuIHUBmj970CMmMrbGmWciWmXldzvsSd
         A/ZBYd9mejt0VDD/DW86XlRIwUdZQBcWhtBGaxfyj/9LM7J5leS2dqhEsIU8m2rSxAqu
         PZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151394; x=1744756194;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=trYnNMkpMxvHvEGlTFlPN0SIFfLLkw2QH1P3nATN+eY=;
        b=oH/2xGwpVam8q9qO+qtaL3YqxQHrM7JSHpX9vkrz/t0gPxm2Ua7pxAQjDf6n7sJC9/
         O15BP7l+0XMtXpnEuu3fxOyv1fhjE1t2PepjIBUbk/GobtF9xRZIA4/v1A/Lt1oAYCHd
         1AIKwIx9KAVgucmZhlZbskAYDyy2EHBCUc/APjf7zlIcKcejSI6kJG6s4GK1IQXs+Omv
         yc4o03n0BgUEGNuOslB8f1ur6r5TZ+JNG4dorffiSKhdfCaIAAbsUbODbDKsPudnXwZO
         4vum3EP2wpTKrhsMaRHC3Hti+Z6OWNxK81TrE66X8p3hI0CTM8dh/4946fs/ZCrMkIoJ
         eDxA==
X-Forwarded-Encrypted: i=1; AJvYcCV9PPOtHAhls4PXPTsZChId5ycuRM0hh916BfMHy6+578TGxLnXoEYy3dEj5q7GWwQmn+tdgJtRBhm2ZU1N@vger.kernel.org, AJvYcCX+Qb4hBqR/2MpPn99DINGrjZ8zbD+aYSWevOoiawF+RlciDQJffkfh9lzH4qr/kBcfv6Z/jkf4gzLfYNuB@vger.kernel.org
X-Gm-Message-State: AOJu0Yx15sWwU6ukEIJ5A2KknVIHXGyzqfZFNrN5k8r8bHoLN5qXotwI
	BkiqjdI1Isl93XCXhpRKVO0uhVLgUffDV4z+jiv5mOyE2wkd5CMvnGnwrnAkkO6Hk+ysMzI8Pqz
	gMWGbFRbi2Pcju58GCA4PybveMg==
X-Gm-Gg: ASbGncuf1LWAc5j60ut/3EvU0UNAJy5w2RwDjcrop3saZlT8d+ZYqxI3Q1uLe8566BV
	7OYCtlWtfTPHLAqtpS9yEc/K+u7dQtE0dFicJcar9WeD/TZal9AAAiEVdo3cBFRHMDb4KwFVdx6
	alNmyuyxXrozgp/18tkf+Kq9Q3qP30+XCc4swa
X-Google-Smtp-Source: AGHT+IGFJ1h6c7rrjXitNfryyN56EJFk54x4HXhpiJE0OeyKnJIfnuX0wLfbdBCcxZ0T9JVpEVGf90+BeOOm/NW27NU=
X-Received: by 2002:a05:6000:4205:b0:391:489a:ce12 with SMTP id
 ffacd0b85a97d-39d87ac932emr647254f8f.26.1744151393766; Tue, 08 Apr 2025
 15:29:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311234109.136510-1-alex.vinarskis@gmail.com>
 <20250311234109.136510-3-alex.vinarskis@gmail.com> <ytqnodci5xhkd4eqs3homrdwbv4zkaiewalfsbuclvkkaw754t@wpt3noqxlcvu>
In-Reply-To: <ytqnodci5xhkd4eqs3homrdwbv4zkaiewalfsbuclvkkaw754t@wpt3noqxlcvu>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Wed, 9 Apr 2025 00:29:42 +0200
X-Gm-Features: ATxdqUH4lOg3IAGwzqaLkczSwrWtKZLWkStF4_OSAJfvJH7twA4Fq4RzWuI0R2I
Message-ID: <CAMcHhXrZiO7PxyGsZY3upPzk=GeM4GVSmwUUWy2J+DYEe6ggVg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/msm/dp: Introduce link training per-segment
 for LTTPRs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, laurentiu.tudor1@dell.com, abel.vesa@linaro.org, 
	johan@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Apr 2025 at 02:55, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, Mar 12, 2025 at 12:38:04AM +0100, Aleksandrs Vinarskis wrote:
> > DisplayPort requires per-segment link training when LTTPR are switched
> > to non-transparent mode, starting with LTTPR closest to the source.
> > Only when each segment is trained individually, source can link train
> > to sink.
> >
> > Implement per-segment link traning when LTTPR(s) are detected, to
> > support external docking stations. On higher level, changes are:
> >
> > * Pass phy being trained down to all required helpers
> > * Run CR, EQ link training per phy
> > * Set voltage swing, pre-emphasis levels per phy
> >
> > This ensures successful link training both when connected directly to
> > the monitor (single LTTPR onboard most X1E laptops) and via the docking
> > station (at least two LTTPRs).
> >
> > Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 137 +++++++++++++++++++---------
> >  drivers/gpu/drm/msm/dp/dp_ctrl.h    |   2 +-
> >  drivers/gpu/drm/msm/dp/dp_display.c |   4 +-
> >  3 files changed, 99 insertions(+), 44 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > index d8633a596f8d..419a519ccf6b 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > @@ -79,6 +79,8 @@ struct msm_dp_ctrl_private {
> >       struct msm_dp_link *link;
> >       struct msm_dp_catalog *catalog;
> >
> > +     int *lttpr_count;
>
> Please move lttpr_count to msm_dp_ctrl or msm_dp_link. It would remove a
> need for this ugly pointer.

Thanks for your review,

Sure, will move it.

>
> > +
> >       struct phy *phy;
> >
> >       unsigned int num_core_clks;
> > @@ -1034,9 +1036,11 @@ static int msm_dp_ctrl_set_vx_px(struct msm_dp_ctrl_private *ctrl,
> >       return 0;
> >  }
> >
> > -static int msm_dp_ctrl_update_vx_px(struct msm_dp_ctrl_private *ctrl)
> > +static int msm_dp_ctrl_update_phy_vx_px(struct msm_dp_ctrl_private *ctrl,
> > +                                     enum drm_dp_phy dp_phy)
> >  {
> >       struct msm_dp_link *link = ctrl->link;
> > +     int reg = DP_TRAINING_LANE0_SET;
> >       int ret = 0, lane, lane_cnt;
> >       u8 buf[4];
> >       u32 max_level_reached = 0;
> > @@ -1075,8 +1079,11 @@ static int msm_dp_ctrl_update_vx_px(struct msm_dp_ctrl_private *ctrl)
> >
> >       drm_dbg_dp(ctrl->drm_dev, "sink: p|v=0x%x\n",
> >                       voltage_swing_level | pre_emphasis_level);
> > -     ret = drm_dp_dpcd_write(ctrl->aux, DP_TRAINING_LANE0_SET,
> > -                                     buf, lane_cnt);
> > +
> > +     if (dp_phy != DP_PHY_DPRX)
> > +             reg = DP_TRAINING_LANE0_SET_PHY_REPEATER(dp_phy);
>
> Please always init reg here rather than using a default value above.
> It's a cleaner code IMO.

Will fix.

>
> > +
> > +     ret = drm_dp_dpcd_write(ctrl->aux, reg, buf, lane_cnt);
> >       if (ret == lane_cnt)
> >               ret = 0;
> >
> > @@ -1084,9 +1091,10 @@ static int msm_dp_ctrl_update_vx_px(struct msm_dp_ctrl_private *ctrl)
> >  }
> >
> >  static bool msm_dp_ctrl_train_pattern_set(struct msm_dp_ctrl_private *ctrl,
> > -             u8 pattern)
> > +             u8 pattern, enum drm_dp_phy dp_phy)
> >  {
> >       u8 buf;
> > +     int reg = DP_TRAINING_PATTERN_SET;
> >       int ret = 0;
> >
> >       drm_dbg_dp(ctrl->drm_dev, "sink: pattern=%x\n", pattern);
> > @@ -1096,7 +1104,10 @@ static bool msm_dp_ctrl_train_pattern_set(struct msm_dp_ctrl_private *ctrl,
> >       if (pattern && pattern != DP_TRAINING_PATTERN_4)
> >               buf |= DP_LINK_SCRAMBLING_DISABLE;
> >
> > -     ret = drm_dp_dpcd_writeb(ctrl->aux, DP_TRAINING_PATTERN_SET, buf);
> > +     if (dp_phy != DP_PHY_DPRX)
> > +             reg = DP_TRAINING_PATTERN_SET_PHY_REPEATER(dp_phy);
>
> The same comment here.

Will fix.

>
> > +
> > +     ret = drm_dp_dpcd_writeb(ctrl->aux, reg, buf);
> >       return ret == 1;
> >  }
> >
> > @@ -1115,12 +1126,16 @@ static int msm_dp_ctrl_read_link_status(struct msm_dp_ctrl_private *ctrl,
> >  }
> >
> >  static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
> > -                     int *training_step)
> > +                     int *training_step, enum drm_dp_phy dp_phy)
> >  {
> > +     int delay_us;
> >       int tries, old_v_level, ret = 0;
> >       u8 link_status[DP_LINK_STATUS_SIZE];
> >       int const maximum_retries = 4;
> >
> > +     delay_us = drm_dp_read_clock_recovery_delay(ctrl->aux,
> > +             ctrl->panel->dpcd, dp_phy, false);
> > +
> >       msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
> >
> >       *training_step = DP_TRAINING_1;
> > @@ -1129,18 +1144,19 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
> >       if (ret)
> >               return ret;
> >       msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_1 |
> > -             DP_LINK_SCRAMBLING_DISABLE);
> > +             DP_LINK_SCRAMBLING_DISABLE, dp_phy);
> >
> > -     ret = msm_dp_ctrl_update_vx_px(ctrl);
> > +     msm_dp_link_reset_phy_params_vx_px(ctrl->link);
> > +     ret = msm_dp_ctrl_update_phy_vx_px(ctrl, dp_phy);
> >       if (ret)
> >               return ret;
> >
> >       tries = 0;
> >       old_v_level = ctrl->link->phy_params.v_level;
> >       for (tries = 0; tries < maximum_retries; tries++) {
> > -             drm_dp_link_train_clock_recovery_delay(ctrl->aux, ctrl->panel->dpcd);
> > +             fsleep(delay_us);
> >
> > -             ret = msm_dp_ctrl_read_link_status(ctrl, link_status);
> > +             ret = drm_dp_dpcd_read_phy_link_status(ctrl->aux, dp_phy, link_status);
>
> Please rebase this code on top of drm-misc-next.

What is the relation of drm-misc-next to linux-next? When rebasing on
top of drm-misc-next, I lose all displays including internal one. Same
if just build drm-misc-next without this series with config imported
from linux-next. I could of course address comments, test on
linux-next and then rebase before submitting, but that sounds wrong.

```
auxiliary aux_bridge.aux_bridge.0: deferred probe pending:
aux_bridge.aux_bridge: failed to acquire drm_bridge
auxiliary aux_bridge.aux_bridge.1: deferred probe pending:
aux_bridge.aux_bridge: failed to acquire drm_bridge
```

>
> >               if (ret)
> >                       return ret;
> >
> > @@ -1161,7 +1177,7 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
> >               }
> >
> >               msm_dp_link_adjust_levels(ctrl->link, link_status);
> > -             ret = msm_dp_ctrl_update_vx_px(ctrl);
> > +             ret = msm_dp_ctrl_update_phy_vx_px(ctrl, dp_phy);
> >               if (ret)
> >                       return ret;
> >       }
> > @@ -1213,21 +1229,31 @@ static int msm_dp_ctrl_link_lane_down_shift(struct msm_dp_ctrl_private *ctrl)
> >       return 0;
> >  }
> >
> > -static void msm_dp_ctrl_clear_training_pattern(struct msm_dp_ctrl_private *ctrl)
> > +static void msm_dp_ctrl_clear_training_pattern(struct msm_dp_ctrl_private *ctrl,
> > +                                            enum drm_dp_phy dp_phy)
> >  {
> > -     msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_DISABLE);
> > -     drm_dp_link_train_channel_eq_delay(ctrl->aux, ctrl->panel->dpcd);
> > +     int delay_us;
> > +
> > +     msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_DISABLE, dp_phy);
> > +
> > +     delay_us = drm_dp_read_channel_eq_delay(ctrl->aux,
> > +             ctrl->panel->dpcd, dp_phy, false);
>
> Misaligned, checkpatch should warn about it.

Will fix, somehow overlooked it.

>
> > +     fsleep(delay_us);
> >  }
> >
> >  static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
> > -                     int *training_step)
> > +                     int *training_step, enum drm_dp_phy dp_phy)
> >  {
> > +     int delay_us;
> >       int tries = 0, ret = 0;
> >       u8 pattern;
> >       u32 state_ctrl_bit;
> >       int const maximum_retries = 5;
> >       u8 link_status[DP_LINK_STATUS_SIZE];
> >
> > +     delay_us = drm_dp_read_channel_eq_delay(ctrl->aux,
> > +             ctrl->panel->dpcd, dp_phy, false);
>
> Misaligned

Will fix.

>
> > +
> >       msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
> >
> >       *training_step = DP_TRAINING_2;
> > @@ -1247,12 +1273,12 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
> >       if (ret)
> >               return ret;
> >
> > -     msm_dp_ctrl_train_pattern_set(ctrl, pattern);
> > +     msm_dp_ctrl_train_pattern_set(ctrl, pattern, dp_phy);
> >
> >       for (tries = 0; tries <= maximum_retries; tries++) {
> > -             drm_dp_link_train_channel_eq_delay(ctrl->aux, ctrl->panel->dpcd);
> > +             fsleep(delay_us);
> >
> > -             ret = msm_dp_ctrl_read_link_status(ctrl, link_status);
> > +             ret = drm_dp_dpcd_read_phy_link_status(ctrl->aux, dp_phy, link_status);
> >               if (ret)
> >                       return ret;
> >
> > @@ -1262,7 +1288,7 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
> >               }
> >
> >               msm_dp_link_adjust_levels(ctrl->link, link_status);
> > -             ret = msm_dp_ctrl_update_vx_px(ctrl);
> > +             ret = msm_dp_ctrl_update_phy_vx_px(ctrl, dp_phy);
> >               if (ret)
> >                       return ret;
> >
> > @@ -1271,10 +1297,32 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
> >       return -ETIMEDOUT;
> >  }
> >
> > +static int msm_dp_ctrl_link_train_1_2(struct msm_dp_ctrl_private *ctrl,
> > +                                   int *training_step, enum drm_dp_phy dp_phy)
> > +{
> > +     int ret;
> > +
> > +     ret = msm_dp_ctrl_link_train_1(ctrl, training_step, dp_phy);
> > +     if (ret) {
> > +             DRM_ERROR("link training #1 on phy %d failed. ret=%d\n", dp_phy, ret);
> > +             return ret;
> > +     }
> > +     drm_dbg_dp(ctrl->drm_dev, "link training #1 on phy %d successful\n", dp_phy);
> > +
> > +     ret = msm_dp_ctrl_link_train_2(ctrl, training_step, dp_phy);
> > +     if (ret) {
> > +             DRM_ERROR("link training #2 on phy %d failed. ret=%d\n", dp_phy, ret);
> > +             return ret;
> > +     }
> > +     drm_dbg_dp(ctrl->drm_dev, "link training #2 on phy %d successful\n", dp_phy);
> > +
> > +     return 0;
> > +}
> > +
> >  static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
> >                       int *training_step)
> >  {
> > -     int ret = 0;
> > +     int ret = 0, i;
>
> Don't mix initialized and non-initialized variables in the same line.

Will fix.

>
> >       const u8 *dpcd = ctrl->panel->dpcd;
> >       u8 encoding[] = { 0, DP_SET_ANSI_8B10B };
> >       u8 assr;
> > @@ -1286,8 +1334,6 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
> >       link_info.rate = ctrl->link->link_params.rate;
> >       link_info.capabilities = DP_LINK_CAP_ENHANCED_FRAMING;
> >
> > -     msm_dp_link_reset_phy_params_vx_px(ctrl->link);
> > -
> >       msm_dp_aux_link_configure(ctrl->aux, &link_info);
> >
> >       if (drm_dp_max_downspread(dpcd))
> > @@ -1302,23 +1348,29 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
> >                               &assr, 1);
> >       }
> >
> > -     ret = msm_dp_ctrl_link_train_1(ctrl, training_step);
> > +     for (i = *ctrl->lttpr_count - 1; i >= 0; i--) {
> > +             enum drm_dp_phy dp_phy = DP_PHY_LTTPR(i);
> > +
> > +             ret = msm_dp_ctrl_link_train_1_2(ctrl, training_step, dp_phy);
> > +             msm_dp_ctrl_clear_training_pattern(ctrl, dp_phy);
> > +
> > +             if (ret)
> > +                     break;
> > +     }
> > +
> >       if (ret) {
> > -             DRM_ERROR("link training #1 failed. ret=%d\n", ret);
> > +             DRM_ERROR("link training of LTTPR(s) failed. ret=%d\n", ret);
> >               goto end;
> >       }
> >
> > -     /* print success info as this is a result of user initiated action */
> > -     drm_dbg_dp(ctrl->drm_dev, "link training #1 successful\n");
> > -
> > -     ret = msm_dp_ctrl_link_train_2(ctrl, training_step);
> > +     ret = msm_dp_ctrl_link_train_1_2(ctrl, training_step, DP_PHY_DPRX);
> >       if (ret) {
> > -             DRM_ERROR("link training #2 failed. ret=%d\n", ret);
> > +             DRM_ERROR("link training on sink failed. ret=%d\n", ret);
> >               goto end;
> >       }
> >
> >       /* print success info as this is a result of user initiated action */
> > -     drm_dbg_dp(ctrl->drm_dev, "link training #2 successful\n");
> > +     drm_dbg_dp(ctrl->drm_dev, "link training on sink successful\n");
> >
>
> No need for keeping these debug messages, you have them in
> msm_dp_ctrl_link_train_1_2().

Will drop.

>
> >  end:
> >       msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
> > @@ -1636,7 +1688,7 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
> >       if (ret)
> >               goto end;
> >
> > -     msm_dp_ctrl_clear_training_pattern(ctrl);
> > +     msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
> >
> >       msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
> >
> > @@ -1660,7 +1712,7 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
> >               return false;
> >       }
> >       msm_dp_catalog_ctrl_send_phy_pattern(ctrl->catalog, pattern_requested);
> > -     msm_dp_ctrl_update_vx_px(ctrl);
> > +     msm_dp_ctrl_update_phy_vx_px(ctrl, DP_PHY_DPRX);
> >       msm_dp_link_send_test_response(ctrl->link);
> >
> >       pattern_sent = msm_dp_catalog_ctrl_read_phy_pattern(ctrl->catalog);
> > @@ -1902,7 +1954,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
> >                       }
> >
> >                       /* stop link training before start re training  */
> > -                     msm_dp_ctrl_clear_training_pattern(ctrl);
> > +                     msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
>
> Just DPRX or should this include all LTTPRs? Could you point out how
> this is handled inside Intel or AMD drivers?

Just DPRX since this call follows `rc =
msm_dp_ctrl_setup_main_link(ctrl, &training_step);` [1], which in turn
calls `msm_dp_ctrl_link_train` [2].
The latter one with the proposed changes will attempt to Train
LTTPRx->Clear training pattern on LTTPRx->Proceed. Finally, it will
attempt to Train DPRX, without cleaning the training pattern:

```
    for (i = *ctrl->lttpr_count - 1; i >= 0; i--) {
        enum drm_dp_phy dp_phy = DP_PHY_LTTPR(i);

        ret = msm_dp_ctrl_link_train_1_2(ctrl, training_step, dp_phy);
        msm_dp_ctrl_clear_training_pattern(ctrl, dp_phy);

        if (ret)
            break;
    }

    if (ret) {
        DRM_ERROR("link training of LTTPR(s) failed. ret=%d\n", ret);
        goto end;
    }

    ret = msm_dp_ctrl_link_train_1_2(ctrl, training_step, DP_PHY_DPRX);
    if (ret) {
        DRM_ERROR("link training on sink failed. ret=%d\n", ret);
        goto end;
    }
```

The reason for not clearing training pattern on DPRX right after
training like with LTTPRs appears to be needed for compliance, as it
should only be cleared right before stream starts [3]:
```
    if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN)
        return rc;

    if (rc == 0) {  /* link train successfully */
        /*
         * do not stop train pattern here
         * stop link training at on_stream
         * to pass compliance test
         */
    } else  {
        /*
         * link training failed
         * end txing train pattern here
         */
        msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);

        msm_dp_ctrl_deinitialize_mainlink(ctrl);
        rc = -ECONNRESET;
    }
```

Intel does a somewhat similar approach - they have
`intel_dp_link_train_all_phys` function [4] which would Train
LTTPRx->Clear dpcd training pattern on LTTPRx->Proceed, and finally
train DPRX but not disable training pattern. DPRX's training is
disabled separately in the `intel_dp_stop_link_train` [5] at a much
later stage.

The difference to msm's drm driver is that in case of link training
failure, Intel schedules software hpd event [6] and exists, while msm
stops and restarts training with reduced parameters internally (this
very function), hence it appears more than once.

[1] https://github.com/torvalds/linux/blob/v6.14/drivers/gpu/drm/msm/dp/dp_ctrl.c#L1856
[2] https://github.com/torvalds/linux/blob/v6.14/drivers/gpu/drm/msm/dp/dp_ctrl.c#L1273
[3] https://github.com/torvalds/linux/blob/v6.14/drivers/gpu/drm/msm/dp/dp_ctrl.c#L1917-L1932
[4] https://github.com/torvalds/linux/blob/v6.14/drivers/gpu/drm/i915/display/intel_dp_link_training.c#L1338-L1364
[5] https://github.com/torvalds/linux/blob/v6.14/drivers/gpu/drm/i915/display/intel_dp_link_training.c#L1107-L1136
[6] https://github.com/torvalds/linux/blob/v6.14/drivers/gpu/drm/i915/display/intel_dp_link_training.c#L1313-L1336

>
> >               }
> >
> >               rc = msm_dp_ctrl_reinitialize_mainlink(ctrl);
> > @@ -1926,7 +1978,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
> >                * link training failed
> >                * end txing train pattern here
> >                */
> > -             msm_dp_ctrl_clear_training_pattern(ctrl);
> > +             msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
>
> The same.
>
> >
> >               msm_dp_ctrl_deinitialize_mainlink(ctrl);
> >               rc = -ECONNRESET;
> > @@ -1997,7 +2049,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
> >               msm_dp_ctrl_link_retrain(ctrl);
> >
> >       /* stop txing train pattern to end link training */
> > -     msm_dp_ctrl_clear_training_pattern(ctrl);
> > +     msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
> >
> >       /*
> >        * Set up transfer unit values and set controller state to send
> > @@ -2207,7 +2259,7 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
> >
> >  struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
> >                       struct msm_dp_panel *panel,     struct drm_dp_aux *aux,
> > -                     struct msm_dp_catalog *catalog,
> > +                     struct msm_dp_catalog *catalog, int *lttpr_count,
> >                       struct phy *phy)
> >  {
> >       struct msm_dp_ctrl_private *ctrl;
> > @@ -2242,12 +2294,13 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
> >       init_completion(&ctrl->video_comp);
> >
> >       /* in parameters */
> > -     ctrl->panel    = panel;
> > -     ctrl->aux      = aux;
> > -     ctrl->link     = link;
> > -     ctrl->catalog  = catalog;
> > -     ctrl->dev      = dev;
> > -     ctrl->phy      = phy;
> > +     ctrl->panel       = panel;
> > +     ctrl->aux         = aux;
> > +     ctrl->link        = link;
> > +     ctrl->catalog     = catalog;
> > +     ctrl->dev         = dev;
> > +     ctrl->phy         = phy;
> > +     ctrl->lttpr_count = lttpr_count;
>
> I'd rather reduce noise and keep old assignments intact.

Actually, taking into account the very first comment of your review,
this change will drop all together.

Thanks,
Will be sending updated version shortly,

Alex

>
> >
> >       ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl);
> >       if (ret) {
> > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> > index b7abfedbf574..3fb45b138b31 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> > @@ -27,7 +27,7 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
> >  void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl);
> >  struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
> >                       struct msm_dp_panel *panel,     struct drm_dp_aux *aux,
> > -                     struct msm_dp_catalog *catalog,
> > +                     struct msm_dp_catalog *catalog, int *lttpr_count,
> >                       struct phy *phy);
> >
> >  void msm_dp_ctrl_reset_irq_ctrl(struct msm_dp_ctrl *msm_dp_ctrl, bool enable);
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index d0c2dc7e6648..393ce3479a7e 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -108,6 +108,7 @@ struct msm_dp_display_private {
> >       struct msm_dp_event event_list[DP_EVENT_Q_MAX];
> >       spinlock_t event_lock;
> >
> > +     int lttpr_count;
> >       u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE];
> >
> >       bool wide_bus_supported;
> > @@ -397,7 +398,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
> >       if (rc)
> >               goto end;
> >
> > -     msm_dp_display_lttpr_init(dp, dpcd);
> > +     dp->lttpr_count = msm_dp_display_lttpr_init(dp, dpcd);
> >
> >       rc = msm_dp_panel_read_sink_caps(dp->panel, dp->lttpr_common_caps, connector);
> >       if (rc)
> > @@ -798,6 +799,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
> >
> >       dp->ctrl = msm_dp_ctrl_get(dev, dp->link, dp->panel, dp->aux,
> >                              dp->catalog,
> > +                            &dp->lttpr_count,
> >                              phy);
> >       if (IS_ERR(dp->ctrl)) {
> >               rc = PTR_ERR(dp->ctrl);
> > --
> > 2.45.2
> >
>
> --
> With best wishes
> Dmitry

