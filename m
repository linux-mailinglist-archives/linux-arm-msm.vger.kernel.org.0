Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 243F86D0692
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 15:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231953AbjC3N0Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 09:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231904AbjC3N0W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 09:26:22 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DE1EAD10
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 06:26:07 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id p204so23402711ybc.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 06:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680182766;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pBFNbyLwIaZdVlZAJy0OXpupkYa5mPc067O8He/7Pr0=;
        b=KIVQU+Yhd2X3Fa+385VoVY3QftD4sH4gzHaGR8tLvum57h+hzk2N2Ta81xER6eiAZE
         e6Lg19nJq5tfg0RHCPCH4sLwN8BB7KlfCJYLXaqtb/5qbUddOQglw+6nR6IEeOHC+5Dj
         n12Ctz+5X1498OhWvsaWjycCGLnaw/ggd2kGaBrQvS/cbv94iDBcWlzZiytB91nIk67W
         tMzAbS3Iqn7UQCLF0RyUDaE7ksxPkBiRuGGGofZF9naG3tWw6uZwdGft35DmmUf4IJkV
         HrUyhWaoxx4ZDqzJFb65961WkHYObDYckEwEKOpNMM0cNnRWZc32UEZXw3jtTkhsBqab
         Xotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680182766;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pBFNbyLwIaZdVlZAJy0OXpupkYa5mPc067O8He/7Pr0=;
        b=VGS7k9fzkaOVBXImmEjnykeX5FJWo0Zy8+3fsjJGx66CzOTdXFWUIhVw0cS1R/IiEU
         lKCt+Te1r0aV8l9KEmWHgdNCXbI1EBtyEJDgxEaUdYgzaYuAmmYVfmL5xDxemPyFVTK5
         b6LAM2WqnndJbqo0+DVVW7iTRv74gcLg5EInnsq158yjAXDnk0zKRhs84BzXQDOb9HMr
         5NA1mFiWHFtQGPRcp3uG4sdw4W5bPeKllvoJDSwEYGFUkaqm1z8HGa3y0mI43FmXqWl1
         H0/pztW9ns0sCiu6Pkslq4Z+CK+R4jep0j9R6QsCg0hloFpJaQTrRLxznbUsd/PGjZhD
         k0tw==
X-Gm-Message-State: AAQBX9fU6/M5vLtBOCN7G1Y+0+mu1uYSuqfgUwlaSbcVii7BYbt7jAk2
        5SYJosvLPY989ss2K7aALY1CdIn9SYxUJbssS0orKA==
X-Google-Smtp-Source: AKy350ZJK4qaL5sXPGseij381rD1gabzfqbyDucu5yPjwR1PcsFEe3RqDWLGD9sBFG1jsEd+m4JgD+A3CWxGt8vIv8E=
X-Received: by 2002:a05:6902:1201:b0:b6c:4d60:1bd6 with SMTP id
 s1-20020a056902120100b00b6c4d601bd6mr16024549ybu.9.1680182766072; Thu, 30 Mar
 2023 06:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230211231259.1308718-47-dmitry.baryshkov@linaro.org> <218a75a7-0d56-2ac2-cdd9-8bf8550bfe65@linaro.org>
In-Reply-To: <218a75a7-0d56-2ac2-cdd9-8bf8550bfe65@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 30 Mar 2023 16:25:54 +0300
Message-ID: <CAA8EJpp8Nz6MX-tDSMhV0Cwo05cuPVAkp8mcr2V34TRwn8RiLw@mail.gmail.com>
Subject: Re: [v2,46/50] drm/msm/dpu: rename INTF_foo_MASK to contain major DPU version
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 30 Mar 2023 at 16:14, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 12.02.2023 00:12, Dmitry Baryshkov wrote:
> > To ease review and reuse rename INTF feature masks to contain base DPU
> > version since which this mask is used.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  8 ++++----
> >  .../drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  8 ++++----
> >  .../drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  8 ++++----
> >  .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 12 ++++++------
> >  .../drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  8 ++++----
> >  .../drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  4 ++--
> >  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h  |  2 +-
> >  .../drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  8 ++++----
> >  .../drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  6 +++---
> >  .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 18 +++++++++---------
> >  .../drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  8 ++++----
> >  .../drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  8 ++++----
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  6 +++---
> >  13 files changed, 52 insertions(+), 52 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> > index 1eb3b5a9d485..5e8200d929e4 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> > @@ -135,10 +135,10 @@ static const struct dpu_dspp_cfg msm8998_dspp[] = {
> >  };
> >
> >  static const struct dpu_intf_cfg msm8998_intf[] = {
> > -     INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > -     INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > -     INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, 1, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> > -     INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_HDMI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> > +     INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 25, INTF_DPU_0_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > +     INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, 0, 25, INTF_DPU_0_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > +     INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, 1, 25, INTF_DPU_0_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> > +     INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_HDMI, 0, 25, INTF_DPU_0_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> This should be DPU3, DPU1/2 is 8996-ish.

And the mask is empty. But yeah, let's change that to DPU3.

>
> Otherwise lgtm
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>
> Konrad
> >  };
> >
> >  static const struct dpu_perf_cfg msm8998_perf_data = {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> > index cc6431e42932..daef5e48e7ee 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> > @@ -133,10 +133,10 @@ static const struct dpu_dsc_cfg sdm845_dsc[] = {
> >  };
> >
> >  static const struct dpu_intf_cfg sdm845_intf[] = {
> > -     INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > -     INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > -     INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> > -     INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> > +     INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 24, INTF_DPU_0_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > +     INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, 0, 24, INTF_DPU_0_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > +     INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, 1, 24, INTF_DPU_0_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> > +     INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 1, 24, INTF_DPU_0_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> >  };
> >
> >  static const struct dpu_perf_cfg sdm845_perf_data = {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > index a2c8b7c51890..8a0cc5909400 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > @@ -22,10 +22,10 @@ static const struct dpu_dsc_cfg sm8150_dsc[] = {
> >  };
> >
> >  static const struct dpu_intf_cfg sm8150_intf[] = {
> > -     INTF_BLK("intf_0", INTF_0, 0x6a000, 0x2b8, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > -     INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2b8, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > -     INTF_BLK("intf_2", INTF_2, 0x6b000, 0x2b8, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> > -     INTF_BLK("intf_3", INTF_3, 0x6b800, 0x2b8, INTF_DP, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> > +     INTF_BLK("intf_0", INTF_0, 0x6a000, 0x2b8, INTF_DP, 0, 24, INTF_DPU_5_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > +     INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2b8, INTF_DSI, 0, 24, INTF_DPU_5_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > +     INTF_BLK("intf_2", INTF_2, 0x6b000, 0x2b8, INTF_DSI, 1, 24, INTF_DPU_5_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> > +     INTF_BLK("intf_3", INTF_3, 0x6b800, 0x2b8, INTF_DP, 1, 24, INTF_DPU_5_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> >  };
> >
> >  static const struct dpu_perf_cfg sm8150_perf_data = {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> > index 26211f4fad99..f697a77516da 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> > @@ -15,13 +15,13 @@ static const struct dpu_ubwc_cfg sc8180x_ubwc_cfg = {
> >  };
> >
> >  static const struct dpu_intf_cfg sc8180x_intf[] = {
> > -     INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > -     INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > -     INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> > +     INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_DPU_5_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > +     INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, 0, 24, INTF_DPU_5_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > +     INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, 1, 24, INTF_DPU_5_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> >       /* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
> > -     INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 999, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> > -     INTF_BLK("intf_4", INTF_4, 0x6c000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> > -     INTF_BLK("intf_5", INTF_5, 0x6c800, 0x280, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> > +     INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 999, 24, INTF_DPU_5_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> > +     INTF_BLK("intf_4", INTF_4, 0x6c000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_DPU_5_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> > +     INTF_BLK("intf_5", INTF_5, 0x6c800, 0x280, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_DPU_5_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> >  };
> >
> >  static const struct dpu_perf_cfg sc8180x_perf_data = {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> > index b3d3b6fb4412..fd5df2bdec0e 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> > @@ -163,10 +163,10 @@ static const struct dpu_dsc_cfg sm8250_dsc[] = {
> >  };
> >
> >  static const struct dpu_intf_cfg sm8250_intf[] = {
> > -     INTF_BLK("intf_0", INTF_0, 0x6a000, 0x2b8, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > -     INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2b8, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > -     INTF_BLK("intf_2", INTF_2, 0x6b000, 0x2b8, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> > -     INTF_BLK("intf_3", INTF_3, 0x6b800, 0x2b8, INTF_DP, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> > +     INTF_BLK("intf_0", INTF_0, 0x6a000, 0x2b8, INTF_DP, 0, 24, INTF_DPU_5_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > +     INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2b8, INTF_DSI, 0, 24, INTF_DPU_5_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > +     INTF_BLK("intf_2", INTF_2, 0x6b000, 0x2b8, INTF_DSI, 1, 24, INTF_DPU_5_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> > +     INTF_BLK("intf_3", INTF_3, 0x6b800, 0x2b8, INTF_DP, 1, 24, INTF_DPU_5_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> >  };
> >
> >  static const struct dpu_wb_cfg sm8250_wb[] = {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> > index 2c991cb6ed7a..66762a0706de 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> > @@ -86,8 +86,8 @@ static const struct dpu_pingpong_cfg sc7180_pp[] = {
> >  };
> >
> >  static const struct dpu_intf_cfg sc7180_intf[] = {
> > -     INTF_BLK("intf_0", INTF_0, 0x6a000, 0x2b8, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > -     INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2b8, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > +     INTF_BLK("intf_0", INTF_0, 0x6a000, 0x2b8, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_DPU_5_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > +     INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2b8, INTF_DSI, 0, 24, INTF_DPU_5_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> >  };
> >
> >  static const struct dpu_perf_cfg sc7180_perf_data = {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
> > index 40e1183b9377..2849c017ddf2 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
> > @@ -44,7 +44,7 @@ static const struct dpu_pingpong_cfg dpu_6_lm1_pp[] = {
> >
> >  static const struct dpu_intf_cfg dpu_6_lm1_intf[] = {
> >       INTF_BLK("intf_0", INTF_0, 0x00000, 0x2b8, INTF_NONE, 0, 0, 0, 0, 0, 0),
> > -     INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2b8, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > +     INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2b8, INTF_DSI, 0, 24, INTF_DPU_5_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> >  };
> >
> >  #endif
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> > index 3080f34d2e5e..60ad844cfa25 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> > @@ -154,10 +154,10 @@ static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
> >  };
> >
> >  static const struct dpu_intf_cfg sm8350_intf[] = {
> > -     INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > -     INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > -     INTF_BLK("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> > -     INTF_BLK("intf_3", INTF_3, 0x37000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> > +     INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_DPU_7_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > +     INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_DPU_7_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > +     INTF_BLK("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, INTF_DPU_7_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> > +     INTF_BLK("intf_3", INTF_3, 0x37000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_DPU_7_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> >  };
> >
> >  static const struct dpu_perf_cfg sm8350_perf_data = {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> > index 37b1f410e2c4..387f2b6c5b56 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> > @@ -95,9 +95,9 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
> >  };
> >
> >  static const struct dpu_intf_cfg sc7280_intf[] = {
> > -     INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > -     INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > -     INTF_BLK("intf_5", INTF_5, 0x39000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> > +     INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_DPU_7_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > +     INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_DPU_7_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > +     INTF_BLK("intf_5", INTF_5, 0x39000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_DPU_7_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> >  };
> >
> >  static const struct dpu_perf_cfg sc7280_perf_data = {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> > index a023f4b1b92a..666acfd70f29 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> > @@ -38,15 +38,15 @@ static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
> >
> >  /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
> >  static const struct dpu_intf_cfg sc8280xp_intf[] = {
> > -     INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > -     INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > -     INTF_BLK("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> > -     INTF_BLK("intf_3", INTF_3, 0x37000, 0x2c4, INTF_NONE, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> > -     INTF_BLK("intf_4", INTF_4, 0x38000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> > -     INTF_BLK("intf_5", INTF_5, 0x39000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_3, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> > -     INTF_BLK("intf_6", INTF_6, 0x3a000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 16, 17),
> > -     INTF_BLK("intf_7", INTF_7, 0x3b000, 0x2c4, INTF_NONE, MSM_DP_CONTROLLER_2, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 18, 19),
> > -     INTF_BLK("intf_8", INTF_8, 0x3c000, 0x2c4, INTF_NONE, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 12, 13),
> > +     INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_DPU_7_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > +     INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_DPU_7_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > +     INTF_BLK("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, INTF_DPU_7_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> > +     INTF_BLK("intf_3", INTF_3, 0x37000, 0x2c4, INTF_NONE, MSM_DP_CONTROLLER_0, 24, INTF_DPU_7_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> > +     INTF_BLK("intf_4", INTF_4, 0x38000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_DPU_7_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> > +     INTF_BLK("intf_5", INTF_5, 0x39000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_3, 24, INTF_DPU_7_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> > +     INTF_BLK("intf_6", INTF_6, 0x3a000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_DPU_7_MASK, MDP_SSPP_TOP0_INTR, 16, 17),
> > +     INTF_BLK("intf_7", INTF_7, 0x3b000, 0x2c4, INTF_NONE, MSM_DP_CONTROLLER_2, 24, INTF_DPU_7_MASK, MDP_SSPP_TOP0_INTR, 18, 19),
> > +     INTF_BLK("intf_8", INTF_8, 0x3c000, 0x2c4, INTF_NONE, MSM_DP_CONTROLLER_1, 24, INTF_DPU_7_MASK, MDP_SSPP_TOP0_INTR, 12, 13),
> >  };
> >
> >  static const struct dpu_perf_cfg sc8280xp_perf_data = {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> > index 2b6d48073bce..63a1a6cf763c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> > @@ -51,10 +51,10 @@ static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
> >  };
> >
> >  static const struct dpu_intf_cfg sm8450_intf[] = {
> > -     INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > -     INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > -     INTF_BLK("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> > -     INTF_BLK("intf_3", INTF_3, 0x37000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> > +     INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_DPU_7_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > +     INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_DPU_7_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > +     INTF_BLK("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, INTF_DPU_7_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> > +     INTF_BLK("intf_3", INTF_3, 0x37000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_DPU_7_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> >  };
> >
> >  static const struct dpu_perf_cfg sm8450_perf_data = {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> > index c54b77f3c940..53db0049eecc 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> > @@ -166,11 +166,11 @@ static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
> >  };
> >
> >  static const struct dpu_intf_cfg sm8550_intf[] = {
> > -     INTF_BLK("intf_0", INTF_0, 0x34000, 0x300, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > +     INTF_BLK("intf_0", INTF_0, 0x34000, 0x300, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_DPU_7_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> >       /* TODO TE sub-blocks for intf1 & intf2 */
> > -     INTF_BLK("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > -     INTF_BLK("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> > -     INTF_BLK("intf_3", INTF_3, 0x37000, 0x300, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> > +     INTF_BLK("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_DPU_7_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > +     INTF_BLK("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_DPU_7_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> > +     INTF_BLK("intf_3", INTF_3, 0x37000, 0x300, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_DPU_7_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> >  };
> >
> >  static const struct dpu_mdss_cfg sm8550_dpu_cfg = {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > index 0b73e34d50a6..6b78554df30c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > @@ -77,11 +77,11 @@
> >
> >  #define DSPP_SC7180_MASK BIT(DPU_DSPP_PCC)
> >
> > -#define INTF_SDM845_MASK (0)
> > +#define INTF_DPU_0_MASK (0)
> >
> > -#define INTF_SC7180_MASK BIT(DPU_INTF_INPUT_CTRL) | BIT(DPU_INTF_TE)
> > +#define INTF_DPU_5_MASK INTF_DPU_0_MASK | BIT(DPU_INTF_INPUT_CTRL) | BIT(DPU_INTF_TE)
> >
> > -#define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN)
> > +#define INTF_DPU_7_MASK INTF_DPU_5_MASK | BIT(DPU_DATA_HCTL_EN)
> >
> >  #define WB_SM8250_MASK (BIT(DPU_WB_LINE_MODE) | \
> >                        BIT(DPU_WB_UBWC) | \



-- 
With best wishes
Dmitry
