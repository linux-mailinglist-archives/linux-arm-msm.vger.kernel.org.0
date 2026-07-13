Return-Path: <linux-arm-msm+bounces-118674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ktiIOpWcVGr3oAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:06:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E687487E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:06:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118674-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118674-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=reject ("signature check failed: fail, {[1] = sig:subspace.kernel.org:reject}")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D8FF300A4DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A11203A4F59;
	Mon, 13 Jul 2026 08:06:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956E9CA52;
	Mon, 13 Jul 2026 08:06:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930003; cv=none; b=FypKFSYwh2zq++xMjM+lyDMz54XlCCIzsFW+FOckbB0SAhTwxvDPHU8+XLo9NIN5FvfX64IZfvB6du/Y+rV2++3bYotTYZgweM35mO0B5OjIIqRMvowmM2ECNW6TxXWoukrm4vHDMNWnzQQSLSOBrd2gUURkQDUqnExMRfzQjOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930003; c=relaxed/simple;
	bh=/WQ8n7XDsPQBq3kqJvjodylg+aS6Vv4iZ9Klrikggvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bo1ODT9B6Y3TuQBbFyoHdFZdmbC0phXbf1G5lqMlADVARkIzSLbK9eSFAyTM2YO/QniQVLzyK5GQoVJcHdRrn3bfPQBK/lcG/B18Zf60eLTMpQrJwi9tcWnm+sMP/gnNOkQnjNH1kT75wfq25sMtjPbalrVXrLhiZtn215svUC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=basealt.ru; arc=none smtp.client-ip=193.43.8.18
Received: from localhost (broadband-46-242-4-129.ip.moscow.rt.ru [46.242.4.129])
	(Authenticated sender: gremlin)
	by air.basealt.ru (Postfix) with ESMTPSA id 6C9A7233BF;
	Mon, 13 Jul 2026 11:06:31 +0300 (MSK)
Date: Mon, 13 Jul 2026 11:06:31 +0300
From: "Alexey V. Vissarionov" <gremlin@altlinux.org>
To: To@web.codeaurora.org:Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: gremlin@altlinux.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Casey Connolly <casey.connolly@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] usb: typec: tcpm: qcom: initialize currsrc explicitly
Message-ID: <20260713080631.GB1275@altlinux.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.54 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:subspace.kernel.org:reject}];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118674-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:gremlin@altlinux.org,m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:linux@roeck-us.net,m:casey.connolly@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:lvc-project@linuxtesting.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[gremlin@altlinux.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[altlinux.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gremlin@altlinux.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 31E687487E8

When regmap_read() fails, the execution goes to done: label, where
currsrc is passed to rp_sel_to_name() and used as an index after a
proper check. However, to make this situation easier to notice, an
explicit initialization of currsrc with obviously impossible value
is suggested. Alas, we can't simply use zero value here because it
means TYPEC_SRC_RP_SEL_80UA.

Found by ALT Linux Team (altlinux.org) and Linux Verification Center
(linuxtesting.org) using SVACE.

Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
Signed-off-by: Alexey V. Vissarionov <gremlin@altlinux.org>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index bf985efe1cd6bea4..d7cb69cf6044841b 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
@@ -461,8 +461,8 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
 	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
 	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
 	struct device *dev = pmic_typec_port->dev;
-	unsigned int mode, currsrc;
-	unsigned int misc;
+	unsigned int currsrc = 0xFF; /* error, easy to notice in the log */
+	unsigned int mode, misc;
 	unsigned long flags;
 	int ret;
 


-- 
Alexey V. Vissarionov
gremlin נעי altlinux פ‏כ org; +vii-cmiii-ccxxix-lxxix-xlii
GPG: 0D92F19E1C0DC36E27F61A29CD17E2B43D879005 @ hkp://keys.gnupg.net

