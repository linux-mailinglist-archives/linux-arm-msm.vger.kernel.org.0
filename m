Return-Path: <linux-arm-msm+bounces-103166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CE1tKSNl3mmcDgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:02:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0423FC481
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B4F2307B00D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8B33ED135;
	Tue, 14 Apr 2026 16:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HmQ/Rexu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DD63ED127;
	Tue, 14 Apr 2026 16:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776182412; cv=none; b=eMs6MBfZzzEwW7CpabzS1MoiGjEX+Sfeppw0TrchzHBGBj5u15Q6m+ODdldoix9QaU799ZYHRlxYC7vvWFjBL7th4V+tS0pGsTJzJMqiyQHVJr8pwe89OQM+2ecrLT04wkGkhJXzZngMEEivPIO7NVo0WEFTD5B25HKhYLiyWX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776182412; c=relaxed/simple;
	bh=gd3NgVMSuig/iZb+VOgR9aExL4jhTOa1kJGPBkl+B4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L76imM+V38rSAQrq2OyEgyJ6hpB49y7Q6E+qBphfqQLzQwDi1ARu0GThUKOwr0DE8vjZnilJEcbJW6mILvTVVXkzwWCQlf+tpmbK0caPANzZRl+AnYWTL0hdKvzO46a0CE4HE5mfeUVKy5toed8zJSSjJCT5MeiHnQgvTsOQDEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HmQ/Rexu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4FE79C2BCF4;
	Tue, 14 Apr 2026 16:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776182412;
	bh=gd3NgVMSuig/iZb+VOgR9aExL4jhTOa1kJGPBkl+B4E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HmQ/RexuXS6e7g1wNo7tHtonuuuTo03+g/Eyd14XD5eKS7/6BkPKJn+oJSpPq0FXl
	 OEdP9Y3YsR3rjDovyfTcv2qBmZPDU2UHYAhczTL3zQhg/SYygxkUdghjCpnaByYIsD
	 /yWBMcSl5giCTOrr0OwehWFXla7fJCb6gA/S8TCivMNw6E4L3fqgqt34UpXztb94or
	 PBgbVm0c3+zdGdM1uTGJc8mYAOtD3xBKBRZomgc32mVZbulbtMVcmWXkune8SJEKoO
	 7PYT8aKtR68YsYsPC3miPfIF/Oy2SVPWfMaeGrz+7DM+d/bnLXSc+7GYIYeWi6kSBI
	 N1PmeiFW1pDHg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46739F9D0E2;
	Tue, 14 Apr 2026 16:00:12 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Tue, 14 Apr 2026 21:29:42 +0530
Subject: [PATCH 4/4] nvme-pci: Use pci_dev_suspend_retention_supported()
 API during suspend
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-l1ss-fix-v1-4-adbb4555b5ab@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2024;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=9iqx3F1OL5ZbjTfr4VDbef+alvPRZcEaJTtZ6g6PO50=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBp3mSJFA22ZzG+uMhc8/mbge/1w0NhLM9MKpWXt
 fSvM3+00NGJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCad5kiQAKCRBVnxHm/pHO
 9bdLB/9BO3ZBbEYnyiWy5OENKpCGj4kWk1d2BmauKwSbNLIdFFAwpmWDLWclzRaGeiY8Ewl95W/
 5QcaDR28JqbVG2Xb7m/MM4m/yPbrcrC/KQLrVfLSrlyU/SIHBG+ilclmFF5SBF2sHa4UoQBcgCQ
 PuMUkEXCjUvAyN7eaPRXnOKo6q0e+3t0hHoIQjqI67tG2V72hZDSlZ4hSOsitDyT6rJ8eZ6Z5nC
 g99zGFXbhMUJox8LCXtbGc+4rj5sakJ2AUUf2Mv+l8ony3usLJvWdJS8oLQUFxX1NetE9KqRFTF
 lKxN2gGnT1QBD0SYUW8s9tb9/GETQmHWQfmpt3ufgFaTTKfI
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103166-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:replyto,oss.qualcomm.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 3B0423FC481
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

The pci_dev_suspend_retention_supported() API lets PCI client drivers
know if the platform can retain the device context during suspend. This
is decided based on several factors like:

1. Firmware involvement at the end of suspend
2. Any platform limitation in waking from low power state (L1ss)

And this API might also get extended in the future to cover other platform
specific issues impacting the device low power mode during system suspend.

So use this API instead of checks like pm_suspend_via_firmware(). When this
API returns false, then assume that the platform cannot retain the context
and shutdown the controller. If it returns true, then assume that the
context will be retained and keep the device in low power mode.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/nvme/host/pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index b78ba239c8ea..19010330469f 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -3915,6 +3915,7 @@ static int nvme_suspend(struct device *dev)
 	 * use host managed nvme power settings for lowest idle power if
 	 * possible. This should have quicker resume latency than a full device
 	 * shutdown.  But if the firmware is involved after the suspend or the
+	 * platform has any limitation in waking from low power states or the
 	 * device does not support any non-default power states, shut down the
 	 * device fully.
 	 *
@@ -3923,7 +3924,7 @@ static int nvme_suspend(struct device *dev)
 	 * down, so as to allow the platform to achieve its minimum low-power
 	 * state (which may not be possible if the link is up).
 	 */
-	if (pm_suspend_via_firmware() || !ctrl->npss ||
+	if (!pci_dev_suspend_retention_supported(pdev) || !ctrl->npss ||
 	    !pcie_aspm_enabled(pdev) ||
 	    (ndev->ctrl.quirks & NVME_QUIRK_SIMPLE_SUSPEND))
 		return nvme_disable_prepare_reset(ndev, true);

-- 
2.51.0



