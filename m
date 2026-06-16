Return-Path: <linux-arm-msm+bounces-113437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AL6LNd5bMWoMiAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 16:21:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4405B6906A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 16:21:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113437-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113437-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAF4831B24B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D512336C580;
	Tue, 16 Jun 2026 14:10:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E35036A356;
	Tue, 16 Jun 2026 14:10:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781619004; cv=none; b=sKpX35BRod7j9rm8a7llGWsDOjXIp94+lml/4PVbapCQT3obRmehVVRJjGh2rafAgNFiJJhioTA0w4LQ+6OnxEhODcMnDRX9iBygo/TnHxNTm1orsx+IhHfnyWHzCTBdvdUG+28SfREr6phlcmdgrpkLuZqi52kp8tdv6vgPjDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781619004; c=relaxed/simple;
	bh=/OodjjavcRaZsEcvBHKrJCaDAxEMhV+ZP3saeAM2fMA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FhX5lSs38WwSocVJJ+QPX1twyZBzaRm2/0vRmYJjAWciSsFbTnbRKI6IFWndQUX23fRTG3iuwNrhZbj10no4fdJX3IptTbD3PBYip/7oCKiH3rA+w18vwEWB+j35ytbpYaxnRKIjNHuc6fX4nNRUPqLHxSfuW439MqX1xWJUqXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAA32NAxWTFq70_vAQ--.22518S2;
	Tue, 16 Jun 2026 22:09:53 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: mani@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	bhelgaas@google.com
Cc: robh@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] PCI: xilinx-xdma-pl: fix refcount leak in xilinx_pl_dma_pcie_init_irq_domain()
Date: Tue, 16 Jun 2026 14:09:49 +0000
Message-Id: <20260616140949.1686840-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAA32NAxWTFq70_vAQ--.22518S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWw45Cr48KF4UJw1DCF4UArb_yoW5Xr1DpF
	W8G3ya9rWUtr4IgrsFk3ZY9Fya9Fnakr92y3y2k3ZrZr13Jw4UWFy5WF909ry3GFW8XFy3
	AF47tF15uF17AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWxJr0_GcWlOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0Jjb4SrUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAUAA2oxFt-2pwAAsJ
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
	TAGGED_FROM(0.00)[bounces-113437-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:robh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vulab@iscas.ac.cn,m:stable@vger.kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,iscas.ac.cn:mid,iscas.ac.cn:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4405B6906A8

of_get_child_by_name() acquires a reference on the returned device node,
which must be released with of_node_put() after use. In
xilinx_pl_dma_pcie_init_irq_domain(), the reference is properly released
on the success path, but error paths that return directly fail to do so,
leading to a reference count leak.

Additionally, when the INTx domain creation or MSI initialization fails,
the already created PL DMA IRQ domain is not removed, causing another
memory leak.

Fix this by using goto-based error handling:
- Add a common 'out_put_node' label to release the node reference.
- Add 'out_remove_pldma' to delete the PL DMA domain before releasing
  the node.
- Ensure all error paths jump to the appropriate cleanup labels.

Cc: stable@vger.kernel.org
Fixes: 8d786149d78c ("PCI: xilinx-xdma: Add Xilinx XDMA Root Port driver")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/pci/controller/pcie-xilinx-dma-pl.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-xilinx-dma-pl.c b/drivers/pci/controller/pcie-xilinx-dma-pl.c
index b037c8f315e4..e7a83a758874 100644
--- a/drivers/pci/controller/pcie-xilinx-dma-pl.c
+++ b/drivers/pci/controller/pcie-xilinx-dma-pl.c
@@ -580,8 +580,10 @@ static int xilinx_pl_dma_pcie_init_irq_domain(struct pl_dma_pcie *port)
 
 	port->pldma_domain = irq_domain_create_linear(of_fwnode_handle(pcie_intc_node), 32,
 						      &event_domain_ops, port);
-	if (!port->pldma_domain)
-		return -ENOMEM;
+	if (!port->pldma_domain) {
+		ret = -ENOMEM;
+		goto out_put_node;
+	}
 
 	irq_domain_update_bus_token(port->pldma_domain, DOMAIN_BUS_NEXUS);
 
@@ -589,7 +591,8 @@ static int xilinx_pl_dma_pcie_init_irq_domain(struct pl_dma_pcie *port)
 						     &intx_domain_ops, port);
 	if (!port->intx_domain) {
 		dev_err(dev, "Failed to get a INTx IRQ domain\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto out_remove_pldma;
 	}
 
 	irq_domain_update_bus_token(port->intx_domain, DOMAIN_BUS_WIRED);
@@ -597,13 +600,20 @@ static int xilinx_pl_dma_pcie_init_irq_domain(struct pl_dma_pcie *port)
 	ret = xilinx_pl_dma_pcie_init_msi_irq_domain(port);
 	if (ret != 0) {
 		irq_domain_remove(port->intx_domain);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto out_remove_pldma;
 	}
 
 	of_node_put(pcie_intc_node);
 	raw_spin_lock_init(&port->lock);
 
 	return 0;
+
+out_remove_pldma:
+	irq_domain_remove(port->pldma_domain);
+out_put_node:
+	of_node_put(pcie_intc_node);
+	return ret;
 }
 
 static int xilinx_pl_dma_pcie_setup_irq(struct pl_dma_pcie *port)
-- 
2.34.1


