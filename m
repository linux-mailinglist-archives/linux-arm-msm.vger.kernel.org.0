Return-Path: <linux-arm-msm+bounces-30514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AD1969B49
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 13:13:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72A8E283D1F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 11:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46871A262D;
	Tue,  3 Sep 2024 11:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nS5GZBUT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798EA1A0BF4;
	Tue,  3 Sep 2024 11:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725362007; cv=none; b=c1olg37LKwpaApt9qRpjUVQCPCbKTPeCXqiL31c6UNrerq+ciSnwtO9Y8AV4PebUV3d/Qj7ZkZ+7AXUTox1fPzqbP3ztT0QAmqqBIiIw8QzL2ZTJiDSzflD18u3RhBslQE0nqp68U/YdA9L+6Qe1brQLLikSf1cqNw4HwdyjYL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725362007; c=relaxed/simple;
	bh=WqwrgkcudK+NHfSOLwKLX2dxo3L9ye7UU5DyxeNFtS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=T9qJ4cvFQa7jdQ9WVgvN7vFPt7mQYiDucZQ2JPVW1BRSa3uge14fg0wgOw5FDZlB3fVzwkQJK1yC6LHtsI/eqvQLHYdRWuReM2qMnjv8GC1fal3sVUrmZzO0MAF2VV4CHWCulycTk+urddMMNusKYHEkxk628vgsRKiKz89HmpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nS5GZBUT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9B8C4CEC4;
	Tue,  3 Sep 2024 11:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725362006;
	bh=WqwrgkcudK+NHfSOLwKLX2dxo3L9ye7UU5DyxeNFtS8=;
	h=From:Date:Subject:To:Cc:From;
	b=nS5GZBUTc9kBzi80C36kzvHHMK7KVDu6MQKGxiRkS+nt70S95Y0REDRaRgouTMV+P
	 fGjV3LpcxS/wz6Ato35EMexDpW3M/fwXrwvoZN7oL+l6rucGbhrQvpaEghTC7WRyyG
	 AY64Kmin5DpVXLp/vu+J7jloIxly6LjJuug2yzjyTD8yM7fKlU5LMTwi2ZyeifR2bB
	 0Vw5kBMU5K4Yg9yGJBCxfcmOC3dAcbOxxayY8V46HX6iG1T0oRVZK2OBYSbw7eGlGh
	 bHDYiSP9DSswg1TwSF7ARZ31riZdBv6zRhSi2O4+8ctpiODyXL+Yd4EgFn4TXhUBt7
	 +nddKTXfK9+9Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 03 Sep 2024 13:13:10 +0200
Subject: [PATCH] phy: qcom: qmp: Fix lecacy-legacy typo
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-topic-qmp_typo-v1-1-781e81799992@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAEXv1mYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDSwNj3ZL8gsxk3cLcgviSyoJ8XfPExBSDNCNLsxTzRCWgpoKi1LTMCrC
 B0bG1tQCUJwRBYAAAAA==
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725362003; l=1854;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=6TZhkcNKUTD0+ua4KuZh0omxzbKAoA2ah9XtSRXRVLU=;
 b=x6IsldEJU5jGunA50BTxps/QGCy4BX+zCxKquJtz4aRdJeCCmJ1RRYfFp3OzYcfLywlvsJ4Ty
 jIsVKtLuOlnAauKH2zcmRkscsidb3CXUxOIVEo3WXZuQFAYEkEGSu5T
X-Developer-Key: i=quic_kdybcio@quicinc.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <quic_kdybcio@quicinc.com>

Introduced in Commit b3982f2144e1 ("phy: qcom-qmp-combo: restructure
PHY creation"). No functional changes.

Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index a8adc3214bfe..0198dc21ae56 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3483,7 +3483,7 @@ static int qmp_combo_typec_switch_register(struct qmp_combo *qmp)
 }
 #endif
 
-static int qmp_combo_parse_dt_lecacy_dp(struct qmp_combo *qmp, struct device_node *np)
+static int qmp_combo_parse_dt_legacy_dp(struct qmp_combo *qmp, struct device_node *np)
 {
 	struct device *dev = qmp->dev;
 
@@ -3510,7 +3510,7 @@ static int qmp_combo_parse_dt_lecacy_dp(struct qmp_combo *qmp, struct device_nod
 	return 0;
 }
 
-static int qmp_combo_parse_dt_lecacy_usb(struct qmp_combo *qmp, struct device_node *np)
+static int qmp_combo_parse_dt_legacy_usb(struct qmp_combo *qmp, struct device_node *np)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	struct device *dev = qmp->dev;
@@ -3576,11 +3576,11 @@ static int qmp_combo_parse_dt_legacy(struct qmp_combo *qmp, struct device_node *
 	if (IS_ERR(qmp->dp_serdes))
 		return PTR_ERR(qmp->dp_serdes);
 
-	ret = qmp_combo_parse_dt_lecacy_usb(qmp, usb_np);
+	ret = qmp_combo_parse_dt_legacy_usb(qmp, usb_np);
 	if (ret)
 		return ret;
 
-	ret = qmp_combo_parse_dt_lecacy_dp(qmp, dp_np);
+	ret = qmp_combo_parse_dt_legacy_dp(qmp, dp_np);
 	if (ret)
 		return ret;
 

---
base-commit: ecc768a84f0b8e631986f9ade3118fa37852fef0
change-id: 20240903-topic-qmp_typo-7aad0f296d7a

Best regards,
-- 
Konrad Dybcio <quic_kdybcio@quicinc.com>


