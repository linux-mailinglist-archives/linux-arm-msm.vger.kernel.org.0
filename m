Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1B874B0C8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Feb 2022 12:41:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241098AbiBJLlZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Feb 2022 06:41:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241100AbiBJLlZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Feb 2022 06:41:25 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F77E101E
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 03:41:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3E3D361D15
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 11:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325A5C340F0;
        Thu, 10 Feb 2022 11:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644493285;
        bh=/OutVh/eSlM2D8L/jMfWJxxmWG0tTyYf7k89K741aNo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rl5jqfj6jAysGYxqiYPgAg6AcYBKVWA+be7zn8KTweo4BrfXSQEzU4cTA5bdnlpOU
         6XPvLHgV6Sb5vXd+896oDooDKmf28WoBQXSXnvY3+c6B+TKEaGbaGLCfnCpWF+faOQ
         Se4X4Fghg5RP0+GcYjv8frytkY6c9V+63tYTqgN33LHXIFlFM2BomvD40Ku5h4MeL6
         75FDh+UaW5i4vdBD4CQgJTwpJxOTjGMk5lmbP6jhG6YBBgXqtH0oTnQ8s2jKWMQG8i
         bycVXyrcOQZ3RhAQ/XKHHb7oDDAmstJzrlyXlBGp2SUiaeI/dwvcNOhAuBRKzx+76P
         wOrOqJwyVq+pQ==
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
Subject: [PATCH 3/3] drm/msm/dpu: Update function parameter documentation
Date:   Thu, 10 Feb 2022 17:11:06 +0530
Message-Id: <20220210114106.290669-3-vkoul@kernel.org>
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

dpu_core_irq_callback_handler() function comments seem to have become
stale and emit a warning:

drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:147:
warning: Function parameter or member 'dpu_kms' not described in 'dpu_core_irq_callback_handler'
drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:147:
warning: Excess function parameter 'arg' description in 'dpu_core_irq_callback_handler'

Fix by updating the documentation

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 9341c88a336f..27073fd49fee 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -140,7 +140,7 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
 
 /**
  * dpu_core_irq_callback_handler - dispatch core interrupts
- * @arg:		private data of callback handler
+ * @dpu_kms:		Pointer to DPU's KMS structure
  * @irq_idx:		interrupt index
  */
 static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
-- 
2.31.1

