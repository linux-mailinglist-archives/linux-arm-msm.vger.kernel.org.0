Return-Path: <linux-arm-msm+bounces-114122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y7w2JWJMOmo75gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:05:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E482E6B5905
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:05:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=codethink.co.uk header.s=imap5-20230908 header.b="aH/Ldpbx";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114122-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114122-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=codethink.co.uk;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDCB830AD44B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 08:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3823CF673;
	Tue, 23 Jun 2026 08:59:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937DC3CF213;
	Tue, 23 Jun 2026 08:59:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782205177; cv=none; b=doyQ1Pe+LaNHUwbH07qS2+Ny8g1bjjPPZAtCSQcwHdJ00S0DmY8vPJGKlhLGj+z2r60rlvMlnct7055qXdlsS2egPb7bZSDr8Rq8Atvo/xalAzUvfJd2h4mF2bxwL28L99p3/oR+PiCD7hBjGmBK8qlZaXvkBK6ogImCHscHgvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782205177; c=relaxed/simple;
	bh=Su1i9PqjmuNQUbsVxxHQn03r+4j4pucY0IxVrhAWD5w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=isF6GMFv4UBQZVHpCbBIuHlwks3JF1fO6vnPdHDcTHrftBG2WIB2ocTk/e8cEgJ+yPf/2cbcc2NjEShhM/qgYl8YvUiCZJ5u0cplTG/5mTzCzcJX0UddN0xXAI1mfEKtzUHNT6ZcGUGyDdRk/Q7VGwmTSUgynEWU+z+ourUP9Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=aH/Ldpbx; arc=none smtp.client-ip=78.40.148.171
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=gaQGA4fOzKPViVA/zMk1A44eOzBqQDuDjlFaPDcEtgw=; b=aH/LdpbxncXuty
	yfFO/HwUysq7Dpi7ENT5numXmKAQ0f3Ea9VSVpBYdpcNfomnhpmSfnNbJHIcQ7Id7h0xTj+9iGwFb
	wpeAHukumCOqxxC6oAEJLQ4HY9zyeXb6g2MopfWAUTPFr+Vm6zaMKPLbTqv5JUwYROuXkgMbbuDYo
	S6zU5NnbihxZPT2bJIe+TPuaIpVpEFDg/Wk6VQLg1CDyjwO+V6CxGBDreXBkspcmTezqbyhyeUrZ6
	uKhtG0bmnnwIGDtRqqLDSCTbO4VuvOYKBf6rDLj4R5/GazQh4YXdrn4vecOrN4wOafs1fKr+HIjyM
	POj6yk1Rv1YmZidkgZGQ==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wbwyj-006YtF-3W; Tue, 23 Jun 2026 09:59:33 +0100
Received: from ben by rainbowdash with local (Exim 4.99.4)
	(envelope-from <ben@rainbowdash>)
	id 1wbwyi-00000002TQ4-3LZq;
	Tue, 23 Jun 2026 09:59:32 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] soc: qcom: smp2p: fix __iomem annotation on entry->value pointer
Date: Tue, 23 Jun 2026 09:59:31 +0100
Message-Id: <20260623085931.589735-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: srv_ts003@codethink.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[codethink.co.uk,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[codethink.co.uk:s=imap5-20230908];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114122-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ben.dooks@codethink.co.uk,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[ben.dooks@codethink.co.uk,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[codethink.co.uk:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.dooks@codethink.co.uk,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,codethink.co.uk:dkim,codethink.co.uk:email,codethink.co.uk:mid,codethink.co.uk:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E482E6B5905

The entry->value is passed to readl() so should be marked __iomem
so remove these sparse warnings by marking it __iomem and do the
relevant casting to ensure no further warnings:

drivers/soc/qcom/smp2p.c:280:64: warning: incorrect type in argument 1 (different address spaces)
drivers/soc/qcom/smp2p.c:280:64:    expected void const volatile [noderef] __iomem *addr
drivers/soc/qcom/smp2p.c:280:64:    got unsigned int [usertype] *value
drivers/soc/qcom/smp2p.c:318:34: warning: incorrect type in argument 1 (different address spaces)
drivers/soc/qcom/smp2p.c:318:34:    expected void const volatile [noderef] __iomem *addr
drivers/soc/qcom/smp2p.c:318:34:    got unsigned int [usertype] *value
drivers/soc/qcom/smp2p.c:446:26: warning: incorrect type in argument 1 (different address spaces)
drivers/soc/qcom/smp2p.c:446:26:    expected void const volatile [noderef] __iomem *addr
drivers/soc/qcom/smp2p.c:446:26:    got unsigned int [usertype] *value
drivers/soc/qcom/smp2p.c:501:33: warning: incorrect type in argument 1 (different address spaces)
drivers/soc/qcom/smp2p.c:501:33:    expected void const volatile [noderef] __iomem *addr
drivers/soc/qcom/smp2p.c:501:33:    got unsigned int [usertype] *value
drivers/soc/qcom/smp2p.c:504:26: warning: incorrect type in argument 2 (different address spaces)
drivers/soc/qcom/smp2p.c:504:26:    expected void volatile [noderef] __iomem *addr
drivers/soc/qcom/smp2p.c:504:26:    got unsigned int [usertype] *value

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/soc/qcom/smp2p.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index af0ceeaf6e07..fef6f17c3257 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -102,7 +102,7 @@ struct smp2p_entry {
 	struct qcom_smp2p *smp2p;
 
 	const char *name;
-	u32 *value;
+	u32 __iomem *value;
 	u32 last_value;
 
 	struct irq_domain *domain;
@@ -276,7 +276,7 @@ static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
 		list_for_each_entry(entry, &smp2p->inbound, node) {
 			memcpy(buf, in->entries[i].name, sizeof(buf));
 			if (!strcmp(buf, entry->name)) {
-				entry->value = &in->entries[i].value;
+				entry->value = (u32 __iomem *)&in->entries[i].value;
 				entry->last_value = readl(entry->value);
 				break;
 			}
@@ -302,7 +302,7 @@ static void qcom_smp2p_notify_in(struct qcom_smp2p *smp2p)
 		list_for_each_entry(entry, &smp2p->inbound, node) {
 			memcpy(buf, in->entries[i].name, sizeof(buf));
 			if (!strcmp(buf, entry->name)) {
-				entry->value = &in->entries[i].value;
+				entry->value = (u32 __iomem *)&in->entries[i].value;
 				break;
 			}
 		}
@@ -528,7 +528,7 @@ static int qcom_smp2p_outbound_entry(struct qcom_smp2p *smp2p,
 	memcpy(out->entries[out->valid_entries].name, buf, SMP2P_MAX_ENTRY_NAME);
 
 	/* Make the logical entry reference the physical value */
-	entry->value = &out->entries[out->valid_entries].value;
+	entry->value = (u32 __iomem *)&out->entries[out->valid_entries].value;
 
 	out->valid_entries++;
 
-- 
2.37.2.352.g3c44437643


