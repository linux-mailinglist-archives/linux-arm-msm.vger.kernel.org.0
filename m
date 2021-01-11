Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0805C2F201C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jan 2021 20:55:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391318AbhAKTyp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jan 2021 14:54:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391077AbhAKTyo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jan 2021 14:54:44 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CF09C0617A2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jan 2021 11:54:04 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id n7so368094pgg.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jan 2021 11:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=Vxk2nV7tt4HCztmmcM/p9PpvV3AZqTIQaGCtnRxgY5o=;
        b=PYTOCCGpovAEIhp6SDc7oo7y6LDK0BrdmH5Bo6LK5wdMJMxJPgEfd+o4Ygb8Zm1W6N
         WT12d307T0ug2fNJrkoAHMKl/62zRSABiCuI41DTLqQTmWvAKerQmPYf8hZZ6PZ4IkQg
         8XXC0t3qPdfh8ztVgYLAPMtyOlQzV4bAnFIN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=Vxk2nV7tt4HCztmmcM/p9PpvV3AZqTIQaGCtnRxgY5o=;
        b=tmfo5kgG24LryMgYkTC1ss2W6Tq/Y1chqrwEYJlDElE1GvE7AhIQytlYld+iwF/Fyj
         w5Yr0glyV5Zq/qqkPADlpGBspxG2WvpN4KCh0ZaCRDOlzv213vw3iSD/7bDt47inuFdk
         IPwT2eLMaCodmD1C3++HJx3GRV4ygfhLF1XQNveYPK2i3kuI0kdJpfjqUHTkr9ShsvuL
         oDCXbOPKsJWcv2T30wECrq9xYEBAQI7UGwsrWeGrt7XgD7g92jqMxv4mydHZzIFH3yLX
         sh/T0W9EQ8S5NfepdTamia6hbxjBLj3mUzttkPmm5KhpIE5D+2rmAZ+XFtF/CflRA+DR
         SVfQ==
X-Gm-Message-State: AOAM530z0TfUPLHQa4FwN5wJjL6X6QnBtOzzMH4Fa03D5O3XOD2Fk4lP
        q1GHDUgupMHzkxHhz54EpH4JGQ==
X-Google-Smtp-Source: ABdhPJxKRGtGDIO3VfXdh7jxqm6nRjvFkD4HG/tJC8VlSrZjMO2GjMyC/nt1FZND08abv6HToCiIrg==
X-Received: by 2002:a65:494f:: with SMTP id q15mr1092942pgs.367.1610394844028;
        Mon, 11 Jan 2021 11:54:04 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id 5sm419116pff.125.2021.01.11.11.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 11:54:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1610051425-20632-3-git-send-email-khsieh@codeaurora.org>
References: <y> <1610051425-20632-1-git-send-email-khsieh@codeaurora.org> <1610051425-20632-3-git-send-email-khsieh@codeaurora.org>
Subject: Re: [PATCH 2/2] drm/msm/dp: unplug interrupt missed after irq_hpd handler
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
To:     Kuogee Hsieh <khsieh@codeaurora.org>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run
Date:   Mon, 11 Jan 2021 11:54:01 -0800
Message-ID: <161039484176.3661239.14240346276437866761@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-01-07 12:30:25)
> There is HPD unplug interrupts missed at scenario of an irq_hpd
> followed by unplug interrupts with around 10 ms in between.
> Since both AUX_SW_RESET and DP_SW_RESET clear pending HPD interrupts,
> irq_hpd handler should not issues either aux or sw reset to avoid
> following unplug interrupt be cleared accidentally.

So the problem is that we're resetting the DP aux phy in the middle of
the HPD state machine transitioning states?

>=20
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp=
/dp_catalog.c
> index 44f0c57..9c0ce98 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -190,6 +190,18 @@ int dp_catalog_aux_clear_hw_interrupts(struct dp_cat=
alog *dp_catalog)
>         return 0;
>  }
> =20
> +/**
> + * dp_catalog_aux_reset() - reset AUX controller
> + *
> + * @aux: DP catalog structure
> + *
> + * return: void
> + *
> + * This function reset AUX controller
> + *
> + * NOTE: reset AUX controller will also clear any pending HPD related in=
terrupts
> + *=20
> + */
>  void dp_catalog_aux_reset(struct dp_catalog *dp_catalog)
>  {
>         u32 aux_ctrl;
> @@ -483,6 +495,18 @@ int dp_catalog_ctrl_set_pattern(struct dp_catalog *d=
p_catalog,
>         return 0;
>  }
> =20
> +/**
> + * dp_catalog_ctrl_reset() - reset DP controller
> + *
> + * @aux: DP catalog structure

It's called dp_catalog though.

> + *
> + * return: void
> + *
> + * This function reset DP controller

resets the

> + *
> + * NOTE: reset DP controller will also clear any pending HPD related int=
errupts
> + *=20
> + */
>  void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog)
>  {
>         u32 sw_reset;
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp=
_ctrl.c
> index e3462f5..f96c415 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1296,7 +1296,8 @@ static int dp_ctrl_setup_main_link(struct dp_ctrl_p=
rivate *ctrl,
>          * transitioned to PUSH_IDLE. In order to start transmitting
>          * a link training pattern, we have to first do soft reset.
>          */
> -       dp_catalog_ctrl_reset(ctrl->catalog);
> +       if (*training_step !=3D DP_TRAINING_NONE)

Can we check for the positive value instead? i.e.
DP_TRAINING_1/DP_TRAINING_2

> +               dp_catalog_ctrl_reset(ctrl->catalog);
> =20
>         ret =3D dp_ctrl_link_train(ctrl, cr, training_step);
>
