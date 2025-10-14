Return-Path: <linux-arm-msm+bounces-77127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA2FBD86E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 11:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C00A2351C23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 09:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8202E2DCD;
	Tue, 14 Oct 2025 09:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e0PpmZW7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1482080C1;
	Tue, 14 Oct 2025 09:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760434032; cv=none; b=uuvDOooqIJIFlZ5NS9tMgWvbndMuedeXOT6NngXOHtrHaXxi3rUmmMvTtj40Jtl1ed94iMY1q3+NB4n7dq/iiZfwRFAOSVs3WFH62FELSXmW0anL6LRXD1Y6zXuewqdWcnvwOfOvTpTcklGZRUxC6i+SjL9fbjauJT2CY00TZDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760434032; c=relaxed/simple;
	bh=uJ91W/Oe+hLKgKfDBdTIEryOTLkn+T9poBz0FLdEPfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UKhE11O/6T5Nz/D7vmPszbiiIhwV8f6Ho4hQW5ZTCe2mlf+0ZHpnAkyb6wCc1Bu3DPNXbXWWvKPJtWsoHeaoeuJIST2lIm8IB7jlb5iM9uvZTbiduZMjUOs62G9zEPC+72SJ/VVIU4HkSN520ieCJLZfQhfzOp+70U5atWdYpzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e0PpmZW7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C600C4CEE7;
	Tue, 14 Oct 2025 09:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760434032;
	bh=uJ91W/Oe+hLKgKfDBdTIEryOTLkn+T9poBz0FLdEPfo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=e0PpmZW7sX/ccukfc2NL0KT8mSFowVtRbsm2X3ZylAbG6hWad4ZqMfx8Q8tjT86Dd
	 Uoeb62IFoAk3BKcR/8xGpaAUxp1aC3o1kMfLpT7BWi2sxs9bkkYKu7ZWv4HaDDi8qm
	 VkazGZXN063tw6R1YL+uXtWfWIPxv72yFFiApF0wmLR2yqUnw3wJ4IaJDK92IQUYb6
	 XE1ywG+W1zjbxzq90LX5btG0KbrVlPaqsUyuHUTyyabNYPLloffyP02RKGxsw5Y1bu
	 P3Q17PQaBf+MfzM3vxn14Or/ZTF5mtsfdiVUOvRnH+P/4RdvAQUzJZrD1pO0s3lM/w
	 fYnXap/n4ju2A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F03CCD184;
	Tue, 14 Oct 2025 09:27:12 +0000 (UTC)
From: Prasad Kumpatla via B4 Relay <devnull+prasad.kumpatla.oss.qualcomm.com@kernel.org>
Date: Tue, 14 Oct 2025 14:57:10 +0530
Subject: [PATCH v2] soc: qcom: pd-mapper: Add Kaanapali compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-knp-pdmapper-v2-v2-1-ba44422ac503@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAG0X7mgC/13MywrCMBCF4Vcps3ZKkkaCrnwPcTFNJzZoLiZah
 NJ3N7hw4ebAtzj/CpWL5wrHboXCi68+xQa168DOFK+MfmoGJdReCqnxFjPmKVDOXHBRaNjI0Zn
 BajbQXrmw8+9v8XxpdiUFfM6F6dcRB/XfkSjRWaf1SDwYQ6dUa/940d2mEPo2sG0f20QgkKwAA
 AA=
X-Change-ID: 20251014-knp-pdmapper-v2-7e71bf73c4e7
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>, 
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760434031; l=1855;
 i=prasad.kumpatla@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=sCqvfA32ZCOl3TIUlO+J7YRwsshujOttwAP0Dgj/0+A=;
 b=/84Xt5SlsU4+IEZFisXbbIcOZxoiS/C2GvlOxuDvVZ2jn9L/zQ+eub17Jy8qQOSf3uT7eIFop
 95v6Npr3K4NB5QkrDmdmaJqm07H5Y+pBgI8Gwe6QzhOrH8Fw7OwQCDL
X-Developer-Key: i=prasad.kumpatla@oss.qualcomm.com; a=ed25519;
 pk=I3mn8JNlYnnm7frqMGXms1Rm2H+0gpAfknMlnBYqCzw=
X-Endpoint-Received: by B4 Relay for
 prasad.kumpatla@oss.qualcomm.com/20251014 with auth_id=541
X-Original-From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Reply-To: prasad.kumpatla@oss.qualcomm.com

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Add support for the Qualcomm Kaanapali SoC to the protection
domain mapper. Kaanapali shares the same protection domain
configuration as SM8550, except charger_pd as it move to SoCCP.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
Changes in v2:
- Add separate pd domain data for Kaanapali SoC.
- Link to v1: https://lore.kernel.org/r/20250924-knp-pdmapper-v1-1-fcf44bae377a@oss.qualcomm.com
---

---
 drivers/soc/qcom/qcom_pd_mapper.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 6384f271953d..1bcbe69688d2 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -360,6 +360,15 @@ static const struct qcom_pdm_domain_data mpss_wlan_pd = {
 	},
 };
 
+static const struct qcom_pdm_domain_data *kaanapali_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&adsp_sensor_pd,
+	&cdsp_root_pd,
+	&mpss_root_pd_gps,
+	NULL,
+};
+
 static const struct qcom_pdm_domain_data *msm8996_domains[] = {
 	&msm8996_adsp_audio_pd,
 	&msm8996_adsp_root_pd,
@@ -552,6 +561,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,apq8074", .data = NULL, },
 	{ .compatible = "qcom,apq8084", .data = NULL, },
 	{ .compatible = "qcom,apq8096", .data = msm8996_domains, },
+	{ .compatible = "qcom,kaanapali", .data = kaanapali_domains, },
 	{ .compatible = "qcom,msm8226", .data = NULL, },
 	{ .compatible = "qcom,msm8909", .data = NULL, },
 	{ .compatible = "qcom,msm8916", .data = NULL, },

---
base-commit: 2b763d4652393c90eaa771a5164502ec9dd965ae
change-id: 20251014-knp-pdmapper-v2-7e71bf73c4e7

Best regards,
-- 
Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>



