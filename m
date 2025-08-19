Return-Path: <linux-arm-msm+bounces-69638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 711DAB2B69C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 04:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8486918A4A8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 02:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1567E286422;
	Tue, 19 Aug 2025 02:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="hXnZhzfS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBDEE21E0BB;
	Tue, 19 Aug 2025 02:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755568837; cv=none; b=mcfq+8bH6a5uOEB1maHyBn2qZ+75C1s+D0P6Q7zq8viqJzbFM+Ls3WfEwplx9AzasXjP9J7Hzf7gDXhUzMAw8lBTJRtdatQ43jYhWdtmBy/YCLIKa6lOINqDbjnVxRCf1CUteYRArfk3NEo0VyQxnmeXGdACA/mlL0OF2DNuHg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755568837; c=relaxed/simple;
	bh=wxEfqCK6003W0GDgqJ6vYz2LNyzJsLJxp49Ny4AZLy4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KJHEGf0g/VNGlnv1BKXlfgSISbBj9LMW/b2wusceIX6SCn0c1gKSjfGzfNuKUR/OiwW59CRHG9pwaSZFOcJuqr7acNoA/lj7p+rL5KCi0JfKJBZ5uoDtcd9ENxb4qRSHXDx2wETNpGrO0WLILW/DwJyhh+mtYUTbg9gYLQ9BIzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=hXnZhzfS; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Jb
	yOurLfVxwvAelppevDM1mpgbiZJFb5iSCgPWWWFfQ=; b=hXnZhzfS1KmYjXA6bH
	uswJiMQ5KSt9FYfVLGZnCJDgpUzyJY63fwz4knzNr/57KvltgVhYZzBDChS80FRO
	DuMo9ntGUK2E0xhXNM3T+Wh0JRdJFXv/9taBK/C9XZg/Ob+C9xWvVz3qrBrl6FbY
	Cr53joQHVrZWPhNjXlt501nWU=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wBHrZCx2qNo1JvJCw--.46296S2;
	Tue, 19 Aug 2025 10:00:18 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: mani@kernel.org
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH] bus: mhi: host: pci_generic: Use subsystem device ID PCI_ANY_ID for Foxconn T99W696 variants
Date: Tue, 19 Aug 2025 10:00:13 +0800
Message-Id: <20250819020013.122162-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBHrZCx2qNo1JvJCw--.46296S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJryDJFy7ZrW7try5ZF1UZFb_yoW8uFWkpF
	Wa93yUtrWDJrW5Kw4vvrykJFykua13Ary7Kr17t34FgF13KFy5XrZ7XryUZa4aga98JF4a
	vFWkua4UW3ZrJF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRhNVhUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiRwuuZGijzfm2oQABsv

Since there are too many variants for Foxconn T99W696 SKU, and
they share same settings. So we use PCI_ANY_ID as the subsystem
device ID to match each possible settings.

Fixes: 0d63055e1406 ("bus: mhi: host: pci_generic: Add Foxconn T99W696 modem")
Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/bus/mhi/host/pci_generic.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 4edb5bb476ba..4564e2528775 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -917,20 +917,8 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* Telit FE990A */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2015),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fe990a_info },
-	/* Foxconn T99W696.01, Lenovo Generic SKU */
-	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe142),
-		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
-	/* Foxconn T99W696.02, Lenovo X1 Carbon SKU */
-	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe143),
-		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
-	/* Foxconn T99W696.03, Lenovo X1 2in1 SKU */
-	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe144),
-		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
-	/* Foxconn T99W696.04, Lenovo PRC SKU */
-	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe145),
-		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
-	/* Foxconn T99W696.00, Foxconn SKU */
-	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe146),
+	/* Foxconn T99W696, all variants */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, PCI_ANY_ID),
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
-- 
2.25.1


