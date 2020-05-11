Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 213461CD9C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 14:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730070AbgEKM0g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 08:26:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729972AbgEKM0J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 08:26:09 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31FCAC061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 05:26:09 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id s20so3875097plp.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 05:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yOzb3IhTI9yPWNl3XI2lYK3qvd7pN2r4jllGR7pHWUQ=;
        b=pwhHoSUCVHs+05wGk4aMRqL1g9yeGAnLqwAgGUoSMQJ0rc7mu49oBcm9LjSVrbFYZQ
         t8Xvu3w3mIEtvn8POrFFF4fBtnl5XqCOZTO6CZ0tE57miFK5qYk64oC4SpZzNnQ5hlhK
         JNMsaI4WqG0kAe0ql2N3FSfvRtcBG3byYgGV1o/GR6F3gwnDSJdsX3GOrgU8z3S0R2U2
         x8hTwg9E6VxijuJydfTP+Nt8OK03Qk9t6cMuu9hSEAj8J0iZ+WJ3UYmUZ5elnhJHN9UJ
         Md6pZGWSMG/GjmxQOFdcq4oGCcQXmBlDLKggHQ02Vo2gx3VHutK/phHRuGIiPP9/26pX
         pzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yOzb3IhTI9yPWNl3XI2lYK3qvd7pN2r4jllGR7pHWUQ=;
        b=MFxCN1dA/kc7rE63T70K1JwKxtu5yvLRogbjbhsaMsLfoGaSe5L2b8GK5RxwFwjALk
         BmPaXDeE1ijFmD21rV0cUQFJywikwDh6swMeEoH3Pj06j8+BxyienghTlwWiaJ1T5cEE
         PfmCcxcoUbGsMcfqcUx7XGRNFruxbljFSr8H/u9zuMWNREfoTHMgRFSWwYv/0UpNhjqd
         tjlKWHL3/14ABtN/lttI0qWYOkqJ2bx05rWuOsDXoKpnfiUoDOmDHLqm8f44GhhPUDzx
         47ehA0QjQ7S02x3pXPrBdt0DC+sAk9Kouu2NnAgq5ebivEePq6OKamoNTsq8Rc+ZMNB6
         /0lw==
X-Gm-Message-State: AGi0PuY3qgqz5vNrg2RbOfborFXY26jZNFJMCq4zimpyzEnVMvyZiQNt
        J3t3S2/9+UmaoBMnX3A3dGeZbg==
X-Google-Smtp-Source: APiQypII8GF6w8vhEPnDEzE0HX6p4o0aWnNJi62GTULFdKWxm4PZwjkfcd95O3F+qhRPvFrwVWV1pw==
X-Received: by 2002:a17:90a:748:: with SMTP id s8mr21384120pje.221.1589199968762;
        Mon, 11 May 2020 05:26:08 -0700 (PDT)
Received: from localhost ([45.127.45.102])
        by smtp.gmail.com with ESMTPSA id 1sm9253822pff.180.2020.05.11.05.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 05:26:08 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Javi Merino <javi.merino@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org
Subject: [PATCH 09/14] thermal/drivers/cpufreq_cooling: Sort headers alphabetically
Date:   Mon, 11 May 2020 17:54:57 +0530
Message-Id: <4231f5dfe758b9bf716981be71cadf9642c83528.1589199124.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1589199124.git.amit.kucheria@linaro.org>
References: <cover.1589199124.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sort headers to make it easier to read and find duplicate headers.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 drivers/thermal/cpufreq_cooling.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/cpufreq_cooling.c b/drivers/thermal/cpufreq_cooling.c
index e297e135c031..1b5a63b4763d 100644
--- a/drivers/thermal/cpufreq_cooling.c
+++ b/drivers/thermal/cpufreq_cooling.c
@@ -11,16 +11,16 @@
  *
  */
 #include <linux/module.h>
-#include <linux/thermal.h>
+#include <linux/cpu.h>
 #include <linux/cpufreq.h>
+#include <linux/cpu_cooling.h>
+#include <linux/energy_model.h>
 #include <linux/err.h>
 #include <linux/idr.h>
 #include <linux/pm_opp.h>
 #include <linux/pm_qos.h>
 #include <linux/slab.h>
-#include <linux/cpu.h>
-#include <linux/cpu_cooling.h>
-#include <linux/energy_model.h>
+#include <linux/thermal.h>
 
 #include <trace/events/thermal.h>
 
-- 
2.20.1

