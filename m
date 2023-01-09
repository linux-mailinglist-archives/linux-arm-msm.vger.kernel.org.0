Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3344F66215F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 10:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234827AbjAIJYn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 04:24:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236801AbjAIJYF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 04:24:05 -0500
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 032ABEA3
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 01:22:54 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-4c7d35b37e2so48905437b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 01:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AHuKxKGiZd4+RCaj+Vge0k5qlq7ILtvQRLFdU3PXM68=;
        b=aqnQr+w/cnvm6qQo32nFgvHm7mAD/6PZy5zTDke2X1ThQrMX9Y71SRXB2PQuKOq+Ch
         D8tK4/K5uMrDOhsxsmQq9Ykhmm7vSGO7IS3LrW6vmQhk7x6uxcjhW2oU3xVytZaSIn3A
         Dzlkubi0szkiPWBi0hcsdqtT3LlCaQUKg03vdBrW66ucICrTJqHCTp2dqmqXSJx73La9
         mFkExzjXdwjAzR7lITTiNoyOiO942Y6QXub8sgnX18UKNufUE2TLTgfS4B5eChlxjnmG
         NjKfzWlWLdOPPAZigfNUQjqwHa9BkXEjkcwCUFFc5t07GWolYlakWBa9X9ypwGap44mf
         eSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AHuKxKGiZd4+RCaj+Vge0k5qlq7ILtvQRLFdU3PXM68=;
        b=HwzL67Ozun8SaHrBZNDQ6SRhEqPpmLlQFpn4lrNZ7nm+rO/qauuZm+acq+5npgoHIB
         zhzThDLZ9yK3IHWlmT5nxB1il5YpMYaVo7afZRPeeTtm1bj8jWNdAZIlq6i6UzbFRx3e
         grNHVaDppEaE8utRcnSk4/51/FuFYe/7BZkZ9fGEDvQBqH7TgCLQnVqpvzV6gy+0HhDP
         POtRQBhWdsOE1bw7AukEdSAdagzxx1jZ2l/cNaXL6OYG1yMGwlDjqjBzk0NL6UQo2235
         EiGK6qKqFq3hKoFCij5LiYGkb+QrQDMZriLAi6O1a3Obx/I0CCV7pNqjjAT8VdPb2HCt
         M3MA==
X-Gm-Message-State: AFqh2kqESZ4v1+Abnud8bG6uySY1XzfcukeVEFKQvtyd5fu0guMjLjM+
        d84AvBlSQnEGZSXqU5QFZeIYcIcP0/2SylENNXmjJg==
X-Google-Smtp-Source: AMrXdXt5UN1RutCZmrib8fF4cHaCArti0sLkNxLMJeoqmMJy3AztKyKrFV9yJgZB8ncMa7vxTjCN0W/DI7vHho/Hn6E=
X-Received: by 2002:a81:c56:0:b0:490:89c3:21b0 with SMTP id
 83-20020a810c56000000b0049089c321b0mr5440340ywm.132.1673256173194; Mon, 09
 Jan 2023 01:22:53 -0800 (PST)
MIME-Version: 1.0
References: <20230108211113.200846-1-dmitry.baryshkov@linaro.org> <20230109083417.5drdfllpm4ythy42@SoMainline.org>
In-Reply-To: <20230109083417.5drdfllpm4ythy42@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 9 Jan 2023 11:22:42 +0200
Message-ID: <CAA8EJpoVC2OW4iKcq=C-D3hejVPZ1Bd+6Nb9vPk6DVVWP2_4rQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: sort entries in the HW catalog
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
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

On Mon, 9 Jan 2023 at 10:34, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-01-08 23:11:13, Dmitry Baryshkov wrote:
> > Different entries into the catalog were added quite randomly. Enforce
> > the sorting order of some kind. It is not alphabetic to prevent the
> > patch from growing uncontrollably.
>
> Why not sort these chronologically based on DPU hardware revision in the
> match table at the end of this file?

If we keep the SoC name as part of the symbolic name, we will end up
in another semi-random order that is a pain to verify. Would you
remember that sm6350 comes between sm6115 and qcm2290? I would not :-(
And changing all names to dpu_6_5_0_lms would make it easy to add but
nearly impossible to follow.

> Regardless, this patch is going to
> make it hard to properly rebase DPU additions; see for example patch 4/8
> and 5/8 in my second round of DSC fixes.

Yes, quite unfortunate. As I wrote, it's already late to apply this patch :-(

>
> At the same time we should find a solution to the wishy-washy reuse of
> structs and defines, which may appear the same initially but become
> mismatched as more features are added (see how I had to split out
> multiple of these in the INTF TE enablement series).

It's a slightly different problem, but yes, I share the pain.

>
> > Thus SDM comes before SC and SM
> > platforms and QCM is kept as the last one. There are no functional
> > changes in this patch.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >
> > Yes, I hate such mass-moves too. However the entries in this file are
> > slowly becoming uncontrollable. Let's enforce some order now (while it's
> > late already, but not _that_ late).
>
> I agree that something should happen, contributing to this file is
> unnecessarily tough.

In the IRC conversation Rob suggested playing with includes, but I
don't see a good way to implement that.


--
With best wishes
Dmitry
