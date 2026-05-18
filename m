Return-Path: <linux-arm-msm+bounces-108225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHcgNHMpC2pAEAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 17:00:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F4156F6C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 17:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B0345300DEF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 14:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA12305672;
	Mon, 18 May 2026 14:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQs5MJLi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2F62F83A0;
	Mon, 18 May 2026 14:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779116377; cv=none; b=pix3zmBl885fSDrg94gFCT4N5j4yAcvwhSR9CL7IqAm5tS9+Dl+R33gwyh8EIuXTLmRSpw3+PS7x1YyOIhj+q9uq2XOKkcBqR3C3korDS6i5Ci0sBrsGNsR1XbGmq8rTOM2HTrG7P1TE6K25sNZgzrGhL1WaqjVv66PDAsp7H1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779116377; c=relaxed/simple;
	bh=ECoXg3gC3Bh+h2o1n42paArpk4jp4P7Tam92UW2RViE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dYWoC22GQ4znyAiX30izPGU1Ywg2O8eOdoXxyA/Cr+LD8axX6yN0XJ/+KQE3DbvbJhIkdeFAlIPIE+ImzrHfVCR9zLsS85IAUOZRiPmzWORa2GUXgJmCeT7xtPa6j7m5jm0vXT49NnAbami/8GJtGQfYfsfQb0C012nfspIo5l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQs5MJLi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2E86C2BCB8;
	Mon, 18 May 2026 14:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779116376;
	bh=ECoXg3gC3Bh+h2o1n42paArpk4jp4P7Tam92UW2RViE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gQs5MJLis6UVecTNK7IBd2IlJgQiFxhwt7w27uj0aIP/JtxjfkgCTv2GtAAAzx0WM
	 eyNZgbR1TJQihLZDJOCJx02FsIemL0KN9lIdH/qJb7IqD4szt76BfHkxKH8UHIZyLs
	 TPvw/MDJL78kc0UFdm/EpqLBeQo0YAp7k4NBaH3fTCTObp9TdqUvY3A7yiYS4gtGiA
	 7u0AMreAiOVzIKQthxjRTOz5urdWXgSD5lYG7IfdOJPRcq8gTs0K87gdH9YoSIgSa7
	 R3PcUahA10xl6+62j5BFrOyLTRQ4Ukb47viYxXO2Yxmf+cp/CqUrJqHoNA3EM6rYfk
	 0q9CXfisL9oPg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90555CD4F49;
	Mon, 18 May 2026 14:59:36 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 18 May 2026 20:29:13 +0530
Subject: [PATCH v8 1/5] PCI: dwc: ep: Clear MSI iATU mapping in
 dw_pcie_ep_cleanup()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-pci-port-reset-v8-1-eb5a7d331dfc@oss.qualcomm.com>
References: <20260518-pci-port-reset-v8-0-eb5a7d331dfc@oss.qualcomm.com>
In-Reply-To: <20260518-pci-port-reset-v8-0-eb5a7d331dfc@oss.qualcomm.com>
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
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1818;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=DOBc0qbyq7keowKanldmTADeubkY3d2RuxJiiS/OOM4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqCylUbgmSbz1kVr7omfIK0go80pJFvGDFzpmhY
 9nEuMnSMXmJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCagspVAAKCRBVnxHm/pHO
 9Vp1B/wOqPF1w4/rxr1pZQAJ04G+p0MJoPG4wsGqn4QByaQH0A6xK3NTFRxmhprieh8pAZUVLiv
 Bfk9nqjL34e6h89veBGMpdtMjzM5K1Yd9rjfahszPgaQnTozmKX71C3zG2Gf62yCYbGIxDU0fN7
 wF9y8NDGQ6mY1osHaoCK76W0XZIqiR1qUOwlVUh1xNCspSycCzJc5KhSmcBZdrc+PrEP9ukFuQv
 W/NyAxeQV/Sz0vX+7XKAac8Blfb/ubk0kqlWq+KbLJaIh1DUw/sp7UVCIx3SVbGMVcDmGjrBopn
 /XHtcZL3biY8r5MXhNm5m2XnDXLSZk3RcxLpbHTE5Q5nhg/6
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[google.com,linux.ibm.com,gmail.com,kernel.org,sntech.de,pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108225-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:replyto,qualcomm.com:email]
X-Rspamd-Queue-Id: B2F4156F6C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

The MSI iATU mapping is currently only cleared when the endpoint is
stopped via configfs or when the host updates the MSI address/size.
This avoids redundant iATU reconfiguration every time the endpoint
raises an MSI interrupt.

However, a fundamental reset triggered by PERST# assert/deassert
resets all iATU inbound/outbound registers without going through the
configfs stop path. If the host also retains the same MSI address/size
after PERST# deassert, the driver never clears the stale MSI iATU
mapping. It then continues using this stale mapping to raise the MSI
interrupts, which can cause IOMMU faults and MSI failures on the host.

Fix this by clearing the MSI iATU mapping inside dw_pcie_ep_cleanup(),
which is already called as part of the PERST# assert/deassert sequence.
This unmaps the MSI iATU region and sets the msi_iatu_mapped flag to
false, ensuring that dw_pcie_ep_raise_msi_irq() performs a fresh iATU
mapping on its next invocation, regardless of whether the host changed
the MSI address/size.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index d4dc3b24da60..4ae0e1b55f39 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -1035,6 +1035,11 @@ void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 
+	if (ep->msi_iatu_mapped) {
+		dw_pcie_ep_unmap_addr(ep->epc, 0, 0, ep->msi_mem_phys);
+		ep->msi_iatu_mapped = false;
+	}
+
 	dwc_pcie_debugfs_deinit(pci);
 	dw_pcie_edma_remove(pci);
 }

-- 
2.48.1



