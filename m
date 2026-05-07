Return-Path: <linux-arm-msm+bounces-106434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iP6YMHig/GksSAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:23:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D534EA15A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B142C3002B5A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC2E73FCB35;
	Thu,  7 May 2026 14:19:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28A42DF136;
	Thu,  7 May 2026 14:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163569; cv=none; b=YPRcJM/oQ1mS4r5yXm4WEor8lFX9/Al7jcYBbGeNb/5rClRa2gTyLbLzMVDZUnIAxKn0JWvE4x0MlF43jC9B4gS6lUSdYLsW9cf6bZPhRvDpPMI+LmlXSlz0RpBMQNFa6sSltoVkUrYMqoaP6Xx8uWJGsVA3TG0ySKMpYNJR/Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163569; c=relaxed/simple;
	bh=Tph5f9/v1xSnzr9BklEAJxX/syAAOqhqaQ33HcBHCUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=U+zgBfC7XzFP7OH83s3DUetZixde2n9UJEDJxPtUzd+kHHBg0Z39LmqNPpAz+a1Bt8MYapVrqnktGQ3oqdhXVhFKY1edblMCTyW6O4uVifCLP6uC0mDDnqWXvwbmNfbjx2gkscO9+NKCkind7h4eGoG5xL8l4ZcW0ks1ka0WaSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpsz2t1778163514tb43c222c
X-QQ-Originating-IP: 1sKs3UfqVeO5nm/Na9x2m9MbDphK0h3wGe9yUC8UiZQ=
Received: from [192.168.30.32] ( [116.234.74.217])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 May 2026 22:18:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8446522380017217308
EX-QQ-RecipientCnt: 10
From: Xilin Wu <sophon@radxa.com>
Date: Thu, 07 May 2026 22:18:31 +0800
Subject: [PATCH] PCI: qcom: Restrict PERST# parsing to PCI bridge nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-fix-qcom-pcie-parse-perst-v1-1-79bdcce38eeb@radxa.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0QqDMAxFf0XyvEAtVIu/MvZQu+gyUGuiYyD++
 7Lt5cKBe84BSsKk0FUHCL1YeZkN6ksF+ZHmkZDvxuCdb1xwLQ78xjUvE5bMhCWJ2pLohilGP4T
 oUhMimF+E7PxrX29/1r1/Ut6+QTjPD0V9YQZ9AAAA
X-Change-ID: 20260507-fix-qcom-pcie-parse-perst-a882f580a658
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2471; i=sophon@radxa.com;
 h=from:subject:message-id; bh=Tph5f9/v1xSnzr9BklEAJxX/syAAOqhqaQ33HcBHCUY=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJl/5ls0CGmdULa+UG5pX3ywYHrr1j02a1+Gq/Q0VB8vl
 vXju+vdUcrCIMbFICumyKIQzzCXvTL32lOxUj2YOaxMIEMYuDgFYCK8cowMO4zu1f/T3/Eu0sXF
 O89xn9qGxQfq6njXvvi0+P67NsbKCwx/5Xufp3A8uFHOOO34O8s0XgZdp66Vib8WqM3JulHHVlD
 ACgA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Nj+lDvaLCxoMOKds4NpPuX6blPQsbPCMpW8kJbbiOvZTDvhSseSpfo/E
	VXFGp1q2bJ/JbpFLq7COna7dIhDFOzff3XQfAPct+s4S8N91UjC77uwCZJZboAuWyjC9ZFU
	6fRHPG8+GKrKVFQ+FSK6hk18PQuCuudj7svjstcrvPj7wytGbcFUtg/qJit/mvWG6A1S3+r
	tFyhSwkBuFbv0jItWoU/mLVTj4Nbfuxc9EhuWLc1ZIAQ68OLl67+O/QwTwolhUxNgp/lSOW
	XiqfTGoihZ+zdpsKcF6t6XU8pJQt4oit/yOTtGw3aWOs5Ks4JRZ10llBpQEFGdPkfimiwkq
	s9li3Udf4VjiAQTVGFgmxH0q9yoeaAxmsjIU3SGRo4AFTmsPDFY41oGMutNqkDoLgwxvJ8Q
	yLlWBR7y0cMbcxCmySNr+7LqQmYs5NBLNuYpTKSitl/HCtgXb2qjPdNbGQXAfzyaB0QlH8Q
	BdPOfFU8w1FxesPq4hUBevR2At6JFo+x0Lx21KGskrS9oTSGzQUklhujI2hU1E9K64kJxzP
	2XKRpNcCZjAQGz4/nAKnO2BJsicI3Q6q+Xlngy51CXifbrIYQ9iK6FcNf0yBZfBDi0Y9O6Y
	ZfbSzZkO09GYZ7zdlwv8uQK6JL0fahrHDcQdpKv19XIhA570enWqNcrMk/WXOtvgn0f7azw
	Rrd5vWp97AW3guZ0zrop3VnxoosbkuC68RMA+Mu1XEEwG6MBpGFvzLUXc64seYnKw2sot6D
	2/G1xsFkxTUqzmMF+OHTDxQKO4BubiMUq1ybnNS09H6If9Fz8x1OE0Jq5qzVVvRJQVDAq+v
	xsc8ax03Fi+3vFqfH32ZVi2iirCR6kMidCdqAaBemNiVTyHZlhi1KYlEyFHsFrsX0w88eRO
	Z19RG572lDxGKjNVA/MC1FfW4t3kZZN44pbiwXs6f9YnZFLfS9PA0deJP/KfTW7LsUzi/U/
	ANXED9zREIgMQ6m/uhi9agNcC7v7gpIRlQgeIArFbDb2R9H9ZSfEfqkO+Fze4aahEhEeqNK
	RTdMr6vAXZKCFGBb3FCYeaWSk/X0+QerAyKonLtVrH0486WpHHxYgIc1CuftA=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 44D534EA15A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,radxa.com:email,radxa.com:mid];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-106434-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Action: no action

Commit 2fd60a2edb83 ("PCI: qcom: Parse PERST# from all PCIe bridge
nodes") extended PERST# parsing below the Root Port, so that downstream
PCIe switch bridge nodes can describe their own PERST# GPIOs.

However, the implementation recurses into every available child node.  A
PCI hierarchy may contain non-bridge child nodes with unrelated
"reset-gpios" properties, such as an Ethernet PHY below an MDIO bus.  If
such a reset GPIO is provided by a PCI endpoint GPIO controller, the
endpoint has not been enumerated while the host bridge is still probing.
Trying to acquire that GPIO then returns -EPROBE_DEFER and the Root Port
probe is deferred indefinitely.

Only recurse into child nodes that are PCI bridge/bus nodes.  Keep parsing
the Root Port passed by qcom_pcie_parse_port(), but filter descendants to
nodes with device_type = "pci" and either a bus-range property or an
explicit PCI bridge class compatible.

Fixes: 2fd60a2edb83 ("PCI: qcom: Parse PERST# from all PCIe bridge nodes")
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index af6bf5cce65b..5e0c31cc32a0 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1693,7 +1693,16 @@ static const struct pci_ecam_ops pci_qcom_ecam_ops = {
 	}
 };
 
-/* Parse PERST# from all nodes in depth first manner starting from @np */
+static bool qcom_pcie_is_bridge_node(struct device_node *np)
+{
+	if (!of_node_is_type(np, "pci"))
+		return false;
+
+	return of_property_present(np, "bus-range") ||
+	       of_device_is_compatible(np, "pciclass,0604");
+}
+
+/* Parse PERST# from all PCIe bridge nodes starting from @np */
 static int qcom_pcie_parse_perst(struct qcom_pcie *pcie,
 				 struct qcom_pcie_port *port,
 				 struct device_node *np)
@@ -1731,6 +1740,9 @@ static int qcom_pcie_parse_perst(struct qcom_pcie *pcie,
 
 parse_child_node:
 	for_each_available_child_of_node_scoped(np, child) {
+		if (!qcom_pcie_is_bridge_node(child))
+			continue;
+
 		ret = qcom_pcie_parse_perst(pcie, port, child);
 		if (ret)
 			return ret;

---
base-commit: 735d2f48cadaa9a87e7c7601667878de70c771c5
change-id: 20260507-fix-qcom-pcie-parse-perst-a882f580a658

Best regards,
--  
Xilin Wu <sophon@radxa.com>


