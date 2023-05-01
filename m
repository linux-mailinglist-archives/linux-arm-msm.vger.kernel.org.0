Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB3306F3A69
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 00:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232772AbjEAW01 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 18:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbjEAW00 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 18:26:26 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE83C26BC
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 15:26:25 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 12DEA40E5C;
        Tue,  2 May 2023 00:26:24 +0200 (CEST)
Date:   Tue, 2 May 2023 00:26:22 +0200
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
Subject: Re: [PATCH 2/4] drm/msm/dpu: remove futile checks from dpu_rm_init()
Message-ID: <lsa7gmhanmh67nyjsidqcw3zulfohwjzfbiv573a2lqhmdioif@xnzaka44jcxb>
References: <20230430203556.3184252-1-dmitry.baryshkov@linaro.org>
 <20230430203556.3184252-3-dmitry.baryshkov@linaro.org>
 <vciwnimlyzezirun3pnyqtyro3x7n5gb46egisyzbouejjas7b@ssbgx2oabw7o>
 <26774a3d-5a4a-727c-0a63-2550eeea4c71@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26774a3d-5a4a-727c-0a63-2550eeea4c71@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-02 01:15:24, Dmitry Baryshkov wrote:
> On 02/05/2023 01:13, Marijn Suijten wrote:
> > On 2023-04-30 23:35:54, Dmitry Baryshkov wrote:
> >> dpu_rm_init() contains checks for block->id values. These were logical
> >> in the vendor driver, when one can not be sure which values were passed
> >> from DT. In the upstream driver this is not necessary: the catalog is a
> >> part of the driver, we control specified IDs.
> >>
> >> Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > I was going to send this on top of [1] to prevent conflicts, but it
> > seems you beat me to it and also based it on top of that series, though
> > without mentioning the dependency in the cover letter.
> 
> I hoped that you'd include such a change into the mentioned series. But 
> after waiting for some time I went and sent this out, as I was not sure 
> about your intentions and time budget.

I intended to send it as a separate series to not clobber the others,
but it does result in yet another dependency that becomes harder and
harder to keep track of as all those series get amended and resent
repeatedly.  The linked series' v3 wasn't a week old yet :)

- Marijn

> 
> > 
> > [1]: https://lore.kernel.org/linux-arm-msm/20230418-dpu-drop-useless-for-lookup-v3-3-e8d869eea455@somainline.org/
> > 
> > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
