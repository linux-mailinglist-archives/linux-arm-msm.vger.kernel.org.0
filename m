Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 290024B94CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 01:08:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232440AbiBQAIz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 19:08:55 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbiBQAIy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 19:08:54 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E89B92A0D5F
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 16:08:40 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id u16so5837113ljk.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 16:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cJ+5mbwD/7lPCQPyt9Z7JoknhxYPPxgDVRd9pXODZ5o=;
        b=vC3CA/0YHRFW4zBqC0DeMPM5gDVicSFaSDXd1UK11xJBi8q+szSDcaAv33hiWrgkj4
         EL26NvtOIjV1cQWedrxXJuGCDYKAYK14sVCzugaPkkdrCHWzDJDITQ1aVWcReqPd0R8j
         E5Iy5vHe2r8W+Fi6hP/VgoGwjKCO17p0Ma3win19afh4VMLQN7RvgbVe+Sui+M/q0Ukc
         q/R3yQ8MCJfox1DA4wXjPJxHlcknj3AllFDXIHC6/ySzK0bhmoNhbewwQ68tuwIO1MvZ
         7n9idR0HtuLK6VNP8/OKunOf4lAA8XWw/zeTlq3jT28tT675wPvlX3yl+N6gSgTaDDlO
         pyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cJ+5mbwD/7lPCQPyt9Z7JoknhxYPPxgDVRd9pXODZ5o=;
        b=dvct3E/Bvuo+yC0uQi80G0NyTLHOIk4lDf7XNFX4l3dz/okahRlZ+odmcPhdrGzZOS
         IybhHDp9vDlzuoPTqdz6rZOLb3wPsxkE5heqcH9ge/Po+mq9zTntIBiIOu1ARCZYX6PJ
         dQ1qpP08GxWtDKkQXoV1pbddvW4j+0i7qC7JMQGWKlsr/Oyp3T70K0qe2jQC5Eeuykak
         pBKhTKQsEfXr+haXTCwWuuhLlKUfnVQAD6+wlCdqVkU5G+gtHbORt5aiXYJWzXfDz4+7
         QoBnt9sWM6pU4bqCtHibgdfXIO5EkmZ+3ghx2pFMhMoveUaAOnL5jOtujVVlwOzJYYnA
         bMrg==
X-Gm-Message-State: AOAM533oRwLNCYLHXsGtOabD4ZNr20P8hYcquqZdEUXRHmuTN6xsm3vV
        a6GCc45iQHnimQ8Fa3LTcdAuLA==
X-Google-Smtp-Source: ABdhPJyNCL64USD67u1GLsNkk0UPMfyzMabfTjAIsduxOUYQMuJVlRYXMbUVQS/fcJg7SwvRnyLHAA==
X-Received: by 2002:a05:651c:307:b0:244:dc4c:c2f2 with SMTP id a7-20020a05651c030700b00244dc4cc2f2mr331058ljp.531.1645056519081;
        Wed, 16 Feb 2022 16:08:39 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x3sm740845lfr.283.2022.02.16.16.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 16:08:38 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dsi/phy: fix 7nm v4.0 settings for C-PHY mode
Date:   Thu, 17 Feb 2022 03:08:37 +0300
Message-Id: <20220217000837.435340-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The dsi_7nm_phy_enable() disagrees with downstream for
glbl_str_swi_cal_sel_ctrl and glbl_hstx_str_ctrl_0 values. Update
programmed settings to match downstream driver. To remove the
possibility for such errors in future drop less_than_1500_mhz
assignment and specify settings explicitly.

Fixes: 5ac178381d26 ("drm/msm/dsi: support CPHY mode for 7nm pll/phy")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 36eb6109cb88..6e506feb111f 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -864,20 +864,26 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 	/* Alter PHY configurations if data rate less than 1.5GHZ*/
 	less_than_1500_mhz = (clk_req->bitclk_rate <= 1500000000);
 
-	/* For C-PHY, no low power settings for lower clk rate */
-	if (phy->cphy_mode)
-		less_than_1500_mhz = false;
-
 	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
 		vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
-		glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x00;
-		glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x39 :  0x3c;
+		if (phy->cphy_mode) {
+			glbl_rescode_top_ctrl = 0x00;
+			glbl_rescode_bot_ctrl = 0x3c;
+		} else {
+			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x00;
+			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x39 :  0x3c;
+		}
 		glbl_str_swi_cal_sel_ctrl = 0x00;
 		glbl_hstx_str_ctrl_0 = 0x88;
 	} else {
 		vreg_ctrl_0 = less_than_1500_mhz ? 0x5B : 0x59;
-		glbl_str_swi_cal_sel_ctrl = less_than_1500_mhz ? 0x03 : 0x00;
-		glbl_hstx_str_ctrl_0 = less_than_1500_mhz ? 0x66 : 0x88;
+		if (phy->cphy_mode) {
+			glbl_str_swi_cal_sel_ctrl = 0x03;
+			glbl_hstx_str_ctrl_0 = 0x66;
+		} else {
+			glbl_str_swi_cal_sel_ctrl = less_than_1500_mhz ? 0x03 : 0x00;
+			glbl_hstx_str_ctrl_0 = less_than_1500_mhz ? 0x66 : 0x88;
+		}
 		glbl_rescode_top_ctrl = 0x03;
 		glbl_rescode_bot_ctrl = 0x3c;
 	}
-- 
2.34.1

