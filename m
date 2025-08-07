Return-Path: <linux-arm-msm+bounces-68036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1533B1DBCB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 18:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 961787E04CF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 16:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5CE27381F;
	Thu,  7 Aug 2025 16:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hmoDhUfn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52606273816;
	Thu,  7 Aug 2025 16:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754584427; cv=none; b=Ul9pUWkzl8E6d5b4HIpuY28e/ed/I7C4VsDzAJcKRmkpmCcyn/5G98xBy++zJvdympgh3+oAVYWqa8DKdZwcNx7cbXeOkEEBeuPLLvMDr1AIJoPPpmi6TsmlDrsH74YZ/lN3qcaFYRjkweZSZEEqp/kZJF+E1NEUYpfriKXvBHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754584427; c=relaxed/simple;
	bh=fegBg5XJiL4auENg2P0V8FBF6syYEdNZYLJxeo4dCHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dfRYoahejKRh9trBPExZsxP724FSXZDiYUzZfc1iDIp+uYkkNal5yA1DgVUGGL8vBOb73bWWYAeAXW/LcS8XC+TD56Ecqwi8ARXnTpGopWSPK7l2wv2DoLKBEh1jRuON5IRejPhATZy2j7XVPJO+wtDcpfwG0gs0iQoYYZVKJuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hmoDhUfn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFDEC4CEF1;
	Thu,  7 Aug 2025 16:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754584427;
	bh=fegBg5XJiL4auENg2P0V8FBF6syYEdNZYLJxeo4dCHE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hmoDhUfnA55C1CPX2W8Y6s76AFA2gNgIynRqpivaVXlXnEwqVfwbf5cypItU1GPh3
	 VABIFhISzjA7QuQBnB+spoR0dPBGLwxc4hsAAJ82S43ouyD2FNs847ZDtPpH7hXY/d
	 NMkIFLr2vINDigkrcC80XKmSknQBY2nGjze67xGW9Gu4/JNtWxcltRUyODCeP7EOwP
	 uyKaCSlPrbjZ1SVcRv6iaQ5U5fhwsrIpFSWrlNFQ5POUYOH8wHD/Uz5Mw1XdioF7tp
	 X8YWA4HnmJF7v3tJwmRik7uqNcyZ0D1idr9uH5y6D8fss9MZGgam8Sbyu+NwR2aFKY
	 kPY3FJ6CIN4iA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 07 Aug 2025 18:33:23 +0200
Subject: [PATCH v4 5/6] phy: qcom: qmp-combo: register a typec mux to
 change the QMPPHY_MODE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250807-topic-4ln_dp_respin-v4-5-43272d6eca92@oss.qualcomm.com>
References: <20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com>
In-Reply-To: <20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754584403; l=5551;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=QJc4KFJBoEuj4vbKzU7XavNaZXgyWM9KB1yFQkVjnoY=;
 b=5UwFM3vdPxfpCiL4Tuxf2i9Z2zhVyy6AfDtdz3kvlhGkXse2upjGHu7XfbI9+tLtgKfp+cZeT
 SEZFvsuyEQFANBwl7lri2sIkeK+2J029BDEmNAEqBB7RN1jz+XJoaTm
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Neil Armstrong <neil.armstrong@linaro.org>

Register a typec mux in order to change the PHY mode on the Type-C
mux events depending on the mode and the svid when in Altmode setup.

The DisplayPort phy should be left enabled if is still powered on
by the DRM DisplayPort controller, so bail out until the DisplayPort
PHY is not powered off.

The Type-C Mode/SVID only changes on plug/unplug, and USB SAFE states
will be set in between of USB-Only, Combo and DisplayPort Only so
this will leave enough time to the DRM DisplayPort controller to
turn of the DisplayPort PHY.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
[konrad: renaming, rewording, bug fixes]
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 118 ++++++++++++++++++++++++++++--
 1 file changed, 113 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index c65837fc9e4c38673fc61d3ae66072ba5a265a70..7b5af30f1d028c592500e723ecd27b54ed554709 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -19,6 +19,7 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/usb/typec.h>
+#include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
 
 #include <drm/bridge/aux-bridge.h>
@@ -1868,6 +1869,8 @@ struct qmp_combo {
 
 	struct typec_switch_dev *sw;
 	enum typec_orientation orientation;
+
+	struct typec_mux_dev *mux;
 };
 
 static void qmp_v3_dp_aux_init(struct qmp_combo *qmp);
@@ -3802,17 +3805,109 @@ static int qmp_combo_typec_switch_set(struct typec_switch_dev *sw,
 	return 0;
 }
 
-static void qmp_combo_typec_unregister(void *data)
+static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *state)
+{
+	struct qmp_combo *qmp = typec_mux_get_drvdata(mux);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	enum qmpphy_mode new_mode;
+	unsigned int svid;
+
+	guard(mutex)(&qmp->phy_mutex);
+
+	if (state->alt)
+		svid = state->alt->svid;
+	else
+		svid = 0;
+
+	if (svid == USB_TYPEC_DP_SID) {
+		switch (state->mode) {
+		/* DP Only */
+		case TYPEC_DP_STATE_C:
+		case TYPEC_DP_STATE_E:
+			new_mode = QMPPHY_MODE_DP_ONLY;
+			break;
+
+		/* DP + USB */
+		case TYPEC_DP_STATE_D:
+		case TYPEC_DP_STATE_F:
+
+		/* Safe fallback...*/
+		default:
+			new_mode = QMPPHY_MODE_USB3DP;
+			break;
+		}
+	} else {
+		/* No DP SVID => don't care, assume it's just USB3 */
+		new_mode = QMPPHY_MODE_USB3_ONLY;
+	}
+
+	if (new_mode == qmp->qmpphy_mode) {
+		dev_dbg(qmp->dev, "typec_mux_set: same qmpphy mode, bail out\n");
+		return 0;
+	}
+
+	if (qmp->qmpphy_mode != QMPPHY_MODE_USB3_ONLY && qmp->dp_powered_on) {
+		dev_dbg(qmp->dev, "typec_mux_set: DP PHY is still in use, delaying switch\n");
+		return 0;
+	}
+
+	dev_dbg(qmp->dev, "typec_mux_set: switching from qmpphy mode %d to %d\n",
+		qmp->qmpphy_mode, new_mode);
+
+	qmp->qmpphy_mode = new_mode;
+
+	if (qmp->init_count) {
+		if (qmp->usb_init_count)
+			qmp_combo_usb_power_off(qmp->usb_phy);
+
+		if (qmp->dp_init_count)
+			writel(DP_PHY_PD_CTL_PSR_PWRDN, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
+
+		qmp_combo_com_exit(qmp, true);
+
+		/* Now everything's powered down, power up the right PHYs */
+		qmp_combo_com_init(qmp, true);
+
+		if (new_mode == QMPPHY_MODE_DP_ONLY) {
+			if (qmp->usb_init_count)
+				qmp->usb_init_count--;
+		}
+
+		if (new_mode == QMPPHY_MODE_USB3DP || new_mode == QMPPHY_MODE_USB3_ONLY) {
+			qmp_combo_usb_power_on(qmp->usb_phy);
+			if (!qmp->usb_init_count)
+				qmp->usb_init_count++;
+		}
+
+		if (new_mode == QMPPHY_MODE_DP_ONLY || new_mode == QMPPHY_MODE_USB3DP) {
+			if (qmp->dp_init_count)
+				cfg->dp_aux_init(qmp);
+		}
+	}
+
+	return 0;
+}
+
+static void qmp_combo_typec_switch_unregister(void *data)
 {
 	struct qmp_combo *qmp = data;
 
 	typec_switch_unregister(qmp->sw);
 }
 
-static int qmp_combo_typec_switch_register(struct qmp_combo *qmp)
+static void qmp_combo_typec_mux_unregister(void *data)
+{
+	struct qmp_combo *qmp = data;
+
+	typec_mux_unregister(qmp->mux);
+}
+
+static int qmp_combo_typec_register(struct qmp_combo *qmp)
 {
 	struct typec_switch_desc sw_desc = {};
+	struct typec_mux_desc mux_desc = { };
 	struct device *dev = qmp->dev;
+	int ret;
 
 	sw_desc.drvdata = qmp;
 	sw_desc.fwnode = dev->fwnode;
@@ -3823,10 +3918,23 @@ static int qmp_combo_typec_switch_register(struct qmp_combo *qmp)
 		return PTR_ERR(qmp->sw);
 	}
 
-	return devm_add_action_or_reset(dev, qmp_combo_typec_unregister, qmp);
+	ret = devm_add_action_or_reset(dev, qmp_combo_typec_switch_unregister, qmp);
+	if (ret)
+		return ret;
+
+	mux_desc.drvdata = qmp;
+	mux_desc.fwnode = dev->fwnode;
+	mux_desc.set = qmp_combo_typec_mux_set;
+	qmp->mux = typec_mux_register(dev, &mux_desc);
+	if (IS_ERR(qmp->mux)) {
+		dev_err(dev, "Unable to register typec mux: %pe\n", qmp->mux);
+		return PTR_ERR(qmp->mux);
+	}
+
+	return devm_add_action_or_reset(dev, qmp_combo_typec_mux_unregister, qmp);
 }
 #else
-static int qmp_combo_typec_switch_register(struct qmp_combo *qmp)
+static int qmp_combo_typec_register(struct qmp_combo *qmp)
 {
 	return 0;
 }
@@ -4059,7 +4167,7 @@ static int qmp_combo_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
-	ret = qmp_combo_typec_switch_register(qmp);
+	ret = qmp_combo_typec_register(qmp);
 	if (ret)
 		goto err_node_put;
 

-- 
2.50.1


