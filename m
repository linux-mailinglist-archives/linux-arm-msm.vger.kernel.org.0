Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75EDB76876C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 21:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbjG3T2a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Jul 2023 15:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjG3T22 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Jul 2023 15:28:28 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B12A4E5B
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Jul 2023 12:28:23 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 6D642202E0;
        Sun, 30 Jul 2023 21:28:21 +0200 (CEST)
Date:   Sun, 30 Jul 2023 21:28:20 +0200
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
Subject: Re: [PATCH 7/7] drm/msm/dpu: move INTF tearing checks to
 dpu_encoder_phys_cmd_init
Message-ID: <ufoirdhnrxfpx2mstx5vxiacwl7jfie6454jd3snoaalqxq67n@7f5sjdyl7x4g>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
 <20230727162104.1497483-8-dmitry.baryshkov@linaro.org>
 <bmmqdo6dyewxrgcfk3vcuff3tgrb6iqgzby3ionl4shaido2vw@cqc2qnvu3fnj>
 <b2uzkzfoj4sfg3fx3ufjd7i2x5dbbnsccodrgk7cnfvjf3yak4@tbesdrg2tke4>
 <4f0da76f-7b73-130f-e787-8fd8425da62a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f0da76f-7b73-130f-e787-8fd8425da62a@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-07-30 03:16:59, Dmitry Baryshkov wrote:
<snip>
> >>> +	if (!phys_enc->has_intf_te &&
> >>> +	    (!phys_enc->hw_pp ||
> >>> +	     !phys_enc->hw_pp->ops.enable_tearcheck)) {
> >>
> >> when is hw_pp assigned?  Can't we also check that somewhere in an init
> >> phase?
> > 
> > It would happen right before dpu_encoder_phys_cmd_atomic_mode_set()
> > where we already happen to check has_intf_te to switch on PP
> > intr_readptr vs INTF intr_tear_rd_ptr.  Might be the perfect place for
> > the pingpong callback checks?
> 
> The problem is that mode_set doesn't return an error (by design). I'd 
> put a TODO here, so that if we ever move/change resource allocation, 
> this check can be done next to it (atomic_check isn't a good place, 
> since phys_enc.atomic_check happens before resource reallocation).

As thought of in another patch, perhaps it could just be a WARN_ON() as
these almost always relate directly to constant information provided by
the catalog, which we trust to be sound (and these error cases to hardly
be reachable) after it has been validated, reviewed and merged.

- Marijn
