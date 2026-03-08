Return-Path: <linux-arm-msm+bounces-96009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEV2APEWrWmRyAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 07:28:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA7522EAE8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 07:28:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11549301AD35
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 06:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD053128D4;
	Sun,  8 Mar 2026 06:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XjpqyhmW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B17254B19;
	Sun,  8 Mar 2026 06:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772951267; cv=none; b=QOv1W+QPkVQiR3YLIpOPBUjRRbWbCTTAE1lImcwMmRdQWKVncv+ZIa1z977AhTbiZxiv+gNwStwO/2qP8I5x+nAQ5W7oJ1Khuw6XSMmMMM3ulJ8ptndD2oIKBxd1Td13FBZCedpGLamQjRP/HNw3ZG087a+3v/aYC2BXu2Hi2J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772951267; c=relaxed/simple;
	bh=0UKxxiZfM0kQax41QXFKMk/OoypvkFiAYGIhYtQPXLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YwGCxdTunbrojzplw5vDaAbj5VkJWT0qv9jOpfcaGtdHKTWYdG5Fos9MszdP/VKwpji2smF2crQy1QDXceyMsJH3Pske4Rqx/YL5tsSnnBJ/BuZjdE2H2hcyaAMzjPEXA7ZzZ5H8t0PBnX66LgENhvK2KrA5lLVOOuWWpSLMvvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XjpqyhmW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 373EBC2BC87;
	Sun,  8 Mar 2026 06:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772951267;
	bh=0UKxxiZfM0kQax41QXFKMk/OoypvkFiAYGIhYtQPXLE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XjpqyhmWnP7z0kLrAlcsHM0xZdXU9GL4MN/4IEO646NQGcJ3+Ih0XlX89xKbVZnb4
	 MowNLIVEo1zymT90lpIAZ5NmQBIBRPr/hsuKn6W2dFpC8U59q7be6QgIvgf3oNZZ4g
	 fY3n9p7yN2jpJQ6VyPPvsd4pMzRHxDbtt3LZ/S3lSUkvEQ8rSyZPjAeM0h988/E2qd
	 YhjYGSmM3r51T6a7gnr9073xORA+Ojd0dgxH46ZUUMw3f91nQWx5Zza0/XzcHr2dy6
	 S9Dongz0Dkh5doNk9qr8HT7JWFs5ggBNy70eMaa5+22XL4fuIZludPztcR4QjEwkMD
	 X6NSIty2nBhbg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23537F55132;
	Sun,  8 Mar 2026 06:27:47 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Sun, 08 Mar 2026 11:57:28 +0530
Subject: [PATCH v5 2/5] soc: qcom: ice: Return -ENODEV if the ICE platform
 device is not found
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260308-qcom-ice-fix-v5-2-e47e8a44b6c4@oss.qualcomm.com>
References: <20260308-qcom-ice-fix-v5-0-e47e8a44b6c4@oss.qualcomm.com>
In-Reply-To: <20260308-qcom-ice-fix-v5-0-e47e8a44b6c4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Abel Vesa <abelvesa@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 Sumit Garg <sumit.garg@oss.qualcomm.com>, mani@kernel.org, 
 Neeraj Soni <neeraj.soni@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1019;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=qK8flUkY0AriLSe7KcyTU7F/qyhSLO0EesRORdT3ebw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBprRbgpEihdBq/VekYMOVpYQpxR2dndsZ0jfLVc
 f/e3W4jLH6JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaa0W4AAKCRBVnxHm/pHO
 9TeLCACNEQZO5ZWO2YQTSc4uFt1AiK9S4awX4aq1UZie2nSbEgl8Ip/AleqS9vFyBx3RJhaiZxR
 EZtqRzRakfe2Xvzes7MZqM1HB4qTiDXAJrG6znGrX3EfaVIDQGciyqw9MWB6W9JjK/DNEgi1qzx
 TtfNaPUxRRtY2noVeZCLO3cf6spd1/kkDo4WUjJxR8o5h6vLEmxuiTpXfAzokdPtzifK3CyEQ1y
 ePIm1HjLIP7d77xbnL1+ypVQAgizz12mrRLNqRZPnrUyrpbh8SA+g71nCAeZQPhXpqP2i0bcanp
 vNjsqTYHh839x9inqvexMrbyZW66SzZ+sbcjLSxM71pZlufD
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Rspamd-Queue-Id: 9CA7522EAE8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96009-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.934];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:replyto,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

By the time the consumer driver calls devm_of_qcom_ice_get(), all the
platform devices for ICE nodes would've been created by
of_platform_default_populate().

So for the absence of any platform device, -ENODEV should not returned, not
-EPROBE_DEFER.

Fixes: 2afbf43a4aec ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index 50da5a3e8073..6fde282584d0 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -650,7 +650,7 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
 	pdev = of_find_device_by_node(node);
 	if (!pdev) {
 		dev_err(dev, "Cannot find device node %s\n", node->name);
-		return ERR_PTR(-EPROBE_DEFER);
+		return ERR_PTR(-ENODEV);
 	}
 
 	ice = xa_load(&ice_handles, pdev->dev.of_node->phandle);

-- 
2.51.0



