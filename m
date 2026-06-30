Return-Path: <linux-arm-msm+bounces-115406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EsLaM7m0Q2ocfgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:21:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 277F26E41D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:21:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115406-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115406-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB97B30A3E28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF3840961C;
	Tue, 30 Jun 2026 12:10:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B09409624;
	Tue, 30 Jun 2026 12:10:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782821407; cv=none; b=u8zTKEaSbD+mus4mUEUtT4ctKVk5mAr3f2ubjP8Jk/NjU926hPi/4zUke+9TQKSfdypw6g9Mb7VXoMZDUwWNLaTWinGxMmRp+4rN1PY+u5Mm8BA+jp6trXMJSPhiPAD5DlfPSsP16K1PN7vZwgaL5kg8gHKGm3Vq5Kql2IP3+0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782821407; c=relaxed/simple;
	bh=bIx7qoRtflBhD+2Q4O9LU6x0p3DQoyWT0FnIkXiFXvs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=puFxWpsIdLDMsYPIMJK+ESn7hRtvYhuf9Ct+jBk+iwIA1idgoIaQeNRpP24XhId+5FuojMJejoYVm37dZ7mmzbzIMuzdWSMLdKXYW6sH37CZW5DVO7OdkSPavuSfs9uHojhcjPDINfMEoWC78PmbwEX2879N10pHtBRa6j9+Nxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=193.43.8.18
Received: from altlinux.ipa.basealt.ru (unknown [193.43.11.2])
	(Authenticated sender: kovalevvv)
	by air.basealt.ru (Postfix) with ESMTPSA id B2FD723370;
	Tue, 30 Jun 2026 15:01:14 +0300 (MSK)
From: Vasiliy Kovalev <kovalev@altlinux.org>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	kovalev@altlinux.org
Subject: [PATCH] usb: typec: qcom-pmic-typec: avoid uninit values in dev_dbg() error paths
Date: Tue, 30 Jun 2026 15:01:14 +0300
Message-Id: <20260630120114.185169-1-kovalev@altlinux.org>
X-Mailer: git-send-email 2.33.8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lvc-project@linuxtesting.org,m:kovalev@altlinux.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[altlinux.org];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER(0.00)[kovalev@altlinux.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115406-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kovalev@altlinux.org,linux-arm-msm@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,altlinux.org:email,altlinux.org:mid,altlinux.org:from_mime,linuxtesting.org:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 277F26E41D2

Several functions take a 'goto done' shortcut on regmap_read() (or
switch default) failure before assigning locals that the trailing
dev_dbg() then formats.

Initialize the affected locals at declaration.

Found by Linux Verification Center (linuxtesting.org) with Svace static
analysis tool.

Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
Cc: stable@vger.kernel.org
Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index bf985efe1cd6..c8379cdcb6da 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
@@ -366,7 +366,7 @@ static int qcom_pmic_typec_port_get_cc(struct tcpc_dev *tcpc,
 	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
 	struct device *dev = pmic_typec_port->dev;
 	unsigned int misc, val;
-	bool attached;
+	bool attached = false;
 	int ret = 0;
 
 	ret = regmap_read(pmic_typec_port->regmap,
@@ -461,8 +461,8 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
 	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
 	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
 	struct device *dev = pmic_typec_port->dev;
-	unsigned int mode, currsrc;
-	unsigned int misc;
+	unsigned int mode = 0, currsrc = 0;
+	unsigned int misc = 0;
 	unsigned long flags;
 	int ret;
 
@@ -535,7 +535,8 @@ static int qcom_pmic_typec_port_set_vconn(struct tcpc_dev *tcpc, bool on)
 	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
 	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
 	struct device *dev = pmic_typec_port->dev;
-	unsigned int orientation, misc, mask, value;
+	unsigned int orientation = 0, misc = 0, value = 0;
+	unsigned int mask;
 	unsigned long flags;
 	int ret;
 
-- 
2.50.1


