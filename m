Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 025FB6EEA91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Apr 2023 01:06:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234826AbjDYXGR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Apr 2023 19:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236331AbjDYXGN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Apr 2023 19:06:13 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8916FB220
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Apr 2023 16:06:11 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 611ED1F8D2;
        Wed, 26 Apr 2023 01:06:09 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
Date:   Wed, 26 Apr 2023 01:06:01 +0200
Subject: [PATCH v3 10/21] drm/msm/dpu: Take INTF index as parameter in
 interrupt register defines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-dpu-intf-te-v3-10-693b17fe6500@somainline.org>
References: <20230411-dpu-intf-te-v3-0-693b17fe6500@somainline.org>
In-Reply-To: <20230411-dpu-intf-te-v3-0-693b17fe6500@somainline.org>
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
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75 autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Instead of hardcoding many register defines for every INTF and AD4 index
with a fixed stride, turn the defines into singular chunks of math that
compute the address using the base and this fixed stride multiplied by
the index given as argument to the definitions.

MDP_SSPP_TOP0_OFF is dropped as that constant is zero anyway, and all
register offsets related to it live in dpu_hwio.h.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 156 ++++++++++------------
 1 file changed, 72 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 17f3e7e4f1941..e116993b2f8f7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -17,30 +17,18 @@
  * Register offsets in MDSS register file for the interrupt registers
  * w.r.t. the MDP base
  */
-#define MDP_SSPP_TOP0_OFF		0x0
-#define MDP_INTF_0_OFF			0x6A000
-#define MDP_INTF_1_OFF			0x6A800
-#define MDP_INTF_2_OFF			0x6B000
-#define MDP_INTF_3_OFF			0x6B800
-#define MDP_INTF_4_OFF			0x6C000
-#define MDP_INTF_5_OFF			0x6C800
-#define INTF_INTR_EN			0x1c0
-#define INTF_INTR_STATUS		0x1c4
-#define INTF_INTR_CLEAR			0x1c8
-#define MDP_AD4_0_OFF			0x7C000
-#define MDP_AD4_1_OFF			0x7D000
-#define MDP_AD4_INTR_EN_OFF		0x41c
-#define MDP_AD4_INTR_CLEAR_OFF		0x424
-#define MDP_AD4_INTR_STATUS_OFF		0x420
-#define MDP_INTF_0_OFF_REV_7xxx		0x34000
-#define MDP_INTF_1_OFF_REV_7xxx		0x35000
-#define MDP_INTF_2_OFF_REV_7xxx		0x36000
-#define MDP_INTF_3_OFF_REV_7xxx		0x37000
-#define MDP_INTF_4_OFF_REV_7xxx		0x38000
-#define MDP_INTF_5_OFF_REV_7xxx		0x39000
-#define MDP_INTF_6_OFF_REV_7xxx		0x3a000
-#define MDP_INTF_7_OFF_REV_7xxx		0x3b000
-#define MDP_INTF_8_OFF_REV_7xxx		0x3c000
+#define MDP_INTF_OFF(intf)			(0x6A000 + 0x800 * (intf))
+#define MDP_INTF_INTR_EN(intf)			(MDP_INTF_OFF(intf) + 0x1c0)
+#define MDP_INTF_INTR_STATUS(intf)		(MDP_INTF_OFF(intf) + 0x1c4)
+#define MDP_INTF_INTR_CLEAR(intf)		(MDP_INTF_OFF(intf) + 0x1c8)
+#define MDP_AD4_OFF(ad4)			(0x7C000 + 0x1000 * (ad4))
+#define MDP_AD4_INTR_EN_OFF(ad4)		(MDP_AD4_OFF(ad4) + 0x41c)
+#define MDP_AD4_INTR_CLEAR_OFF(ad4)		(MDP_AD4_OFF(ad4) + 0x424)
+#define MDP_AD4_INTR_STATUS_OFF(ad4)		(MDP_AD4_OFF(ad4) + 0x420)
+#define MDP_INTF_REV_7xxx_OFF(intf)		(0x34000 + 0x1000 * (intf))
+#define MDP_INTF_REV_7xxx_INTR_EN(intf)		(MDP_INTF_REV_7xxx_OFF(intf) + 0x1c0)
+#define MDP_INTF_REV_7xxx_INTR_STATUS(intf)	(MDP_INTF_REV_7xxx_OFF(intf) + 0x1c4)
+#define MDP_INTF_REV_7xxx_INTR_CLEAR(intf)	(MDP_INTF_REV_7xxx_OFF(intf) + 0x1c8)
 
 /**
  * struct dpu_intr_reg - array of DPU register sets
@@ -61,104 +49,104 @@ struct dpu_intr_reg {
  */
 static const struct dpu_intr_reg dpu_intr_set[] = {
 	[MDP_SSPP_TOP0_INTR] = {
-		MDP_SSPP_TOP0_OFF+INTR_CLEAR,
-		MDP_SSPP_TOP0_OFF+INTR_EN,
-		MDP_SSPP_TOP0_OFF+INTR_STATUS
+		INTR_CLEAR,
+		INTR_EN,
+		INTR_STATUS
 	},
 	[MDP_SSPP_TOP0_INTR2] = {
-		MDP_SSPP_TOP0_OFF+INTR2_CLEAR,
-		MDP_SSPP_TOP0_OFF+INTR2_EN,
-		MDP_SSPP_TOP0_OFF+INTR2_STATUS
+		INTR2_CLEAR,
+		INTR2_EN,
+		INTR2_STATUS
 	},
 	[MDP_SSPP_TOP0_HIST_INTR] = {
-		MDP_SSPP_TOP0_OFF+HIST_INTR_CLEAR,
-		MDP_SSPP_TOP0_OFF+HIST_INTR_EN,
-		MDP_SSPP_TOP0_OFF+HIST_INTR_STATUS
+		HIST_INTR_CLEAR,
+		HIST_INTR_EN,
+		HIST_INTR_STATUS
 	},
 	[MDP_INTF0_INTR] = {
-		MDP_INTF_0_OFF+INTF_INTR_CLEAR,
-		MDP_INTF_0_OFF+INTF_INTR_EN,
-		MDP_INTF_0_OFF+INTF_INTR_STATUS
+		MDP_INTF_INTR_CLEAR(0),
+		MDP_INTF_INTR_EN(0),
+		MDP_INTF_INTR_STATUS(0)
 	},
 	[MDP_INTF1_INTR] = {
-		MDP_INTF_1_OFF+INTF_INTR_CLEAR,
-		MDP_INTF_1_OFF+INTF_INTR_EN,
-		MDP_INTF_1_OFF+INTF_INTR_STATUS
+		MDP_INTF_INTR_CLEAR(1),
+		MDP_INTF_INTR_EN(1),
+		MDP_INTF_INTR_STATUS(1)
 	},
 	[MDP_INTF2_INTR] = {
-		MDP_INTF_2_OFF+INTF_INTR_CLEAR,
-		MDP_INTF_2_OFF+INTF_INTR_EN,
-		MDP_INTF_2_OFF+INTF_INTR_STATUS
+		MDP_INTF_INTR_CLEAR(2),
+		MDP_INTF_INTR_EN(2),
+		MDP_INTF_INTR_STATUS(2)
 	},
 	[MDP_INTF3_INTR] = {
-		MDP_INTF_3_OFF+INTF_INTR_CLEAR,
-		MDP_INTF_3_OFF+INTF_INTR_EN,
-		MDP_INTF_3_OFF+INTF_INTR_STATUS
+		MDP_INTF_INTR_CLEAR(3),
+		MDP_INTF_INTR_EN(3),
+		MDP_INTF_INTR_STATUS(3)
 	},
 	[MDP_INTF4_INTR] = {
-		MDP_INTF_4_OFF+INTF_INTR_CLEAR,
-		MDP_INTF_4_OFF+INTF_INTR_EN,
-		MDP_INTF_4_OFF+INTF_INTR_STATUS
+		MDP_INTF_INTR_CLEAR(4),
+		MDP_INTF_INTR_EN(4),
+		MDP_INTF_INTR_STATUS(4)
 	},
 	[MDP_INTF5_INTR] = {
-		MDP_INTF_5_OFF+INTF_INTR_CLEAR,
-		MDP_INTF_5_OFF+INTF_INTR_EN,
-		MDP_INTF_5_OFF+INTF_INTR_STATUS
+		MDP_INTF_INTR_CLEAR(5),
+		MDP_INTF_INTR_EN(5),
+		MDP_INTF_INTR_STATUS(5)
 	},
 	[MDP_AD4_0_INTR] = {
-		MDP_AD4_0_OFF + MDP_AD4_INTR_CLEAR_OFF,
-		MDP_AD4_0_OFF + MDP_AD4_INTR_EN_OFF,
-		MDP_AD4_0_OFF + MDP_AD4_INTR_STATUS_OFF,
+		MDP_AD4_INTR_CLEAR_OFF(0),
+		MDP_AD4_INTR_EN_OFF(0),
+		MDP_AD4_INTR_STATUS_OFF(0),
 	},
 	[MDP_AD4_1_INTR] = {
-		MDP_AD4_1_OFF + MDP_AD4_INTR_CLEAR_OFF,
-		MDP_AD4_1_OFF + MDP_AD4_INTR_EN_OFF,
-		MDP_AD4_1_OFF + MDP_AD4_INTR_STATUS_OFF,
+		MDP_AD4_INTR_CLEAR_OFF(1),
+		MDP_AD4_INTR_EN_OFF(1),
+		MDP_AD4_INTR_STATUS_OFF(1),
 	},
 	[MDP_INTF0_7xxx_INTR] = {
-		MDP_INTF_0_OFF_REV_7xxx+INTF_INTR_CLEAR,
-		MDP_INTF_0_OFF_REV_7xxx+INTF_INTR_EN,
-		MDP_INTF_0_OFF_REV_7xxx+INTF_INTR_STATUS
+		MDP_INTF_REV_7xxx_INTR_CLEAR(0),
+		MDP_INTF_REV_7xxx_INTR_EN(0),
+		MDP_INTF_REV_7xxx_INTR_STATUS(0)
 	},
 	[MDP_INTF1_7xxx_INTR] = {
-		MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_CLEAR,
-		MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_EN,
-		MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_STATUS
+		MDP_INTF_REV_7xxx_INTR_CLEAR(1),
+		MDP_INTF_REV_7xxx_INTR_EN(1),
+		MDP_INTF_REV_7xxx_INTR_STATUS(1)
 	},
 	[MDP_INTF2_7xxx_INTR] = {
-		MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_CLEAR,
-		MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_EN,
-		MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_STATUS
+		MDP_INTF_REV_7xxx_INTR_CLEAR(2),
+		MDP_INTF_REV_7xxx_INTR_EN(2),
+		MDP_INTF_REV_7xxx_INTR_STATUS(2)
 	},
 	[MDP_INTF3_7xxx_INTR] = {
-		MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_CLEAR,
-		MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_EN,
-		MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_STATUS
+		MDP_INTF_REV_7xxx_INTR_CLEAR(3),
+		MDP_INTF_REV_7xxx_INTR_EN(3),
+		MDP_INTF_REV_7xxx_INTR_STATUS(3)
 	},
 	[MDP_INTF4_7xxx_INTR] = {
-		MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_CLEAR,
-		MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_EN,
-		MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_STATUS
+		MDP_INTF_REV_7xxx_INTR_CLEAR(4),
+		MDP_INTF_REV_7xxx_INTR_EN(4),
+		MDP_INTF_REV_7xxx_INTR_STATUS(4)
 	},
 	[MDP_INTF5_7xxx_INTR] = {
-		MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_CLEAR,
-		MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_EN,
-		MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_STATUS
+		MDP_INTF_REV_7xxx_INTR_CLEAR(5),
+		MDP_INTF_REV_7xxx_INTR_EN(5),
+		MDP_INTF_REV_7xxx_INTR_STATUS(5)
 	},
 	[MDP_INTF6_7xxx_INTR] = {
-		MDP_INTF_6_OFF_REV_7xxx+INTF_INTR_CLEAR,
-		MDP_INTF_6_OFF_REV_7xxx+INTF_INTR_EN,
-		MDP_INTF_6_OFF_REV_7xxx+INTF_INTR_STATUS
+		MDP_INTF_REV_7xxx_INTR_CLEAR(6),
+		MDP_INTF_REV_7xxx_INTR_EN(6),
+		MDP_INTF_REV_7xxx_INTR_STATUS(6)
 	},
 	[MDP_INTF7_7xxx_INTR] = {
-		MDP_INTF_7_OFF_REV_7xxx+INTF_INTR_CLEAR,
-		MDP_INTF_7_OFF_REV_7xxx+INTF_INTR_EN,
-		MDP_INTF_7_OFF_REV_7xxx+INTF_INTR_STATUS
+		MDP_INTF_REV_7xxx_INTR_CLEAR(7),
+		MDP_INTF_REV_7xxx_INTR_EN(7),
+		MDP_INTF_REV_7xxx_INTR_STATUS(7)
 	},
 	[MDP_INTF8_7xxx_INTR] = {
-		MDP_INTF_8_OFF_REV_7xxx+INTF_INTR_CLEAR,
-		MDP_INTF_8_OFF_REV_7xxx+INTF_INTR_EN,
-		MDP_INTF_8_OFF_REV_7xxx+INTF_INTR_STATUS
+		MDP_INTF_REV_7xxx_INTR_CLEAR(8),
+		MDP_INTF_REV_7xxx_INTR_EN(8),
+		MDP_INTF_REV_7xxx_INTR_STATUS(8)
 	},
 };
 

-- 
2.40.1

