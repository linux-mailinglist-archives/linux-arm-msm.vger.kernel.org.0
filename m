Return-Path: <linux-arm-msm+bounces-24759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 512BC91D5F4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 04:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD4BDB20A57
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 02:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D03847B;
	Mon,  1 Jul 2024 02:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="UQ8NEH8n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8091366;
	Mon,  1 Jul 2024 02:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719799993; cv=none; b=O0+AT11pKNGXFSzczJqb9J5r2pnN2cBPOkZ2RAl1pOxD0YVKUniIGgELLDkJMuBrxdhq7t/JaD644XHS6inzDbdonJyp7Qxg8u/q6pFnZhhrmqjlWOY81/Rq0JBx8YUeb973QnkbYSjGxj8+MtTWZM/d1sgjTJ+Mlr7RRHy3HB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719799993; c=relaxed/simple;
	bh=3ASXS1O8xuC6hlbozKD1ZRDRpVxjFWQ09XQ80jRF37I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H4QfGDSTrldkKSkBezDjLx/XRIlfbh/zzMbV0AUTXwZ0UsaL5h7RsFR2sjM3vMI8UKgrWKZvslLTZSe+JJl8DgkNFypU120F6Fz1KOZgi68+ZDqq8/O7cr2uAQx4dwRdVsonS6Fifm5OM1gYJUuto2ZJYcIjZeocFxxb6xObsdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=UQ8NEH8n; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=/sEzh
	bCBpFcDyASmFXgsdTKSdpq7AsrYjND+Vb8eo00=; b=UQ8NEH8nEDP8Pl29P4ILg
	WU/HhmYLUQaTUF1E+hWI/deacnUViI+d1b/vVVZ1WqKQbW9AKYvfS1UFK6Qo3B3D
	BAJtBUC8tfeTik8EitCuxPAhIRL2uMtc5nH/qSfxrVnOY1JbwzCIHE3hDsz1njRw
	obtkJTJvnmU6HYLPTlmSio=
Received: from localhost.localdomain (unknown [223.104.68.114])
	by gzga-smtp-mta-g3-3 (Coremail) with SMTP id _____wD3v0uFEIJm1iKSBA--.55558S3;
	Mon, 01 Jul 2024 10:12:24 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: manivannan.sadhasivam@linaro.org,
	loic.poulain@linaro.org,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	quic_jhugo@quicinc.com
Cc: netdev@vger.kernel.org,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH v4 2/3] bus: mhi: host: Add name for mhi_controller
Date: Mon,  1 Jul 2024 10:12:15 +0800
Message-Id: <20240701021216.17734-2-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240701021216.17734-1-slark_xiao@163.com>
References: <20240701021216.17734-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v0uFEIJm1iKSBA--.55558S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrWfJr1DAr1DAF17Jr1DKFg_yoW8ZrW5pa
	1v9rW3Ar4fKrW5Kr1qk3s7ZF15Xw4DW342kwsrWw15K3sIg34qqFyvgFyrGF9I9rZakF12
	yF4Fvry8W3WqvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zMVbyUUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiRwsPZGV4KDQsAAAAsK

For SDX72 MBIM mode, it starts data mux id from 112 instead of 0.
This would lead to device can't ping outside successfully.
Also MBIM side would report "bad packet session (112)".In order to
fix this issue, we decide to use the device name of MHI controller
to do a match in client driver side. Then client driver could set
a corresponding mux_id value for this MHI product.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
v2: Remove Fix flag
v3: Use name match solution instead of use mux_id
v4: Update the description of new member 'name' and move it to
right position
---
 drivers/bus/mhi/host/pci_generic.c | 1 +
 include/linux/mhi.h                | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 1fb1c2f2fe12..14a11880bcea 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1086,6 +1086,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
 	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
 	mhi_cntrl->mru = info->mru_default;
+	mhi_cntrl->name = info->name;
 
 	if (info->edl_trigger)
 		mhi_cntrl->edl_trigger = mhi_pci_generic_edl_trigger;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index b573f15762f8..d45058d3dbed 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -289,6 +289,7 @@ struct mhi_controller_config {
 };
 
 /**
+ * @name: device name of the MHI controller
  * struct mhi_controller - Master MHI controller structure
  * @cntrl_dev: Pointer to the struct device of physical bus acting as the MHI
  *            controller (required)
@@ -367,6 +368,7 @@ struct mhi_controller_config {
  * they can be populated depending on the usecase.
  */
 struct mhi_controller {
+	const char *name;
 	struct device *cntrl_dev;
 	struct mhi_device *mhi_dev;
 	struct dentry *debugfs_dentry;
-- 
2.25.1


