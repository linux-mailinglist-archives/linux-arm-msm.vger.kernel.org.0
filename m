Return-Path: <linux-arm-msm+bounces-41752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E659EE816
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 14:55:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29F99282186
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 13:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B95214227;
	Thu, 12 Dec 2024 13:54:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 8.mo560.mail-out.ovh.net (8.mo560.mail-out.ovh.net [188.165.52.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8817920ADCD
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 13:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.52.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734011695; cv=none; b=jjeVJ89O7t+uOwP/Vrqga085KiTTYibQu34NWpYFltRk04OnAtJgC2nZlO2aP8UlTBkNfIGYeYRxoWEGw7R4jR/IFKkZ0/ActLJJqcu/fe80R26PxrWEeldcliftreLUKsxIT419q9y06R7T4qDYIbCewv9STntEYxETgDLRgt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734011695; c=relaxed/simple;
	bh=VPjRocNSukRbmdBc3XUtxk+vawkhCNClBfvUMhwY5J4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iZnAvV7Cw0+50r7xuL5cvOnYg+H1Nn8SEaoQsOTbbPEXdPT0PaKW7Fz2aM167pNDuaktY53uE61Mf9Xs0NnixkyjjUHJ+frrXBK8YWofabXbeoBQH5FGJalNHXYZ2xBJg+Yt00vh7zI0jaqJqOxx4+5gCqispKz9g6+hBnRl6dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=188.165.52.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.148.146])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4Y8DVX6pc3z1Rbk
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 13:54:44 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-dx889 (unknown [10.110.164.150])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 8B0D71FE94;
	Thu, 12 Dec 2024 13:54:44 +0000 (UTC)
Received: from etezian.org ([37.59.142.98])
	by ghost-submission-5b5ff79f4f-dx889 with ESMTPSA
	id IP8jGSTrWmfJBAEAV5M9HA
	(envelope-from <andi@etezian.org>); Thu, 12 Dec 2024 13:54:44 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-98R002bd5ad6a2-8b7b-4542-9082-b4b10b8058e6,
                    7E8E14E11F102121CE247F47C6B4DBC0808239E0) smtp.auth=andi@etezian.org
X-OVh-ClientIp:178.39.90.92
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v2 2/2] i2c: qcom-geni: Simplify error handling in probe function
Date: Thu, 12 Dec 2024 14:54:16 +0100
Message-ID: <20241212135416.244504-3-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241212135416.244504-1-andi.shyti@kernel.org>
References: <20241212135416.244504-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16943667699760040519
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefuddrkeehgdehiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepgfduveejteegteelhfetueetheegfeehhfektddvleehtefhheevkeduleeuueevnecukfhppeduvdejrddtrddtrddupddujeekrdefledrledtrdelvddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedtmgdpmhhouggvpehsmhhtphhouhht

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
 drivers/i2c/busses/i2c-qcom-geni.c | 32 ++++++++++++++++--------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 01db24188e29..88709b97f86d 100644
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
+		goto err_resources;
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
+			goto err_resources;
 
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
+			goto err_resources;
 		}
 
 		gi2c->tx_wm = tx_depth - 1;
@@ -942,10 +936,18 @@ static int geni_i2c_probe(struct platform_device *pdev)
 
 	dev_dbg(dev, "Geni-I2C adaptor successfully added\n");
 
-	return 0;
+	return ret;
+
+err_resources:
+	geni_se_resources_off(&gi2c->se);
+err_clk:
+	clk_disable_unprepare(gi2c->core_clk);
+
+	return ret;
 
 err_dma:
 	release_gpi_dma(gi2c);
+
 	return ret;
 }
 
-- 
2.45.2


