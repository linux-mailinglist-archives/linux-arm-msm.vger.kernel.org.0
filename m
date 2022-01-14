Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50CED48E7E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 10:55:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240146AbiANJzf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jan 2022 04:55:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240140AbiANJze (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jan 2022 04:55:34 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B704C06161C
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jan 2022 01:55:33 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id m3so14503308lfu.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jan 2022 01:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jcNavX0axWJjyr6z5STu4vgi23NjQoYnwvWUl5MZ3hc=;
        b=JDBZOh0UO3jGbp+k6GBnoDk2nMJxjyQrNUd1laMwg0CWwZUXrHSEriH/dmPKMnMcLn
         UZtoEbELPz03IsIR+ZCDaLNg8+FJw5jPlgsfO0gSnuKMplPi2TQr4SmYAg9iWLUkZ02n
         n6qIkPm1/WoEiJGNhsTbhvp8pM2hHtFwu3S+1eGF1eWkWm9uOuF/chBIlMKSldmKRQUL
         NphSRHMtSTVHH/jC5kTsb3W7qyMgJHCDuepopIVZPvDdfPInFpCxk4TxyuQraaGp/JFs
         /tteda9nzvxQw8j0lY9v69WBHddQnHgSpeHiYvUkNHyesai5Meb81L3Cpb54xcrubJXm
         ZoGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jcNavX0axWJjyr6z5STu4vgi23NjQoYnwvWUl5MZ3hc=;
        b=HqJ1UkLwj6xhh99DKZ1fB2k1NggHVglaEJ8bWOEOE/Vc/WNl8NVdaRPBG43CnvXAjk
         cSWafL/+SoGelY2EOQR8P7zQjk8qi3M1j+42UEC+qZCjb/kSTqiZft2k0b0Zm2Cv5HWi
         tvf26g/QdcTuFqZnNxoGwHh77heQvQmeugX0UGetqtYLzqDKbn9ll2IZmTmUFVqbsQ7B
         HwZwsJTlXN6wGb94JFcXsOGgwKMc9HfXh2rrvgeh1k2PNxnL8Luc2jWeNrmj5VTQqCSC
         KfuFmS9brxurEBuZGrBW62U9rjBfsikT3jbSpiR+J6D+YHAsgkSE4nbNLGO4e1IHFScI
         FRrw==
X-Gm-Message-State: AOAM532YtfT+mE7k43UfbYDtSGPhEgThZezrsWk6V+AFfmzbHvHPC04c
        Ok4oRKE6vtQ958tQz4hi6F47ug==
X-Google-Smtp-Source: ABdhPJw13uTssXbCy5D1UHHookGMzDX350Za1r8US/K+8CoQ57oJpW9w+fcxo9DFFWk69d83l3pHsA==
X-Received: by 2002:a05:6512:31c1:: with SMTP id j1mr1893811lfe.395.1642154131346;
        Fri, 14 Jan 2022 01:55:31 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f24sm536718lfk.187.2022.01.14.01.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 01:55:30 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH] thermal/drivers/tsens: register thermal zones as hwmon sensors
Date:   Fri, 14 Jan 2022 12:55:29 +0300
Message-Id: <20220114095529.1754065-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register thermal zones as hwmon sensors to let userspace read
temperatures using standard hwmon interface.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/thermal/qcom/tsens.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index 99a8d9f3e03c..c13093e8a642 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -19,6 +19,7 @@
 #include <linux/slab.h>
 #include <linux/thermal.h>
 #include "tsens.h"
+#include "../thermal_hwmon.h"
 
 /**
  * struct tsens_irq_data - IRQ status and temperature violations
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

