Return-Path: <linux-arm-msm+bounces-108396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIT5KLkcDGoYWgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:18:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67318579D3A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:18:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37F9D301DEFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1933E025E;
	Tue, 19 May 2026 08:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LfVMpFD6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BD53DFC67;
	Tue, 19 May 2026 08:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178290; cv=none; b=IwJTUf6V6yJjiO23H6AX8S/Q8PDduGe8VoRgMfHtXCd0PBDmV/TUsIDzJ8j6d7K84tmdbmf7sPW/Xc/7qePqpYqgBx1pbpyboILOTBnBTYGLtnMFkAbiti0hV7MGybGYU6AsEXceXgnNSEB2OaZUfmvGBz4NBPMD6FB4qYHc/Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178290; c=relaxed/simple;
	bh=3tNqJbphQxq8fgu1zbpz3ztOWC15zQBvAy+SBzQxjVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ikgecNQ8ngRSvLkPY3v/2+KVUEXL05wPxOhy2Ad/gbPJ30WvfpbXH/fpdyX6X3/264D0Mt+lHvAC2PZe0jylhfuPv8rbPdDw2gvzXwZ8d9KfnvPFi4/leXTTKlySRKQWYPtXjHzfjdZiqWkDIJrWh+oldczr18TRX7W4qUIIp0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LfVMpFD6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 021B7C2BCFD;
	Tue, 19 May 2026 08:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779178290;
	bh=3tNqJbphQxq8fgu1zbpz3ztOWC15zQBvAy+SBzQxjVE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LfVMpFD6p6DnP17MHbaMZwfztPGfiES62LkobjtbpeuCznn0tl+97ssc1kgGFPF8S
	 /60caU5wCJ6eJS/MzKs1eR8OWa/5Q1DwPHgOsXOypVthX5LQ9VqzulhuxQRqk0twUe
	 RkhS54O7rBiAaZsTQac5KcN2D80wYVsZAb3YHZ6PM9pHbdMuyWox4fx0ZKmjSpZRgs
	 P0A0f0XzzJHlGHERrYunOXsFP4sqHufYkNzAPnQKSuIznYk6ASSz2rbnsRR376FkTl
	 e/5Qo43hajzA3rhnSzC72Z5sy3WbTjQ+Ubnlua+x7YBuAxyQkAqZfNdgdgmrY2oEhp
	 bIP0+8fCXWIdw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE578CD4851;
	Tue, 19 May 2026 08:11:29 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Tue, 19 May 2026 13:41:23 +0530
Subject: [PATCH v2 4/4] nvme-pci: Use pci_suspend_retains_context() API
 during suspend
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-l1ss-fix-v2-4-b2c3a4bdeb15@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2008;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=wkzcjudTR2aJO1tfV1djFAQP7gK0vMlCmcPgSrxkr6g=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqDBsv6tg+/ohQFmrGz4V+nYAOWjrvtBggaK5pP
 hOYsITqL6qJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCagwbLwAKCRBVnxHm/pHO
 9cgHB/9hVy3DtoD01/gYAs2Xvq1Fh82Tk3uM5j/reOXS4YtcDnH3ebdrlkaEcAUK/pUnsUBLMTm
 hx2k/cVOjoyo7IaYJg6epJRiWfULGYwMjvwRCYg+Gs2Nl8sUvOw6JyP8ZEVMXHjE3JbfjAtHhSZ
 /tbF9vEIp3s1e3HX8flKqnnE3Zm6KQ0U0tgU4cazJFSSwleo3ta3nMP/kceK5Mc/njnZHJo1MlX
 OWICXlX4PjD/KE2IYEt7lCDleFJA+0BItGwmbMiuOSF1wyAOOiXxECeZOEMyOj9a5NZ6oSJFf1r
 37bskjeEYIabTMt0JgsZ9OFPwf3A2pk6xE5OYewFC8OtfKPz
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108396-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:replyto]
X-Rspamd-Queue-Id: 67318579D3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

The pci_suspend_retains_context() API lets PCI client drivers know if the
platform can retain the device context during suspend. This is decided
based on several factors like:

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
index db5fc9bf6627..a6664983ce5d 100644
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
+	if (!pci_suspend_retains_context(pdev) || !ctrl->npss ||
 	    !pcie_aspm_enabled(pdev) ||
 	    (ndev->ctrl.quirks & NVME_QUIRK_SIMPLE_SUSPEND))
 		return nvme_disable_prepare_reset(ndev, true);

-- 
2.48.1



