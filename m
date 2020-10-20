Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5A16294505
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Oct 2020 00:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438999AbgJTWQA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 18:16:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438967AbgJTWQA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 18:16:00 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B17F5C0613D3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2020 15:15:58 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id v22so110707ply.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2020 15:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=Byl068bSjplKbL4+PGKJ1dC619S+qOz8jD1tUz0XwHk=;
        b=KE+PETcp6MXxJp2h7R+7wX6TA7o0bnwOzHNuKMnSSWmLWLDVi3exXozEpC2/oJlQN8
         +KRIahNRWZR0vRBqf05eo1Ca/0Copjo/AjJwsptmk2Bqoyw0eP6VNszY2u4x5ZaFVSkZ
         BbyHVYsoDxQI619GGH5gKMoNNbSkLn0vaviZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=Byl068bSjplKbL4+PGKJ1dC619S+qOz8jD1tUz0XwHk=;
        b=FvBdBR2txJblyH11WAv75roTZR7r0bXgJTgMo0vUaxmhO5ihv9T0G+j2ml8305GNJ5
         3L/zp5mFXLTGGAzlbR09wtnPVCo1/iW/ROmchF9HslhXPxGIrd4IecRD5jM44ZbUaYc+
         Es9DRuj1fKIpfINrRg4X6OWbujwITo86r8QmcjRpI3HKQRc4431qpqUmpuneH7BLV/Zx
         HqlbjkhBTDa7XwbAVXSnwSksKvW1kEzQnFNvwjFH/86RnWN7L/EBxEilUDJevVsOq0XQ
         IoXmIbydrNS4615DEGTPrUd7Id5mFlDMCsxiN0rM1WSKUVDuB99AfV49aNupdCVFlX/z
         dz1Q==
X-Gm-Message-State: AOAM532XeZr7TQFS+C4Qn8233fL8Xy692J6VKUClm42EebhytfDnLedP
        ZKZHCQF52JVvzwPCgJ6WsximsHPb/KUZLw==
X-Google-Smtp-Source: ABdhPJyhGqquEURVzCUWjkxaXE1f4ZbyUwHjKWuvLzMw7wyKxAe9p8Ze3hRndsQEWKczhrZO5Thjvw==
X-Received: by 2002:a17:902:b7c3:b029:d4:bc6e:8aae with SMTP id v3-20020a170902b7c3b02900d4bc6e8aaemr269153plz.12.1603232158094;
        Tue, 20 Oct 2020 15:15:58 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id e196sm50988pfh.128.2020.10.20.15.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 15:15:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201020165959.7441-1-khsieh@codeaurora.org>
References: <20201020165959.7441-1-khsieh@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: skip checking LINK_STATUS_UPDATED bit
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
To:     Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
        sean@poorly.run
Date:   Tue, 20 Oct 2020 15:15:55 -0700
Message-ID: <160323215566.884498.14018580767640192186@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2020-10-20 09:59:59)
> No need to check LINK_STATuS_UPDATED bit before

LINK_STATUS_UPDATED?

> return 6 bytes of link status during link training.

Why?

> This patch also fix phy compliance test link rate
> conversion error.

How?

>=20
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Any Fixes: tag?

>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 20 ++++++--------------
>  drivers/gpu/drm/msm/dp/dp_link.c | 24 +++++++++++-------------
>  2 files changed, 17 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp=
_ctrl.c
> index 6bdaec778c4c..76e891c91c6e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1061,23 +1061,15 @@ static bool dp_ctrl_train_pattern_set(struct dp_c=
trl_private *ctrl,
>  static int dp_ctrl_read_link_status(struct dp_ctrl_private *ctrl,
>                                     u8 *link_status)
>  {
> -       int len =3D 0;
> -       u32 const offset =3D DP_LANE_ALIGN_STATUS_UPDATED - DP_LANE0_1_ST=
ATUS;
> -       u32 link_status_read_max_retries =3D 100;
> -
> -       while (--link_status_read_max_retries) {
> -               len =3D drm_dp_dpcd_read_link_status(ctrl->aux,
> -                       link_status);
> -               if (len !=3D DP_LINK_STATUS_SIZE) {
> -                       DRM_ERROR("DP link status read failed, err: %d\n"=
, len);
> -                       return len;
> -               }
> +       int ret =3D 0, len;
> =20
> -               if (!(link_status[offset] & DP_LINK_STATUS_UPDATED))
> -                       return 0;
> +       len =3D drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
> +       if (len !=3D DP_LINK_STATUS_SIZE) {
> +               DRM_ERROR("DP link status read failed, err: %d\n", len);
> +               ret =3D len;

Could this be positive if the len is greater than 0 but not
DP_LINK_STATUS_SIZE? Maybe the check should be len < 0? We certainly
don't want to return some smaller size from this function, right?

>         }
> =20
> -       return -ETIMEDOUT;
> +       return ret;
>  }
> =20
>  static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp=
_link.c
> index c811da515fb3..58d65daae3b3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -773,7 +773,8 @@ static int dp_link_process_link_training_request(stru=
ct dp_link_private *link)
>                         link->request.test_lane_count);
> =20
>         link->dp_link.link_params.num_lanes =3D link->request.test_lane_c=
ount;
> -       link->dp_link.link_params.rate =3D link->request.test_link_rate;
> +       link->dp_link.link_params.rate =3D
> +               drm_dp_bw_code_to_link_rate(link->request.test_link_rate);

Why are we storing bw_code in test_link_rate? This looks very confusing.

> =20
>         return 0;
>  }
