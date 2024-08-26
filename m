Return-Path: <linux-arm-msm+bounces-29498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C90795F401
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 16:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4510C283E6D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 14:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 850BF1925A4;
	Mon, 26 Aug 2024 14:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lwk5+ZFy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5971718BBBF;
	Mon, 26 Aug 2024 14:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724683094; cv=none; b=heFcMqVYfgTvBqtJdbOkewRqX561nQ77cQo02BY2NAvKpqZTCA8VOzGa/oITXZHtpeSJmbQHEqcBVmlxOOeQmBx3rj991qS2DidypZUKA1gfkMg5G+nEKyMlZ5w+vYg4vc4CKBISPoFeVcdH9DA9GREIaa8bGaU9CnDbN4y/I6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724683094; c=relaxed/simple;
	bh=DRoA//tuTNs17dBMB6WWIDm/GSBiogveVMeL7KMVcMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r98Z2o+1UAU9xyIkscqAZGSQJY0IhRZFnKfKYADByrUeFdmOCXgpimK7Cg3imqy91wjN1w3a49jQ7mYW+6jpTkZq1gaDzO0gZ4XZweJBN9m6N382qfZ/jjMN6Prv1I3UPiDCO/XmeQ1fgntu5SrLan8bmKy6tr8cyMMwhVN2+RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lwk5+ZFy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 207D2C4FEF3;
	Mon, 26 Aug 2024 14:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724683093;
	bh=DRoA//tuTNs17dBMB6WWIDm/GSBiogveVMeL7KMVcMU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lwk5+ZFyKmzpgdQDFcQNG4eDyEyoIN4CQUt9wQW5FQjyqflJ4DJs7vJtvgvhVfXU0
	 pHBc/NVtBgsWkHjb2y56ZrxqcF8OoX724lnCRF8hzWPh0J3+QOm5NOc+MegPzrvmjT
	 5ORbPFznhX4B6nkAh6em1aDs8RMH8QxRqiT+BtoPptxCL+iC9FcQNVuN4sBRmXSep3
	 Qtie8PuZIWpa7h7dBK5d+NHNqYXpDPUUIa//nH6reQ6pNYcdAkqotUCIK++wuUUYRK
	 36lHV+xG6o5cfREmOzpxf5eOJRNX0jBUBywD7ncNNS8jP5K3vtZAkGsCQcDvqQEnFk
	 x96EodTpa2+TQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 26 Aug 2024 16:37:51 +0200
Subject: [PATCH v2 2/5] firmware: qcom: scm: Allow QSEECOM on Surface
 Laptop 7 models
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240826-topic-sl7-v2-2-c32ebae78789@quicinc.com>
References: <20240826-topic-sl7-v2-0-c32ebae78789@quicinc.com>
In-Reply-To: <20240826-topic-sl7-v2-0-c32ebae78789@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724683080; l=881;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=hz8khZErMZVcNrc7s3hAF1DBBz9jOKGK92fHRodhiCw=;
 b=RPm58eWrf/2rQYid51znrewcDShPD+w/wP4k0LWUiRmop9Dq9NlmgFlEGXEX0ivlYx2Y9lbkk
 qWe1QIUcFLUB9hazDNLLbJ1YkRHDbYL8MoJtLx1/oOMfOg4XX/jEnD4
X-Developer-Key: i=quic_kdybcio@quicinc.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <quic_kdybcio@quicinc.com>

Add the aforementioned machines to the list to get e.g. efivars up.

Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
---
 drivers/firmware/qcom/qcom_scm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index bdb5e98b82ef..10986cb11ec0 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1734,6 +1734,8 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "lenovo,flex-5g" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
+	{ .compatible = "microsoft,romulus13", },
+	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,sc8180x-primus" },
 	{ .compatible = "qcom,x1e80100-crd" },
 	{ .compatible = "qcom,x1e80100-qcp" },

-- 
2.46.0


