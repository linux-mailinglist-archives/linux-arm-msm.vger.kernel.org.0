Return-Path: <linux-arm-msm+bounces-52555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A3EA71E2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 19:19:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0BB03A403B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 18:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F17124EF81;
	Wed, 26 Mar 2025 18:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="ZoVD5wBG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A3582D98;
	Wed, 26 Mar 2025 18:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743013098; cv=none; b=RwPNS4XAL5DlqwvpzCRasRZ0hPeigX2JyCMIA2FTw6DRVY4rnvXBOMnCFKpvwospDSIgGXnr1iOvdt+FKRRavEcQgb8/Fo+kKsfCB6svhWF8mX+Yd1ksBuUrpPsGzQUbe1MehHyboB72ANVzNyHPfWl6IwoM6UkcADNiMd+4kKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743013098; c=relaxed/simple;
	bh=OjPr7Ip23T18evhoNwNXNFsyhpBrB+kLX/JvPys7vEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gEBsr+/ZgeVugkdXvB0Es0vRz3uI7AhmHXpDvEC1jgc+fAT8PvNa1mOHASDVmxbfMtefPl6xm9hisyBaG3rhRa0txHITxS+RgKZdWmeRpz41M9fs2zBOkdpaxDN5ttFMOBwEtMtYcsfa8M3O0xcsrRNVkOAMhWeJpDKiEE4R9yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=ZoVD5wBG; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1743012596; bh=OjPr7Ip23T18evhoNwNXNFsyhpBrB+kLX/JvPys7vEc=;
	h=From:Date:Subject:To:Cc;
	b=ZoVD5wBGvk1Giun7Jk54yr2ZB5kP6Vt5f3YZtkzfhLNxq3bmyE+xSm9ZX7FdzfI/m
	 wpBlZj2ZdLh3Gs0ANlrHro/PiHZv3aXq/Ohc8nSbDQRNBnA6ltigAYstE8vdn7xI6Q
	 lZJVCVl7XHtOIlIQQxQAvVdDI3VzSa1kazcCiYqM=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 26 Mar 2025 19:09:29 +0100
Subject: [PATCH v3] rpmsg: qcom_smd: Improve error handling for
 qcom_smd_parse_edge
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-apcs-mboxes-v3-1-e20f39e125f2@lucaweiss.eu>
X-B4-Tracking: v=1; b=H4sIANhC5GcC/1XMSw6CMBSF4a2Qjr2mty+DI/dhHNB6kQ4E0mLDI
 +zdQmLU4TnJ/y0sUvAU2blYWKDko+/aPOShYK6p2geBv+fNBBeKKyGh6l2Ep+1GioCCyDiOlba
 S5aIPVPtx1663vBsfhy5MO55wez+O+nMSAgejtXHq5KzmeJllO7yO4zSzzUni2xpu/lsBCAptS
 SVSXVvz267r+gZdref64gAAAA==
X-Change-ID: 20240423-apcs-mboxes-12ee6c01a5b3
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2392; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=OjPr7Ip23T18evhoNwNXNFsyhpBrB+kLX/JvPys7vEc=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBn5ELm2hRtGJAMUx/QXM8ZmQ8hf/CEJS4B64ECA
 DXdjnNi25WJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ+RC5gAKCRBy2EO4nU3X
 VvsfEACtU+8tTVqDqzW1orNBIWSPkjXminHc/lGD4/mkvEa4Lj13u1t46ZT6iQUdz3HruKAH7NO
 p8/txeaHpKX8JH0fkDNN6ghfjCY4ctl83CHTQKQBLJpGOBgGcTJ+ecNgHb7xFHqfvLKj1+/t56G
 /Eu8wyVCcclR8zltqQP9j/ONTLw7GE//PV7QDPiy/qxECgejSNx8ARM4T95PCutZ3nRgpO2NKEh
 3q76LBLsR4yIN9vHDiGhMPBH/3lXD5DxedmaZ2VvnwW5glby8qolKo49DuvO5zk6xZ4jlwsEPLM
 /YmzHynj/o2UpD7Q0IygQ3+T1a8hKo2YR4EzfwEwq4BXmZomzkcp0lrlNdChvnP7w6Gs5CsLFn2
 q/6lROm4e7VJAjIMEFPSd/vE2GPH43LKnM11mHN6dDyLNFHzFXxKKdCvS1mXGhj6MJOHoMSeLEF
 zrBezh8ZmWqU1qg8NFeGtFbH3dNGPl9jMP6totha1Jzu7REXNJDmu93uV1hqByUMhX5/9cAG3bY
 LDWjs0N13fHnhVAUHAn6KPA7NJOONovVATqn9VJdEktx4kY8hFMef65AUet2ZgjjITgNknfx1r6
 HEtLHyZb95ETwK/TUhFCVOa2qJRtlH8Q+4m11k2Xmw+QlpvEX6y3AVzMJ1kAXTn9mqtC0aGT3/c
 VB+9pOY7IXFaGMw==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

When the mailbox driver has not probed yet, the error message "failed to
parse smd edge" is just going to confuse users, so improve the error
prints a bit.

Cover the last remaining exits from qcom_smd_parse_edge with proper
error prints, especially the one for the mbox_chan deserved
dev_err_probe to handle EPROBE_DEFER nicely. And add one for ipc_regmap
also to be complete.

With this done, we can remove the outer print completely.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
Changes in v3:
- Pick up tags
- Update my email
- Link to v2: https://lore.kernel.org/r/20240606-apcs-mboxes-v2-1-41b9e91effb6@z3ntu.xyz

Changes in v2:
- Rebase on qcom for-next, drop dts patches which have been applied
- Improve error printing situation (Bjorn)
- Link to v1: https://lore.kernel.org/r/20240424-apcs-mboxes-v1-0-6556c47cb501@z3ntu.xyz
---
 drivers/rpmsg/qcom_smd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 40d386809d6b78e209861c23d934e1b9fd743606..9b5fa9d36998a84be9424d8726c5d7d1bffe36b1 100644
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
base-commit: ee2653e1e7f4e50d0814e7a61242c86616108c48
change-id: 20240423-apcs-mboxes-12ee6c01a5b3

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


