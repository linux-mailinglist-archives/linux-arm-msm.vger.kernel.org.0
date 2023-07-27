Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4679765BEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 21:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231299AbjG0TPk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 15:15:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjG0TPk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 15:15:40 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4105C2735
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 12:15:38 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 956F920215;
        Thu, 27 Jul 2023 21:15:35 +0200 (CEST)
Date:   Thu, 27 Jul 2023 21:15:33 +0200
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
Subject: Re: [PATCH v4 0/5] drm/msm/dpu: rework interrupt handling
Message-ID: <hlfikr2mhsqjoydcfwaveexafnwbubehyluibx23cpsgu3stcm@dgxnhps34ys2>
References: <20230727144543.1483630-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727144543.1483630-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-07-27 17:45:38, Dmitry Baryshkov wrote:
> Please exuse me for the spam, I missed the triggered WARN_ON because of
> the dropped patch.
> 
> Declaring the mask of supported interrupts proved to be error-prone. It
> is very easy to add a bit with no corresponding backing block or to miss
> the INTF TE bit. Replace this static configuration with the irq mask
> calculated from the HW catalog data.
> 
> Changes since v3:
>  - Rework INTF_TE handling. Stop depending on DPU_INTF_TE and enable the
>    relevant interrupt explicitly.

Yeah that seems like a good idea.  I had at some point considered, but
it would be much more messy, to collect all the `.intr_` members of
every cfg structure to accumulate the used flags instead.  But that's
more cumbersome especially since everything uses TOP0 etc anyway.

I do miss b4 inserting links to lore.kernel.org for earlier series
revisions though.

Finally I retested this whole series on sdm845 (PP TE) and sm6125 (INTF
TE) and both behave fine.

- Marijn

> Changes since v2:
>  - Rebased on top of msm-next-lumag to be able to use core_major_ver
>    instead of adding yet another flag.
>  - Dropped the DPU_INTF_TE movement patch, useless after rebasing.
> 
> Changes since v1:
>  - Enable dpu_caps::has_7xxx_intr for DPU >= 7.0 (Neil)
> 
> Dmitry Baryshkov (5):
>   drm/msm/dpu: inline __intr_offset
>   drm/msm/dpu: split interrupt address arrays
>   drm/msm/dpu: autodetect supported interrupts
>   drm/msm/dpu: drop now-unused mdss_irqs field from hw catalog
>   drm/msm/dpu: drop compatibility INTR defines
> 
>  .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |   8 --
>  .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |   9 --
>  .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  11 --
>  .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  13 ---
>  .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |   6 -
>  .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  10 --
>  .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |   6 -
>  .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |   5 -
>  .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |   6 -
>  .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |   5 -
>  .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |   5 -
>  .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  13 +--
>  .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |   9 +-
>  .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  18 +--
>  .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  13 +--
>  .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  13 +--
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 -
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 106 ++++++++++++------
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  18 ++-
>  19 files changed, 87 insertions(+), 190 deletions(-)
> 
> -- 
> 2.39.2
> 
