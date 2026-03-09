Return-Path: <linux-arm-msm+bounces-96139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIiEGb5vrmn8EAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:59:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 203B1234947
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B53E3301689F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 06:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA61636493B;
	Mon,  9 Mar 2026 06:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fv/hqH29"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2679C362151;
	Mon,  9 Mar 2026 06:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039521; cv=none; b=mGpVSDgtSKspp21Hbr2Iv+rtpTzQp42z2f95yX4irWmnnQ68hcIgu0UOlCgGnJQDsymiqYKAqLTg2M7WIvjvxnDiiXd6rVQemeJs2rnpMPBzbIdgLApvAY0s8GR27KP0ggRNtaDbvdCtpy0DtmDgTcpJhI++So4Ug8sQt244OOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039521; c=relaxed/simple;
	bh=indBVz7rXdq5AYW7l8RPQheS0qiIuzbT8aTXnf838VQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M1ZGh90KQWj4LyM27m+ubAoZOV1DAlYN8E1jeUnC6Z5M+y9CqoDWQb8dOTJBRuIC8R1SDryIX921tCHRel1qk3rhWHVQmdhfGevheSChpZJZjZrvGHP1fxRK+oqWmp5X9lrTwe86pbAj650bcFYBl8DjK2WQI2Ehntw5uKt0ljA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fv/hqH29; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE22EC2BCB2;
	Mon,  9 Mar 2026 06:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773039520;
	bh=indBVz7rXdq5AYW7l8RPQheS0qiIuzbT8aTXnf838VQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fv/hqH29yZidwTmL30oPtsUzJRxbF9LKnR7sM9CXnGDKlqM92R0xog/7ToBvhK7Yp
	 5/dMr+7bgX6/lGevXGHCXN8Tn/cL022+YqaI6xAvGYpXMr5d7F56S2LNrath+A3Ly7
	 scmAH/tTM8DsezYMKhMfOgmvxtbfD/fl5skbL8DnjJ3BoRohuQ0mX8wq502IZFfwmB
	 jSta5cubi5CcGZOFngSDp1at9cMe37gsEFNBW5yGhc6xdSE/l/ROSTUEe5mMt0IFfs
	 3xhYIZNk79Nz9ybfpF47Gh481pNbD9dbJT31Z0c5ASDz2tKVyhcJKOKnksWiIhgTP/
	 wa6ipv2LhGFrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD910EF36ED;
	Mon,  9 Mar 2026 06:58:40 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 09 Mar 2026 12:28:33 +0530
Subject: [PATCH v6 3/5] soc: qcom: ice: Return proper error codes from
 devm_of_qcom_ice_get() instead of NULL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-qcom-ice-fix-v6-3-4dd3347df530@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2044;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=MkbXnSJ6JoYE6nxF2aUf9kPMuwVhAXccbG673yyfIUw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBprm+cLbpGo2txLtdWf6oI6lYLYGjxY+PPqLg0r
 Ai7YR/zMeOJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaa5vnAAKCRBVnxHm/pHO
 9dICB/sFNSjQrvXxWKDNz1qSHELt0CYUKbjdaRM7/qCyUXVj2p53kHe5XxycOJNyH+aM55b4yaI
 5KMwm1+SLjnxvoPyZiT/d3Vd9wQhgac5wMJutMYDJMrD+hntDkkEHwJs/GcpQo7L1v4ZSqVMYln
 JYQEdirniVFbl6ZoFDHxwY1f2M2VGBualELgqqiujE+YAxV721OT45QBlbwNVrLh+u9Tqypnors
 QDI8mQETlvp8hwLZ5QHPbeS8K56TFg9XzWinhUlEwpFkyB6knG2OkVvDEBzV4BLWABN84eay6/H
 2oY79gOHBqnK/VxKDJ+72nH81bmQyj+VPfEKVNzPs+eJ97mo
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Rspamd-Queue-Id: 203B1234947
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96139-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
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
	NEURAL_HAM(-0.00)[-0.931];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:replyto,oss.qualcomm.com:mid,qualcomm.com:email]
X-Rspamd-Action: no action

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

devm_of_qcom_ice_get() currently returns NULL if ICE SCM is not available
or "qcom,ice" property is not found in DT. But this confuses the clients
since NULL doesn't convey the reason for failure. So return proper error
codes instead of NULL.

Reported-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index 85deb9ea4a68..2b592aa42941 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -563,7 +563,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
 
 	if (!qcom_scm_ice_available()) {
 		dev_warn(dev, "ICE SCM interface not found\n");
-		return NULL;
+		return ERR_PTR(-EOPNOTSUPP);
 	}
 
 	engine = devm_kzalloc(dev, sizeof(*engine), GFP_KERNEL);
@@ -645,7 +645,7 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
 	struct device_node *node __free(device_node) = of_parse_phandle(dev->of_node,
 									"qcom,ice", 0);
 	if (!node)
-		return NULL;
+		return ERR_PTR(-ENODEV);
 
 	pdev = of_find_device_by_node(node);
 	if (!pdev) {
@@ -698,8 +698,7 @@ static void devm_of_qcom_ice_put(struct device *dev, void *res)
  * phandle via 'qcom,ice' property to an ICE DT, the ICE instance will already
  * be created and so this function will return that instead.
  *
- * Return: ICE pointer on success, NULL if there is no ICE data provided by the
- * consumer or ERR_PTR() on error.
+ * Return: ICE pointer on success, ERR_PTR() on error.
  */
 struct qcom_ice *devm_of_qcom_ice_get(struct device *dev)
 {
@@ -710,7 +709,7 @@ struct qcom_ice *devm_of_qcom_ice_get(struct device *dev)
 		return ERR_PTR(-ENOMEM);
 
 	ice = of_qcom_ice_get(dev);
-	if (!IS_ERR_OR_NULL(ice)) {
+	if (!IS_ERR(ice)) {
 		*dr = ice;
 		devres_add(dev, dr);
 	} else {

-- 
2.51.0



