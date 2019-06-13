Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A83043815
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 17:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732642AbfFMPD1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 11:03:27 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35978 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732492AbfFMOWn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 10:22:43 -0400
Received: by mail-pf1-f196.google.com with SMTP id r7so6070210pfl.3;
        Thu, 13 Jun 2019 07:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=TDt7h/v0kd9jyNnEaaG9yodaGNQqPQNCl5xz0t2eFwA=;
        b=lara8QnMVA+uvkYQAjUHNPycuaPixmWSSUOrW2RfNquJT7wx6ESCJSBxHydyCWXqmk
         KjH18C9kGstJNkz02E76+bKW7xLjszt80uha+HxElqf5EUtyOrY8ZrnExB+568RPs/tt
         46P4cB0EXh8JBQoZ2h0mDoq96cQQRX4e+xy02pM8BlDsj2WyxbAGYeU9oWsmPAEQj/Xp
         WfznG9023EXnYQ+vNC7g7AGmwMOiNpHMvsu8bsR015qBRH8MjDzQYZ+gVAjqh3qM9yCc
         KqV2awRSK8RpZMmcLyoCRElMThewrh3X6Tm2Vb77iDg1Hjc3yqTH6Hl4mcVKEw8ABypH
         eTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=TDt7h/v0kd9jyNnEaaG9yodaGNQqPQNCl5xz0t2eFwA=;
        b=a00hPT/YBq0AYC7rsZDHhduU61HoRwiPs6nWLPK64VAKLvvpMgcSAPv8aRKpdEZU1r
         2ENbGpKuQAGxqx2rSsgg/jtZJU/Oy1qdD0EAtbSLFlPu27OciVlRPQxWpfq/O2jHOiEm
         lkr7jovQxDQXu6iK/6QTTY2HBayObRjR2MDFg4WFfVYpqVIcTpZj/AOvGJrwPhtfpfcU
         GgAezZ/GtfJH6M2/QxYmg+/AMNyrd9rJPSNFBgBAkC+Hx3ACwyCXg5PdcGpzmDP3wMIA
         6BkkCloD9P2kMuTrcYxmZfYyNM3O6VCmQ5eq4Q/G672ADNvrzS8Sradlmk4p6D8lWWiq
         mIeg==
X-Gm-Message-State: APjAAAWjJmr5AwGe+3/soCuOzQmoOKI38bAhxgxSKpGWjHbWMHsFXDyR
        jpmMhRnRL3iajtagfVzymrM=
X-Google-Smtp-Source: APXvYqzR8Dc3CiAAnp7oe1eiS5T1WmvMMVJq/GpKHqj1HZ1hnIZYChyVV+MbnQ1ITOzFHSefY91uVg==
X-Received: by 2002:a62:187:: with SMTP id 129mr6952569pfb.128.1560435762703;
        Thu, 13 Jun 2019 07:22:42 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id s12sm3178667pfe.143.2019.06.13.07.22.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 07:22:42 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     lgirdwood@gmail.com, broonie@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v3 2/7] drivers: regulator: qcom_spmi: Refactor get_mode/set_mode
Date:   Thu, 13 Jun 2019 07:22:39 -0700
Message-Id: <20190613142239.8779-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190613142157.8674-1-jeffrey.l.hugo@gmail.com>
References: <20190613142157.8674-1-jeffrey.l.hugo@gmail.com>
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

