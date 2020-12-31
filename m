Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9035E2E7FE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Dec 2020 13:26:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbgLaMZQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Dec 2020 07:25:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbgLaMZP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Dec 2020 07:25:15 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF2F3C0617A0
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Dec 2020 04:24:05 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id a12so43764798lfl.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Dec 2020 04:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fGf2ahi2sgrHaBtMmkREQruq4NpxKNnRfvbqorI/OxE=;
        b=u8fZxiezK/0h6//xx5V1NScR5SXb6Q4bzm0JHG4z63gvm32xLSskGmtkHyW+LFgkqi
         tonjpyMtVkSv1WMMejuuhcIMPTnkywaAfvVdrey+YtGD+jwrH6e8A9Q2Y2jRWaDO2tUP
         Zsxm6QcvYDwJ4B27HwZWkzaHKTWnimLsF7SBU/VTUHSjJnaMnAn0B2uZl5iJesIN5yfc
         52S0eu4Xz9X6TK8Pab/nCwUMbZ1Yc4Igi3EZr7jxWWQYQ5K6K7d3niEAR8wOAisKBF8l
         re+XODoLj97FanVOFiRlewTCnr3UqYRIazF8oibmLAqD+JYFGHOKpM3b8ARmbQzjQIuA
         NVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fGf2ahi2sgrHaBtMmkREQruq4NpxKNnRfvbqorI/OxE=;
        b=nfC6Iafp5mPZWVVnTtpINFWO+2nSkeezANs3wmZVSjLo5A7NTKOhW81w5Mt5K4fmUG
         rKUd1YG3kU5NhL53gRr5Uym5cpxXSbFd2IQ1MTNtt5E9uzj3bXAY1aCVioQi21QKyeN2
         PKBLppUvkIP0hb8+ZCtbsh8auzn/5iPtJSHqH/iCc69m/NEGnyzFPyBxrWZlDb/2OZje
         0p11tQIlxyFOnOlpCjPebS1dmnmkV8K+gFFgtmQiPQhqFTiBum5xRSqV4/sjYxSQriF0
         e1RwOLJRQzzcOUMKjgZB3Gr/OIXNtEZnV3Vtq1aADtJoJo5VaLH+0FyugNap4TF5crU3
         qGRA==
X-Gm-Message-State: AOAM532G9spcTSQWs46sQuKOHcmlEUn3XpV5ckJCp0r0k9jAXHvaNklW
        R/CWg+t/lVFxM6Qs3EWj54SxSg==
X-Google-Smtp-Source: ABdhPJy3ycIrM+bzS+G2caXxlkst0VjlSTFqGJXzVJI624FQ3xvaODeqlrpYyhcrsV7SV6Hj2urd3g==
X-Received: by 2002:a2e:7806:: with SMTP id t6mr30456348ljc.298.1609417444335;
        Thu, 31 Dec 2020 04:24:04 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.115])
        by smtp.gmail.com with ESMTPSA id n10sm428569lji.99.2020.12.31.04.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 04:24:03 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] regulator: qcom-rpmh-regulator: correct hfsmps515 definition
Date:   Thu, 31 Dec 2020 15:23:46 +0300
Message-Id: <20201231122348.637917-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201231122348.637917-1-dmitry.baryshkov@linaro.org>
References: <20201231122348.637917-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

According to the datasheet pm8009's HFS515 regulators have 16mV
resolution rather than declared 1.6 mV. Correct the resolution.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 06369bcc15a1 ("regulator: qcom-rpmh: Add support for SM8150")
---
 drivers/regulator/qcom-rpmh-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index fe030ec4b7db..c395a8dda6f7 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -726,7 +726,7 @@ static const struct rpmh_vreg_hw_data pmic5_ftsmps510 = {
 static const struct rpmh_vreg_hw_data pmic5_hfsmps515 = {
 	.regulator_type = VRM,
 	.ops = &rpmh_regulator_vrm_ops,
-	.voltage_range = REGULATOR_LINEAR_RANGE(2800000, 0, 4, 1600),
+	.voltage_range = REGULATOR_LINEAR_RANGE(2800000, 0, 4, 16000),
 	.n_voltages = 5,
 	.pmic_mode_map = pmic_mode_map_pmic5_smps,
 	.of_map_mode = rpmh_regulator_pmic4_smps_of_map_mode,
-- 
2.29.2

