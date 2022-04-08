Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C34924F958F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Apr 2022 14:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235540AbiDHMX4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Apr 2022 08:23:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235463AbiDHMX4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Apr 2022 08:23:56 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 233B833D81C
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Apr 2022 05:21:53 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id z15so1251135qtj.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Apr 2022 05:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+/BWz3Pk8r30Gfc4qGV4ZOyYfEY0sq1wDYCw1e9kQ38=;
        b=K+SFu/xAxfSv8ptmfSt0vivA6W2FAX95a45VvUQlpVTHnKOdxmllKplZItjMf+HOQC
         9DYIktpng9TB25OnHxCrL64xd6fagaJZqoStF5Wx0Hy3ikDlXsYpsImSLq3jJX7NTozr
         jtJAtIG8hw7MQ1aH37SBKuyIZgS9cGBl6TipnChp/SytE1xsSgwhG4Uzcr65ZrCPcP+H
         sAhYViuQqi8e3dsmU1FBooELOGstjUC1c8KwpSr76ErlET7J3vbBGnI1/nfA4XuHLqHU
         HNG9mVm9fFu/DvOkx0m06XL6cqKui8Sturp1GWXhuphbUv9x0d4AJRfHRzn1njbuw5PG
         NScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+/BWz3Pk8r30Gfc4qGV4ZOyYfEY0sq1wDYCw1e9kQ38=;
        b=XUv1h/yc8408O3w781DCq4HMdxqyZU5BIyFr67peJwsAqcarDuBrN2FnF1pytHwx+N
         tsQiTJbAx0wj2Wuz6Pljbu3GL4fuYL8iLARRPbOJU8sLu9m7x1LYJhIeSJslES6VguNY
         39ATDXmve9oT4kkIB7xpYNP/4lhzOnBEuPKxv4d7NBIjSSHeG0KZPtrOjDYrflwSnsmQ
         5VsD8LSEmwkXMFTpFPFRG5K6HGMNCY2/Lf1LW+8QIITvsLcjgey4dsvIDm74QkDaX5hD
         QV4BsdBMWB3wgh8StjaENrGKYTmzxYEwX9A4KYGtttevcIqFjY2Nt/Fzn/N2T8kvIx2W
         Zusg==
X-Gm-Message-State: AOAM531nu7TQee5aVD4ma/Umry1QkOk7dHK1nD8CcK5pENNWIhL07e1I
        RrLTNPa7qMcGgB/YPmQLoUE7jkVy/BsLt/fp42+R6Q==
X-Google-Smtp-Source: ABdhPJwFncjOacPlNFbEfJskgVWNz1y73VUg9c9DTYFByySPmUZZzySIYxy5P7V4YxD2DiJx66tjsu6VB/xf/JxBQmg=
X-Received: by 2002:ac8:7dd1:0:b0:2e0:6fe1:189b with SMTP id
 c17-20020ac87dd1000000b002e06fe1189bmr16058848qte.629.1649420512329; Fri, 08
 Apr 2022 05:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_8E2A1C78140EE1784AB2FF4B2088CC0AB908@qq.com>
In-Reply-To: <tencent_8E2A1C78140EE1784AB2FF4B2088CC0AB908@qq.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 8 Apr 2022 15:21:42 +0300
Message-ID: <CAA8EJprFBJeQQo79LOdJR0pA75wbzM64KRnPLHqLOGJ2KpJkEg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/mdp5: check the return of kzalloc()
To:     xkernel.wang@foxmail.com
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        airlied@linux.ie, daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 7 Apr 2022 at 05:33, <xkernel.wang@foxmail.com> wrote:
>
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
>
> kzalloc() is a memory allocation function which can return NULL when
> some internal memory errors happen. So it is better to check it to
> prevent potential wrong memory access.
>
> Besides, since mdp5_plane_reset() is void type, so we should better
> set `plane-state` to NULL after releasing it.
>
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> ChangeLog:
> v1->v2 simplify the patch and update the description.
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> index c6b69af..50e8542 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> @@ -90,7 +90,10 @@ static void mdp5_plane_reset(struct drm_plane *plane)
>                 __drm_atomic_helper_plane_destroy_state(plane->state);
>
>         kfree(to_mdp5_plane_state(plane->state));
> +       plane->state = NULL;
>         mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
> +       if (!mdp5_state)
> +               return;
>
>         if (plane->type == DRM_PLANE_TYPE_PRIMARY)
>                 mdp5_state->base.zpos = STAGE_BASE;
> --



-- 
With best wishes
Dmitry
