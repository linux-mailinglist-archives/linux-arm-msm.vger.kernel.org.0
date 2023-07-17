Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 756EF756C93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jul 2023 20:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbjGQS4X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jul 2023 14:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjGQS4W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jul 2023 14:56:22 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A043119A
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 11:56:18 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-bcb6dbc477eso3620768276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 11:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689620176; x=1690224976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VmA5Jfgc3nz1Zl14c2jQILY12tiDI4u1S5jeAvKKy/0=;
        b=GSvJRzB5FkiX2KTMvNw528FeF0WPz6XcJT7AyrHMFPDnfcF5HBiDLkcaQmX4LkR3DW
         zwavBgAoxpMSXTg4u0VFolB5N8PpYDypxdfPrCM3gVETuEGVnvMCXWBHj/k9bhYceN3b
         kz7HEnc+l7gDiEvMhHC5K24EPxWoaHbklerLX5cQLr7oEt1Zsf6m2EFz5/ZhFtpV03Ou
         141tOGlSP17tPP76z/PB0V7llWmuoGjSUb25GNJj35FxD95ykA1qTf7HbU21telKOqyk
         wh7wInk2riLcK99aojYTdZBvps3cwgBrtBWBp3xLyH0FgKfQJ9TWe5QmciQ/s1NZ+WmU
         AZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689620176; x=1690224976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmA5Jfgc3nz1Zl14c2jQILY12tiDI4u1S5jeAvKKy/0=;
        b=CxOa5oUdZDE96/OGzOzHU/R+plHIlkCp6nT1g1L4rWc+GQnc9/148VlA+ErTA4msGc
         kirJHzIdPiiu09+WX9pMrOyH1Bk79yVuzWrCXdMZc+T69MNrihbwbmV8ASkCyrRJrl3z
         fCeXUCSs4/46uR5IvcfH0G6XB+z3WR7fKB5EZhUyznOPQ3G6FG+wf0Uqb0JfM4WcL1i3
         Mvf7Z2xAizzJ4R/8cIyNltSqekGjX2H+QTb6irxfdHzMTP3MmSsCjjZfhh5Eqv5l3eJj
         FSJgQY5hNsSh8ZBZdlp+TiDwKJGZqNQFjelslEklQOUpkn3l/cfjG/1v/7QNeYEJelb+
         PC8A==
X-Gm-Message-State: ABy/qLY7mf485TRcDa7zMiy0ZKrCTFnwLqkklSeUzrjr5T34jLiem4K4
        v0F9s+6GOF93Te1HBVOzMTaGAcm5XrA/douZMCi85g==
X-Google-Smtp-Source: APBJJlGFOfQ8DMAEjRZm1xB6A5WX6wGyAbKiz7ErHiDBzOyNhki1Fo0RqAxT25Iys/8wOesoAjMTz/pWLYUClxB6VQU=
X-Received: by 2002:a25:b44:0:b0:cb0:3ce5:2bbc with SMTP id
 65-20020a250b44000000b00cb03ce52bbcmr8967189ybl.16.1689620176514; Mon, 17 Jul
 2023 11:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
 <20230712221139.313729-3-dmitry.baryshkov@linaro.org> <9c594fdb-095d-0c3f-cdd0-bd92304b42cb@quicinc.com>
In-Reply-To: <9c594fdb-095d-0c3f-cdd0-bd92304b42cb@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 17 Jul 2023 21:56:05 +0300
Message-ID: <CAA8EJpoW9-EXVKNARzgrO99viz5zmcV2H=kP3iNRhd4NDYhe0Q@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] drm/msm/dpu: core_perf: extract bandwidth
 aggregation function
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
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 17 Jul 2023 at 21:45, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 7/12/2023 3:11 PM, Dmitry Baryshkov wrote:
> > In preparation to refactoring the dpu_core_perf debugfs interface,
> > extract the bandwidth aggregation function from
> > _dpu_core_perf_crtc_update_bus().
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> Drop the core_perf tag from the subject line.

Ack.

>
> The debugfs refactor was dropped from this series if thats what you are
> referring to here.
>
> So even this and the next patch dont serve any purpose in this series
> and should be dropped, Unless you have some reason of keeping them here.

The next patch serves its purpose: it prevents recalculating bandwidth
if there are no ICC paths (useless math).

This patch separates actual math and control paths. It was required
for debugfs, but it serves its own purpose too. I'll reflect that in
the commit message.

>
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 39 +++++++++++--------
> >   1 file changed, 22 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > index 1d9d83d7b99e..333dcfe57800 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > @@ -206,33 +206,38 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
> >       return 0;
> >   }
> >
> > -static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> > -             struct drm_crtc *crtc)
> > +static void dpu_core_perf_aggregate(struct drm_device *ddev,
> > +                                 enum dpu_crtc_client_type curr_client_type,
> > +                                 struct dpu_core_perf_params *perf)
> >   {
> > -     struct dpu_core_perf_params perf = { 0 };
> > -     enum dpu_crtc_client_type curr_client_type
> > -                                     = dpu_crtc_get_client_type(crtc);
> > -     struct drm_crtc *tmp_crtc;
> >       struct dpu_crtc_state *dpu_cstate;
> > -     int i, ret = 0;
> > -     u64 avg_bw;
> > +     struct drm_crtc *tmp_crtc;
> >
> > -     drm_for_each_crtc(tmp_crtc, crtc->dev) {
> > +     drm_for_each_crtc(tmp_crtc, ddev) {
> >               if (tmp_crtc->enabled &&
> > -                     curr_client_type ==
> > -                             dpu_crtc_get_client_type(tmp_crtc)) {
> > +                 curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
> >                       dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
> >
> > -                     perf.max_per_pipe_ib = max(perf.max_per_pipe_ib,
> > -                                     dpu_cstate->new_perf.max_per_pipe_ib);
> > +                     perf->max_per_pipe_ib = max(perf->max_per_pipe_ib,
> > +                                                 dpu_cstate->new_perf.max_per_pipe_ib);
> >
> > -                     perf.bw_ctl += dpu_cstate->new_perf.bw_ctl;
> > +                     perf->bw_ctl += dpu_cstate->new_perf.bw_ctl;
> >
> > -                     DRM_DEBUG_ATOMIC("crtc=%d bw=%llu paths:%d\n",
> > -                               tmp_crtc->base.id,
> > -                               dpu_cstate->new_perf.bw_ctl, kms->num_paths);
> > +                     DRM_DEBUG_ATOMIC("crtc=%d bw=%llu\n",
> > +                                      tmp_crtc->base.id,
> > +                                      dpu_cstate->new_perf.bw_ctl);
> >               }
> >       }
> > +}
> > +
> > +static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> > +             struct drm_crtc *crtc)
> > +{
> > +     struct dpu_core_perf_params perf = { 0 };
> > +     int i, ret = 0;
> > +     u64 avg_bw;
> > +
> > +     dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> >
> >       if (!kms->num_paths)
> >               return 0;



-- 
With best wishes
Dmitry
