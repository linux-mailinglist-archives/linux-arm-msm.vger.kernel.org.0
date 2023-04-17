Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5805F6E519E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Apr 2023 22:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbjDQUV7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Apr 2023 16:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbjDQUVv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Apr 2023 16:21:51 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14A59559A
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 13:21:50 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id BE0B53F8B8;
        Mon, 17 Apr 2023 22:21:47 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
Date:   Mon, 17 Apr 2023 22:21:45 +0200
Subject: [PATCH v2 06/17] drm/msm/dpu: Remove extraneous register define
 indentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-dpu-intf-te-v2-6-ef76c877eb97@somainline.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
In-Reply-To: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
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
        Rajesh Yadav <ryadav@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Archit Taneja <architt@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A bunch of registers are indented with two extra spaces, looking as if
these are values corresponding to the previous register which is not the
case, rather these are simply also register offsets and should only have
a single space separating them and the #define keyword.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 41 +++++++++++++++--------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index b9dddf576c02..1d22d7dc99b8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -38,26 +38,27 @@
 #define INTF_ACTIVE_DATA_HCTL           0x068
 #define INTF_FRAME_LINE_COUNT_EN        0x0A8
 #define INTF_FRAME_COUNT                0x0AC
-#define   INTF_LINE_COUNT               0x0B0
-
-#define   INTF_DEFLICKER_CONFIG         0x0F0
-#define   INTF_DEFLICKER_STRNG_COEFF    0x0F4
-#define   INTF_DEFLICKER_WEAK_COEFF     0x0F8
-
-#define   INTF_DSI_CMD_MODE_TRIGGER_EN  0x084
-#define   INTF_PANEL_FORMAT             0x090
-#define   INTF_TPG_ENABLE               0x100
-#define   INTF_TPG_MAIN_CONTROL         0x104
-#define   INTF_TPG_VIDEO_CONFIG         0x108
-#define   INTF_TPG_COMPONENT_LIMITS     0x10C
-#define   INTF_TPG_RECTANGLE            0x110
-#define   INTF_TPG_INITIAL_VALUE        0x114
-#define   INTF_TPG_BLK_WHITE_PATTERN_FRAMES   0x118
-#define   INTF_TPG_RGB_MAPPING          0x11C
-#define   INTF_PROG_FETCH_START         0x170
-#define   INTF_PROG_ROT_START           0x174
-#define   INTF_MUX                      0x25C
-#define   INTF_STATUS                   0x26C
+#define INTF_LINE_COUNT                 0x0B0
+
+#define INTF_DEFLICKER_CONFIG           0x0F0
+#define INTF_DEFLICKER_STRNG_COEFF      0x0F4
+#define INTF_DEFLICKER_WEAK_COEFF       0x0F8
+
+#define INTF_DSI_CMD_MODE_TRIGGER_EN    0x084
+#define INTF_PANEL_FORMAT               0x090
+#define INTF_TPG_ENABLE                 0x100
+#define INTF_TPG_MAIN_CONTROL           0x104
+#define INTF_TPG_VIDEO_CONFIG           0x108
+#define INTF_TPG_COMPONENT_LIMITS       0x10C
+#define INTF_TPG_RECTANGLE              0x110
+#define INTF_TPG_INITIAL_VALUE          0x114
+#define INTF_TPG_BLK_WHITE_PATTERN_FRAMES 0x118
+#define INTF_TPG_RGB_MAPPING            0x11C
+#define INTF_PROG_FETCH_START           0x170
+#define INTF_PROG_ROT_START             0x174
+
+#define INTF_MUX                        0x25C
+#define INTF_STATUS                     0x26C
 
 #define INTF_CFG_ACTIVE_H_EN	BIT(29)
 #define INTF_CFG_ACTIVE_V_EN	BIT(30)

-- 
2.40.0

