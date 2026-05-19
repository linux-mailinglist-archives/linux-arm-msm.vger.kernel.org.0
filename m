Return-Path: <linux-arm-msm+bounces-108393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPaPNDAcDGpJWQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:15:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 634CD579C99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:15:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65192302EE8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C743E00A2;
	Tue, 19 May 2026 08:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFXmoOpT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103FE3DBD53;
	Tue, 19 May 2026 08:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178290; cv=none; b=JpLOlTqZ/tv873nkwP48rvXycbh5rnWpGs/mt1+grQt+c/jGJprUgGFkcXophqTfxIdpobk6jI5hFTU8Mbi7X3kZj4MTh6E6EkRqggDiHpW9LA2MuG4Lc2joguXhfZ3o1DVWEX+VOwHhZ+VYUiQupZBwvXQnEnWC9NdCrEI2HKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178290; c=relaxed/simple;
	bh=PmS/34wZTUEclLy38J2UNnMJbx75CroBjayhiRypQDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g/XNxrzQlHHOlibx4SDxKAsePKhxIyFV+uoYHR+6FuU12Y/L2hWNvQLJHatJdf9tgzP+Uzh0Oe/iBybLHv7BpzZK0SeVrMcKKHuN2b9cd6NAfqUe65IZGhFSFVt5avG5CMpmFzXNCIc/YW9MXDzzWsQ9tXPFaMR6bKQt2LFXM/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFXmoOpT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D125EC2BCF6;
	Tue, 19 May 2026 08:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779178289;
	bh=PmS/34wZTUEclLy38J2UNnMJbx75CroBjayhiRypQDQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mFXmoOpTeHKivWfGt5voXr4DAQV6h0PisXVLHX2TaM3Wh/DAQf5GBXDseFdAS4v0z
	 LpGmzSs1DWLKhwhK02WGM3kREIq8UDJrBjaOKDlBKYKF7qo3pt5xa6q18LsQJWxcF4
	 LwMeT35RzmBbkbdlIbyegHsokN7opbrk+YPaLwV6q5wqpDpbc7gcbfXPl5U0jeE+Wk
	 ear+QoMbx68Sd6fHfrDphdVN85vJMl+LprDBKORg8JxaC5iaTag7nvafc+HSeB2Niu
	 EoLCSOsFQW/1gBWgq59RcXYNTUl395rMdgXE60evoNCUeu6hGS3uVEHSBNQRsXW6ZO
	 I/Eq57IMK5auQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7740CD4F57;
	Tue, 19 May 2026 08:11:29 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Tue, 19 May 2026 13:41:21 +0530
Subject: [PATCH v2 2/4] PCI: Indicate context lost if L1ss exit is broken
 during resume from system suspend
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-l1ss-fix-v2-2-b2c3a4bdeb15@oss.qualcomm.com>
References: <20260519-l1ss-fix-v2-0-b2c3a4bdeb15@oss.qualcomm.com>
In-Reply-To: <20260519-l1ss-fix-v2-0-b2c3a4bdeb15@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3331;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=i4F4KqDqI8ZgLEsx/6SfOqEOrYP4clWeClm6r9uw2Sw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqDBsu9LB32B5u3ZCMkU0ywL6Z6k7E2oqPKkwRu
 TYsXoIlHFCJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCagwbLgAKCRBVnxHm/pHO
 9ajKB/9hpUS2Zav/YkZSgcq7hl0iPI4PWX8Sk9I2fk3P2k64zuuVkojILMR+viEzxHyNSotRMOc
 0Txl2uQB8/Bo0qTbabhE/WuBwz61iAbuhfnY4jaTQ0ib8W6DIZ7pgZ4d7vQzfIFwNO+ooYB6Ppp
 U45/+ZkZVO7IrpdavoJ25W6nWOK/MFCaCCcPl2AstgWXl2br1kMAU52nXFlvEKmU6t9GOS53kKm
 Rng7b/dTbgpfXyBSX/Y/nWLzTDwkdMp6XfdCy1tlR8Ru8sIvKdfCm2xHLhqs/E90m+AYodybBNd
 vZPQHCcJQVWN/QP3V4uk8UH1PrPWtn9PxYgZm8fhhcs2jQbQ
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108393-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:replyto,qualcomm.com:email]
X-Rspamd-Queue-Id: 634CD579C99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

The PCIe spec v7.0, sec 5.5.3.3.1, states that for exiting L1.2 due to an
endpoint asserting CLKREQ# signal, the refclk must be turned on no earlier
than TL10_REFCLK_ON, and within the latency advertised in the LTR message.
This same behavior applies to L1.1 as well.

On some platforms like Qcom, these requirements are satisfied during OS
runtime, but not while resuming from the system suspend. This happens
because the PCIe RC driver may remove all resource votes and turns off the
analog circuitry of PHY during suspend to maximize power savings while
keeping the link in L1ss.

Consequently, when the endpoint asserts CLKREQ# to wake up, the OS must
first resume and the RC driver must restore the PHY and enable the REFCLK.
When this recovery process exceeds the L1ss exit latency time (roughly
L10_REFCLK_ON + T_COMMONMODE), the endpoint may treat it as a fatal
condition and triger Link Down (LDn). If the endpoint device is used to
host the RootFS, it will result in an OS crash. For other endpoints, it
may result in a complete device reset/recovery.

So to indicate this platform limitation to the client drivers, introduce a
new flag 'pci_host_bridge::broken_l1ss_resume' and check it in the
pci_suspend_retains_context() API. If the flag is set by the RC driver, the
API will return 'false' indicating the client drivers that the device
context may not be retained and the drivers must be prepared for context
loss.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/pci.c   | 11 +++++++++++
 include/linux/pci.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 38cc5172d259..a7d2cb69b42e 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -2910,6 +2910,8 @@ void pci_config_pm_runtime_put(struct pci_dev *pdev)
  */
 bool pci_suspend_retains_context(struct pci_dev *pdev)
 {
+	struct pci_host_bridge *bridge = pci_find_host_bridge(pdev->bus);
+
 	/*
 	 * If the platform firmware (like ACPI) is involved at the end of system
 	 * suspend, device context may not be retained.
@@ -2917,6 +2919,15 @@ bool pci_suspend_retains_context(struct pci_dev *pdev)
 	if (pm_suspend_via_firmware())
 		return false;
 
+	/*
+	 * Some host bridges power off the PHY to enter deep low-power modes
+	 * during system suspend. Exiting L1 PM Substates from this condition
+	 * violates strict timing requirements and results in Link Down (LDn).
+	 * On such platforms, the endpoint must be prepared for context loss.
+	 */
+	if (bridge && bridge->broken_l1ss_resume)
+		return false;
+
 	/* Assume that the context is retained by default */
 	return true;
 }
diff --git a/include/linux/pci.h b/include/linux/pci.h
index f60f9e4e7b39..1e5b59fa258a 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -660,6 +660,8 @@ struct pci_host_bridge {
 	unsigned int	preserve_config:1;	/* Preserve FW resource setup */
 	unsigned int	size_windows:1;		/* Enable root bus sizing */
 	unsigned int	msi_domain:1;		/* Bridge wants MSI domain */
+	unsigned int	broken_l1ss_resume:1;	/* Resuming from L1ss during
+						   system suspend is broken */
 
 	/* Resource alignment requirements */
 	resource_size_t (*align_resource)(struct pci_dev *dev,

-- 
2.48.1



