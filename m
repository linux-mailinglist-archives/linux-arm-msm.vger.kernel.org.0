Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC621CD99A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 14:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729573AbgEKMZh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 08:25:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728367AbgEKMZg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 08:25:36 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34684C061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 05:25:36 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id hi11so7777418pjb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 05:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+8aLBVF/jCNJkdmjTC/dudzjrY2tWkvRd1FtJjGwyUk=;
        b=euAP57wveF2y86MHZ6NV58TG0vSv9YKmBb6lQBV0IXubepFm2dNRippIbx93bponZ/
         5wu/RJRdOf1qM2bbmrGpSz6ojY2+0ae6Qi4gMb85pkSOp3p5T8376FlCZC/M5FXpk4hx
         T/CG2lZEw/CxOK3WQJXCioactq2A219Yv7f39F7U1X06RdQKm2O0Tcq9G7B+DEFMpvre
         GOUC/s4gXAOPn04Knsz2blgFHT8mZH61ngqCNUywerOsLd4Dd7ttlBYrsWsIFdMTSZID
         5AuWs8pFndMg5h1/INazI5Eygmo5OCwm53sWmj7im2uP1zvY/+pyW4Ie2fzgz1l8KdY7
         s3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+8aLBVF/jCNJkdmjTC/dudzjrY2tWkvRd1FtJjGwyUk=;
        b=qixrfMqRPhyynIFDCSJM81ZDmk5/C1Vy6FZtMNUjt+2HoK2tiPuTAA7dl4BKNrCXbt
         60vqV1B4VciDbAaBxNrXhZIqvTzmnstHNV5o6iBTw4UIHpWdWMNaEIQnBL5P78FMVUSl
         Q6NJW179l0hrdVDkunDeiFqflQjNubfu/j43mpjg07ncTBMNciinjB3SYLyBK10rWhtM
         t3sd8GYZQpGqxVMfk3/1708i3KqaCrmiiX+oboZ6JHOl/0siEkUrRNvoXuWEPhhdNzyk
         XGef8o5XZIwuodGV11GNYxQTHDPEQtUwH48wSCjRNFyFp+b9d8peHB1Kk7cWV0jGD7Mb
         8WYg==
X-Gm-Message-State: AGi0PubttkW9H54ls9uR7Zlh715V9KXzu8jUSiRCvr1XfggU+ceVEYLC
        rfMivSK8FbtuPGr/BUFRVPhf4A==
X-Google-Smtp-Source: APiQypJ4qBRsFtSTkkiLyjxDBfw6clVcHL7/Oi64wn/3ZpAx5AIZwfiiazyOlZANpe6NwClLBYs2lA==
X-Received: by 2002:a17:90a:1501:: with SMTP id l1mr22882557pja.82.1589199935696;
        Mon, 11 May 2020 05:25:35 -0700 (PDT)
Received: from localhost ([45.127.45.102])
        by smtp.gmail.com with ESMTPSA id q6sm9049534pfh.193.2020.05.11.05.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 05:25:34 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Javi Merino <javi.merino@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org
Subject: [PATCH 01/14] thermal/core: Get rid of MODULE_* tags
Date:   Mon, 11 May 2020 17:54:49 +0530
Message-Id: <74339a09a55f8f3d86c4074fc2bf853a302d6186.1589199124.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1589199124.git.amit.kucheria@linaro.org>
References: <cover.1589199124.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The thermal framework can no longer be compiled as a module as of
commit 554b3529fe01 ("thermal/drivers/core: Remove the module Kconfig's
option"). Remove the MODULE_* tags.

Rui is mentioned in the copyright line at the top of the file and the
license is mentioned in the SPDX tags. So no loss of information.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 drivers/thermal/thermal_core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
index 9a321dc548c8..286920e06277 100644
--- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -27,10 +27,6 @@
 #include "thermal_core.h"
 #include "thermal_hwmon.h"
 
-MODULE_AUTHOR("Zhang Rui");
-MODULE_DESCRIPTION("Generic thermal management sysfs support");
-MODULE_LICENSE("GPL v2");
-
 static DEFINE_IDA(thermal_tz_ida);
 static DEFINE_IDA(thermal_cdev_ida);
 
-- 
2.20.1

