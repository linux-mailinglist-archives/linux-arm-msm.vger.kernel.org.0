Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACD2F5327D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 May 2022 12:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235809AbiEXKft (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 May 2022 06:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234773AbiEXKfs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 May 2022 06:35:48 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA64470902
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 03:35:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 85E53B817BC
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 10:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1BBC385AA;
        Tue, 24 May 2022 10:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653388545;
        bh=gwBQJB78CCphDTIy50bjriGtJcPqoXOiI/qgg5bZ34M=;
        h=From:To:Cc:Subject:Date:From;
        b=WAaa2wtSlhxP+AHfoFOc7dz4elSiiUuzyEy1vVdV+SwfuFrdYunPJskyJPChaiIxC
         BTyqcwwyxlDOCdGAbnn3uICkHK8zjZzXNd1eCEOX8dBQOst+aEYkMJjh8DTsDS3ANj
         L0iMjphD/gyDwZQX18/+J7Lj+OXSsBcU0IipLFNONzZvRVJ1oXEYkD7+0ryzxHKFSt
         +o8pgUM9j1hAxWopwkURSx7V9YAYGi0L1fz11uKuV2Vuvo1RXD9v6AdPXrusjFsYUe
         F3as93AT0Kdb2i5/8N4SRkQhidQ13dhB8SI1gTUv+gJO4faL/ooWLnUvugDuGj9h7/
         75Cd6qtQPPKmA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        kernel test robot <yujie.liu@intel.com>
Subject: [PATCH] drm/msm/disp/dpu1: remove supoerflous init
Date:   Tue, 24 May 2022 16:05:34 +0530
Message-Id: <20220524103534.2520439-1-vkoul@kernel.org>
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
again programmed, so drop the supoerflous init.

Fixes: 58dca9810749 ("drm/msm/disp/dpu1: Add support for DSC in encoder")
Reported-by: kernel test robot <yujie.liu@intel.com>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
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

