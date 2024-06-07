Return-Path: <linux-arm-msm+bounces-22035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D9C900030
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 12:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8979C28B291
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 10:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4266F099;
	Fri,  7 Jun 2024 10:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cfz2DRhW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8728157E76;
	Fri,  7 Jun 2024 10:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.50.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717754526; cv=none; b=DuRz1jdYIlf/bFY0H2HQfWbHosNzcO+Ree7suhtieyUf7qy8eCYDgjeLngUAs8IrdIkvjX2+nx3Gb+7zRRez5AKdLG4NLSAQ+NmXPmKZHJe+O3X6X3T+qYM+mDg1ptSGKXIniIDJ42qI4oRtI7Jp1eEOyamS/zSmou8yXKjZPgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717754526; c=relaxed/simple;
	bh=wU2n7IwNd0h3CCqPBmH/JBwMsHgLc12EWBJeBCs5wBE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U3F3m4RN/pmIOmr7w7ugC2DenhqbS5XA+1yppvxVZ5fYu7nN5pvFxhvkHSlgHD8OiXxBfxpmcR0MPac0Eim3e42w0vG8wDcB0ZXujRyqBg3P5YZPd0/VLCQPg+7hMSy0qtdivAzhepfM9Fe1E2rzMqwrdZZE3t/u1Fp0kUWe+FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cfz2DRhW; arc=none smtp.client-ip=45.254.50.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=i5GTs
	cTNxm+xnUD3yUpAAKyOF+alMJZ6PiwpYI9Q2Qs=; b=cfz2DRhW4zJaIp/27V45m
	KswReqHEzj6LECAePJNDIkn6PXL1F3CM8OyRNuDoOTgti2XqZKN0UQjRKi8kGiGo
	SdOMnNsqoZxg6cPm6VHRoDPjqh+VNxFYDndxIwgHtF7IAjcNp14nGg8CRKNwCxDi
	ApwCovcEXcZIgQZgMyDhAc=
Received: from localhost.localdomain (unknown [112.97.63.251])
	by gzga-smtp-mta-g0-0 (Coremail) with SMTP id _____wD3P6Bs2mJmeajOHQ--.6796S2;
	Fri, 07 Jun 2024 18:01:17 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: manivannan.sadhasivam@linaro.org,
	loic.poulain@linaro.org,
	quic_qianyu@quicinc.com
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH v1 1/2] bus: mhi: host: Import link_id item
Date: Fri,  7 Jun 2024 18:01:14 +0800
Message-Id: <20240607100114.452979-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3P6Bs2mJmeajOHQ--.6796S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrWfJr1DAr1DAry3tw4fKrg_yoW8AFWxpa
	9Y93y3Cr4fXrWjyr1kC3s7XF15WanrX347KrW7Kw1jy3s0ya4qvFWjga4xtF1ak39IvF4a
	yF1ru3yUWF1qqaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRsF4ZUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiRw72ZGV4JqajbwAAsK

For SDX72 MBIM mode, it starts data mux id from 112 instead of 0.
This would lead to device can't ping outside successfully.
Also MBIM side would report "bad packet session (112)".
So we add a link id default value for SDX72.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/bus/mhi/host/pci_generic.c | 3 +++
 include/linux/mhi.h                | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 0b483c7c76a1..1f9de2730766 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -53,6 +53,7 @@ struct mhi_pci_dev_info {
 	unsigned int dma_data_width;
 	unsigned int mru_default;
 	bool sideband_wake;
+	unsigned int link_default;
 };
 
 #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
@@ -469,6 +470,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx72_info = {
 	.dma_data_width = 32,
 	.mru_default = 32768,
 	.sideband_wake = false,
+	.link_default = 112,
 };
 
 static const struct mhi_channel_config mhi_mv3x_channels[] = {
@@ -1035,6 +1037,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
 	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
 	mhi_cntrl->mru = info->mru_default;
+	mhi_cntrl->link_id = info->link_default;
 
 	if (info->edl_trigger)
 		mhi_cntrl->edl_trigger = mhi_pci_generic_edl_trigger;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index b573f15762f8..4da10b99c96e 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -445,6 +445,7 @@ struct mhi_controller {
 	bool wake_set;
 	unsigned long irq_flags;
 	u32 mru;
+	u32 link_id;
 };
 
 /**
-- 
2.25.1


