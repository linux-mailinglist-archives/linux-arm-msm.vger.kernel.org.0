Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C41537C9A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2019 20:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728243AbfFFSut (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jun 2019 14:50:49 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36392 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727238AbfFFSut (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jun 2019 14:50:49 -0400
Received: by mail-pg1-f193.google.com with SMTP id a3so1858370pgb.3;
        Thu, 06 Jun 2019 11:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BygsFeH7Nr66mPQvbX5gJcEmwzV3pSewGfseE3W/ZuQ=;
        b=XoSInAofZOL2wzQjfB3W8Oo7Vmt4OkVObNHIKYrGfG8euyno+tG13Lj7JMSzdjHOAq
         UkWvSt23pNZJLeTQyglKffCUXI43UjKYV9jYJNwA3Ra8Hhb7gDYnjlyZCxETgRWCOAqq
         wwW8KVkCWljkb7QTovPCGYxT91oPGcFaqkjgRUs8jGZok7OlCutz2NI6NP387Ra7wDkV
         Rh/cvjDzrfuWCUTIhamU0Zu3WXqnM+ICxv09KzcbUfX8iR71Xzk0RDwXYh0NEtDULrlS
         4C17pyG9p+nnBwOUPOzPc6cHohxrqpiwGGvIgQojEL6fjbU8WaSmhWeZkbVHqx5Gk9l+
         DDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BygsFeH7Nr66mPQvbX5gJcEmwzV3pSewGfseE3W/ZuQ=;
        b=lyzaTCHtxSf3fjoTA5vLc7Pk6yikMtFsUM+0eVK0R0V6DrYeSHX4qZ78eWAAY9nyk4
         tT+Il/sf8Z4T1B8BzTanUxLIHZg5+eZDyId+J8WKWcRhzBGs4aZ0CsgyVPA3aZOj3+jA
         MEj2WTjsq7P+g4CaMX6XX+cHU/T1wltJJtmLpT6LeqWG8Jkzi/pbHwS4WftJCy+PU2Cz
         hWoSvJTlAfi9D03HwuSJk+2ufIOSnxPSWEHiqYAEsqmHRTUeB0cK8LzUbnddcduJdq0o
         wzYzPkqRXe9FDT/j3iPzLrHTEHCva64iAooXo9zM+M9dmRZWgVbryf6ZLBkuuqSqr7OC
         auhw==
X-Gm-Message-State: APjAAAUScfoX9i2kpS8PmvsU4MHa8K/oVHEtOkY6tekJay8Q/nq/8STG
        FO9UQ2ky8GmX55ki+tdhEhg=
X-Google-Smtp-Source: APXvYqzNB+ICjLSMCnBXxSuk5MzcT+CM5QqDmiog9HYeQNErLDHAUXAwwBKm4/mhGNjeVkPokx+JVQ==
X-Received: by 2002:a17:90a:bf84:: with SMTP id d4mr1270469pjs.124.1559847048594;
        Thu, 06 Jun 2019 11:50:48 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id y10sm2890609pfm.68.2019.06.06.11.50.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 11:50:48 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     lgirdwood@gmail.com, broonie@kernel.org
Cc:     agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, jorge.ramirez-ortiz@linaro.org,
        niklas.cassel@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v2 1/7] drivers: regulator: qcom_spmi: enable linear range info
Date:   Thu,  6 Jun 2019 11:49:23 -0700
Message-Id: <20190606184923.39537-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606184842.39484-1-jeffrey.l.hugo@gmail.com>
References: <20190606184842.39484-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/regulator/qcom_spmi-regulator.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index 53a61fb65642..fd55438c25d6 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -1744,6 +1744,7 @@ MODULE_DEVICE_TABLE(of, qcom_spmi_regulator_match);
 static int qcom_spmi_regulator_probe(struct platform_device *pdev)
 {
 	const struct spmi_regulator_data *reg;
+	const struct spmi_voltage_range *range;
 	const struct of_device_id *match;
 	struct regulator_config config = { };
 	struct regulator_dev *rdev;
@@ -1833,6 +1834,12 @@ static int qcom_spmi_regulator_probe(struct platform_device *pdev)
 			}
 		}
 
+		if (vreg->logical_type == SPMI_REGULATOR_LOGICAL_TYPE_HFS430) {
+			/* since there is only one range */
+			range = spmi_regulator_find_range(vreg);
+			vreg->desc.uV_step = range->step_uV;
+		}
+
 		config.dev = dev;
 		config.driver_data = vreg;
 		config.regmap = regmap;
-- 
2.17.1

