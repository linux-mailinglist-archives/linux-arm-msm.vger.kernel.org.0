Return-Path: <linux-arm-msm+bounces-107063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLtQIcPwAmrpywEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 11:20:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0171D51D860
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 11:20:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DA93311F3AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 08:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95A239C621;
	Tue, 12 May 2026 08:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BbHmQGSf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08723A3820
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576204; cv=none; b=oybGyCskoGh2Qbzp3YdRBwOTkTlUfoluVMkr4UNqy7N4/ZcHd3xcEUpPWNmppyWebKnhC3FCqo5m1UaB1Fbgs4aEia2E7MAv3u2uI3DXfkXb/fkM/u44cV0hAL/df2xDc2+FcxMrWcTagv/HBJfSjA34UWcOyrom6dJMxgWv9Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576204; c=relaxed/simple;
	bh=oqjBjvYTn6e/6Xs7ikh6N+hRRv66rVSep+EqtcLmjWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hJT4jaB57+QQWCnD7XJA31AX2k53QBQbn4qeTXLRTrGHRkxW7li6mmjF91by61XUugYplbXBIfXAUKdntLLIDfxmC7SMwp7eEWxDqXNNQVGnlKdlIvS+43vF0xSoHXKq44uRWhyZDCfFS6BNwaOV8THMLOOyU6q3buNyl0CfJmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BbHmQGSf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=/+VfbiDeassMFS
	LHHWnIktyVGa3BEbBetwV6JroadSU=; b=BbHmQGSfRVx1UPNnl4EQC+XcIXfkA6
	20IW6+7HE4Uk9c1a9nD+iUrXHUxX0DrJz2hF+qPLsENaJE6aFhCV6KkudGBT1nBO
	Dl6UjY4E+acuUzz8BJy5q4jt1M/2Smcgjm+oKLLPhpdDGDWm3ASS8MYE/QzYNHq8
	/dP3wlMPsctPvzy+1CN7I47qTIxxmVyPMVsWCWtKJzEggjK5uwWhW3C2pw09sjXp
	sv9DBowbLIp2IMBxbOM7i/CCLY6oKapWnCAO4FyoTBsPNOtduHf3xdcjgQ3eW/yC
	Oj/qgaLwhQnXbz0iAAwNjpGL4/T88Xg/lrAkC1hVEeGsKJQM/6c3xM7g==
Received: (qmail 2915375 invoked from network); 12 May 2026 10:56:31 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 May 2026 10:56:31 +0200
X-UD-Smtp-Session: l3s3148p1@b6YcCptR9NQujns3
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-remoteproc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Andy Gross <agross@codeaurora.org>,
	Ohad Ben-Cohen <ohad@wizery.com>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH RFT] hwspinlock: qcom: avoid uninitialized struct members
Date: Tue, 12 May 2026 10:53:28 +0200
Message-ID: <20260512085509.30626-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0171D51D860
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107063-lists,linux-arm-msm=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-arm-msm@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:email,sang-engineering.com:mid,sang-engineering.com:dkim]
X-Rspamd-Action: no action

The reg_field is allocated on stack, so using the REG_FIELD macro will
ensure that unused members do not have uninitialized values.

Fixes: 19a0f61224d2 ("hwspinlock: qcom: Add support for Qualcomm HW Mutex block")
Link: https://lore.kernel.org/r/https://sashiko.dev/#/patchset/20260319105947.6237-1-wsa%2Brenesas%40sang-engineering.com # review of patch 6
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only.

 drivers/hwspinlock/qcom_hwspinlock.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 0390979fd765..712003a4640c 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -202,7 +202,6 @@ static struct regmap *qcom_hwspinlock_probe_mmio(struct platform_device *pdev,
 static int qcom_hwspinlock_probe(struct platform_device *pdev)
 {
 	struct hwspinlock_device *bank;
-	struct reg_field field;
 	struct regmap *regmap;
 	size_t array_size;
 	u32 stride;
@@ -224,9 +223,7 @@ static int qcom_hwspinlock_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, bank);
 
 	for (i = 0; i < QCOM_MUTEX_NUM_LOCKS; i++) {
-		field.reg = base + i * stride;
-		field.lsb = 0;
-		field.msb = 31;
+		struct reg_field field = REG_FIELD(base + i * stride, 0, 31);
 
 		bank->lock[i].priv = devm_regmap_field_alloc(&pdev->dev,
 							     regmap, field);
-- 
2.47.3


