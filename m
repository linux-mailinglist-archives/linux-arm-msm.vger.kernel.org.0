Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5464D51A117
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 15:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232499AbiEDNmM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 09:42:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231902AbiEDNmL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 09:42:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 954F324593
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 06:38:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 38D01618A3
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 13:38:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C5F6C385A5;
        Wed,  4 May 2022 13:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651671514;
        bh=ms/oyRGQxDUqaugdsNOsAi79kIujYMIoaULc56D4HJI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LchARCrM+yDW/NerV1t8xe7pnaIovw2oFSNkkLYo9oUtUXSfRWqDB2TYRefaPA2Zg
         YGu5CEW36YhNDNpRa8Hv5PlReBOZrYwK1KQZjgNfdFMDetseIpLHvIL4NXsFxfjtKS
         fxIVSIZhRDjaEWjhfMXtHc0ktN+o0WTvbxBMgtSDBVp6LGS6/tp2MzlQ6+e68zXBIF
         bUs8vjWNpaxtdLag2nb5tYHRZmr2/L1LZaOqlWY0QPNNtMyAbi8zfc1RYL/W0oULy2
         OrPAxkZn6RrpTOcWJdWsI0GNdLRvgUjta7T7jsa0NhB3D4kykSvqQ8ORcAJzoVKoxG
         hon7XlT0qqEwA==
Date:   Wed, 4 May 2022 19:08:30 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] drm/msm/dsi: use RMW cycles in dsi_update_dsc_timing
Message-ID: <YnKB1nYLSVUSbSUJ@matsya>
References: <20220430175533.3817792-1-dmitry.baryshkov@linaro.org>
 <20220430185807.yn2j2coyc77qzx2o@SoMainline.org>
 <02114b24-f954-f145-4918-01cc3def65ac@linaro.org>
 <20220501204102.3xijmadbcrxwyu3x@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220501204102.3xijmadbcrxwyu3x@SoMainline.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01-05-22, 22:41, Marijn Suijten wrote:
> On 2022-04-30 22:28:42, Dmitry Baryshkov wrote:
> > On 30/04/2022 21:58, Marijn Suijten wrote:
> > > On 2022-04-30 20:55:33, Dmitry Baryshkov wrote:
> > >> The downstream uses read-modify-write for updating command mode
> > >> compression registers. Let's follow this approach. This also fixes the
> > >> following warning:
> > >>
> > >> drivers/gpu/drm/msm/dsi/dsi_host.c:918:23: warning: variable 'reg_ctrl' set but not used [-Wunused-but-set-variable]
> > >>
> > >> Reported-by: kernel test robot <lkp@intel.com>
> > >> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> > >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > 
> > > I pointed this out in review multiple times, so you'll obviously get my:
> > 
> > I think I might have also pointed this out once (and then forgot to 
> > check that the issue was fixed by Vinod).
> > 
> > > 
> > > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > 
> > > (But are you sure there's nothing else to clear in the 1st CTRL
> > > register, only the lowest 16 bits?  That should mean `reg` never
> > > contains anything in 0xffff0000)
> > 
> > Judging from the downstream the upper half conains the same fields, but 
> > used for other virtual channel. I didn't research what's the difference 
> > yet. All the dtsi files that I have here at hand use 
> > 'qcom,mdss-dsi-virtual-channel-id = <0>;'
> 
> As replied to Abhinav I'm simply asking whether we should be strict
> and add `reg & 0xffff` to prevent accidentally writing the top 16 bits,
> which are stream 1.  It doesn't seem like the current code can hit that
> though, with all the macros using masks internally already; but it's

Since the macros were used I skipped setting that up explictly...

> still a little scary since we're assuming the registers for VIDEO are
> identical to CMD (as mentioned in the reply to Abhinav: I wonder if it's

The documentation seems to indicate they are similar and that is the
reason, I merged the code paths and set different registers required for
video and cmd modes

-- 
~Vinod
