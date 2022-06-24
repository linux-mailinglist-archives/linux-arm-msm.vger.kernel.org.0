Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA6A55A525
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jun 2022 01:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbiFXX4r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 19:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231843AbiFXX4r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 19:56:47 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ABC28AC3A
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 16:56:46 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id t16so6891011qvh.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 16:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bDqcC2b/5E2itIbFrgVYQxn7bAcfIKhqscuNTJZx+CA=;
        b=a9mE97C3QaiYWUG64qjCNkOPtCdN8jzRl8JZKYxOyZz0b9y7+MwI4XGSm8ixBsGDby
         Zm7jjSZvM2QrhKZq92yMle23dgXLeYmtjTrwEJ+waWnXxfw2gkQ0GyQ7p7euwPtI+IKn
         XZsNd51AbT/HULq4mYTapVRZUjcKTTFDcCXmtsI2xI2kkjsLPLwTvukcyXptdqAYNAQ6
         8c8OmPSWTJkyHqxxSzHjmSmIi9BHTabogvlsKcvSYAUCGgIy+pkkHGUd3kcCnOXZFrYM
         UhU0vJ22TWqt/iMR41h20ztEia6xsn7CsGS5DJUKuxZPAaxn0lQIDEsD9dZw8maW//aG
         Rh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bDqcC2b/5E2itIbFrgVYQxn7bAcfIKhqscuNTJZx+CA=;
        b=txPiB2Fc77c6HzcMhSsA0IxDbP3iUUXTl2+DLyJnLWwrj1nPJx0E6G21gOmQVL8W1R
         NFoMrVVHs4yJNGFFjNA0qv0tWEeh2zxglzaHEE5mVcqxouiiljH7PO91L6kNfTn5QfDG
         F7XAMuwJQ6Jp7PM4RmtJqfiz4p4wx0KFK3IjLG2y4AthP8ydG5HzcDVspTLZCZJRmAUK
         1iEKd1JqP8xEKP2DMPxB31rcDnlB3Hh8gjUooSGgmWO/JHeYh2LPnJDtD3UHPVbXk/Cn
         +Z9VRaMBHuB/R8UFbl1w8DUG3z7GFi06Yhx3v+8M/PpNH79S8EpHICNyoD8IL0ggPaDt
         22Sg==
X-Gm-Message-State: AJIora9iGoQ26y86qY6x3ajTyq0aW1QyzgQBYJkydCcy4ovvrqudP8fR
        yESrjWrTvyKMBUipekWLIh5fU+WmtQ8+Q+wgeO2icQ==
X-Google-Smtp-Source: AGRyM1tBPqtZTmiqo/rFRTDaEkcl5dCeMpdanVuGujU7QBwRNzyiHPfJ4k4LbCShiUJN+35Huj4wIXG1XxVN+LcSKn8=
X-Received: by 2002:a05:622a:34a:b0:304:f25a:ecf0 with SMTP id
 r10-20020a05622a034a00b00304f25aecf0mr1448087qtw.62.1656115005671; Fri, 24
 Jun 2022 16:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com> <1656090912-18074-4-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1656090912-18074-4-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 25 Jun 2022 02:56:34 +0300
Message-ID: <CAA8EJpoppiw=vxkw9vvsn0mYmgYjU-WCd3w_pRyd-7PNneRv1A@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] drm/msm/dp: place edp at head of drm bridge chain
 to fix screen corruption
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, bjorn.andersson@linaro.org,
        quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 24 Jun 2022 at 20:15, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> The msm_dp_modeset_init() is used to attach DP driver to drm bridge chain.
> msm_dp_modeset_init() is executed in the order of index (dp->id) of DP
> descriptor table.
>
> Currently, DP is placed at first entry (dp->id = 0) of descriptor table
> and eDP is placed at secondary entry (dp->id = 1 ) of descriptor table.
> This means DP will be placed at head of bridge chain and eDP will be
> placed right after DP at bridge chain.

No, the dp->ids do not have anything to do with the bridge chains.

> Drm screen update is happen sequentially in the order from head to tail
> of bridge chain. Therefore external DP display will have screen updated
> happen before primary eDP display if external DP display presented.
> This is wrong screen update order and cause one frame time screen
> corruption happen at primary display during external DP plugged in.
>
> This patch place eDP at first entry (dp->id = 0) of descriptor table and
> place DP at secondary entry (dp->id = 1) to have primary eDP locate at
> head of bridge chain. This correct screen update order and eliminated
> the one frame time screen corruption happen d at primary display.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index a87a9d8..2755ff3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -143,10 +143,10 @@ static const struct msm_dp_config sc7180_dp_cfg = {
>
>  static const struct msm_dp_config sc7280_dp_cfg = {
>         .descs = (const struct msm_dp_desc[]) {
> -               { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort,
> -               .controller_id = MSM_DP_CONTROLLER_0, .wide_bus_en = true },
>                 { .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP,
>                 .controller_id = MSM_DP_CONTROLLER_1, .wide_bus_en = true },
> +               { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort,
> +               .controller_id = MSM_DP_CONTROLLER_0, .wide_bus_en = true },

If the correctness of DP display depends on the order of entries in
the dp_desc table, something is terribly wrong in the driver. Please
fix that rather than working around it by shuffling the entries in the
array.

>         },
>         .num_descs = 2,
>  };
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
With best wishes
Dmitry
