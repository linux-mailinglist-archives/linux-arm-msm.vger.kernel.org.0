Return-Path: <linux-arm-msm+bounces-98196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLmXLElkuWlsCwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:25:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E46D2ABDA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A86A319E21C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 14:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F8C3E3D8C;
	Tue, 17 Mar 2026 14:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kdeq5Pbm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EEB3E3C64;
	Tue, 17 Mar 2026 14:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756885; cv=none; b=AU0oVXn4EzzgYjrPMUSBPUPPoIR/YbQ1AFe1LdTb4UBKEsgKnCXCbo2rNYOu52BYrb6ryU9S6WwWUk6/5lQIyHRl/JqqW54MkIFOA1+xcWy3CxiO6I3v9LFzeSvg6tAOnQjHwrE4pZB7RfREDVMUsYA33mGRHOOWASiTfP+691A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756885; c=relaxed/simple;
	bh=vzyUBQC/PtIalKKBemzwI8n5sXQNDqBwffwxeJyopxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eho7up1HixEqhglXOu2FYkH+PNg4HLFzPmlyqSlvDfJo6n6DwYBRYTRYptH+oCdflKBi8yKyqZjE8ikjApZFpH4u1j1b/P1tjimmqc1BZbImwKmb5IZkQ5bkVroEUxUWZsh3mWcRnWWklsltixhYWYTHSQtRV2mBR3sek19ZHWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kdeq5Pbm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B2EC4CEF7;
	Tue, 17 Mar 2026 14:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773756885;
	bh=vzyUBQC/PtIalKKBemzwI8n5sXQNDqBwffwxeJyopxo=;
	h=From:Date:Subject:To:Cc:From;
	b=kdeq5PbmUSX2Sd51cN0XUZH7oEmVQTDag/r9tTIZt+56e/bERfVVn4AAldtljv92D
	 8Act5G04+Uq0MxpOhLk8CbFdx7L4upBJFvBPkjQap9v8rNQfZmGQ/b2lSvPy+erGOV
	 yd/csO+ONkpC5mqjVXBhc3cj2nXo523FN1MJmCaW3SZRDTgXuodRHE8916eGuFu6/p
	 Rht25rI+7GMWV74nOGCR0ztDtIhU/o5XTaGRfP6pxEbRQZBKYpBidHcvAKvNSecIaM
	 mLv5Uyb1HowlfXocz/nr8EGYw0lVsyYtF4h84O3JuhqAldlkleDDrVJmtuasEp6zj0
	 LDuKiP3tbmQ/Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 17 Mar 2026 15:14:40 +0100
Subject: [PATCH] soc: qcom: pmic_glink_altmode: Fix TBT->SAFE->!TBT
 transition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-topic-tbt_pg_fixup-v1-1-325b8647bc82@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MWwqAIBAArxL7naBGz6tESNlq+1OiFoF496TPY
 ZhJENATBpiqBB4fCnSdBURdgT7W0yKjvTBILjveiJ7Fy5FmcYvKWWXovR3jokOjxxZ3OUAJncc
 i/um85PwBoVYkd2QAAAA=
X-Change-ID: 20260317-topic-tbt_pg_fixup-016efc95ed28
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773756883; l=3028;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=Mt/45ufEKyuu26PusILxu/GRnBr8BCxZIrDEk3T9SgQ=;
 b=BUhOHk3EjyppH+ZOLXlpkASWuW/N5cQ3D8M0Qj1npDF6rXd8cr8sojBidsH0PbVuDv7VXPmU9
 Tpo5khiFCu0DMx1RLJsjUpwzj5ceEez+xdHCY9+ESPJybJPRuuNFXcI
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98196-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 3E46D2ABDA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Similar to the case of commit d48708500610 ("soc: qcom:
pmic_glink_altmode: Fix SVID=DP && unconnected edge case"), leaving the
TBT altmode makes pmic_glink_altmode report a SVID=TBT && mux_ctrl=0
message.

Said commit reordered the check such that the SVID is processed before
checking for NO_CONN. Rework this to take into account valid values of
mux_ctrl first and hopefully solve this for good..

Fixes: d48708500610 ("soc: qcom: pmic_glink_altmode: Fix SVID=DP && unconnected edge case")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index b496b88842a2..619bad2c27ee 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -62,6 +62,9 @@ struct usbc_notify {
 	u8 orientation;
 	u8 mux_ctrl;
 #define MUX_CTRL_STATE_NO_CONN			0
+#define MUX_CTRL_STATE_USB3_ONLY		1
+#define MUX_CTRL_STATE_DP4LN			2
+#define MUX_CTRL_STATE_USB3_DP			3
 #define MUX_CTRL_STATE_TUNNELING		4
 
 	u8 res;
@@ -350,9 +353,12 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 
 	typec_switch_set(alt_port->typec_switch, alt_port->orientation);
 
-	if (alt_port->svid == USB_TYPEC_TBT_SID) {
-		pmic_glink_altmode_enable_tbt(altmode, alt_port);
-	} else if (alt_port->svid == USB_TYPEC_DP_SID) {
+	/*
+	 * MUX_CTRL_STATE_DP4LN/USB3_DP may only be set if SVID=DP, but we need
+	 * to special-case the SVID=DP && mux_ctrl=NO_CONN case to deliver a
+	 * HPD notification
+	 */
+	if (alt_port->svid == USB_TYPEC_DP_SID) {
 		if (alt_port->mux_ctrl == MUX_CTRL_STATE_NO_CONN) {
 			pmic_glink_altmode_safe(altmode, alt_port);
 		} else {
@@ -369,11 +375,18 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 
 		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
 	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
-		pmic_glink_altmode_enable_usb4(altmode, alt_port);
+		if (alt_port->svid == USB_TYPEC_TBT_SID)
+			pmic_glink_altmode_enable_tbt(altmode, alt_port);
+		else
+			pmic_glink_altmode_enable_usb4(altmode, alt_port);
+	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_USB3_ONLY) {
+		pmic_glink_altmode_enable_usb(altmode, alt_port);
 	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_NO_CONN) {
 		pmic_glink_altmode_safe(altmode, alt_port);
 	} else {
-		pmic_glink_altmode_enable_usb(altmode, alt_port);
+		dev_err(altmode->dev, "Got unknown mux_ctrl: %u on port %u, forcing safe mode\n",
+			alt_port->mux_ctrl, alt_port->index);
+		pmic_glink_altmode_safe(altmode, alt_port);
 	}
 
 	pmic_glink_altmode_request(altmode, ALTMODE_PAN_ACK, alt_port->index);

---
base-commit: 95c541ddfb0815a0ea8477af778bb13bb075079a
change-id: 20260317-topic-tbt_pg_fixup-016efc95ed28

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


