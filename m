Return-Path: <linux-arm-msm+bounces-61936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B88DAE2913
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 15:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C11A71895E72
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 13:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53047211A27;
	Sat, 21 Jun 2025 13:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="QpcjaQfj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88CD19A2A3;
	Sat, 21 Jun 2025 13:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750512102; cv=none; b=PG0K1ZqjXBGrHt47ixt2yfaDJ2+mmKSTq/L3jAYDrofABj/io8fURHbqd591tTDguKKU2Sj3Dj3EEsfzgurEANm9YtcZ0iGmEhwTofgg3MwYjHiP4fm8ms9L4ki6S/RM5HDQLXMikYBtraLzOgsJLcg/QMRZ5cORdIRfDyvV+e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750512102; c=relaxed/simple;
	bh=BvKtXkC0o8hvEM7A01nMdoB9C06iF4bN2/32ht7CRck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ih+iUPGiJZB+qNxRZTleCIkpJ8ISQ4lhLFK/XA2683NNXp6rmI8VNTxs4PpWsnREfJmVcNkkY3CKCg6ZWv/LKPbu4cA4doMSqDFL1ntNG2hHqtWvLDtmy1Va3yQJD4C6iUNXJNLNoGCpxUtU+/jSQWE7qBUwg/tuG4+5pUls11Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=QpcjaQfj; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1750512098; bh=BvKtXkC0o8hvEM7A01nMdoB9C06iF4bN2/32ht7CRck=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QpcjaQfjP1X0wdt/SQsq/SN6xBKwhF8Pt9JiUTer8Rp+7HHaqwbFXsPNCsrgqzI/N
	 qNWDIbz9YJL3Dn2lWsoh7ML1hu29Fh6QMQKBjzeu9yH4yIbxv/N5O6QMcZ5+VOvtvx
	 S3SuMHYwPATWTAfufddv5LfqgWcWoLvtr1uKkCvk=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sat, 21 Jun 2025 15:19:57 +0200
Subject: [PATCH 2/4] remoteproc: qcom_q6v5_pas: Use resource with CX PD for
 MSM8974
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-msm8974-rpmpd-switch-v1-2-0a2cb303c446@lucaweiss.eu>
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
In-Reply-To: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1240; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=BvKtXkC0o8hvEM7A01nMdoB9C06iF4bN2/32ht7CRck=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoVrHfZZFQs+UHMK8vFt82n2OF0Z+S7vlMwDh3t
 2iBZZfGEHqJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaFax3wAKCRBy2EO4nU3X
 VvjREACBtm2eo/AIOV5hk2gMca9IWyQvJ01VvbLsMZ5YQtbzFqm2g0Xp+MvPNMQq+6cCMQJmaIh
 oEqOgj1WWUbwBJ2iRODP3M8bohgeuC/+S/9oOmaNT80MO9Fjmic8jOYYbmTx2vhvxMS8l9XCkJA
 Jnu/OiDZsXnXzLv9BW44JD0aFY/suu4JO8FdMWxxPQ8DmAmXtlK+t2laWTPtRTDQiXdH1n0sDJ9
 vaqfaTTEPdPHMStAg7bnlc/jLcTeFWQriyvfnbW0x9U9GY87vDU7xvzmsFSkkVL5xcaoqcj3ovR
 JQRENR0MqBfZ7Rx5mvWj4Oop74E7ZnuQyXnm+2wGSXMzxyHRfDnDnCE9JnOK6tLNREX5Zyx+Epn
 eWVPMmqBiYxOCMQnxDu8fdL6btME840UVdh53Df410K3U5g1vIDoyr8QoHBVSH5R5Oz8b03PcpM
 P2nKMB25OVnMB37obMSEixkZTsHQbfKveF2AW7ukGEryVk9GMYXbNIu5dl+EXPicUJeLLpM2osK
 StRzJU0EjiaKy9HDnjjB9p0N1hgYVo7us+w3vND8zKYe+x24nz5X7Obn6TnbhNiW8gDtSs7QgVQ
 t3/ux/aremz/MPUc1M04Q3j9skk8sX5iWB/knviJ1MFetG2JvKrnybRjFl6rRZtltdPFbo6iwIh
 CMHRp/nA+SVvarA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

MSM8974 requires the CX power domain, so use the msm8996_adsp_resource
which has cx under proxy_pd_names and is otherwise equivalent.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index b306f223127c452f8f2d85aa0fc98db2d684feae..b1ba5a2381c396e0ee071df1426dc610affbc6a8 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1437,7 +1437,7 @@ static const struct adsp_data sm8750_mpss_resource = {
 static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,msm8226-adsp-pil", .data = &msm8996_adsp_resource},
 	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource},
-	{ .compatible = "qcom,msm8974-adsp-pil", .data = &adsp_resource_init},
+	{ .compatible = "qcom,msm8974-adsp-pil", .data = &msm8996_adsp_resource},
 	{ .compatible = "qcom,msm8996-adsp-pil", .data = &msm8996_adsp_resource},
 	{ .compatible = "qcom,msm8996-slpi-pil", .data = &msm8996_slpi_resource_init},
 	{ .compatible = "qcom,msm8998-adsp-pas", .data = &msm8996_adsp_resource},

-- 
2.50.0


