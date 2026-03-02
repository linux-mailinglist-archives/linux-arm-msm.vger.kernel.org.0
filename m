Return-Path: <linux-arm-msm+bounces-94929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAAuHXKLpWmoDgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:06:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A0C1D975C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:06:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFE79305D4AB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 13:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10FCF3E5561;
	Mon,  2 Mar 2026 13:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XbNdJNdi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791C33D7D77;
	Mon,  2 Mar 2026 13:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772456437; cv=none; b=AiutG4gWSTga/h6z37UTznViXy4zm5Qhrkn9bVCGKkyVrq12c0ANQqQdNAGj81zBnF+smtyLFwVmtLSrcxBzYYNkTk58xXB1QtoQgGMQkMh/zE4sYtzqSucHMd9LaAMcWC2fLNxQycMMPRqFhzfBjCgoQmWxOy48VKO3maUB6qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772456437; c=relaxed/simple;
	bh=O7fDlZSKDKmZb20Rrkk6M869ZkmAo81YEPBE2YJr6xA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aGAHlqLwAjc0Fzi/ulp2HscQc5zMiBjCISHlTiqVJDM1JDSBLvvDG95Q2X/081KwkJLvXOgGUjdnAojZWDNERDywIGYXkOGv+xgA1h6yUSuZLCctN6ekQVS6jwAqJA1V26egEduV8i4NBjF6FVbS2vuO2kKQqzdfq27m414TtHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XbNdJNdi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3AD1DC2BCAF;
	Mon,  2 Mar 2026 13:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772456437;
	bh=O7fDlZSKDKmZb20Rrkk6M869ZkmAo81YEPBE2YJr6xA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XbNdJNdiUMo68MZebpHakqZfotmSoPPRT+XHTfhfuPI9VN/gsYLOexvmegHACcpiy
	 3DueMtvco+plrFO5BGUV1NwtDIFRQ50Tz554NgaypyZsbAZguquJpOqbP1G2l1YGGQ
	 fTPYhzRdRO7Q9A2JMVIeHELare60a7Q2U84fl8h6lDapY0Pfz1IE7imhTBfXLNr2ob
	 68Bm7GpURYCNkeU+bwLV4PwovAjEyAIYgh5YqhcHlVC2nq5VPECw2A9bbAfA4sn5Vo
	 nteYWIg7EsMy8fTQ8vRcqfizABYX9+4YFtr/TVHmXzTGi5MOtO3RS6R3axZ5XpTXiU
	 uIHGUOS5ddL4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F46E9B36F;
	Mon,  2 Mar 2026 13:00:37 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 02 Mar 2026 18:30:20 +0530
Subject: [PATCH v4 3/5] soc: qcom: ice: Return proper error codes from
 devm_of_qcom_ice_get() instead of NULL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-qcom-ice-fix-v4-3-0e65740a5dcc@oss.qualcomm.com>
References: <20260302-qcom-ice-fix-v4-0-0e65740a5dcc@oss.qualcomm.com>
In-Reply-To: <20260302-qcom-ice-fix-v4-0-0e65740a5dcc@oss.qualcomm.com>
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
 bh=wcyxYq4Tgpup9Do39u+XA9vsCKJN7lfFY2ui7J75Wis=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBppYny/cFuqyJR2X+PHP0XenRX/H7FOEDHMKcei
 WKpc2z4bluJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaaWJ8gAKCRBVnxHm/pHO
 9bM4CACpLJaBbWBLKf0lPk54F/UMS42G1MXslRbhONAQBNIv5Lyi3chLoO05X+k4Vb1FQQ4leFi
 shEZ4cPIsg4C2t/3iMUgtOsDSvHXZ3X6Z/F26wp9n59naoctuDJbeJfEqeWuouwbRHCKev78KmT
 Gf8HC+wE2HkrWzUlObWxJf5orlfbtaOoQgaNGkRxeQ+JLz613896OsmGvALchCW1yKBR/8TiD1c
 Q3sP40A1O4jlf2LqEZKFmWlrSdHCw3PQ4RCM3uwH6f01JLE14GVEQlGr2MlW9QtBQC7DLlPTXdL
 WIbmXl+RpXtvsjOSgbXKkHB2P2sOiZNWgOPjORNBmjBC4fav
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94929-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:replyto]
X-Rspamd-Queue-Id: E4A0C1D975C
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
index 833d23dc7b06..d1efc676b63c 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -561,7 +561,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
 
 	if (!qcom_scm_ice_available()) {
 		dev_warn(dev, "ICE SCM interface not found\n");
-		return NULL;
+		return ERR_PTR(-EOPNOTSUPP);
 	}
 
 	engine = devm_kzalloc(dev, sizeof(*engine), GFP_KERNEL);
@@ -643,7 +643,7 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
 	struct device_node *node __free(device_node) = of_parse_phandle(dev->of_node,
 									"qcom,ice", 0);
 	if (!node)
-		return NULL;
+		return ERR_PTR(-ENODEV);
 
 	pdev = of_find_device_by_node(node);
 	if (!pdev) {
@@ -696,8 +696,7 @@ static void devm_of_qcom_ice_put(struct device *dev, void *res)
  * phandle via 'qcom,ice' property to an ICE DT, the ICE instance will already
  * be created and so this function will return that instead.
  *
- * Return: ICE pointer on success, NULL if there is no ICE data provided by the
- * consumer or ERR_PTR() on error.
+ * Return: ICE pointer on success, ERR_PTR() on error.
  */
 struct qcom_ice *devm_of_qcom_ice_get(struct device *dev)
 {
@@ -708,7 +707,7 @@ struct qcom_ice *devm_of_qcom_ice_get(struct device *dev)
 		return ERR_PTR(-ENOMEM);
 
 	ice = of_qcom_ice_get(dev);
-	if (!IS_ERR_OR_NULL(ice)) {
+	if (!IS_ERR(ice)) {
 		*dr = ice;
 		devres_add(dev, dr);
 	} else {

-- 
2.51.0



