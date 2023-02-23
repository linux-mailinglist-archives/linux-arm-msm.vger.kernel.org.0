Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B2DA6A1294
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Feb 2023 23:08:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjBWWIe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Feb 2023 17:08:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbjBWWId (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Feb 2023 17:08:33 -0500
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 413AF55067
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 14:08:32 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5384ff97993so99604767b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 14:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+SaVKP+/XLlHsLjrag6nTcMYrxHOJQ41XIx7TQxsVBY=;
        b=uGQ2a1f572SK48drYihA/U0L8Y9fp0CJ05qulMZWyfWMo02f1Kv7dGu/4+aMxLMU8H
         9w7T1SZzXys8jI/LjgVuMDuNYNuhp8umr6ardfbgR4ktIA0LguLU8QXSeT4VVDIBQq/3
         y3RJoVKfhbgc2gbNuhBT1MU6pWqp1g4cc4JEFUp1JkCinNA9qRQogBkzULNeyC3iWi0G
         V7/J96Xr3pY97L2GRfL9yyiVplw6SpagpAW0RTqEYWtdfDg3TvJzyAs/dD1jzibsI6bm
         MHlXEsgnu0y79btmuXlxLEfW9RBBaYpUZBdorAQSSgYoFZdpFM8Jna6ZbkaKprGCZ5Ve
         gzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+SaVKP+/XLlHsLjrag6nTcMYrxHOJQ41XIx7TQxsVBY=;
        b=fp2+2ELdIZR59OrXNkLY1tWASsQmxUHe1eiCgELJmszDYZ9/g74BbC+5jMwmqYfLcx
         e4Xn5rB7GMomJauKYYWlLUtoBeCPJif/PnFpxYMP+9qxLCiNgxt9asrfH8ycjHjUZdzL
         23H0W6Zoqd1NdQt1v3G0HNZPB4ek2lfcYSsy20J9C8Sgm2qDftQPWRwSWcbawmtzCRsq
         /iYMjTdahlgXJgmxAgDKrmS6J0HDWKtS1hVtwc32iCbuVKD1y4MBaiXaUHWg7D+gcb6T
         C1GigG4ZRuMfNOGeYRbYN0OHUfHbI6qTSiLdKx6IAIHXkpJa8Q6ysz0W4Clx2mmKex5D
         RP6w==
X-Gm-Message-State: AO0yUKUr5hYg3Rvz5dSCw/2bnfj0DQY3tLWjS3iBgxLMcRywUC4gjM98
        nyGEKuOcE80CFxMdxFhqIsp0KXXaES/P/rVxBFo31Q==
X-Google-Smtp-Source: AK7set9r6NqoWfPpPMHdexTClyOAHkELfPTNqXeky4HIeF78rYQJUxzAZNIS8K1/PghN+TPyEkhpo/BYZ8OuDgD3+b8=
X-Received: by 2002:a81:b660:0:b0:533:9ffb:cb13 with SMTP id
 h32-20020a81b660000000b005339ffbcb13mr3215908ywk.3.1677190111389; Thu, 23 Feb
 2023 14:08:31 -0800 (PST)
MIME-Version: 1.0
References: <20230223095708.3688148-1-dmitry.baryshkov@linaro.org> <0daf8821-a228-1180-358b-4e50f36ca4b0@quicinc.com>
In-Reply-To: <0daf8821-a228-1180-358b-4e50f36ca4b0@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 24 Feb 2023 00:08:20 +0200
Message-ID: <CAA8EJpqz-XhpEgSLTsS_ddo95y7nYmTvgop4Hj845PLbwHGmnw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: fix stack smashing in dpu_hw_ctl_setup_blendstage
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Abhinav,

On Thu, 23 Feb 2023 at 21:17, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Hi Dmitry
>
> On 2/23/2023 1:57 AM, Dmitry Baryshkov wrote:
> > The rewritten dpu_hw_ctl_setup_blendstage() can lightly smash the stack
> > when setting the SSPP_NONE pipe. However it was unnoticed until the
> > kernel was tested under AOSP (with some kind of stack protection/check).
> >
> > This fixes the following backtrace:
> >
> > Unexpected kernel BRK exception at EL1
> > Internal error: BRK handler: 00000000f20003e8 [#1] PREEMPT SMP
> > Hardware name: Thundercomm Dragonboard 845c (DT)
> > pstate: a0400005 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > pc : dpu_hw_ctl_setup_blendstage+0x26c/0x278 [msm]
> > lr : _dpu_crtc_blend_setup+0x4b4/0x5a0 [msm]
> > sp : ffffffc00bdcb720
> > x29: ffffffc00bdcb720 x28: ffffff8085debac0 x27: 0000000000000002
> > x26: ffffffd74af18320 x25: ffffff8083af75a0 x24: ffffffc00bdcb878
> > x23: 0000000000000001 x22: 0000000000000000 x21: ffffff8085a70000
> > x20: ffffff8083012dc0 x19: 0000000000000001 x18: 0000000000000000
> > x17: 000000040044ffff x16: 045000f4b5593519 x15: 0000000000000000
> > x14: 000000000000000b x13: 0000000000000001 x12: 0000000000000000
> > x11: 0000000000000001 x10: ffffffc00bdcb764 x9 : ffffffd74af06a08
> > x8 : 0000000000000001 x7 : 0000000000000001 x6 : 0000000000000000
> > x5 : ffffffc00bdcb878 x4 : 0000000000000002 x3 : ffffffffffffffff
> > x2 : ffffffc00bdcb878 x1 : 0000000000000000 x0 : 0000000000000002
> > Call trace:
> >   dpu_hw_ctl_setup_blendstage+0x26c/0x278 [msm]
> >   _dpu_crtc_blend_setup+0x4b4/0x5a0 [msm]
> >   dpu_crtc_atomic_begin+0xd8/0x22c [msm]
> >   drm_atomic_helper_commit_planes+0x80/0x208 [drm_kms_helper]
> >   msm_atomic_commit_tail+0x134/0x6f0 [msm]
> >   commit_tail+0xa4/0x1a4 [drm_kms_helper]
> >   drm_atomic_helper_commit+0x170/0x184 [drm_kms_helper]
> >   drm_atomic_commit+0xac/0xe8
> >   drm_mode_atomic_ioctl+0xbf0/0xdac
> >   drm_ioctl_kernel+0xc4/0x178
> >   drm_ioctl+0x2c8/0x608
> >   __arm64_sys_ioctl+0xa8/0xec
> >   invoke_syscall+0x44/0x104
> >   el0_svc_common.constprop.0+0x44/0xec
> >   do_el0_svc+0x38/0x98
> >   el0_svc+0x2c/0xb4
> >   el0t_64_sync_handler+0xb8/0xbc
> >   el0t_64_sync+0x1a0/0x1a4
> > Code: 52800016 52800017 52800018 17ffffc7 (d4207d00)
> >
> > Fixes: 4488f71f6373 ("drm/msm/dpu: simplify blend configuration")
> > Reported-by: Amit Pundir <amit.pundir@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > index b88a2f3724e6..6c53ea560ffa 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > @@ -446,7 +446,9 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
> >                        * CTL_LAYER has 3-bit field (and extra bits in EXT register),
> >                        * all EXT registers has 4-bit fields.
> >                        */
> > -                     if (cfg->idx == 0) {
> > +                     if (cfg->idx == -1) {
> > +                             continue;
> > +                     } else if (cfg->idx == 0) {
> >                               mixercfg[0] |= mix << cfg->shift;
> >                               mixercfg[1] |= ext << cfg->ext_shift;
> >                       } else {
>
> Since I had not reviewed the change which introduced this, had a question.
>
> The issue here is because the shift and ext_shift are -1 for NONE and
> hence the shift causes overflow?
>
> If that was the issue shouldnt we protect all such cases?

This change protects all the cases.

> So lets say we use SSPP_RGB0, the multirect_index for it will always be
> -1 as it doesnt support smartDMA. What prevents the same issue from
> hitting in that case? Because you are only checking for idx and not the
> shifts.

Because for the RGB0 / rect-2 the cfg->idx will also be -1 (and
shift/ext_shift will be 0).


-- 
With best wishes
Dmitry
