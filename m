Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADEAD747423
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 16:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbjGDObk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 10:31:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbjGDObk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 10:31:40 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B60BEE49
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 07:31:38 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-c581c758ad8so1864054276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 07:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688481098; x=1691073098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1s6tpBIxe1xSBXEGUtkN8A1uCRjZ4iIBmxQ5Zab/0ts=;
        b=h1+Ji1dk99JXP0SJEIr4WQDv+OH/RqJXdQXeWtmbPo2Vi07bG3ZBHjZwatELYy0NAv
         aW+nDri+PgzfWSq3QPU2zRABhWwvwm9PePw01btSEgUMqDMyoPbfllVLQPfwvs0OiECs
         jGSwATHuHSqKd6QsHO65cB8nvbQPprQpOEJmDj5g5B91/V64WBzrchU0AL4/LW/TyAdB
         JIQycADRd+qOtc/n5p1NcEzJ0YcpPNgOSt7UwUqwjF+Mou5YMBdBiseWufpEYVRZrGSD
         zQYS1zIYGvajsNGJ5iPXoeIW1hRnFu44N2H0JYpwPEwkvEM0U1V4awCOIbVa0ni2rFn8
         /75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688481098; x=1691073098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1s6tpBIxe1xSBXEGUtkN8A1uCRjZ4iIBmxQ5Zab/0ts=;
        b=K5/Y2PQ9+H1si0l+o0ahuHZJUuW5T3yWj3N4Zqi3p0vXLAKbjdeUbTRXQhYBa1Omc8
         nxkvrMz+Nsntd2uJqcjZdhj+tjLhCbHPWcNWRjaV9J6eJPU6eGlOb6kh5H++GyzLyo5F
         ZZxWz+1XjiPkUfWSta+rjNKVrRmJf6TzEmieWpHJYrBfJ5Ubwwjfzuec494ukHilJ1I+
         ayRKpe04pgz2DbLmaKUMw/l7BLS4cqE8dEzwjbRlNqknIMTlYGvAkMdtUXdmrFnxDXPZ
         uhxhmGEVPPwrvZNXR6BYIekVUKsNsvDSHVdFhQGzrmxykaU9PKplA8LUdvC2x1KHsVl7
         FWWQ==
X-Gm-Message-State: ABy/qLbcj6ErCqPVjUzJ3bEpAwFQ0j+7qkoKMcsrUbluAZBI5zqpoe2g
        s8L9738kFIjw+WlhRalgjIfmIf2PzFpecFcll3YlXg==
X-Google-Smtp-Source: APBJJlH/CeZw84d35IUxjgDJRQ19GnRGx63FhS41w8DcaINF8V6ZeDXzlG59lhcA54EoqS/uvdnhXQ1uwfKpLMe8QK8=
X-Received: by 2002:a25:dbd0:0:b0:c11:3daf:7c47 with SMTP id
 g199-20020a25dbd0000000b00c113daf7c47mr11111491ybf.63.1688481097965; Tue, 04
 Jul 2023 07:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-8-dmitry.baryshkov@linaro.org> <b2499f3d-46d4-216e-9142-87d73e26781e@quicinc.com>
 <CAA8EJpq43fKi=L11cyfBddcP+n994bhFchHcNprnR=Vu823BiA@mail.gmail.com> <9c13ecf8-c093-e145-3a79-d0686fc5d6e7@quicinc.com>
In-Reply-To: <9c13ecf8-c093-e145-3a79-d0686fc5d6e7@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 4 Jul 2023 17:31:26 +0300
Message-ID: <CAA8EJpo9kUWvh=HeWG_MF77ExeMA+8z1=mBRwB36886zK27E2Q@mail.gmail.com>
Subject: Re: [PATCH 7/8] drm/msm/dpu: drop dpu_core_perf_destroy()
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
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

On Tue, 4 Jul 2023 at 03:19, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 7/3/2023 3:59 PM, Dmitry Baryshkov wrote:
> > On Tue, 4 Jul 2023 at 01:57, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 6/19/2023 5:08 PM, Dmitry Baryshkov wrote:
> >>> This function does nothing, just clears several data pointers. Drop it
> >>> now.
> >>>
> >>
> >> This will undo what dpu_core_perf_init() did when an error happens.
> >>
> >> Why can we drop that?
> >
> > Because nothing will use this data in an error case. There is no need
> > to clean it.
> >
>
> Usage is one thing for sure but I am still inclined to keep it symmetric
> with dpu_core_perf_init().

Through the last several years the kernel was more and more inclined
to asymmetry here. For example, consider all the demv_ functions. We
have been removing cleanup and _remove functions all over the place.
So, I think, I will reiterate this patch.

>
> >>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 12 ------------
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  6 ------
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  1 -
> >>>    3 files changed, 19 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> >>> index 78a7e3ea27a4..f779ad544347 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> >>> @@ -394,18 +394,6 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
> >>>    }
> >>>    #endif
> >>>
> >>> -void dpu_core_perf_destroy(struct dpu_core_perf *perf)
> >>> -{
> >>> -     if (!perf) {
> >>> -             DPU_ERROR("invalid parameters\n");
> >>> -             return;
> >>> -     }
> >>> -
> >>> -     perf->max_core_clk_rate = 0;
> >>> -     perf->core_clk = NULL;
> >>> -     perf->dev = NULL;
> >>> -}
> >>> -
> >>>    int dpu_core_perf_init(struct dpu_core_perf *perf,
> >>>                struct drm_device *dev,
> >>>                const struct dpu_perf_cfg *perf_cfg,
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> >>> index e8a7916b6f71..e1198c104b5e 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> >>> @@ -69,12 +69,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
> >>>     */
> >>>    void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc);
> >>>
> >>> -/**
> >>> - * dpu_core_perf_destroy - destroy the given core performance context
> >>> - * @perf: Pointer to core performance context
> >>> - */
> >>> -void dpu_core_perf_destroy(struct dpu_core_perf *perf);
> >>> -
> >>>    /**
> >>>     * dpu_core_perf_init - initialize the given core performance context
> >>>     * @perf: Pointer to core performance context
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >>> index 6e62606e32de..4439147d2c35 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >>> @@ -1162,7 +1162,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
> >>>        return 0;
> >>>
> >>>    drm_obj_init_err:
> >>> -     dpu_core_perf_destroy(&dpu_kms->perf);
> >>>    hw_intr_init_err:
> >>>    perf_err:
> >>>    power_error:
> >
> >
> >



-- 
With best wishes
Dmitry
