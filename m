Return-Path: <linux-arm-msm+bounces-96695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJRENowtsGlHgwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:41:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAE72523DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A48C33FA28F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A96F391E4E;
	Tue, 10 Mar 2026 14:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GSe55bPC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39577396B83;
	Tue, 10 Mar 2026 14:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773151341; cv=none; b=RyA7h1H7jh0LFmaOZ1KYinlej2vCzOOeRAsEcOckD9iAbBLW6ZtRfCusIdMyfHURNAxTQSWhX9RwVS8D4F/mREZoovEJma6oz44RzwOGffWyj/DNJmF+tnhvAeCI52HMY7EKtN/NxEaiHcgfD2+2ApSHAcHvgGNKVfrWL5e2mp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773151341; c=relaxed/simple;
	bh=edmDDU4cN1Ws9FOsj1VWeSrDdLhWCsAnDzCZhRGhVas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fMv3k4rDsv9+sn+mEF9CzHQ5ADB/cZlA3V5g+SuM/gYtfHi3HUNtUMJJlXKo0iSYphRtXCYFLuL9bNkdhftzsZyt21rutvFd4Ugw1qJAz1UyXD3xHafnGsz80p16A4mEzgV2YrnAnV8FXpGD1qf4Wmzi35mldWO79Yz/msI5Res=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GSe55bPC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00D6FC2BC9E;
	Tue, 10 Mar 2026 14:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773151341;
	bh=edmDDU4cN1Ws9FOsj1VWeSrDdLhWCsAnDzCZhRGhVas=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GSe55bPCDYa+ovAH+ER7/d3wXQSaf0faFiaHXuQm7GykBR0Swm0h6NF31czljzQMR
	 IRhwZTN5sSA7QMxUGpM8ekNFXozCA8GvufM0vRyzuin6rWGeiqpFywDgwibVhWYAkF
	 j/9Gydx+aADEvWUJQwbP4tmah1WJ0uFdHg5e3kvQ9vY3pLDkcHzZ7EYLE7Rhf24Cwb
	 t8OQ67qSMC9wmio4JUDqyLbzWapw68Zexg7Kgy4leMm6cPE9/EOkZ8daMhBK4E41uN
	 HILeblvuJLUOUG0OaDeGtb6di4pbBmqgc2fnWojTMfy3HRXusrc8n2LkMBWhp8CMVy
	 k8JGnvEUEHUhg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E876DEA8550;
	Tue, 10 Mar 2026 14:02:20 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Tue, 10 Mar 2026 19:32:02 +0530
Subject: [PATCH v7 4/4] misc: pci_endpoint_test: Add AER error handlers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-pci-port-reset-v7-4-9dd00ccc25ab@oss.qualcomm.com>
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
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1730;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=+inIWavtaRJNM7OF0f6BOjivOkjaJ84sX0AUbJFUxOQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpsCRqF3ko4N0ymgpexjeuogA2o6z3MOYvAQA08
 ytkZacXUEuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCabAkagAKCRBVnxHm/pHO
 9X3qB/4tpolEHvIN/p5PLjjCjCIC25XWplRB+gVV5NjJ6DN5UiiI+xjy/VzC4vwEtEfMiM+L9s3
 79nhdwb3gg4aOICVpxQ+AkP6RUfFDD19XGoYEwpqSiS/++1pN2DGrEWy/wJ4CuRPT3NZ3NGXrKe
 CTiyldjCVayhqrvNDwLOv6hlHX5HBxLif4gpZJgLSGIiBl+KSluToo/y0YGW+jarmLa1KlrqC1+
 aVwUitoWo4N5tRh49OWSASn1QOjTOHekgBOoK6r4OonXTs/hB1X8U9ZIp4+debStkJO+d0ySyVE
 6631LGw4yl7h6lX8ib6dVIJ8IpSqQ2AN24qFMgFACqX9Dyel
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Rspamd-Queue-Id: 4BAE72523DA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96695-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[google.com,linux.ibm.com,gmail.com,kernel.org,sntech.de,pengutronix.de];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:replyto,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

This Endpoint test driver doesn't need to do anything fancy in its error
handlers, but just report the correct result. This helps in making sure
that the AER recovery succeeds. Otherwise, AER recovery results in below
log:

 AER: device recovery failed

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/misc/pci_endpoint_test.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/misc/pci_endpoint_test.c b/drivers/misc/pci_endpoint_test.c
index 74ab5b5b9011..4024fd72fc66 100644
--- a/drivers/misc/pci_endpoint_test.c
+++ b/drivers/misc/pci_endpoint_test.c
@@ -1422,12 +1422,32 @@ static const struct pci_device_id pci_endpoint_test_tbl[] = {
 };
 MODULE_DEVICE_TABLE(pci, pci_endpoint_test_tbl);
 
+static pci_ers_result_t pci_endpoint_test_error_detected(struct pci_dev *pdev,
+					      pci_channel_state_t state)
+{
+	if (state == pci_channel_io_perm_failure)
+		return PCI_ERS_RESULT_DISCONNECT;
+
+	return PCI_ERS_RESULT_NEED_RESET;
+}
+
+static pci_ers_result_t pci_endpoint_test_slot_reset(struct pci_dev *pdev)
+{
+	return PCI_ERS_RESULT_RECOVERED;
+}
+
+static const struct pci_error_handlers pci_endpoint_test_err_handler = {
+	.error_detected = pci_endpoint_test_error_detected,
+	.slot_reset = pci_endpoint_test_slot_reset,
+};
+
 static struct pci_driver pci_endpoint_test_driver = {
 	.name		= DRV_MODULE_NAME,
 	.id_table	= pci_endpoint_test_tbl,
 	.probe		= pci_endpoint_test_probe,
 	.remove		= pci_endpoint_test_remove,
 	.sriov_configure = pci_sriov_configure_simple,
+	.err_handler    = &pci_endpoint_test_err_handler,
 };
 module_pci_driver(pci_endpoint_test_driver);
 

-- 
2.51.0



