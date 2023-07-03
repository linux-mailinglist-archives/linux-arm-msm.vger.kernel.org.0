Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC9A07465F2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 01:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbjGCXB4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 19:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbjGCXBz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 19:01:55 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BE36E47
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 16:01:54 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-c5cf26e9669so101255276.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 16:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688425313; x=1691017313;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EkA8mWobE0tWArKnkiJluyYgGOyZrxHaua+jjdRGb58=;
        b=Q8dbUDX1CmmYZj1qty+dT22k6e0eYUCF/BAnwbK4JJ9PxJKktoTB1E5KNyWbxJj+FO
         OwdWnQ1Fxoe1GcvlHoaNMfeDXEialJEQ2uwUciGZLc9nlxISBAlbF580vk0XhXTkSncH
         tgtw3f3cMJhwZjCTIc84PglLQW+jfYqpcuSvLy+I3VszvGKsGn/vEFC/rZHynhwjK5kO
         4dHlId+cx5lTV/BJbGdzMCGbnzEbpSjTTyhHDkrwk0DaCFuLHPvEEjzeizpBnL4EkEkp
         EZB51CFrulD27juyQEPFeH0jKJ96GG7Pioc5zgNDpo6/lf0rst39Z7w6tJqya7npwj3V
         BuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688425313; x=1691017313;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EkA8mWobE0tWArKnkiJluyYgGOyZrxHaua+jjdRGb58=;
        b=dOdH5Cjqe/fsKuA8LbzA1iPsGZqRsxBbHR0eo3smpP2Ixxgo8+v8BdYn6RlTSYbBrz
         m3Yb8CgJhfSkEa+JCA7ipNCAuh12KVKTtXaB2GDxioPtpWBxYnBzRbJ3bUJ8xPbWaGJ1
         tph06wQxS9wpBxyjanUypT6t7txBGIYMwvP/6lhKjCT7mYWVoqaiwUvtPVePtR8yc0E3
         dslSns37qgad2s/cuoqUQPwRP+EkkNLJZr/XscoxgQ3OvKU6YRg0hhKBu/lOU4BZ984u
         1M12JsyrPnd58xGO6+34MDIIwGtaPn4e55sKvQbMTsTGZHY69MLukauU7cChwUhqodfj
         eCCg==
X-Gm-Message-State: ABy/qLYacgir7y+jkJJrk5CI/5jmbp2WZW9MGUPp9vNQml8jRGxk6aXV
        LD1aPk0erGGMV+e93OftOh1fO93DbcihU/aF8euYmQ==
X-Google-Smtp-Source: APBJJlFl+NnqqqEEHSswMMvpyQEemOx0iqrsXPmG6VCBaK2ANST2IetzWpA81eimlFerccspAoI20fDoAucsnjRxPpg=
X-Received: by 2002:a25:df97:0:b0:bff:aaf9:b7a2 with SMTP id
 w145-20020a25df97000000b00bffaaf9b7a2mr12347420ybg.39.1688425313466; Mon, 03
 Jul 2023 16:01:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-6-dmitry.baryshkov@linaro.org> <61760ea5-92a4-2150-033f-7d8a9b167eb7@quicinc.com>
 <CAA8EJprDwLhVQv1peOt71t-RTDBx2k72WqS0kpOsQudav=dhtw@mail.gmail.com> <ecad5268-e867-c472-40d1-e22ad102ba99@quicinc.com>
In-Reply-To: <ecad5268-e867-c472-40d1-e22ad102ba99@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 4 Jul 2023 02:01:42 +0300
Message-ID: <CAA8EJpo5jy=XM8v3xVFWxHcy3s4q_a4g6GuKxaKqzgXJLH144w@mail.gmail.com>
Subject: Re: [PATCH 5/8] drm/msm/dpu: drop the dpu_core_perf_crtc_update()'s
 stop_req param
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     freedreno@lists.freedesktop.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>
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

On Tue, 4 Jul 2023 at 01:55, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 7/3/2023 3:53 PM, Dmitry Baryshkov wrote:
> > On Tue, 4 Jul 2023 at 01:37, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 6/19/2023 5:08 PM, Dmitry Baryshkov wrote:
> >>> The stop_req is true only in the dpu_crtc_disable() case, when
> >>> crtc->enable has already been set to false. This renders the stop_req
> >>> argument useless. Remove it completely.
> >>>
> >>
> >> What about the enable case?
> >>
> >> That time dpu_crtc->enabled  will be false but you need valid clock and
> >> BW that time when you want to enable.
> >
> > Maybe I'm missing something here. The driver sets dpu_crtc->enabled in
> > atomic_enable, while dpu_core_perf_crtc_update() is called further,
> > during atomic_flush, or from the CRTC event handler. And both these
> > cases have stop_req as false.
> >
>
> But the first enable will happen with a commit too right?

Which one? Could you please point to it?

>
> Thats the one I am referring to.
>
> >>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 12 ++++++------
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  3 +--
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  6 +++---
> >>>    3 files changed, 10 insertions(+), 11 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> >>> index f8d5c87d0915..773e641eab28 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> >>> @@ -277,7 +277,7 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
> >>>    }
> >>>
> >>>    int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
> >>> -             int params_changed, bool stop_req)
> >>> +                           int params_changed)
> >>>    {
> >>>        struct dpu_core_perf_params *new, *old;
> >>>        bool update_bus = false, update_clk = false;
> >>> @@ -301,13 +301,13 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
> >>>        dpu_crtc = to_dpu_crtc(crtc);
> >>>        dpu_cstate = to_dpu_crtc_state(crtc->state);
> >>>
> >>> -     DRM_DEBUG_ATOMIC("crtc:%d stop_req:%d core_clk:%llu\n",
> >>> -                     crtc->base.id, stop_req, kms->perf.core_clk_rate);
> >>> +     DRM_DEBUG_ATOMIC("crtc:%d enabled:%d core_clk:%llu\n",
> >>> +                     crtc->base.id, crtc->enabled, kms->perf.core_clk_rate);
> >>>
> >>>        old = &dpu_crtc->cur_perf;
> >>>        new = &dpu_cstate->new_perf;
> >>>
> >>> -     if (crtc->enabled && !stop_req) {
> >>> +     if (crtc->enabled) {
> >>>                /*
> >>>                 * cases for bus bandwidth update.
> >>>                 * 1. new bandwidth vote - "ab or ib vote" is higher
> >>> @@ -337,7 +337,7 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
> >>>        }
> >>>
> >>>        trace_dpu_perf_crtc_update(crtc->base.id, new->bw_ctl,
> >>> -             new->core_clk_rate, stop_req, update_bus, update_clk);
> >>> +             new->core_clk_rate, !crtc->enabled, update_bus, update_clk);
> >>>
> >>>        if (update_bus) {
> >>>                ret = _dpu_core_perf_crtc_update_bus(kms, crtc);
> >>> @@ -355,7 +355,7 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
> >>>        if (update_clk) {
> >>>                clk_rate = _dpu_core_perf_get_core_clk_rate(kms);
> >>>
> >>> -             trace_dpu_core_perf_update_clk(kms->dev, stop_req, clk_rate);
> >>> +             trace_dpu_core_perf_update_clk(kms->dev, !crtc->enabled, clk_rate);
> >>>
> >>>                clk_rate = min(clk_rate, kms->perf.max_core_clk_rate);
> >>>                ret = dev_pm_opp_set_rate(&kms->pdev->dev, clk_rate);
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> >>> index 2bf7836f79bb..c29ec72984b8 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> >>> @@ -58,11 +58,10 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
> >>>     * dpu_core_perf_crtc_update - update performance of the given crtc
> >>>     * @crtc: Pointer to crtc
> >>>     * @params_changed: true if crtc parameters are modified
> >>> - * @stop_req: true if this is a stop request
> >>>     * return: zero if success, or error code otherwise
> >>>     */
> >>>    int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
> >>> -             int params_changed, bool stop_req);
> >>> +                           int params_changed);
> >>>
> >>>    /**
> >>>     * dpu_core_perf_crtc_release_bw - release bandwidth of the given crtc
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >>> index ff5d306b95ed..214229d11e3e 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >>> @@ -718,7 +718,7 @@ static void dpu_crtc_frame_event_cb(void *data, u32 event)
> >>>    void dpu_crtc_complete_commit(struct drm_crtc *crtc)
> >>>    {
> >>>        trace_dpu_crtc_complete_commit(DRMID(crtc));
> >>> -     dpu_core_perf_crtc_update(crtc, 0, false);
> >>> +     dpu_core_perf_crtc_update(crtc, 0);
> >>>        _dpu_crtc_complete_flip(crtc);
> >>>    }
> >>>
> >>> @@ -884,7 +884,7 @@ static void dpu_crtc_atomic_flush(struct drm_crtc *crtc,
> >>>                return;
> >>>
> >>>        /* update performance setting before crtc kickoff */
> >>> -     dpu_core_perf_crtc_update(crtc, 1, false);
> >>> +     dpu_core_perf_crtc_update(crtc, 1);
> >>>
> >>>        /*
> >>>         * Final plane updates: Give each plane a chance to complete all
> >>> @@ -1100,7 +1100,7 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
> >>>                atomic_set(&dpu_crtc->frame_pending, 0);
> >>>        }
> >>>
> >>> -     dpu_core_perf_crtc_update(crtc, 0, true);
> >>> +     dpu_core_perf_crtc_update(crtc, 0);
> >>>
> >>>        drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
> >>>                dpu_encoder_register_frame_event_callback(encoder, NULL, NULL);
> >
> >
> >



-- 
With best wishes
Dmitry
