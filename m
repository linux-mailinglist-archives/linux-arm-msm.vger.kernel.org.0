Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA6EA366289
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Apr 2021 01:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234440AbhDTXj0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Apr 2021 19:39:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234438AbhDTXjZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Apr 2021 19:39:25 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A4B8C061763
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Apr 2021 16:38:53 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id p2so12507912pgh.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Apr 2021 16:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=rUEcOAL+JdYx7iw/rsaYqBg6P/fDtNoMJwsAvdMr4k8=;
        b=ZtpSHHCa3/J8Q01BlM9ud01JiqjG6VpT4jrLH7nfoh0ZpIi8KROK+UzYFdOnAHv64Y
         CPOB9aO3tqTwU+EzkIGARznb+Fck3IRcGC/40Qx1xaqQSg93VSjQwgwG6CVyaSvLvI7Q
         I9dscI7B21TE96Aa8oufyl1VbcaTs4vfL2n5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=rUEcOAL+JdYx7iw/rsaYqBg6P/fDtNoMJwsAvdMr4k8=;
        b=s4lOvJ7StbMa2LA1GB3dZvGJeoJ8NFeGBDeddJvsF0xaIIX+FDJzWgAVLOScIN6ZFJ
         g5ZeXmc6qZYK/3OIhHJu9T9jI0Dlhr6RmrbvyWoyZYIulvmo9DFSWbDg+PBrJneb2o3Z
         Lo21RTAxnWHKylEAN1NeAeX9t09/gOsMBwSr/UOvPMpGGFGzKi3nVsgldx+5ZtNGNavl
         hbZTc5sYWko+zFQbsFSn2BCdmX6C/K39v4DxsgakJB6bWmYPnZ5cJC8fkYZJae01R9Ep
         By41ia9/xEl67DCQr6P4XQf5dtOZt+nqLFBGCfo5gjK6p/zRVoZD1zCksYrr5NwEd+zi
         Lgog==
X-Gm-Message-State: AOAM532w4MMNTbRwM3lcorl3VLnXhIckDKiFoiAlXiHxpqxxm3mqsqZs
        Zs1YBtYoUBL+MFETZPeqi3t6aA==
X-Google-Smtp-Source: ABdhPJwaJs4WZDLFNWzbOxVCZx4k6HAurBhLbnuarykRH3zTa6CzwurH2yeUCrWudlUlo0Eph/iupQ==
X-Received: by 2002:a17:90a:9509:: with SMTP id t9mr7754936pjo.3.1618961932968;
        Tue, 20 Apr 2021 16:38:52 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:bf8b:4b8b:2315:3719])
        by smtp.gmail.com with ESMTPSA id r3sm111567pfl.159.2021.04.20.16.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 16:38:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1618594731-556-1-git-send-email-khsieh@codeaurora.org>
References: <1618594731-556-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [PATCH v3 3/3] drm/msm/dp: check main link status before start aux read
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        khsieh@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
To:     Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
        sean@poorly.run
Date:   Tue, 20 Apr 2021 16:38:50 -0700
Message-ID: <161896193053.46595.7590816467281538002@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-04-16 10:38:51)
> Maybe when the cable is disconnected the DP phy should be shutdown and
> some bit in the phy could effectively "cut off" the aux channel and then
> NAKs would start coming through here in the DP controller I/O register
> space. This patch have DP aux channel read/write to return NAK immediately
> if DP controller connection status is in unplugged state.
>=20
> Changes in V3:
> -- check core_initialized before handle irq_hpd
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c     |  5 +++++
>  drivers/gpu/drm/msm/dp/dp_display.c | 14 ++++++++++----
>  drivers/gpu/drm/msm/dp/dp_link.c    | 20 +++++++++++++++-----
>  3 files changed, 30 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_=
aux.c
> index 7c22bfe..fae3806 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -343,6 +343,11 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp=
_aux,
> =20
>         mutex_lock(&aux->mutex);
> =20
> +       if (!dp_catalog_link_is_connected(aux->catalog)) {
> +               ret =3D -ETIMEDOUT;
> +               goto unlock_exit;
> +       }
> +

This still makes me concerned. Any possibility to not do this and have
the phy cut the connection off and have this transfer timeout
immediately?

>         aux->native =3D msg->request & (DP_AUX_NATIVE_WRITE & DP_AUX_NATI=
VE_READ);
> =20
>         /* Ignore address only message */
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp=
/dp_display.c
> index 1784e11..db3f45e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -571,7 +571,7 @@ static int dp_hpd_plug_handle(struct dp_display_priva=
te *dp, u32 data)
>                 dp->hpd_state =3D ST_DISCONNECTED;
> =20
>                 if (ret =3D=3D -ECONNRESET) { /* cable unplugged */
> -                       dp->core_initialized =3D false;
> +                       DRM_ERROR("dongle unplugged =3D %d\n", ret);

Is this a debug message?

>                 }
> =20
>         } else {
> @@ -711,9 +711,15 @@ static int dp_irq_hpd_handle(struct dp_display_priva=
te *dp, u32 data)
>                 return 0;
>         }
> =20
> -       ret =3D dp_display_usbpd_attention_cb(&dp->pdev->dev);
> -       if (ret =3D=3D -ECONNRESET) { /* cable unplugged */
> -               dp->core_initialized =3D false;
> +       /*
> +        * dp core (ahb/aux clks) must be initialized before
> +        * irq_hpd be handled
> +        */
> +       if (dp->core_initialized) {
> +               ret =3D dp_display_usbpd_attention_cb(&dp->pdev->dev);
> +               if (ret =3D=3D -ECONNRESET) { /* cable unplugged */
> +                       DRM_ERROR("dongle unplugged =3D %d\n", ret);

Another debug message?

> +               }
>         }
> =20
>         mutex_unlock(&dp->event_mutex);
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp=
_link.c
> index be986da..53ecae6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -737,18 +737,25 @@ static int dp_link_parse_sink_count(struct dp_link =
*dp_link)
>         return 0;
>  }
> =20
> -static void dp_link_parse_sink_status_field(struct dp_link_private *link)
> +static int dp_link_parse_sink_status_field(struct dp_link_private *link)
>  {
>         int len =3D 0;
> =20
>         link->prev_sink_count =3D link->dp_link.sink_count;
> -       dp_link_parse_sink_count(&link->dp_link);
> +       len =3D dp_link_parse_sink_count(&link->dp_link);
> +       if (len < 0) {
> +               DRM_ERROR("DP parse sink count failed\n");
> +               return len;
> +       }
> =20
>         len =3D drm_dp_dpcd_read_link_status(link->aux,
>                 link->link_status);
> -       if (len < DP_LINK_STATUS_SIZE)
> +       if (len < DP_LINK_STATUS_SIZE) {
>                 DRM_ERROR("DP link status read failed\n");
> -       dp_link_parse_request(link);
> +               return len;
> +       }
> +
> +       return dp_link_parse_request(link);
>  }
> =20
>  /**
> @@ -1032,7 +1039,10 @@ int dp_link_process_request(struct dp_link *dp_lin=
k)
> =20
>         dp_link_reset_data(link);
> =20
> -       dp_link_parse_sink_status_field(link);
> +       ret =3D dp_link_parse_sink_status_field(link);
> +       if (ret) {
> +               return ret;
> +       }
> =20
>         if (link->request.test_requested =3D=3D DP_TEST_LINK_EDID_READ) {
>                 dp_link->sink_request |=3D DP_TEST_LINK_EDID_READ;
> --=20

Can you split this part off into another patch? It seems to stand on its
own as it makes the code more robust to transfer errors in the sink
parsing code.
