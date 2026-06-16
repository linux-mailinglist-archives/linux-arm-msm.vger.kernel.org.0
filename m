Return-Path: <linux-arm-msm+bounces-113452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iDiaN655MWo6kQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 18:28:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A3D6921CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 18:28:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=tQIjWPWJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113452-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113452-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA1DF318B456
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 16:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8478246AF02;
	Tue, 16 Jun 2026 16:15:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8F846AEEA;
	Tue, 16 Jun 2026 16:15:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781626527; cv=none; b=HkiZ9K4bGDGF3j/svGAaegseUXhPMuOIuT/fqBUkWYSuKO0NA2VGMyVTsiD4a/44xgZDDsI1Y8p99/RQgcenuD54XG/7tQKY6eDLjMTDG354P1kfZSMFj31WpdUxTxaqq6inVcuO6Y0sVUnYtluPPxtbZFpSHCcCES8THkm1sQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781626527; c=relaxed/simple;
	bh=U57JNrDB7ODII7hspI+3+YIU9zfHODcQz050DPxq3P8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=o1V3NxEal6765KKIh7+2UvpAtuTT89WQlMuxps2KYfY/pnGtxkoAMxQdu/qnEr04oqTvNuRV5j1xbKHypwHe6ITRGQY3vBYq330PldKOa3YYeE/k8osO33KgjS/WG5b/D5G8/34mVObUDy9wHsmcwAmIhOZtCFCKlgoZMJFQGTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tQIjWPWJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 163F5C2BCB8;
	Tue, 16 Jun 2026 16:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781626527;
	bh=U57JNrDB7ODII7hspI+3+YIU9zfHODcQz050DPxq3P8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=tQIjWPWJZak3ZY5xY25UE3mqmr6KEi48GOd46LL5838GcFpTtirzOv662/74QGUR0
	 lY2svz1vAk1/HDsZE6jpkE+3eCeGj+ZDgCcUPkBXY+Wj5T71E7Y1NeDM47egVRjgrg
	 9c6NuhvR8GX9fLNIrkkrrivTQNuCKUqMdjTCiH+wu8+TVtKoWjU7p+UWM39Y/8qdBt
	 0IZC+MsCOz7K3q9jXA0rchMNQvFPwcHMkWZMTSL803PCNvs337UivNtGqnXJT0z8Bg
	 j07tDXxSFhKEQwARAbDhofeI9aUCZfkfYkMFE5GmdDZxAEPIKQYbCifT592Mgq7/T5
	 bcu3p0iY9OeIw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA02CD98E1;
	Tue, 16 Jun 2026 16:15:26 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Tue, 16 Jun 2026 21:45:19 +0530
Subject: [PATCH] PCI: qcom: Skip PERST# GPIOs provided by downstream PCIe
 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-pci-qcom-perst-fix-v1-1-27600d6ae357@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJZ2MWoC/yXMQQrCMBCF4auUWTuQFJugVxEXcTrqCLYxE6UQc
 vemdvk9eH8B5SSscO4KJP6Jyjw12EMH9AzTg1HGZuhN74yzDiMJfmh+Y+SkGe+yoDFH60MYfDg
 5aMeYuM3/6OW6W7+3F1PeSlDrCuwFEj12AAAA
X-Change-ID: 20260616-pci-qcom-perst-fix-00417aa57a96
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3083;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=SAG1WtlnXkQauMnV0DcExAZh86wK4HSUyapFJVHHEa4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqMXad1EQZDA1Q+azZIoD14TsRxfPwzlzqAWMsJ
 QDCPpo1y7SJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCajF2nQAKCRBVnxHm/pHO
 9QKTB/41ovfWXcOGtCXxtK/RPBXxzZmvHF6TmIDcmgrzyztBsljFajLXdEIeX3zu1g0UDKKO1Ny
 OzV0XFUkUxz6NQi00U5EdUkFJRS4oFThbdxWjyz8vM+z95pKaoDru1lwQ2ZGJCutfTq+e834Aj3
 h1MeUBAeL/g/p5xknPldWjUI4SM3UXJgNe6NZEm5+UR0AJw7uGeMyKmqVwhfF0Efg0MSruYjkCU
 gUo6sudOQ5POYaTJ5kW9pM80FDjgcsdfl/vNk0ajYSsYxsBuuiVK3BQpEdN+TO+8nm6rL3j7q2I
 0DBQOGgUBglrv+zoC9CiJsT5VG3xJgl8qoyOHEdD3eUs8YlE
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113452-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:replyto,oss.qualcomm.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 52A3D6921CD

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Currently, the pcie-qcom driver recursively parses the PERST# GPIO from all
child nodes defined in DT and acquires them. But this creates issues with
PERST# GPIO provided by one of the child devices like the PCIe switch port.
In this case, the RC driver cannot acquire the PERST# GPIO since it will be
provided by the child PCIe device which was not yet enumerated during RC
driver probe.

Fix this by checking if the GPIO provider is a child of the RC's DT node
(i.e., sits behind this PCIe controller). If so, skip it, as PERST#
should be controlled by the respective PCIe client driver implementation.
GPIOs provided by external GPIO controllers (e.g., TLMM in Qcom SoCs)
continue to be handled normally.

Fixes: 2fd60a2edb83 ("PCI: qcom: Parse PERST# from all PCIe bridge nodes")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 36 ++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index af6bf5cce65b..f90ff68cdaf2 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1693,6 +1693,22 @@ static const struct pci_ecam_ops pci_qcom_ecam_ops = {
 	}
 };
 
+static bool qcom_pcie_is_child_node(struct device *dev,
+				    struct device_node *node)
+{
+	struct device_node *parent;
+
+	for (parent = of_get_parent(node); parent;
+	     parent = of_get_next_parent(parent)) {
+		if (parent == dev->of_node) {
+			of_node_put(parent);
+			return true;
+		}
+	}
+
+	return false;
+}
+
 /* Parse PERST# from all nodes in depth first manner starting from @np */
 static int qcom_pcie_parse_perst(struct qcom_pcie *pcie,
 				 struct qcom_pcie_port *port,
@@ -1700,12 +1716,32 @@ static int qcom_pcie_parse_perst(struct qcom_pcie *pcie,
 {
 	struct device *dev = pcie->pci->dev;
 	struct qcom_pcie_perst *perst;
+	struct device_node *gpio_np;
 	struct gpio_desc *reset;
 	int ret;
 
 	if (!of_find_property(np, "reset-gpios", NULL))
 		goto parse_child_node;
 
+	/*
+	 * Skip GPIOs provided by a PCIe device which is a child of the Root
+	 * Complex (e.g., a PCIe switch with GPIO controller capability). Such
+	 * controllers won't be available at RC probe time and their PERST#
+	 * should be controlled by the respective PCI client driver
+	 * implementation.
+	 */
+	gpio_np = of_parse_phandle(np, "reset-gpios", 0);
+	if (!gpio_np) {
+		dev_err(dev, "Failed to parse GPIO provider\n");
+		return -EINVAL;
+	}
+
+	if (qcom_pcie_is_child_node(dev, gpio_np)) {
+		of_node_put(gpio_np);
+		goto parse_child_node;
+	}
+	of_node_put(gpio_np);
+
 	reset = devm_fwnode_gpiod_get(dev, of_fwnode_handle(np), "reset",
 				      GPIOD_OUT_HIGH, "PERST#");
 	if (IS_ERR(reset)) {

---
base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
change-id: 20260616-pci-qcom-perst-fix-00417aa57a96

Best regards,
--  
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>



