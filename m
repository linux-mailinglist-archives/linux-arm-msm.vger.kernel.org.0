Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCF47E2131
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2019 18:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbfJWQ7W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Oct 2019 12:59:22 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:35031 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726347AbfJWQ7V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Oct 2019 12:59:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1571849957;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=yJSh4O/Weq0HT56NhjFS1glIBJT4Lljt1Ot7yEFQ4Uk=;
        b=sDn/5z25GMoKOqQ8YbhpZC3r4dG4YJqX8bdhzVTfOIiuegm7mZCHHpwQ2lcD3dEs5u
        H2UNgdKMAL/BOJJ3ZE4TTDQcx2AF8zOlE6F1zI+gksU9QSIHsabmnVfXQuS3wn9cEguR
        EOCUgD8H1d/yIbjVVCVBb/10flSotWCAXFDE4izH0P3WRDTyJ/FZnK4e8OpwNkuT6bKj
        Dcb40IKYoEkQKcWt5UsWuCy3MHOKrQtGS1HeSo3jyRhe20BY6Gv0ggI66HTgChv/lQyh
        AgaEW0YbQOi08esUuHeEqyv7WEdVlw1SmTsAaowdF5afxFx6YH+vcRCXEHZrbRjs8bMG
        wGTQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxP526PRnc="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 44.28.1 DYNA|AUTH)
        with ESMTPSA id 409989v9NGxDeZo
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Wed, 23 Oct 2019 18:59:13 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Hai Li <hali@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Nikita Travkin <nikitos.tr@gmail.com>
Subject: [PATCH v2] drm/msm/dsi: Implement qcom,dsi-phy-regulator-ldo-mode for 28nm PHY
Date:   Wed, 23 Oct 2019 18:56:17 +0200
Message-Id: <20191023165617.28738-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DSI PHY regulator supports two regulator modes: LDO and DCDC.
This mode can be selected using the "qcom,dsi-phy-regulator-ldo-mode"
device tree property.

However, at the moment only the 20nm PHY driver actually implements
that option. Add a check in the 28nm PHY driver to program the
registers correctly for LDO mode.

Tested-by: Nikita Travkin <nikitos.tr@gmail.com> # l8150
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Changes in v2: Move DCDC/LDO code into separate methods
v1: https://lore.kernel.org/linux-arm-msm/20191021163425.83697-1-stephan@gerhold.net/

This is needed to make the display work on Longcheer L8150,
which has recently gained mainline support in:
https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?id=16e8e8072108426029f0c16dff7fbe77fae3df8f

This patch is based on code from the downstream kernel:
https://source.codeaurora.org/quic/la/kernel/msm-3.10/tree/drivers/video/msm/mdss/msm_mdss_io_8974.c?h=LA.BR.1.2.9.1-02310-8x16.0#n152

The LDO regulator configuration is taken from msm8916-qrd.dtsi:
https://source.codeaurora.org/quic/la/kernel/msm-3.10/tree/arch/arm/boot/dts/qcom/msm8916-qrd.dtsi?h=LA.BR.1.2.9.1-02310-8x16.0#n56
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 42 +++++++++++++++++-----
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index b3f678f6c2aa..b384ea20f359 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -39,15 +39,10 @@ static void dsi_28nm_dphy_set_timing(struct msm_dsi_phy *phy,
 		DSI_28nm_PHY_TIMING_CTRL_11_TRIG3_CMD(0));
 }
 
-static void dsi_28nm_phy_regulator_ctrl(struct msm_dsi_phy *phy, bool enable)
+static void dsi_28nm_phy_regulator_enable_dcdc(struct msm_dsi_phy *phy)
 {
 	void __iomem *base = phy->reg_base;
 
-	if (!enable) {
-		dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CAL_PWR_CFG, 0);
-		return;
-	}
-
 	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_0, 0x0);
 	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CAL_PWR_CFG, 1);
 	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_5, 0);
@@ -56,6 +51,39 @@ static void dsi_28nm_phy_regulator_ctrl(struct msm_dsi_phy *phy, bool enable)
 	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_1, 0x9);
 	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_0, 0x7);
 	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_4, 0x20);
+	dsi_phy_write(phy->base + REG_DSI_28nm_PHY_LDO_CNTRL, 0x00);
+}
+
+static void dsi_28nm_phy_regulator_enable_ldo(struct msm_dsi_phy *phy)
+{
+	void __iomem *base = phy->reg_base;
+
+	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_0, 0x0);
+	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CAL_PWR_CFG, 0);
+	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_5, 0x7);
+	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_3, 0);
+	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_2, 0x1);
+	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_1, 0x1);
+	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_4, 0x20);
+
+	if (phy->cfg->type == MSM_DSI_PHY_28NM_LP)
+		dsi_phy_write(phy->base + REG_DSI_28nm_PHY_LDO_CNTRL, 0x05);
+	else
+		dsi_phy_write(phy->base + REG_DSI_28nm_PHY_LDO_CNTRL, 0x0d);
+}
+
+static void dsi_28nm_phy_regulator_ctrl(struct msm_dsi_phy *phy, bool enable)
+{
+	if (!enable) {
+		dsi_phy_write(phy->reg_base +
+			      REG_DSI_28nm_PHY_REGULATOR_CAL_PWR_CFG, 0);
+		return;
+	}
+
+	if (phy->regulator_ldo_mode)
+		dsi_28nm_phy_regulator_enable_ldo(phy);
+	else
+		dsi_28nm_phy_regulator_enable_dcdc(phy);
 }
 
 static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
@@ -77,8 +105,6 @@ static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 
 	dsi_28nm_phy_regulator_ctrl(phy, true);
 
-	dsi_phy_write(base + REG_DSI_28nm_PHY_LDO_CNTRL, 0x00);
-
 	dsi_28nm_dphy_set_timing(phy, timing);
 
 	dsi_phy_write(base + REG_DSI_28nm_PHY_CTRL_1, 0x00);
-- 
2.23.0

