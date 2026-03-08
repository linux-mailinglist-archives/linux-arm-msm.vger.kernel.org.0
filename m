Return-Path: <linux-arm-msm+bounces-96011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BbXIPYWrWmRyAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 07:28:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 071ED22EAF8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 07:28:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A82AB302DB4F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 06:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71213290C2;
	Sun,  8 Mar 2026 06:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B3Y/acYo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99619281341;
	Sun,  8 Mar 2026 06:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772951267; cv=none; b=oDaW9nVPKFz8tQHU0HI49icR6peBHs4Y4vbpwIQfKMk7TJH93SM7CCAR/bFToc6Tu1vZ0GiLbofJ8Fs7YfeeROCTTQLrrExWt0T+wi12Lm7OMszeDfhMlb4pf6FOW/umTbOhedAATSHAYG/XRrIRyV8F47S3qyEXtJEMX5vldU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772951267; c=relaxed/simple;
	bh=fIjVtLv2PApm9p7zByR7Rq2/I5Linm9JuIiBx8Q7GZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aHcY0pRXWkQ8oTTkJHSyXRrXTG+VTY5xI871iiYVV0XQYqWxyB84ZQgqwQmPsUSEq8SOd5AKO1RrmsGSThNB9y5hjX1qEFkLYnc9aexHBzOH4Uq1zMG+IDpFP89/uNTs48Hw+jGfY2r5RnA5QaO825ezT5ZQWhqdgdeQqLk2OZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B3Y/acYo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E96AC2BCB6;
	Sun,  8 Mar 2026 06:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772951267;
	bh=fIjVtLv2PApm9p7zByR7Rq2/I5Linm9JuIiBx8Q7GZw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=B3Y/acYo2FkfD1vlElVdU28nvshBPHSo9ryLp2AiPgCFvKpdVmyvp66ARN32kfKZt
	 S04RtYub7loN0JbqCevT1dWIzW2wjDHZXx2TrmXUgJQ4duDjzpMHuClMlgff3evuPJ
	 WshNSd3icipKF2Nt30SQFjtIJwvlHOKCl5RPIdna3u9G4Y+s1aMpx3iwsooJVzXnmb
	 J7vdQQR4co9D57n/yVplbfZvr8iRZ0kP2Fvfr/QXMXHyEhZfxctOil96nhjqwEdinO
	 dbZyAKImzwRtTWC34n08W8+8IzicVKQ2VmX+HI2sLWPaG4W+j96powDaqsaBZ7wdZl
	 nHefRMcf1gxQA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 425EEF55135;
	Sun,  8 Mar 2026 06:27:47 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Sun, 08 Mar 2026 11:57:30 +0530
Subject: [PATCH v5 4/5] mmc: sdhci-msm: Remove NULL check from
 devm_of_qcom_ice_get()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260308-qcom-ice-fix-v5-4-e47e8a44b6c4@oss.qualcomm.com>
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
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1276;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=+5SkLtRpHTnkAQ9yZWBecUdG7TMHCu1aRwm2dHYl1LQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBprRbg3Cz6bK26QOY62/c6UWOBHA3aXHsClixEO
 292pI7+u2GJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaa0W4AAKCRBVnxHm/pHO
 9Y5+CAConNhiN8qSUsh6NQaEuvrKUDN7B2cOyQLAIDZCu/y3Hue1w4SlnJKseZerR3aEVbE9WYV
 p14Ec66Wf6gsOSo8gm+UIhR6hGqpKhmXNoXucwoxQ0Gz3r74R1mA+ZrsjiSJ+ZY8ZiRJ0racD32
 Vy8weiA0cO058iXLl1YWTo/BZxsixYmWJOiawvLQoEOjPhbxWNAdu6n7QfhWiU4tujB429GZp/G
 U0teMB2GDLXoYMW69uiJpes0NYOeUFPbDeeFaw55KCG9mff9wb6GqyJM5mdRgDJIB7dcS01ZNH0
 EEo1RcCA9dDewIJf2j2iI2RdkSJraHJ0xJ+yZE9ovp0a+tPE
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Rspamd-Queue-Id: 071ED22EAF8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96011-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.933];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:replyto,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Now since the devm_of_qcom_ice_get() API never returns NULL, remove the
NULL check and also simplify the error handling.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/mmc/host/sdhci-msm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 3b85233131b3..8d862079cf17 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1906,14 +1906,14 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 		return 0;
 
 	ice = devm_of_qcom_ice_get(dev);
-	if (ice == ERR_PTR(-EOPNOTSUPP)) {
+	if (IS_ERR(ice)) {
+		if (ice != ERR_PTR(-EOPNOTSUPP))
+			return PTR_ERR(ice);
+
 		dev_warn(dev, "Disabling inline encryption support\n");
-		ice = NULL;
+		return 0;
 	}
 
-	if (IS_ERR_OR_NULL(ice))
-		return PTR_ERR_OR_ZERO(ice);
-
 	if (qcom_ice_get_supported_key_type(ice) != BLK_CRYPTO_KEY_TYPE_RAW) {
 		dev_warn(dev, "Wrapped keys not supported. Disabling inline encryption support.\n");
 		return 0;

-- 
2.51.0



