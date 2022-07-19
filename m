Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B74E5792BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 07:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236926AbiGSFtq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 01:49:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235807AbiGSFtp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 01:49:45 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 040972F3A1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 22:49:44 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id bp17so23014474lfb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 22:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EV7J2evjbv3FZUZN1eeFth4oNvs49+wln9t6xNZ58P4=;
        b=BVePoaWkGV7zZKFou3iA9JV9G1g1TzYhf2PN1ioevNsOvkF+DwdLQdWbZbHLzDd31w
         Fl1hcDZi15cFUVjMl8CD1d+oMSf7W9T0Ly86gs35Nzps5xuqvn1k2D0yJ/TytoNnbZGO
         9qLR0Rmn6V3PQTbYroplo0aY53Fzhbv2EtdmrCWr2JLx3eOlHEEe3LJjrjgeEn++khy0
         z2AMYIJEhCxZgCD1lpS51rGnBXdkH0XsXyfe2m1gU16ExC9njyGzQqESF6ex/Bzm1JmI
         1XO+pDMJ7Hhe/7QXfmznMJhUNLYXeKgo/3OyEvsmTyr4agBe0FCsXsyGHlIYQFRL+XkC
         HglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EV7J2evjbv3FZUZN1eeFth4oNvs49+wln9t6xNZ58P4=;
        b=KMQtTBZx1EGBZnPZd8lOsdP3q9D68cPRHd3mfHlHBenc0NvJRzetQy3Fk70ZT6t8+G
         2ti5Bv2+pAMmtlr28Jo7l/+DE7Bz1luBs9BOagQWQLWRXAVMysLYuBRgnL/zv+/Vi6QB
         ghD1RwSyaXNWwV7mXXkk7WvUI6UiP8PlAWO2Ih5Aq1ktDRZrToSeWMM8jaIL2ivZG9bS
         Cp6bI+SnOSVfL/uwoY7EPDKqeUkd2MNTeVo1ZTpQ9hMlQT5HpwrvaEJACwpy1GjLoJar
         FqWpeI3Ew/lM5ltAzdHi9K5sJbUBymB4JJB2gaSsKaRGom4FIC163l/kX9M5HANrpkzW
         DsCg==
X-Gm-Message-State: AJIora/8SISUQOr26EF8T2TEWDQ4ZYWhx3UKWylkNOZrfEo3tgxTGCLw
        S8Nh6e+grTkgYPOiZBcyTPlHYw==
X-Google-Smtp-Source: AGRyM1s50HLvXHw1o/rk7nFQkMWxClg3l9vwg65DaAkfly0jvgRlJkvYI3Gdo8qek7W02gBo68lTDg==
X-Received: by 2002:ac2:51a6:0:b0:489:c578:cf75 with SMTP id f6-20020ac251a6000000b00489c578cf75mr15931550lfk.24.1658209782349;
        Mon, 18 Jul 2022 22:49:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s10-20020a195e0a000000b0048137a6486bsm3005120lfb.228.2022.07.18.22.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 22:49:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH 1/2] thermal/drivers/qcom/temp-alarm: register thermal zones as hwmon sensors
Date:   Tue, 19 Jul 2022 08:49:39 +0300
Message-Id: <20220719054940.755907-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register thermal zones as hwmon sensors to let userspace read
temperatures using standard hwmon interface.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
index 7419e196dbb0..770f82cc9bca 100644
--- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
+++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
@@ -16,6 +16,7 @@
 #include <linux/thermal.h>
 
 #include "../thermal_core.h"
+#include "../thermal_hwmon.h"
 
 #define QPNP_TM_REG_DIG_MAJOR		0x01
 #define QPNP_TM_REG_TYPE		0x04
@@ -458,6 +459,10 @@ static int qpnp_tm_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	if (devm_thermal_add_hwmon_sysfs(chip->tz_dev))
+		dev_warn(&pdev->dev,
+			 "Failed to add hwmon sysfs attributes\n");
+
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, qpnp_tm_isr,
 					IRQF_ONESHOT, node->name, chip);
 	if (ret < 0)
-- 
2.35.1

