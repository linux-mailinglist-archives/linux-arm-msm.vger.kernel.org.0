Return-Path: <linux-arm-msm+bounces-96137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AzIHq1vrmn8EAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:58:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E70F1234913
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:58:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA9BC3017271
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 06:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3063B3630AC;
	Mon,  9 Mar 2026 06:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fxq+GFGV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098D22EA754;
	Mon,  9 Mar 2026 06:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039521; cv=none; b=L0Lg0FCPn0snrq8il5nH/LpbeNePnUe0zDiePoGudUiQ9zQBmc6UNPvqK2b+GUM2itgRLrE3WWpRFM17dHo/HHeAt6tc/XHwbWJ6uSmq0eF3iv9VOlPM4j3pwl421cXXFgfeifpV1R+FF7i3PrxGYkSrowdO9hJOrt9ctxuAOMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039521; c=relaxed/simple;
	bh=fIjVtLv2PApm9p7zByR7Rq2/I5Linm9JuIiBx8Q7GZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=braVnpRtp0cd0IMmxAj+aFpOrx1ZjV76HG3j7y9xW9uhx1BZaICT0JqJb6IeIrHJ5VvRRzmtzJubdJQRqaQ/rpnpqd3DyoKCABY3tr8uKOr8fQ82j0T8Fx7OhUncJRDSi28nM+5YYmjitXE/sYhng91BJzj8i3aPXtYXF8jzQus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fxq+GFGV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C81BEC2BCB7;
	Mon,  9 Mar 2026 06:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773039520;
	bh=fIjVtLv2PApm9p7zByR7Rq2/I5Linm9JuIiBx8Q7GZw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fxq+GFGVMf5HzkaoM6WBQPw9A6Weqxek13CcQz9iIB8rNEzEzup1CUcQJwv1QQQXH
	 cMJnoD0xEMNUsM4Kh9+S8wlZBmn1+nZBmEFv3Ng8C/n/jw/if+mB1d+6MtM2HQ2/3J
	 a2xGCFSFcgtqYtxMcvndVpdozLyyh1A/jkn6tSudCC93gkVb0zNSfDljUa1tdHNbdT
	 Zpy2vgL6kLP6NzI95ZFKBld2iT5r8x14e2y7BFGMhvLyBLOnqM7Qm2fa05lPZpS845
	 Wnw0T2wr1xnjKI5S20S/5jF7X2uH5kIRWYOYBtEpyLHhac+B/tyadH7MLVYAhRXNuC
	 e8MFKlfwG913w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC9DEF36EC;
	Mon,  9 Mar 2026 06:58:40 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 09 Mar 2026 12:28:34 +0530
Subject: [PATCH v6 4/5] mmc: sdhci-msm: Remove NULL check from
 devm_of_qcom_ice_get()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-qcom-ice-fix-v6-4-4dd3347df530@oss.qualcomm.com>
References: <20260309-qcom-ice-fix-v6-0-4dd3347df530@oss.qualcomm.com>
In-Reply-To: <20260309-qcom-ice-fix-v6-0-4dd3347df530@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBprm+cxSFJKAT3tpQEkmozGp9einIfyo8LyYDAp
 EL94vuno0qJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaa5vnAAKCRBVnxHm/pHO
 9dVmB/9xzkZqg3JdQqo0aNv68bGvjpIh88CokEd8juqUVKVwgy6z1x7gfWjhDfg0M/oPchQctac
 +juVr87XtrLLM3rrJAAvhxncqQQXMj3VtLSCZ3v9Uc9FUVNPB+uEK4xcVDJotL9JyYBPBN606sK
 vMJFOBZv69AiLs867NHlbgV3ivxQngHKWaGkygZ7DRjVmuBVNCzItYksNrLC6/DeAu6BzQFU8uM
 ck++vUu+Nsy5l61b6s+1nvNON9/Gg4Xtl1tlvrH3NoyC7WzInYlpex7Xn7R1wChev9y9T/++XAz
 ACPF+Ue0g+fMTpZ/mYcPmTGXJ6mTbHo8ukgyiKk9AedREbny
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Rspamd-Queue-Id: E70F1234913
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96137-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
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
	NEURAL_HAM(-0.00)[-0.928];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:replyto,oss.qualcomm.com:mid,linaro.org:email,qualcomm.com:email,intel.com:email]
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



