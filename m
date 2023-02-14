Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B16E696BCF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 18:35:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbjBNRfQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 12:35:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231575AbjBNRfP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 12:35:15 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A75B7EE9
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 09:34:48 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id n25-20020a9d7119000000b0068bd8c1e836so4866437otj.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 09:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=quw4WERq0qtsQq8yz2KJlgOpPpt3pCQr7AJgZ9gs9bs=;
        b=bAXZ/atYkTz7tSYeqI6xy/QoS/duSLwMmMA9ve5lqoV/KKLzbv7kN44Pmy1DN/RO91
         t3qr5gD+5mh/aKbciaun41iUX1V27VRbm8ntkE5vcZvYVC4gfQzOK/pwwwvQink2b54m
         aLEoX/Ns6L1r5Yb8YDmVrZ4vrwqOK5ElVtYDE9S0yt3eIq3Jt4a8Voftn/T1F2GjEDm7
         yu1jYTGkRLIwK6kTBVnf7OBugIQrgf40cFAe0cWfovvM0OahMWgdlt+r35JCaIQTv/JP
         KN+JyAafeUJJhi6D6yA1omEvTNl6CX+bAUQ5ZSLbPKlHo77RmexBC9sGLLw72MLiCdVD
         MctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=quw4WERq0qtsQq8yz2KJlgOpPpt3pCQr7AJgZ9gs9bs=;
        b=mK8eaU0ObA2xLMhUIdycmoM3iGptOfqavoWMblGyqnQobL/+Twm4weOCxcC0qCRL0+
         vtC2XW1tTPWzZ1Xif2CasLlyWkP9yq7mXwW+Uf6n3SWJHHUs8MCLLct/eXfeqj3HXV7G
         SeLQMym+XcCOXaIMq6vugr+kpQZTrdTZ64dKtAWgqoYwibbkgUDt5h6Q8pa1DevMLwdN
         sQZ6o+xWq+K/hE8P3foFfKM2UhSXkWaBtCRFvnr1e4WL57OlH9b9eEJ4vDmZs+FoKFlU
         o/5WtuJ0PfZsWw4hDx06L/3hP0+qrCyhRKxlaCm08XNS/jCfr2lC2YToQ1wgPDgKQyzw
         E68g==
X-Gm-Message-State: AO0yUKWJ8Udk/scf4Sygrsa7D23zi37YHnMv8oNfnmuQzBDbxjByj93Y
        k41egJ/hCzyI3EnFShFAPOiuWdD7kLQrQXL0t1w=
X-Google-Smtp-Source: AK7set+vDYIH90pdNzC/mL976gQIxoSspEFrcyzWfPMG3tzTnF1uXRIxi7C3oM70Jt3grRiebofLGoAPVamFDDOqh+c=
X-Received: by 2002:a9d:6f83:0:b0:66c:5685:5415 with SMTP id
 h3-20020a9d6f83000000b0066c56855415mr146769otq.125.1676396087727; Tue, 14 Feb
 2023 09:34:47 -0800 (PST)
MIME-Version: 1.0
References: <20230214020956.164473-1-dmitry.baryshkov@linaro.org> <20230214020956.164473-5-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230214020956.164473-5-dmitry.baryshkov@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 14 Feb 2023 09:35:02 -0800
Message-ID: <CAF6AEGvW5qJ1q83a7Ny-BMq9BOt88h9+Kfs6DGEBPnO+1iQazA@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/msm/a5xx: fix context faults during ring switch
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Jami Kettunen <jami.kettunen@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 13, 2023 at 6:10 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The rptr_addr is set in the preempt_init_ring(), which is called from
> a5xx_gpu_init(). It uses shadowptr() to set the address, however the
> shadow_iova is not yet initialized at that time. Move the rptr_addr
> setting to the a5xx_preempt_hw_init() which is called after setting the
> shadow_iova, getting the correct value for the address.
>
> Fixes: 8907afb476ac ("drm/msm: Allow a5xx to mark the RPTR shadow as privileged")

Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/7555

> Suggested-by: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> index 7e0affd60993..f58dd564d122 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> @@ -207,6 +207,7 @@ void a5xx_preempt_hw_init(struct msm_gpu *gpu)
>                 a5xx_gpu->preempt[i]->wptr = 0;
>                 a5xx_gpu->preempt[i]->rptr = 0;
>                 a5xx_gpu->preempt[i]->rbase = gpu->rb[i]->iova;
> +               a5xx_gpu->preempt[i]->rptr_addr = shadowptr(a5xx_gpu, gpu->rb[i]);
>         }
>
>         /* Write a 0 to signal that we aren't switching pagetables */
> @@ -257,7 +258,6 @@ static int preempt_init_ring(struct a5xx_gpu *a5xx_gpu,
>         ptr->data = 0;
>         ptr->cntl = MSM_GPU_RB_CNTL_DEFAULT | AXXX_CP_RB_CNTL_NO_UPDATE;
>
> -       ptr->rptr_addr = shadowptr(a5xx_gpu, ring);
>         ptr->counter = counters_iova;
>
>         return 0;
> --
> 2.30.2
>
