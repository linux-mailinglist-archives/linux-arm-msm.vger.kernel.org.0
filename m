Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D190073BFAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 22:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231627AbjFWUcx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 16:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230355AbjFWUcv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 16:32:51 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11B2C2949
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 13:32:30 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 3D4D13F6F7;
        Fri, 23 Jun 2023 22:32:28 +0200 (CEST)
Date:   Fri, 23 Jun 2023 22:32:26 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 17/19] drm/msm/dpu: inline INTF_BLK and
 INTF_BLK_DSI_TE macros
Message-ID: <tonifmpxqvp56mzwf5tzwclwzu7evbmtmtje5uce5ikitj3pbt@m34soh22rhpp>
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
 <20230616100317.500687-18-dmitry.baryshkov@linaro.org>
 <vpuwgjbgfau6fwn3etg3hyoo44yn4n4xo7hzbe3kfir4ih2tgp@rmutsfjobrub>
 <227c2ba0-cfb2-cd88-6506-895e8735d221@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <227c2ba0-cfb2-cd88-6506-895e8735d221@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-17 03:48:33, Dmitry Baryshkov wrote:
> On 17/06/2023 01:12, Marijn Suijten wrote:
> > On 2023-06-16 13:03:15, Dmitry Baryshkov wrote:
> >> To simplify making changes to the hardware block definitions, expand
> >> corresponding macros. This way making all the changes are more obvious
> >> and visible in the source files.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Looks good but I am not sure how much it is worth to review this (versus
> > checking your script and rerunning it to see if I get the same results),
> > considering that there are quite some conflicts with your interrupt
> > rework.  In what order to you intend to land that?
> 
> As I wrote, this series goes in first. Initially I designed them the 
> other way, but intr rework depends on DPU revision changes, while this 
> one doesn't have such dependencies.

Thanks, I'll drop the intr rework from my local "-next" then.  Have been
collecting and testing almost all patches that way thus far, but it's
becoming hairy with so many dependencies.

Will pick it up again once a v2 lands.  Is any review still needed on
the current v1 (or was it RFC)?

- Marijn
