Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5F66EFD79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Apr 2023 00:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240014AbjDZWiD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Apr 2023 18:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239687AbjDZWhn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Apr 2023 18:37:43 -0400
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B5840EF
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Apr 2023 15:37:32 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id B09C7201EC;
        Thu, 27 Apr 2023 00:37:30 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
Date:   Thu, 27 Apr 2023 00:37:32 +0200
Subject: [PATCH v4 18/22] drm/msm/dpu: Describe TEAR interrupt registers
 for DSI interfaces
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-dpu-intf-te-v4-18-27ce1a5ab5c6@somainline.org>
References: <20230411-dpu-intf-te-v4-0-27ce1a5ab5c6@somainline.org>
In-Reply-To: <20230411-dpu-intf-te-v4-0-27ce1a5ab5c6@somainline.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Adam Skladowski <a39.skl@gmail.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All SoCs since DPU 5.0.0 have the tear interrupt registers moved out of
the PINGPONG block and into the INTF block.  Wire up the IRQ register
masks in the interrupt table for enabling, reading and clearing them.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 28 +++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  4 ++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 152d4272a087a..5e2d68ebb113e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -21,6 +21,10 @@
 #define MDP_INTF_INTR_EN(intf)				(MDP_INTF_OFF(intf) + 0x1c0)
 #define MDP_INTF_INTR_STATUS(intf)			(MDP_INTF_OFF(intf) + 0x1c4)
 #define MDP_INTF_INTR_CLEAR(intf)			(MDP_INTF_OFF(intf) + 0x1c8)
+#define MDP_INTF_TEAR_OFF(intf)				(0x6D700 + 0x100 * (intf))
+#define MDP_INTF_INTR_TEAR_EN(intf)			(MDP_INTF_TEAR_OFF(intf) + 0x000)
+#define MDP_INTF_INTR_TEAR_STATUS(intf)			(MDP_INTF_TEAR_OFF(intf) + 0x004)
+#define MDP_INTF_INTR_TEAR_CLEAR(intf)			(MDP_INTF_TEAR_OFF(intf) + 0x008)
 #define MDP_AD4_OFF(ad4)				(0x7C000 + 0x1000 * (ad4))
 #define MDP_AD4_INTR_EN_OFF(ad4)			(MDP_AD4_OFF(ad4) + 0x41c)
 #define MDP_AD4_INTR_CLEAR_OFF(ad4)			(MDP_AD4_OFF(ad4) + 0x424)
@@ -29,6 +33,10 @@
 #define MDP_INTF_REV_7xxx_INTR_EN(intf)			(MDP_INTF_REV_7xxx_OFF(intf) + 0x1c0)
 #define MDP_INTF_REV_7xxx_INTR_STATUS(intf)		(MDP_INTF_REV_7xxx_OFF(intf) + 0x1c4)
 #define MDP_INTF_REV_7xxx_INTR_CLEAR(intf)		(MDP_INTF_REV_7xxx_OFF(intf) + 0x1c8)
+#define MDP_INTF_REV_7xxx_TEAR_OFF(intf)		(0x34800 + 0x1000 * (intf))
+#define MDP_INTF_REV_7xxx_INTR_TEAR_EN(intf)		(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x000)
+#define MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x004)
+#define MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x008)
 
 /**
  * struct dpu_intr_reg - array of DPU register sets
@@ -93,6 +101,16 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
 		MDP_INTF_INTR_EN(5),
 		MDP_INTF_INTR_STATUS(5)
 	},
+	[MDP_INTF1_TEAR_INTR] = {
+		MDP_INTF_INTR_TEAR_CLEAR(1),
+		MDP_INTF_INTR_TEAR_EN(1),
+		MDP_INTF_INTR_TEAR_STATUS(1)
+	},
+	[MDP_INTF2_TEAR_INTR] = {
+		MDP_INTF_INTR_TEAR_CLEAR(2),
+		MDP_INTF_INTR_TEAR_EN(2),
+		MDP_INTF_INTR_TEAR_STATUS(2)
+	},
 	[MDP_AD4_0_INTR] = {
 		MDP_AD4_INTR_CLEAR_OFF(0),
 		MDP_AD4_INTR_EN_OFF(0),
@@ -113,11 +131,21 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
 		MDP_INTF_REV_7xxx_INTR_EN(1),
 		MDP_INTF_REV_7xxx_INTR_STATUS(1)
 	},
+	[MDP_INTF1_7xxx_TEAR_INTR] = {
+		MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(1),
+		MDP_INTF_REV_7xxx_INTR_TEAR_EN(1),
+		MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(1)
+	},
 	[MDP_INTF2_7xxx_INTR] = {
 		MDP_INTF_REV_7xxx_INTR_CLEAR(2),
 		MDP_INTF_REV_7xxx_INTR_EN(2),
 		MDP_INTF_REV_7xxx_INTR_STATUS(2)
 	},
+	[MDP_INTF2_7xxx_TEAR_INTR] = {
+		MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(2),
+		MDP_INTF_REV_7xxx_INTR_TEAR_EN(2),
+		MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(2)
+	},
 	[MDP_INTF3_7xxx_INTR] = {
 		MDP_INTF_REV_7xxx_INTR_CLEAR(3),
 		MDP_INTF_REV_7xxx_INTR_EN(3),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 425465011c807..fda7f8c9caece 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -23,11 +23,15 @@ enum dpu_hw_intr_reg {
 	MDP_INTF3_INTR,
 	MDP_INTF4_INTR,
 	MDP_INTF5_INTR,
+	MDP_INTF1_TEAR_INTR,
+	MDP_INTF2_TEAR_INTR,
 	MDP_AD4_0_INTR,
 	MDP_AD4_1_INTR,
 	MDP_INTF0_7xxx_INTR,
 	MDP_INTF1_7xxx_INTR,
+	MDP_INTF1_7xxx_TEAR_INTR,
 	MDP_INTF2_7xxx_INTR,
+	MDP_INTF2_7xxx_TEAR_INTR,
 	MDP_INTF3_7xxx_INTR,
 	MDP_INTF4_7xxx_INTR,
 	MDP_INTF5_7xxx_INTR,

-- 
2.40.1

