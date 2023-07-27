Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E1B3764E58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 10:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231587AbjG0I6F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 04:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233905AbjG0I5k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 04:57:40 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 170FAAD11
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 01:37:49 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-d0548cf861aso634923276.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 01:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690447062; x=1691051862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pWMWGlQcZrS+qSRQi4fySJuX8GoJmganqqgkAyb3ZRQ=;
        b=paElh1x1Q7WNWaCwsablC8sigHPxSMEmMiI11BuNLqLhV7w37xfsUjukUaFba0G16D
         UsZMOe5WDZbZnHo55478HibTcLSCIA4JmQRxKYvECGAScIpKpeHemO2pGuiCkJg3DCHR
         qr5mVSdBUvWZbrxpO+Mf80etC5PLo9I8CRyQ58nqbq/qA6/0w094/vXgap67wPAMEYsL
         WoN510uEcbg03im1Xm6iVk7uh9/Ii/Qoml+15cY4qmALiKTnnlYu4Arf8JU0uix34eM5
         fUx6ZvgoL+uUolo8QM0UZDrzKv207pTC6ZRBS/d+VwL1DQSDK2WyC+vk1/kxYXG1pPev
         o4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690447062; x=1691051862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pWMWGlQcZrS+qSRQi4fySJuX8GoJmganqqgkAyb3ZRQ=;
        b=EkQLB5etd/6gvqa7WEuef38SDlP3ILEO8ZMjJKSkQ0o1hymQyWcJXziphbaALkImrT
         jWwEqnxxawP0TtLH932BD+k+Qurxhatoa4adTGuL7eMXv0vZth/bF++/g8+n59B04uKg
         paEmeCeoD1ihIw2V95rQv0CCAZkgF6nOtFZ5bO3SPJH2TP4XyVKrWRAPQ0iR6ku5R1TL
         ENDd3jih4CnX4qqPXbA4uCOZUX+7gC5NO4Uw12hc3JMgqh6/X1QF9zln+Ab60umSx7LO
         pSf2Mc/w+qwsmbQmpeA4CZ4vLr3HWC5V6NCgWYr6Ldt7NQDnMKQNLA/lanBGV0GQrHHM
         DeLA==
X-Gm-Message-State: ABy/qLZgdCsiPHqwPzEg6HKQxl+AX4laAYoPIWGtioYgtZj2YTe4NIJh
        mouxMHiBKinvtXu7n1GPmXRgdIrLcqOjh8fTrpDEMw==
X-Google-Smtp-Source: APBJJlF1jpC3f3gk+ztU5YHmd4eGGIE2cxjSaq/QbE6KaSY4NpZgLaWwb5QMQcEbkYY2Ir4qh4wUR49wKLdTYMUHnEE=
X-Received: by 2002:a25:ca07:0:b0:d0a:fbef:1590 with SMTP id
 a7-20020a25ca07000000b00d0afbef1590mr4355706ybg.37.1690447062045; Thu, 27 Jul
 2023 01:37:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
 <20230521171026.4159495-5-dmitry.baryshkov@linaro.org> <61b0792d-aa62-03ea-bb2c-aa9392251519@quicinc.com>
 <CAA8EJpp+uO_BZVQ9A+ZjKe3+b_H=xJc_yCfd8bKSPenU8Mf5FQ@mail.gmail.com> <13784945-8029-9b21-f226-8692e348ec1e@quicinc.com>
In-Reply-To: <13784945-8029-9b21-f226-8692e348ec1e@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 27 Jul 2023 11:37:30 +0300
Message-ID: <CAA8EJpruxo0_BXyJZYGFDBd=rW+KYhywT1z4dPeV+7KTFvX14Q@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/msm/mdss: populate missing data
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
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

On Thu, 27 Jul 2023 at 02:14, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 7/26/2023 3:58 PM, Dmitry Baryshkov wrote:
> > On Thu, 27 Jul 2023 at 01:30, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 5/21/2023 10:10 AM, Dmitry Baryshkov wrote:
> >>> As we are going to use MDSS data for DPU programming, populate missing
> >>> MDSS data. The UBWC 1.0 and no UBWC cases do not require MDSS
> >>> programming, so skip them.
> >>>
> >>
> >> Can you pls point me to the downstream references you used for msm8998?
> >
> > msm-3.18, drivers/video/msm/mdss/mdss_mdp.c
> >
> > See the function mdss_mdp_hw_rev_caps_init(). It sets has_ubwc for MDP
> > 1.07 (msm8996), 1.14 (msm8937) / 1.16  (msm8953) and 3.0 (msm8998).
> >
>
> It sets has_ubwc but I still cannot locate where it says version is 1.0.
> Because the 0x58 register reads 0 and not 1 for msm8998.

What would be the version then? 0.0 sounds strange. I'm yet to check
whether UBWC works on 8996 / 8998.

> >> Was that just taken from catalog? If so I would ask for the reference
> >> for the catalog too.
> >>
> >> As per the register the decoder version is 0x0 and not 1.
> >>
> >> Even encoder version is 0 from what i see and not 1. Thats why a
> >> dec_version of UBWC_1_0 is not doing anything i assume.
> >>


-- 
With best wishes
Dmitry
