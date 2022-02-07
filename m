Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ADDB4AC999
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Feb 2022 20:34:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232728AbiBGTbs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Feb 2022 14:31:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239990AbiBGT1g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Feb 2022 14:27:36 -0500
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F4203C0401DA
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Feb 2022 11:27:35 -0800 (PST)
Received: by mail-qv1-xf36.google.com with SMTP id p7so2877924qvk.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Feb 2022 11:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hm57uy/Nd677bwlIul9LMmgkSXxusznQLNZIk/zF7mk=;
        b=Z8P8BogEuGYrnQOsoaZo4FqgmKwU03E+LSzGVgvZsuwmIyb1YH+mOPncQpb3blKUe1
         49RwxUTTFVJo0yuIMg/Ff1ptJq36fP9L/y6CqnF6CBtJcTvxfeg1ubcKT4W3n0uJqrma
         IEiQCNi1EyxjkPRyxIQnI5IsV4/Nd2eCj7FI2bDfqa5LrPnXMKpFVI/IlDpMVukkOW5O
         Srt15QSykptppwxuXGyZ3jBhFQs5Ihe5DgRuQRG8MTqs5IB8LqYc6+OpP5x6ej9c7Azq
         HZMrwp3JP4c9F6CH+K3aevsTagwybc7h5z+xm/rT4/B+Z91JxflKgDnjbUFw8+5RZYYl
         Tx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hm57uy/Nd677bwlIul9LMmgkSXxusznQLNZIk/zF7mk=;
        b=Y/E6dFjjI7y0oPrCrLVjiMkwsIBzqeva4ZI1lO0veZsYVKa0KKCcASZdtHRhDt30zY
         pixqHxY+guEbINx3s8y8iav+W/gF4JV80ydSXcSMKIQnWaKhC6/OF4KOIYjhtaHoRp2+
         gYY+BNQ/gOQ03fOBN39WYxSGq85w6Nz+iu7ky4ey4gKuchU01n0J1lvMxBsWr3xfRQet
         QH6qIAaFSL8SiEmRx7Ki3H2zGwh5uyIplVdN7AgQgZUfOo+GUF39bK5LAyd/7t0IlH0R
         clOe0wiP+cBLgYPSewfCUDbUQLGkO4IQoJFGjEAzP5z3lxX9hyg66vk0+CV0oi+9zG+G
         fQ5Q==
X-Gm-Message-State: AOAM531FwqQ11tqM+kK6628HoUUtgzbDUH+1BSDQ1pqP+A9RaKUEcmVf
        /sgs/PU3U9r/wEwFapQArBMzfUITc3aJeBwotQVH0Q==
X-Google-Smtp-Source: ABdhPJw2jSbMKuGGtQ/seo/5L11q90dX9vNtXHOrb1VOFzLLm2Y/rcbvKe0P0chACfB+SmYR9F3t5NoLBi8xnBja5os=
X-Received: by 2002:a05:6214:2aa2:: with SMTP id js2mr828371qvb.55.1644262055133;
 Mon, 07 Feb 2022 11:27:35 -0800 (PST)
MIME-Version: 1.0
References: <20220207163515.1038648-1-maxime@cerno.tech> <20220207163515.1038648-5-maxime@cerno.tech>
In-Reply-To: <20220207163515.1038648-5-maxime@cerno.tech>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 7 Feb 2022 22:27:24 +0300
Message-ID: <CAA8EJpr-dx5So=w+NvdtSeB4KBVMySc+KT54bMX9p_0ZV52jAg@mail.gmail.com>
Subject: Re: [PATCH 04/23] drm/msm/mdp5: Fix zpos initial value mismatch
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
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

On Mon, 7 Feb 2022 at 19:56, Maxime Ripard <maxime@cerno.tech> wrote:
>
> While the mdp5_plane_install_properties() function calls
> drm_plane_create_zpos_property() with an initial value of 1,
> mdp5_plane_reset() will force it to another value depending on the plane
> type.
>
> Fix the discrepancy by setting the initial zpos value to the same value
> in the drm_plane_create_zpos_property() call.

Could you please squash two msm/mdp5 patches into a single patch,
making it clear that the code is moved.

Also please add:
Fixes: 7d36db0be3b9 ("drm/msm/mdp5: switch to standard zpos property")

With that in place:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> index c6b69afcbac8..d60982f4bd11 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> @@ -48,6 +48,8 @@ static void mdp5_plane_destroy(struct drm_plane *plane)
>  static void mdp5_plane_install_properties(struct drm_plane *plane,
>                 struct drm_mode_object *obj)
>  {
> +       unsigned int zpos;
> +
>         drm_plane_create_rotation_property(plane,
>                                            DRM_MODE_ROTATE_0,
>                                            DRM_MODE_ROTATE_0 |
> @@ -59,7 +61,12 @@ static void mdp5_plane_install_properties(struct drm_plane *plane,
>                         BIT(DRM_MODE_BLEND_PIXEL_NONE) |
>                         BIT(DRM_MODE_BLEND_PREMULTI) |
>                         BIT(DRM_MODE_BLEND_COVERAGE));
> -       drm_plane_create_zpos_property(plane, 1, 1, 255);
> +
> +       if (plane->type == DRM_PLANE_TYPE_PRIMARY)
> +               zpos = STAGE_BASE;
> +       else
> +               zpos = STAGE0 + drm_plane_index(plane);
> +       drm_plane_create_zpos_property(plane, zpos, 1, 255);
>  }
>
>  static void
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
