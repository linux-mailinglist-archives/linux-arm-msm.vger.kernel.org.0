Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9AFFB059E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2019 00:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728872AbfIKWcv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Sep 2019 18:32:51 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42829 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728521AbfIKWcv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Sep 2019 18:32:51 -0400
Received: by mail-pg1-f196.google.com with SMTP id z12so708893pgp.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2019 15:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=rCgC8Qrm5F0gNSrIs0vFn+72THJYWJ5Zs57TxaytFro=;
        b=uAu3IFF7H4n58zHhmASCIixwb4gEbmqJtpGTmmF7HVJPuloEcVxrhqHsmxgMVu0Xc3
         MR9qPqOcC5Mpz1Kscbp6vse4E4prUvF6A2P2TgBH20yQMocZPth0L35N+4OFswJWTiiS
         aQSGs0wbIg7MU3if4kuGqUq+frQ6peNPr19+hIkBr6vC7XZuz5N8Rx9Eq3lc55a6QKe+
         n2i2q4/inHIe6HrJWm/54cQ7pjHzszN44EL5iuSGKnelBzv0mfiwVPyr4CAYJmj9K9W4
         +6M1RPvmEoMhPqNxEadBR7sSbKhu9ZFSQhD8PfuSbAzehJ3G5I3DWjzDMIS7Erk4C8Uc
         V9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=rCgC8Qrm5F0gNSrIs0vFn+72THJYWJ5Zs57TxaytFro=;
        b=rYr3PZk4nuQbh1Iy+FLALEhntdsX6pY5cCsNaEIGG+8aZyth61LrCqBFLSKurY6XM8
         1J6kKjBLpL5uqhK4lUYb8U3RW8rwZtvmrfHe6uNu9np9vgKsCVpaoZjDHcl8lbfwCDMs
         dgwPyj9hbEaE+eCdTKWbX15aQB2q3mDJXINGJ4IqUHl/4e1m8LDsbLQ4LHVJK3HlUh11
         8DxhDHu/nFEh2MYNi5+QTLxc7/GsWN1+jDlfk29f+mvG0xuzxCRNIXwfFedzrw5zf/RH
         KRxDc6pTn2bdCHqy3TGfvH7yK+8mYWKIEIx8YBLvYTfTNZe7ai9fBBsRUWYX+X2nA8Wd
         qGbA==
X-Gm-Message-State: APjAAAWeqILu28nTmpnD3/5FcQLYD896uQmI7Lmza4S2GmGS9jz105Tt
        huOHiKQ2Ayf0P70NehyjF7j6iw==
X-Google-Smtp-Source: APXvYqxjHp1AP2HznEflZ+tVWWOn7YNF8jnr1eEJ2vJdV+IzbtqSmn/f2+XvWevzUHetdPPxoCAjEQ==
X-Received: by 2002:a17:90a:ad46:: with SMTP id w6mr8144055pjv.52.1568241170728;
        Wed, 11 Sep 2019 15:32:50 -0700 (PDT)
Received: from localhost ([49.248.179.160])
        by smtp.gmail.com with ESMTPSA id p68sm42585690pfp.9.2019.09.11.15.32.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2019 15:32:50 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        tdas@codeaurora.org, swboyd@chromium.org, ilina@codeaurora.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org
Subject: [PATCH 3/5] cpufreq: Initialize cpufreq-dt driver earlier
Date:   Thu, 12 Sep 2019 04:02:32 +0530
Message-Id: <23d3ed7edc8b859da8e7640f77cf3028ad5804f3.1568240476.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1568240476.git.amit.kucheria@linaro.org>
References: <cover.1568240476.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1568240476.git.amit.kucheria@linaro.org>
References: <cover.1568240476.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This allows HW drivers that depend on cpufreq-dt to initialise earlier.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index 03dc4244ab00..12c79c92a2b8 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -175,4 +175,4 @@ static int __init cpufreq_dt_platdev_init(void)
 			       -1, data,
 			       sizeof(struct cpufreq_dt_platform_data)));
 }
-device_initcall(cpufreq_dt_platdev_init);
+core_initcall(cpufreq_dt_platdev_init);
-- 
2.17.1

