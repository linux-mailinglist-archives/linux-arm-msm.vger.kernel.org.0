Return-Path: <linux-arm-msm+bounces-96692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCv4ALgzsGl2hAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 16:07:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE1F252DEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 16:07:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDDBC32B40F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F9D397E9E;
	Tue, 10 Mar 2026 14:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rRMr6uhD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243E1391E5C;
	Tue, 10 Mar 2026 14:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773151341; cv=none; b=cBA8SP6RaU+NKgkp6Q44Ti0vRILe1Opy4QIUw2ZSvinCbBDT+F1qyI64CLFDSJJWIxTf62PD0y+KfZFWFSa8wAE+NDlaydgHUzWz1oYEJ451c8RaRvGptVzbZwhtYW5g3p95zQFdm5qjEMIcPujn8JyUCSZOT7w/OJVC9uO+IIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773151341; c=relaxed/simple;
	bh=e+CijSnACpAvUHE3G+ydvnXHYVPcarBDrd6Vye65l2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M7drbIu6FjwGdaMBH5haJnIO5UIa+W2xBYOIoDpR00FHMsivMw3M6JYJAw4hA8tiaF9hVRQl8YMqNQVrPonUWehTuH0r5Ipqv2SR81XAVeE5/fuOObwMU0BsSs/bHUTzxj68loHguV6adIpsV8JlWCTbcZtHB0VuaaA8AC2NcN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rRMr6uhD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8C66C19425;
	Tue, 10 Mar 2026 14:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773151340;
	bh=e+CijSnACpAvUHE3G+ydvnXHYVPcarBDrd6Vye65l2c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rRMr6uhDGG/EHpghKLYQCDX4tTJE/Qqta2nrySIKYuwJi6GUgT8qEEtBOQbz31Ksh
	 cGKx+5EBlKR0qKLm5jHzjQ+u4w3QBMnZpAEltxg2TI90wPRk+ucg701iI+YftyquzP
	 6RgZyIN9GclRffH4uBOx45q0nDeMhedcn+Yi3dzxTq4FxSk4fixzLX9klQaMw6iXNI
	 Ip5PdETcw1nyM4WUUlgTjZtjbeIu8pbjF6MxHT+UIrF/KWQdzgt05pB3q9m/jGnUix
	 HoTt6D0T22/PGU26F8weCO8VSEBqBmOaQutrsxVkZ7DsfgbnnRqYVnfAHqX7QWCqDe
	 7hB082PhZNe/A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A77FD2D9C;
	Tue, 10 Mar 2026 14:02:20 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Tue, 10 Mar 2026 19:31:59 +0530
Subject: [PATCH v7 1/4] PCI/ERR: Add support for resetting the Root Ports
 in a platform specific way
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-pci-port-reset-v7-1-9dd00ccc25ab@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3320;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=aIuqRb8fuH3xOsqx29xICH+yE2vzbaBFc8FQ37/gZEg=;
 b=kA0DAAoBVZ8R5v6RzvUByyZiAGmwJGrIK+D57DvdlL7z3X181VCMvq/D7qe2Thyq3G7p5Xs5m
 YkBMwQAAQoAHRYhBGelQyqBSMvYpFgnl1WfEeb+kc71BQJpsCRqAAoJEFWfEeb+kc71Wp4H/3cK
 ODnO2eBBsukQIGEgP3e2NvJeNsuGlwwqXTdWBG19kbpSzCyBD4wpIbZrDBp8XXrVGpcxcF7z6dV
 8KvoURHI+nuJMje2pDNIUaCpqm3YC5Q7BQzf3lTbiRf8TxN32uUPjG2v39Z9SjcpzxtOs9lresP
 aFTDdoSXB4BCmX7Hk4MbaiLZpPmM+Oz9rv1soh9RBN71C3E+CXWkR6qSiYEQefskb94p8rEEEsv
 903JEz1zg3QEydn3YGKWFiWRllJJw/wVEdvNdaH/yRsx6ZAnUoT9tMdoAm29X4k9W23NAOs0VUa
 RCMktpuV94fAjd5Q7HHEgJYqF53Z/3EoH/3kVRI=
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Rspamd-Queue-Id: 6AE1F252DEE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96692-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:email,nxp.com:email,oss.qualcomm.com:replyto,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

From: Manivannan Sadhasivam <mani@kernel.org>

Some host bridge devices require resetting the Root Ports in a platform
specific way to recover them from error conditions such as Fatal AER
errors, Link Down etc... So introduce pci_host_bridge::reset_root_port()
callback and call it from pcibios_reset_secondary_bus() if available. Also,
save the Root Port config space before reset and restore it afterwards.

The 'reset_root_port' callback is responsible for resetting the given Root
Port referenced by the 'pci_dev' pointer in a platform specific way and
bring it back to the working state if possible. If any error occurs during
the reset operation, relevant errno should be returned.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Tested-by: Brian Norris <briannorris@chromium.org>
Tested-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Tested-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pci/pci.c      | 20 ++++++++++++++++++++
 drivers/pci/pcie/err.c |  5 -----
 include/linux/pci.h    |  1 +
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 8479c2e1f74f..6f09057d83e0 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4812,6 +4812,26 @@ void pci_reset_secondary_bus(struct pci_dev *dev)
 
 void __weak pcibios_reset_secondary_bus(struct pci_dev *dev)
 {
+	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
+	int ret;
+
+	if (pci_is_root_bus(dev->bus) && host->reset_root_port) {
+		/*
+		 * Save the config space of the Root Port before doing the
+		 * reset, since the state could be lost. The Endpoint state
+		 * should've been saved by the caller.
+		 */
+		pci_save_state(dev);
+		ret = host->reset_root_port(host, dev);
+		if (ret)
+			pci_err(dev, "Failed to reset Root Port: %d\n", ret);
+		else
+			/* Now restore it on success */
+			pci_restore_state(dev);
+
+		return;
+	}
+
 	pci_reset_secondary_bus(dev);
 }
 
diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index bebe4bc111d7..13b9d9eb714f 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -256,11 +256,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	}
 
 	if (status == PCI_ERS_RESULT_NEED_RESET) {
-		/*
-		 * TODO: Should call platform-specific
-		 * functions to reset slot before calling
-		 * drivers' slot_reset callbacks?
-		 */
 		status = PCI_ERS_RESULT_RECOVERED;
 		pci_dbg(bridge, "broadcast slot_reset message\n");
 		pci_walk_bridge(bridge, report_slot_reset, &status);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 1c270f1d5123..34c434b79abb 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -644,6 +644,7 @@ struct pci_host_bridge {
 	void (*release_fn)(struct pci_host_bridge *);
 	int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
 	void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
+	int (*reset_root_port)(struct pci_host_bridge *bridge, struct pci_dev *dev);
 	void		*release_data;
 	unsigned int	ignore_reset_delay:1;	/* For entire hierarchy */
 	unsigned int	no_ext_tags:1;		/* No Extended Tags */

-- 
2.51.0



