Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC8D765CBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 22:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232135AbjG0UAE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 16:00:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232371AbjG0UAB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 16:00:01 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36CBD30EB
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 12:59:43 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B19A63F1EB;
        Thu, 27 Jul 2023 21:59:40 +0200 (CEST)
Date:   Thu, 27 Jul 2023 21:59:39 +0200
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
Subject: Re: [PATCH v2 3/4] drm/msm/dpu: add helper to get IRQ-related data
Message-ID: <zpzboxlhbsfw7kz5zkthzeuitwvnq4wwbziedgmpuqaghofuag@acg5r76x5vvq>
References: <20230727150455.1489575-1-dmitry.baryshkov@linaro.org>
 <20230727150455.1489575-4-dmitry.baryshkov@linaro.org>
 <hdenbea53reesjrin4szoq64ja63ryjznsllvmicuzdftmk5u7@lows7neacgm2>
 <7b7e0a8a-392c-19c3-6642-7479c28d4ed8@linaro.org>
 <zilvhfz4qgvnz4thp6wlbg6al7hahen2gw2k5el5o6pi2ysxb6@qhwzla4zmze5>
 <2e20d0ac-0fb5-3f33-910c-438d34d8109e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e20d0ac-0fb5-3f33-910c-438d34d8109e@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-07-27 22:51:32, Dmitry Baryshkov wrote:
> On 27/07/2023 22:41, Marijn Suijten wrote:
> > On 2023-07-27 22:34:59, Dmitry Baryshkov wrote:
> >> On 27/07/2023 22:29, Marijn Suijten wrote:
> >>> On 2023-07-27 18:04:54, Dmitry Baryshkov wrote:
> >>>> In preparation to reworking the IRQ indices, move irq_tbl access to
> >>>> separate helper.
> >>>
> >>> I am not seeing the advantage of the helper, but making every function
> >>> look up dpu_kms->hw_intr->irq_tbl[irq_idx] only once and storing that in
> >>> a local dpu_hw_intr_entry pointer is much tidier.
> >>
> >> There was a bonus point when I tried to do a irq_idx-1 in the next
> >> patch. But since that code has gone, maybe I can drop this patch too.
> > 
> > Don't drop the whole patch though.  While maybe not necessary, having
> > the lookup only once is much easier to follow.
> 
> Then it's easier to keep it as is.

While reviewing patch 4/4 though, the -1 might be missing after all.
You still allocate "nirq = total_irqs" spots in the table, but then
allow any number 0 < irq_idx <= total_irqs.  Indexing irq_idx ==
total_irqs would be out of bounds?

- Marijn

<snip>
