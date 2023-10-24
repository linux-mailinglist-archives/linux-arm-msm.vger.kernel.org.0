Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECC287D58B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Oct 2023 18:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234835AbjJXQil (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Oct 2023 12:38:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234798AbjJXQii (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Oct 2023 12:38:38 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64AB9AC
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Oct 2023 09:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
        t=1698165482; bh=HS0k54zTHg6WtLCs7BNdMgMNgcxumhSEX62QFQNOTEM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=b00XZrsfbk1cM8QUAfUr+0yQJ2iJVc8lZ7klBw2+PJ9CuY8pGiiaKAdBYkriQbfzn
         McNhJChktufmk0ZiiA2txkZNCtkzCkZBHAGl3z7Vwo5X9bwiolq3oBM4VbIC2VbSeL
         LSRYBWJI5BP94k9rRL1ibKAO5miN8BQb4OyNmYbk=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [RFC PATCH 1/3] drm/msm/dpu: add support for MSM8953
Date:   Tue, 24 Oct 2023 18:38:01 +0200
Message-ID: <2299479.ElGaqSPkdT@z3ntu.xyz>
In-Reply-To: <CAA8EJpq2i+Ha33jPdCdHmi1jBFz+LzCia_bw-cDj8BsyrvSx8A@mail.gmail.com>
References: <20230923214912.1095024-1-dmitry.baryshkov@linaro.org>
 <12295796.O9o76ZdvQC@z3ntu.xyz>
 <CAA8EJpq2i+Ha33jPdCdHmi1jBFz+LzCia_bw-cDj8BsyrvSx8A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Freitag, 6. Oktober 2023 19:15:26 CEST Dmitry Baryshkov wrote:
> On Fri, 6 Oct 2023 at 19:26, Luca Weiss <luca@z3ntu.xyz> wrote:
> > On Freitag, 6. Oktober 2023 15:38:51 CEST Dmitry Baryshkov wrote:
> > > On 29/09/2023 23:52, Luca Weiss wrote:
> > > > On Samstag, 23. September 2023 23:49:10 CEST Dmitry Baryshkov wrote:
> > > >> Experimental support for MSM8953, which has MDP5 v1.16. It looks like
> > > >> trimmed down version of MSM8996. Less SSPP, LM and PP blocks. No DSC,
> > > >> etc.
> > > > 
> > > > Hi Dmitry,
> > > > 
> > > > As written on IRC, on sdm632-fairphone-fp3 with this DPU patches the
> > > > screen is initializing and displaying stuff :) But there's some
> > > > errors,
> > > > which presumably are the reason that the screen is only updating a few
> > > > times per second.
> > > > 
> > > > [   22.774205] [drm:dpu_kms_hw_init:1164] dpu hardware
> > > > revision:0x10100000
> > > > [   23.099806] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:657] [dpu
> > > > error]enc31 intf1 ctl start interrupt wait failed [   23.099821]
> > > > [drm:dpu_kms_wait_for_commit_done:495] [dpu error]wait for commit done
> > > > returned -22
> > > > 
> > > > These messages appear about 13 times per second but as I mentioned,
> > > > the
> > > > screen *is* updating (slowly) there.
> > > 
> > > For my understanding, does it work with the MDP5 driver?
> > 
> > Not perfectly, but it does work. What I mean is that the panel is running
> > at 30Hz (shown e.g. with kmscube) instead of the 60Hz it should run at.
> Interesting. If you have register dumps, it might be interesting to
> compare them.
> For DPU you can get them from debugfs/dri/0/kms. For MDP5 it is
> necessary to hook snapshotting first. The patch will be appreciated
> though ;-)

Hi Dmitry,

Unfortunately I can't offer anything here, and I definitely have no clue how
I would hook up the snapshotting on mdp5 ;)

> 
> Also, the CTL timeouts look familiar to what we saw on the FP while
> hacking it. I can suppose that it is a generic issue, just manifesting
> more visibly on the older platforms.
> 
> > One of the comments I got is that mdp5 is essentially unmaintained so I
> > should try DPU ;)
> 
> I'd say, it is mostly in the fixes-only mode.
> 
> > Also I can ask someone with a video-mode panel to test, maybe it works
> > better there. At least good to have more data points?
> 
> Yes, please. Testing video panels would prove that the whole pipeline
> is working and we have only CMD-related issues.

So I asked someone with a msm8953 device with video mode panel and they said
it worked :)

There appears to be some messages like this when you power off/on the display

> [  236.302432] msm_dsi 1a94000.dsi: [drm:dsi_cmds2buf_tx [msm]] *ERROR* wait for video done timed out
> [  236.382427] msm_dsi 1a94000.dsi: [drm:dsi_cmds2buf_tx [msm]] *ERROR* wait for video done timed out

But this might be also a panel driver issue or something. But after a bit it
seems to recover and everything's running fine afterwards again.

Apparently with mdp5 e.g. these errors exists also so nothing's flawless.

> [   66.104403] [drm:mdp5_irq_error_handler [msm]] *ERROR* errors: 04000000
> [   77.396452] [drm:mdp5_irq_error_handler [msm]] *ERROR* errors: 04000000
> [   79.941532] [drm:mdp5_irq_error_handler [msm]] *ERROR* errors: 04000000
> [  544.170901] [drm:mdp5_irq_error_handler [msm]] *ERROR* errors: 04000000

But apparently other than that it's running fine.

Another quote:
"and it can wake up just little bit slower"

So generally I'd say it's fine on video mode, just broken in cmd mode - at
least on my panel.

Also in the meantime I've figured out my "panel stuck on 30Hz issue", the
panel driver didn't call mipi_dsi_dcs_set_tear_on so no TE signal was sent
from the panel to the mdss, so some fallback code in Linux was only running
it at 30Hz then.

Regards
Luca

> 
> > Regards
> > Luca
> > 
> > > > Also you for sure forgot to add "qcom,msm8953-mdp5" to the
> > > > msm_mdp5_dpu_migration list, without this DPU is never even considered
> > > > for
> > > > 8953.




