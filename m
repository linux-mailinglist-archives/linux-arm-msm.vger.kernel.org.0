Return-Path: <linux-arm-msm+bounces-29469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAF095ECFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 11:20:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF6AB1C21790
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 09:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927AB145B0F;
	Mon, 26 Aug 2024 09:19:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3EA13FD66;
	Mon, 26 Aug 2024 09:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724663988; cv=none; b=QhUD4zzVSdW69RfqOsE9dTNVrUUj8T9kNNnLYeBl6rcA4AdfXRDs8/VVxRE8DYkTpgJUIb17rU+jBUxsm/TQadjOJyrDD28861GO1ywRLlylM/uKN8m45CoXOQkWpUn0qhEIShrG2yMVu4mcSDSBUwCQPqK7Eu3oPVlOcEGA1Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724663988; c=relaxed/simple;
	bh=nYyO6LwgVFzXt2p7i0oGLkc8P1po82g1BGlszDnuFBo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MbVgEssSj8d5poh+v7ZQ7p9q+pNAS7VUw4GAkZVYTaatqsrblM6Zj200Aw2A+ZEUPUcusPqmvukusW9iGAG7zVRfpnueiAHn5ouMKab5EoRgd2dtTWnmibOBItljQRUPFiANIefCbRrzmpgLz6xFGGLWs9ZTOxZwlI9537b4eu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4WslV96g5zz14DqL;
	Mon, 26 Aug 2024 17:18:57 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 60EA9140258;
	Mon, 26 Aug 2024 17:19:43 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 26 Aug
 2024 17:19:42 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <lee@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <krzk@kernel.org>, <jic23@kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next RESEND 1/2] mfd: max77620: Use for_each_child_of_node_scoped()
Date: Mon, 26 Aug 2024 17:27:33 +0800
Message-ID: <20240826092734.2899562-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826092734.2899562-1-ruanjinjie@huawei.com>
References: <20240826092734.2899562-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemh500013.china.huawei.com (7.202.181.146)

Avoids the need for manual cleanup of_node_put() in early exits
from the loop.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/mfd/max77620.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
index 74ef3f6d576c..89b30ef91f4f 100644
--- a/drivers/mfd/max77620.c
+++ b/drivers/mfd/max77620.c
@@ -400,7 +400,7 @@ static int max77620_config_fps(struct max77620_chip *chip,
 static int max77620_initialise_fps(struct max77620_chip *chip)
 {
 	struct device *dev = chip->dev;
-	struct device_node *fps_np, *fps_child;
+	struct device_node *fps_np;
 	u8 config;
 	int fps_id;
 	int ret;
@@ -414,10 +414,9 @@ static int max77620_initialise_fps(struct max77620_chip *chip)
 	if (!fps_np)
 		goto skip_fps;
 
-	for_each_child_of_node(fps_np, fps_child) {
+	for_each_child_of_node_scoped(fps_np, fps_child) {
 		ret = max77620_config_fps(chip, fps_child);
 		if (ret < 0) {
-			of_node_put(fps_child);
 			of_node_put(fps_np);
 			return ret;
 		}
-- 
2.34.1


