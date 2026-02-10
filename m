Return-Path: <linux-arm-msm+bounces-92413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NezJOXWimnrOAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 07:57:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E779011790F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 07:57:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CFE4303982C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 06:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECCD432E745;
	Tue, 10 Feb 2026 06:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cHZdIWYw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0512F3618;
	Tue, 10 Feb 2026 06:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770706618; cv=none; b=odDMlqJ+zvLEA723qh1ZZwTbhm16Yox3L4BHmuISYAC8AbTaeHZ3tskf9NoLHy0G5X1YWo7BmZCMZA6iiHnktxzDxyvB3+wTmzbTNrLnulUqeyojM0uhHYZJKk9r91V9OicOyBlz4hX12M7CiKi5bE5vKL+bQMxiMnYu7/kraOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770706618; c=relaxed/simple;
	bh=U91t0kFHPzGEKPnhTW3rHjasrA7cECKpz8gy7FXoBwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CdYo5v3ZQthFqL+xH5CN9caUvFfnva6/ri0iBYghtV8a4NCSbFrs6BgicdO9WE9kVQ6VafgLKNa35TdRtED84CK3MIye7fyX0G8y2VARG+PCUdUX7BWwSU6zgbqs2m5RGIWJ32LLtEZIrGOpa1pd6UlbOxoIyjOggOV2/N2Vh9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cHZdIWYw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97FA8C19424;
	Tue, 10 Feb 2026 06:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770706618;
	bh=U91t0kFHPzGEKPnhTW3rHjasrA7cECKpz8gy7FXoBwk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cHZdIWYwy1dAubQBzr6Vl2WkcrlWeLkm6vf7RqTdhgUm0kqBmSVnXiEq14YiU0ANZ
	 4d9gcxGLN4566t0bOJdVNam/jL3R26GmhWNQ+SdLsfnwd97cvl217NJnoBSTTJXv+M
	 Jchl/DJctdndILhwcJ28533OnBus1QlxHFySLFmc0HXl+gwumBNhAcMcAhOgCjimMO
	 0pgO/y3VjUJkXBAcPhyN1yBvt6FozUEWbEHICegGX5skt1UaAZlWd0td9Kc64KgzK1
	 eMtnSNU9euMMKP5xOP+Qzwjf66+LStNplBBjcx7C4XabgP8eamRyiNeH3J9DzusxXY
	 IRN/eRAklNvNw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D4B4EA3F13;
	Tue, 10 Feb 2026 06:56:58 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Tue, 10 Feb 2026 12:26:51 +0530
Subject: [PATCH v2 2/4] soc: qcom: ice: Return proper error codes from
 devm_of_qcom_ice_get() instead of NULL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-qcom-ice-fix-v2-2-9c1ab5d6502c@oss.qualcomm.com>
References: <20260210-qcom-ice-fix-v2-0-9c1ab5d6502c@oss.qualcomm.com>
In-Reply-To: <20260210-qcom-ice-fix-v2-0-9c1ab5d6502c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 Sumit Garg <sumit.garg@oss.qualcomm.com>, mani@kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1991;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=R3ti+Do4o2blOWOwxCpVWH7G3OaIyEGRpXFXfGBMGwo=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpita4hjQe5fQN8fLFldr783St9cfJQ2pKAom0u
 BxfbrQuiKyJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaYrWuAAKCRBVnxHm/pHO
 9bSNB/9Ys1wwQndfMoM+YNJqTzJ0bBhbgtGkAXjt+CgID8ZLWfGL3duLhuG7Eif4zs1MN/B7fVP
 jxPKfkL/Z5gcKtKrgO3+gIpHMaAPavMGsUiLMlacyTvB7B1ZldnzAaZ6/4YlqaBRPt+zFcRk714
 t2ciDbjvCblFyxZBTIhhFHOTj2zUusCymuP9UVgdCN7oOM/+sd9dmgg/kHl29pONtAiKANf/FuF
 BQXl6JAo1xnhvl4L/eKjZM8kkByA2qGJ7NEoW8TMq9suF16s5GJ64mwEJVgKg8wld3QN9DrAk6+
 a5d34SRNXnxOHQiV6Kp92AUcILXELkiHWJaqqvq4HP18xsAX
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92413-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: E779011790F
X-Rspamd-Action: no action

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

devm_of_qcom_ice_get() currently returns NULL if ICE SCM is not available or
"qcom,ice" property is not found in DT. But this confuses the clients since
NULL doesn't convey the reason for failure. So return proper error codes
instead of NULL.

Reported-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index 8e25609c7e7b..498cb0e0d1e4 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -563,7 +563,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
 
 	if (!qcom_scm_ice_available()) {
 		dev_warn(dev, "ICE SCM interface not found\n");
-		return NULL;
+		return ERR_PTR(-EOPNOTSUPP);
 	}
 
 	engine = devm_kzalloc(dev, sizeof(*engine), GFP_KERNEL);
@@ -641,7 +641,7 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
 	struct device_node *node __free(device_node) = of_parse_phandle(dev->of_node,
 									"qcom,ice", 0);
 	if (!node)
-		return NULL;
+		return ERR_PTR(-ENODEV);
 
 	pdev = of_find_device_by_node(node);
 	if (!pdev) {
@@ -697,8 +697,7 @@ static void devm_of_qcom_ice_put(struct device *dev, void *res)
  * Devres automatically decrements the refcount when consumer device gets
  * destroyed and frees the ICE instance when the last consumer goes away.
  *
- * Return: ICE pointer on success, NULL if there is no ICE data provided by the
- * consumer or ERR_PTR() on error.
+ * Return: ICE pointer on success, ERR_PTR() on error.
  */
 struct qcom_ice *devm_of_qcom_ice_get(struct device *dev)
 {
@@ -709,7 +708,7 @@ struct qcom_ice *devm_of_qcom_ice_get(struct device *dev)
 		return ERR_PTR(-ENOMEM);
 
 	ice = of_qcom_ice_get(dev);
-	if (!IS_ERR_OR_NULL(ice)) {
+	if (!IS_ERR(ice)) {
 		*dr = ice;
 		devres_add(dev, dr);
 	} else {

-- 
2.51.0



