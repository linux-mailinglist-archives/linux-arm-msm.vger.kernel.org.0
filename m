Return-Path: <linux-arm-msm+bounces-66735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AA4B12519
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 22:05:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EA62AC5F1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 20:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1FF5253F00;
	Fri, 25 Jul 2025 20:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="qhh9f+mL";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="vJRH00nq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557082528E1;
	Fri, 25 Jul 2025 20:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753473931; cv=none; b=pToxbYLiF5Drx382hQDdY0gq0vCQ9YfNfxrsDaaANb8K1fPUg1UlQScgHZJtlGsisdwlD2H5PPo1LlqVUsw4u3WzBMzSr0/+XRwtSSPdHlWiG023VpJKqpp4ueqGYxyvnfHCtsvpB80+gJKnUjFDp+hgQeKZv09gRM/3tFZD5HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753473931; c=relaxed/simple;
	bh=G7TSS4tuTL72Ricam6/+6Z2OHzlqs4AUasqDmHt40f0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Opd4iFn/qKFjaNth5sZ1R2Z6mmr4s26gkwcygons3dPcLy+URWj0S/gLIlqSrNv56qHeKJIUvSpCjKfI7tpRhbG3y53KmaadDkZBDmLmMaO4WMcEqT50CqjmxvO+piHo1A2tS2Uy8REaDd62DPNHtsuH2VGTWtwuMYvP7nTKbiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=qhh9f+mL; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=vJRH00nq; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1753473787; bh=fjdCxOheBnp1H4xqfM+Evdw
	4VATnT7h6OsZZjNrCxdA=; b=qhh9f+mLYuK4d6T6CjfO3GO7PwNLmxLEI5Fqna6o5n1ZWJkYQp
	fB8BzzsTiC6Eb1xu3Q4aYFN68exoQib/UfHEUPf53AG3ponv6teSZYd72F30S6X/v7Y9LOB6aX+
	rBCIwny7epoGaBa3OWVaFfysg9jZ0xDxvraT+TffVeRvfEf0EzOYgxxrdlXiAOpaHbODUrml+lU
	DeGgrZRjLdlOzVthwycPJ7fr/pWsraaPNy6jKO3IZLOjj45YJRZ9QkCjUgn31uz2fYzCOAJY2G3
	f00r9eYbgoKybkw8jj14k218DDx9QlFWcJ1YU39NUyr0uyuhInmY5zFXov6jKFUFDTg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1753473787; bh=fjdCxOheBnp1H4xqfM+Evdw
	4VATnT7h6OsZZjNrCxdA=; b=vJRH00nqSA5IaA+HpolrvksE3MbR5hsht4ZozCvSxI6Zc4FUtw
	i6i4OJpd7Bx1DdjhEK212AAJF2RHYBCQAjCQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Fri, 25 Jul 2025 22:02:58 +0200
Subject: [PATCH v2] rpmsg: qcom_smd: Fix fallback to qcom,ipc parse
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250725-fix-qcom-smd-v2-1-e4e43613f874@mainlining.org>
X-B4-Tracking: v=1; b=H4sIAPHig2gC/3WMywrCMBBFf6XM2pFMTA248j+ki9A8OmASTaQoJ
 f9u7N7luZdzNqiusKtwGTYobuXKOXWQhwHmxaTgkG1nkEKOQklCz298zjlijRb12etZkTJEBrr
 yKK7/e+42dV64vnL57PWVfuuf0EoocNTKCk325KW+RsPpzolTOOYSYGqtfQF/OCPUrQAAAA==
X-Change-ID: 20250421-fix-qcom-smd-76f7c414a11a
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753473786; l=1940;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=G7TSS4tuTL72Ricam6/+6Z2OHzlqs4AUasqDmHt40f0=;
 b=u/9AN8zyE7zgNdDxKes6JIfinxfrqWZT5lnyrBInPqedjDMxV7cCoNWmZb9P/4sRxGD2HNDQT
 URy8HaJfxiLDI/2kPpNn+/RvCNAF0SDIXnFjghbhE0pH1CGH3IfQrem
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


