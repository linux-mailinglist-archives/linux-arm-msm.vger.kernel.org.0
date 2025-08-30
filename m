Return-Path: <linux-arm-msm+bounces-71300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C00AB3CFF0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Aug 2025 00:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B3CB20675D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 22:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3D2261B8F;
	Sat, 30 Aug 2025 22:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="YzKHh2/+";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="6fkxmVYh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3350825CC74;
	Sat, 30 Aug 2025 22:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756593734; cv=none; b=t81zgUrV+J6ZE7uOhWTNd+tx4dHOouMhw2zCrY/qmnpRNuIAp58SFmESpogD+9UR2kJKiqeYUPbuUKHGZaxJgF4GlMZiQzbrv8NrLrpelyCKRizG2hHDOCOOy/yElZgTsdws138RelA0rL4AMETNYoPAj9tpBACAYXdTPORiTHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756593734; c=relaxed/simple;
	bh=G7TSS4tuTL72Ricam6/+6Z2OHzlqs4AUasqDmHt40f0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Gn/MuxajDJf6DeUX6xGP5WtkCWZIW6xo1hy0IERwILPzeqwHoulfb7SVZju5wAf5PU2ZqoslGAV/L+Gm8jeoDtU0i/fraUHcns48NdZs9SOuVtzmlaKuK2Zx87yf+HQtq7V52pAvmLBw8Ry0TB4enx3fSeoALRDJhRTnp7zpO7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=YzKHh2/+; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=6fkxmVYh; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1756593594; bh=fjdCxOheBnp1H4xqfM+Evdw
	4VATnT7h6OsZZjNrCxdA=; b=YzKHh2/+GaROmfX6Dxv/GC8ct4q7TTH4sk95hOSy4jtyCRuHM3
	x453tFXSZFhQxi8l/Qjikce2YDUTgV1D34eCcrzr77ZTyigQ6DPEtysztzP4ejjI3iZcBVnOzT5
	MwkB3dhSznGHrmHQTpirnmQQ30Iy433ZAYY4JHuu5y8LCuMvjgA/ORtzVH10nv9wKkiHXjSt5HL
	Yj9JQuw6qA/CVmWXRLkWr69LXziDYr3wKvmDgabWQHytkvkTZVcy1BDxHZdtsID9TBRprLf8h/7
	q/Rp4YDyW6WaogihsQsCokht4j7TTLuc/7NoqjbJuY3zYgLJe63TrHG9pRv+Eexw8jg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1756593594; bh=fjdCxOheBnp1H4xqfM+Evdw
	4VATnT7h6OsZZjNrCxdA=; b=6fkxmVYh4VBWFCEOrH4RQ7XPqRBYO3MSUsD6z4c6kDYeRef/Wq
	eFt7x6xHAEOc7fJnGZrn2nRl5a6pdSBECSCQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 31 Aug 2025 00:39:43 +0200
Subject: [PATCH RESEND v2] rpmsg: qcom_smd: Fix fallback to qcom,ipc parse
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250831-fix-qcom-smd-v2-1-a1c0a59d6a3b@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756593593; l=1940;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=G7TSS4tuTL72Ricam6/+6Z2OHzlqs4AUasqDmHt40f0=;
 b=OiGHZ4CDlgy7j7sRp92zhWhR6KdYCPGryR/4IGkK7gJ514Jvi+LKWML/5K/Up9WTykxH0bFsp
 QDNTPRnnNG7CbN9B1WpfFkYAY16mTJQyv6AD4WS7som4JnomFkuQY4I
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

mbox_request_channel() returning value was changed in case of error.
It uses returning value of of_parse_phandle_with_args().
It is returning with -ENOENT instead of -ENODEV when no mboxes property
exists.

Fixes: 24fdd5074b20 ("mailbox: use error ret code of of_parse_phandle_with_args()")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Tested-by: Stephan Gerhold <stephan.gerhold@linaro.org> # msm8939
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
mbox_request_channel() returning value was changed in case of error.
It uses returning value of of_parse_phandle_with_args().
It is returning with -ENOENT instead of -ENODEV when no mboxes property
exists.

ENODEV was checked before fallback to parse qcom,ipc property.
---
Changes in v2:
- Drop already applied patch.
- qcom_smd: rebase
- Link to v1: https://lore.kernel.org/r/20250421-fix-qcom-smd-v1-0-574d071d3f27@mainlining.org
---
 drivers/rpmsg/qcom_smd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index f0f12e7ad2a61922723c16e45738e93bd432c6c6..42594f5ee4385c0071c91d9a5a05fb8517c82bc0 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1368,7 +1368,7 @@ static int qcom_smd_parse_edge(struct device *dev,
 	edge->mbox_client.knows_txdone = true;
 	edge->mbox_chan = mbox_request_channel(&edge->mbox_client, 0);
 	if (IS_ERR(edge->mbox_chan)) {
-		if (PTR_ERR(edge->mbox_chan) != -ENODEV) {
+		if (PTR_ERR(edge->mbox_chan) != -ENOENT) {
 			ret = dev_err_probe(dev, PTR_ERR(edge->mbox_chan),
 					    "failed to acquire IPC mailbox\n");
 			goto put_node;

---
base-commit: d7af19298454ed155f5cf67201a70f5cf836c842
change-id: 20250421-fix-qcom-smd-76f7c414a11a

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


