Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 065CB517980
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 23:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387637AbiEBV6F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 17:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241907AbiEBV5h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 17:57:37 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 981B86247
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 14:54:03 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id EAE883F64C;
        Mon,  2 May 2022 23:54:00 +0200 (CEST)
Date:   Mon, 2 May 2022 23:53:59 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] drm/msm/dsi: use RMW cycles in dsi_update_dsc_timing
Message-ID: <20220502215359.mnutwxzi2zlo62jb@SoMainline.org>
References: <20220430175533.3817792-1-dmitry.baryshkov@linaro.org>
 <20220430185807.yn2j2coyc77qzx2o@SoMainline.org>
 <02114b24-f954-f145-4918-01cc3def65ac@linaro.org>
 <20220501204102.3xijmadbcrxwyu3x@SoMainline.org>
 <4e308633-cb0d-7050-9ee0-421190683eac@linaro.org>
 <20220502084322.nvj7rnhnemewmil6@SoMainline.org>
 <95ed686e-e80d-6571-050a-afdb7d22ce2d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95ed686e-e80d-6571-050a-afdb7d22ce2d@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-05-02 12:41:37, Dmitry Baryshkov wrote:
> On 02/05/2022 11:43, Marijn Suijten wrote:
> > On 2022-05-02 01:44:20, Dmitry Baryshkov wrote:
> >> [sni[
> >>> In any case, given that you've already sent this patch and another three
> >>> patches [2] fixing/cleaning up the series tells me it's far from ready.
> >>> Most of this should just be handled - or have been handled - in review
> >>> and amended?
> >>
> >> During the review time we agreed that [2] would come as a separate
> >> change It is an API change that would make using panel-bridge easier,
> >> but isn't otherwise required.
> >>
> >> I have been working towards more logical drm_bridge/drm_bridge_connector
> >> chains employing panel-bridge and display-connector where required, [2]
> >> is a part of that effort (as well as few other patches that hit
> >> dri-devel in the last few days).
> >
> > I understand what is going on now.  Since the DSC patches have already
> > been queued up in the 5.19 pull I won't hurry to review them; rather
> > will go over them when time allows me to play with the many phones here
> > that require DSC for the screen to work.  I've been told the series
> > didn't result in positive screen output way back in its infancy, but
> > I'll re-evaluate and send fixes or improvements if/when necessary.
>
> Sure, thank you!
>
> They work on Pixel3 (sdm845, non-active CTLs, no ping-pong binding to
> intf). I still didn't have time to test them on P4 (sm8150, active CTLs,
> PPs bound to the intf in runtime).

The devices mentioned above were all recent SoCs with active CTLs.  My
ping-pong binding to intf patch recently "fixed" sm6125 (non-DSC) but
I have been told it didn't make a difference on the more powerful SoCs
(sm8[123]50) with DSC panels.  There might indeed be a problem with
either active CTLs and CMDmode in general (we still have patches in the
works that move PP features to the INTF block) or DSC + actice CTL, or
both.  To be continued...

- Marijn
