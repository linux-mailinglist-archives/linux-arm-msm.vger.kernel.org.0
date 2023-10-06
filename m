Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89E487BBD82
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Oct 2023 19:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232851AbjJFRPk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Oct 2023 13:15:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232198AbjJFRPj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Oct 2023 13:15:39 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8867BF
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Oct 2023 10:15:38 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5a21ea6baccso29395127b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Oct 2023 10:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696612538; x=1697217338; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DgysTirqmULG/J429nwx5y0fkZ/uHjK7hUfCCLd/fc0=;
        b=zgnXL/UZHTGzNDtKMqPufhWPTjzZbRp8lmEYMVKsOjM1xF8NKE3Ez6sW8qOMU4ITRr
         FCd7f/sF2Qp/M04Wrd0Yar0khF7e4vhBhAXRJIb5OO9nYXgkJoheEwTYXSezx4e43XPO
         iOGOmkHZI6YkvVNcCvaraMd4CyxDKrtE/V6EZEC2b6W7NdBtkfP9SDAZb0YGWJfwfiPe
         PbN8deWJSa8I5tCAo3ibtsrGVgbQnnRbfMPwqdqOUcLiDQ0DrbBZN8s/d2Ko+9mDOn1t
         kjoc1z5ZIh6JmcV0m1xpcBpgQcl1OvJvYb5vcLQyGQQc27lN2zKJLQVvnPRxs7san4s4
         TMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696612538; x=1697217338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DgysTirqmULG/J429nwx5y0fkZ/uHjK7hUfCCLd/fc0=;
        b=IFwK1NV4xRUOn2lY9ZkRe49hhPLtOyb982HN2IdUmup+G3DldCW4pBTw1JgDw+JkFy
         E+wCEB085zFP/0/4zJdOzdhZA35ggI21hx2eFa3lZRE595bgPTPFapTKUBvMn6+U7SEn
         1+G0SHPDyv6UvIh3UvoDYwa7UAkqrM4geElterFebYVuYRQCQyVZmBgI8+y7zFs6v5Ej
         tkw6DslzNQK9rz0gcuDNW1dHzO3ZFyYMjY0rprXw7wqJhC58b+V0I2qcTIm4LVtN/i8r
         0tMiCDCnLLwaZfVit8oZc63LGqEHEha5WU7DiiE0JKuK1Hz3/gNC7UT95vz7ePNnPngw
         ZjFg==
X-Gm-Message-State: AOJu0YyC8x5S9iWsmdR9XYblNPqDK/VKgoxn6QZg6Kev3BM02h1qsA8B
        9rBEZbIANE8GxhDVuRj/ERg438ULC7eHtv03SVQdaA==
X-Google-Smtp-Source: AGHT+IEKS/WdshJVLzFYtfc+kTkKycORuNFX2eq0C2F534RbLGQrBtGUUIf2RHNfP7s3/ACwciMLZLlk6De/E4lepuc=
X-Received: by 2002:a05:690c:2908:b0:5a5:7ea:5d0e with SMTP id
 eg8-20020a05690c290800b005a507ea5d0emr5903018ywb.2.1696612537776; Fri, 06 Oct
 2023 10:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230923214912.1095024-1-dmitry.baryshkov@linaro.org>
 <5711857.DvuYhMxLoT@z3ntu.xyz> <019e66c4-8188-4fbb-b169-d2cec165c91b@linaro.org>
 <12295796.O9o76ZdvQC@z3ntu.xyz>
In-Reply-To: <12295796.O9o76ZdvQC@z3ntu.xyz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 6 Oct 2023 20:15:26 +0300
Message-ID: <CAA8EJpq2i+Ha33jPdCdHmi1jBFz+LzCia_bw-cDj8BsyrvSx8A@mail.gmail.com>
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
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 6 Oct 2023 at 19:26, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> On Freitag, 6. Oktober 2023 15:38:51 CEST Dmitry Baryshkov wrote:
> > On 29/09/2023 23:52, Luca Weiss wrote:
> > > On Samstag, 23. September 2023 23:49:10 CEST Dmitry Baryshkov wrote:
> > >> Experimental support for MSM8953, which has MDP5 v1.16. It looks like
> > >> trimmed down version of MSM8996. Less SSPP, LM and PP blocks. No DSC,
> > >> etc.
> > >
> > > Hi Dmitry,
> > >
> > > As written on IRC, on sdm632-fairphone-fp3 with this DPU patches the
> > > screen is initializing and displaying stuff :) But there's some errors,
> > > which presumably are the reason that the screen is only updating a few
> > > times per second.
> > >
> > > [   22.774205] [drm:dpu_kms_hw_init:1164] dpu hardware revision:0x10100000
> > > [   23.099806] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:657] [dpu
> > > error]enc31 intf1 ctl start interrupt wait failed [   23.099821]
> > > [drm:dpu_kms_wait_for_commit_done:495] [dpu error]wait for commit done
> > > returned -22
> > >
> > > These messages appear about 13 times per second but as I mentioned, the
> > > screen *is* updating (slowly) there.
> >
> > For my understanding, does it work with the MDP5 driver?
>
> Not perfectly, but it does work. What I mean is that the panel is running at
> 30Hz (shown e.g. with kmscube) instead of the 60Hz it should run at.

Interesting. If you have register dumps, it might be interesting to
compare them.
For DPU you can get them from debugfs/dri/0/kms. For MDP5 it is
necessary to hook snapshotting first. The patch will be appreciated
though ;-)

Also, the CTL timeouts look familiar to what we saw on the FP while
hacking it. I can suppose that it is a generic issue, just manifesting
more visibly on the older platforms.

>
> One of the comments I got is that mdp5 is essentially unmaintained so I should
> try DPU ;)

I'd say, it is mostly in the fixes-only mode.

> Also I can ask someone with a video-mode panel to test, maybe it works better
> there. At least good to have more data points?

Yes, please. Testing video panels would prove that the whole pipeline
is working and we have only CMD-related issues.

>
> Regards
> Luca
>
> >
> > > Also you for sure forgot to add "qcom,msm8953-mdp5" to the
> > > msm_mdp5_dpu_migration list, without this DPU is never even considered for
> > > 8953.


-- 
With best wishes
Dmitry
