Return-Path: <linux-arm-msm+bounces-29468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B97695ECF8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 11:20:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EF611F2214C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 09:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3924D14534A;
	Mon, 26 Aug 2024 09:19:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205F614375D;
	Mon, 26 Aug 2024 09:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724663988; cv=none; b=FgxBa03qcaVzbjHbtawK3URqaVWSgVzk9A6yTFahz51ZlTpaNwUFcp6VI15oYBDZi3DCo6vycpici+Fk2bS73szmPXxl6CrXBGRBRjWRSQ/72oKRMjJxa+MGE14LPn7AGd5FUZbQWCJFFHUwSgTyd4csZ8lIVD9JviHOtUNWOj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724663988; c=relaxed/simple;
	bh=Mr9hCNs+O49bH0NxD/PEQrOYFZjoMdWusHz8GwZ6rQo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gsKjWGAQw+7mPhldmFlBoqMkdG46+Ze+4qz+A3BEu2LEawTmw3ZkOaJgsxGHntz++6fvegEfNLU9/ZIX83HCA5eB5c73ANJtL3MdIZzDq2Ekfk954FZYJqnnVTEA6vYhKyD+8sEVtjcsOPvBOOc43z4yCBxpca/f5wR7KPnAGeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4WslVt3s4jz1S8vb;
	Mon, 26 Aug 2024 17:19:34 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id C0A8D18002B;
	Mon, 26 Aug 2024 17:19:43 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 26 Aug
 2024 17:19:43 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <lee@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <krzk@kernel.org>, <jic23@kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next RESEND 2/2] mfd: qcom-spmi-pmic: Use for_each_child_of_node_scoped()
Date: Mon, 26 Aug 2024 17:27:34 +0800
Message-ID: <20240826092734.2899562-3-ruanjinjie@huawei.com>
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
 drivers/mfd/qcom-spmi-pmic.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mfd/qcom-spmi-pmic.c b/drivers/mfd/qcom-spmi-pmic.c
index eab5bf6cff10..b4b178caf754 100644
--- a/drivers/mfd/qcom-spmi-pmic.c
+++ b/drivers/mfd/qcom-spmi-pmic.c
@@ -84,7 +84,6 @@ static const struct of_device_id pmic_spmi_id_table[] = {
 static struct spmi_device *qcom_pmic_get_base_usid(struct spmi_device *sdev, struct qcom_spmi_dev *ctx)
 {
 	struct device_node *spmi_bus;
-	struct device_node *child;
 	int function_parent_usid, ret;
 	u32 pmic_addr;
 
@@ -108,10 +107,9 @@ static struct spmi_device *qcom_pmic_get_base_usid(struct spmi_device *sdev, str
 	 */
 	spmi_bus = of_get_parent(sdev->dev.of_node);
 	sdev = ERR_PTR(-ENODATA);
-	for_each_child_of_node(spmi_bus, child) {
+	for_each_child_of_node_scoped(spmi_bus, child) {
 		ret = of_property_read_u32_index(child, "reg", 0, &pmic_addr);
 		if (ret) {
-			of_node_put(child);
 			sdev = ERR_PTR(ret);
 			break;
 		}
@@ -125,7 +123,6 @@ static struct spmi_device *qcom_pmic_get_base_usid(struct spmi_device *sdev, str
 				 */
 				sdev = ERR_PTR(-EPROBE_DEFER);
 			}
-			of_node_put(child);
 			break;
 		}
 	}
-- 
2.34.1


