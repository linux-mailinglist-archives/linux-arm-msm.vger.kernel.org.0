Return-Path: <linux-arm-msm+bounces-52346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0592FA6DB5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 14:26:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEF5A3B3B92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 13:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D201225EF9F;
	Mon, 24 Mar 2025 13:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJIlr8IE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A326325EF8E;
	Mon, 24 Mar 2025 13:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742822726; cv=none; b=Ipgkcsyop2rQK64+1gayzvqe0IyEl0fT1C2XL1xiP4ES12CTQSa+egCRmMalkR89YyS6fLLZmwqjR/68xMPzuaOhLYbkYGG6RdoDFZbZhtz6PgNxFONqSLDQeFffegg6l+8xh6PbyUPexsLaR0IA5E5B8x/Kt9t/rm7hlUZgWPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742822726; c=relaxed/simple;
	bh=vxSgfp4SAGwj8pW9/pjz9+PbBk6qOxXhxUFHyUJJJfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nJrdEj9WgL51Ww+lmXf76xXlCKsywKYhHlN5+TZlBMvxHsDYuzyTz11HpnFIE7Hy0XJoaLM+1MDCqG3vGsrLrnfr2JacIrHZD8cqDcJaYD14JB9T4yJjZtegeghnZupNHDZTH/2dVfsgTWBZS1Sh17Y4NzsiCRPcHc734hf+990=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJIlr8IE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25BEFC4CEDD;
	Mon, 24 Mar 2025 13:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742822726;
	bh=vxSgfp4SAGwj8pW9/pjz9+PbBk6qOxXhxUFHyUJJJfE=;
	h=From:To:Cc:Subject:Date:From;
	b=HJIlr8IEDm+quXlfbSjZDKXtzj1xNT+IgttbRQjlcNzZnnUMwAxQIpaand/+BaKTI
	 ugjVwG88Sa53de4lc+zhVy8Y/ze18J15qf17ASvcAVlukv8Omf+U5TpdJ7J2a/dTf5
	 8ijNsARi0keigLbTuABcWTq2jS75nV4m5X9DiyeX/BgVq8gFq7wnhZodKsFMtNsD7k
	 Fx3PCHA2Uowgl+GsmgzmLAFhwxKFajxMTUEz0gJCsvr+oAvip+pLZk2ByiQ+ququJV
	 VqzEja2RN53JrPbGteG6bXBWD2NrCGhOGsCNVRTXFVahhs4d9xoOCtqnIl6yBvCZ4s
	 60Ff/ukBwN1hQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1twhnx-000000001bd-3C5m;
	Mon, 24 Mar 2025 14:25:25 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org,
	Clayton Craft <clayton@craftyguy.net>
Subject: [PATCH] soc: qcom: pmic_glink_altmode: fix spurious DP hotplug events
Date: Mon, 24 Mar 2025 14:24:48 +0100
Message-ID: <20250324132448.6134-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PMIC GLINK driver is currently generating DisplayPort hotplug
notifications whenever something is connected to (or disconnected from)
a port regardless of the type of notification sent by the firmware.

These notifications are forwarded to user space by the DRM subsystem as
connector "change" uevents:

    KERNEL[1556.223776] change   /devices/platform/soc@0/ae00000.display-subsystem/ae01000.display-controller/drm/card0 (drm)
    ACTION=change
    DEVPATH=/devices/platform/soc@0/ae00000.display-subsystem/ae01000.display-controller/drm/card0
    SUBSYSTEM=drm
    HOTPLUG=1
    CONNECTOR=36
    DEVNAME=/dev/dri/card0
    DEVTYPE=drm_minor
    SEQNUM=4176
    MAJOR=226
    MINOR=0

On the Lenovo ThinkPad X13s and T14s, the PMIC GLINK firmware sends two
identical notifications with orientation information when connecting a
charger, each generating a bogus DRM hotplug event. On the X13s, two
such notification are also sent every 90 seconds while a charger remains
connected, which again are forwarded to user space:

    port = 1, svid = ff00, mode = 255, hpd_state = 0
    payload = 01 00 00 00 00 00 00 ff 00 00 00 00 00 00 00 00

Note that the firmware only sends on of these when connecting an
ethernet adapter.

Fix the spurious hotplug events by only forwarding hotplug notifications
for the Type-C DisplayPort service id. This also reduces the number of
uevents from four to two when an actual DisplayPort altmode device is
connected:

    port = 0, svid = ff01, mode = 2, hpd_state = 0
    payload = 00 01 02 00 f2 0c 01 ff 03 00 00 00 00 00 00 00
    port = 0, svid = ff01, mode = 2, hpd_state = 1
    payload = 00 01 02 00 f2 0c 01 ff 43 00 00 00 00 00 00 00

Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
Cc: stable@vger.kernel.org	# 6.3
Cc: Bjorn Andersson <andersson@kernel.org>
Reported-by: Clayton Craft <clayton@craftyguy.net>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---

Clayton reported seeing display flickering with recent RC kernels, which
may possibly be related to these spurious events being generated with
even greater frequency.

That still remains to be fully understood, but the spurious events, that
on the X13s are generated every 90 seconds, should be fixed either way.

Johan


 drivers/soc/qcom/pmic_glink_altmode.c | 30 +++++++++++++++++----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index bd06ce161804..7f11acd33323 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -218,21 +218,29 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 {
 	struct pmic_glink_altmode_port *alt_port = work_to_altmode_port(work);
 	struct pmic_glink_altmode *altmode = alt_port->altmode;
+	enum drm_connector_status conn_status;
 
 	typec_switch_set(alt_port->typec_switch, alt_port->orientation);
 
-	if (alt_port->svid == USB_TYPEC_DP_SID && alt_port->mode == 0xff)
-		pmic_glink_altmode_safe(altmode, alt_port);
-	else if (alt_port->svid == USB_TYPEC_DP_SID)
-		pmic_glink_altmode_enable_dp(altmode, alt_port, alt_port->mode,
-					     alt_port->hpd_state, alt_port->hpd_irq);
-	else
-		pmic_glink_altmode_enable_usb(altmode, alt_port);
+	if (alt_port->svid == USB_TYPEC_DP_SID) {
+		if (alt_port->mode == 0xff) {
+			pmic_glink_altmode_safe(altmode, alt_port);
+		} else {
+			pmic_glink_altmode_enable_dp(altmode, alt_port,
+						     alt_port->mode,
+						     alt_port->hpd_state,
+						     alt_port->hpd_irq);
+		}
 
-	drm_aux_hpd_bridge_notify(&alt_port->bridge->dev,
-				  alt_port->hpd_state ?
-				  connector_status_connected :
-				  connector_status_disconnected);
+		if (alt_port->hpd_state)
+			conn_status = connector_status_connected;
+		else
+			conn_status = connector_status_disconnected;
+
+		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
+	} else {
+		pmic_glink_altmode_enable_usb(altmode, alt_port);
+	}
 
 	pmic_glink_altmode_request(altmode, ALTMODE_PAN_ACK, alt_port->index);
 }
-- 
2.48.1


