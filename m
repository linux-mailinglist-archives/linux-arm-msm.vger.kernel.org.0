Return-Path: <linux-arm-msm+bounces-114128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NRccGrROOmr95gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:15:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C45EF6B5AEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:15:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=codethink.co.uk header.s=imap4-20230908 header.b=AOfjy6Om;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114128-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114128-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=codethink.co.uk;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 948FF3087E7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C71A308F03;
	Tue, 23 Jun 2026 09:10:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB202D4B68;
	Tue, 23 Jun 2026 09:09:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782205802; cv=none; b=XnbdPsbXE3RYEWLgKA4Z0uSurBAzvRgdmVHkErcBxj8lCPk0skx4rh4dbd5gVI5b7svSJQBSFhHnHfgxAV8W90uzNbXGMQSAwKu4BJWacB2Y3wGAYcUF21v/kPbNh1GGukjrkFVx7d8zvUmbUFRzfZcogrql1lSFGc6AREuG16Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782205802; c=relaxed/simple;
	bh=+Gftn/plx+bFrTiN09sRasqvkfjkKroU9nGaB6VKqpQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ML00ifJH6JGDD6A9JtxzwkTTvvZtyY8xupwexfQZBVpScZ6atPMClZoojgTEdF2OYd6NXAE++5lNo4gxUbmohM13BT/Y7bgRMZls+5ZlBb5XpPI1Vfreg5aHXGIESye4xU+4Ygh0lTxT+iQGjlfCuJdwA+KYeO3v6Y5bdjNuixo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=AOfjy6Om; arc=none smtp.client-ip=188.40.203.114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=Wkug/hzln1FE/FkwBhg64+BlY5Wm6sCcdTm2BUfseXg=; b=AOfjy6OmK5QBfz
	XGgHmbMSDNBhPyMY7CegQsLJYy3kZI0ml/2VB5C4qcDvI7eDMQMRqpedulAR5bIRcfInMAk7eFieY
	R06bCW3IV0Wa1e+0pyn8LE8TdnZgu7lq8vBsAbCdyr+iJRqOZxCZh8V2TFtoJ2gib79FJTVwF/CBx
	juS4I6I+Cu3JNg+XcmA8OexaALM8NkUs5ovZ1ButmkO3MBCGHlhC7TpSslJV0c1dfPJmXzdfRJkvc
	mjeC5BVRscmMUg4lQSwwLcoyIxYjBTEjfTetx+ENCPlMXd2mHtWF9fRgmjZnVafH0Yfjhw9N/s9dn
	5z6tuLPmt53aq60tTYdQ==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wbx8m-00FoPx-51; Tue, 23 Jun 2026 10:09:56 +0100
Received: from ben by rainbowdash with local (Exim 4.99.4)
	(envelope-from <ben@rainbowdash>)
	id 1wbx8l-00000002bTJ-3SgS;
	Tue, 23 Jun 2026 10:09:55 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] soc: qcom: smsm: fix __iomem annotations
Date: Tue, 23 Jun 2026 10:09:54 +0100
Message-Id: <20260623090954.620688-1-ben.dooks@codethink.co.uk>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[codethink.co.uk:s=imap4-20230908];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114128-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ben.dooks@codethink.co.uk,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[ben.dooks@codethink.co.uk,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[codethink.co.uk:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,codethink.co.uk:dkim,codethink.co.uk:email,codethink.co.uk:mid,codethink.co.uk:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C45EF6B5AEB

There are a number of points in the driver which miss out
on __iomem annotations, so add these to remove the following
sparse warnings:

drivers/soc/qcom/smsm.c:159:32: warning: incorrect type in argument 1 (different address spaces)
drivers/soc/qcom/smsm.c:159:32:    expected void const volatile [noderef] __iomem *addr
drivers/soc/qcom/smsm.c:159:32:    got unsigned int [usertype] *local_state
drivers/soc/qcom/smsm.c:171:25: warning: incorrect type in argument 2 (different address spaces)
drivers/soc/qcom/smsm.c:171:25:    expected void volatile [noderef] __iomem *addr
drivers/soc/qcom/smsm.c:171:25:    got unsigned int [usertype] *local_state
drivers/soc/qcom/smsm.c:181:48: warning: incorrect type in argument 1 (different address spaces)
drivers/soc/qcom/smsm.c:181:48:    expected void const volatile [noderef] __iomem *addr
drivers/soc/qcom/smsm.c:181:48:    got unsigned int [usertype] *
drivers/soc/qcom/smsm.c:219:26: warning: incorrect type in argument 1 (different address spaces)
drivers/soc/qcom/smsm.c:219:26:    expected void const volatile [noderef] __iomem *addr
drivers/soc/qcom/smsm.c:219:26:    got unsigned int [usertype] *remote_state
drivers/soc/qcom/smsm.c:257:49: warning: incorrect type in argument 1 (different address spaces)
drivers/soc/qcom/smsm.c:257:49:    expected void const volatile [noderef] __iomem *addr
drivers/soc/qcom/smsm.c:257:49:    got unsigned int [usertype] *
drivers/soc/qcom/smsm.c:259:49: warning: incorrect type in argument 2 (different address spaces)
drivers/soc/qcom/smsm.c:259:49:    expected void volatile [noderef] __iomem *addr
drivers/soc/qcom/smsm.c:259:49:    got unsigned int [usertype] *
drivers/soc/qcom/smsm.c:280:24: warning: incorrect type in argument 1 (different address spaces)
drivers/soc/qcom/smsm.c:280:24:    expected void const volatile [noderef] __iomem *addr
drivers/soc/qcom/smsm.c:280:24:    got unsigned int [usertype] *remote_state
drivers/soc/qcom/smsm.c:288:49: warning: incorrect type in argument 1 (different address spaces)
drivers/soc/qcom/smsm.c:288:49:    expected void const volatile [noderef] __iomem *addr
drivers/soc/qcom/smsm.c:288:49:    got unsigned int [usertype] *
drivers/soc/qcom/smsm.c:290:49: warning: incorrect type in argument 2 (different address spaces)
drivers/soc/qcom/smsm.c:290:49:    expected void volatile [noderef] __iomem *addr
drivers/soc/qcom/smsm.c:290:49:    got unsigned int [usertype] *
drivers/soc/qcom/smsm.c:330:26: warning: incorrect type in argument 1 (different address spaces)
drivers/soc/qcom/smsm.c:330:26:    expected void const volatile [noderef] __iomem *addr
drivers/soc/qcom/smsm.c:330:26:    got unsigned int [usertype] *remote_state
drivers/soc/qcom/smsm.c:635:47: warning: incorrect type in argument 2 (different address spaces)
drivers/soc/qcom/smsm.c:635:47:    expected void volatile [noderef] __iomem *addr
drivers/soc/qcom/smsm.c:635:47:    got unsigned int [usertype] *

Note, we don't fixup the qcom_smem_get() to return an __iomem annotated pointer.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/soc/qcom/smsm.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/qcom/smsm.c b/drivers/soc/qcom/smsm.c
index 021e9d1f61dc..8d6656edd959 100644
--- a/drivers/soc/qcom/smsm.c
+++ b/drivers/soc/qcom/smsm.c
@@ -82,8 +82,8 @@ struct qcom_smsm {
 	u32 num_hosts;
 	u32 num_entries;
 
-	u32 *local_state;
-	u32 *subscription;
+	u32 __iomem *local_state;
+	u32 __iomem *subscription;
 	struct qcom_smem_state *state;
 
 	spinlock_t lock;
@@ -115,8 +115,8 @@ struct smsm_entry {
 	DECLARE_BITMAP(irq_falling, 32);
 	unsigned long last_value;
 
-	u32 *remote_state;
-	u32 *subscription;
+	u32 __iomem *remote_state;
+	u32 __iomem *subscription;
 };
 
 /**
@@ -138,7 +138,7 @@ struct smsm_host {
  * smsm_update_bits() - change bit in outgoing entry and inform subscribers
  * @data:	smsm context pointer
  * @mask:	value mask
- * @value:	new value
+ * @Value:	new value
  *
  * Used to set and clear the bits in the outgoing/local entry and inform
  * subscribers about the change.
@@ -513,9 +513,9 @@ static int qcom_smsm_probe(struct platform_device *pdev)
 	struct device_node *node;
 	struct smsm_entry *entry;
 	struct qcom_smsm *smsm;
-	u32 *intr_mask;
+	u32 __iomem *intr_mask;
 	size_t size;
-	u32 *states;
+	u32 __iomem *states;
 	u32 id;
 	int ret;
 
@@ -579,7 +579,7 @@ static int qcom_smsm_probe(struct platform_device *pdev)
 		goto out_put;
 	}
 
-	states = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_SMSM_SHARED_STATE, NULL);
+	states = (u32 __iomem *)qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_SMSM_SHARED_STATE, NULL);
 	if (IS_ERR(states)) {
 		dev_err(&pdev->dev, "Unable to acquire shared state entry\n");
 		ret = PTR_ERR(states);
@@ -594,7 +594,7 @@ static int qcom_smsm_probe(struct platform_device *pdev)
 		goto out_put;
 	}
 
-	intr_mask = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_SMSM_CPU_INTR_MASK, NULL);
+	intr_mask = (u32 __iomem *)qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_SMSM_CPU_INTR_MASK, NULL);
 	if (IS_ERR(intr_mask)) {
 		dev_err(&pdev->dev, "unable to acquire shared memory interrupt mask\n");
 		ret = PTR_ERR(intr_mask);
-- 
2.37.2.352.g3c44437643


