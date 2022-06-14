Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D235E54B4DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jun 2022 17:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356843AbiFNPiT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jun 2022 11:38:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236865AbiFNPiS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jun 2022 11:38:18 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF53A31216
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jun 2022 08:38:15 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id el14so6716958qvb.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jun 2022 08:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z2yLINaTzV8fSrfmCIDVzIix1NCFViFEnmZVJZZ6Sa4=;
        b=eL5IL1nulrSQ4Sp0dXS0I23ihVz+S36hijRsX7WL+U/iLrea3l0Nv8O6qZrtfJl9Si
         DHQlBtZH2UGBGVWy7IYYYRi8LnMeZmMmhVqksRKVrvmdx95gukiTPTSWXMLKYhFzWw/8
         SFTfT2ZX615lJasNk/W7iiIB4fQBYZztiKhVWNi0cTbnsefL0S3cwUH0RSHpUqKT4BzZ
         qnjMdpBbHC9/zJsohCvySI41JbFTjZl4pxRSEIfk3PUCycbmEvB2/vbABuRhO6fB1ihm
         y/L3RfL8dLOKAI+6vpfyzsytSUBNRfC06LTi47Ib5GnANNub7EVVbRClXHK4vcZGPWuW
         o/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z2yLINaTzV8fSrfmCIDVzIix1NCFViFEnmZVJZZ6Sa4=;
        b=RsUKMWhK/5hDxA78/2nIRUoSFkObrYrOxW9UXmqyv7BiHAy9qj1wl8iP7g9PHMRvCy
         BV6AKIJ8KGOMkgi4u0u3XBhSH2n9KO0F5k5eZPs53+VZJLEb8tjWP3orad+Kt6H7Y0Fd
         dWWu4y/x6G9/x1dmAUX/WDmgrI2pKwQnMV3PxDJ+mdv2MnyDLNYFvyqw9NJk4VxwnfhP
         I6hzwqCcYThzqv4fJx7vXSk4+2IclylK3obWWoGOhK1/4M50Ro/PxkT8rBuJ43DewaB6
         ay8rlLImGZwNuc6EI9C8CPqH8H/clsqWcUKtWLhbiRm8YY/2SJiJAKGVCCGlV3+fqQCK
         Y75A==
X-Gm-Message-State: AJIora+35e2Gh7ckJm9ys337CVoUwR9F/ex6CmFi810bD7EM++Xc7XKG
        FWYNcYPieOXAECVuyACTf6xf13EQK9rBSCoKRuJ1Usnbj095Dg==
X-Google-Smtp-Source: AGRyM1td/rPSbsDPtwajD50WhjsLg3QFEDBWftZKqAEd+cbeoSRsVxg4lt/ba5CXFnCbN7OomFghAvTe9nTeMMiSBTA=
X-Received: by 2002:ad4:5aa4:0:b0:465:2b11:cfd with SMTP id
 u4-20020ad45aa4000000b004652b110cfdmr4031385qvg.55.1655221094880; Tue, 14 Jun
 2022 08:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220613204910.2651747-1-robdclark@gmail.com>
In-Reply-To: <20220613204910.2651747-1-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 14 Jun 2022 18:38:04 +0300
Message-ID: <CAA8EJpoU8ZqHTTcGWH3=cBRecFTKErjz2paTEjCYt8hTsvpbAQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Make msm_gem_free_object() static
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 13 Jun 2022 at 23:49, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Misc small cleanup I noticed.  Not called from another object file since
> 3c9edd9c85f5 ("drm/msm: Introduce GEM object funcs")
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/msm_gem.c | 2 +-
>  drivers/gpu/drm/msm/msm_gem.h | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 35845e273d81..3ef7ada59392 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -1004,7 +1004,7 @@ void msm_gem_describe_objects(struct list_head *list, struct seq_file *m)
>  #endif
>
>  /* don't call directly!  Use drm_gem_object_put() */
> -void msm_gem_free_object(struct drm_gem_object *obj)
> +static void msm_gem_free_object(struct drm_gem_object *obj)
>  {
>         struct msm_gem_object *msm_obj = to_msm_bo(obj);
>         struct drm_device *dev = obj->dev;
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index 6b7d5bb3b575..d608339c1643 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -175,7 +175,6 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu);
>  void msm_gem_active_put(struct drm_gem_object *obj);
>  int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout);
>  int msm_gem_cpu_fini(struct drm_gem_object *obj);
> -void msm_gem_free_object(struct drm_gem_object *obj);
>  int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
>                 uint32_t size, uint32_t flags, uint32_t *handle, char *name);
>  struct drm_gem_object *msm_gem_new(struct drm_device *dev,
> --
> 2.36.1
>


-- 
With best wishes
Dmitry
