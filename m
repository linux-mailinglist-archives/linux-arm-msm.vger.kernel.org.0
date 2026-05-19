Return-Path: <linux-arm-msm+bounces-108420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uF39GSEmDGoIXQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:58:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DF457AAA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:58:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 629A2303D172
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357F73F0760;
	Tue, 19 May 2026 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="be4MOyGB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4863EFFD3;
	Tue, 19 May 2026 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180964; cv=none; b=J78cFvByfsSttl+BvUKj3bhjmcE+wDZMcAg69Zwy9HLOFfIABqQ/kuRolgsKhYOdoKaSmCT78Km9xPg+0rM5Mq3/4+rr11fKjBK/OBnG4M4vTCG4iCWjT824JrUWgJZOo5uPBFK3Ip/DRkJO57TLM1SslYz+TT0qpmrjPdzOyos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180964; c=relaxed/simple;
	bh=OOuthL7iIdyXdtvidLIdTJVqEVl+9MBs0h4nZ62FHQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tnEZqM8WRu2gjLM2E51bZj82AjxrL76i/Q9eTBAOvcYEGTpU8KPNP3O3iNMJIIoBdCHmTqTCofD7SvPipg2LDZ1VkTOx3Wu3gLt7sNoOH1gyGVeq5iGhYgoYiwSMDALt8shByP18oE5lJ9r7r+wIk4MmI9P2bPxTeverGLeLP0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=be4MOyGB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D199AC4AF0C;
	Tue, 19 May 2026 08:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779180963;
	bh=OOuthL7iIdyXdtvidLIdTJVqEVl+9MBs0h4nZ62FHQ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=be4MOyGBaFVXDKsnuxQ0m+wkpuLaHEcyj5jBC/qmTUCxGrGtjaAUZ+XEuJebDhXjF
	 OpUXyQrzgKyQWEkPchea5LfBdWyKRAsSAMyl3In3WWkUTAbBbtj0Bf/ctIeew+ja3b
	 IjJciOh4LsAMZzx2FAV6mAtsI7s2w0iSa9ZmXjBOqXIicm4UxC/hxT5EyEamcwKJb9
	 K8ebWt4qh3g/YbIJQWe5QX2hnOyRDfU9HAsG65ToWyzFpo8bhw4IFs8d0sTohhf24d
	 bMpdqffMHfRSc6TdoRCJsF5nOdW/ymh0fk2KuyRrBb28RQuboROgdqxh9j++PaZ2Be
	 7y3IGNef/6FMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E6DCD4851;
	Tue, 19 May 2026 08:56:03 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Tue, 19 May 2026 14:25:58 +0530
Subject: [PATCH v3 3/9] power: sequencing: pcie-m2: Improve PCI device ID
 check
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-pwrseq-m2-bt-v3-3-b39dc2ae3966@oss.qualcomm.com>
References: <20260519-pwrseq-m2-bt-v3-0-b39dc2ae3966@oss.qualcomm.com>
In-Reply-To: <20260519-pwrseq-m2-bt-v3-0-b39dc2ae3966@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1830;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=125jnc1+c1UGaXHbABRqqlnBuVw3M8AG9KSxYWS1n7s=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqDCWekTONEFkCmz6SI699/G8UuScoYglNTOeF+
 aWlIBlJMJKJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCagwlngAKCRBVnxHm/pHO
 9YacB/4+qQ1INbofLwOsC/LruIQxm3l8cmm441FDQ3YemV6LstOcPnUSAo2trW13TThtTtQSirb
 5kBJ9BlrBfuDo8uy+dVQYYhJS50KXCqoksBCW+SUbXtLHQBM6+CBh6EeQz3adu97zMcZNQU4qhR
 smVS7v1i18BpQD7ZMiD1ZK3D91yoRj5CJLE2jGd72kQClxz2Bsjm8KO+bvUh/knF4L7eZoH6t/5
 R8XRRyyJe/uhBJcPH729BGq1tE+2sP5bHlipG4tdTrfvsUXsLMzuEHekfij3TrVqMQEYeR4T51/
 78cPR6Dw/DWb7pWBQ3fTIqjIohfzqNv0b2TlxewTlfYsx6Zh
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108420-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:replyto,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 09DF457AAA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Instead of hardcoding the PCI device check, use pci_match_id() to check for
the known IDs using the pwrseq_m2_pci_ids[] array.

This makes adding support for new devices easier.

Tested-by: Wei Deng <wei.deng@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 469e130330fa..038271207a27 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -343,6 +343,11 @@ static void pwrseq_pcie_m2_remove_serdev(struct pwrseq_pcie_m2_ctx *ctx,
 	mutex_unlock(&ctx->list_lock);
 }
 
+static const struct pci_device_id pwrseq_m2_pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1107) },
+	{ } /* Sentinel */
+};
+
 static int pwrseq_pcie_m2_notify(struct notifier_block *nb, unsigned long action,
 			      void *data)
 {
@@ -362,16 +367,14 @@ static int pwrseq_pcie_m2_notify(struct notifier_block *nb, unsigned long action
 
 	switch (action) {
 	case BUS_NOTIFY_ADD_DEVICE:
-		/* Create serdev device for WCN7850 */
-		if (pdev->vendor == PCI_VENDOR_ID_QCOM && pdev->device == 0x1107) {
+		if (pci_match_id(pwrseq_m2_pci_ids, pdev)) {
 			ret = pwrseq_pcie_m2_create_serdev(ctx, pdev);
 			if (ret)
 				return notifier_from_errno(ret);
 		}
 		break;
 	case BUS_NOTIFY_REMOVED_DEVICE:
-		/* Destroy serdev device for WCN7850 */
-		if (pdev->vendor == PCI_VENDOR_ID_QCOM && pdev->device == 0x1107)
+		if (pci_match_id(pwrseq_m2_pci_ids, pdev))
 			pwrseq_pcie_m2_remove_serdev(ctx, pdev);
 
 		break;

-- 
2.48.1



