Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69AA62A3596
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Nov 2020 21:54:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbgKBUy0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 15:54:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbgKBUxH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 15:53:07 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEE07C061A04
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2020 12:53:06 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id e7so12173106pfn.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2020 12:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=l5vIbL7zQ7n4XZHyhwW01YWfGRyYMBZYUrSZpG6FbLs=;
        b=N0yLEXezBABYB2tPL4AuEEXwYGKOXDecmwzSVE8bnDq1ew8Ubu+drYtDQ/NkpIwcJf
         L3moZQiC5mITS4SqyL/PT6mN0ypSPUqxLBDFRjbu8vIECqjZCFTggm2bmAKVkQOiW7kM
         58q6lALMnQgpix4nh/2pSGxpVTZSZ9/N1Ym6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=l5vIbL7zQ7n4XZHyhwW01YWfGRyYMBZYUrSZpG6FbLs=;
        b=gkf1kuTTmHc92YbMrhG9oxzmaWyEswNQ1AROKp3n2vtjTi/U1e/x/+fFXpBg+uNEFa
         HKSCLCPc8vYzr2kI2PtcZ7oPD/I5dtdzGuz25QqhqyesbbZIire2jgksZgTYrECD6OL1
         uZ8BfDLxWt/+4DdHkulSjIrI20+VuWj6JNiVdI2tQ7u/Oi50wZ753fzL9ewmcY7PTFpX
         epdFyqvvb6jGPWv7ejg6SEmAnQTgm35PdaHpruF9pcos1EVGi5hWJIM1UzWrBsM1+JJK
         8EM2C2oVQNSuLmyGsaC8ptS/DAprU8ZX5dtrxYqVoii39NSBReblbzk7B/FlXJ6zsWSP
         q9ZA==
X-Gm-Message-State: AOAM533kt0HfUrCnHGXIh3Ib/NhdzlIW/Swp6UdwqQ/iu5yOQMKRXAOA
        SqHnw2FbtnVSOJhrK1/NdptDtw==
X-Google-Smtp-Source: ABdhPJw1NO5xOgyXHyhI3oWwQJeO56qgUTuPxt4QU+RDUNnB48VToL/F4DAVmG01MfXtEfgKrDhsEw==
X-Received: by 2002:a17:90a:4742:: with SMTP id y2mr13520pjg.228.1604350386498;
        Mon, 02 Nov 2020 12:53:06 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id y5sm15250451pfq.79.2020.11.02.12.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 12:53:05 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201030232310.11100-1-khsieh@codeaurora.org>
References: <20201030232310.11100-1-khsieh@codeaurora.org>
Subject: Re: [PATCH v2] drm/msm/dp: skip checking LINK_STATUS_UPDATED bit
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org,
        rnayak@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
To:     Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
        sean@poorly.run
Date:   Mon, 02 Nov 2020 12:53:04 -0800
Message-ID: <160435038402.884498.10403326257118588679@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2020-10-30 16:23:10)
> Some dongle will not clear LINK_STATUS_UPDATED bit after
> DPCD read which cause link training failed. This patch

$ git grep 'this patch' -- Documentation/process/submitting-patches.rst

> just read 6 bytes of DPCD link status from sink and return
> without checking LINK_STATUS_UPDATED bit.
> Link rate read back from sink need to be convert into
> really rate by timing 2.7Mb.=20

This last sentence doesn't make sense to me, sorry. What is being said?

> For example 0x0A is equivalent
> to 2.7Gb. This patch also convert link rate correctly to fix
> phy compliance test link rate error.
>=20
> Chanegs in V2:
> -- revise commit text
>=20
> Fixes: fd4a29bed29b (drm/msm/dp: DisplayPort PHY compliance tests fixup)
>=20

Shouldn't be any space here between SoB and Fixes tag.

> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 20 ++++++--------------
>  drivers/gpu/drm/msm/dp/dp_link.c | 24 +++++++++++-------------
>  2 files changed, 17 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp=
_ctrl.c
> index 904698dfc7f7..844ba756a2c6 100644
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

So if this returns the integer 2 it's OK? Shouldn't it return some error
value?

>         }
> =20
> -       return -ETIMEDOUT;
> +       return ret;
>  }
> =20
>  static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp=
_link.c
> index 49d7fad36fc4..64a002d100c7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -943,20 +944,17 @@ static u8 get_link_status(const u8 link_status[DP_L=
INK_STATUS_SIZE], int r)
>   */
>  static int dp_link_process_link_status_update(struct dp_link_private *li=
nk)
>  {
> -       if (!(get_link_status(link->link_status,
> -                               DP_LANE_ALIGN_STATUS_UPDATED) &
> -                               DP_LINK_STATUS_UPDATED) ||
> -                       (drm_dp_clock_recovery_ok(link->link_status,
> -                                       link->dp_link.link_params.num_lan=
es) &&
> -                       drm_dp_channel_eq_ok(link->link_status,
> -                                       link->dp_link.link_params.num_lan=
es)))
> -               return -EINVAL;
> +       bool channel_eq_done =3D drm_dp_channel_eq_ok(link->link_status,
> +                       link->dp_link.link_params.num_lanes);
> +
> +       bool clock_recovery_done =3D drm_dp_clock_recovery_ok(link->link_=
status,
> +                       link->dp_link.link_params.num_lanes);
> =20
>         DRM_DEBUG_DP("channel_eq_done =3D %d, clock_recovery_done =3D %d\=
n",
> -                       drm_dp_clock_recovery_ok(link->link_status,
> -                       link->dp_link.link_params.num_lanes),
> -                       drm_dp_clock_recovery_ok(link->link_status,
> -                       link->dp_link.link_params.num_lanes));
> +                       channel_eq_done, clock_recovery_done);
> +
> +       if (channel_eq_done && clock_recovery_done)
> +               return -EINVAL;
> =20
>         return 0;
>  }
>=20
> base-commit: 03a9adc88c206b3857ce95f4f4d3b185d429fa31

What is this commit?
