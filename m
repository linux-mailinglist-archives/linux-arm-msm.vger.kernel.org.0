Return-Path: <linux-arm-msm+bounces-114381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qGZVGsYZPGpujwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:54:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B43296C082B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:54:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Y2tyEOMX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114381-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114381-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DF4613022B64
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 17:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F94B3DD84D;
	Wed, 24 Jun 2026 17:54:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9ABB3DD506
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 17:54:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782323649; cv=none; b=Pr2b5+mX/C7Fxzaqr8nO2Y7qoEcgpQGswegok9aTh/YN80irWR4CwHMmwYtQ0Feh8wfSssV8ULI2/XKi5q/U0rat+puGBWJL/4S82HnCV0MFxOdE9kSX6Y57st1HsBgdQYq1xJHJ6oQde9X3ZQSMQQggUdRpVHDIIT2+W+CvAso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782323649; c=relaxed/simple;
	bh=zS39eoSU0MQzmQzeMb7eknSjOrzat2yPax7g0/+bddU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JwyAmmfViXwaej3a1OfMAzGEazMY8eCoN+KQYSevtOYBuxwWRQvcl5N54uOA2RqOCyl7tE19N6j+OtLyXII7JIyLHTCFGBqe0ghon9pdpD0doxysQ4Bvzf4eqOJRcAwE/8l/4W+Sp13+mAonG+baTnOWSDBMw8vJTcZg25T6poE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2tyEOMX; arc=none smtp.client-ip=209.85.210.180
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8454fccf3b1so285834b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 10:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782323647; x=1782928447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anmA2l3MxALUQm7PPnRPt/zM8+X9tbioRc5oCtucAME=;
        b=Y2tyEOMX7zJdGggLPN87Kvsj0sJrKinBXyB7Cvp8a6iGCU2szgUtgG9kV6+gD7AMYw
         i7Pr2cIJ1P0wacjrsQtvS8lXz6MqRsiIRSCTr4t43S0TzfpoE4f+ocWqe9XJS8phCstW
         6A8Ts7J5ciIhwCN0b8f1PfAZPh9Pfkg9xkj4cQxGK2NwO3b/OZNGWAPiSoaBbVNt+Z7H
         I660wwhd4vlz93tOlqdIs4yWgugDPeRzaii4uEAWEmz5i9VH3cXrJE3BDpZMai+wDECW
         39YQHKnJuU9mDRRTr/zBXvp/rWP0h0viv8NEvUA8z+FKWTJceEXPdyKFqIFcMOVB604/
         iQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782323647; x=1782928447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=anmA2l3MxALUQm7PPnRPt/zM8+X9tbioRc5oCtucAME=;
        b=ImfhU1zElxU4PZQCGFsorqzw3O09JDVtvbiqUF1W1Rr0Dpn1Q35an7AeOadiUhiNND
         fLjedWZ5Jgh3HnqGydT1wBFm8kzPT/NiLQalxi0u5vjPXnG48aT9D0wJwPRONvyper8v
         xWUUHYPt3TTkh9MalZ3wsd+F3n66vWv4eDDZoeazUubHX5p17MuncKgcvpY5vRE5AYaq
         WCfJ1BTbENJ/EL3ecBfQq/MUB32lvFhKcXtBlDs/bINkXP+iLOuBd2yaxP+BGJtm+zmp
         VNQ3Co7DI8vPg3ajku7XnTpe4Vc2JH295duiWZagRkDK3e0nsAnCFyiKZXrtfapQ3lng
         mA+g==
X-Forwarded-Encrypted: i=1; AHgh+RqcXvgeHj+q0GDRhq3iVR4s8VGfHKYNJhvdh73SsQezCS/A4oBC6h8RwFo5r/BVNob1n8pivo6s7Obco5ii@vger.kernel.org
X-Gm-Message-State: AOJu0YwGXQ5JL1HTutnMdDelK+czharB79NZ3fmXHmoZcxPP3deQD0sE
	LA29m5QDAVkKVNVanDxfpeZ4gcQQtKUhbmK/HNBgAedJ8Nm+1mfNu1kr
X-Gm-Gg: AfdE7cnjePHAyJ/CVvMbdVvKhuaGqtdpeVeI6oY4py81WD2kK5pt1br1q2Zt0wweM3H
	GUeP0i7vFuf237D/5MbCXjKzpMx2T6yE5VhQ/s3jHVd332HirPG70aVhmYagA6wHIi2bsxZkfhz
	I2CG2VEP82JdhS/mrvoEKjKIU9vpYnuQoW02JoAi0tfvgyM/ar+wYPHeE4Ko2dfk8yRG3VEstzx
	xFhpJ8EVCPYvlJHxzCoX8SU/hpcMlZG0AYjAIRpZaMHuQH1LP6fGEtYjL7A+IaHnhjwSvBdEv/o
	o2c0Mz1wf4VMvoqvmeeurOSYGq8mO3DZXeBLvYy5LP6bFbfTY9PTZ49kjj+GhpKRJRfcjAFA1vh
	PaRHbT61PcyCLxQG/sqqi91BMwY6kde35b+UHNGcdYikBgUup+nQdyT5OtkkCgXGjuwZbmS51Oo
	a9LeCWJ/STCXDRog81AIL75kR+9uyl1t05zhKpcFk=
X-Received: by 2002:a17:902:db0d:b0:2c7:f524:a8e with SMTP id d9443c01a7336-2c7f52411f8mr4584005ad.3.1782323647155;
        Wed, 24 Jun 2026 10:54:07 -0700 (PDT)
Received: from localhost.localdomain ([202.164.135.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5afb1e0sm3629865ad.29.2026.06.24.10.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 10:54:06 -0700 (PDT)
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
To: andersson@kernel.org
Cc: mathieu.poirier@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	saileshnandanavanam@gmail.com
Subject: [PATCH v2] remoteproc: qcom_q6v5_pas: Fix dtb firmware lifecycle and leak
Date: Wed, 24 Jun 2026 23:23:35 +0530
Message-Id: <20260624175335.22799-1-saileshnandanavanam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260622064141.zfakbyenknx6vbm5@hu-mojha-hyd.qualcomm.com>
References: <20260622064141.zfakbyenknx6vbm5@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:saileshnandanavanam@gmail.com,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linaro.org,vger.kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114381-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[saileshnandanavanam@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[saileshnandanavanam@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B43296C082B

DTB co-firmware was previously requested and loaded in
qcom_pas_load(), but its lifetime did not match the actual
start/stop lifecycle of the remoteproc. As a result, the firmware
reference could be retained across restart cycles, leading to a
leak for each successful boot.

Additionally, if qcom_pas_start() failed after loading the DTB
firmware, the remoteproc core would not invoke .stop(), leaving
no opportunity to release the associated firmware reference.

Fix this by moving DTB firmware request and loading into
qcom_pas_start(), so that its lifetime is strictly tied to the
remoteproc start sequence.

Update qcom_pas_start() to ensure proper cleanup on all paths:
- release PAS metadata on failure
- release DTB firmware on both success and failure paths
- unmap DTB carveout where applicable

Remove DTB firmware handling from qcom_pas_load(), as it does not
match the correct ownership and lifecycle model.

With this change, request_firmware() and release_firmware() are
properly paired within the start path, avoiding leaks and ensuring
consistent behavior across restart and failure scenarios.

Fixes: 29814986b82e ("remoteproc: qcom_q6v5_pas: add support for dtb co-firmware loading")
Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
---
v2:
- Move DTB firmware request/load from qcom_pas_load() to qcom_pas_start()
- Fix firmware reference leak across restart cycles
- Handle start() failure paths where .stop() is not invoked
- Ensure firmware is released on all success and failure paths
- Remove DTB handling from load() and drop release from stop()
---
 drivers/remoteproc/qcom_q6v5_pas.c | 54 ++++++++++++++++--------------
 1 file changed, 29 insertions(+), 25 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index da27d1d3c9da..090f1f09dba3 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -232,28 +232,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 	if (pas->lite_dtb_pas_id)
 		qcom_scm_pas_shutdown(pas->lite_dtb_pas_id);
 
-	if (pas->dtb_pas_id) {
-		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
-		if (ret) {
-			dev_err(pas->dev, "request_firmware failed for %s: %d\n",
-				pas->dtb_firmware_name, ret);
-			return ret;
-		}
-
-		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
-					pas->dtb_firmware_name, pas->dtb_mem_region,
-					&pas->dtb_mem_reloc);
-		if (ret)
-			goto release_dtb_metadata;
-	}
-
 	return 0;
-
-release_dtb_metadata:
-	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
-	release_firmware(pas->dtb_firmware);
-
-	return ret;
 }
 
 static void qcom_pas_unmap_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t size)
@@ -277,9 +256,24 @@ static int qcom_pas_start(struct rproc *rproc)
 	struct qcom_pas *pas = rproc->priv;
 	int ret;
 
+	if (pas->dtb_pas_id) {
+		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
+		if (ret) {
+			dev_err(pas->dev, "request_firmware failed for %s: %d\n",
+					pas->dtb_firmware_name, ret);
+			return ret;
+		}
+
+		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
+				pas->dtb_firmware_name, pas->dtb_mem_region,
+				&pas->dtb_mem_reloc);
+		if (ret)
+			goto release_dtb_metadata;
+	}
+
 	ret = qcom_q6v5_prepare(&pas->q6v5);
 	if (ret)
-		return ret;
+		goto release_dtb_metadata;
 
 	ret = qcom_pas_pds_enable(pas, pas->proxy_pds, pas->proxy_pd_count);
 	if (ret < 0)
@@ -350,15 +344,17 @@ static int qcom_pas_start(struct rproc *rproc)
 	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
 	pas->firmware = NULL;
 
+	if (pas->dtb_firmware) {
+		release_firmware(pas->dtb_firmware);
+		pas->dtb_firmware = NULL;
+	}
+
 	return 0;
 
 unmap_carveout:
 	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
 release_pas_metadata:
 	qcom_scm_pas_metadata_release(pas->pas_ctx);
-	if (pas->dtb_pas_id)
-		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
-
 unmap_dtb_carveout:
 	if (pas->dtb_pas_id)
 		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
@@ -376,6 +372,14 @@ static int qcom_pas_start(struct rproc *rproc)
 	qcom_pas_pds_disable(pas, pas->proxy_pds, pas->proxy_pd_count);
 disable_irqs:
 	qcom_q6v5_unprepare(&pas->q6v5);
+release_dtb_metadata:
+	if (pas->dtb_pas_id)
+		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
+release_dtb_firmware:
+	if (pas->dtb_firmware) {
+		release_firmware(pas->dtb_firmware);
+		pas->dtb_firmware = NULL;
+	}
 
 	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
 	pas->firmware = NULL;
-- 
2.34.1


