Return-Path: <linux-arm-msm+bounces-103165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJEZCBBl3mmxDgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:02:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D773FC46E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7ACC23075946
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D3613ED124;
	Tue, 14 Apr 2026 16:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AkS2pQfu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D9C3ED11A;
	Tue, 14 Apr 2026 16:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776182412; cv=none; b=lXRREoyBEg+p+N/d7BLnmggYBKpn7Kxsxxw27QwPJFnV4/HvVt02NAW0HnMmUn2b9/CKjdaePwelxOCNR9hcYKNubMJ78AU77LW5IkXVflNFDg6Hb77S6POsdZQDpuz1MF7nKISVCelSFHLH9DCCRuK5n2qXC071RQ8SNsWeXMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776182412; c=relaxed/simple;
	bh=HWMbqwedOoMw8lw/15aldB8uIf8M+iftPYa/bgkZ12o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TxwdHNfvqdcn6cbF4PHq8UDWo9AU86xDDy6DhlESt//ik9RwHPe7n82fXs81IF4mveRV7v3jnarXjjZAMzoolKeppplJsfXFf6XvxB/SbebrkemoGaX9nee/18jokboZ8/ExBlOfonz4gDPVdeeDOVgReASHA8mUBTgZdxEshhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AkS2pQfu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 334C1C2BCB8;
	Tue, 14 Apr 2026 16:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776182412;
	bh=HWMbqwedOoMw8lw/15aldB8uIf8M+iftPYa/bgkZ12o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AkS2pQfuVfK9IaoAzE3tAiWiZ57wZP3rJXnVYe7dQ5Yojf5adoXNCU5xnXgnTwy5L
	 D7UDBJyXFVqcyAmWaLgSIMkaICr+Qm8mFKy8Fk5NuLUq0j/ZEaIJaMvITkqsxhW1wz
	 58590VHwI1AqGHgMm5shcPzo8u4axLZwou6yL26RRQ8pYAQUrW3e7yaLOE5bapapgj
	 yphgvcIQKO5flR6JNasMcq67OOpR8gqikhus6PTlUoDHqlCZ6L3QU3smArEkfx0Rsb
	 luhAX+M8cY5zwukxca11Fm2j1keVNTX+RGGzc0fWvkfBrjCn26tJJQCxubUgZyj/Uw
	 DVnFUIXZbYW4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C80F9D0D3;
	Tue, 14 Apr 2026 16:00:12 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Tue, 14 Apr 2026 21:29:40 +0530
Subject: [PATCH 2/4] PCI: Indicate context lost if L1ss exit is broken
 during resume from system suspend
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-l1ss-fix-v1-2-adbb4555b5ab@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3305;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=LyQjngZpjyM7atFii62PC/2oWcdYdOsG7s31euB1g4g=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBp3mSJmlZhEN3RfjDf/GEGFtsvDX0Ll8oF+/ind
 omQnGB3tZqJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCad5kiQAKCRBVnxHm/pHO
 9ZQPB/0TFauDo1bNl4OhfXKRCke7aoRExVdAT6cGff+51gC9NlEDUehXTYuzKL5aDTHYH3ze3Ev
 ff8UzBeyFVUlIkHbaYlWYXMsWfgsT9c+cFuKXMqflurzV6GJZWp6wfJGoEl91gbonS6TDmLwITa
 Auq6bnsaVRZULioqu2rI37EFXRDXcAZLL6CGooAg7SHcTBHs+08DXbUHuneegTd82hf+KOD81uY
 CoGr1SLR5WAn4VwxhvlFNQTPH5oPDwNj9kbNQrNtT/tLV1wUrSNbhtArNOVdkPJDGtFuRx35Muz
 OoYeVIpwIXc6uVTS5uNg88zL70+ulUzFTKjvoG118XKUHMag
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103165-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:replyto,oss.qualcomm.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: A5D773FC46E
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
PHY during suspend to maximize power savings while keeping the link in
L1ss.

Consequently, when the endpoint asserts CLKREQ# to wake up, the OS must
first resume and the RC driver must restore the PHY and enable the refclk.
This recovery process exceeds the L1ss exit latency time. And this latency
violation results in an L1ss exit timeout, followed by Link Down (LDn). If
the endpoint device is used to host the RootFS, it will result in an OS
crash. For other endpoints, it may result in a complete device
reset/recovery.

So to indicate this platform limitation to the client drivers, introduce a
new flag 'pci_host_bridge::broken_l1ss_resume' and check it in the
pci_dev_suspend_retention_supported() API. If the flag is set by the RC
driver, the API will return 'false' indicating the client drivers that the
device context may not be retained and the drivers must be prepared for
context loss.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/pci.c   | 11 +++++++++++
 include/linux/pci.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 211616467a77..e871cccf24ae 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -2911,6 +2911,8 @@ void pci_config_pm_runtime_put(struct pci_dev *pdev)
  */
 bool pci_dev_suspend_retention_supported(struct pci_dev *pdev)
 {
+	struct pci_host_bridge *bridge = pci_find_host_bridge(pdev->bus);
+
 	/*
 	 * If the platform firmware (like ACPI) is involved at the end of system
 	 * suspend, device context may not be retained.
@@ -2918,6 +2920,15 @@ bool pci_dev_suspend_retention_supported(struct pci_dev *pdev)
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
index d9bc7ad4eaa4..860d8a774b51 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -658,6 +658,8 @@ struct pci_host_bridge {
 	unsigned int	preserve_config:1;	/* Preserve FW resource setup */
 	unsigned int	size_windows:1;		/* Enable root bus sizing */
 	unsigned int	msi_domain:1;		/* Bridge wants MSI domain */
+	unsigned int	broken_l1ss_resume:1;	/* Resuming from L1ss during
+						   system suspend is broken */
 
 	/* Resource alignment requirements */
 	resource_size_t (*align_resource)(struct pci_dev *dev,

-- 
2.51.0



