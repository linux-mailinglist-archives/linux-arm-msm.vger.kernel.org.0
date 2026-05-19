Return-Path: <linux-arm-msm+bounces-108423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPJJLYYnDGrLXgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:04:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E29C57AD74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 426FA30A0B10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58BC33F0AB3;
	Tue, 19 May 2026 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mlgTz6H5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E62A3F074E;
	Tue, 19 May 2026 08:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180964; cv=none; b=hxYKwQQCrOi19q4SaRbjxwI9b/eYClTyTifwZslxJBBpsICIGpsFmEgIiecs/1qgYHfeF5KCgkRd2vkC9ZIZZjUQBL0l7gAHu+cnYke6yG8g/aHYS9l1dN8tk49AY2PqRahul1FWjDR+LKtejdOorlLzCZO84/+A0/scuwKl/Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180964; c=relaxed/simple;
	bh=68YoT9izcfzey+OgMqPDjVvXKz4xAyWjFsIlXdXFMQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q8GWylamsivrzTE/hwlIwv+WyGhohtahZJVtoEywP1TbiJ+PTd0IFF2qd1Z2vqoDsfzZgxcJGk5899OTaUKPLKyZaw6+xx5z3WsgtHPckkYPBd9QfkxdPAh+0VRrvORIdTf6B3o2NSoMcrpTDAN757STZj6SVzJrjYASWJdhhQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mlgTz6H5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0C82C2BCC9;
	Tue, 19 May 2026 08:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779180963;
	bh=68YoT9izcfzey+OgMqPDjVvXKz4xAyWjFsIlXdXFMQQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mlgTz6H5Z6kMIo+tPhToU7vONrv2MCBbABQU8JOYo9Mkk/zhz9oT9x3oVA9IGQzSH
	 uGcx6KYFnh937s119LToQZlfaQWaa3UeIaG+IHur9+32rsm2tyvBoTCa3nlJd61PAn
	 Y+9vb3iSvP0ycbNMoL5gAFIFwuDoFJbJhT/d71la4CIVFPFqw8YrEXuflbW7q5/LwJ
	 zmKx+qASfzBxqNNXIDfQoYEAxXreUlsAHrGeipiboAnghosZJ7z7lU/NbR/Xt4Fl7q
	 hmGMYohZ/vvkxo9E4POOFzfd2vy34P1x2f/Jl41R2+/XvK1QPsAzixikpJUdgd85oK
	 U/uW8hxCcgJwA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1135CD4F57;
	Tue, 19 May 2026 08:56:03 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Tue, 19 May 2026 14:25:56 +0530
Subject: [PATCH v3 1/9] power: sequencing: pcie-m2: Fix inconsistent
 function prefixes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-pwrseq-m2-bt-v3-1-b39dc2ae3966@oss.qualcomm.com>
References: <20260519-pwrseq-m2-bt-v3-0-b39dc2ae3966@oss.qualcomm.com>
In-Reply-To: <20260519-pwrseq-m2-bt-v3-0-b39dc2ae3966@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2082;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=OzSOLSJTM2+lHbh50xUinPK/5SSZvR5hJw0X+Sc++Us=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqDCWdWD0JU00zP67qaszIZN42Iep5F+fvGO6XT
 cdm4VJ7Ge2JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCagwlnQAKCRBVnxHm/pHO
 9cezCACnXoJ/9spLcDtcdWp966CMw/XJM1luSmhRbMKjaiiZiAjXTi9Go3i2gCmHzI0Hb70Wo5j
 tYbSLlXPN5HFozEDa50H/qmMqlcrK8QcKaFTSUmx7WtRIgjwH58ev+UqTk4LssB1vRlpSlHectu
 aEtRlBKRRjarGMymg0o039C5dsvc8UXEZPLYxfKLCIR/JdgZxXi/jv1p8lvjf4LQsolcZRmqtTd
 3BALu5S9xP7xppdeBIs3Us6pJTFJAwgK9vW3qYATBto+BOO+wXnCMOGRM+j/CgUBZFXa3qlfomN
 kykXs/xKsQssVwXadmbya9Tv08wBgp7xPa9OLA2ah+VhN/So
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108423-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:replyto]
X-Rspamd-Queue-Id: 4E29C57AD74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

All functions in this driver follow 'pwrseq_pcie_m2' prefix except a few.
Fix them to avoid inconsistency.

Tested-by: Wei Deng <wei.deng@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index ef69ae268059..b2ed336fd5ad 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -177,7 +177,7 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
 	return PWRSEQ_NO_MATCH;
 }
 
-static int pwrseq_m2_pcie_create_bt_node(struct pwrseq_pcie_m2_ctx *ctx,
+static int pwrseq_pcie_m2_create_bt_node(struct pwrseq_pcie_m2_ctx *ctx,
 					struct device_node *parent)
 {
 	struct device *dev = ctx->dev;
@@ -254,7 +254,7 @@ static int pwrseq_pcie_m2_create_serdev(struct pwrseq_pcie_m2_ctx *ctx)
 		goto err_put_ctrl;
 	}
 
-	ret = pwrseq_m2_pcie_create_bt_node(ctx, serdev_parent);
+	ret = pwrseq_pcie_m2_create_bt_node(ctx, serdev_parent);
 	if (ret)
 		goto err_free_serdev;
 
@@ -299,7 +299,7 @@ static void pwrseq_pcie_m2_remove_serdev(struct pwrseq_pcie_m2_ctx *ctx)
 	}
 }
 
-static int pwrseq_m2_pcie_notify(struct notifier_block *nb, unsigned long action,
+static int pwrseq_pcie_m2_notify(struct notifier_block *nb, unsigned long action,
 			      void *data)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = container_of(nb, struct pwrseq_pcie_m2_ctx, nb);
@@ -364,7 +364,7 @@ static int pwrseq_pcie_m2_register_notifier(struct pwrseq_pcie_m2_ctx *ctx, stru
 	if (pwrseq_pcie_m2_check_remote_node(dev, 3, 0, "serial")) {
 		if (pwrseq_pcie_m2_check_remote_node(dev, 0, 0, "pcie")) {
 			ctx->dev = dev;
-			ctx->nb.notifier_call = pwrseq_m2_pcie_notify;
+			ctx->nb.notifier_call = pwrseq_pcie_m2_notify;
 			ret = bus_register_notifier(&pci_bus_type, &ctx->nb);
 			if (ret)
 				return dev_err_probe(dev, ret,

-- 
2.48.1



