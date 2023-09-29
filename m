Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66FFD7B3BF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Sep 2023 23:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbjI2V1G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Sep 2023 17:27:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjI2V1F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Sep 2023 17:27:05 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2A151AB
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 14:27:03 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5a2536adaf3so3457437b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 14:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696022823; x=1696627623; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KyO5YdXbOQnT5NUL8KE5RypLcV3p9aKnClGrB6+EVrQ=;
        b=R77NRPi+QyAqCn2rj8s3SjWyQ9eddtOvC747wGq5z8k+gZucjP3Nbioy9v2x/m6ls0
         JuT7RWmFCyuDuWOLRFM1/bzzp6XhO0tSwGy+tYV90gbft/DQoMaaUD68ywPh5Wq1+zPE
         Bryy9sXusNF09hlFsoSUErepTOpp4xL48MuEeXI+k4VtzjpIDbKq/Vg//fs5A0z5UvH5
         1JZPtJ/dQ1D+78XLP+dF79dd8Fzya0yRXGiwmZDuj7KB9fUKbVkAk8Ax8+RVqOJpyVZ8
         SUVOnJeLdNJJESoB+hIZ79YGHC2C6ojV5dzGIoBBreXUN5EXUBb1gjOqZqv7lb3rjYUF
         YNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696022823; x=1696627623;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KyO5YdXbOQnT5NUL8KE5RypLcV3p9aKnClGrB6+EVrQ=;
        b=V5DPBhyy08QuN7BSM1gtGjEMfvIOXMFjJsKhO67B1dnFNl9LqFWNpUmoXt9a72fwA8
         KCs7Fg7QmFL/TUebP4b/eH8yuEChRg/EwS++2aWl2B068uBrOqrUaTraSdbPzgsNsUd1
         KeL6UIrAyaxW/iNXV2MEY4PfSFDyldhdI4gx4Dtu2ofg7CATmI+PrduTR113ukLShIdW
         JP+V5Q9IUPd3qfM6qxNzf3qbd9i9atQqSdvBNAulKMStgS3E4us/BbBmQZtViqm2khIB
         SvMhwxgEdTojtbXZ69qV5Atl5orzNFSkt3xXI7UgtCz64lArR020VovnHNcuIvtnzBs1
         r07Q==
X-Gm-Message-State: AOJu0Yy4Xdz7na7mKa+L/bbDqq7V7y/cBxw+0y/2YMi3E2HS4pQBPeKT
        cyCn0VIr1mZPpwgegeuJ3fX9RZwqlhF4REX6tpYshA==
X-Google-Smtp-Source: AGHT+IEnJhcZf0E4NuAEZiI6Q/aukTwmvALGSr0FGxjLseNJGx8SqY5OUcj+mlsTT3G9JqD6pThykj8Ub6nQffD9YAU=
X-Received: by 2002:a0d:d84f:0:b0:59b:51d9:1d6e with SMTP id
 a76-20020a0dd84f000000b0059b51d91d6emr5888082ywe.6.1696022822889; Fri, 29 Sep
 2023 14:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230923214912.1095024-1-dmitry.baryshkov@linaro.org>
 <20230923214912.1095024-2-dmitry.baryshkov@linaro.org> <5711857.DvuYhMxLoT@z3ntu.xyz>
In-Reply-To: <5711857.DvuYhMxLoT@z3ntu.xyz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 30 Sep 2023 00:26:51 +0300
Message-ID: <CAA8EJpoq=6=__uGeQ2UhTn4+iqMY-p=XP3M6SdOWxoxChf=x5g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] drm/msm/dpu: add support for MSM8953
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 29 Sept 2023 at 23:53, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> On Samstag, 23. September 2023 23:49:10 CEST Dmitry Baryshkov wrote:
> > Experimental support for MSM8953, which has MDP5 v1.16. It looks like
> > trimmed down version of MSM8996. Less SSPP, LM and PP blocks. No DSC,
> > etc.
> >
>
> Hi Dmitry,
>
> As written on IRC, on sdm632-fairphone-fp3 with this DPU patches the screen is
> initializing and displaying stuff :) But there's some errors, which presumably
> are the reason that the screen is only updating a few times per second.
>
> [   22.774205] [drm:dpu_kms_hw_init:1164] dpu hardware revision:0x10100000
> [   23.099806] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:657] [dpu error]enc31 intf1 ctl start interrupt wait failed
> [   23.099821] [drm:dpu_kms_wait_for_commit_done:495] [dpu error]wait for commit done returned -22
>
> These messages appear about 13 times per second but as I mentioned, the screen
> *is* updating (slowly) there.

Thank you for the testing, I'll see if I can determine what is causing
the ctl start issue.

>
> Also you for sure forgot to add "qcom,msm8953-mdp5" to the
> msm_mdp5_dpu_migration list, without this DPU is never even considered for
> 8953.

Yep.

>
> Regards
> Luca


-- 
With best wishes
Dmitry
