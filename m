Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB59B44E61
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 23:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728476AbfFMVZp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 17:25:45 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35878 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfFMVZo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 17:25:44 -0400
Received: by mail-pf1-f195.google.com with SMTP id r7so59435pfl.3;
        Thu, 13 Jun 2019 14:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5+TFtA79aZ+IjNk4lXxAZtuIhR9lTbHQLneZLDhsOTI=;
        b=uMIEjubqF6WKPWVjK7XNOAySKJKkv5jSfxkvZ3/roI+8lQePsCvI2lCFstJqXAdZkN
         S+YIT+Fi6msM8J8ypbwHiyND64I2FVfr22MAlOuAA8i9ehTBNIVJM6DQXfdvvBL/qQKL
         7QCGMCbmx+hvUmJxlV80JNaG3f2CmSbdwucYCy3cVvVLQwf7CAlcR0DS+vvVNJb8ami4
         YKOeqVcKi0Ur0EQine6oclQTAKAv3GLamNd0eHZonC9SAVXP+r52aCRIW2pP4Rttahe5
         xDFsDI1AbWqAuuGSBKSmblnGtn3xhEX0eOHE4AY76Ayhn66J3KFwBpFAf2KflTGGxqQS
         Fhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5+TFtA79aZ+IjNk4lXxAZtuIhR9lTbHQLneZLDhsOTI=;
        b=XHsQySmwm8f0mgrokBaa1zPl8q1FauOhYCkboJG/yqtFBrgOEVFlZCGBylKqVj/8Dt
         CQ08em/8rd3kLSyeaLboooCrHvx5GPGVEk1UTPe+k3jLJeak7ZSYrVKpVOrFPN69e1ae
         Dpcdx94bWh9aOpi/UoTZIbxAbhMBi8guxxCndluH6d7yIF/dzFv0JnL4NF/jBl6nZJ0f
         jtjWVNy0U/HxL/CqsrrA/Gmb+5+gtSfMz0jkWFQgPdJpoB19cDdWAQEUohVoMH5oEVoG
         se8IomCwGL2/GgZ76L5pyuTgqC/Xlo1015qSK18Fwqx3yYCdIxT+4Xy0DTos6pj0ZOOK
         rESw==
X-Gm-Message-State: APjAAAVM3M+SDHZ8EwvKh1mue1MEGfrEQF+MpKsK8hw7CeA/BSf9is0S
        JFMo4Ejczdf/Pvh4odylNrd7Eskg
X-Google-Smtp-Source: APXvYqx4P864mcDeRF6fv3rUBPWE/oL8fjhGlONrou+Q8YvAkWV05CsoT6qKLKpu3CFvr5A/J7/AkQ==
X-Received: by 2002:a65:624f:: with SMTP id q15mr32323372pgv.436.1560461143720;
        Thu, 13 Jun 2019 14:25:43 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id j22sm618471pfh.71.2019.06.13.14.25.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 14:25:43 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     lgirdwood@gmail.com, broonie@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v4 2/7] regulator: qcom_spmi: Refactor get_mode/set_mode
Date:   Thu, 13 Jun 2019 14:25:31 -0700
Message-Id: <20190613212531.10452-2-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190613212531.10452-1-jeffrey.l.hugo@gmail.com>
References: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com>
 <20190613212531.10452-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

spmi_regulator_common_get_mode and spmi_regulator_common_set_mode use
multi-level ifs which mirror a switch statement.  Refactor to use a switch
statement to make the code flow more clear.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/regulator/qcom_spmi-regulator.c | 26 +++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index 42c429d50743..1b3383a24c9d 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -911,13 +911,16 @@ static unsigned int spmi_regulator_common_get_mode(struct regulator_dev *rdev)
 
 	spmi_vreg_read(vreg, SPMI_COMMON_REG_MODE, &reg, 1);
 
-	if (reg & SPMI_COMMON_MODE_HPM_MASK)
-		return REGULATOR_MODE_NORMAL;
+	reg &= SPMI_COMMON_MODE_HPM_MASK | SPMI_COMMON_MODE_AUTO_MASK;
 
-	if (reg & SPMI_COMMON_MODE_AUTO_MASK)
+	switch (reg) {
+	case SPMI_COMMON_MODE_HPM_MASK:
+		return REGULATOR_MODE_NORMAL;
+	case SPMI_COMMON_MODE_AUTO_MASK:
 		return REGULATOR_MODE_FAST;
-
-	return REGULATOR_MODE_IDLE;
+	default:
+		return REGULATOR_MODE_IDLE;
+	}
 }
 
 static int
@@ -925,12 +928,19 @@ spmi_regulator_common_set_mode(struct regulator_dev *rdev, unsigned int mode)
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
-- 
2.17.1

