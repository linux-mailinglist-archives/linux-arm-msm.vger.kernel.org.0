Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD01533786
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 May 2022 09:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231130AbiEYHja (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 May 2022 03:39:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232714AbiEYHj3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 May 2022 03:39:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16E0F703C2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 00:39:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A68A76179A
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 07:39:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A7D9C385B8;
        Wed, 25 May 2022 07:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653464368;
        bh=3lBmglmHAxoDZ44iJuSmettyMYwVV1Evj7p3iUZ9x0U=;
        h=From:To:Cc:Subject:Date:From;
        b=E5BoMBSZ9bkAtH4L0sTwMHzAC3HVVRPC7HsmJEV474UQAHqdFoLhNRTHZXLnziYk0
         ivHTCc0/BRnIydyZYHbfh61kDz1exEt4JVncabJrVidwT6IB2YBCIjTVr+19xTEA3T
         aLCtoJdXRP+LvPLYwr/9KflAosw1M7VbG/MXUC5J069Z8+5RisrYIRju5biAAPBQuc
         dAkWCgU1sbQfBNrP3s/PBZPYhSmKiGjxfnuWwkigUQ5/ncTj210oZDByPzfyMohFYv
         5Xjef8YDTbvJ2nVG/Qx5o7zazeC5epGa0OOiKUij1UXZxy9wu2tSAhvC2lqHJNuTqy
         T2jXM45uI2v5Q==
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        kernel test robot <yujie.liu@intel.com>
Subject: [PATCH v2] drm/msm/disp/dpu1: remove superfluous init
Date:   Wed, 25 May 2022 13:09:12 +0530
Message-Id: <20220525073912.2706505-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Commit 58dca9810749 ("drm/msm/disp/dpu1: Add support for DSC in
encoder") added dsc_common_mode variable which was set to zero but then
again programmed, so drop the superfluous init.

Fixes: 58dca9810749 ("drm/msm/disp/dpu1: Add support for DSC in encoder")
Reported-by: kernel test robot <yujie.liu@intel.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
changes in v2:
 - add r-b from Dmitry & Abhinav
 - fix typo for superfluous

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 51f24ba68375..388125c8bda1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1798,7 +1798,6 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 		}
 	}
 
-	dsc_common_mode = 0;
 	pic_width = dsc->drm->pic_width;
 
 	dsc_common_mode = DSC_MODE_MULTIPLEX | DSC_MODE_SPLIT_PANEL;
-- 
2.34.1

