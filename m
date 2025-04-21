Return-Path: <linux-arm-msm+bounces-54830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DA2A94A95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 04:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E76C188F456
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 02:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67EC52561D7;
	Mon, 21 Apr 2025 02:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="F2WdwLLO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A719435942;
	Mon, 21 Apr 2025 02:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745201078; cv=none; b=LFSBj63T0caOGhXRR8Z49hPdnXZchCvRSxjImuJcTMzW7P2VD1yNcXQg/VF820ahL3R0exPuzL3vSxOhsRilcaeHZX/VH9/yyYN9mc6jwspcbum3wg1PID9nS+67tVPfC5u19LPXtrkPcZEv+MG045kWERsXWGI2JAkbIIuWYOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745201078; c=relaxed/simple;
	bh=JfWcuV9DGUjdXLu19kbjpWbEo5f5WqID1wROTv7KPqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lRIH5Ryt0QZ9RUwYynoU2FXyL9u8t/cNeHLxP7kB85qGmnvbLlAp3b2lBfTAxViga084xMGbu8jgyrTsqTjDxOBT+Rzoj95P6KMrOCSNtluYc8bTlpXZ8YHcAVTFYxob5JbNflLdfsPMDMr34jodiDviStXSswFyx67R6bVRd5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=F2WdwLLO; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.183.162] (254C255A.nat.pool.telekom.hu [37.76.37.90])
	by mail.mainlining.org (Postfix) with ESMTPSA id 9F2EFBBB01;
	Mon, 21 Apr 2025 02:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1745201069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y2epY80Snc/7euU+ALpiYDu7MBIbiNWiG22ibp//GlM=;
	b=F2WdwLLOTLiLDF7/3p24/03iyyth9vOTzIJziZF/kxjSM8FvhAzOmL+5l9UHb8rx1N0LkE
	cA2kK8DzXK3dRZBkzP+TG6YYuQqzbMn9uO4DdGdA+lMJmHZkT3o6U7Gp9aTriITGypHkBc
	1VEEOL5SEVOxCFglRY28B07AN5hfUmyO4EpcrvtSJgySyX3Ih853oFRQiUUiJ8JkYYlAE/
	vR/VEI7Gyed3Zm9FRB50ioPWsUVZUHjfX9d6lmFplagMMn62Ymb2SfdGTgNuFSDPAGjXF2
	AjZ5fdrcrmhZl8BwP5/oTDku4Nlzt7B/SYWDa7YsqFU+TkGESLDiZcmfSzsQig==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 21 Apr 2025 04:04:16 +0200
Subject: [PATCH 1/2] rpmsg: qcom_smd: Fix fallback to qcom,ipc parse
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250421-fix-qcom-smd-v1-1-574d071d3f27@mainlining.org>
References: <20250421-fix-qcom-smd-v1-0-574d071d3f27@mainlining.org>
In-Reply-To: <20250421-fix-qcom-smd-v1-0-574d071d3f27@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745201067; l=1069;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=JfWcuV9DGUjdXLu19kbjpWbEo5f5WqID1wROTv7KPqw=;
 b=pmSi6b7M88j3sFcfVoGVGfUfhbQZuHNTaI1IVYRQiIgEERmAujpsAfUwKsyeGe11E2PvhZPip
 Cq8oUKicfniDhS30hM49n+DbF13oeLnOOsgDHHZr3uM7XU+4D64F2LI
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

mbox_request_channel() returning value was changed in case of error.
It uses returning value of of_parse_phandle_with_args().
It is returning with -ENOENT instead of -ENODEV when no mboxes property
exists.

Fixes: 24fdd5074b20 ("mailbox: use error ret code of of_parse_phandle_with_args()")
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/rpmsg/qcom_smd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 40d386809d6b78e209861c23d934e1b9fd743606..e552a9af578e48cfd854a228a4d91e4fa04bf29d 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1368,7 +1368,7 @@ static int qcom_smd_parse_edge(struct device *dev,
 	edge->mbox_client.knows_txdone = true;
 	edge->mbox_chan = mbox_request_channel(&edge->mbox_client, 0);
 	if (IS_ERR(edge->mbox_chan)) {
-		if (PTR_ERR(edge->mbox_chan) != -ENODEV) {
+		if (PTR_ERR(edge->mbox_chan) != -ENOENT) {
 			ret = PTR_ERR(edge->mbox_chan);
 			goto put_node;
 		}

-- 
2.49.0


