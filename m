Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 727891CD9AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 14:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729936AbgEKM0B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 08:26:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729931AbgEKM0A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 08:26:00 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D50C061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 05:26:00 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id y6so7781044pjc.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 05:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zCql4ooAUuTgN/g+9s2UxdAjQ5xNIc09/Y+I6KcFQUQ=;
        b=CChggZOiOF6wPGfz67tGwkSY/b0IOdy3G10yE5YLYsA9sOtR0HAb1ajPJXGbKpTH5/
         mRtrv5vjwUK0eviQAVLCQfl2707XNgYBMRaqfgKAvZJ6lyyphBlVjKRwupbgmXasAPs7
         kzvc19w6B/op1OO1ERMqzl9GQo7c6lLpRYuZIS6EHf8l9ZjzvJDuoGMHvzMUxx46uVsY
         Cw3M8SZZIzLVdwaiqfBE2amFqhMcePNjvBL504W9a2jbzau2x76EyVcnPmtLc4W54AA3
         6YTnXVtAHx4ir4BjCk2P7C7Tbyghv/Lza8HepXuuG/c9TxiYXSb5hZJsbGSvV1duIJoi
         Mqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zCql4ooAUuTgN/g+9s2UxdAjQ5xNIc09/Y+I6KcFQUQ=;
        b=KaskJ/LHUpUjKIwmXlJ0AvSAWvogAhzXE9AkS6ZlNpW/T4g0hGMXBz1Rx8cy23OOmp
         EIvXnbLMLgcbxIhbPA0kpIy5ncHan3tkWYj/LmfVhULGsGK4xIrq9a4IAazfzzobkY1o
         GTzZEwKbcAET0GzMyNwEDf8Z3F2DlGpUWzZI1FpjNzoi93NQTGFMuuftk/Hx0KZiHpho
         tN30HBAEEr2/xQ97ADq3cURadgDK1AXgBgCVP4yS9BI8hU6ULHRXsDu3KBkJrU/qDwQt
         iOKtEmvVI8bX65VqTEzxxZbE8xjp3annMa4+1uqaZOB1r5YA7Ray2ZN/K0YVkviEcrDx
         I0Mw==
X-Gm-Message-State: AGi0PuZHwcYmIuyLO7p7FaeVaGb8ZWZjajePTHcXHOBskAMR3opUr6Rd
        s2N9Z4nkjXYmJbkyPtqdT+osmA==
X-Google-Smtp-Source: APiQypKPC1afq3Uf7CysVIw0pp3L8MnJhqmgDKdlfuFIa4EB7N8f7T9aJ/vqMRmxqNKOQwG9rbq/0w==
X-Received: by 2002:a17:90a:1b4c:: with SMTP id q70mr21828271pjq.55.1589199960240;
        Mon, 11 May 2020 05:26:00 -0700 (PDT)
Received: from localhost ([45.127.45.102])
        by smtp.gmail.com with ESMTPSA id d7sm8656036pfa.63.2020.05.11.05.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 05:25:59 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Javi Merino <javi.merino@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org
Subject: [PATCH 07/14] thermal/drivers/clock_cooling: Sort headers alphabetically
Date:   Mon, 11 May 2020 17:54:55 +0530
Message-Id: <f8e1258fd8b882bab018de63c7e713b4334fec30.1589199124.git.amit.kucheria@linaro.org>
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
 drivers/thermal/clock_cooling.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/clock_cooling.c b/drivers/thermal/clock_cooling.c
index 7cb3ae4b44ee..fd6bc6eefc88 100644
--- a/drivers/thermal/clock_cooling.c
+++ b/drivers/thermal/clock_cooling.c
@@ -12,6 +12,7 @@
  *  Copyright (C) 2012  Amit Daniel <amit.kachhap@linaro.org>
  */
 #include <linux/clk.h>
+#include <linux/clock_cooling.h>
 #include <linux/cpufreq.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -20,7 +21,6 @@
 #include <linux/pm_opp.h>
 #include <linux/slab.h>
 #include <linux/thermal.h>
-#include <linux/clock_cooling.h>
 
 /**
  * struct clock_cooling_device - data for cooling device with clock
-- 
2.20.1

