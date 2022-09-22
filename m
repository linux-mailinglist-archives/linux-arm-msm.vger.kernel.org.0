Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 944A25E61A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 13:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231603AbiIVLpS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 07:45:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbiIVLo4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 07:44:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41B61E4DB2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 04:44:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 41F0362D42
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 11:44:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFAFC433D6;
        Thu, 22 Sep 2022 11:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663847054;
        bh=azhcTDdJTK0KkQWrJRsy2lPns5Akr3BdY1FgCzSmMLM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZHI3ooVRzNbl9OZO3Fl5sl1qg44wBb+WiHG6QnEdKsX2f2whlzMdMbdAU3P08cvkW
         tw9Tsuu+Ejl0vjsQtNB4Gsso7hC3Fg7amaMzjuEySRPZh3Vvjcllw11hZzpUCgc9Z1
         y2kT7GN9KumIG3DLoMxELg26l7fs1axe2wqSjYpz99JTdur/SH88w4NgkhXtEcuWfV
         TFQ4S/Rdp0Xpl4qQ7KNhUnAdNUm3xebOsct7GT0FghSeqaW+I+y1kP+hEbouALHGmy
         7Ct2XTTC14oLCyWD4PjnWqHTsQV7wlDP3ZQ/67VqLQp2wFXEflGjnYVWew975t6b5V
         ZrI7/hTnPaj8A==
Date:   Thu, 22 Sep 2022 17:14:10 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH 0/5] drm/msm: add support for SM8450
Message-ID: <YyxKiv4NZw90HVlh@matsya>
References: <20220922113016.355188-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922113016.355188-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-09-22, 14:30, Dmitry Baryshkov wrote:
> This adds support for the MDSS/DPU/DSI on the Qualcomm SM8450 platform.

Tested this on DM8450-HDK with HDMI and it works for me.

For whole series:
Tested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>


> 
> Dmitry Baryshkov (5):
>   drm/msm/dsi: add support for DSI-PHY on SM8350 and SM8450
>   drm/msm/dsi: add support for DSI 2.6.0
>   drm/msm/dpu: add support for MDP_TOP blackhole
>   drm/msm/dpu: add support for SM8450
>   drm/msm: mdss add support for SM8450
> 
>  drivers/gpu/drm/msm/Kconfig                   |   6 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 224 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   3 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  12 +-
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c             |   2 +
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   4 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   2 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 132 ++++++++++-
>  drivers/gpu/drm/msm/msm_mdss.c                |   8 +
>  11 files changed, 381 insertions(+), 15 deletions(-)
> 
> -- 
> 2.35.1

-- 
~Vinod
