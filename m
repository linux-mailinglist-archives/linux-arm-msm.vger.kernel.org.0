Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44DC22A35E6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Nov 2020 22:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbgKBVT5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 16:19:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbgKBVT5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 16:19:57 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DF7FC0617A6
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2020 13:19:57 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id 133so12262073pfx.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2020 13:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=MmgoczohG/k+ZwjVQUASoG236fzfrYemlbvsaHENUT0=;
        b=YTyfXrFe7avSZYrfT69J72tFfPArIv0rq/MD9TDv0mLzf6VGWkkmFcKLaIhBwmtYUV
         OfI7prs1PEvecIN7s+lp+6dqs88D/AcB5zxmRQbRU5+T7LYqs5YcZXW2j/TeqUUSvLym
         IX+z+LzhG5wJpNoytNzrqunBgNq55+SHD64dA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=MmgoczohG/k+ZwjVQUASoG236fzfrYemlbvsaHENUT0=;
        b=W9Xi/mqrKbykx4qqmhb4/1aHAHUU6gVf9DtaacyQGa5nXo+jAxb71VNTeb2z+jcyud
         fBldontNWlwaCjr0NuatK+e05/q/w19G77wCGb1RpbH9s+vjrauT9Awo3yAlI/U3TRta
         XBSW4d1DZotAjUVZ/hz0NXdToCnrU9dzcLqB1oDDNEVTHjMPCDtR+K1MfzyUghjX6LQ3
         uxGDkBWysH600XQuas1/q2Jco4eZ8PT+rZUFTWyY32T8HMNc8I+OlmqSl6IN3jcv93qu
         X/xtEFz5uky4sK9ZjRLnDmBNwHou69OBKSw4qhM2YpDO21J4z8eQcua8NffbI6jssK7v
         3MFA==
X-Gm-Message-State: AOAM532BOV2whLFMGOyEHg8nCUET1H9JuIiLK3UMANUKOG9meAZ20a9i
        z1oxr9ev48RxnXjKaWxfz4WCNOAP+LJ3IA==
X-Google-Smtp-Source: ABdhPJxfOk0mmqX0RpZ2O0ZHRlCvjeMDUMHlxvxspXmVFF9ZtFhc0xavIb+wi6/woPUaiNH7hebN0g==
X-Received: by 2002:a63:4f5f:: with SMTP id p31mr12022620pgl.158.1604351996950;
        Mon, 02 Nov 2020 13:19:56 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id u124sm15320487pfc.21.2020.11.02.13.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 13:19:56 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201029205509.13192-1-abhinavk@codeaurora.org>
References: <20201029205509.13192-1-abhinavk@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: do not notify audio subsystem if sink doesn't support audio
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, tanmay@codeaurora.org,
        khsieh@codeaurora.org, cychiang@chromium.org
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        dri-devel@lists.freedesktop.org
Date:   Mon, 02 Nov 2020 13:19:54 -0800
Message-ID: <160435199458.884498.6173218904854698184@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Abhinav Kumar (2020-10-29 13:55:09)
> For sinks that do not support audio, there is no need to notify
> audio subsystem of the connection event.
>=20
> This will make sure that audio routes only to the primary display
> when connected to such sinks.
>=20

Does this need a Fixes tag? Or it's just an optimization patch?

> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp=
/dp_display.c
> index 4a5735564be2..d970980b0ca5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -555,8 +555,16 @@ static int dp_connect_pending_timeout(struct dp_disp=
lay_private *dp, u32 data)
>  static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
>                 bool plugged)
>  {
> -       if (dp_display->plugged_cb && dp_display->codec_dev)
> -               dp_display->plugged_cb(dp_display->codec_dev, plugged);
> +       struct dp_display_private *dp;
> +
> +       dp =3D container_of(g_dp_display,

What is g_dp_display? I guess this doesn't compile?

> +                       struct dp_display_private, dp_display);
> +
> +       if (dp_display->plugged_cb && dp_display->codec_dev) {
> +               /* notify audio subsystem only if sink supports audio */
> +               if (dp->audio_supported)

Can we combine this into the above if statement?

> +                       dp_display->plugged_cb(dp_display->codec_dev, plu=
gged);

Then this isn't as nested.

> +       }
>  }
> =20
>  static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
