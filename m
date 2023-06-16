Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08519733C8C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jun 2023 00:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbjFPWoK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 18:44:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232981AbjFPWoI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 18:44:08 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 095553AB8
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 15:44:03 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 9E1032147A;
        Sat, 17 Jun 2023 00:44:01 +0200 (CEST)
Date:   Sat, 17 Jun 2023 00:44:00 +0200
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
Subject: Re: [PATCH v3 04/19] drm/msm/dpu: drop dpu_mdss_cfg::mdp_count field
Message-ID: <5jevnbocflm3tzyensi5uex4umptyy3wsbjbercm3vodqxx3md@jnbi7g5oyys6>
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
 <20230616100317.500687-5-dmitry.baryshkov@linaro.org>
 <gnffmawpcboaxxlpfictfkcqozppzpzaofqu5e75youwicltdz@acpdxcu73k7b>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gnffmawpcboaxxlpfictfkcqozppzpzaofqu5e75youwicltdz@acpdxcu73k7b>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-17 00:41:40, Marijn Suijten wrote:
<snip>
> > -	cfg = _top_offset(idx, m, addr, &mdp->hw);
> > -	if (IS_ERR_OR_NULL(cfg)) {
> > -		kfree(mdp);
> > -		return ERR_PTR(-EINVAL);
> > -	}
> > +	mdp->hw.blk_addr = addr + m->mdp->base;
> > +	mdp->hw.log_mask = DPU_DBG_MASK_TOP;
> 
> You lost the assignment of m->mdp to the local cfg variable, causing
> mdp->caps = cfg; below to remain NULL.

To solve that in a clean way, you might as well pass `const struct
dpu_mdp_cfg *cfg` directly from dpu_kms.c into dpu_hw_mdptop_init, as I
did for the other HW blocks in "Pass catalog pointers in RM to replace
for-loop ID lookups".

- Marijn
