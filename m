Return-Path: <linux-arm-msm+bounces-95788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPQPFJS4qmkiVwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 12:20:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D853721F94F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 12:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2E0E304A2E4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 11:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3428837C11A;
	Fri,  6 Mar 2026 11:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lrBprAtx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1152035F160;
	Fri,  6 Mar 2026 11:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772796022; cv=none; b=NqNq8VnRaHApleGygWqqWJ97W82YA2Bqdsv3AcDPiVAXw0TX/0zNXCwgMDU/AfOFyHHVPzYAd9f6CCcg24BqIeMi8euPUnpULC8IaBFmZPJlIOryn8lxpSA8xCUEglt19HQEmHUR48et9OzX1QgZwGnqWCNdM0LQYWslyKL41iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772796022; c=relaxed/simple;
	bh=grKu34kNhrUBmHyAlC+6nh0pvMxynsxAC2rQuqGFPqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hKK8aRRWbuN3rSd+tVBo9ZKhfKZlFMv0KkLhWLJ39LhsYsZB9KMsgSmfBM2TQeeej+40wyfotY4JSjqz0/UTcXQT03mDnUVTAvZjrltCKAwY466LNjg4xCIGvSCbyeN2PEYfh7ZdPyyDv3Ag9p/TlCN/+XLOjU3uQX1lk4lTtuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lrBprAtx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16E85C4CEF7;
	Fri,  6 Mar 2026 11:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772796021;
	bh=grKu34kNhrUBmHyAlC+6nh0pvMxynsxAC2rQuqGFPqY=;
	h=From:Date:Subject:To:Cc:From;
	b=lrBprAtxPGo5tYh3/07F4QjyrNPPzon2a8N63OAQLy4LiPo+KUeFfo8oH+JO8wjpK
	 aTEydGR0SfOduUanCB44MrQnmW6jtiuv7VkLrrxxnoCYO9LqKrh9wPBxUAVTtEBjT+
	 4bKyoWv63yvfepKw/fuwDWTsve+zy/UzSF/fNCgIPWsYAB+9VOCNtZ8UZpRppPo4/P
	 arDnMFIG37vTObGnahQvUPGeLfcL7LaZgGRjhwdZoUqJ7NzMncLZsVgEEjfmdogHpA
	 LnQ2McnKYwDk2akkKazjQS8i83LsSkPXzW9HKFjScR6mWDY7OYWLnvOLi3PtPFFFjr
	 kjExWJdekosXQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 06 Mar 2026 12:20:14 +0100
Subject: [PATCH] soc: qcom: pmic_glink_altmode: Fix SVID=DP && unconnected
 edge case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-topic-pgaltmode_fixup-v1-1-ec154b2d8e89@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MWwqAIBAArxL7nWAPpbpKRJRttVApahGId0/6H
 IaZAA4toYMuC2DxIUf6SlDkGah9ujZktCSGkpeSV1wyrw0pZrbp8KdecFzpvQ2Tc900reRYCQG
 pNRaT+L/9EOMHd05ULWcAAAA=
X-Change-ID: 20260306-topic-pgaltmode_fixup-6b488960e355
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Jack Pham <jack.pham@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772796018; l=3177;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=/CPrTX1258m2K0Rx/+/segQx2195qtnbpZLh20i2S/8=;
 b=YiI321nkeZvFFu77TbGVoohiJ5JOUyH4Q/IOZHvp9MMF1FFz04dAY8GeD92eMaRH421gAr3T1
 ZUrMJlzapWwACw9tFDy5iTfenmmW4OYbC1u56gD5Jy7vcq5BVqqorzx
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: D853721F94F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95788-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The commit referenced in Fixes started evaluating the value of
alt_port->mux_ctrl before checking the active SVID. This led to
drm_aux_hpd_bridge_notify() no longer being called for the 'DP unplug'
case.

Perhaps somewhat interestingly, the firmware sends a notification with
SVID=DP, mux_ctrl=MUX_CTRL_STATE_NO_CONN and pin_assignment=0 on
unplug. 'pin_assignment' was previously interpreted as a bitfield
excerpt from the second byte of the DP pg_altmode payload (and stored
as an u8).

That value is used in pmic_glink_altmode_sc8280xp_notify(), decremented
by 1 (DPAM_HPD_A). Previously, this would result in an u8 underflow
that would rollover to 0xff (which prior to the Fixes patch would have
caused a pmic_glink_altmode_safe() and 'disconnected' bridge
notification). That check was removed, without a replacement.

Resolve this issue by making sure the SID=DP && mux_ctrl=NO_CONN combo
once again results in a HPD bridge notification.

Fixes: 0539c5a6fdef ("soc: qcom: pmic_glink_altmode: Consume TBT3/USB4 mode notifications")
Reported-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index d0afdcb96ee1..b496b88842a2 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -350,15 +350,17 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 
 	typec_switch_set(alt_port->typec_switch, alt_port->orientation);
 
-	if (alt_port->mux_ctrl == MUX_CTRL_STATE_NO_CONN) {
-		pmic_glink_altmode_safe(altmode, alt_port);
-	} else if (alt_port->svid == USB_TYPEC_TBT_SID) {
+	if (alt_port->svid == USB_TYPEC_TBT_SID) {
 		pmic_glink_altmode_enable_tbt(altmode, alt_port);
 	} else if (alt_port->svid == USB_TYPEC_DP_SID) {
-		pmic_glink_altmode_enable_dp(altmode, alt_port,
-					     alt_port->mode,
-					     alt_port->hpd_state,
-					     alt_port->hpd_irq);
+		if (alt_port->mux_ctrl == MUX_CTRL_STATE_NO_CONN) {
+			pmic_glink_altmode_safe(altmode, alt_port);
+		} else {
+			pmic_glink_altmode_enable_dp(altmode, alt_port,
+						     alt_port->mode,
+						     alt_port->hpd_state,
+						     alt_port->hpd_irq);
+		}
 
 		if (alt_port->hpd_state)
 			conn_status = connector_status_connected;
@@ -368,6 +370,8 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
 	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
 		pmic_glink_altmode_enable_usb4(altmode, alt_port);
+	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_NO_CONN) {
+		pmic_glink_altmode_safe(altmode, alt_port);
 	} else {
 		pmic_glink_altmode_enable_usb(altmode, alt_port);
 	}

---
base-commit: fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
change-id: 20260306-topic-pgaltmode_fixup-6b488960e355

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


