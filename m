Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05D66746E40
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 12:07:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230432AbjGDKHI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 06:07:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbjGDKHI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 06:07:08 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F362FF1
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 03:07:06 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-57916e0badcso41716717b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 03:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688465226; x=1691057226;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W/TU50pqt7852fwznZ8t754nkkl2iciRxHnPHmCyB6U=;
        b=vBnZ6yBjAVZtB9lm+mTYzLyl2NbiVFu3/EqWvjTxAyNh+SLKaoJLvZtGBLcI9x4V4f
         jiJnN+fmGpKxzcn/aLGILdPGAu0anZMoyBay0lzIUmegRkCpT8s0oUjTaHBYHEz6PS5l
         j4YI3LJbrvsKRS8hTwYuf92HVZlLsaeLQtODp6czjfp8FUHZaQWBRHlM/o88nv1HysAE
         nTz68kLGavsR0j5dp8Vk2RK59vaal6ORnlPGMZmsT9zsA8al13u4IVR/HqmMgw6w8RQD
         43BHqJoyUKSsCGk6Z9vvVlVMJYMm55J530s67InMjX/Tu/uI6Econtus8ioxrOWfXj7b
         5p7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688465226; x=1691057226;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/TU50pqt7852fwznZ8t754nkkl2iciRxHnPHmCyB6U=;
        b=gLyGS1yIjdBtxHYPz2s4yckC4QU1gSTPzMmfivztu8DRXDN/z7SgzcvCvzVSpEc+bH
         uWLzUbal2A2ViIzNjyPFKl1tzS0eFDfcvrVC2s7kflQlNpHyjJbijWfZFU1K1SGkBuIj
         ERBnGSGbrtkecKyCPkAjf5eSTRb8m5OSnjykMsUVS1R6748R88pXsRXB0p+3Yz2UC2gE
         +JhhrLQ4Xv95MiYG2dBFitni5E5UKPLNBBE6N0NFwhtqUs4fTsTbXUy+9B0wWrGwybAZ
         lveM+jWTMSRdLgJjdOALjR2hcXoTniO2uZsAO3W5KNeq6mLGpqV6bz4hGFLTOsSMlOQp
         3oCg==
X-Gm-Message-State: ABy/qLbgMF93+pSYiFOvzHOpwzMaM+tPoJiWtYB8RXCShN5DjP9OgpG6
        WUpPpW6EzLDup1RYko+oBU4GTEYHPGDDwOe3F3VV+A==
X-Google-Smtp-Source: APBJJlG9beslrUOAlSlPYS9wFzbYRVC5J4X7RDqJStkFhnmcip4kLagbCciA+DPhU9qbHQXZSH34fZLgmBZWNIuVkus=
X-Received: by 2002:a25:c7cf:0:b0:bd7:545e:ab41 with SMTP id
 w198-20020a25c7cf000000b00bd7545eab41mr11391556ybe.27.1688465226174; Tue, 04
 Jul 2023 03:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
 <20230619212519.875673-5-dmitry.baryshkov@linaro.org> <0aafbba0-52dd-96d9-94a6-0452996e1eba@quicinc.com>
 <974a294c-d85d-a79f-5b83-bbbac12ff7a2@linaro.org> <50855184-1fbf-8e36-f0eb-a46be70b1eca@quicinc.com>
In-Reply-To: <50855184-1fbf-8e36-f0eb-a46be70b1eca@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 4 Jul 2023 13:06:55 +0300
Message-ID: <CAA8EJprQLpRNHShWWWZeSyKx3erat3Q7WUXhVV1pYp9UtQEgng@mail.gmail.com>
Subject: Re: [PATCH v4 04/19] drm/msm/dpu: drop dpu_mdss_cfg::mdp_count field
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

On Tue, 4 Jul 2023 at 07:04, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 7/3/2023 7:20 PM, Dmitry Baryshkov wrote:
> > On 03/07/2023 05:01, Abhinav Kumar wrote:
> >>
> >>
> >> On 6/19/2023 2:25 PM, Dmitry Baryshkov wrote:
> >>> There is always a single MDP TOP block. Drop the mdp_count field and
> >>> stop declaring dpu_mdp_cfg instances as arrays.
> >>>
> >>> Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>
> >> The change drops mdp_count and stops using the array which is fine and
> >> I will support that.
> >>
> >> But looking at the pattern I saw while using core_revision, both
> >> DPU_MDP_VSYNC_SEL and DPU_MDP_AUDIO_SELECT can also be dropped from
> >> the catalog in favor of using core_revision.
> >>
> >> Hence for that, I request you not to stop passing dpu_mdss_cfg to
> >> dpu_hw_mdptop_init as that has the necessary information of
> >> core_revision.
> >
> > Sure, I'll restore it. Please note, however, that it might be better to
> > pass struct dpu_caps instead of the full struct dpu_mdss_cfg.
> >
>
> Thanks for restoring.
>
> Can you pls explain this better? dpu_core_rev is part of dpu_mdss_cfg,
> so dpu_caps wont be enough for this one.

Oh, true. For some reason I thought that version is a part of dpu_caps.

>
> >>
> >>>   .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  7 +---
> >>>   .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  7 +---
> >>>   .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  7 +---
> >>>   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  7 +---
> >>>   .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  7 +---
> >>>   .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  7 +---
> >>>   .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  7 +---
> >>>   .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  7 +---
> >>>   .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  7 +---
> >>>   .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  7 +---
> >>>   .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  7 +---
> >>>   .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  7 +---
> >>>   .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  7 +---
> >>>   .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  7 +---
> >>>   .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  7 +---
> >>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  1 -
> >>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    | 38 +++----------------
> >>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |  8 ++--
> >>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  4 +-
> >>>   19 files changed, 41 insertions(+), 115 deletions(-)
> >



-- 
With best wishes
Dmitry
