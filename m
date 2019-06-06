Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20AA937C9E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2019 20:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729772AbfFFSu5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jun 2019 14:50:57 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40877 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727238AbfFFSu5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jun 2019 14:50:57 -0400
Received: by mail-pl1-f195.google.com with SMTP id a93so1274429pla.7;
        Thu, 06 Jun 2019 11:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=TDt7h/v0kd9jyNnEaaG9yodaGNQqPQNCl5xz0t2eFwA=;
        b=cXshAzMROVZ+Er4MDxibdDbVf0pUnIWeBPc6CP5Zn5SJyMnjdu1GFA40sCjGeIbiYW
         hfJPmUlu+Sz8SKh+xG94yH21fbFGNL3Ip2ycoiNAhFOUTIjVxKFru1UDT8HRbIo/UCdm
         o4gB1B9C8lp1ux+uGEPsc7apA/Skx/BtP2o4G9dXH2hU9aL/yRkoqVYC6Pzgk/h/oBFN
         aJwrEBkpiMTxXHSifLQMO4pXPufqPgCrTMAZ/2EeGveYwEal26E2Z7aMvMpbqbmXDpni
         dcd5ug1YHHFas2FIp6OZ7g0kFdjHqkLh6vq+rT5EdhCMGqrlAgZHNwY1IA5zJvG3TrOr
         ySKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=TDt7h/v0kd9jyNnEaaG9yodaGNQqPQNCl5xz0t2eFwA=;
        b=OdsyFpAKkNn0M2lF40Bl1/QzG8/CpuTSJxuV/3PdYbPv0Sd4H08DYnwqDXCqn3oggw
         yB1+087pFvBJeEOdtJiBOOVwQYWovXUm0oYyJcBUveUER7v7cyh1VWdFgzFfEM4xuGfi
         ude5JKSdKOTSYXDoawz+HCpZCSeXDfhktzfgoxL8qNTST5Xe0jKKBB0mOnYERN7XHQ+z
         FTywvygTO7RdlVN/xhTQBJikiMMeXTFmd8k/EUoxF97w0NqvWfrIP2/EVYHnF6cX+7y/
         7VmLPAFe4k+xWCW9vujsZ3hpKKWdKWhpIDq7OB9x+rv3tQJnObnz3aYef8SUAMtThA1z
         uNrQ==
X-Gm-Message-State: APjAAAXSIgmLMr9lBw/dnATWAdszJOXnMNr4NP6PSuS2ujZqAVhgptwr
        BLevDxIfPGu10le5DkejWb0=
X-Google-Smtp-Source: APXvYqyglsYfWCwiXITvR9YpeLG0u2dqDRRsCNSWhkoQtscC++EvIVeSSzf5RJoyI0w9jmNcGjUxsg==
X-Received: by 2002:a17:902:b202:: with SMTP id t2mr50291592plr.69.1559847056796;
        Thu, 06 Jun 2019 11:50:56 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 139sm3184582pfw.152.2019.06.06.11.50.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 11:50:56 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     lgirdwood@gmail.com, broonie@kernel.org
Cc:     agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, jorge.ramirez-ortiz@linaro.org,
        niklas.cassel@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v2 2/7] drivers: regulator: qcom_spmi: Refactor get_mode/set_mode
Date:   Thu,  6 Jun 2019 11:49:31 -0700
Message-Id: <20190606184931.39588-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606184842.39484-1-jeffrey.l.hugo@gmail.com>
References: <20190606184842.39484-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

spmi_regulator_common_get_mode and spmi_regulator_common_set_mode use
multi-level ifs which mirror a switch statement.  Refactor to use a switch
statement to make the code flow more clear.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/regulator/qcom_spmi-regulator.c | 28 ++++++++++++++++---------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index fd55438c25d6..1c18fe5969b5 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -911,13 +911,14 @@ static unsigned int spmi_regulator_common_get_mode(struct regulator_dev *rdev)
 
 	spmi_vreg_read(vreg, SPMI_COMMON_REG_MODE, &reg, 1);
 
-	if (reg & SPMI_COMMON_MODE_HPM_MASK)
+	switch (reg) {
+	case SPMI_COMMON_MODE_HPM_MASK:
 		return REGULATOR_MODE_NORMAL;
-
-	if (reg & SPMI_COMMON_MODE_AUTO_MASK)
+	case SPMI_COMMON_MODE_AUTO_MASK:
 		return REGULATOR_MODE_FAST;
-
-	return REGULATOR_MODE_IDLE;
+	default:
+		return REGULATOR_MODE_IDLE;
+	}
 }
 
 static int
@@ -925,12 +926,19 @@ spmi_regulator_common_set_mode(struct regulator_dev *rdev, unsigned int mode)
 {
 	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
 	u8 mask = SPMI_COMMON_MODE_HPM_MASK | SPMI_COMMON_MODE_AUTO_MASK;
-	u8 val = 0;
+	u8 val;
 
-	if (mode == REGULATOR_MODE_NORMAL)
+	switch (mode) {
+	case REGULATOR_MODE_NORMAL:
 		val = SPMI_COMMON_MODE_HPM_MASK;
-	else if (mode == REGULATOR_MODE_FAST)
+		break;
+	case REGULATOR_MODE_FAST:
 		val = SPMI_COMMON_MODE_AUTO_MASK;
+		break;
+	default:
+		val = 0;
+		break;
+	}
 
 	return spmi_vreg_update_bits(vreg, SPMI_COMMON_REG_MODE, val, mask);
 }
@@ -1834,9 +1842,9 @@ static int qcom_spmi_regulator_probe(struct platform_device *pdev)
 			}
 		}
 
-		if (vreg->logical_type == SPMI_REGULATOR_LOGICAL_TYPE_HFS430) {
+		if (vreg->set_points->count == 1) {
 			/* since there is only one range */
-			range = spmi_regulator_find_range(vreg);
+			range = vreg->set_points->range;
 			vreg->desc.uV_step = range->step_uV;
 		}
 
-- 
2.17.1

