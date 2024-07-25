Return-Path: <linux-arm-msm+bounces-27002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B03D93BACA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 04:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D7191C208DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 02:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A35210A2A;
	Thu, 25 Jul 2024 02:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="WDo/GexU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4278D1103;
	Thu, 25 Jul 2024 02:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721874612; cv=none; b=px8MmZwdnbhO6vVGDm8we9r02OYm2XCNqS8KM0sa8oc7wN7iLkGjXavpul+9z1P5yz1geNZHhioqkoch3APD+Znx/rk037gBLUY78dhhAT27yvnxBX+7sYbQSaMuBfhDYqTXGDXy/ZPQsYA5AHXyxfNXEcpkg05wm7ibbOqofLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721874612; c=relaxed/simple;
	bh=O8i0WABP/D8cbuRHqibvo0rdzlokK3I0Rgkff/3Fuvg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D4Nq08W7BL8cJn6M7DTYjqZcM2u1wvutJ24m0EAcNtrcattx32LhWqkMgOchWa7d/UmCtQyxOPCU6JMhGeBbKoeQGFzNTzOeaNjXtY+Uk+m47jzBYF8/Fv1RZzPW07HuISMo8lENNQLDDK18vYnyCTQYeG0iyoxXOTVCbE2FQr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=WDo/GexU; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=3cnS2
	zlLOTWI1JLQwADS5Z3r5WjUUDAQ8Ha0lgb8yy0=; b=WDo/GexUD3o/e69sI+eAs
	+2B/woylbLAa23eX0Pu4Bfh7bHQ/wBRBOrNa5nzsv5Ara//4yEE8kVPN3fBBsJ2z
	gX/hk6pmOnVaRRgRx3aWK0Hgsd/4hjJWi8pwhrpEbQVidQit8K8YBBB/V+hpduGX
	ASCPMgNv7fMcqOPNF53MQU=
Received: from localhost.localdomain (unknown [112.97.48.72])
	by gzga-smtp-mta-g3-1 (Coremail) with SMTP id _____wD338WiuKFmBdc3Aw--.17134S2;
	Thu, 25 Jul 2024 10:29:55 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: manivannan.sadhasivam@linaro.org
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH v2 1/2] bus: mhi: host: pci_generic: Update the file path for Foxconn SDX55/SDX72
Date: Thu, 25 Jul 2024 10:29:40 +0800
Message-Id: <20240725022941.65948-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD338WiuKFmBdc3Aw--.17134S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXr48ZrWUGr1kWw48Jw4ruFg_yoW5Xw1rp3
	Zavr1UJw4ktrWrKFs7Cw1DCwn3Krs0kry8KasxG342yr15Z3yqqFsrGr12gr1Yvr93Gr1I
	yF98WFWDCFWDtF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi0tCrUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiJQUnZGVOCZhPhgAAsQ

To separate the images of Foxconn from other vendors, adding a
new foxconn subfolder under qcom/<platform> for edl image path.
And delete the fw patch since it's useless for Foxconn devices.

Fixes: bf30a75e6e00 ("bus: mhi: host: Add support for Foxconn SDX72 modems")
Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
v2: change the folder path architecture
---
 drivers/bus/mhi/host/pci_generic.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 14a11880bcea..f159a9dd53e7 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -433,8 +433,7 @@ static const struct mhi_controller_config modem_foxconn_sdx72_config = {
 
 static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
 	.name = "foxconn-sdx55",
-	.fw = "qcom/sdx55m/sbl1.mbn",
-	.edl = "qcom/sdx55m/edl.mbn",
+	.edl = "qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn",
 	.config = &modem_foxconn_sdx55_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
@@ -444,8 +443,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
 
 static const struct mhi_pci_dev_info mhi_foxconn_t99w175_info = {
 	.name = "foxconn-t99w175",
-	.fw = "qcom/sdx55m/sbl1.mbn",
-	.edl = "qcom/sdx55m/edl.mbn",
+	.edl = "qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn",
 	.config = &modem_foxconn_sdx55_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
@@ -455,8 +453,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w175_info = {
 
 static const struct mhi_pci_dev_info mhi_foxconn_dw5930e_info = {
 	.name = "foxconn-dw5930e",
-	.fw = "qcom/sdx55m/sbl1.mbn",
-	.edl = "qcom/sdx55m/edl.mbn",
+	.edl = "qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn",
 	.config = &modem_foxconn_sdx55_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
@@ -502,7 +499,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_dw5932e_info = {
 
 static const struct mhi_pci_dev_info mhi_foxconn_t99w515_info = {
 	.name = "foxconn-t99w515",
-	.edl = "fox/sdx72m/edl.mbn",
+	.edl = "qcom/sdx72m/foxconn/edl.mbn",
 	.edl_trigger = true,
 	.config = &modem_foxconn_sdx72_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
@@ -513,7 +510,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w515_info = {
 
 static const struct mhi_pci_dev_info mhi_foxconn_dw5934e_info = {
 	.name = "foxconn-dw5934e",
-	.edl = "fox/sdx72m/edl.mbn",
+	.edl = "qcom/sdx72m/foxconn/edl.mbn",
 	.edl_trigger = true,
 	.config = &modem_foxconn_sdx72_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
-- 
2.25.1


