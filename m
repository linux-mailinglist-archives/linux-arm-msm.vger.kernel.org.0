Return-Path: <linux-arm-msm+bounces-25540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D84792ADF4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 03:58:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F40F1C21519
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 01:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2398E2BAEF;
	Tue,  9 Jul 2024 01:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="bw/1shH5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8672A8FE;
	Tue,  9 Jul 2024 01:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720490327; cv=none; b=Gcc7u0Y5rlnTvHVRKkMIXRFBuNZh4X6eOcJF7Uqg4h6udGSw1M/PknzUbaITGgBRmU9XQoQwJhP/OrfM20M8uJs7H00w9QBwiUAtYHmCVzusOuv2GylpAUuxgnef2S7S26ekOT4mBNPs5baeb/5Im8kiqatcCisNo657KEVffBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720490327; c=relaxed/simple;
	bh=SbITn/NJ0ImuVnQwIG27scr/uaOrxyWh6qpM8UCbrgo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FDoMPabs4kj4zDhoy89xl1j1brsbRjOiLteEj1pFxU4df8XosVd+Qh93eswYr1hNZD9PMOE6Dx9xgyL1kjSgGDPY7aezF2GsJfazoTie4mLimu6NJIJF//8OH+pMJRirv/TofFLNu/B421FdPgnjUYvYt6+TVnaLWjvorICfIuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=bw/1shH5; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=NyHkN
	eqq5bZSo8OxYkVnYsj99xGwfUPsdu6iemJRJaY=; b=bw/1shH5OUfAeXTxmM7Bh
	Nrzr/7d103g4b2GZPFCz5KiIC+6ot8GfbuIc5JU9Dz2EWmNwx/l5HJsRTXmI4Z6P
	0UCGF3qYFhl6T8AhVnADjpAtzKvT4iCOkzG/L/uOBMJcd9P+1Cf2Wgl1QCkPiVIC
	fbx2+i5jes1EJGLnw8i6w4=
Received: from localhost.localdomain (unknown [223.104.68.188])
	by gzga-smtp-mta-g2-2 (Coremail) with SMTP id _____wD3n_k9mYxmjur5Ag--.7452S2;
	Tue, 09 Jul 2024 09:58:22 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: manivannan.sadhasivam@linaro.org
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH] bus: mhi: host: Add firehose support for Foxconn SDX24/SDX55/SDX65
Date: Tue,  9 Jul 2024 09:58:18 +0800
Message-Id: <20240709015818.110384-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3n_k9mYxmjur5Ag--.7452S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF4UAr4rKr18Aw18GFWxJFb_yoW5KFWDpF
	na9r4rJw4ktFWfKrs7Aw1kCwn3Crs09ryxt3ZxG342yr15A3yqqF4DG3W29w45Z3s7Jr1I
	vF98WFWDC3Z7JF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0picyCdUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiRwEXZGV4KMAVPgAAsr

Since we implement the FIREHOSE channel support in foxconn mhi
channels, that means each product which use this channel config
would support FIREHOSE. But according to the trigger_edl feature,
we need to enable it by adding '.edl_trigger = true' in device
info struct.
Also, we update all edl image path from 'qcom' to 'fox' in case of
conflicting with other vendors.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/bus/mhi/host/pci_generic.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 14a11880bcea..440609b81e57 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -433,8 +433,8 @@ static const struct mhi_controller_config modem_foxconn_sdx72_config = {
 
 static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
 	.name = "foxconn-sdx55",
-	.fw = "qcom/sdx55m/sbl1.mbn",
-	.edl = "qcom/sdx55m/edl.mbn",
+	.edl = "fox/sdx55m/prog_firehose_sdx55.mbn",
+	.edl_trigger = true,
 	.config = &modem_foxconn_sdx55_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
@@ -444,8 +444,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
 
 static const struct mhi_pci_dev_info mhi_foxconn_t99w175_info = {
 	.name = "foxconn-t99w175",
-	.fw = "qcom/sdx55m/sbl1.mbn",
-	.edl = "qcom/sdx55m/edl.mbn",
+	.edl = "fox/sdx55m/prog_firehose_sdx55.mbn",
+	.edl_trigger = true,
 	.config = &modem_foxconn_sdx55_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
@@ -455,8 +455,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w175_info = {
 
 static const struct mhi_pci_dev_info mhi_foxconn_dw5930e_info = {
 	.name = "foxconn-dw5930e",
-	.fw = "qcom/sdx55m/sbl1.mbn",
-	.edl = "qcom/sdx55m/edl.mbn",
+	.edl = "fox/sdx55m/prog_firehose_sdx55.mbn",
+	.edl_trigger = true,
 	.config = &modem_foxconn_sdx55_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
@@ -466,6 +466,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_dw5930e_info = {
 
 static const struct mhi_pci_dev_info mhi_foxconn_t99w368_info = {
 	.name = "foxconn-t99w368",
+	.edl = "fox/sdx65m/prog_firehose_lite.elf",
+	.edl_trigger = true,
 	.config = &modem_foxconn_sdx55_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
@@ -475,6 +477,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w368_info = {
 
 static const struct mhi_pci_dev_info mhi_foxconn_t99w373_info = {
 	.name = "foxconn-t99w373",
+	.edl = "fox/sdx65m/prog_firehose_lite.elf",
+	.edl_trigger = true,
 	.config = &modem_foxconn_sdx55_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
@@ -484,6 +488,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w373_info = {
 
 static const struct mhi_pci_dev_info mhi_foxconn_t99w510_info = {
 	.name = "foxconn-t99w510",
+	.edl = "fox/sdx24m/prog_firehose_sdx24.mbn",
+	.edl_trigger = true,
 	.config = &modem_foxconn_sdx55_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
@@ -493,6 +499,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w510_info = {
 
 static const struct mhi_pci_dev_info mhi_foxconn_dw5932e_info = {
 	.name = "foxconn-dw5932e",
+	.edl = "fox/sdx65m/prog_firehose_lite.elf",
+	.edl_trigger = true,
 	.config = &modem_foxconn_sdx55_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
-- 
2.25.1


