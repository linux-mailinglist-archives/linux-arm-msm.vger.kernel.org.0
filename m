Return-Path: <linux-arm-msm+bounces-60519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9E5AD0EE7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 20:42:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 132E87A45A5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 18:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF2F212FA2;
	Sat,  7 Jun 2025 18:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sjyMDprY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72F7200110;
	Sat,  7 Jun 2025 18:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749321734; cv=none; b=GcopLHk0BST1+S6o3H0nizKPimgLwrAwfyKFrEcCBOULlFHYvnbJENDn5YCwsfhHKArtzN7cPIN8/o/KMKrKzDl358ZyOObUBIsWyYrO5oMXOvINOgssgEssRRxkHdbB+LqFfEiyhPoNWPyWDlHVDw5iJYJdoeGxuz/NZnzohhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749321734; c=relaxed/simple;
	bh=Kt22/lukqS2+HqkdwTHgDv3CcrBaoQEscBdWrxhlPhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=awk7evyv4+B9oA3mECn9Ex+Bgamn+dOZnJp3qF5ClooJJAMN8rpkt9drf1ZB6XngCOqZUXHYa+WhAQlwqYRKdkXerkebWLrqpbiVb6YUV7sLtFQ2nKF7c8uQtnZousTJeX0jnCNEhwuztJlhyTg0xiPZOwsKsftV+v13PMtdf7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sjyMDprY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50139C4CEF4;
	Sat,  7 Jun 2025 18:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749321734;
	bh=Kt22/lukqS2+HqkdwTHgDv3CcrBaoQEscBdWrxhlPhs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sjyMDprYg6KOUwDAgRhFrUcP2el6vyOkoufb9r16zPgO1kSLv4p3K0jIWNwIPRxYg
	 nSkbDKC27q9f4sK+lV9Yyp12BMEzywRjnvplQgNo2OCua0MRCPDTXLzacvV7vITvUC
	 xV9YUI57gZVhvfGk57EK7Ro+we5fGTZpa33C/VTGTYQC0ewDAML5+N/0a94q7Vfeki
	 h35DuKs/Na7hEPuhuyGVkfuHXk7KQzc1RcxarZyDmMR/fEDtRUz4mwkk4gV2tKtL8c
	 Y8VjD1NOGCCLOm8qfG+jDYa1zfo+O5E2iZM+WLNFxFmgnB67KWuN7h3/4pcLq/cCbK
	 +JTMPjGUpOXfQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 428F6C61DB2;
	Sat,  7 Jun 2025 18:42:14 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 07 Jun 2025 20:42:01 +0200
Subject: [PATCH v5 3/4] firmware: qcom: scm: Allow QSEECOM on Lenovo
 Thinkbook 16
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250607-tb16-dt-v5-3-ae493364f525@oldschoolsolutions.biz>
References: <20250607-tb16-dt-v5-0-ae493364f525@oldschoolsolutions.biz>
In-Reply-To: <20250607-tb16-dt-v5-0-ae493364f525@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749321732; l=938;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=slRI2ekwNMu7Wtu7d7VJFMn+7WTFlY44tFMAJ5L6BoA=;
 b=79iISydLExY53EKgOn+udDUpMlZaXJlsE8rJ4u2W/GP4hzgMiwSeGIYZCBbIngBVTWMdaZb1D
 dc4+zBWSW84CdYz8en7TO+yeC2J7gRYgBb1teOnv+IkEGYR7aXs2zNO
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Allow particular machine accessing eg. efivars.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f63b716be5b027550ae3a987e784f0814ea6d678..171cc2a6502463e3445919ef77a129563ea233a4 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1993,6 +1993,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },
+	{ .compatible = "lenovo,thinkbook-16" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
 	{ .compatible = "lenovo,yoga-slim7x" },

-- 
2.48.1



