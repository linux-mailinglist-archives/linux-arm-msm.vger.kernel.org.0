Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 415DF7322CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 00:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235017AbjFOWcT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 18:32:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbjFOWcS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 18:32:18 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2090A1BF0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 15:32:17 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id C7723200CC;
        Fri, 16 Jun 2023 00:32:14 +0200 (CEST)
Date:   Fri, 16 Jun 2023 00:32:13 +0200
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
Subject: Re: [PATCH v2 00/22]drm/msm/dpu: another catalog rework
Message-ID: <a3lfr4tgdhhcvdf5h6q25gstajtth772isjgaibmxtalhzxnsk@u4dbwpjva4yd>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
 <168682860384.384026.9850510984858511761.b4-ty@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168682860384.384026.9850510984858511761.b4-ty@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-15 14:31:22, Dmitry Baryshkov wrote:
> 
> On Tue, 13 Jun 2023 03:09:39 +0300, Dmitry Baryshkov wrote:
> > Having a macro with 10 arguments doesn't seem like a good idea. It makes
> > it inherently harder to compare the actual structure values. Also this
> > leads to adding macros covering varieties of the block.
> > 
> > As it was previously discussed, inline all foo_BLK macros in order to
> > ease performing changes to the catalog data.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [01/22] drm/msm/dpu: fix sc7280 and sc7180 PINGPONG done interrupts
>         https://gitlab.freedesktop.org/lumag/msm/-/commit/5efc0fec31d8
> [02/22] drm/msm/dpu: correct MERGE_3D length
>         https://gitlab.freedesktop.org/lumag/msm/-/commit/f01fb5e211fd
> [03/22] drm/msm/dpu: remove unused INTF_NONE interfaces
>         https://gitlab.freedesktop.org/lumag/msm/-/commit/17bf6f8efc50

The first two patches are fixes, the third one is not?

- Marijn

> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
