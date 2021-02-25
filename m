Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A90D3258B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 22:36:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233815AbhBYVgB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 16:36:01 -0500
Received: from relay03.th.seeweb.it ([5.144.164.164]:40319 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233403AbhBYVgB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 16:36:01 -0500
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 624012019E;
        Thu, 25 Feb 2021 22:35:18 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] qcom: spmi-regulator: Add support for ULT LV_P50 and ULT P300
Date:   Thu, 25 Feb 2021 22:35:13 +0100
Message-Id: <20210225213514.117031-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

The ULT LV_P50 shares the same configuration as the other ULT LV_Pxxx
and the ULT P300 shares the same as the other ULT Pxxx.

These two regulator types are found on PM8950 and its variants.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/regulator/qcom_spmi-regulator.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index e62e1d72d943..00e1d8e9637e 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -1522,10 +1522,12 @@ static const struct spmi_regulator_mapping supported_regulators[] = {
 	SPMI_VREG(ULT_LDO, N600_ST, 0, INF, ULT_LDO, ult_ldo, ult_nldo, 10000),
 	SPMI_VREG(ULT_LDO, N900_ST, 0, INF, ULT_LDO, ult_ldo, ult_nldo, 10000),
 	SPMI_VREG(ULT_LDO, N1200_ST, 0, INF, ULT_LDO, ult_ldo, ult_nldo, 10000),
+	SPMI_VREG(ULT_LDO, LV_P50,   0, INF, ULT_LDO, ult_ldo, ult_pldo, 10000),
 	SPMI_VREG(ULT_LDO, LV_P150,  0, INF, ULT_LDO, ult_ldo, ult_pldo, 10000),
 	SPMI_VREG(ULT_LDO, LV_P300,  0, INF, ULT_LDO, ult_ldo, ult_pldo, 10000),
 	SPMI_VREG(ULT_LDO, LV_P450,  0, INF, ULT_LDO, ult_ldo, ult_pldo, 10000),
 	SPMI_VREG(ULT_LDO, P600,     0, INF, ULT_LDO, ult_ldo, ult_pldo, 10000),
+	SPMI_VREG(ULT_LDO, P300,     0, INF, ULT_LDO, ult_ldo, ult_pldo, 10000),
 	SPMI_VREG(ULT_LDO, P150,     0, INF, ULT_LDO, ult_ldo, ult_pldo, 10000),
 	SPMI_VREG(ULT_LDO, P50,     0, INF, ULT_LDO, ult_ldo, ult_pldo, 5000),
 };
-- 
2.30.1

