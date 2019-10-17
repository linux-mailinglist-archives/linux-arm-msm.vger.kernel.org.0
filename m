Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45DB7DAC27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2019 14:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502360AbfJQM2A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Oct 2019 08:28:00 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44397 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502358AbfJQM17 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Oct 2019 08:27:59 -0400
Received: by mail-pg1-f193.google.com with SMTP id e10so1265156pgd.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2019 05:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=Dxo5X+E9Ol1EaiMF1ZycTVksoTfNCn6yYqPoCwK1ut0=;
        b=egK4qvYjE7EBixFsyZw/Kr078NfjAaHkhTpbfmT1U8TUKYQS3TWhZar7iJge8A07DK
         sU5cpQuotBcsaO4hCkFmOhPY4FbwLuQQd5m0yXzMcvo+Z69ZOXqN3BdJr2IRKQYu7vCp
         K9ScS/0a9YyM8Tbd2gkLDTPN/49QzDpGta13xl6ZRzPqnGn3vmMwJQHkR4SYu1b198ho
         KdjwHZKZZwzew3KwyZ4tYS3rNUjoJBb7eAcf+PRl70qDYOzmOMpzxBKtUDNX4wnNYRNB
         DmtCOTZLc81gvkP/WIFXEi6syWHVXvfPUG9JjfK3ScoMSMcs3xwFeFyeyUgAULQ653oh
         693Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=Dxo5X+E9Ol1EaiMF1ZycTVksoTfNCn6yYqPoCwK1ut0=;
        b=L4wQTcVaKqdiEySorE+g0O/PBWzz0qnMDRoqZLASafxm1VAgH11s9i2PSa3jVrtSVS
         /aF68J0CRT657zt0BKaB4DHDJ8HoM/GEL70ESZXftZrKCfUtG3nB5v67BsFXl5/U/30P
         hQg0L083iHfPm00xygzQyRLaLKkDCZ3jj3NafTduEQXsKrdY3Yhc7H4AJ4xvXR7I68vQ
         SX2IrOb+PHSngW7HJzbGQkBM6mn5bQrdT3G/E9VT2FF7KzHl0cxIY5bUbdLylbX6Cenz
         dA8XicbzStTmQAZh5YUaZTZy72lRbLAcVfPuh4+5y9ZqfePPgXFUob40lyguUBZOqHVN
         P/cA==
X-Gm-Message-State: APjAAAW/m/s83FQTrQH4p+RPd/zTKtg2jId02PJvDeoSRSi6OLKg4G4t
        oXTvVIy5whxaPglz++WxSa2HNA==
X-Google-Smtp-Source: APXvYqzGLzD52zmSKxtJBG7Fgaht2Hci65RkrcVoI3J604NgxX1LNv5xLN76oaaOe048MuUDrfH3EQ==
X-Received: by 2002:a65:689a:: with SMTP id e26mr3852060pgt.346.1571315279010;
        Thu, 17 Oct 2019 05:27:59 -0700 (PDT)
Received: from localhost ([49.248.54.231])
        by smtp.gmail.com with ESMTPSA id 207sm2692918pfu.129.2019.10.17.05.27.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 05:27:58 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org, viresh.kumar@linaro.org,
        sudeep.holla@arm.com, bjorn.andersson@linaro.org,
        edubezval@gmail.com, agross@kernel.org, tdas@codeaurora.org,
        swboyd@chromium.org, ilina@codeaurora.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org
Subject: [PATCH v3 4/6] cpufreq: Initialize cpufreq-dt driver earlier
Date:   Thu, 17 Oct 2019 17:57:36 +0530
Message-Id: <9e2bce44ed6bf3aac2354650fc3bf5c43e2155b0.1571314830.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1571314830.git.amit.kucheria@linaro.org>
References: <cover.1571314830.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1571314830.git.amit.kucheria@linaro.org>
References: <cover.1571314830.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This allows HW drivers that depend on cpufreq-dt to initialise earlier.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index bca8d1f47fd2..3282defe14d4 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -180,4 +180,4 @@ static int __init cpufreq_dt_platdev_init(void)
 			       -1, data,
 			       sizeof(struct cpufreq_dt_platform_data)));
 }
-device_initcall(cpufreq_dt_platdev_init);
+core_initcall(cpufreq_dt_platdev_init);
-- 
2.17.1

