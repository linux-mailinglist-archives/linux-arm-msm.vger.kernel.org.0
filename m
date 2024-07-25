Return-Path: <linux-arm-msm+bounces-27003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F74093BACC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 04:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3E081F221A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 02:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0244511711;
	Thu, 25 Jul 2024 02:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="NSBXysnc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2C31BF47;
	Thu, 25 Jul 2024 02:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721874617; cv=none; b=KxVo/xXOt8id5A6P6a/nv2wTYDcN9oxQuYu0PjL190o3mHn5/cqrE+q560vzZ3swDRtRhusalsgcWhLFyKYK67SOuYHbsuSLdBM8J+15tokKAuW3ZA34goP1eDrYGOZMwsDpU0tY6xHMmUr9Jry1RcPClKUsvIJT75udUh9sZYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721874617; c=relaxed/simple;
	bh=xjdEduBF6+0VtsfyemNHLIEqjJ554ZKbPDNo9CR6xBY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JZIYqMbkg3fvr/kFFkmzrbgmAsvB8/6dFpiBi57Dd3JMBFoO+kUaJ9L70HANLCgUlzkD6drauX/5Fi/GCsUJmQWxbL4pr/eavyNYprY6w6WP7yawmzQl3F0+PAEaGD7FNHHzCE31RmeekrEeHPrX3x4jAarC/LjZ+Y+ufcp1APQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=NSBXysnc; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=bEiXP
	AwDC5NBiYUV+CrcPwSV4ioMuT57F66rliLnkaA=; b=NSBXysncjeEFMEmlZJy47
	qSixzPmwaZWjYpGUD4AaDA6FQEAefFnck+v0Z9UcD9i3kx6BhxRxAGCsuKntUbXi
	lQUkZ2rkb6xfQyvMNkHsKtlvBLN6W0VxtTlD4slmDDNOkGxKibiZz8nX8jcqadsq
	ZE/j9rB5dQReNUpkdY+VDc=
Received: from localhost.localdomain (unknown [112.97.48.72])
	by gzga-smtp-mta-g3-1 (Coremail) with SMTP id _____wD338WiuKFmBdc3Aw--.17134S3;
	Thu, 25 Jul 2024 10:29:57 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: manivannan.sadhasivam@linaro.org
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH v2 2/2] bus: mhi: host: pci_generic: Enable trigger_edl for Foxconn SDX55/SDX65/SDX24 products
Date: Thu, 25 Jul 2024 10:29:41 +0800
Message-Id: <20240725022941.65948-2-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240725022941.65948-1-slark_xiao@163.com>
References: <20240725022941.65948-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD338WiuKFmBdc3Aw--.17134S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxur15Xr4kJw1DXFyrWr1rZwb_yoW5ZF13pF
	na9r18J3yktFWfKr4kCr1kCwn8Crs8ury8KFnxGw12yr15A3yjqFsrGw129r15Z3s7Jr1I
	vF98WFZ8GFsrJF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pR0eHhUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiNQknZGV4Iy0gjgAAsC

Since generic trigger_edl mechanism has been imported, all
products support firehose download shall enable 'edl_trigger'.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/bus/mhi/host/pci_generic.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index f159a9dd53e7..565b280c539e 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -434,6 +434,7 @@ static const struct mhi_controller_config modem_foxconn_sdx72_config = {
 static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
 	.name = "foxconn-sdx55",
 	.edl = "qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn",
+	.edl_trigger = true,
 	.config = &modem_foxconn_sdx55_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
@@ -444,6 +445,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
 static const struct mhi_pci_dev_info mhi_foxconn_t99w175_info = {
 	.name = "foxconn-t99w175",
 	.edl = "qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn",
+	.edl_trigger = true,
 	.config = &modem_foxconn_sdx55_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
@@ -454,6 +456,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w175_info = {
 static const struct mhi_pci_dev_info mhi_foxconn_dw5930e_info = {
 	.name = "foxconn-dw5930e",
 	.edl = "qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn",
+	.edl_trigger = true,
 	.config = &modem_foxconn_sdx55_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
@@ -463,6 +466,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_dw5930e_info = {
 
 static const struct mhi_pci_dev_info mhi_foxconn_t99w368_info = {
 	.name = "foxconn-t99w368",
+	.edl = "qcom/sdx65m/foxconn/prog_firehose_lite.elf",
+	.edl_trigger = true,
 	.config = &modem_foxconn_sdx55_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
@@ -472,6 +477,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w368_info = {
 
 static const struct mhi_pci_dev_info mhi_foxconn_t99w373_info = {
 	.name = "foxconn-t99w373",
+	.edl = "qcom/sdx65m/foxconn/prog_firehose_lite.elf",
+	.edl_trigger = true,
 	.config = &modem_foxconn_sdx55_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
@@ -481,6 +488,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w373_info = {
 
 static const struct mhi_pci_dev_info mhi_foxconn_t99w510_info = {
 	.name = "foxconn-t99w510",
+	.edl = "qcom/sdx24m/foxconn/prog_firehose_sdx24.mbn,
+	.edl_trigger = true,
 	.config = &modem_foxconn_sdx55_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
@@ -490,6 +499,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w510_info = {
 
 static const struct mhi_pci_dev_info mhi_foxconn_dw5932e_info = {
 	.name = "foxconn-dw5932e",
+	.edl = "qcom/sdx65m/foxconn/prog_firehose_lite.elf",
+	.edl_trigger = true,
 	.config = &modem_foxconn_sdx55_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
-- 
2.25.1


