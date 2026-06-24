Return-Path: <linux-arm-msm+bounces-114353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rdstNsPdO2qweQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 15:38:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 348CD6BEB00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 15:38:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114353-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114353-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81EC9303A26E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 13:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7612D061D;
	Wed, 24 Jun 2026 13:36:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DFA3B7B72;
	Wed, 24 Jun 2026 13:36:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782308214; cv=none; b=ZHI/m9gS+H3UjRxSJOC9nWbq0AsCsj2s/dnbDovK2ig6znPAfJYWOPO9+gOGwv3MX6FFrKRDTMDKUN+xnBpX99RcD/ZKWL+q6YkvcB4Q2TMg6W3k9M3KQecTBlP2asIZEIOQaWtFhSDwuwQoBe7zVw3iEfDdl3PRI5fuaek2CDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782308214; c=relaxed/simple;
	bh=Hi4iGHbMBrFCzXj12hjAJngZ/JyoSo5JWtA0IM1C4Oo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rADnTKmPYMuoFuP58B1YQnnXYtq3Wc1avY7jTk2+f2zbcoUsH65KArFCDhzHUya0+6wwQFEzQQMLevBPsXkVGAXn13MHVbRSMxHezpERY/olwH9QR5fhSBi1JUJ1r8AhfMgPRyCjRdHOnZlUJQTVjWlYCM6wKUQ6Kd512Sp+lg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Received: from localhost.localdomain (unknown [117.182.75.66])
	by APP-03 (Coremail) with SMTP id rQCowAC3k5ps3TtqCEe2FQ--.898S2;
	Wed, 24 Jun 2026 21:36:45 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH v3] PCI: qcom-ep: Fix runtime PM reference leak in probe error paths
Date: Wed, 24 Jun 2026 21:36:43 +0800
Message-Id: <20260624133643.42323-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAC3k5ps3TtqCEe2FQ--.898S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCF47WF4xuw17Jw4xZF13urg_yoW5trW8p3
	yxXFZ5tFW8XF4xt3y2yw1UXF1FgrZayry8G3yqg3WIv3WfZ34jqryrtFyFqFn5KrWkWa4U
	Jw4jqa17ZF45tFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VU13ku3UUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAcIA2o73MgDUwAAsV
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114353-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:vulab@iscas.ac.cn,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[vulab@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vulab@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,iscas.ac.cn:email,iscas.ac.cn:mid,iscas.ac.cn:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 348CD6BEB00

The qcom_pcie_ep_probe() function obtains a runtime PM reference via
pm_runtime_get_noresume() at the beginning of the probe, but this
reference is only released on the successful completion path using
pm_runtime_put_sync().

However, the error paths fail to release this reference. The devres
cleanup registered by devm_pm_runtime_enable() only calls
pm_runtime_disable() and does not decrement the usage_count. As a
result, if any error occurs during probe (e.g., resource acquisition
failure or endpoint initialization failure), the reference is leaked,
permanently elevating the device's usage_count. This prevents proper
runtime suspend and clean device removal.

Fix this by properly distinguishing error paths that occur before and
after devm_pm_runtime_enable() succeeds:

- For errors before devm_pm_runtime_enable() succeeds: call
  pm_runtime_put_noidle() and pm_runtime_disable() manually to clean
  up the initial reference and disable runtime PM.

- For errors after devm_pm_runtime_enable() succeeds: only call
  pm_runtime_put_sync() to drop the initial reference. The
  pm_runtime_disable() is left to the devres cleanup handler,
  avoiding a double-disable.

- On the successful probe path: call pm_runtime_put_sync() to drop
  the initial reference. The return value of pm_runtime_put_sync()
  is ignored because errors like -EAGAIN or -EBUSY only indicate
  that the device cannot be suspended at this moment and do not
  represent a fatal probe failure.

This ensures the runtime PM reference is correctly released on all
error paths without introducing double-disables or double-puts.

Cc: stable@vger.kernel.org
Fixes: 5b026a9e714d ("PCI: qcom-ep: Add support for firmware-managed PCIe Endpoint")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 257c2bcb5f76..ff31f14b92a3 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -892,16 +892,16 @@ static int qcom_pcie_ep_probe(struct platform_device *pdev)
 	pm_runtime_set_active(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
-		return ret;
+		goto err_manual_cleanup;
 
 	ret = qcom_pcie_ep_get_resources(pdev, pcie_ep);
 	if (ret)
-		return ret;
+		goto err_put_ref;
 
 	ret = dw_pcie_ep_init(&pcie_ep->pci.ep);
 	if (ret) {
 		dev_err(dev, "Failed to initialize endpoint: %d\n", ret);
-		return ret;
+		goto err_put_ref;
 	}
 
 	ret = qcom_pcie_ep_enable_irq_resources(pdev, pcie_ep);
@@ -915,10 +915,8 @@ static int qcom_pcie_ep_probe(struct platform_device *pdev)
 	}
 
 	ret = pm_runtime_put_sync(dev);
-	if (ret < 0) {
+	if (ret < 0)
 		dev_err(dev, "Failed to suspend device: %d\n", ret);
-		goto err_disable_irqs;
-	}
 
 	pcie_ep->debugfs = debugfs_create_dir(name, NULL);
 	qcom_pcie_ep_init_debugfs(pcie_ep);
@@ -932,6 +930,13 @@ static int qcom_pcie_ep_probe(struct platform_device *pdev)
 err_ep_deinit:
 	dw_pcie_ep_deinit(&pcie_ep->pci.ep);
 
+err_put_ref:
+	pm_runtime_put_sync(dev);
+	return ret;
+
+err_manual_cleanup:
+	pm_runtime_put_noidle(dev);
+	pm_runtime_disable(dev);
 	return ret;
 }
 
-- 
2.39.5 (Apple Git-154)


