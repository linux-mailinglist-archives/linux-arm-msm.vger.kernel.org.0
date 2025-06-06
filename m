Return-Path: <linux-arm-msm+bounces-60461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB931ACFFAE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 11:51:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F251D3A44A2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 09:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40950286430;
	Fri,  6 Jun 2025 09:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nReW8NZX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C5EA13B2A4;
	Fri,  6 Jun 2025 09:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749203481; cv=none; b=tnEDBOlv9BfIe+FilXsEEojwYYBqr0XqQmr2NCQpUiPHhqLPZyze/G0poO3+axlE9alI+oibcxAloo4MK8OItZLX0hX/xEdHo0iqjRCk6QUxGp6cgz4MpfWJxHCV/3x6Felb6+MflR3DS/wmf3dQgQys15S6BqnU0gUM6eradgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749203481; c=relaxed/simple;
	bh=Liqzz+y3Xpct0YUxn1hcdqAN16lyEo7U507Jr8n4RDA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OJmU3fhiHj9XXF4Shy4aIoev+Lny+1dHr6Kd0pBN/oaMOREwQSmjMCom/WBJgRpR7cqtiN42U1si+SLvPFBU9hw3Bmp4iLoZRdYBSB6+J115IFxjOdH1VoQxTTMwMOrByOaGJ2sNSGDJvs0Uw6mWmr8K7np25CTC8HHloVyfRMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nReW8NZX; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=gV
	Q67dkOWrUUbsyOUp1tkuG+EhYQ5alDpGFSmm71tg0=; b=nReW8NZX2u/A3csB07
	Ts+bguMylNdkNqrnf2D7GisAbTZQPVObt7IMiGHnmC3FjnIYaPNxMCeqYdoEIzXV
	g0/PK6f8LG4kREf6iUK8GT/fdCm3UepINupCu7ENZFeBc3rCmnhZI1fVV2YlPaeQ
	fDMQ39Hj0tOJv0Rx48mth5tS4=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnS1LduUJoDSSKGQ--.2037S2;
	Fri, 06 Jun 2025 17:50:23 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: manivannan.sadhasivam@linaro.org,
	johan+linaro@kernel.org,
	mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH] bus: mhi: host: pci_generic: Change T99W515 to T99W640
Date: Fri,  6 Jun 2025 17:50:19 +0800
Message-Id: <20250606095019.383992-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnS1LduUJoDSSKGQ--.2037S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFy7GFWfArW8Zr18Wr1UAwb_yoW8WF48pF
	4fur1UtaykXr45Ka1kAryDuas8GrsxCryxK3WxG34Igr1qyrWYgFZ7Gr1a9w1Yqa93tF1S
	vFWUuFyUX3WDKF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRhNVhUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbibgZkZGhCsRPxxQAAsU

T99W515 is a LGA device but not a M.2 modem device.
So correct this name in case a name mismatch issue.

Fixes: bf30a75e6e00("bus: mhi: host: Add support for Foxconn SDX72 modems")
Signed-off-by: Slark Xiao<slark_xiao@163.com>
---
 drivers/bus/mhi/host/pci_generic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index a4a62429c784..9c2d10327ce5 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -593,8 +593,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_dw5932e_info = {
 	.sideband_wake = false,
 };
 
-static const struct mhi_pci_dev_info mhi_foxconn_t99w515_info = {
-	.name = "foxconn-t99w515",
+static const struct mhi_pci_dev_info mhi_foxconn_t99w640_info = {
+	.name = "foxconn-t99w640",
 	.edl = "qcom/sdx72m/foxconn/edl.mbn",
 	.edl_trigger = true,
 	.config = &modem_foxconn_sdx72_config,
@@ -920,9 +920,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* DW5932e (sdx62), Non-eSIM */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0f9),
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_dw5932e_info },
-	/* T99W515 (sdx72) */
+	/* T99W640 (sdx72) */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe118),
-		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w515_info },
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w640_info },
 	/* DW5934e(sdx72), With eSIM */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe11d),
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_dw5934e_info },
-- 
2.25.1


