Return-Path: <linux-arm-msm+bounces-96531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PNUI6rOr2kfcgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:56:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1F1246BAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:56:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 53A11302D9E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 07:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1033D4118;
	Tue, 10 Mar 2026 07:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YNC9YuDH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9EA36B05F
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773129381; cv=none; b=CAuoyIkU4ozNtM1lDrC4VgM2+22H4Q3iXoH6n5rVecPFpLBn8XHiQ7ELtr2ZigmpKnpsDoHZAYsMBUWmJPnIukLgJbFz73JH1oj/3Qhxq9CAWYqHhX49n0tBHVrufhTbiK5xI4CI6X92ixmwQtjtHkiPnSuVrTSqjJpg9FcVe24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773129381; c=relaxed/simple;
	bh=pGcfVVvTw1ZWJSV+BA7Cqfi35R8O7VoHAutQcsJ0fqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PvvOBFGjZBI+8ztqLKrUHXzfK25RdR4nBkv/cpPtspi4KLupcpc0YWh50xy2vr0W/z81+zOlkD/pLcMTnX/LN+TTbVt8T5L8cKrGIbxuNoN6yq+cMVooN1vzla32uQrNMI6o4U1tLMURCJ2tHeY2NfPqWvzQGq6wZZLrDARxOi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YNC9YuDH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=7vMrLv9qF9Z71L0B1gC3rLo8m3rNp4D4vQ0xv92urq4=; b=YNC9Yu
	DHC3vdwaWt2Df0cLQz6Ae1g+4lNqNEgGP1+fNns87u8cQatlnO1vaa0Mes8ZFQH7
	PJAXsFjtx4+TrgxY4ZbzG1bP6aXInekXTMPeaGSU1zHEO1NPpj2iBt2nhEmU7WqE
	hTaNU1sA6tgyZnZpVVtIKDGHSDk3I/t8h14iqr4+bIezwHrQgg8UZOlfy48+bCKt
	9tVD0f1TGWr07nvUoX9gM78YMNN0ykgiCZxT345ErLlw/0ZiAjPuBgb1ZDDUstE0
	k27fSpeE7vuCsb+bE+Q0OKi/o0tq9gy660pnQVlMaM1a92g4v6p+i1TNR6vZJdad
	zNMR4SULu68i5DWA==
Received: (qmail 3112682 invoked from network); 10 Mar 2026 08:55:53 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Mar 2026 08:55:53 +0100
X-UD-Smtp-Session: l3s3148p1@3Qs92aZMxpAujntP
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v4 06/15] hwspinlock: qcom: use new callback to initialize hwspinlock priv
Date: Tue, 10 Mar 2026 08:55:21 +0100
Message-ID: <20260310075539.11701-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2B1F1246BAB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96531-lists,linux-arm-msm=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-arm-msm@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid]
X-Rspamd-Action: no action

Apply the new helper to avoid using internal structures from the core.
Remove superfluous setting of drvdata while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/hwspinlock/qcom_hwspinlock.c | 45 ++++++++++++++++------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 7960a4972eab..73b280988109 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -25,6 +25,13 @@ struct qcom_hwspinlock_of_data {
 	const struct regmap_config *regmap_config;
 };
 
+struct qcom_hwspinlock_priv_init_data {
+	struct device *dev;
+	struct regmap *regmap;
+	u32 base;
+	u32 stride;
+};
+
 static int qcom_hwspinlock_trylock(struct hwspinlock *lock)
 {
 	struct regmap_field *field = hwspin_lock_get_priv(lock);
@@ -89,10 +96,23 @@ static int qcom_hwspinlock_bust(struct hwspinlock *lock, unsigned int id)
 	return 0;
 }
 
+static void *qcom_hwspinlock_init_priv(int local_id, void *init_data)
+{
+	struct qcom_hwspinlock_priv_init_data *init = init_data;
+	struct reg_field field;
+
+	field.reg = init->base + local_id * init->stride;
+	field.lsb = 0;
+	field.msb = 31;
+
+	return devm_regmap_field_alloc(init->dev, init->regmap, field);
+}
+
 static const struct hwspinlock_ops qcom_hwspinlock_ops = {
 	.trylock	= qcom_hwspinlock_trylock,
 	.unlock		= qcom_hwspinlock_unlock,
 	.bust		= qcom_hwspinlock_bust,
+	.init_priv	= qcom_hwspinlock_init_priv,
 };
 
 static const struct regmap_config sfpb_mutex_config = {
@@ -202,17 +222,14 @@ static struct regmap *qcom_hwspinlock_probe_mmio(struct platform_device *pdev,
 
 static int qcom_hwspinlock_probe(struct platform_device *pdev)
 {
+	struct qcom_hwspinlock_priv_init_data init;
 	struct hwspinlock_device *bank;
-	struct reg_field field;
 	struct regmap *regmap;
 	size_t array_size;
-	u32 stride;
-	u32 base;
-	int i;
 
-	regmap = qcom_hwspinlock_probe_syscon(pdev, &base, &stride);
+	regmap = qcom_hwspinlock_probe_syscon(pdev, &init.base, &init.stride);
 	if (IS_ERR(regmap) && PTR_ERR(regmap) == -ENODEV)
-		regmap = qcom_hwspinlock_probe_mmio(pdev, &base, &stride);
+		regmap = qcom_hwspinlock_probe_mmio(pdev, &init.base, &init.stride);
 
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
@@ -222,21 +239,11 @@ static int qcom_hwspinlock_probe(struct platform_device *pdev)
 	if (!bank)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, bank);
-
-	for (i = 0; i < QCOM_MUTEX_NUM_LOCKS; i++) {
-		field.reg = base + i * stride;
-		field.lsb = 0;
-		field.msb = 31;
-
-		bank->lock[i].priv = devm_regmap_field_alloc(&pdev->dev,
-							     regmap, field);
-		if (IS_ERR(bank->lock[i].priv))
-			return PTR_ERR(bank->lock[i].priv);
-	}
+	init.dev = &pdev->dev;
+	init.regmap = regmap;
 
 	return devm_hwspin_lock_register(&pdev->dev, bank, &qcom_hwspinlock_ops,
-					 0, QCOM_MUTEX_NUM_LOCKS, NULL);
+					 0, QCOM_MUTEX_NUM_LOCKS, &init);
 }
 
 static struct platform_driver qcom_hwspinlock_driver = {
-- 
2.47.3


