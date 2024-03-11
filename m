Return-Path: <linux-arm-msm+bounces-13870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BC6878A30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 22:50:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2937B1F21745
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 21:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D113256B89;
	Mon, 11 Mar 2024 21:50:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DB956B6A
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 21:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710193806; cv=none; b=mKBtpDBp4qN7v3hc0HBO42CBXVftMRWbeK5uQq8Ef7TPQNS81gBV2GLaxoqB/4eeEykvER++ASPNekqWVWA29t9i0/9ePACmaO7fs/WP/YXUjOCRXgaeuSZiFCCVaPEBTT1dQV4Io5XslTMKjaMvhZ4YsGqjcoFyW9FjBUHiQgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710193806; c=relaxed/simple;
	bh=siklY8AyTepBDoVjY5hu8J7Bk3TQfvEqwxIzIKqkXfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e87NAQslTS/gPhvtPE15bQAynT9KANGcBZfjNFyHsv//fSaXSPboQhPiTfJIrfObiErFC9S1OkQ/zlxnq0JKcSuHSKk+o9gx79R1miHeSVp1K6CAQbO2M5VSpk70l0VAYvuG7pUtZxcyNJ7GnXQNj9d/6ExCe6rB2oovO/myQq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rjnWz-0003DX-Kg; Mon, 11 Mar 2024 22:50:01 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rjnWz-005nDk-5d; Mon, 11 Mar 2024 22:50:01 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rjnWz-004IoU-0I;
	Mon, 11 Mar 2024 22:50:01 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 1/3] Bluetooth: btqcomsmd: Convert to platform remove callback returning void
Date: Mon, 11 Mar 2024 22:49:52 +0100
Message-ID:  <0707da8c41e85d74788733bc455275580bed778b.1710193561.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1710193561.git.u.kleine-koenig@pengutronix.de>
References: <cover.1710193561.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1879; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=siklY8AyTepBDoVjY5hu8J7Bk3TQfvEqwxIzIKqkXfM=; b=owGbwMvMwMXY3/A7olbonx/jabUkhtT3NU1Rn3wXpyxf3yMs9988Ppn5pVyIYblWQ9V3kRnbz To51f07GY1ZGBi5GGTFFFnsG9dkWlXJRXau/XcZZhArE8gUBi5OAZhIpQf7X1l31pM/uSTOsQSz amTNVbDR1dW4sbvF/hjnvfQyrfLbvK38zhlW4Tf3b9khrVehPyciaYupc98N4YoDJi+drCPOOF1 es+Ltgj1RbYyPyyNC/RM4d4RZubsWLFkxzcX+heD2o1/Y9QKktasMfE2DVM/9szT4f6dfTOHFjO L6xgBZjdNCu8SMkkyz/3D2Tj2s1WHTq+UndKmrdfL2pbOFPz9YFbvhvCrr1/JDj3tP72q/ab37h uz+jFsKu6dy2plkhN/l3P2Fx9Jwd0X+8UX2WV3T93c3twhJnGAJz5PpEjBjq0nPje68wfZVps11 0SZeZf891xfKqE1VMJO1q5R6WhctPf/jVoHrhguM3gAA
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/bluetooth/btqcomsmd.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/btqcomsmd.c b/drivers/bluetooth/btqcomsmd.c
index 11c7e04bf394..88dbb2f3fabf 100644
--- a/drivers/bluetooth/btqcomsmd.c
+++ b/drivers/bluetooth/btqcomsmd.c
@@ -197,7 +197,7 @@ static int btqcomsmd_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int btqcomsmd_remove(struct platform_device *pdev)
+static void btqcomsmd_remove(struct platform_device *pdev)
 {
 	struct btqcomsmd *btq = platform_get_drvdata(pdev);
 
@@ -206,8 +206,6 @@ static int btqcomsmd_remove(struct platform_device *pdev)
 
 	rpmsg_destroy_ept(btq->cmd_channel);
 	rpmsg_destroy_ept(btq->acl_channel);
-
-	return 0;
 }
 
 static const struct of_device_id btqcomsmd_of_match[] = {
@@ -218,7 +216,7 @@ MODULE_DEVICE_TABLE(of, btqcomsmd_of_match);
 
 static struct platform_driver btqcomsmd_driver = {
 	.probe = btqcomsmd_probe,
-	.remove = btqcomsmd_remove,
+	.remove_new = btqcomsmd_remove,
 	.driver  = {
 		.name  = "btqcomsmd",
 		.of_match_table = btqcomsmd_of_match,
-- 
2.43.0


