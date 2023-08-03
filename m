Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC0E76F434
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Aug 2023 22:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232187AbjHCUsG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Aug 2023 16:48:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230135AbjHCUsF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Aug 2023 16:48:05 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F181E77
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Aug 2023 13:48:02 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-52256241c50so1776748a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Aug 2023 13:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691095681; x=1691700481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W28liRu/1psuyahcE/4ZyfIZaBTaHuqe1KJO4t7kUeI=;
        b=C22R7kh2bZcj3toYTyhaXd0zpD/59JJ91v1pdUsWlW93dUDAm4iSJ98Uv/8C++7nfZ
         ZbiSQRHVDpWths9AeeIKnHRkAJWtfpFUYFMIJfwJgKRxdl2W4pjLRQOmMwdwzVn4LgHi
         Fg9Oj7rdqUqx1+eyniR/d6CrqSZx+CtKHeixI5GVGhIb5TCDxAAMxab2kUH4AlBhF1Gr
         K7CQ7gFrGw8emM+mp/a06b8R4/Cj11HUTDZjxj00wfki8xKXEuha7Tz1Y42cz1zF/IQg
         JaJwDPBO7jO7OnvWIlkg856pSPp+z8OuUFjpQTpLEag2f+rirZDiytncgZwllH+Gtomi
         QcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691095681; x=1691700481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W28liRu/1psuyahcE/4ZyfIZaBTaHuqe1KJO4t7kUeI=;
        b=VQ/TVko2Yv5X10roK7DIgBJgnjVkXS5pFHEUbnt4n9ZukHO17hMMQm1Tg6vb1pCFrU
         IcAh0N17kk2rMo4ccP3I70Pko0xAxyDG2DDW5yJVd41NfISSxs5gzsJNstzniVZOYZj9
         scGEHPJoWWVVc6QEX7tDvgTlPix5P+KpuDgZQBMwaa9RFtENgiaika+YWPMy8K05+Zsk
         qiC6y6Doe0x8XvAw1CngWqjQU9nq2ovhuIITyNOHyhK+WW2Bd6/zwe75tlfH0RVo+JQm
         JaAY23zVbLwGS2z5g0igIQJaDksjJTdzbzIabZ8Bf0QkGPU1Z9nTLnFxJ3rHifV2NglW
         sErQ==
X-Gm-Message-State: ABy/qLZmpO0K4+P8fSCWz9h8QzNuBZWzgGFxMdDBvtdpwR8izLyaTlMH
        yVZDPc7WUGgcsSXa34VTq8PDPVyMrzk1KYA7o00=
X-Google-Smtp-Source: APBJJlHRmNNvRuTFG3cokmYgfkojNEJ/k3RR6D8QwrWBrtcXM818y1NHGwObU2zfSiYmbNCbQo5TJZN83QnWNoaV3GQ=
X-Received: by 2002:aa7:c651:0:b0:522:7eaf:c0c0 with SMTP id
 z17-20020aa7c651000000b005227eafc0c0mr8789498edr.16.1691095680678; Thu, 03
 Aug 2023 13:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230803204521.928582-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20230803204521.928582-1-daniel.vetter@ffwll.ch>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 3 Aug 2023 13:47:48 -0700
Message-ID: <CAF6AEGtBB1u8YHj-TOwr8SVcCDqsMb=ZTcJ-yt180tBNfwcm5g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/mdp5: Don't leak some plane state
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dorum@noisolation.com, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 3, 2023 at 1:45=E2=80=AFPM Daniel Vetter <daniel.vetter@ffwll.c=
h> wrote:
>
> Apparently no one noticed that mdp5 plane states leak like a sieve
> ever since we introduced plane_state->commit refcount a few years ago
> in 21a01abbe32a ("drm/atomic: Fix freeing connector/plane state too
> early by tracking commits, v3.")
>
> Fix it by using the right helpers.
>
> Fixes: 21a01abbe32a ("drm/atomic: Fix freeing connector/plane state too e=
arly by tracking commits, v3.")
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Reported-and-tested-by: dorum@noisolation.com
> Cc: dorum@noisolation.com
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm=
/msm/disp/mdp5/mdp5_plane.c
> index bd2c4ac45601..0d5ff03cb091 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> @@ -130,8 +130,7 @@ static void mdp5_plane_destroy_state(struct drm_plane=
 *plane,
>  {
>         struct mdp5_plane_state *pstate =3D to_mdp5_plane_state(state);
>
> -       if (state->fb)
> -               drm_framebuffer_put(state->fb);
> +       __drm_atomic_helper_plane_destroy_state(state);
>
>         kfree(pstate);
>  }
> --
> 2.40.1
>
