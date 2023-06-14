Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA13B72FB60
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 12:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233227AbjFNKli (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 06:41:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243375AbjFNKlU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 06:41:20 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E14662103
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 03:41:15 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id F35693F5AD;
        Wed, 14 Jun 2023 12:41:13 +0200 (CEST)
Date:   Wed, 14 Jun 2023 12:41:12 +0200
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
Subject: Re: [PATCH 1/2] drm/msm/dpu: drop SSPP register dumpers
Message-ID: <lggetg6sqj5imqcntisfor3tsa32iaaiz7q5imocjbxgcmttt7@j2bzshxrzls2>
References: <20230521172147.4163085-1-dmitry.baryshkov@linaro.org>
 <fihs3di7da5rnvx63n4ums65rer62nps2ber77rojrtwacrgih@3r3aeedfvdr2>
 <kb25ll3emyh6jymyewzpqjtzuw4jekfysruar5pvgxbp37glf2@wf2pqlnhh64m>
 <lsfofftdomumlm4w7nilkez26weckb3wd2rndrpqikwkxtfar4@ryjvbumfetlu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lsfofftdomumlm4w7nilkez26weckb3wd2rndrpqikwkxtfar4@ryjvbumfetlu>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-14 12:39:13, Marijn Suijten wrote:
<snip>
> > > > -	/* add register dump support */
> > > > -	dpu_debugfs_create_regset32("src_blk", 0400,
> > > > -			debugfs_root,
> > > > -			sblk->src_blk.base + cfg->base,
> > > > -			sblk->src_blk.len,
> > 
> > Note that this fails to apply on top of
> > https://lore.kernel.org/linux-arm-msm/20230429012353.2569481-2-dmitry.baryshkov@linaro.org/
> 
> Also noticing just now that this whole patch makes sblk unused:

... thanks to rebasing on top of [1], which is now applied.

[1]: https://lore.kernel.org/all/20230518222238.3815293-6-dmitry.baryshkov@linaro.org/

- Marijn

> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c: In function '_dpu_hw_sspp_init_debugfs':
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:620:41: warning: unused variable 'sblk' [-Wunused-variable]
>   620 |         const struct dpu_sspp_sub_blks *sblk = cfg->sblk;
>       |                                         ^~~~
> 
> - Marijn
