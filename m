Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7B9C32E297
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 07:56:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbhCEG4C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 01:56:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbhCEG4C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 01:56:02 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB68CC061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Mar 2021 22:56:00 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id e6so724951pgk.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Mar 2021 22:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=fXXHDyZIBHLXRZML6uKSyOXVnBUPIsC8PyjRDoTsi8c=;
        b=V1pVLGtXSidewpc1BUaW/R+em4Dt5/wSfRismBwn/9ACwNntumwMMYHAuiHgTsha6H
         Sd9ca39E9ZTqn5fH2eiC+rV+EvQ9ADYee0eLe12xmL3cEzOlSZlbNN32sidDGDqx+UZB
         bbVM7QOPwNPEhfu0Axnw02kGq7qHlZgu9eIGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=fXXHDyZIBHLXRZML6uKSyOXVnBUPIsC8PyjRDoTsi8c=;
        b=ASGKp0nSC182I4ClZbRyF3riWvedAmxUFxwitSUobFZZD/ZcNhPDYkRjise3bkF558
         p+dUh2pE49olX0ju/SNMKnnI9jAL8t/AbmaWF4O6R8fUcVFZS7eF4Q3YDB9mQMYeB3TQ
         UhhDZqC5H3/z5NC+ynLfMiukkHbgaac/qigzq4Y/Iw3/Yw9f6znklXrf+b3i6DK192vV
         cXPH3xKJGI1eFEgkHVckLRlyG4OtTeb5YsaJTdmoX+F8wmY5b72n8lo4nxzc+H8+bwzp
         XinRjK/lH0Q+YbOYkpDRIIvIAR0EPWsxK9Vam22o+ZMnlWa3yzgLM3tP9vel/aGy/Z5O
         MYFg==
X-Gm-Message-State: AOAM531Qr4FSaJ7VCKIEim2DmgY0D+KdNCYtN75s+7RdrgbQMoEVuRfV
        c3zOKDiJmfdbaekn+cE/C+F+kjyKb3U7Jw==
X-Google-Smtp-Source: ABdhPJzzy67CRgzY77C8ioWoVCDNiqtSJJYzEJO6TfDxIUcpitXpVQjZvtkdpeyDZ5oSIErtuQTxsw==
X-Received: by 2002:a63:465d:: with SMTP id v29mr7046518pgk.225.1614927360315;
        Thu, 04 Mar 2021 22:56:00 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:b498:4a2d:bc34:b77e])
        by smtp.gmail.com with ESMTPSA id f6sm1422647pfk.11.2021.03.04.22.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 22:55:59 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1614907912-6880-1-git-send-email-abhinavk@codeaurora.org>
References: <1614907912-6880-1-git-send-email-abhinavk@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: Fix warnings reported by kbot in DP driver
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, tanmay@codeaurora.org,
        khsieh@codeaurora.org, dan.carpenter@oracle.com
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        dri-devel@lists.freedesktop.org
Date:   Thu, 04 Mar 2021 22:55:58 -0800
Message-ID: <161492735848.1478170.885416005935439120@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Maybe subject could be "Ignore debugfs failures, fix indentation, fix
logical error"?

Quoting Abhinav Kumar (2021-03-04 17:31:52)
> Fix the warnings reported by kbot across MSM DP driver.

Which warnings? Can you include them? Or at least list the three things
that are being fixed in this patch?

>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_debug.c | 33 +++++----------------------------
>  drivers/gpu/drm/msm/dp/dp_hpd.c   |  4 ++--
>  drivers/gpu/drm/msm/dp/dp_power.c |  2 +-
>  3 files changed, 8 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/d=
p_debug.c
> index 84670bc..2f6247e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> @@ -226,7 +226,7 @@ static int dp_test_data_show(struct seq_file *m, void=
 *data)
>                                         debug->link->test_video.test_h_wi=
dth);
>                         seq_printf(m, "vdisplay: %d\n",
>                                         debug->link->test_video.test_v_he=
ight);
> -                                       seq_printf(m, "bpc: %u\n",
> +                       seq_printf(m, "bpc: %u\n",
>                                         dp_link_bit_depth_to_bpc(bpc));
>                 } else
>                         seq_puts(m, "0");

Indentation.

> @@ -368,44 +368,21 @@ static int dp_debug_init(struct dp_debug *dp_debug,=
 struct drm_minor *minor)
>         int rc =3D 0;
>         struct dp_debug_private *debug =3D container_of(dp_debug,
>                         struct dp_debug_private, dp_debug);
> -       struct dentry *file;
> -       struct dentry *test_active;
> -       struct dentry *test_data, *test_type;
> =20
> -       file =3D debugfs_create_file("dp_debug", 0444, minor->debugfs_roo=
t,
> +       debugfs_create_file("dp_debug", 0444, minor->debugfs_root,
>                         debug, &dp_debug_fops);
> -       if (IS_ERR_OR_NULL(file)) {
> -               rc =3D PTR_ERR(file);
> -               DRM_ERROR("[%s] debugfs create file failed, rc=3D%d\n",
> -                                 DEBUG_NAME, rc);
> -       }
> =20
> -       test_active =3D debugfs_create_file("msm_dp_test_active", 0444,
> +       debugfs_create_file("msm_dp_test_active", 0444,
>                         minor->debugfs_root,
>                         debug, &test_active_fops);
> -       if (IS_ERR_OR_NULL(test_active)) {
> -               rc =3D PTR_ERR(test_active);
> -               DRM_ERROR("[%s] debugfs test_active failed, rc=3D%d\n",
> -                                 DEBUG_NAME, rc);
> -       }
> =20
> -       test_data =3D debugfs_create_file("msm_dp_test_data", 0444,
> +       debugfs_create_file("msm_dp_test_data", 0444,
>                         minor->debugfs_root,
>                         debug, &dp_test_data_fops);
> -       if (IS_ERR_OR_NULL(test_data)) {
> -               rc =3D PTR_ERR(test_data);
> -               DRM_ERROR("[%s] debugfs test_data failed, rc=3D%d\n",
> -                                 DEBUG_NAME, rc);
> -       }
> =20
> -       test_type =3D debugfs_create_file("msm_dp_test_type", 0444,
> +       debugfs_create_file("msm_dp_test_type", 0444,
>                         minor->debugfs_root,
>                         debug, &dp_test_type_fops);
> -       if (IS_ERR_OR_NULL(test_type)) {
> -               rc =3D PTR_ERR(test_type);
> -               DRM_ERROR("[%s] debugfs test_type failed, rc=3D%d\n",
> -                                 DEBUG_NAME, rc);
> -       }

Debugfs failures.

> =20
>         debug->root =3D minor->debugfs_root;
> =20
> diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.c b/drivers/gpu/drm/msm/dp/dp_=
hpd.c
> index 5b8fe3202..e1c90fa 100644
> --- a/drivers/gpu/drm/msm/dp/dp_hpd.c
> +++ b/drivers/gpu/drm/msm/dp/dp_hpd.c
> @@ -34,8 +34,8 @@ int dp_hpd_connect(struct dp_usbpd *dp_usbpd, bool hpd)
> =20
>         dp_usbpd->hpd_high =3D hpd;
> =20
> -       if (!hpd_priv->dp_cb && !hpd_priv->dp_cb->configure
> -                               && !hpd_priv->dp_cb->disconnect) {
> +       if (!hpd_priv->dp_cb || !hpd_priv->dp_cb->configure
> +                               || !hpd_priv->dp_cb->disconnect) {

Logical error.

>                 pr_err("hpd dp_cb not initialized\n");
>                 return -EINVAL;
>         }
> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/d=
p_power.c
> index 9c4ea00..3961ba4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_power.c
> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
> @@ -269,7 +269,7 @@ int dp_power_clk_enable(struct dp_power *dp_power,
>                 DRM_ERROR("failed to '%s' clks for: %s. err=3D%d\n",
>                         enable ? "enable" : "disable",
>                         dp_parser_pm_name(pm_type), rc);
> -                       return rc;
> +               return rc;

Indentation.

>         }
> =20
>         if (pm_type =3D=3D DP_CORE_PM)
