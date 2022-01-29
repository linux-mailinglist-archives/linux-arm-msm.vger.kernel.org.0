Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 137404A314C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jan 2022 19:08:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244812AbiA2SIL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jan 2022 13:08:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353081AbiA2SIG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jan 2022 13:08:06 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FB42C0613EF
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jan 2022 10:07:53 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id a28so18200985lfl.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jan 2022 10:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hXL6L2zK8AglMazhyj7WKYzd8b5nE29SexQFpyrPges=;
        b=zcKKZvcPffsxsHOa+3qtba75zbC/g7ivPk/B74rX9LsCUYvPPn4wLaIwzjfG/LVFVZ
         2ctYU+HywBnUXs6sdP9k9MkrcM7ioRVrb//2jsmhE3XBUOMKvf1O/vZ0Hl3XFQNqVTDy
         Mw4H9ddrwnro+rBieGy5zjDPOjS7rPEn+HTjORZ7dQOZxRZSeHXry6w2ddPEe4KTIwE2
         VmDpG1Aw9wffaX4/wX7CFmkGa5kY5Ws8eu/OetzDIsijaoaIJc7o6XtCy22h1PplGbA1
         uRbIUqBqLY55dc3a0T7RY2c1A7vnBU0X2O0H4mQ6a9WLwoa1XV1YVH8OrCH9Q2VNgl97
         TeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hXL6L2zK8AglMazhyj7WKYzd8b5nE29SexQFpyrPges=;
        b=1UrsAJJZ13tVMkxhAqnZDDUcpCp77JPNH1hzJ8WtoBmptpgPyxK7YKfT4v0woH5pSA
         mY4H/9PHxgyQW8oIbA+1gxSTikaog4gmbWjRdsW0YGjhnYkWau4ww4biBYq7u/xAlRAa
         T5lvLn2cF7XIIdLJcdb7vhi+98joMrzJ5CdudnRFqfDcWWeH92dqLm7jPGisNAtdZkRB
         ALj4puQSzvVDu6I55hqplTyN2wuK5n3NpS5/PmdQiBOJbDNmAkN0RQpQx6zfPIhCOf6k
         KVkJRsQSfJOJ+lo9cSoyMFrNcUtIDt+TwDasbJayB4w3hbB0k2OhspDkBXx5z3SkBUkt
         upKg==
X-Gm-Message-State: AOAM533mJ/5BW4Q+aMGL0ttXobPOAhwTalvnuUletbZqvqu16NeAXMku
        CEoWRoDcaquY0lgcQZKMZIVoiu59Wv5nxg==
X-Google-Smtp-Source: ABdhPJyYU7zzYV0xs3gVEXwNC6ZG2dpuAPPTdFYicI9B3vh5imlKY77pOLY518ol1vQcsjFbjat/+w==
X-Received: by 2002:a05:6512:108c:: with SMTP id j12mr10015026lfg.514.1643479671788;
        Sat, 29 Jan 2022 10:07:51 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y3sm1713464lji.96.2022.01.29.10.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 10:07:51 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] thermal/drivers/tsens: register thermal zones as hwmon sensors
Date:   Sat, 29 Jan 2022 21:07:50 +0300
Message-Id: <20220129180750.1882310-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register thermal zones as hwmon sensors to let userspace read
CPU temperatures using standard hwmon interface.

Acked-by: Amit Kucheria <amitk@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/thermal/qcom/tsens.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index 99a8d9f3e03c..154d3cb19c88 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -18,6 +18,7 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/thermal.h>
+#include "../thermal_hwmon.h"
 #include "tsens.h"
 
 /**
@@ -1060,6 +1061,10 @@ static int tsens_register(struct tsens_priv *priv)
 		priv->sensor[i].tzd = tzd;
 		if (priv->ops->enable)
 			priv->ops->enable(priv, i);
+
+		if (devm_thermal_add_hwmon_sysfs(tzd))
+			dev_warn(priv->dev,
+				 "Failed to add hwmon sysfs attributes\n");
 	}
 
 	/* VER_0 require to set MIN and MAX THRESH
-- 
2.34.1

