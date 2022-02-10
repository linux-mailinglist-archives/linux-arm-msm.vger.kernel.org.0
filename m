Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 898364B0C90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Feb 2022 12:41:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241103AbiBJLlY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Feb 2022 06:41:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241105AbiBJLlW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Feb 2022 06:41:22 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1D551028
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 03:41:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 24EB0CE239F
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 11:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21AB9C340ED;
        Thu, 10 Feb 2022 11:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644493280;
        bh=H2RdFMbRP7RJJRAbgsf+fGP8lEtZwF/hA1bM/itUqRE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sPMMjUOrJ36Af0bXmXEh9TZNqVWM8Z2gvyQc9iwH6TuLRaleJsmfGneK6uljoO0C4
         DHYvQxvj5PdVH+eKT0jFZNEEz9ej9L5/w9q3KG0CwXSZwQ0gINtaNShvCT3oLdT4zO
         u+xSeaOICJ8Z3M/kciEvTOla5F+pNkNAm8xaZcpEsDxxAPNyR2QQ31uTYtgB4Ijyui
         9NWpXsR4E2a+c/hZO6/o8k+OmNgIvt0LVmvVIqnANsDCnBkYFKLr5HmBBXqrG/Yy/4
         tMu+X+rvOcE2CunOqHc6PGNoREf9FxL+1CXnf1GZbAy4Lp6gGvs48liOgtZ3yK13Ef
         nr4dM/DxdapjQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Mark Yacoub <markyacoub@google.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 2/3] drm/msm/dpu: Update the comment style
Date:   Thu, 10 Feb 2022 17:11:05 +0530
Message-Id: <20220210114106.290669-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220210114106.290669-1-vkoul@kernel.org>
References: <20220210114106.290669-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The multi line comment style is wrongly used as kernel-doc comment. This
gives a warning:

drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:17:
warning: This comment starts with '/**', but isn't a kernel-doc comment.
Refer Documentation/doc-guide/kernel-doc.rst

Update the style to fix this.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index a77a5eaa78ad..9341c88a336f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -13,7 +13,7 @@
 #include "dpu_hw_mdss.h"
 #include "dpu_trace.h"
 
-/**
+/*
  * Register offsets in MDSS register file for the interrupt registers
  * w.r.t. to the MDP base
  */
-- 
2.31.1

