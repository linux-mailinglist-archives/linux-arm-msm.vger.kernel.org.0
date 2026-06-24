Return-Path: <linux-arm-msm+bounces-114351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MjNBH9TbO2o7eQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 15:29:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 156AD6BE9EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 15:29:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114351-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114351-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 865B33000B30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 13:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68E8D3AFD10;
	Wed, 24 Jun 2026 13:29:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D3024676D;
	Wed, 24 Jun 2026 13:29:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782307792; cv=none; b=IBy13PcD2A/38zsbLF8dMaOEHGbK7xnRtnQFHn6jqNmFara9ey+hhSZeWsI41HFETWvkmnoeDnx9tWcZfTDteyfUiRMZfNsJpV7bQVuBNGKp1EesMOXUiMQSzkVmO+g5j068D+kE+uFqHjZ3pnuo6dZtYa/BDwhwEYTHL1B/QgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782307792; c=relaxed/simple;
	bh=zZm4Xgd6iOm/DKfGrXNLdfXUOCkrewA90M9ZYr4yLmU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nKNoKlcdLjLz5xvZx3uCHCxMnFKuyWr1PqU6hofFcHgV9KrPEyMna2ft8gr37mB+2jZvZqgetAvB4+tX3Der74oJo08TstfbrSfUAn1NUt2t+VimbjduPoLZy8zugtoG8JorMF6M4T1zrARNFIWexwTd4Ifes4za2rAlwvldDlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Received: from localhost.localdomain (unknown [117.182.75.66])
	by APP-03 (Coremail) with SMTP id rQCowACHqN_J2ztqrSO2FQ--.26284S2;
	Wed, 24 Jun 2026 21:29:47 +0800 (CST)
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
Subject: [PATCH v2] PCI: qcom-ep: Fix runtime PM reference leak in probe error paths
Date: Wed, 24 Jun 2026 21:29:43 +0800
Message-Id: <20260624132943.40718-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACHqN_J2ztqrSO2FQ--.26284S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCF47WF4xuw17Jw4xZF13urg_yoW5CF45p3
	yfXFZ5tFy8XF4xtw42y3W7ZF1Y9rZayryrG34DW3WIv3WfZ34jqryrtFyFqF1rtrWkua4U
	tw4jqa17ZF45tFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCQ4IA2o7lVz41AAAs4
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114351-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:vulab@iscas.ac.cn,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[vulab@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,iscas.ac.cn:email,iscas.ac.cn:mid,iscas.ac.cn:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 156AD6BE9EC

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
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 257c2bcb5f76..0c6799d57dd4 100644
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
@@ -932,6 +932,13 @@ static int qcom_pcie_ep_probe(struct platform_device *pdev)
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


