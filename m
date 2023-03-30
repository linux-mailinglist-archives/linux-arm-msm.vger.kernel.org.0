Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62C776D06A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 15:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231822AbjC3N1i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 09:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231782AbjC3N1h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 09:27:37 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8815B479
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 06:27:09 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5416698e889so354319947b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 06:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680182826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vk2aLQpq3A74YUG5k+ExUhaaQ2z3RVtAyviAJHB+VG0=;
        b=ZTZ/+kSEOqRhoje82a13mdM9iDpREPckgSeL8//1bS/P9zFdiDRlu54UN9iSRCTegU
         I6vyNM/oHvLRaTvzg/cVAQh9V9XIc4GafGzP9087rLnsdh2e/ci7Q9jP4+wAsSYy8kd0
         1Avo+u4G+E7j0SfRsrZ2tZn4EfhDLaaMfxZydT0fPPNknmeR76gjGTQoBf0654qi63M3
         YS3YCPleVFAGM4d2adRN8zypETrqbpu+ClGmHO3gRLGTZu88Q9wFuGeSMx/c7ILZvHjo
         E48XC7Ja6th3ms4KnFCy9kjvIfWILI6cBEtksOsSMfH8kRfsoMGjG07TQj5g1vlcQc3a
         3faQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680182826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vk2aLQpq3A74YUG5k+ExUhaaQ2z3RVtAyviAJHB+VG0=;
        b=NGBW9TaJmp9ep9O0RshPu6gHB1mCn0amod0K3qIqaUESd3d0FeBQZU8uueh7sEry5E
         tXbqc4OzCXUHWxTo85Y0EutuLrqmk0P4giVMK6QDRzwDdfmWDGEeTP2p2W4VnbLSd/vm
         X/ofCHY5/TWtYEN+9xE650XnRKHXRy/MQl+NXzbTv8bIKC+tmTFaWLC+fvvAaonQn6uy
         hTdcJ5xjmZ165bHQb4I2Jb4QbRSM4WvmOYuAbuPHX01bCLXQuk1v3OPBM/bWySREjEBL
         Ko+mazLirs7NlCAsfC5cVCskHL93FPniUSRtxsB7PMAiwem8rS6F/UF1jQReKj3wjnPp
         2V+Q==
X-Gm-Message-State: AAQBX9d3MgxfL7RGfsJaSJdYf0/I/kO0KAJgIrfMQ7kx1Mchs28KPnKl
        fETHcfcudiarYf8VlR1mmAzyxLg6oshzMY8G6BWfBQ==
X-Google-Smtp-Source: AKy350ZxdY9sNk76TzLirjrv+xvbkc1nKqhLGJIJKQTTum8UomOrM5soiEHP3dCNOha/9nOhKXJds3S3SYyQ6SW2j0Y=
X-Received: by 2002:a81:4520:0:b0:541:85d2:af21 with SMTP id
 s32-20020a814520000000b0054185d2af21mr11668524ywa.5.1680182826331; Thu, 30
 Mar 2023 06:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230211231259.1308718-48-dmitry.baryshkov@linaro.org>
 <045895cf-7866-1c0c-51c3-34ea3a7f0cab@linaro.org> <a699774e-d403-46e8-921e-6a4a048cab79@linaro.org>
In-Reply-To: <a699774e-d403-46e8-921e-6a4a048cab79@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 30 Mar 2023 16:26:55 +0300
Message-ID: <CAA8EJpppVBKFo9-8m3uyqKYNTC39gjzQoOXaiwUrvkchZGG5vQ@mail.gmail.com>
Subject: Re: [v2,47/50] drm/msm/dpu: rename CTL_foo_MASK to contain major DPU version
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

On Thu, 30 Mar 2023 at 16:16, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 30.03.2023 15:15, Konrad Dybcio wrote:
> >
> >
> > On 12.02.2023 00:12, Dmitry Baryshkov wrote:
> >> To ease review and reuse rename CTL feature masks to contain base DPU
> >> version since which this mask is used.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> >>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 10 +++++-----
> >>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 10 +++++-----
> >>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h    | 12 ++++++------
> >>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 12 ++++++------
> >>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  6 +++---
> >>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h    |  2 +-
> >>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 12 ++++++------
> >>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  8 ++++----
> >>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h    | 12 ++++++------
> >>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 12 ++++++------
> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c       | 12 ++++++++----
> >>  11 files changed, 56 insertions(+), 52 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> >> index 5e8200d929e4..d42c380275bd 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> >> @@ -49,31 +49,31 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
> >>      {
> >>      .name = "ctl_0", .id = CTL_0,
> >>      .base = 0x1000, .len = 0x94,
> >> -    .features = BIT(DPU_CTL_SPLIT_DISPLAY),
> >> +    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_0_MASK,
> > Again, I'd vote for DPU_3
> Though thinking about it again, the 8996-and-earlier setup was
> probably the same and that's what you had in mind. Please confirm

Yes, the idea was to have DPU_0_MASK defined to (0) if that's
applicable to early generations.

>
> Konrad
> >
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >
> > Konrad
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> >>      },
> >>      {
> >>      .name = "ctl_1", .id = CTL_1,
> >>      .base = 0x1200, .len = 0x94,
> >> -    .features = 0,
> >> +    .features = CTL_DPU_0_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> >>      },
> >>      {
> >>      .name = "ctl_2", .id = CTL_2,
> >>      .base = 0x1400, .len = 0x94,
> >> -    .features = BIT(DPU_CTL_SPLIT_DISPLAY),
> >> +    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_0_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> >>      },
> >>      {
> >>      .name = "ctl_3", .id = CTL_3,
> >>      .base = 0x1600, .len = 0x94,
> >> -    .features = 0,
> >> +    .features = CTL_DPU_0_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> >>      },
> >>      {
> >>      .name = "ctl_4", .id = CTL_4,
> >>      .base = 0x1800, .len = 0x94,
> >> -    .features = 0,
> >> +    .features = CTL_DPU_0_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> >>      },
> >>  };
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> >> index daef5e48e7ee..281556416322 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> >> @@ -47,31 +47,31 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
> >>      {
> >>      .name = "ctl_0", .id = CTL_0,
> >>      .base = 0x1000, .len = 0xe4,
> >> -    .features = BIT(DPU_CTL_SPLIT_DISPLAY),
> >> +    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_0_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> >>      },
> >>      {
> >>      .name = "ctl_1", .id = CTL_1,
> >>      .base = 0x1200, .len = 0xe4,
> >> -    .features = BIT(DPU_CTL_SPLIT_DISPLAY),
> >> +    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_0_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> >>      },
> >>      {
> >>      .name = "ctl_2", .id = CTL_2,
> >>      .base = 0x1400, .len = 0xe4,
> >> -    .features = 0,
> >> +    .features = CTL_DPU_0_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> >>      },
> >>      {
> >>      .name = "ctl_3", .id = CTL_3,
> >>      .base = 0x1600, .len = 0xe4,
> >> -    .features = 0,
> >> +    .features = CTL_DPU_0_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> >>      },
> >>      {
> >>      .name = "ctl_4", .id = CTL_4,
> >>      .base = 0x1800, .len = 0xe4,
> >> -    .features = 0,
> >> +    .features = CTL_DPU_0_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> >>      },
> >>  };
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
> >> index 294702531ce2..7c051c142e06 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
> >> @@ -42,37 +42,37 @@ static const struct dpu_ctl_cfg dpu_5_lm6_ctl[] = {
> >>      {
> >>      .name = "ctl_0", .id = CTL_0,
> >>      .base = 0x1000, .len = 0x1e0,
> >> -    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> >> +    .features = CTL_DPU_5_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> >>      },
> >>      {
> >>      .name = "ctl_1", .id = CTL_1,
> >>      .base = 0x1200, .len = 0x1e0,
> >> -    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> >> +    .features = CTL_DPU_5_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> >>      },
> >>      {
> >>      .name = "ctl_2", .id = CTL_2,
> >>      .base = 0x1400, .len = 0x1e0,
> >> -    .features = BIT(DPU_CTL_ACTIVE_CFG),
> >> +    .features = CTL_DPU_5_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> >>      },
> >>      {
> >>      .name = "ctl_3", .id = CTL_3,
> >>      .base = 0x1600, .len = 0x1e0,
> >> -    .features = BIT(DPU_CTL_ACTIVE_CFG),
> >> +    .features = CTL_DPU_5_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> >>      },
> >>      {
> >>      .name = "ctl_4", .id = CTL_4,
> >>      .base = 0x1800, .len = 0x1e0,
> >> -    .features = BIT(DPU_CTL_ACTIVE_CFG),
> >> +    .features = CTL_DPU_5_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> >>      },
> >>      {
> >>      .name = "ctl_5", .id = CTL_5,
> >>      .base = 0x1a00, .len = 0x1e0,
> >> -    .features = BIT(DPU_CTL_ACTIVE_CFG),
> >> +    .features = CTL_DPU_5_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
> >>      },
> >>  };
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> >> index fd5df2bdec0e..cffbb6bcc535 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> >> @@ -48,37 +48,37 @@ static const struct dpu_ctl_cfg sm8250_ctl[] = {
> >>      {
> >>      .name = "ctl_0", .id = CTL_0,
> >>      .base = 0x1000, .len = 0x1e0,
> >> -    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> >> +    .features = CTL_DPU_5_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> >>      },
> >>      {
> >>      .name = "ctl_1", .id = CTL_1,
> >>      .base = 0x1200, .len = 0x1e0,
> >> -    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> >> +    .features = CTL_DPU_5_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> >>      },
> >>      {
> >>      .name = "ctl_2", .id = CTL_2,
> >>      .base = 0x1400, .len = 0x1e0,
> >> -    .features = BIT(DPU_CTL_ACTIVE_CFG),
> >> +    .features = CTL_DPU_5_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> >>      },
> >>      {
> >>      .name = "ctl_3", .id = CTL_3,
> >>      .base = 0x1600, .len = 0x1e0,
> >> -    .features = BIT(DPU_CTL_ACTIVE_CFG),
> >> +    .features = CTL_DPU_5_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> >>      },
> >>      {
> >>      .name = "ctl_4", .id = CTL_4,
> >>      .base = 0x1800, .len = 0x1e0,
> >> -    .features = BIT(DPU_CTL_ACTIVE_CFG),
> >> +    .features = CTL_DPU_5_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> >>      },
> >>      {
> >>      .name = "ctl_5", .id = CTL_5,
> >>      .base = 0x1a00, .len = 0x1e0,
> >> -    .features = BIT(DPU_CTL_ACTIVE_CFG),
> >> +    .features = CTL_DPU_5_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
> >>      },
> >>  };
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> >> index 66762a0706de..78f8b2506675 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> >> @@ -40,19 +40,19 @@ static const struct dpu_ctl_cfg sc7180_ctl[] = {
> >>      {
> >>      .name = "ctl_0", .id = CTL_0,
> >>      .base = 0x1000, .len = 0x1dc,
> >> -    .features = BIT(DPU_CTL_ACTIVE_CFG),
> >> +    .features = CTL_DPU_5_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> >>      },
> >>      {
> >>      .name = "ctl_1", .id = CTL_1,
> >>      .base = 0x1200, .len = 0x1dc,
> >> -    .features = BIT(DPU_CTL_ACTIVE_CFG),
> >> +    .features = CTL_DPU_5_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> >>      },
> >>      {
> >>      .name = "ctl_2", .id = CTL_2,
> >>      .base = 0x1400, .len = 0x1dc,
> >> -    .features = BIT(DPU_CTL_ACTIVE_CFG),
> >> +    .features = CTL_DPU_5_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> >>      },
> >>  };
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
> >> index 2849c017ddf2..4f42105d3755 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
> >> @@ -21,7 +21,7 @@ static const struct dpu_ctl_cfg dpu_6_lm1_ctl[] = {
> >>      {
> >>      .name = "ctl_0", .id = CTL_0,
> >>      .base = 0x1000, .len = 0x1dc,
> >> -    .features = BIT(DPU_CTL_ACTIVE_CFG),
> >> +    .features = CTL_DPU_5_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> >>      },
> >>  };
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> >> index 60ad844cfa25..6826758fa202 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> >> @@ -46,37 +46,37 @@ static const struct dpu_ctl_cfg sm8350_ctl[] = {
> >>      {
> >>      .name = "ctl_0", .id = CTL_0,
> >>      .base = 0x15000, .len = 0x1e8,
> >> -    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> >> +    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_7_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> >>      },
> >>      {
> >>      .name = "ctl_1", .id = CTL_1,
> >>      .base = 0x16000, .len = 0x1e8,
> >> -    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> >> +    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_7_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> >>      },
> >>      {
> >>      .name = "ctl_2", .id = CTL_2,
> >>      .base = 0x17000, .len = 0x1e8,
> >> -    .features = CTL_SC7280_MASK,
> >> +    .features = CTL_DPU_7_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> >>      },
> >>      {
> >>      .name = "ctl_3", .id = CTL_3,
> >>      .base = 0x18000, .len = 0x1e8,
> >> -    .features = CTL_SC7280_MASK,
> >> +    .features = CTL_DPU_7_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> >>      },
> >>      {
> >>      .name = "ctl_4", .id = CTL_4,
> >>      .base = 0x19000, .len = 0x1e8,
> >> -    .features = CTL_SC7280_MASK,
> >> +    .features = CTL_DPU_7_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> >>      },
> >>      {
> >>      .name = "ctl_5", .id = CTL_5,
> >>      .base = 0x1a000, .len = 0x1e8,
> >> -    .features = CTL_SC7280_MASK,
> >> +    .features = CTL_DPU_7_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
> >>      },
> >>  };
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >> index 387f2b6c5b56..c5981ea3ec7c 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >> @@ -39,25 +39,25 @@ static const struct dpu_ctl_cfg sc7280_ctl[] = {
> >>      {
> >>      .name = "ctl_0", .id = CTL_0,
> >>      .base = 0x15000, .len = 0x1e8,
> >> -    .features = CTL_SC7280_MASK,
> >> +    .features = CTL_DPU_7_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> >>      },
> >>      {
> >>      .name = "ctl_1", .id = CTL_1,
> >>      .base = 0x16000, .len = 0x1e8,
> >> -    .features = CTL_SC7280_MASK,
> >> +    .features = CTL_DPU_7_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> >>      },
> >>      {
> >>      .name = "ctl_2", .id = CTL_2,
> >>      .base = 0x17000, .len = 0x1e8,
> >> -    .features = CTL_SC7280_MASK,
> >> +    .features = CTL_DPU_7_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> >>      },
> >>      {
> >>      .name = "ctl_3", .id = CTL_3,
> >>      .base = 0x18000, .len = 0x1e8,
> >> -    .features = CTL_SC7280_MASK,
> >> +    .features = CTL_DPU_7_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> >>      },
> >>  };
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
> >> index 80a7b0670467..5c87e919ea22 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
> >> @@ -41,37 +41,37 @@ static const struct dpu_ctl_cfg dpu_8_lm6_ctl[] = {
> >>      {
> >>      .name = "ctl_0", .id = CTL_0,
> >>      .base = 0x15000, .len = 0x204,
> >> -    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> >> +    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_7_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> >>      },
> >>      {
> >>      .name = "ctl_1", .id = CTL_1,
> >>      .base = 0x16000, .len = 0x204,
> >> -    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> >> +    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_7_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> >>      },
> >>      {
> >>      .name = "ctl_2", .id = CTL_2,
> >>      .base = 0x17000, .len = 0x204,
> >> -    .features = CTL_SC7280_MASK,
> >> +    .features = CTL_DPU_7_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> >>      },
> >>      {
> >>      .name = "ctl_3", .id = CTL_3,
> >>      .base = 0x18000, .len = 0x204,
> >> -    .features = CTL_SC7280_MASK,
> >> +    .features = CTL_DPU_7_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> >>      },
> >>      {
> >>      .name = "ctl_4", .id = CTL_4,
> >>      .base = 0x19000, .len = 0x204,
> >> -    .features = CTL_SC7280_MASK,
> >> +    .features = CTL_DPU_7_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> >>      },
> >>      {
> >>      .name = "ctl_5", .id = CTL_5,
> >>      .base = 0x1a000, .len = 0x204,
> >> -    .features = CTL_SC7280_MASK,
> >> +    .features = CTL_DPU_7_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
> >>      },
> >>  };
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> >> index 53db0049eecc..334946c8d4e8 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> >> @@ -48,37 +48,37 @@ static const struct dpu_ctl_cfg sm8550_ctl[] = {
> >>      {
> >>      .name = "ctl_0", .id = CTL_0,
> >>      .base = 0x15000, .len = 0x290,
> >> -    .features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> >> +    .features = CTL_DPU_9_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> >>      },
> >>      {
> >>      .name = "ctl_1", .id = CTL_1,
> >>      .base = 0x16000, .len = 0x290,
> >> -    .features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> >> +    .features = CTL_DPU_9_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> >>      },
> >>      {
> >>      .name = "ctl_2", .id = CTL_2,
> >>      .base = 0x17000, .len = 0x290,
> >> -    .features = CTL_SM8550_MASK,
> >> +    .features = CTL_DPU_9_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> >>      },
> >>      {
> >>      .name = "ctl_3", .id = CTL_3,
> >>      .base = 0x18000, .len = 0x290,
> >> -    .features = CTL_SM8550_MASK,
> >> +    .features = CTL_DPU_9_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> >>      },
> >>      {
> >>      .name = "ctl_4", .id = CTL_4,
> >>      .base = 0x19000, .len = 0x290,
> >> -    .features = CTL_SM8550_MASK,
> >> +    .features = CTL_DPU_9_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> >>      },
> >>      {
> >>      .name = "ctl_5", .id = CTL_5,
> >>      .base = 0x1a000, .len = 0x290,
> >> -    .features = CTL_SM8550_MASK,
> >> +    .features = CTL_DPU_9_MASK,
> >>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
> >>      },
> >>  };
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> index 6b78554df30c..3c604f7b88aa 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> @@ -65,11 +65,15 @@
> >>  #define PINGPONG_SDM845_SPLIT_MASK \
> >>      (PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
> >>
> >> -#define CTL_SC7280_MASK \
> >> -    (BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG))
> >> +#define CTL_DPU_0_MASK  (0)
> >>
> >> -#define CTL_SM8550_MASK \
> >> -    (CTL_SC7280_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
> >> +#define CTL_DPU_5_MASK (CTL_DPU_0_MASK | BIT(DPU_CTL_ACTIVE_CFG))
> >> +
> >> +#define CTL_DPU_7_MASK \
> >> +    (CTL_DPU_5_MASK | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG))
> >> +
> >> +#define CTL_DPU_9_MASK \
> >> +    (CTL_DPU_7_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
> >>
> >>  #define MERGE_3D_SM8150_MASK (0)
> >>



-- 
With best wishes
Dmitry
