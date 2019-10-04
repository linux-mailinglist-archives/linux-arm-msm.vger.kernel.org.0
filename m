Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90D55CB808
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2019 12:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388602AbfJDKRP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Oct 2019 06:17:15 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39726 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387702AbfJDKRP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Oct 2019 06:17:15 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 85899619F9; Fri,  4 Oct 2019 10:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570184234;
        bh=knjsL0SuUPWrDx0GJG+yspvSK/j86QdNPhdZ9lyoVFs=;
        h=From:To:Cc:Subject:Date:From;
        b=kiP1Osywo763L+f4Ym2iaO/drZx1SnU4xm7piQedmzfEfyY54SgZo1U3OhMHSJmhr
         hGUZ+JE3kQLM/TcF3NZ7sBrQlHHN6QMrJzcxrHMkA3HBJxq4X39n2Jw0Nl3RmcYheK
         zqfXt0qVvGpqqehiVEPSPzVYLH9l7GlcjQs79lYc=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from kgunda-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 349C8619F6;
        Fri,  4 Oct 2019 10:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570184233;
        bh=knjsL0SuUPWrDx0GJG+yspvSK/j86QdNPhdZ9lyoVFs=;
        h=From:To:Cc:Subject:Date:From;
        b=dq9nn0XLpqIyoTgi7OTZ/UzFPzDyI2yhDBIh2H/fuNIpz2fHmKZPWLlml7+QqtXLm
         m+5fSMHwmJoNIT/zUi1nuyAB58tFzhDqTFBcG8anoJlQGptI1qfpmZ8Jx49dtUado0
         ZpbuBmNFrvFYayfx/FSi8jUz/KPFbAY/xUQ9HsPs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 349C8619F6
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=kgunda@codeaurora.org
From:   Kiran Gunda <kgunda@codeaurora.org>
To:     bjorn.andersson@linaro.org, Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Kiran Gunda <kgunda@codeaurora.org>
Subject: [PATCH V1] regulator: qcom-rpmh: Fix PMIC5 BoB min voltage
Date:   Fri,  4 Oct 2019 15:46:55 +0530
Message-Id: <1570184215-5355-1-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Correct the PMIC5 BoB min voltage from 0.3V to 3V. Also correct
the voltage selector accordingly.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
---
Depends-on: This patch depends on "Add regulator support for SC7180"

 drivers/regulator/qcom-rpmh-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 8ae7ddf..c86ad40 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -735,8 +735,8 @@ static unsigned int rpmh_regulator_pmic4_bob_of_map_mode(unsigned int rpmh_mode)
 static const struct rpmh_vreg_hw_data pmic5_bob = {
 	.regulator_type = VRM,
 	.ops = &rpmh_regulator_vrm_bypass_ops,
-	.voltage_range = REGULATOR_LINEAR_RANGE(300000, 0, 135, 32000),
-	.n_voltages = 136,
+	.voltage_range = REGULATOR_LINEAR_RANGE(3000000, 0, 31, 32000),
+	.n_voltages = 32,
 	.pmic_mode_map = pmic_mode_map_pmic5_bob,
 	.of_map_mode = rpmh_regulator_pmic4_bob_of_map_mode,
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project

