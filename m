Return-Path: <linux-arm-msm+bounces-118851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z9ZKOYUtVWrTkwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 20:25:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C1E74E73E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 20:25:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118851-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118851-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C90F3023048
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 18:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ECFC3537CE;
	Mon, 13 Jul 2026 18:25:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C723537CD;
	Mon, 13 Jul 2026 18:25:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783967105; cv=none; b=E98Ga/kWR/zxoLLy7Y5Dy6XgmenfvvyfFa6JzktiwdaNzmZY9sgEO5QWUzBmkDXEzpHY1x4+4zIJLrim9oeRUr3Gon7rnQpaYGw2JUYDH8nWLkx0O0NKtczGFTXafKte2wkgTCarfIJ/3MBW0xkzTtRrvZNtWrcEMkxq+iArarI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783967105; c=relaxed/simple;
	bh=OX/McDO1qPytlQlVUz0pVIuCo1NendmpnWnZRv7aBFA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IytuJsKcFTd7CfJXjDGF3BQCGPF7W+t2pBZCS9SQ8YWdEEDIlqdwzpVjStfWkCg3srD+SA+mEqC4uN5k65OLYvTbcRTlaJxzOD0dlLl+HBjcJX6CN2qLYD168xVumfn1Gb0KNJrpuIRGR3BHpkeMQbxFQNC4qOKM7V2PLYaFZEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=basealt.ru; arc=none smtp.client-ip=193.43.8.18
Received: from localhost (broadband-46-242-4-129.ip.moscow.rt.ru [46.242.4.129])
	(Authenticated sender: gremlin)
	by air.basealt.ru (Postfix) with ESMTPSA id 80D2A23370;
	Mon, 13 Jul 2026 21:25:00 +0300 (MSK)
Date: Mon, 13 Jul 2026 21:25:00 +0300
From: "Alexey V. Vissarionov" <gremlin@altlinux.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: gremlin@altlinux.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Casey Connolly <casey.connolly@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH v1] usb: typec: tcpm: qcom: initialize currsrc explicitly
Message-ID: <20260713182500.GB22956@altlinux.org>
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
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:gremlin@altlinux.org,m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:linux@roeck-us.net,m:casey.connolly@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:lvc-project@linuxtesting.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118851-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[altlinux.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[gremlin@altlinux.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gremlin@altlinux.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,altlinux.org:from_mime,altlinux.org:url,altlinux.org:email,altlinux.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55C1E74E73E

When regmap_read() fails, the execution goes to done: label, where
currsrc is passed to rp_sel_to_name() and used as an index after a
proper check. However, to make this situation easier to notice, an
explicit initialization of currsrc with obviously impossible value
is suggested. Alas, we can't simply use zero value here because it
means TYPEC_SRC_RP_SEL_80UA.

Found by ALT Linux Team (altlinux.org) and Linux Verification Center
(linuxtesting.org) using SVACE.

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

