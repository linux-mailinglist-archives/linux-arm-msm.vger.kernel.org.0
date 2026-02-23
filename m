Return-Path: <linux-arm-msm+bounces-93604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHjxLgkKnGn8/AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 09:04:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 661D0172E73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 09:04:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E00BE303E2FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 08:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEFF634D39B;
	Mon, 23 Feb 2026 08:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OhrghLVz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D8D34AB19;
	Mon, 23 Feb 2026 08:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771833776; cv=none; b=LcG40s09mymgY4JGbQ8+1v/+9jPu/acxyfRLYZpnjNya/0o9UG45yRZjmoqN5/iEQGJ0nN2n5v3r4DEyX7Focd8gNA8HveQcWR51OVzEM4pORz5tCcIn3EB2TR+8BDRA37eqFAHhNzJta9HE6Qu1FpKy8KFZxmJy7QLaFrO1ozY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771833776; c=relaxed/simple;
	bh=YyqeYUKRpKHURHARSOuya62ZCBi74yt3fhOSz5OKUrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G5PejJD3W/81WviCA/ntggNx9iL2tOFnhwYQ7Ev0QlDWypjEHkTLhtq5wRHXQ477U1k8JQXzEdgjiPu/rP00n2NkXCmQ2MjVlsmywisL+L1rAmEHvQhNGzVrXKtHIvjqmMOngBPpQZQsjnDlbKWbAaeKo8LPdMFAcGBKx6SPsCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OhrghLVz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D009C2BCB5;
	Mon, 23 Feb 2026 08:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771833776;
	bh=YyqeYUKRpKHURHARSOuya62ZCBi74yt3fhOSz5OKUrE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OhrghLVz+iOPrq0dusyzxZydzbqrF0iL2zCwG4FT/r/BskzIGjcXnBNs8ax95n2B6
	 xdsA3ednYes2b+pYoZS8os+LRwWrHF54GNHKFv4Fpb7lR8h2Zkf17d88KYB0W9+ETy
	 EBaRjfm3W4tvO5+Mc9E2Yi9K3nroBw3G3wljIVK8Pwo2MwAtEenOt9gt6P0khV9kLZ
	 ++FdAj1uuT4xoRsoees0pJ7QhDStvA1xNwYH3pJ2DOnfCc194Ca68+bFqeB/Zy8XHF
	 CsW6hdvxFC3Fw8JxAM3h9K/nr7Q44jj2rNCd0sVrgg2D8Xl2PBwtwm1XNxoTFkl62M
	 vnD5e4pjmfz0A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7085EE98E01;
	Mon, 23 Feb 2026 08:02:56 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 23 Feb 2026 13:32:55 +0530
Subject: [PATCH v3 4/4] scsi: ufs: ufs-qcom: Remove NULL check from
 devm_of_qcom_ice_get()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-qcom-ice-fix-v3-4-6ca5846329f7@oss.qualcomm.com>
References: <20260223-qcom-ice-fix-v3-0-6ca5846329f7@oss.qualcomm.com>
In-Reply-To: <20260223-qcom-ice-fix-v3-0-6ca5846329f7@oss.qualcomm.com>
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
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1049;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=K/orRBPrLSqNof1kmCJZCxhyo4EZ9ZRQZsR0+L1qTcE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpnAmuHMzsxDUfHs8N8ALR6oEJYQWQDnXUzVb+x
 zHhvm8YvUmJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaZwJrgAKCRBVnxHm/pHO
 9Qm9B/42Y0R3B2B04OH3iyfnwU3rtYgU6nNwsu6w+5x6t+fNt/IKcWtD6iXPwODYDWjL2KnpDmO
 7skmS+bhB/7EM89m6PruPxJcfEz11yVUNEB0F9qrt2LPy7t5s1XwHtA93iW+oqec12FipeKc6w7
 K96F8U4xCjhe/m9yRXslRG1I0iMYEa3/lkrjAP3QDZ0qSOscgPsiaEz1MlJiGL5IQJQ+7EputCP
 KMmKUV9IieOB1YMuZGPYi56cyee/P6aBWsMhoVNa6TPO8nQtIUr5pn/0biOI5TPJ8fHBr6lz5io
 GOYdiKQvJoLx6CtfEoIG408HnRx4ig+QxRaTmLuoxo6OQZTH
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93604-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
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
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 661D0172E73
X-Rspamd-Action: no action

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Now since the devm_of_qcom_ice_get() API never returns NULL, remove the
NULL check and also simplify the error handling.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 375fd24ba458..72c24ed65fe1 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -177,14 +177,14 @@ static int ufs_qcom_ice_init(struct ufs_qcom_host *host)
 	int i;
 
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
 	host->ice = ice;
 
 	/* Initialize the blk_crypto_profile */

-- 
2.51.0



