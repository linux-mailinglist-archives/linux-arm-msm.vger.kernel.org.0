Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7B61CD9C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 14:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730058AbgEKM0c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 08:26:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730042AbgEKM0b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 08:26:31 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 304A1C061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 05:26:31 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id fu13so7700600pjb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 05:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XND7Ft1QHmviKkz6VujX9JUe2hE4nNkjYKIH9ZGOL2c=;
        b=qq74y2cmWrgyNBuVo+ZVQ82V6vuYaeXy47j9lpqUOsM5LvjXdIpScs5Cyl8Woe2rKJ
         wbeZGdChqEHWYorM2c8iT+ZzGdPgYODIHY0yc8UfNgRbe0kedUDdsTlRpZUuCgD+Xp06
         zCmV1VYQx6p5E3PmCTciMt2nmg4AMB00wgMERiE9GJHgkg5iWu1ODLrXpFTISIHCssK0
         Pq7e++v0MLeOZBPcwVdvcZ+dp5s+yTCRB8Q25/8dNmXYCEhlsDAa0qoWua15uG9Nhon3
         /0cdL5w8rP3i10tpxI7R4WSEKga8awqQ34bJYAIrheJXcM277MC79Wcnzw06DSWv0+5a
         Kc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XND7Ft1QHmviKkz6VujX9JUe2hE4nNkjYKIH9ZGOL2c=;
        b=DgIxNKF6qmPbG2Bzh1isUVki6l4NgADcABFrjEZEnR3a5O3Kv/6WcSxEiOWm4GuIcq
         UTncfm72WUdhDNOYCCfRS71iuLY2nmDch6XLN03jC6Ls6E152XYuSDZdQ0tBHSJPBClV
         FaoGJrGe9hMS5dvjLmYkUMdNNWye/XTEu8NAryfaiJ/zPdnnhl4uLQUZR22L+NBxANiY
         bPKHR5ZpbPoRhDmjqYveZ9xzuXTAcxiqd6LACf0XLzvzmanapHKpzqv33VS1extgnzac
         C8cUlEd3NE611UIIzhgWbfIEYzLjX1Vu2hVBPGYqAB3h4klmpHx+mBJxOwvC1/j6Fq57
         Mq+w==
X-Gm-Message-State: AGi0PubxkhRPhUpF0qwknVUrQB+RXiWSDsX+4F9Fli3zhf2zZ9z1X8PD
        smtYZZYtoRHckjX6CRZL17TLmQ==
X-Google-Smtp-Source: APiQypI5fvYsRF8XnQe9EPoaeEun1n645HV0jOql6fL0RQEqTubw4z2wfOtKrErX3Fbm2RhA6mQO2w==
X-Received: by 2002:a17:90a:fa3:: with SMTP id 32mr22841991pjz.224.1589199990623;
        Mon, 11 May 2020 05:26:30 -0700 (PDT)
Received: from localhost ([45.127.45.102])
        by smtp.gmail.com with ESMTPSA id y2sm9235710pfq.16.2020.05.11.05.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 05:26:29 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Javi Merino <javi.merino@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org
Subject: [PATCH 14/14] thermal/of: Rename of-thermal.c
Date:   Mon, 11 May 2020 17:55:02 +0530
Message-Id: <f5e233d5c5dcc7c7cb56b3448da255cb2c9ef0d1.1589199124.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1589199124.git.amit.kucheria@linaro.org>
References: <cover.1589199124.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Core thermal framework code files should start with thermal_*.
of-thermal.c does not follow this pattern and can easily be confused
with platform driver.

Fix this by renaming it to thermal_of.c

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 drivers/thermal/Makefile                       | 2 +-
 drivers/thermal/{of-thermal.c => thermal_of.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/thermal/{of-thermal.c => thermal_of.c} (100%)

diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
index 09ff0e259d46..d7969dd553cb 100644
--- a/drivers/thermal/Makefile
+++ b/drivers/thermal/Makefile
@@ -9,7 +9,7 @@ thermal_sys-y			+= thermal_core.o thermal_sysfs.o \
 
 # interface to/from other layers providing sensors
 thermal_sys-$(CONFIG_THERMAL_HWMON)		+= thermal_hwmon.o
-thermal_sys-$(CONFIG_THERMAL_OF)		+= of-thermal.o
+thermal_sys-$(CONFIG_THERMAL_OF)		+= thermal_of.o
 
 # governors
 thermal_sys-$(CONFIG_THERMAL_GOV_FAIR_SHARE)	+= gov_fair_share.o
diff --git a/drivers/thermal/of-thermal.c b/drivers/thermal/thermal_of.c
similarity index 100%
rename from drivers/thermal/of-thermal.c
rename to drivers/thermal/thermal_of.c
-- 
2.20.1

