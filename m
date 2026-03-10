Return-Path: <linux-arm-msm+bounces-96691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KG4GMbczsGl2hAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 16:07:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1A0252DED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 16:07:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F05E13133629
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49383399340;
	Tue, 10 Mar 2026 14:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g/rXouWQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242A9391E50;
	Tue, 10 Mar 2026 14:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773151341; cv=none; b=gQGJ0HyilJ847owCDSLD2CTwycNhsDz2wLmb8sat7Gh/C+7WQcUHAST8g70NpI8srM7tUcj1SlCEyfa4zmrCc70khIc6JHbsW8RW7uZVWQvs6WNAedRAG+SlD2jvUnJ23tJ6Bd+bzRwQ6InitSCQmKZ2p445KbAWelcNYgVR78I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773151341; c=relaxed/simple;
	bh=GpQHCMLy/+U8kyMZUGmI9yqiy5cIdh0/0TbBdyLaW4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aqS2MY6HejEdyUXEQOWBWMcMcBSt8Qm5nTfAnuHOxyB9zKTgLwknkfw9YZwcTrJQ6EIpod50Z2Cms8AVcPDKBY59gLPsDPnBzYn/AStwgAzaVvIODLG+fem2ZmdyaCd7vvDki1+K99+oUFT9zcKRnzvVVqkp76IZWwPcia/8XcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g/rXouWQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DAF3CC2BCAF;
	Tue, 10 Mar 2026 14:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773151341;
	bh=GpQHCMLy/+U8kyMZUGmI9yqiy5cIdh0/0TbBdyLaW4M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=g/rXouWQ7QGvp+LlKvpXqU8CgzMvER3Lipgr3OQ3ca47w9sHbqwcIi/oiyueQdIx6
	 VQ/DYQ7ncsC6iUdO1ioa7t06hpt3hhc3y3isnzKZ0Gx8VS5o4KSv/mpKFEckrYvwHz
	 vRk+/d45Gcrdep1VaGBn2ixgshfkNLFz535d0O17UXJ/EEvKkPXJdAxpX/kZAwjC1l
	 TWRoc898Q4VHGxo6mq5OR2uOMAt1HMP9MP2tAFhamdb4xC1oon50Y5BDrVIW+sXz94
	 q7VOUu/h2i27LBjVJcC5W2T2JUk/cznmn30Ma5+RKPiloc70hsQCL7wKGXrpn3hwWy
	 C3GibuSe7j9Dg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9519FD2D9A;
	Tue, 10 Mar 2026 14:02:20 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Tue, 10 Mar 2026 19:32:00 +0530
Subject: [PATCH v7 2/4] PCI: host-common: Add link down handling for Root
 Ports
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-pci-port-reset-v7-2-9dd00ccc25ab@oss.qualcomm.com>
References: <20260310-pci-port-reset-v7-0-9dd00ccc25ab@oss.qualcomm.com>
In-Reply-To: <20260310-pci-port-reset-v7-0-9dd00ccc25ab@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Niklas Cassel <cassel@kernel.org>, 
 Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 mani@kernel.org, Lukas Wunner <lukas@wunner.de>, 
 Richard Zhu <hongxing.zhu@nxp.com>, Brian Norris <briannorris@chromium.org>, 
 Wilson Ding <dingwei@marvell.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Frank Li <Frank.Li@nxp.com>, Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5047;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=aFkx7QcjgWXLjqxldAdhXr9ROuajXIiL4yi0K0WOE5c=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpsCRqrlJW+b7djwMK1Ei7k62UFLEXZ1gYZNshe
 vHMm6FRURuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCabAkagAKCRBVnxHm/pHO
 9SvAB/427KkqnhQGX1Vab4Rm6k/g6XchDY2PORDJ+5iwcCnCf9Krh5sdAjTOPlxS/HuGaFWLQX8
 D8CC26e9shL+jLIW9lLal+zwYf88gxcByt2TRMXFpR+HKjMSC0g+9BENXS0h/YjQBdhrUrY3T4Z
 thDUb3YalcqRLDZR0eo6tr/kZiz5WY7jEXdhaACyp0Z9xqzftp03RGn2/M2ouk0FeXke8CaUIvl
 CKfeDrps41NgtH3KQXW0YdUbPiSqdtqFGATgAnpiZI+vWxwnYosZFUO3LU8kqvSMDW+svgOTAbH
 wAc/ZKEfGHGP0gevdD0RvdFzQm34buVpT1/dSdqL3pZIyxFY
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Rspamd-Queue-Id: 5D1A0252DED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96691-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[google.com,linux.ibm.com,gmail.com,kernel.org,sntech.de,pengutronix.de];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:email,chromium.org:email,qualcomm.com:email,oss.qualcomm.com:replyto,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

From: Manivannan Sadhasivam <mani@kernel.org>

The PCI link, when down, needs to be recovered to bring it back. But on
some platforms, that cannot be done in a generic way as link recovery
procedure is platform specific. So add a new API
pci_host_handle_link_down() that could be called by the host bridge drivers
for a specific Root Port when the link goes down.

The API accepts the 'pci_dev' corresponding to the Root Port which observed
the link down event. If CONFIG_PCIEAER is enabled, the API calls
pcie_do_recovery() function with 'pci_channel_io_frozen' as the state. This
will result in the execution of the AER Fatal error handling code. Since
the link down recovery is pretty much the same as AER Fatal error handling,
pcie_do_recovery() helper is reused here. First, the AER error_detected()
callback will be triggered for the bridge and then for the downstream
devices. Finally, pci_host_reset_root_port() will be called for the Root
Port, which will reset the Root Port using 'reset_root_port' callback to
recover the link. Once that's done, resume message will be broadcasted to
the bridge and the downstream devices, indicating successful link recovery.

But if CONFIG_PCIEAER is not enabled in the kernel, only
pci_host_reset_root_port() API will be called, which will in turn call
pci_bus_error_reset() to just reset the Root Port as there is no way we
could inform the drivers about link recovery.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Tested-by: Brian Norris <briannorris@chromium.org>
Tested-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Tested-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pci/controller/pci-host-common.c | 35 ++++++++++++++++++++++++++++++++
 drivers/pci/controller/pci-host-common.h |  1 +
 drivers/pci/pci.c                        |  1 +
 drivers/pci/pcie/err.c                   |  1 +
 4 files changed, 38 insertions(+)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index d6258c1cffe5..15ebff8a542a 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -12,9 +12,11 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
+#include <linux/pci.h>
 #include <linux/pci-ecam.h>
 #include <linux/platform_device.h>
 
+#include "../pci.h"
 #include "pci-host-common.h"
 
 static void gen_pci_unmap_cfg(void *ptr)
@@ -106,5 +108,38 @@ void pci_host_common_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(pci_host_common_remove);
 
+static pci_ers_result_t pci_host_reset_root_port(struct pci_dev *dev)
+{
+	int ret;
+
+	pci_lock_rescan_remove();
+	ret = pci_bus_error_reset(dev);
+	pci_unlock_rescan_remove();
+	if (ret) {
+		pci_err(dev, "Failed to reset Root Port: %d\n", ret);
+		return PCI_ERS_RESULT_DISCONNECT;
+	}
+
+	pci_info(dev, "Root Port has been reset\n");
+
+	return PCI_ERS_RESULT_RECOVERED;
+}
+
+static void pci_host_recover_root_port(struct pci_dev *port)
+{
+#if IS_ENABLED(CONFIG_PCIEAER)
+	pcie_do_recovery(port, pci_channel_io_frozen, pci_host_reset_root_port);
+#else
+	pci_host_reset_root_port(port);
+#endif
+}
+
+void pci_host_handle_link_down(struct pci_dev *port)
+{
+	pci_info(port, "Recovering Root Port due to Link Down\n");
+	pci_host_recover_root_port(port);
+}
+EXPORT_SYMBOL_GPL(pci_host_handle_link_down);
+
 MODULE_DESCRIPTION("Common library for PCI host controller drivers");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
index b5075d4bd7eb..dd12dd1a1b23 100644
--- a/drivers/pci/controller/pci-host-common.h
+++ b/drivers/pci/controller/pci-host-common.h
@@ -17,6 +17,7 @@ int pci_host_common_init(struct platform_device *pdev,
 			 struct pci_host_bridge *bridge,
 			 const struct pci_ecam_ops *ops);
 void pci_host_common_remove(struct platform_device *pdev);
+void pci_host_handle_link_down(struct pci_dev *port);
 
 struct pci_config_window *pci_host_common_ecam_create(struct device *dev,
 	struct pci_host_bridge *bridge, const struct pci_ecam_ops *ops);
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 6f09057d83e0..1b37bfe6d079 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -5650,6 +5650,7 @@ int pci_bus_error_reset(struct pci_dev *bridge)
 	mutex_unlock(&pci_slot_mutex);
 	return pci_bus_reset(bridge->subordinate, PCI_RESET_DO_RESET);
 }
+EXPORT_SYMBOL_GPL(pci_bus_error_reset);
 
 /**
  * pci_probe_reset_bus - probe whether a PCI bus can be reset
diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index 13b9d9eb714f..d77403d8855b 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -292,3 +292,4 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 
 	return status;
 }
+EXPORT_SYMBOL_GPL(pcie_do_recovery);

-- 
2.51.0



