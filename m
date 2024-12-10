Return-Path: <linux-arm-msm+bounces-41377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C579EBF9D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 00:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1BA71883D4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 23:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BEB51EE7BE;
	Tue, 10 Dec 2024 23:49:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 6.mo560.mail-out.ovh.net (6.mo560.mail-out.ovh.net [87.98.165.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C0D21129B
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 23:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.98.165.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733874574; cv=none; b=ao6+NFL+TfirwV8khkP6Y+SvcrxwvwL0X/X3rVlqvnqhgXwSRXJ/uKQ9TmrlZkW1QES5UYCSoP6cB4fQIWF4Rt4Z9wwbpsfuVB7Q6rZLSE+FPPyLuIfm9S/XPzfBQYu4J9JW9O/z7rfv+nDfTfsMemFX1u3f2HXXZELpIxlOZaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733874574; c=relaxed/simple;
	bh=V7WxhcSRo7Z13GyMhzZfosj0za7yYWqdR2pk3f+c/MI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WfZXp+iHM2Ne+ljN86DCK4PDR0bPXjTb27I99kHsciJSMFsyVpe+Mga4s+MAmFEZaMZI+UW1eBWa6TTn3CqzGGVfdOYg3hIqOQ6cK0lVppLnuHQ+LjQq6h+iNsoDvI/Gyl4xxgSfbjDhbaNww9JtyOlB2pfCiTUTa7QakA9U0SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=87.98.165.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.139.198])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4Y7Dy61kj8z1WbF
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 23:11:42 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-tq7hg (unknown [10.110.178.126])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id C819A1FDF5;
	Tue, 10 Dec 2024 23:11:41 +0000 (UTC)
Received: from etezian.org ([37.59.142.104])
	by ghost-submission-5b5ff79f4f-tq7hg with ESMTPSA
	id pMM/J63KWGcQEgAAVrlVGw
	(envelope-from <andi@etezian.org>); Tue, 10 Dec 2024 23:11:41 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-104R005defa95bb-64dc-45eb-9c1c-e10cdf0f34ce,
                    FE3B76875E3B0A6FCB1003007887B313CBEB2737) smtp.auth=andi@etezian.org
X-OVh-ClientIp:178.39.90.92
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH 2/2] i2c: qcom-geni: Simplify error handling in probe function
Date: Wed, 11 Dec 2024 00:10:54 +0100
Message-ID: <20241210231054.2844202-3-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241210231054.2844202-1-andi.shyti@kernel.org>
References: <20241210231054.2844202-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14604610643883657799
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefuddrjeelgddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepgfduveejteegteelhfetueetheegfeehhfektddvleehtefhheevkeduleeuueevnecukfhppeduvdejrddtrddtrddupddujeekrdefledrledtrdelvddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheeitdgmpdhmohguvgepshhmthhpohhuth

Avoid repeating the error handling pattern:

        geni_se_resources_off(&gi2c->se);
        clk_disable_unprepare(gi2c->core_clk);
        return;

Introduce a single 'goto' exit label for cleanup in case of
errors. While there are currently two distinct exit points, there
is no overlap in their handling, allowing both branches to
coexist cleanly.

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 01db24188e29..3fc85595a4aa 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -867,14 +867,13 @@ static int geni_i2c_probe(struct platform_device *pdev)
 
 	ret = geni_se_resources_on(&gi2c->se);
 	if (ret) {
-		clk_disable_unprepare(gi2c->core_clk);
-		return dev_err_probe(dev, ret, "Error turning on resources\n");
+		dev_err_probe(dev, ret, "Error turning on resources\n");
+		goto err_clk;
 	}
 	proto = geni_se_read_proto(&gi2c->se);
 	if (proto != GENI_SE_I2C) {
-		geni_se_resources_off(&gi2c->se);
-		clk_disable_unprepare(gi2c->core_clk);
-		return dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
+		dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
+		goto err_off;
 	}
 
 	if (desc && desc->no_dma_support)
@@ -886,11 +885,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		/* FIFO is disabled, so we can only use GPI DMA */
 		gi2c->gpi_mode = true;
 		ret = setup_gpi_dma(gi2c);
-		if (ret) {
-			geni_se_resources_off(&gi2c->se);
-			clk_disable_unprepare(gi2c->core_clk);
-			return ret;
-		}
+		if (ret)
+			goto err_off;
 
 		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
 	} else {
@@ -902,10 +898,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 			tx_depth = desc->tx_fifo_depth;
 
 		if (!tx_depth) {
-			geni_se_resources_off(&gi2c->se);
-			clk_disable_unprepare(gi2c->core_clk);
-			return dev_err_probe(dev, -EINVAL,
-					     "Invalid TX FIFO depth\n");
+			dev_err_probe(dev, -EINVAL, "Invalid TX FIFO depth\n");
+			goto err_off;
 		}
 
 		gi2c->tx_wm = tx_depth - 1;
@@ -944,8 +938,16 @@ static int geni_i2c_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_off:
+	geni_se_resources_off(&gi2c->se);
+err_clk:
+	clk_disable_unprepare(gi2c->core_clk);
+
+	return ret;
+
 err_dma:
 	release_gpi_dma(gi2c);
+
 	return ret;
 }
 
-- 
2.45.2


