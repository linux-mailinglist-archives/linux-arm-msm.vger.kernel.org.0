Return-Path: <linux-arm-msm+bounces-21993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB00E8FF519
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 21:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53433289223
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 19:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9B144C68;
	Thu,  6 Jun 2024 19:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="6AWs8Y5f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA90FC13C;
	Thu,  6 Jun 2024 19:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717700525; cv=none; b=tHHOYpzvKtNSKPpuwSdzpUCYgtXFPccmoP60SsWEOAt1qoMvhNZ5gUxOktdvYxajyZbeaaQi9iwNDC9EMoU3n4yJVfjY/R+G8bmmhRK83Jyb5MeCHLmqgMEgfFh6EHmfYgioxwDyb3NijRce7e0yVWQ/tOwJtzqSlLdwqzVA53g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717700525; c=relaxed/simple;
	bh=dLOTe0zOfFf2wx2GkwFTCa1WlboZXkpBx3ZTdW9qpb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WIUIDLzxwEtw2N+Ui1vkOn7WFl6I+yuGUwrBj3mLdvl+fDJxSHdq42NG70xYxL1Nualiy8jnuEwXHi+Z2qKV3APNvX1XO+xMDOGG/QqbNL6NMBt1x1SvD0hygW3wEb7gURsEyrWtpBCszASuqzPBmNjBNu6OOP45ttsLLbbilt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=z3ntu.xyz; spf=pass smtp.mailfrom=z3ntu.xyz; dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b=6AWs8Y5f; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=z3ntu.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=z3ntu.xyz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
	t=1717700516; bh=dLOTe0zOfFf2wx2GkwFTCa1WlboZXkpBx3ZTdW9qpb0=;
	h=From:Date:Subject:To:Cc;
	b=6AWs8Y5fFaVUOI9E3xqm++CeJkqm2Lr9Fioz8q0o7WiJTGvuJoRC5uiaR5lahQkL+
	 Fo8WS5j8UQCIbvtB66dojdsg+Mrb9BYoDQINvgeAo5uwY6mvW/zrY9ggwu4W6vogen
	 6vmEtrJtW7rDWEE8zdhi59lNLx/luGbydSPKuE1k=
From: Luca Weiss <luca@z3ntu.xyz>
Date: Thu, 06 Jun 2024 21:01:36 +0200
Subject: [PATCH v2] rpmsg: qcom_smd: Improve error handling for
 qcom_smd_parse_edge
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-apcs-mboxes-v2-1-41b9e91effb6@z3ntu.xyz>
X-B4-Tracking: v=1; b=H4sIAI8HYmYC/1XMSw7CIBSF4a00dyyGt4kj99F0AHi1DKQNVELbs
 HexiQOH/0nOt0PC6DHBtdshYvbJT6EFP3XgRhOeSPy9NXDKJZVcEDO7RF52KpgI44jaUWaUFdA
 ec8SHL4fWD61Hn5Yprgee2Xf9OfLPyYxQopXSTl6cVZTdNhGW97msGwy11g/4NvzIpgAAAA==
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca@z3ntu.xyz>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2126; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=dLOTe0zOfFf2wx2GkwFTCa1WlboZXkpBx3ZTdW9qpb0=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBmYgeTBV2CHlVz8nTGb2PKIdfgFUnhX3hXJ9DWr
 mqDvptT3qeJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZmIHkwAKCRBy2EO4nU3X
 VtX2D/0XsWEsql04EZT3rb2O7Nc8FqfwJRRLnuNymbfypuBcK90667hlJOp2V0vbWR6ClcU4RD/
 FdnvGd3py5D1fTPQEY8fX58tSiZFZfVkXdKZzkeEi8YxqZ173luZ+C5RKYYHCPRHywKUohhL5MK
 v1SwGoLV7ptmURAvJwxqGa7Ls/SeS0lIEQwT78MgaVj3uG0EGDeDVFnYYNBPHmdNFtB4x55Ve8J
 GHzsWewFeYBN7DGUDnrh1tiQ92sD6i4fmum8oH2xvts3nMMDsmUaY2OWbURnIvIg70dcAtmMXBg
 M1oh2Ou68Vz58qRHA4oKZ2+Zk67RntBBUcKvrYc2+CBUi0MCQZcLWcESYr+BQaKYosKapnAcvy+
 fOdHN2RkbwImB1C9YRqiA7kB5vrSCRQuJkcTOGfvkDgAl+SmTfILMdANJ6VZdEz7IiVZryBM8WC
 w1ZNWcoJtn0YG7rgJcJxFnZhkNFIJpYCHJ5AuTyUlV2kb78fdl2/0+E0Wp8zr+OsVkrJ6NvVK9E
 kerlfGBpuOWK6AU+JwXlrcSZ+CYmMQ6U1mCLUZkEnCY4BAeycmdjpdmYdkGpvCbdYwxLEFknAsF
 yo976zIPpSxU2K07Y96+gTjDg03sa3Q4qyKFDES8mYOjabuVHEnTzuFJi19NvqK0TgQmrmyAc0+
 cneUVpd95Z8csjg==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

When the mailbox driver has not probed yet, the error message "failed to
parse smd edge" is just going to confuse users, so improve the error
prints a bit.

Cover the last remaining exits from qcom_smd_parse_edge with proper
error prints, especially the one for the mbox_chan deserved
dev_err_probe to handle EPROBE_DEFER nicely. And add one for ipc_regmap
also to be complete.

With this done, we can remove the outer print completely.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Changes in v2:
- Rebase on qcom for-next, drop dts patches which have been applied
- Improve error printing situation (Bjorn)
- Link to v1: https://lore.kernel.org/r/20240424-apcs-mboxes-v1-0-6556c47cb501@z3ntu.xyz
---
 drivers/rpmsg/qcom_smd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 43f601c84b4f..06e6ba653ea1 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1369,7 +1369,8 @@ static int qcom_smd_parse_edge(struct device *dev,
 	edge->mbox_chan = mbox_request_channel(&edge->mbox_client, 0);
 	if (IS_ERR(edge->mbox_chan)) {
 		if (PTR_ERR(edge->mbox_chan) != -ENODEV) {
-			ret = PTR_ERR(edge->mbox_chan);
+			ret = dev_err_probe(dev, PTR_ERR(edge->mbox_chan),
+					    "failed to acquire IPC mailbox\n");
 			goto put_node;
 		}
 
@@ -1386,6 +1387,7 @@ static int qcom_smd_parse_edge(struct device *dev,
 		of_node_put(syscon_np);
 		if (IS_ERR(edge->ipc_regmap)) {
 			ret = PTR_ERR(edge->ipc_regmap);
+			dev_err(dev, "failed to get regmap from syscon: %d\n", ret);
 			goto put_node;
 		}
 
@@ -1501,10 +1503,8 @@ struct qcom_smd_edge *qcom_smd_register_edge(struct device *parent,
 	}
 
 	ret = qcom_smd_parse_edge(&edge->dev, node, edge);
-	if (ret) {
-		dev_err(&edge->dev, "failed to parse smd edge\n");
+	if (ret)
 		goto unregister_dev;
-	}
 
 	ret = qcom_smd_create_chrdev(edge);
 	if (ret) {

---
base-commit: 2c79712cc83b172ce26c3086ced1c1fae087d8fb
change-id: 20240423-apcs-mboxes-12ee6c01a5b3

Best regards,
-- 
Luca Weiss <luca@z3ntu.xyz>


