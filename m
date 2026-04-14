Return-Path: <linux-arm-msm+bounces-103167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YO1hD/dk3mmcDgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:01:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA203FC440
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 190393060C63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7CF93ED139;
	Tue, 14 Apr 2026 16:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uXKky96s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFB83ED12A;
	Tue, 14 Apr 2026 16:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776182412; cv=none; b=g+at8VWfbcBOxS6aN+QjcUoBeFTJJC4d+6aZySzD4T82hXiEskVBZ5jZt/Z1Orxco8+9A0gNmHN2a5KTsLVMHXxKa2h0+Abe6oE2wPoobMEkl9/0QP3eaCOPz28wzMO1is3lW7lTHYnEpwqgYE9o8LpIuIQTRa7peLkx1aTqA28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776182412; c=relaxed/simple;
	bh=iAKBGCABkb4xVXmTd/HHowC129P8QPZmpSjEkWgabaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f3iWN8RUNWL6Ayuz7nTo7/ymkY94Vrbg7xpUDVgR/LzKwJzObdu3oKONb/ibBDgtUML1bx77wL36fzN7ZV/3uaUqiF8moEQrUODczzIjZxiqQvMunc+Cu8BAItD/00a2Z0Z0kSQPpOIoqbkehzO0c0+2B+fsFgK9Yt4O1QwmsGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uXKky96s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22753C2BCB3;
	Tue, 14 Apr 2026 16:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776182412;
	bh=iAKBGCABkb4xVXmTd/HHowC129P8QPZmpSjEkWgabaM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uXKky96s4f2fZd0xkfLHCZWRm0T+DxsrWxzfjtB7AOPiXXzA5Kyk78F1z4PckZRUx
	 6dBpazkd8sU1PsIiC8RbU14IDR8+aMY0fwXYekDXJFd3SIrBwU7BZsTHWqMINkqxrD
	 SmU8eOtOQ3kdt0NBCtRM30KnMMbLWl4tmznpDodwjbB1dJPfBswvSPihMfiqcb7eTU
	 12CVznGksApMcdpekQzScV/6ApRjWtyqmNOPzPuDvm5oTBU39oQdYbFzDrGbtGV2W1
	 LElrarzAYZ1A3NqJWHSgqlXuej06LBcjoLTQWJGSCWyIcg4Noqs2MObe4ueVtg4o7x
	 3ZFjpzUkQ+r1g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15844F9D0DA;
	Tue, 14 Apr 2026 16:00:12 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Tue, 14 Apr 2026 21:29:39 +0530
Subject: [PATCH 1/4] PCI: Introduce an API to check if RC/platform can
 retain device context during suspend
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-l1ss-fix-v1-1-adbb4555b5ab@oss.qualcomm.com>
References: <20260414-l1ss-fix-v1-0-adbb4555b5ab@oss.qualcomm.com>
In-Reply-To: <20260414-l1ss-fix-v1-0-adbb4555b5ab@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Keith Busch <kbusch@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-nvme@lists.infradead.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3214;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=dSaPO8AlhFDgfohNEVxN4pE727IFbvTr7L0udrmkbZ4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBp3mSJQGw7NOXWNlGDoeSfbsV1IadRDRAOlYwji
 DQFQoP4FhCJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCad5kiQAKCRBVnxHm/pHO
 9QAXCACJnEGJZagKmL2MdEaxeZuzF4dIIzTKziQQG5AIPw3Z4UVbWgIj3Zb7SbPKzv/aCmagape
 iwuDEL0M7cXyE0HwQivolMkYcD4r1gd15o9rmUTnO/V6Bsi5vq0VKiMVZV+/k8ZjPJaw52gAeTA
 m2lzJvk20/tKA0OAf+V3483lrzls8SnxpHReWcBIljHufXnZo6pnTBbcu2J/4rbWgeuw7qYCXP3
 mfW5qvK0FFmPAt+UUVlx6UPvrLXcXtvG71WtlydGXCW2vnYRqwj0kD6exEgFM1QEQUueP4GkgFB
 Vi8P2tAYTG55YT2bsXz/Z1R46f3iEZKY/M/0gPExjMHiJ5x1
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103167-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:replyto,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: DDA203FC440
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Currently, the PCI endpoint drivers like NVMe checks whether the device
context will be retained or not during system suspend, with the help of
pm_suspend_via_firmware() API.

But it is possible that the device context might be lost due to some
platform limitation as well. Having those checks in the endpoint drivers
will not scale and will cause a lot of code duplication.

So introduce an API that acts as a sole point of truth that the endpoint
drivers can rely on to check whether they can expect the device context
to be retained or not.

If the API returns 'false', then the client drivers need to prepare for
context loss by performing actions such as resetting the device, saving
the context, shutting it down etc... If it returns 'true', then the drivers
do not need to perform any special action and can leave the device in
active state.

Right now, this API only incorporates the pm_suspend_via_firmware() check.
But will be extended in the future commits.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/pci.c   | 23 +++++++++++++++++++++++
 include/linux/pci.h |  7 +++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 8479c2e1f74f..211616467a77 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -33,6 +33,7 @@
 #include <asm/dma.h>
 #include <linux/aer.h>
 #include <linux/bitfield.h>
+#include <linux/suspend.h>
 #include "pci.h"
 
 DEFINE_MUTEX(pci_slot_mutex);
@@ -2900,6 +2901,28 @@ void pci_config_pm_runtime_put(struct pci_dev *pdev)
 		pm_runtime_put_sync(parent);
 }
 
+/**
+ * pci_dev_suspend_retention_supported - Check if the platform can retain the device
+ *					 context during system suspend
+ * @pdev: PCI device to check
+ *
+ * Returns true if the platform can guarantee to retain the device context,
+ * false otherwise.
+ */
+bool pci_dev_suspend_retention_supported(struct pci_dev *pdev)
+{
+	/*
+	 * If the platform firmware (like ACPI) is involved at the end of system
+	 * suspend, device context may not be retained.
+	 */
+	if (pm_suspend_via_firmware())
+		return false;
+
+	/* Assume that the context is retained by default */
+	return true;
+}
+EXPORT_SYMBOL_GPL(pci_dev_suspend_retention_supported);
+
 static const struct dmi_system_id bridge_d3_blacklist[] = {
 #ifdef CONFIG_X86
 	{
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 1c270f1d5123..d9bc7ad4eaa4 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2080,6 +2080,8 @@ pci_release_mem_regions(struct pci_dev *pdev)
 			    pci_select_bars(pdev, IORESOURCE_MEM));
 }
 
+bool pci_dev_suspend_retention_supported(struct pci_dev *pdev);
+
 #else /* CONFIG_PCI is not enabled */
 
 static inline void pci_set_flags(int flags) { }
@@ -2239,6 +2241,11 @@ pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
 static inline void pci_free_irq_vectors(struct pci_dev *dev)
 {
 }
+
+static inline bool pci_dev_suspend_retention_supported(struct pci_dev *pdev)
+{
+	return true;
+}
 #endif /* CONFIG_PCI */
 
 /* Include architecture-dependent settings and functions */

-- 
2.51.0



