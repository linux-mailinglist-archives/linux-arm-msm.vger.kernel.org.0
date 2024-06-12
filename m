Return-Path: <linux-arm-msm+bounces-22395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B309904F68
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 11:39:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E48B1C212BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 09:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A8C16DEC2;
	Wed, 12 Jun 2024 09:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="YkgDkpNg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E72352576F;
	Wed, 12 Jun 2024 09:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.50.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718185173; cv=none; b=umE59L7TIfUr2p8MD9WV28izq+eoBFqKzONj+EKQbgHEtJok8McXKFWSkLf0N72n5WQisvYTeUblWiGYi9Zb+PGyQmQpZhRcPcr22QTRox0zG+TIPUF6ZDCChZVPAaP0zyTCNOIKUR49UlRUNrhuwO/eKnTncPtJatDgOuwfLXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718185173; c=relaxed/simple;
	bh=hq17MAkaqI/mS5UaroN1BkaNHRkBEIuYufisq/6rssk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uqVl4isjzWbvZVIq7UNf/C/4gxzawqKJrlVzt6hbzr26s6N52UKBlZUrm5R1xdBuPqFGuYM4QUEGdbSmex6cdk5tU7+MZCFqYuYdL3lHwqyJZzovJ/KbJF061bKJ4oDYdC6KWl4BEp6xo0mQ31K4VKfNhW9XUcioR+FQf32ZXUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=YkgDkpNg; arc=none smtp.client-ip=45.254.50.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=tAb1g
	4fB79567ItBIyDcRXSQsvQ9HpG5fbNWTaEarMY=; b=YkgDkpNgD+bYwyzX+c46Z
	bbHYLMbEFwRAvUtfovntc83lNRnRxrL1K8/xJzIWWD26/PMNvt8DMGO21sDD5olI
	HY6FkO6+4wgZocB81Uhr0NbG/XpJLKRahwoZjfMtuwUVk+KtGSj/qTzoFaurKWBF
	h8+ldOaGjhebLDIgknMKek=
Received: from localhost.localdomain (unknown [112.97.57.186])
	by gzga-smtp-mta-g0-2 (Coremail) with SMTP id _____wDX30WwbGlmH_qlAQ--.27950S2;
	Wed, 12 Jun 2024 17:38:57 +0800 (CST)
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
Subject: [PATCH v2 1/2] bus: mhi: host: Import mux_id item
Date: Wed, 12 Jun 2024 17:38:42 +0800
Message-Id: <20240612093842.359805-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDX30WwbGlmH_qlAQ--.27950S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrWfJr1DAr1DAF1kKw13CFg_yoW8tr4kpF
	sYgrW3Jr4fXrWjyryqk3s7ZF1rWw4DG347KrW7K342ywn8t34qvFWjga4ftF1akrZFkF42
	yFy5u3y5W3WDXFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRuc_3UUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiRxT7ZGV4JvHumQAAsx

For SDX72 MBIM mode, it starts data mux id from 112 instead of 0.
This would lead to device can't ping outside successfully.
Also MBIM side would report "bad packet session (112)".
So we add a default mux_id value for SDX72. And this value
would be transferred to wwan mbim side.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/bus/mhi/host/pci_generic.c | 3 +++
 include/linux/mhi.h                | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 0b483c7c76a1..9e9adf8320d2 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -53,6 +53,7 @@ struct mhi_pci_dev_info {
 	unsigned int dma_data_width;
 	unsigned int mru_default;
 	bool sideband_wake;
+	unsigned int mux_id;
 };
 
 #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
@@ -469,6 +470,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx72_info = {
 	.dma_data_width = 32,
 	.mru_default = 32768,
 	.sideband_wake = false,
+	.mux_id = 112,
 };
 
 static const struct mhi_channel_config mhi_mv3x_channels[] = {
@@ -1035,6 +1037,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
 	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
 	mhi_cntrl->mru = info->mru_default;
+	mhi_cntrl->link_id = info->mux_id;
 
 	if (info->edl_trigger)
 		mhi_cntrl->edl_trigger = mhi_pci_generic_edl_trigger;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index b573f15762f8..499c735fb1a3 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -361,6 +361,7 @@ struct mhi_controller_config {
  * @wake_set: Device wakeup set flag
  * @irq_flags: irq flags passed to request_irq (optional)
  * @mru: the default MRU for the MHI device
+ * @link_id: the default link
  *
  * Fields marked as (required) need to be populated by the controller driver
  * before calling mhi_register_controller(). For the fields marked as (optional)
@@ -445,6 +446,7 @@ struct mhi_controller {
 	bool wake_set;
 	unsigned long irq_flags;
 	u32 mru;
+	u32 link_id;
 };
 
 /**
-- 
2.25.1


