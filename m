Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6A574C119
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 20:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbfFSS4p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jun 2019 14:56:45 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34379 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbfFSS4p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jun 2019 14:56:45 -0400
Received: by mail-pl1-f196.google.com with SMTP id i2so202378plt.1;
        Wed, 19 Jun 2019 11:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=OkzFZAuud0Hfdg+gFLkDdFw2KlS0o4maAGobdQqqxOw=;
        b=K09sKTfzk/1V1FVb91KhHBhulMdP9dNiW6yCmG1LmZh0tzpexURLjG/yaLbz0FfkoG
         UXr+4qqSEzDqDYENevwQmTYDbrOBIDNHLIieLlfKQCjBD44KXcipKhl2bOUgqGzNBCvr
         3bO75bXzvM7Ae5tjrDiogwG4DzrlyAbgfT61ScataheFtrDfDX2tiI04bDGVJPVqkycV
         tdy/tkT1zZup0CmFnE5myLMDyAXBWjN0vgLk6SSF8sczFWxO8mqA6tyrb4sAFNUxAp5C
         sY37aK1w4F6aveM/j7giDolEiIDnja2EiD99h8XYRuP+Q55t7W8UO5dPfkm0IwbU/sR8
         bdAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=OkzFZAuud0Hfdg+gFLkDdFw2KlS0o4maAGobdQqqxOw=;
        b=DVSS0dKtZF+VL25XzhkYz8pLi8RBnF+vbTvDSCqIKhjvBU7IAk6ATItc9LnB2+PVFE
         qZ4Y7rJG/GsNw7CbyHoIvE41kFqpQcvLufQtZ/QYGnGAylcx6OlDxn+YdmHSjgDDHffn
         cA+1YmiwAZEd0ozL3h00jzkjUglWKuF0umP/XitFwuL6PPe2t7xZu7Fkxaf3R2Yk1hvt
         S8Ma85KdrqiHpklAWznebsG6h1IvXiNvbvuO6WeOr1j5OHjM5lD0qY1egWD/753Qd6mc
         UqHWENrpkedbcS7E/PR/1DJGF2AGsim8FLZXBvTO1gaW6/VJLrxRzuBvIbbNTDKXIaYK
         CZ5A==
X-Gm-Message-State: APjAAAU1xMt6Uj5ap6uj0R1FXjWNUJMBxrElcvWrCEiLgwRkl9e6vgC+
        iRwwDu0hU/O3CWvJrEH3Syg=
X-Google-Smtp-Source: APXvYqxqdyV3MHM7B6JUL4lVQy99pP4kEfyZIwn/ip1Zpfjp5DnHT/byaPd6NIZ2CtYIS7swafeFfw==
X-Received: by 2002:a17:902:b187:: with SMTP id s7mr29283066plr.309.1560970605062;
        Wed, 19 Jun 2019 11:56:45 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id b26sm21627842pfo.129.2019.06.19.11.56.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2019 11:56:44 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, jorge.ramirez-ortiz@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] regulator: qcom_spmi: Fix math of spmi_regulator_set_voltage_time_sel
Date:   Wed, 19 Jun 2019 11:56:36 -0700
Message-Id: <20190619185636.10831-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

spmi_regulator_set_voltage_time_sel() calculates the amount of delay
needed as the result of setting a new voltage.  Essentially this is the
absolute difference of the old and new voltages, divided by the slew rate.

The implementation of spmi_regulator_set_voltage_time_sel() is wrong.

It attempts to calculate the difference in voltages by using the
difference in selectors and multiplying by the voltage step between
selectors.  This ignores the possibility that the old and new selectors
might be from different ranges, which have different step values.  Also,
the difference between the selectors may encapsulate N ranges inbetween,
so a summation of each selector change from old to new would be needed.

Lets avoid all of that complexity, and just get the actual voltage
represented by both the old and new selector, and use those to directly
compute the voltage delta.  This is more straight forward, and has the
side benifit of avoiding issues with regulator implementations that don't
have hardware register support to get the current configured range.

Fixes: e92a4047419c ("regulator: Add QCOM SPMI regulator driver")
Reported-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reported-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/regulator/qcom_spmi-regulator.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index 13f83be50076..877df33e0246 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -813,14 +813,10 @@ static int spmi_regulator_set_voltage_time_sel(struct regulator_dev *rdev,
 		unsigned int old_selector, unsigned int new_selector)
 {
 	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
-	const struct spmi_voltage_range *range;
 	int diff_uV;
 
-	range = spmi_regulator_find_range(vreg);
-	if (!range)
-		return -EINVAL;
-
-	diff_uV = abs(new_selector - old_selector) * range->step_uV;
+	diff_uV = abs(spmi_regulator_common_list_voltage(rdev, new_selector) -
+		      spmi_regulator_common_list_voltage(rdev, old_selector));
 
 	return DIV_ROUND_UP(diff_uV, vreg->slew_rate);
 }
-- 
2.17.1

