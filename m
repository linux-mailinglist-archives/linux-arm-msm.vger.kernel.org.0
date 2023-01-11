Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7B80666643
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 23:33:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbjAKWdL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 17:33:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232580AbjAKWdK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 17:33:10 -0500
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B40D120B9
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 14:33:08 -0800 (PST)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 7731D3EEF4;
        Wed, 11 Jan 2023 23:33:06 +0100 (CET)
Date:   Wed, 11 Jan 2023 23:33:05 +0100
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
Subject: Re: [PATCH] drm/msm/dpu: sort entries in the HW catalog
Message-ID: <20230111223305.hrullhtvtpkrxgfq@SoMainline.org>
References: <20230108211113.200846-1-dmitry.baryshkov@linaro.org>
 <20230109083417.5drdfllpm4ythy42@SoMainline.org>
 <CAA8EJpoVC2OW4iKcq=C-D3hejVPZ1Bd+6Nb9vPk6DVVWP2_4rQ@mail.gmail.com>
 <20230109171052.wa43fccjh3f6wype@SoMainline.org>
 <91254914-39a1-d11c-5e53-b35448253e22@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91254914-39a1-d11c-5e53-b35448253e22@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-01-09 20:30:01, Dmitry Baryshkov wrote:
<snip>
> The usual problem is that there are two dimensions: with each 
> generations there are new (and removed) features, but on the other hand 
> within each generation there are units that are feature-rich and the 
> ones that are feature-deprived. qcm2290, sm6115, etc.

Yes, in that case (as we currently already do) have to duplicate an
existing struct and give one of the two a new feature bit.

> >>>> Thus SDM comes before SC and SM
> >>>> platforms and QCM is kept as the last one. There are no functional
> >>>> changes in this patch.
> >>>>
> >>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>> ---
> >>>>
> >>>> Yes, I hate such mass-moves too. However the entries in this file are
> >>>> slowly becoming uncontrollable. Let's enforce some order now (while it's
> >>>> late already, but not _that_ late).
> >>>
> >>> I agree that something should happen, contributing to this file is
> >>> unnecessarily tough.
> >>
> >> In the IRC conversation Rob suggested playing with includes, but I
> >> don't see a good way to implement that.
> > 
> > That would be nice; especially if we accept struct duplication (instead
> > of recursively including "earlier" versions where needed, as mentioned
> > in IRC that'll spiral out of control).  With that one can easily diff
> > two include files and understand the differences between SoCs and/or DPU
> > hardware revisions (or notice whether a certain configuration might be
> > missing/extraneous).
> 
> Let's see what kind of binary growth does it bring. In the end it well 
> might be that the compiler is smart enough.

Curious as well, it might overlap identical structs (identical byte
sequence) similar to string interning?

- Marijn
