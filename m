Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C72EA522313
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 May 2022 19:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343597AbiEJRuD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 May 2022 13:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348389AbiEJRuB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 May 2022 13:50:01 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F69524948
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 May 2022 10:46:03 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id g28so32043993ybj.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 May 2022 10:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=USKL8Y19KqC+rb8HxxibZ/ziwBl0bjEQ9bCbRDbs4dY=;
        b=Na6mrteQccHCP7U30nd7OtddNhTuGW0K47wW1pKjMGoecxxqIzG44JSq2j5t4OsRTN
         9gzGvVxFHArI4Bf3+xa6A81h/WJOXt/sLBa6eWnbgJS5qcDJUrB7yRUmcEYXm4LBXBs6
         WhC1cBxlIsZ9Txh8uVegN+fd4LgdxrfqhZQ45tgFiHOkWwUBI6IiBqCo4DhePU3cTgMC
         QhM8CWzfrly2xXw9mKc0hJsG5YuziBwShFkv0+M3EZz7PCV2HK8dSGmAP0SZbn1cNTEb
         oR8h6JCwGeyhSsbu4q+SZ6TYNQdRid09212wts6XVO6vgtcFBW7dYoSwMEV9yXeO7wE6
         60vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=USKL8Y19KqC+rb8HxxibZ/ziwBl0bjEQ9bCbRDbs4dY=;
        b=DAYETrA6j7nKuUDT6wInUcdys0zXgYTyfu/oSO+Pknd6TqKOLTYHPgk4/UkxKUvUAx
         n1d3Xz1Ey6EksyvzIq9CLq/Iy16qJy2V0aukIaGEZ0hPhf+LrlnyTCPEhn+ZNBbPpyqb
         fDTe8bv09Y7aybaf0GhqjCxavnZUchO3Pc9FjiTtoV65V3CeA7TgWA2zaU7yL3MVhD7e
         XgU+EmIxcPZYblSIVeCVvPvRYJ2JpckBmK0NYkGszUXoLiqE+qF3QYHp/EI3rsYBCt0y
         SpHjkjUK+Hv6kD2hzJ4+Q81f0/ZwmE0cZb9hieu1iOo37MVdvLaahadsqUp0pPZC4FUb
         1mfw==
X-Gm-Message-State: AOAM531+HPqP9TyQgXW73Gem9vGCD6jqjM3VGoFdy1m1tfTHz59CVF6m
        xfi061X/oUIRBggRBpwl2ArnyypAI5Eb6yXE2lLzDg==
X-Google-Smtp-Source: ABdhPJxSrH6rUPLDlUdWCz3K2tIpkc7vtxnvQU1l092FHrC6aIIK41/xPVl/NXH/I/PIq3Snct+s+fgKx3qBZxqVW3g=
X-Received: by 2002:a25:b4d:0:b0:64b:11cb:2e43 with SMTP id
 74-20020a250b4d000000b0064b11cb2e43mr4127229ybl.175.1652204762789; Tue, 10
 May 2022 10:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220510165216.3577068-1-robdclark@gmail.com>
In-Reply-To: <20220510165216.3577068-1-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 10 May 2022 20:45:51 +0300
Message-ID: <CAA8EJprS_Jk_Wowz-nK1nnYF1UUb-4SYUPhsF_qB4rL4GUPygA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix fb plane offset calculation
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 10 May 2022 at 19:52, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> The offset got dropped by accident.
>
> Fixes: d413e6f97134 ("drm/msm: Drop msm_gem_iova()")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/msm_fb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
> index 362775ae50af..4269da268a4a 100644
> --- a/drivers/gpu/drm/msm/msm_fb.c
> +++ b/drivers/gpu/drm/msm/msm_fb.c
> @@ -118,7 +118,7 @@ uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb,
>                 struct msm_gem_address_space *aspace, int plane)
>  {
>         struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
> -       return msm_fb->iova[plane];
> +       return msm_fb->iova[plane] + fb->offsets[plane];

Nit: can we push fb->offsets handling into msm_framebuffer_prepare()
instead? Then the msm_framebuffer_iova() would become trivial?

>  }
>
>  struct drm_gem_object *msm_framebuffer_bo(struct drm_framebuffer *fb, int plane)
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
