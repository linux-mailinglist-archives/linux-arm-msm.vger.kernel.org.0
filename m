Return-Path: <linux-arm-msm+bounces-24569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C96B91B891
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 09:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 081BD1F22503
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 07:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6851422C7;
	Fri, 28 Jun 2024 07:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="kQam4WnW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB3E81420DF;
	Fri, 28 Jun 2024 07:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.50.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719560238; cv=none; b=tQkqUxYa5csgmnhGUxA/yy1b+mdVAofgYcmGb7stKoA/ehiGDg1kxzMTz3C0L/vFrhVwmft+erCwNPszzqsALBNrQacabQlYziJmCTXzHlPC2dMGbIqnuObobueI2ITe97efPBGlPCADGeNxq/p6RWS/VlE6pHS7I/GzRSGTXFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719560238; c=relaxed/simple;
	bh=M5uXdjRtlvtzH6mdxQAz6HkPBOUMp1T9Lc8HTXB/nW4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NDKHBGEsS3DtVtYNUmR9rhUsOOhGE7kEXQgGyy34nQhH1DKB4GLyxHpnVwQFz9rHM/zFc2sXLkmAnqM5g6fKqXfjaz/jrtR/jH6AuOAuyoAnNHVWxdaaR7NG+G6PXpLo4lCRJYFnURBVpSfbw6/ntrgqySIYI0RqKEGwZ3hm/vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=kQam4WnW; arc=none smtp.client-ip=45.254.50.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=YWxaJ
	rajJaFRSG0iQHRmjSZbVIZSCWAFGQbHbwsY/O4=; b=kQam4WnWqWj6nf6q0JfBr
	IHUO/26FQSlIaPkmWw/EOVsEFj8gFFEHgY6pLZq9LVhB+p7kxmWVWUA3C6ng3s9U
	y0l1nD8XqMcDIM2dJJIzt6mjoPXpXeeTFG7mfl+UrWSMV+aOj/4RVlHWyAIAUXp9
	IPfpgjw1+xEgaIDVRRLIHI=
Received: from localhost.localdomain (unknown [112.97.61.84])
	by gzga-smtp-mta-g0-0 (Coremail) with SMTP id _____wD3v2z8Z35mQ+hEAw--.4754S2;
	Fri, 28 Jun 2024 15:36:29 +0800 (CST)
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
Subject: [PATCH v3 2/3] bus: mhi: host: Add name for mhi_controller
Date: Fri, 28 Jun 2024 15:36:26 +0800
Message-Id: <20240628073626.1447288-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v2z8Z35mQ+hEAw--.4754S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrWfJr1DAr1DWFWrXr4fXwb_yoW8Aw1fpF
	sYgrW3Ar1fWrWjkryqk34kZry5Xw4DGFy2kr47W342yr9xt34qvFWqga4FqasF9rWqyF13
	tF1rZayUWw1DZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pig4S5UUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiRwEMZGV4KAvBUQAAsA

 For SDX72 MBIM mode, it starts data mux id from 112 instead of 0.
 This would lead to device can't ping outside successfully.
 Also MBIM side would report "bad packet session (112)".
 In oder to fix this issue, we decide to use the modem name
to do a match in client driver side. Then client driver could
set a corresponding mux_id value for this modem product.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
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
index b573f15762f8..86aa4f52842c 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -361,6 +361,7 @@ struct mhi_controller_config {
  * @wake_set: Device wakeup set flag
  * @irq_flags: irq flags passed to request_irq (optional)
  * @mru: the default MRU for the MHI device
+ * @name: name of the modem
  *
  * Fields marked as (required) need to be populated by the controller driver
  * before calling mhi_register_controller(). For the fields marked as (optional)
@@ -445,6 +446,7 @@ struct mhi_controller {
 	bool wake_set;
 	unsigned long irq_flags;
 	u32 mru;
+	const char *name;
 };
 
 /**
-- 
2.25.1


