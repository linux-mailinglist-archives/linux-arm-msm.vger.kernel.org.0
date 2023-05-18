Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5508A708AA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 23:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbjERVjS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 17:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbjERVjR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 17:39:17 -0400
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E309F0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 14:39:17 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 092DA20392;
        Thu, 18 May 2023 23:39:14 +0200 (CEST)
Date:   Thu, 18 May 2023 23:39:12 +0200
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
Subject: Re: [PATCH v2 1/3] drm/msm/dpu: drop SSPP's SRC subblock
Message-ID: <seamj37nkkwn5n2b6jdhpul5kgouwrph22nsyunhibw2tjutxv@euo7k55aatx4>
References: <20230429012353.2569481-1-dmitry.baryshkov@linaro.org>
 <20230429012353.2569481-2-dmitry.baryshkov@linaro.org>
 <375aoihzzqquma4e53zfl7t6xdamlwyb2t36effy44wooylywp@5oz5jl5t54qo>
 <cace6559-dbd4-0fa0-5b59-88c75cf35091@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cace6559-dbd4-0fa0-5b59-88c75cf35091@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-19 00:06:15, Dmitry Baryshkov wrote:
> On 18/05/2023 22:14, Marijn Suijten wrote:
> > On 2023-04-29 04:23:51, Dmitry Baryshkov wrote:
> >> The src_blk declares a lame copy of main SSPP register space. It's
> >> offset is always 0. It's length has been fixed to 0x150, while SSPP's
> > 
> > It's -> its, twice.
> 
> Ack
> 
> > 
> > 
> > 
> >> length is now correct. Drop the src_blk and access SSPP registers
> >> without additional subblock lookup.
> > 
> > Note that the block code still calls `dpu_debugfs_create_regset32()` on
> > "src_blk", do we want to rename that?
> > 
> 
> I could not come up with a better debugfs file name, so I decided to 
> leave it as is.

Just "blk" or "reg(s)"?  This already sits in a dspp/%d subfolder so no
need to repeat "dspp" at least.  But also fine to leave it untouched for
now.

- Marijn
