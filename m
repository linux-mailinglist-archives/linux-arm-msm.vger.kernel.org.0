Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF1964B066C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Feb 2022 07:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235338AbiBJGiX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Feb 2022 01:38:23 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235364AbiBJGiW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Feb 2022 01:38:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5240EE32
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 22:38:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DB1F1B82199
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 06:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F4AC36AE3;
        Thu, 10 Feb 2022 06:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644475098;
        bh=iAOoikATOngDvE7hWi9IFAdfQ0j+CMClenhuFmx/KJ0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LJsVZrgNYOaLc3dbz+Y77deqo5vmjgZncFeVh16vk6MRhvhsiSq+r5O/FeO/S06Uc
         S5IiyL5MyIJOpatnnwrYdPlpP7C7si+UjsEsoUlnzxsMSAGVHYPWFMiT8uOjlTC/dw
         lfUcUTFr+408lXxUpZQunfC9yNLLTbTWUfxlInSbVPciuo21fNOvA/uEfM807BMKIm
         nclgZw6J9ibLXCtDvx6nAI4QVg74vZmIThM2YvnfsTAhYPu3U1QN65E0zjzHowC4bO
         epVJua30H+1qwPZVISp2CKaD1zxz2KzE/WKFkgpJ0LeAslfXZh08pxO3B9sOZg5w9K
         CwuC4TLdwxQRQ==
From:   Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v4 10/13] drm/msm/disp/dpu1: Add support for DSC in topology
Date:   Thu, 10 Feb 2022 12:07:36 +0530
Message-Id: <20220210063739.233634-11-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220210063739.233634-1-vkoul@kernel.org>
References: <20220210063739.233634-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For DSC to work we typically need a 2,2,1 configuration. This should
suffice for resolutions up to 4k. For more resolutions like 8k this won't
work.

Also, it is better to use 2 LMs and DSC instances as half width results
in lesser power consumption as compared to single LM, DSC at full width.

The panel has been tested only with 2,2,1 configuration, so for
now we blindly create 2,2,1 topology when DSC is enabled

Co-developed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 +++++++++++++
 drivers/gpu/drm/msm/msm_drv.h               |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 95a7bf362e81..13ccb7b3cce5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -574,8 +574,21 @@ static struct msm_display_topology dpu_encoder_get_topology(
 	topology.num_enc = 0;
 	topology.num_intf = intf_count;
 
+	if (dpu_enc->dsc) {
+		/* In case of Display Stream Compression DSC, we would use
+		 * 2 encoders, 2 line mixers and 1 interface
+		 * this is power optimal and can drive up to (including) 4k
+		 * screens
+		 */
+		topology.num_enc = 2;
+		topology.num_dsc = 2;
+		topology.num_intf = 1;
+		topology.num_lm = 2;
+	}
+
 	return topology;
 }
+
 static int dpu_encoder_virt_atomic_check(
 		struct drm_encoder *drm_enc,
 		struct drm_crtc_state *crtc_state,
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 6425a42e997c..994d895d1a47 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -103,12 +103,14 @@ enum msm_event_wait {
  * @num_enc:      number of compression encoder blocks used
  * @num_intf:     number of interfaces the panel is mounted on
  * @num_dspp:     number of dspp blocks used
+ * @num_dsc:      number of Display Stream Compression (DSC) blocks used
  */
 struct msm_display_topology {
 	u32 num_lm;
 	u32 num_enc;
 	u32 num_intf;
 	u32 num_dspp;
+	u32 num_dsc;
 };
 
 /**
-- 
2.31.1

