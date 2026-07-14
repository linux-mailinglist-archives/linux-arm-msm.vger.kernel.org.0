Return-Path: <linux-arm-msm+bounces-119069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MGyDI0RmVmpM4wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 18:39:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 004B9756FFD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 18:39:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119069-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119069-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B140D302C342
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 16:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF37C4D90AD;
	Tue, 14 Jul 2026 16:39:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3B3DF59;
	Tue, 14 Jul 2026 16:39:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784047167; cv=none; b=LOmTSG80/+i6N3CaCYQavc7SVHAS1pKG/5ee/+UWol6Dwyu9i15M7MsGNTrALOVxS29tRFGuSlGuIGZWEE7XfQjrlXlAQIgYmXaxhUbcYfj9Gz99mJ149aBKFNHxz3KOAddhogoTz7ZbqEPm0ly1OWKqX5mZmYKoT+XhjFvUdlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784047167; c=relaxed/simple;
	bh=0ake2YNqbb32UF2x4d2QaYtdmrOFhSI805JvLQP5H9o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dU2N9QjuTS2aXVfevzDZardjiRMKKfHNXivvAuvfvyC5Om9AQwvG2tyXmbx8GNGmEPHe5Ymo7KoRCpeGFjPt8gN5nVaApwm60Q0VED1H97NPsdpkUDRd8c8cLH+n3yTdDWc2HIfHXsqngxvpkedwB2XMDqc4QhlxN93U5uJLJOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=193.43.8.18
Received: from altlinux.ipa.basealt.ru (unknown [193.43.11.2])
	(Authenticated sender: kovalevvv)
	by air.basealt.ru (Postfix) with ESMTPSA id 3789623374;
	Tue, 14 Jul 2026 19:39:14 +0300 (MSK)
From: Vasiliy Kovalev <kovalev@altlinux.org>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	"Alexey V . Vissarionov" <gremlin@altlinux.org>,
	kovalev@altlinux.org
Subject: [PATCH v2] usb: typec: qcom-pmic-typec: avoid uninit values in dev_dbg() error paths
Date: Tue, 14 Jul 2026 19:39:13 +0300
Message-Id: <20260714163913.151008-1-kovalev@altlinux.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lvc-project@linuxtesting.org,m:pchelkin@ispras.ru,m:gremlin@altlinux.org,m:kovalev@altlinux.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[altlinux.org];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER(0.00)[kovalev@altlinux.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-119069-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kovalev@altlinux.org,linux-arm-msm@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linaro.org:email,altlinux.org:from_mime,altlinux.org:email,altlinux.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 004B9756FFD

Several functions take a 'goto done' shortcut on regmap_read() (or
switch default) failure before assigning locals that the trailing
dev_dbg() then formats.

Initialize the affected locals at declaration. For 'currsrc' in
qcom_pmic_typec_port_set_cc(), use an out-of-range 0xFF rather than 0,
since 0 is a valid value that maps to TYPEC_SRC_RP_SEL_80UA and would
be indistinguishable from a successful assignment in the debug log.

Found by Linux Verification Center (linuxtesting.org) with Svace static
analysis tool.

Suggested-by: Alexey V. Vissarionov <gremlin@altlinux.org>
Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
Cc: stable@vger.kernel.org
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
---
v2:
 - Initialize currsrc to 0xFF instead of 0, so it stays distinguishable
   from the valid TYPEC_SRC_RP_SEL_80UA value in the debug output
   (suggested by Alexey V. Vissarionov : https://lore.kernel.org/all/20260713182500.GB22956@altlinux.org/).
 - Collect Reviewed-by from Bryan and Heikki on v1.

v1: https://lore.kernel.org/all/20260630120114.185169-1-kovalev@altlinux.org/
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index bf985efe1cd6..73270e4846c2 100644
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
+	unsigned int currsrc = 0xFF; /* invalid; 0 is a valid TYPEC_SRC_RP_SEL_80UA */
+	unsigned int mode = 0, misc = 0;
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


