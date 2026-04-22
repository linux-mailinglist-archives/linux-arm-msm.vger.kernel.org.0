Return-Path: <linux-arm-msm+bounces-104094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJ+8Omuw6GldOwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:26:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B934454A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CA4C303D883
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6013D091C;
	Wed, 22 Apr 2026 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gcxc1h2W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF963C3C00;
	Wed, 22 Apr 2026 11:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776857112; cv=none; b=FuIHl0OD4wP6aBu1c4c+DZ8lRLDmbRZ+2Q3q9jLrq/KS3/MYzyp+Ly/RZB1mKWwBpY+/actKnbpDpIQbivMAA5+bgdA+0253H/4tb5t0lZdaNtG/NGkYexlpuuRb3WQwXDoa7l/7Td9jJVbIl+f8kMOfsd6qHjlMrgwhiHjW1EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776857112; c=relaxed/simple;
	bh=sbvus7COxlYStZyNLdPGuM195ZbWanAbQzRhkGoHqvY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s6yU+zBxxzz29vRhJctn+Sv7w8/Mg5STg1GQdzFeNlBgHZpbLC96rnT/wxaKeWQrPuIGX30eZetfkCp2lbnunGYOt+53/MzhqlMO6WKIEJKU0WcXHl0gEprwvsZYUyKa3NHymQd0AH77ifuMOj+M14rkRlM8O25R6uTNxejmsc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gcxc1h2W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F936C2BCB9;
	Wed, 22 Apr 2026 11:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776857112;
	bh=sbvus7COxlYStZyNLdPGuM195ZbWanAbQzRhkGoHqvY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Gcxc1h2WWVO0IAttW8KOWVPt/46hHwOYJlc/jSjio/RzOgpubHmhsd3rjaBfiw4Ax
	 cShAR8BAwsEDHtjY9+h8fLwbHr9beUAAwzgYNqT78XQgeh0Yn9lXKr359f2ZTzNIz8
	 AAyiC62rqnOqeBhdJlK+Y+RLRGdEdvCcNEm4fKkp1zv4Q2i3IWzzODzxOgWO5wBrQJ
	 zFUoytUs9vrZR1TJuKfD7snIZSfGhyzdROoNvN7stoNBBtlMR9pRXOAjS5oqX/eMRv
	 GJP5Nt02P4Wu1tr3SXqgwXovQy0zkCc4oHKGBUaUI8apV/b/tauyx3GcRw3rCku7az
	 kMaS2KOLh8YeQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 948DBF5A8DE;
	Wed, 22 Apr 2026 11:25:12 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Wed, 22 Apr 2026 16:54:45 +0530
Subject: [PATCH 04/12] power: sequencing: pcie-m2: Fix inconsistent
 function prefixes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-pwrseq-m2-bt-v1-4-720d02545a64@oss.qualcomm.com>
References: <20260422-pwrseq-m2-bt-v1-0-720d02545a64@oss.qualcomm.com>
In-Reply-To: <20260422-pwrseq-m2-bt-v1-0-720d02545a64@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Shuai Zhang <quic_shuaz@quicinc.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>, 
 Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2033;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=LWnLixKrQibhExb1i5PgPATDR3O5JAuvbsbZ6mK36Y0=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBp6LAV/F3/E3MFsCt+z73n6IYm6bHQcgOZG2VRM
 CxU6IxmeSCJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaeiwFQAKCRBVnxHm/pHO
 9c+EB/9BLUydP/0XPcughRS5adJ+af8FQiEMYmytsxappZ2jIRxbkBmaT82LwuU/Q320mvHGQrJ
 jiHgYOtNU/xdlRIsKQwgJRrb8DTDC167WE7lA6/x0JHQh+bBLTYTzqNMeoAD4SG9uptegH1DhUM
 /4DAZpj2bWt6kBgbe8XB2QAIx7c9ZjTbP1HS8oNRDM1nt9M2pFpGsAt49eLzdhbRjFtBvkI2TEu
 vNyOUx3jlrJ0ypPCqHNwGG6BBdsiLNpJrHwX6fUURFEDX340NTUF5oX73AfVsfNGiRpa1VUD6a9
 WwRHQtkyUe/kFnf7UtzGwgXzvy83NwpMZWmILCO+s4FK8gZU
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
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
	TAGGED_FROM(0.00)[bounces-104094-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:replyto,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: A1B934454A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

All functions in this driver follow 'pwrseq_pcie_m2' prefix except a few.
Fix them to avoid inconsistency.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 2b79f2e34079..49c326a6e445 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -185,7 +185,7 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
 	return PWRSEQ_NO_MATCH;
 }
 
-static int pwrseq_m2_pcie_create_bt_node(struct pwrseq_pcie_m2_ctx *ctx,
+static int pwrseq_pcie_m2_create_bt_node(struct pwrseq_pcie_m2_ctx *ctx,
 					struct device_node *parent)
 {
 	struct device *dev = ctx->dev;
@@ -262,7 +262,7 @@ static int pwrseq_pcie_m2_create_serdev(struct pwrseq_pcie_m2_ctx *ctx)
 		goto err_put_ctrl;
 	}
 
-	ret = pwrseq_m2_pcie_create_bt_node(ctx, serdev_parent);
+	ret = pwrseq_pcie_m2_create_bt_node(ctx, serdev_parent);
 	if (ret)
 		goto err_free_serdev;
 
@@ -307,7 +307,7 @@ static void pwrseq_pcie_m2_remove_serdev(struct pwrseq_pcie_m2_ctx *ctx)
 	}
 }
 
-static int pwrseq_m2_pcie_notify(struct notifier_block *nb, unsigned long action,
+static int pwrseq_pcie_m2_notify(struct notifier_block *nb, unsigned long action,
 			      void *data)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = container_of(nb, struct pwrseq_pcie_m2_ctx, nb);
@@ -372,7 +372,7 @@ static int pwrseq_pcie_m2_register_notifier(struct pwrseq_pcie_m2_ctx *ctx, stru
 	if (pwrseq_pcie_m2_check_remote_node(dev, 3, 0, "serial")) {
 		if (pwrseq_pcie_m2_check_remote_node(dev, 0, 0, "pcie")) {
 			ctx->dev = dev;
-			ctx->nb.notifier_call = pwrseq_m2_pcie_notify;
+			ctx->nb.notifier_call = pwrseq_pcie_m2_notify;
 			ret = bus_register_notifier(&pci_bus_type, &ctx->nb);
 			if (ret)
 				return dev_err_probe(dev, ret,

-- 
2.51.0



