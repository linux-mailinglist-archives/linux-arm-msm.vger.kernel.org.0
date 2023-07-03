Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB677453A5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 03:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbjGCBgy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 21:36:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjGCBgy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 21:36:54 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C51AF193
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 18:36:51 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-bff89873d34so3496440276.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 18:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688348211; x=1690940211;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=odVz5jU1TnyJbdu/HOho8SWCFVqcS8ET60dsqz2tpcc=;
        b=UG6HgK3AoD+b0Gu9oEvI/zE+LZQiPpCw6Q0pjqh4tOm00tF25lTyTKoPvLV5swadKC
         gV/GS3jWzTTaQ2igWaHfOLG6uTbPdX57v//EEQdz4gD+zM3x3Xyj80JUEjmvMDQ1n2+4
         0sKSYLiBG7WynCn/jmZNvNa+UvaIc1NlFiy7UALklXE9GnyBx1Y6JRWlDDPU64M+tVEn
         epAoASLmanSsdpITcpsvES2AHXi0DKnLWYHd5rOmMUEQmzACZ1Fqx7GpsnmsoBAn6ovO
         9TsoH/AnbzvyUBTIK6KdeFg/j0LS+7NfOzQCUxN5a+nIZyVhKw1uZmYshO9LFtnoCOoc
         v1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688348211; x=1690940211;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=odVz5jU1TnyJbdu/HOho8SWCFVqcS8ET60dsqz2tpcc=;
        b=YH77tW6DtXb0ZKLxZ7cM2VflmJy2JTs1W4/i8J9LVdUzC6AbUwmVyfzF2JNpltT9wR
         hgCZLAUC8nyAZNjfrtI3lgLGNpHDN+W+QZ9PXY1kjJIfZArkZ/vmg+0akaZwCyHCAo7m
         vXKeI7rGuLmKkAR5PnIlFQ037HptPUPIMHNhEJ9/Il8tS+V14dmg7DyHFGRd/oilMJn3
         ZwpWBnQlgkyZyP7gfD38d8/a7r29jzzNnvheWplzq0J+h2O6IUuRM8zajQP5dF6A7af0
         tQGOX4ZwB+IX0w9NpkcoXHJ98R6VW1Qeyz2HTy7rhmnxd8SL38tyu07Xop5pzdSY5k7A
         BdVA==
X-Gm-Message-State: ABy/qLbO4ZlS3UR4PIs7zL06IMpL88208aiZXgygkwZnHdugpCdBP0sc
        flxKg4Ux4KedwUKmdM9K/oRrcxnTub0E8bL14bvs7A==
X-Google-Smtp-Source: APBJJlHGF/ZYiyN/nKxfGSbSwgn8gWllSmVneqkr7trUMFa/2uhlDDbej8Yf1y/TRHtcOpKV51S9KiF2O56WcuLtgQ0=
X-Received: by 2002:a25:6c57:0:b0:bca:bc83:d315 with SMTP id
 h84-20020a256c57000000b00bcabc83d315mr7472170ybc.48.1688348210900; Sun, 02
 Jul 2023 18:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
 <20230619212519.875673-4-dmitry.baryshkov@linaro.org> <9a5d6276-1bbd-ec65-90b0-8625671dbbae@quicinc.com>
In-Reply-To: <9a5d6276-1bbd-ec65-90b0-8625671dbbae@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 3 Jul 2023 04:36:39 +0300
Message-ID: <CAA8EJpr3nJRmUfgLauYoZQP79gmcXHTyOrH1quTX9h_3Uns9DA@mail.gmail.com>
Subject: Re: [PATCH v4 03/19] drm/msm/dpu: simplify peer LM handling
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

On Mon, 3 Jul 2023 at 04:34, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/19/2023 2:25 PM, Dmitry Baryshkov wrote:
> > For each LM there is at max 1 peer LM which can be driven by the same
> > CTL, so there no need to have a mask instead of just an ID of the peer
> > LM.
> >
>
> The change is ok but the wording seems incorrect. Are you implying that
> only LM0 and LM1 can be used for CTL0 and so-on? Because thats how this
> is implying.
>
> So any LM can be used with any CTL. Its just that each LM has only one
> peer. No need to mention anything about CTL.

Please correct me if I am wrong, with pre-active CTL, each CTL could
drive any single LM or a fixed LM pair. That's what was meant here.
Would it be better if I rephrase the commit message in this way?

>
> > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  2 +-
> >   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  4 +--
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 34 +++++++------------
> >   3 files changed, 15 insertions(+), 25 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > index 0de507d4d7b7..30fb5b1f3966 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > @@ -394,7 +394,7 @@ static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK("8", 1);
> >       .features = _fmask, \
> >       .sblk = _sblk, \
> >       .pingpong = _pp, \
> > -     .lm_pair_mask = (1 << _lmpair), \
> > +     .lm_pair = _lmpair, \
> >       .dspp = _dspp \
> >       }
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > index b860784ade72..b07caa4b867e 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > @@ -554,14 +554,14 @@ struct dpu_sspp_cfg {
> >    * @features           bit mask identifying sub-blocks/features
> >    * @sblk:              LM Sub-blocks information
> >    * @pingpong:          ID of connected PingPong, PINGPONG_NONE if unsupported
> > - * @lm_pair_mask:      Bitmask of LMs that can be controlled by same CTL
> > + * @lm_pair:           ID of LM that can be controlled by same CTL
> >    */
> >   struct dpu_lm_cfg {
> >       DPU_HW_BLK_INFO;
> >       const struct dpu_lm_sub_blks *sblk;
> >       u32 pingpong;
> >       u32 dspp;
> > -     unsigned long lm_pair_mask;
> > +     unsigned long lm_pair;
> >   };
> >
> >   /**
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > index 471842bbb950..e333f4eeafc1 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > @@ -253,28 +253,19 @@ static bool _dpu_rm_needs_split_display(const struct msm_display_topology *top)
> >   }
> >
> >   /**
> > - * _dpu_rm_check_lm_peer - check if a mixer is a peer of the primary
> > + * _dpu_rm_get_lm_peer - get the id of a mixer which is a peer of the primary
> >    * @rm: dpu resource manager handle
> >    * @primary_idx: index of primary mixer in rm->mixer_blks[]
> > - * @peer_idx: index of other mixer in rm->mixer_blks[]
> > - * Return: true if rm->mixer_blks[peer_idx] is a peer of
> > - *          rm->mixer_blks[primary_idx]
> >    */
> > -static bool _dpu_rm_check_lm_peer(struct dpu_rm *rm, int primary_idx,
> > -             int peer_idx)
> > +static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
> >   {
> >       const struct dpu_lm_cfg *prim_lm_cfg;
> > -     const struct dpu_lm_cfg *peer_cfg;
> >
> >       prim_lm_cfg = to_dpu_hw_mixer(rm->mixer_blks[primary_idx])->cap;
> > -     peer_cfg = to_dpu_hw_mixer(rm->mixer_blks[peer_idx])->cap;
> >
> > -     if (!test_bit(peer_cfg->id, &prim_lm_cfg->lm_pair_mask)) {
> > -             DPU_DEBUG("lm %d not peer of lm %d\n", peer_cfg->id,
> > -                             peer_cfg->id);
> > -             return false;
> > -     }
> > -     return true;
> > +     if (prim_lm_cfg->lm_pair >= LM_0 && prim_lm_cfg->lm_pair < LM_MAX)
> > +             return prim_lm_cfg->lm_pair - LM_0;
> > +     return -EINVAL;
> >   }
> >
> >   /**
> > @@ -351,7 +342,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
> >       int lm_idx[MAX_BLOCKS];
> >       int pp_idx[MAX_BLOCKS];
> >       int dspp_idx[MAX_BLOCKS] = {0};
> > -     int i, j, lm_count = 0;
> > +     int i, lm_count = 0;
> >
> >       if (!reqs->topology.num_lm) {
> >               DPU_ERROR("invalid number of lm: %d\n", reqs->topology.num_lm);
> > @@ -376,16 +367,15 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
> >               ++lm_count;
> >
> >               /* Valid primary mixer found, find matching peers */
> > -             for (j = i + 1; j < ARRAY_SIZE(rm->mixer_blks) &&
> > -                             lm_count < reqs->topology.num_lm; j++) {
> > -                     if (!rm->mixer_blks[j])
> > +             if (lm_count < reqs->topology.num_lm) {
> > +                     int j = _dpu_rm_get_lm_peer(rm, i);
> > +
> > +                     /* ignore the peer if there is an error or if the peer was already processed */
> > +                     if (j < 0 || j < i)
> >                               continue;
> >
> > -                     if (!_dpu_rm_check_lm_peer(rm, i, j)) {
> > -                             DPU_DEBUG("lm %d not peer of lm %d\n", LM_0 + j,
> > -                                             LM_0 + i);
> > +                     if (!rm->mixer_blks[j])
> >                               continue;
> > -                     }
> >
> >                       if (!_dpu_rm_check_lm_and_get_connected_blks(rm,
> >                                       global_state, enc_id, j,



-- 
With best wishes
Dmitry
