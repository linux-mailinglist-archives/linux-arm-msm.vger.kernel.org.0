Return-Path: <linux-arm-msm+bounces-78905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0E8C0DF7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:19:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4E8CD4F60A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25ED325784E;
	Mon, 27 Oct 2025 13:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PyrB0YhT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF62225782A;
	Mon, 27 Oct 2025 13:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761570152; cv=none; b=AJeruXG6vfJwqNDIA6mgVxW/qa06Rpp0/U0h98FPcRmQ1AF8kS8niFiOY/SbgUFloyutGF2Zzo61zA53r7u432jlOK0njtZRzrpxNsEAHEl0uufjCnRP5PBeXuxY2wDnlO9NJKX+AXhx5BScpJU2pcsYepC0XqSWP4zvK1ByBXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761570152; c=relaxed/simple;
	bh=B5/2fJuj0llEydCKzz1l5nP8dp2nKovmE+gnGvEMlNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=STCBJjYjXm1fzu9QoXi0Zt+RfL1ZcLlsXbz4c9ER7joidox9XrG25cloE0YYi/WvihqkQQ/JfH+xdHsly+xbKbCUIQyLqhvT42WwxL2hUBDQoQWHJVQ03fWW/7pG8kpi7Juh+eLeH3xm5BPMr5OFKPfCxdnPfovqNutXzdF1flY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PyrB0YhT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52A01C4CEF1;
	Mon, 27 Oct 2025 13:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761570149;
	bh=B5/2fJuj0llEydCKzz1l5nP8dp2nKovmE+gnGvEMlNk=;
	h=From:Date:Subject:To:Cc:From;
	b=PyrB0YhT8GeeebNw8jB6EQ8x29mKYzlhoyltkd8yD6X7fcpiFYthcG3YGxuqFf+UL
	 Cd7mHsHqV8CY38nnjmrjyNBWPVBomqIQdwrsiOjALL12C9fnG5rRMyT/87z4+xOxzn
	 pOS8bQR1lncBBraoOg1U44Q6GIAeSMOQIV++OsFj2BX4rXHuqIAEyKdyBSqmOGpyqC
	 tzqQ2ZzryG2pNk7rdeCkacBwqRB2rmaWVFnerJ2U4QzpHF//obx/IMK/5nKn7yA5IB
	 wE6rWb2WFf4i13tqe+m+hchESes4zweIzlGZz6uOwS7QJkTiM+Lmu5bF3NCsobvWat
	 3mkIy9Cm+PTLg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 27 Oct 2025 14:02:14 +0100
Subject: [PATCH] soc: qcom: pmic_glink_altmode: Consume TBT3/USB4 mode
 notifications
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-topic-pg_altmode_usb4-v1-1-2931a3ecc146@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFZt/2gC/x3MWwqAIBBA0a3EfCf46EFtJSJMpxqoFK0Ior0nf
 Z6Pex+IGAgjtNkDAS+K5PYEkWdgFr3PyMgmg+SyFFzW7HCeDPPzoNdjcxaHM44F06ZorFbKcFF
 Ban3Aie7/2/Xv+wHVM0HTZwAAAA==
X-Change-ID: 20251027-topic-pg_altmode_usb4-ac49da33c016
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jack Pham <jack.pham@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761570146; l=10513;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=NwKHVA9VTFHEowes5xL+aTOPpTXiWQTkEyzUXnkrDdE=;
 b=3k29Fv2M68O4PpPIySOf66WvJiUwpiYlvMpcPT6No+3AXp+bF6CSOqbbSKrZcNdlGvzibL+DW
 C3j/asnJsIJC1V7fK9TkoMKd60GeEvQVFbzQijKpuWiNjuU6i4fxVHv
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Some compute SoCs support additional operation modes, extending the
existing set of USB3/safe/DP-alt-mode.

The firmware performs all the necessary handshakes for
us and there is no room for error on that level (i.e. the sequences
will match what happens on Windows).

The trade-off with that approach is that the received notifications
trim some of the PDO/EUDO data (particularly the cable/plug parts),
offering a set of similar-in-nature-but-not-the-same indicators.

In an attempt to remedy this, I reconstructed some of it, so that the
connected mux/retimer drivers can continue to behave as expected.

Add support for parsing the aforementioned data coming from PMIC_GLINK
and passing it on to the various Type-C components.

Reviewed-by: Jack Pham <jack.pham@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
note: I carried Jack's r-b from an internal pre-review
---
 drivers/soc/qcom/pmic_glink_altmode.c | 188 +++++++++++++++++++++++++++++-----
 1 file changed, 165 insertions(+), 23 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 7f11acd33323..d0afdcb96ee1 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -14,10 +14,12 @@
 #include <linux/soc/qcom/pdr.h>
 #include <drm/bridge/aux-bridge.h>
 
+#include <linux/usb/pd.h>
 #include <linux/usb/typec_altmode.h>
 #include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
 #include <linux/usb/typec_retimer.h>
+#include <linux/usb/typec_tbt.h>
 
 #include <linux/soc/qcom/pmic_glink.h>
 
@@ -37,11 +39,38 @@ struct usbc_write_req {
 	__le32 reserved;
 };
 
-#define NOTIFY_PAYLOAD_SIZE 16
+struct usbc_sc8280x_dp_data {
+	u8 pin_assignment : 6;
+	u8 hpd_state : 1;
+	u8 hpd_irq : 1;
+	u8 res[7];
+};
+
+/* Used for both TBT and USB4 notifications */
+struct usbc_sc8280x_tbt_data {
+	u8 usb_speed : 3;
+	u8 cable_type : 3;
+	/* This field is NOP on USB4, all cables support rounded rates by spec */
+	u8 rounded_cable : 1;
+	u8 power_limited : 1;
+	u8 res[11];
+};
+
 struct usbc_notify {
 	struct pmic_glink_hdr hdr;
-	char payload[NOTIFY_PAYLOAD_SIZE];
-	u32 reserved;
+	u8 port_idx;
+	u8 orientation;
+	u8 mux_ctrl;
+#define MUX_CTRL_STATE_NO_CONN			0
+#define MUX_CTRL_STATE_TUNNELING		4
+
+	u8 res;
+	__le16 vid;
+	__le16 svid;
+	union usbc_sc8280x_extended_data {
+		struct usbc_sc8280x_dp_data dp;
+		struct usbc_sc8280x_tbt_data tbt;
+	} extended_data;
 };
 
 struct usbc_sc8180x_notify {
@@ -74,6 +103,7 @@ struct pmic_glink_altmode_port {
 	struct typec_retimer *typec_retimer;
 	struct typec_retimer_state retimer_state;
 	struct typec_altmode dp_alt;
+	struct typec_altmode tbt_alt;
 
 	struct work_struct work;
 
@@ -81,10 +111,12 @@ struct pmic_glink_altmode_port {
 
 	enum typec_orientation orientation;
 	u16 svid;
+	struct usbc_sc8280x_tbt_data tbt_data;
 	u8 dp_data;
 	u8 mode;
 	u8 hpd_state;
 	u8 hpd_irq;
+	u8 mux_ctrl;
 };
 
 #define work_to_altmode(w) container_of((w), struct pmic_glink_altmode, enable_work)
@@ -170,6 +202,102 @@ static void pmic_glink_altmode_enable_dp(struct pmic_glink_altmode *altmode,
 		dev_err(altmode->dev, "failed to setup retimer to DP: %d\n", ret);
 }
 
+static void pmic_glink_altmode_enable_tbt(struct pmic_glink_altmode *altmode,
+					  struct pmic_glink_altmode_port *port)
+{
+	struct usbc_sc8280x_tbt_data *tbt = &port->tbt_data;
+	struct typec_thunderbolt_data tbt_data = {};
+	u32 cable_speed;
+	int ret;
+
+	/* Device Discover Mode VDO */
+	tbt_data.device_mode = TBT_MODE;
+	tbt_data.device_mode |= TBT_SET_ADAPTER(TBT_ADAPTER_TBT3);
+
+	/* Cable Discover Mode VDO */
+	tbt_data.cable_mode = TBT_MODE;
+
+	if (tbt->usb_speed == 0) {
+		cable_speed = TBT_CABLE_USB3_PASSIVE;
+	} else if (tbt->usb_speed == 1) {
+		cable_speed = TBT_CABLE_10_AND_20GBPS;
+	} else {
+		dev_err(altmode->dev,
+			"Got illegal TBT3 cable speed value (%u), falling back to passive\n",
+			tbt->usb_speed);
+		cable_speed = TBT_CABLE_USB3_PASSIVE;
+	}
+	tbt_data.cable_mode |= TBT_SET_CABLE_SPEED(cable_speed);
+
+	if (tbt->cable_type) {
+		tbt_data.cable_mode |= TBT_CABLE_ACTIVE_PASSIVE;
+		tbt_data.cable_mode |= TBT_SET_CABLE_ROUNDED(tbt->rounded_cable);
+	}
+
+	/* Enter Mode VDO */
+	tbt_data.enter_vdo |= TBT_MODE;
+	tbt_data.enter_vdo |= TBT_ENTER_MODE_CABLE_SPEED(cable_speed);
+
+	if (tbt->cable_type) {
+		tbt_data.enter_vdo |= TBT_CABLE_ACTIVE_PASSIVE;
+		tbt_data.enter_vdo |= TBT_SET_CABLE_ROUNDED(tbt->rounded_cable);
+	}
+
+	port->state.alt = &port->tbt_alt;
+	port->state.data = &tbt_data;
+	port->state.mode = TYPEC_MODAL_STATE(port->mode);
+
+	ret = typec_mux_set(port->typec_mux, &port->state);
+	if (ret)
+		dev_err(altmode->dev, "failed to switch mux to USB: %d\n", ret);
+
+	port->retimer_state.alt = &port->tbt_alt;
+	port->retimer_state.data = &tbt_data;
+	port->retimer_state.mode = TYPEC_MODAL_STATE(port->mode);
+
+	ret = typec_retimer_set(port->typec_retimer, &port->retimer_state);
+	if (ret)
+		dev_err(altmode->dev, "failed to setup retimer to USB: %d\n", ret);
+}
+
+static void pmic_glink_altmode_enable_usb4(struct pmic_glink_altmode *altmode,
+					   struct pmic_glink_altmode_port *port)
+{
+	struct usbc_sc8280x_tbt_data *tbt = &port->tbt_data;
+	struct enter_usb_data data = {};
+	int ret;
+
+	data.eudo = FIELD_PREP(EUDO_USB_MODE_MASK, EUDO_USB_MODE_USB4);
+
+	if (tbt->usb_speed == 0) {
+		data.eudo |= FIELD_PREP(EUDO_CABLE_SPEED_MASK, EUDO_CABLE_SPEED_USB4_GEN2);
+	} else if (tbt->usb_speed == 1) {
+		data.eudo |= FIELD_PREP(EUDO_CABLE_SPEED_MASK, EUDO_CABLE_SPEED_USB4_GEN3);
+	} else {
+		pr_err("Got illegal USB4 cable speed value (%u), falling back to G2\n",
+		       tbt->usb_speed);
+		data.eudo |= FIELD_PREP(EUDO_CABLE_SPEED_MASK, EUDO_CABLE_SPEED_USB4_GEN2);
+	}
+
+	data.eudo |= FIELD_PREP(EUDO_CABLE_TYPE_MASK, tbt->cable_type);
+
+	port->state.alt = NULL;
+	port->state.data = &data;
+	port->state.mode = TYPEC_MODE_USB4;
+
+	ret = typec_mux_set(port->typec_mux, &port->state);
+	if (ret)
+		dev_err(altmode->dev, "failed to switch mux to USB: %d\n", ret);
+
+	port->retimer_state.alt = NULL;
+	port->retimer_state.data = &data;
+	port->retimer_state.mode = TYPEC_MODE_USB4;
+
+	ret = typec_retimer_set(port->typec_retimer, &port->retimer_state);
+	if (ret)
+		dev_err(altmode->dev, "failed to setup retimer to USB: %d\n", ret);
+}
+
 static void pmic_glink_altmode_enable_usb(struct pmic_glink_altmode *altmode,
 					  struct pmic_glink_altmode_port *port)
 {
@@ -222,15 +350,15 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 
 	typec_switch_set(alt_port->typec_switch, alt_port->orientation);
 
-	if (alt_port->svid == USB_TYPEC_DP_SID) {
-		if (alt_port->mode == 0xff) {
-			pmic_glink_altmode_safe(altmode, alt_port);
-		} else {
-			pmic_glink_altmode_enable_dp(altmode, alt_port,
-						     alt_port->mode,
-						     alt_port->hpd_state,
-						     alt_port->hpd_irq);
-		}
+	if (alt_port->mux_ctrl == MUX_CTRL_STATE_NO_CONN) {
+		pmic_glink_altmode_safe(altmode, alt_port);
+	} else if (alt_port->svid == USB_TYPEC_TBT_SID) {
+		pmic_glink_altmode_enable_tbt(altmode, alt_port);
+	} else if (alt_port->svid == USB_TYPEC_DP_SID) {
+		pmic_glink_altmode_enable_dp(altmode, alt_port,
+					     alt_port->mode,
+					     alt_port->hpd_state,
+					     alt_port->hpd_irq);
 
 		if (alt_port->hpd_state)
 			conn_status = connector_status_connected;
@@ -238,6 +366,8 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 			conn_status = connector_status_disconnected;
 
 		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
+	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
+		pmic_glink_altmode_enable_usb4(altmode, alt_port);
 	} else {
 		pmic_glink_altmode_enable_usb(altmode, alt_port);
 	}
@@ -314,11 +444,10 @@ static void pmic_glink_altmode_sc8280xp_notify(struct pmic_glink_altmode *altmod
 					       u16 svid, const void *data, size_t len)
 {
 	struct pmic_glink_altmode_port *alt_port;
+	const struct usbc_sc8280x_tbt_data *tbt;
+	const struct usbc_sc8280x_dp_data *dp;
 	const struct usbc_notify *notify;
 	u8 orientation;
-	u8 hpd_state;
-	u8 hpd_irq;
-	u8 mode;
 	u8 port;
 
 	if (len != sizeof(*notify)) {
@@ -329,11 +458,8 @@ static void pmic_glink_altmode_sc8280xp_notify(struct pmic_glink_altmode *altmod
 
 	notify = data;
 
-	port = notify->payload[0];
-	orientation = notify->payload[1];
-	mode = FIELD_GET(SC8280XP_DPAM_MASK, notify->payload[8]) - DPAM_HPD_A;
-	hpd_state = FIELD_GET(SC8280XP_HPD_STATE_MASK, notify->payload[8]);
-	hpd_irq = FIELD_GET(SC8280XP_HPD_IRQ_MASK, notify->payload[8]);
+	port = notify->port_idx;
+	orientation = notify->orientation;
 
 	if (port >= ARRAY_SIZE(altmode->ports) || !altmode->ports[port].altmode) {
 		dev_dbg(altmode->dev, "notification on undefined port %d\n", port);
@@ -343,9 +469,21 @@ static void pmic_glink_altmode_sc8280xp_notify(struct pmic_glink_altmode *altmod
 	alt_port = &altmode->ports[port];
 	alt_port->orientation = pmic_glink_altmode_orientation(orientation);
 	alt_port->svid = svid;
-	alt_port->mode = mode;
-	alt_port->hpd_state = hpd_state;
-	alt_port->hpd_irq = hpd_irq;
+	alt_port->mux_ctrl = notify->mux_ctrl;
+
+	if (svid == USB_TYPEC_DP_SID) {
+		dp = &notify->extended_data.dp;
+
+		alt_port->mode = dp->pin_assignment - DPAM_HPD_A;
+		alt_port->hpd_state = dp->hpd_state;
+		alt_port->hpd_irq = dp->hpd_irq;
+	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
+		/* Valid for both USB4 and TBT3 */
+		tbt = &notify->extended_data.tbt;
+
+		alt_port->tbt_data = *tbt;
+	}
+
 	schedule_work(&alt_port->work);
 }
 
@@ -471,6 +609,10 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
 		alt_port->dp_alt.mode = USB_TYPEC_DP_MODE;
 		alt_port->dp_alt.active = 1;
 
+		alt_port->tbt_alt.svid = USB_TYPEC_TBT_SID;
+		alt_port->tbt_alt.mode = TYPEC_TBT_MODE;
+		alt_port->tbt_alt.active = 1;
+
 		alt_port->typec_mux = fwnode_typec_mux_get(fwnode);
 		if (IS_ERR(alt_port->typec_mux)) {
 			fwnode_handle_put(fwnode);

---
base-commit: 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
change-id: 20251027-topic-pg_altmode_usb4-ac49da33c016

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


