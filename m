Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0044960420D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Oct 2022 12:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232747AbiJSKw7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Oct 2022 06:52:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233393AbiJSKwm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Oct 2022 06:52:42 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9082B78594
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 03:23:58 -0700 (PDT)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl [94.209.172.39])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 3BF2A3F34E;
        Wed, 19 Oct 2022 11:13:42 +0200 (CEST)
Date:   Wed, 19 Oct 2022 11:13:41 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [RFC PATCH] drm/msm: lookup the ICC paths in both mdp5/dpu and
 mdss devices
Message-ID: <20221019091341.bqkro3zmnojcqvnu@SoMainline.org>
References: <20220805115630.506391-1-dmitry.baryshkov@linaro.org>
 <20220805122406.x7xxywofeaquhfxg@SoMainline.org>
 <9e040bdb-4fc5-3c95-fcea-b6ac7fd8224b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e040bdb-4fc5-3c95-fcea-b6ac7fd8224b@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-08-26 12:16:40, Dmitry Baryshkov wrote:
> On 05/08/2022 15:24, Marijn Suijten wrote:
> > On 2022-08-05 14:56:30, Dmitry Baryshkov wrote:
> >> The commit 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master
> >> components") changed the MDP5 driver to look for the interconnect paths
> >> in the MDSS device rather than in the MDP5 device itself. This was left
> >> unnoticed since on my testing devices the interconnects probably didn't
> >> reach the sync state.
> >>
> >> Rather than just using the MDP5 device for ICC path lookups for the MDP5
> >> devices, introduce an additional helper to check both MDP5/DPU and MDSS
> >> nodes. This will be helpful for the MDP5->DPU conversion, since the
> >> driver will have to check both nodes.
> >>
> >> Fixes: 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master components")
> >> Reported-by: Marijn Suijten <marijn.suijten@somainline.org>
> >> Reported-by: Yassine Oudjana <y.oudjana@protonmail.com>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Tested-by: Marijn Suijten <marijn.suijten@somainline.org> # On sdm630
> > 
> > But I'm not sure about giving my Reviewed-by to this, as I'd rather
> > *correct* the DT bindings for sdm630 and msm8996 to provide
> > interconnects in the MDSS node unless there are strong reasons not to
> > (and I don't consider "backwards compatibility" to be one, this binding
> > "never even existed" if mdp5.txt is to be believed).
> 
> As a kind of a joke, I'd prefer to have interconnects in the mdp/dpu 
> device node. In the end, the interconnects describe the path between the 
> display controller and the DDR, not the path between the whole MDSS and DDR.
> 
> So, for next chipsets I'd vote to move icc to dpu/mdp node (and maybe 
> even move existing inerconnects to the dpu node).

Sure.  In that case, do you want to rework this patch / code again to
only look in the DPU/MDP, and not at MDSS at all?  (Or is that another
DT API break we'd rather not make?)

- Marijn
