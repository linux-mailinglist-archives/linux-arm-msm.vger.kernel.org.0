Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 988997477CB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 19:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbjGDRaq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 13:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjGDRap (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 13:30:45 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF304E76
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 10:30:43 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-bff89873d34so5391882276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 10:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688491843; x=1691083843;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lZZYhAMS4P0JlyUoFI/yQ9M0e2zsSOScmdbRcE5pQn0=;
        b=UM9IFKuWSrCweUYM6HcG8i1kc21W08w08Un0FeZKltLdhGE5tddMqCMS0pj3QByN5B
         df/UvjOowmu9NUv7djy8CQVrlZLzd76LgEgJL362lrQKa2z0wAAF9HPIWBEhEe5sMVDc
         saIQRfPg/FIwSHJ0jmqopC0sQ5AM8lMyyJOe2rWz4kQAsF6owJqaPxtDyJaqsEZFFDnd
         7wFNCUVpwICvhKWJ5QJEzE4v0Y+EZRiobt54BSN6kr81pI/JtQ9uzxwEkbhuz0bG1YtK
         3/M5yDLO90U/nuNJYDq16idE6vUbbxhyHObzHc9mwZ6eGXZVbnS9ZlxtISxR/csninvw
         bL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688491843; x=1691083843;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZZYhAMS4P0JlyUoFI/yQ9M0e2zsSOScmdbRcE5pQn0=;
        b=gpS5HJszCZ6cAYuAn3u1NPezPmmu/zTKQMaln+JoowVdRC9vdVpn6Ftbofu6NktzwS
         ASjg3RrM3qv1aBg3t7tNiTYE7id/lyGw8yHkWyqguaAvgxcVwV9XkaL7t1bmDQHePm0v
         Ygn3Bf5UStt/GaktpRKf1rllEx1se7p+0cy4DuZ+ovV6x2X3iw++82Qs+wcqUNAADy25
         01Xj5gnVMWCsK3XnxPe7AfGhyq+0JPoJyTAD8aroYgs8QN7tQWwqYw9KIi+74Lgs/l5M
         qFIWcCGnrVsMrS1LMOOT38Vry6gcOwBno5E9Z3MEUAMznn31YII4I3T/Jt6ZrwnYjR6C
         4eqw==
X-Gm-Message-State: ABy/qLYpLZBkQlRjJnp2hB3mj0Nux4CQK7g7WnzN1EKt9mis+LrFusqW
        NEjTs6rWjPaP63viZkLip4iZwpWjH3KN44Y+8Nh/Kw==
X-Google-Smtp-Source: APBJJlHigHEYKofayb+OxZT57NxYXwngeV93etDN5bhfqo65aLEQgDJMs3OzGpe0jMPLa/Fx9K3i5sg9dz3n6CXd93s=
X-Received: by 2002:a25:c550:0:b0:c5e:5573:bda with SMTP id
 v77-20020a25c550000000b00c5e55730bdamr1496102ybe.11.1688491843141; Tue, 04
 Jul 2023 10:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
 <20230704150354.159882-6-dmitry.baryshkov@linaro.org> <3e31a735-a4d1-c8d4-6a83-53e2687c2f18@quicinc.com>
In-Reply-To: <3e31a735-a4d1-c8d4-6a83-53e2687c2f18@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 4 Jul 2023 20:30:32 +0300
Message-ID: <CAA8EJpos_gPPzyTGc56yQM6h0K8XBJKB2STq6eMZCkRpN4uxbw@mail.gmail.com>
Subject: Re: [PATCH v2 05/14] drm/msm/dpu: handle perf mode in _dpu_core_perf_crtc_update_bus()
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 4 Jul 2023 at 18:55, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 7/4/2023 8:03 AM, Dmitry Baryshkov wrote:
> > Move perf mode handling for the bandwidth to
> > _dpu_core_perf_crtc_update_bus() rather than overriding per-CRTC data
> > and then aggregating known values.
> >
> > Note, this changes the fix_core_ab_vote. Previously it would be
> > multiplied per the CRTC number, now it will be used directly for
> > interconnect voting.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Break this out into a separate series. This rework doesnt need to be
> part of this cleanup series.

Sure, why not.

>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 37 +++++++++----------
> >   1 file changed, 18 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > index 348550ac7e51..42c03a5f1f3e 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > @@ -116,21 +116,9 @@ static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
> >               return;
> >       }
> >
> > -     memset(perf, 0, sizeof(struct dpu_core_perf_params));
> > -
> > -     if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> > -             perf->bw_ctl = 0;
> > -             perf->max_per_pipe_ib = 0;
> > -             perf->core_clk_rate = 0;
> > -     } else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > -             perf->bw_ctl = kms->perf.fix_core_ab_vote;
> > -             perf->max_per_pipe_ib = kms->perf.fix_core_ib_vote;
> > -             perf->core_clk_rate = kms->perf.fix_core_clk_rate;
> > -     } else {
> > -             perf->bw_ctl = _dpu_core_perf_calc_bw(kms, crtc);
> > -             perf->max_per_pipe_ib = kms->catalog->perf->min_dram_ib;
> > -             perf->core_clk_rate = _dpu_core_perf_calc_clk(kms, crtc, state);
> > -     }
> > +     perf->bw_ctl = _dpu_core_perf_calc_bw(kms, crtc);
> > +     perf->max_per_pipe_ib = kms->catalog->perf->min_dram_ib;
> > +     perf->core_clk_rate = _dpu_core_perf_calc_clk(kms, crtc, state);
> >
> >       DRM_DEBUG_ATOMIC(
> >               "crtc=%d clk_rate=%llu core_ib=%llu core_ab=%llu\n",
> > @@ -236,17 +224,28 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> >       struct dpu_core_perf_params perf = { 0 };
> >       int i, ret = 0;
> >       u32 avg_bw;
> > +     u32 peak_bw;
> >
> >       if (!kms->num_paths)
> >               return 0;
> >
> > -     dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> > +     if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> > +             avg_bw = 0;
> > +             peak_bw = 0;
> > +     } else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > +             avg_bw = kms->perf.fix_core_ab_vote;
> > +             peak_bw = kms->perf.fix_core_ib_vote;
> > +     } else {
> > +             dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> > +
> > +             avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
> > +             peak_bw = perf.max_per_pipe_ib;
> > +     }
> >
> > -     avg_bw = perf.bw_ctl;
> > -     do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
> > +     avg_bw /= kms->num_paths;
> >
> >       for (i = 0; i < kms->num_paths; i++)
> > -             icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
> > +             icc_set_bw(kms->path[i], avg_bw, peak_bw);
> >
> >       return ret;
> >   }



-- 
With best wishes
Dmitry
