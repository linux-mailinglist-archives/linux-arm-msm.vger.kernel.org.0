Return-Path: <linux-arm-msm+bounces-38975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 258179D7264
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 15:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 739B016392D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 14:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB3F1F8F12;
	Sun, 24 Nov 2024 13:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RNoJzJfp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DD31D357A;
	Sun, 24 Nov 2024 13:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732455762; cv=none; b=nY9RUiXTGWY2UKR2OCICHr3WYaR1GsnNtp+ecglS9DBJM+Hb0M4Chn5WQMh4je4mNWdieJh56sykuekEU6Y6r/BCQpcpakcmgUIaQjgL0Mfg0jQYY2/tVZV0/xuYvPece2WSFspCJOt2/jCQ8t29pNvpU+0C7KDJ1C9KCNKGgP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732455762; c=relaxed/simple;
	bh=s+OAzGTHxef1Z14wQ9FkruNi4WHFXo3WVWtCL0MRYjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k0Ek36AI9KYSwRQ6TPuDz2N/feZx7nx6wZspWv9PVlDmgR0MOLD0kmEw2St89/wO41heD60xCR2uap3eMr0uwyE7Ws5CI6coRHI2lfeboHBwgmfdcS2STce1bn9SqBlfrNxvZrxqScey3HALfAPBdnL7kvOSYmGq9JIO8vW1w9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RNoJzJfp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F0DCC4CED3;
	Sun, 24 Nov 2024 13:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732455762;
	bh=s+OAzGTHxef1Z14wQ9FkruNi4WHFXo3WVWtCL0MRYjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RNoJzJfpDBTUTuoqtJQPc8sn7nWK9j0dQuSGY3UxB/3jkFJYkfTtxL0PeUcurNWdB
	 9yfOVi89lT2i6wLXjhFgo/R7MKojv4CowwVfX4QZNCXOdPjT8sKcdKTjVIoR8CJy6P
	 KI4izTlr3kwQ/VoiMRWUZo/a0hoGAhiPzi+cQhqvAkIvRL+ojKzG+HwDZYoNipTR1g
	 rxFvKijYbkXrgvk4J+1r88wX/Ln+viE9mGj4uYOMVaI6taaID2dzvNfCnjKGVhdIWt
	 W1dW6M4GiN6YP/XdrxWF03E+9kthZQqbo5OHcKhC7HnOz0ncprzM+7Di1EUGcezmGl
	 EVa7UW3FC3NRg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Troy Hanson <quic_thanson@quicinc.com>,
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
	ogabbay@kernel.org,
	corbet@lwn.net,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 27/87] accel/qaic: Add AIC080 support
Date: Sun, 24 Nov 2024 08:38:05 -0500
Message-ID: <20241124134102.3344326-27-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124134102.3344326-1-sashal@kernel.org>
References: <20241124134102.3344326-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
Content-Transfer-Encoding: 8bit

From: Jeffrey Hugo <quic_jhugo@quicinc.com>

[ Upstream commit b8128f7815ff135f0333c1b46dcdf1543c41b860 ]

Add basic support for the new AIC080 product. The PCIe Device ID is
0xa080. AIC080 is a lower cost, lower performance SKU variant of AIC100.
From the qaic perspective, it is the same as AIC100.

Reviewed-by: Troy Hanson <quic_thanson@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241004195209.3910996-1-quic_jhugo@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/accel/qaic/aic080.rst | 14 ++++++++++++++
 Documentation/accel/qaic/index.rst  |  1 +
 drivers/accel/qaic/qaic_drv.c       |  4 +++-
 3 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/accel/qaic/aic080.rst

diff --git a/Documentation/accel/qaic/aic080.rst b/Documentation/accel/qaic/aic080.rst
new file mode 100644
index 0000000000000..d563771ea6ce4
--- /dev/null
+++ b/Documentation/accel/qaic/aic080.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+===============================
+ Qualcomm Cloud AI 80 (AIC080)
+===============================
+
+Overview
+========
+
+The Qualcomm Cloud AI 80/AIC080 family of products are a derivative of AIC100.
+The number of NSPs and clock rates are reduced to fit within resource
+constrained solutions. The PCIe Product ID is 0xa080.
+
+As a derivative product, all AIC100 documentation applies.
diff --git a/Documentation/accel/qaic/index.rst b/Documentation/accel/qaic/index.rst
index ad19b88d1a669..967b9dd8bacea 100644
--- a/Documentation/accel/qaic/index.rst
+++ b/Documentation/accel/qaic/index.rst
@@ -10,4 +10,5 @@ accelerator cards.
 .. toctree::
 
    qaic
+   aic080
    aic100
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 580b29ed19021..e18613e9ac3c1 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -34,6 +34,7 @@
 
 MODULE_IMPORT_NS(DMA_BUF);
 
+#define PCI_DEV_AIC080			0xa080
 #define PCI_DEV_AIC100			0xa100
 #define QAIC_NAME			"qaic"
 #define QAIC_DESC			"Qualcomm Cloud AI Accelerators"
@@ -365,7 +366,7 @@ static struct qaic_device *create_qdev(struct pci_dev *pdev, const struct pci_de
 		return NULL;
 
 	qdev->dev_state = QAIC_OFFLINE;
-	if (id->device == PCI_DEV_AIC100) {
+	if (id->device == PCI_DEV_AIC080 || id->device == PCI_DEV_AIC100) {
 		qdev->num_dbc = 16;
 		qdev->dbc = devm_kcalloc(dev, qdev->num_dbc, sizeof(*qdev->dbc), GFP_KERNEL);
 		if (!qdev->dbc)
@@ -609,6 +610,7 @@ static struct mhi_driver qaic_mhi_driver = {
 };
 
 static const struct pci_device_id qaic_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, PCI_DEV_AIC080), },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, PCI_DEV_AIC100), },
 	{ }
 };
-- 
2.43.0


