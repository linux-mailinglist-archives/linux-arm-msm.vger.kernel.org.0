Return-Path: <linux-arm-msm+bounces-106476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJgfGaq5/Gl2TAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 18:11:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC52F4EBEA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 18:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E878307CDC7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 16:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657F643E9FF;
	Thu,  7 May 2026 16:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Har/HBkR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402A33ED104;
	Thu,  7 May 2026 16:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169978; cv=none; b=h4GrpwR9mhlZllDrPU3yEZjEAcaczoDLo01zGbZ/KACVbE8cumIgJk9fRfrR53jXkldLWwnIr1qBv+TLGiCw7PANhLUkj9y0I+ucPsV767BNNzBJPCYaJmvofXOB+itVktCGjALi5/BMKXy8/IMh6Bllnt5fINAa//MFOTr/c1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169978; c=relaxed/simple;
	bh=zGHrjUbTsBJODVwJt0zPGcwNmFYKbjrI5btim8cwJxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IKYcGe8Hmvhzhk33vwLfz1FpWnLxqnNboocDOjwc+LluAreea9rKiOmWUyNjBbaMCsMAdAWTWYi+ZGc+gtjGMBlKmqZrjwwZ9Mg9DsSdrOQ0Agd/7dlNOv0vVonbdfvqDAMBHj97Q97nAXb44KUI+j4Y4dYVwVZjYsY/X0+4JD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Har/HBkR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3FD1C2BCB2;
	Thu,  7 May 2026 16:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778169978;
	bh=zGHrjUbTsBJODVwJt0zPGcwNmFYKbjrI5btim8cwJxA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Har/HBkRX7QzEqAwXxRMNulHINL7H1TAOMlOAQdNqkzRK4EyaZJZFGOXZluqarP/Z
	 ogAsaOfi+J68l+ffS0o/5c1uSJf9se41t/yBmgIeyhtn7dn+jIxI6rsAHC05hzIgiu
	 BRrWi83m8UbaGGHimMXBUndbdbMRDXhZwDCqRmJteJSIBjBIeE3PLQ9ifx4vvJ6YKY
	 25bfaJCK10032zNZPH2h7Jd1lnmA1E3umNY76EdIN44ru238BiLWG6YHg+IG0qoWin
	 PAS5L371/eaKNC7RcOP+U4pTfsIzu0Z9guRdwW9BLwrNaVvVdK08x8b19nFaM8sY9J
	 RkSUPxkaAD/Qw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5997CD3442;
	Thu,  7 May 2026 16:06:17 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Thu, 07 May 2026 21:36:09 +0530
Subject: [PATCH v2 1/9] power: sequencing: pcie-m2: Fix inconsistent
 function prefixes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-pwrseq-m2-bt-v2-1-1740bd478539@oss.qualcomm.com>
References: <20260507-pwrseq-m2-bt-v2-0-1740bd478539@oss.qualcomm.com>
In-Reply-To: <20260507-pwrseq-m2-bt-v2-0-1740bd478539@oss.qualcomm.com>
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
 bh=Uc7cveSGHgeTaUIcgh89hECpJqoA4JfjoqnuyhFDQqg=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBp/Lh2LT2yjjAir33NLBnHxeeoubmgYStCcAq9M
 xXXFJ3vkVqJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCafy4dgAKCRBVnxHm/pHO
 9YQpCACbSKaEjzH4pTRNlOO9MMv4qGNFvDJbCSKU+rW0kuy1AOdzEK8DRjMYSniR3vacNqgAaW7
 jfdD3nhST6J/Rnf9+jev5SQpRAkKinqaxWh3/1fShDsrtFUvB1F3jwhMJlzRr8YGNtSd2tdfDiF
 dFxAGaP52L1gOiOsWOlhNYxfiVDVsMcr5nZ9nK5CztsGDPpOA2s4/Pxqi9TgU/bVFHMVN6EFp+p
 LfzPkrfYv23hVFoB2h+b2zu7McFmTkz4ghpi3o5nxCP/Rp+2I6P67dQdDdgUiJOLvSRQr11o1mP
 zUCGoHRa1Ex6V0kwn8pQwiMpDRpYEsmiDHurAlsVIiwooNOh
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Rspamd-Queue-Id: DC52F4EBEA2
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
	TAGGED_FROM(0.00)[bounces-106476-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com]
X-Rspamd-Action: no action

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

All functions in this driver follow 'pwrseq_pcie_m2' prefix except a few.
Fix them to avoid inconsistency.

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
2.51.0



