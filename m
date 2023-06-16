Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B42F733CBB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jun 2023 01:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232460AbjFPXFt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 19:05:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbjFPXFt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 19:05:49 -0400
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 170B43A8B
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 16:05:48 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 4A955213B4;
        Sat, 17 Jun 2023 01:05:46 +0200 (CEST)
Date:   Sat, 17 Jun 2023 01:05:44 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 00/19] drm/msm/dpu: another catalog rework
Message-ID: <rr3kwr3gdrek2ly25j6ja4echf2k7s5zbcllgoge5t3e3lyufz@ewysafbh4hpj>
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-16 13:02:58, Dmitry Baryshkov wrote:
> Having a macro with 10 arguments doesn't seem like a good idea. It makes
> it inherently harder to compare the actual structure values. Also this
> leads to adding macros covering varieties of the block.
> 
> As it was previously discussed, inline all foo_BLK macros in order to
> ease performing changes to the catalog data.
> 
> Major part of the conversion was performed using vim script found at
> [1]. Then some manual cleanups were applied, like dropping fields set to
> 0.
> 
> Dependencies: msm-next-lumag.
> 
> Changes since v2:
>  - Rebased on top of msm-next-lumag
>  - Fixed MSM_DP/DSI_CONTROLLER_n usage in sm6350 and sm6375 catalog data
>    (Abhinav, Marijn).
> 
> Changes since v1:
>  - Rebased on top of msm-next
>  - Dropped dependency on interrupt rework
> 
> [1] https://pastebin.ubuntu.com/p/26cdW5VpYB/
> [2] https://patchwork.freedesktop.org/patch/542142/?series=119220&rev=1
> 
> Dmitry Baryshkov (19):
>   drm/msm: enumerate DSI interfaces
>   drm/msm/dpu: always use MSM_DP/DSI_CONTROLLER_n
>   drm/msm/dpu: simplify peer LM handling
>   drm/msm/dpu: drop dpu_mdss_cfg::mdp_count field
>   drm/msm/dpu: drop enum dpu_mdp and MDP_TOP value
>   drm/msm/dpu: expand .clk_ctrls definitions
>   drm/msm/dpu: drop zero features from dpu_mdp_cfg data
>   drm/msm/dpu: drop zero features from dpu_ctl_cfg data
>   drm/msm/dpu: correct indentation for CTL definitions
>   drm/msm/dpu: inline SSPP_BLK macros
>   drm/msm/dpu: inline DSPP_BLK macros
>   drm/msm/dpu: inline LM_BLK macros
>   drm/msm/dpu: inline DSC_BLK and DSC_BLK_1_2 macros
>   drm/msm/dpu: inline MERGE_3D_BLK macros
>   drm/msm/dpu: inline various PP_BLK_* macros
>   drm/msm/dpu: inline WB_BLK macros
>   drm/msm/dpu: inline INTF_BLK and INTF_BLK_DSI_TE macros

Not sure if I'm ready to manually review all the inline patches before
the weekend, so for now this should do:

Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
(On SM8350 and SDM845 for now)

That is, after fixing the cfg-not-assigned regression in patch 4 where
mdp_count is dropped.

- Marijn

>   drm/msm/dpu: drop empty features mask MERGE_3D_SM8150_MASK
>   drm/msm/dpu: drop empty features mask INTF_SDM845_MASK
> 
>  .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 329 ++++++++----
>  .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 348 +++++++++----
>  .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 411 ++++++++++-----
>  .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 448 +++++++++++-----
>  .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 430 +++++++++++-----
>  .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    | 184 +++++--
>  .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  88 +++-
>  .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    | 188 ++++---
>  .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  88 +++-
>  .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  95 +++-
>  .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 418 ++++++++++-----
>  .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    | 244 ++++++---
>  .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 484 +++++++++++++-----
>  .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 445 +++++++++++-----
>  .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 467 ++++++++++++-----
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 130 -----
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   5 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   5 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |  34 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |   7 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  34 +-
>  drivers/gpu/drm/msm/msm_drv.h                 |   8 +-
>  23 files changed, 3320 insertions(+), 1572 deletions(-)
> 
> -- 
> 2.39.2
> 
