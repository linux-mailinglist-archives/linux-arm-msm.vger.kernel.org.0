Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 420EB6F4BA4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 22:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbjEBUyZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 16:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjEBUyZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 16:54:25 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B541734
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 13:54:23 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-b9a824c3a95so6171161276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 13:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683060863; x=1685652863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qKj2wzaGtI84pEmGbP8x31LUD/+KSxviLtyuERFjO4M=;
        b=O8tzjbmaHbS+rS2qaBvKxDBXsWjig0r/01rltb/PK9Zd46YYgMbGLrNsaKrwAG5z7j
         eaUryrqfwdnUUsn1PuSOkXgmaEG1dDYUZKnEJRZK1awWr5U87bTwNz6XCXeFKqclkxY+
         G5TPfVA0PJZV4fxaqq703RRcnw3tIzY5b4eR9jt+FqEsSsUxWu68EjfH8XOl3J9gDjJE
         UuFEzjBOIFZRktkuFpMIar/ECD52GBXqSOyB0wZzOUWvXNSi3GVPbyy0SB9wLNsu2KMn
         Z+ua7sve7HL8HII2QIQju5OZu03LgbVayfgsXZjyAUIPLr478VfDEs77nIPHFP4pQ0lo
         pj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683060863; x=1685652863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qKj2wzaGtI84pEmGbP8x31LUD/+KSxviLtyuERFjO4M=;
        b=HKRdu9VcGfs7565opBPpczzQ5oueFZ7utL+NN5MrtW61VtnKtWBE776DMeYoS0cwKp
         d+rSq+9IIQK9xTO1OcKSgE5ZlD4HmQENjExOrYlArNltV47XY0tSuBGGh78G0dELqpnS
         p1nAW8J/LkHf2P4eEsK/JRBATBC8719JDJBIYphsQa3YsmDXZiN9X/q8YkL913rW/m+K
         yLYgPSjSw0leU6KDnwM6AAfbfioQwXWVaMSQ28L54yjdGakQ+ACr9NXggQKkMBepKhdy
         V2tO6OKvSWiwYjsosDAzwHxPUBF19tnHPube4DFZlYS2foaEvB7B9cEwvG2Xz3t2qsMI
         FgmQ==
X-Gm-Message-State: AC+VfDzWQsF2bmOohzEpyb5OsbTjncnfuVIxUSfhvx4iSqCVvA6LAV3T
        RsoTrOPHynPvCbc461daKyP9wZvc6gmlwvRr7JNbwg==
X-Google-Smtp-Source: ACHHUZ5V+SuJGVlvrn7iDJQE546Nk7u86in4Hl4fEzLfZZpN2U1HP8S4Nj/9qWKGFg9w0ovBejoWJFHiJ9U1aPGsNUo=
X-Received: by 2002:a25:ad53:0:b0:b9f:2fc8:d3a7 with SMTP id
 l19-20020a25ad53000000b00b9f2fc8d3a7mr844910ybe.63.1683060863068; Tue, 02 May
 2023 13:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
 <20230430235732.3341119-3-dmitry.baryshkov@linaro.org> <81d97939-1369-9a2d-01bb-ad8c8a4b7e5c@quicinc.com>
In-Reply-To: <81d97939-1369-9a2d-01bb-ad8c8a4b7e5c@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 2 May 2023 23:54:11 +0300
Message-ID: <CAA8EJprD6biRhcx5pAJvb4Jfz_L-88_=zeySReN2Y5Nrtq+_Lw@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/msm/dpu: drop dpu_encoder_early_unregister
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
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

On Tue, 2 May 2023 at 23:45, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 4/30/2023 4:57 PM, Dmitry Baryshkov wrote:
> > There is no need to clean up debugfs manually, it will be done by the
> > DRM core on device deregistration.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> There are two reasons to have the debugfs removed in the early_unregister:
>
> 1) Today, registration happens in late_register(), hence to balance the
> the call in _dpu_encoder_init_debugfs(), this one is present.
>
> 2) In drm_modeset_register_all(), if drm_connector_register_all() fails,
> it calls drm_encoder_unregister_all() first which calls early_unregister().
>
> So to balance these out, dont we need to keep it?

Please correct me if I'm wrong, drm_debugfs_cleanup() should take care of that.

> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 8 --------
> >   1 file changed, 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 32785cb1b079..8c45c949ec39 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -2154,13 +2154,6 @@ static int dpu_encoder_late_register(struct drm_encoder *encoder)
> >       return _dpu_encoder_init_debugfs(encoder);
> >   }
> >
> > -static void dpu_encoder_early_unregister(struct drm_encoder *encoder)
> > -{
> > -     struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
> > -
> > -     debugfs_remove_recursive(dpu_enc->debugfs_root);
> > -}
> > -
> >   static int dpu_encoder_virt_add_phys_encs(
> >               struct msm_display_info *disp_info,
> >               struct dpu_encoder_virt *dpu_enc,
> > @@ -2374,7 +2367,6 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
> >   static const struct drm_encoder_funcs dpu_encoder_funcs = {
> >               .destroy = dpu_encoder_destroy,
> >               .late_register = dpu_encoder_late_register,
> > -             .early_unregister = dpu_encoder_early_unregister,
> >   };
> >
> >   struct drm_encoder *dpu_encoder_init(struct drm_device *dev,

-- 
With best wishes
Dmitry
