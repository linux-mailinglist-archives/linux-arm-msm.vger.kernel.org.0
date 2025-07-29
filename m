Return-Path: <linux-arm-msm+bounces-66971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F38C8B14A88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 10:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2497F177875
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 08:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869AA2857DE;
	Tue, 29 Jul 2025 08:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="MqUGmcR4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2732586E0;
	Tue, 29 Jul 2025 08:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753779495; cv=none; b=bqZLd5ZuLnEgeUklbWmrT8ts1m6BhjzLp4DZTEPtZ9v2unB4JB3qGPuaGsDzDkHp2AYF0Hu82NjpG7O5SU/xCWei6ARahOvUBZIdFVJ76B5V23+9rHfkpA5PPD3nnhdHXa6+f3FklR/Ws1ap2ljpigGxqrZ7k4VPAko9S8rH7ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753779495; c=relaxed/simple;
	bh=ievyL3g5Q46qxKZLnTmv/cYFeSgsBclXR9pVlWgcUos=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JnK6IKPtWjg87hFlqCSjWE6RzQPVL9i85OX6WFNbEJFwKyfrFy+qCCHD2h7M8k/lgDGaPAW/hTPL0soFfuAGlxujz6jEhywD/FqhgnKlkyCLnVZa00GNJOj5DrM9Ig3TLdxuxAgu6Mr2iMyfERv08hkga6awU+kCMPvpuYZyBoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=MqUGmcR4; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=AY
	UxPqccz5cc9qwkjV/MuJfbqx0ykQG6VuIw9i/MVRs=; b=MqUGmcR4X+V3QuPOKK
	/qQRCmn3WuyaoLrtyZSi9GYS6R7ArBXAZR+ICJMVFFPm7cBhHytgqC+3UPwP5AaY
	hPjEkzSpgEgstvu9ToHy5hL13eAEHKbW37qna7I2MYeRT1+zc96GYlHftnFSsZ+w
	yAf9oXyC6Z44wg+b4nfji1ihI=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgDnr7wCjYho7e6SCQ--.26154S2;
	Tue, 29 Jul 2025 16:57:39 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: mani@kernel.org
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH] bus: mhi: host: pci_generic: Add more Foxconn T99W696 modem
Date: Tue, 29 Jul 2025 16:57:26 +0800
Message-Id: <20250729085726.106807-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgDnr7wCjYho7e6SCQ--.26154S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw4xurW7ur4xXFyUJF45Awb_yoW8uFWkpF
	4furWjqrWDJrW8tw4vvr4kZF95ua1fXry7Kr1xtw1FgrnakFy5Xrs7XryUZF13ta98Jr4a
	vFykuF1UWanFyFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRgdjiUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiMBGZZGiIgnP2lQAAsu

There are more platforms need support Foxconn T99W696 modem.
This requirement comes from Lenovo side since they want 1 platform
to correspond to 1 modem SKU.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/bus/mhi/host/pci_generic.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 4edb5bb476ba..1fc43f1b86be 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -932,6 +932,24 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* Foxconn T99W696.00, Foxconn SKU */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe146),
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
+	/* Foxconn T99W696.05, Lenovo T14 */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe150),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
+	/* Foxconn T99W696.06, Lenovo T15 */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe151),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
+	/* Foxconn T99W696.07, Lenovo T16 */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe152),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
+	/* Foxconn T99W696.08, Lenovo P14s */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe153),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
+	/* Foxconn T99W696.09, Lenovo P16s */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe154),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
+	/* Foxconn T99W696.10, Lenovo P1 */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe155),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
 	/* Telit FN990B40 (sdx72) */
-- 
2.25.1


