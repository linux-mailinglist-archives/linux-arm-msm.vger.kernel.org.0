Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9752411270A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2019 10:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727351AbfLDJWl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Dec 2019 04:22:41 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35031 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbfLDJWl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Dec 2019 04:22:41 -0500
Received: by mail-pg1-f195.google.com with SMTP id l24so3090629pgk.2;
        Wed, 04 Dec 2019 01:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=RcbR6HMJahH8S+8hPGsQFh+2INPfSPu+4YZ/KRZS6sc=;
        b=PwlNbmcj4jRwxxtbvay8AMytuXlVyeudiTZ53oMfDtNYcWxsPz7CfiWLt8/bZw/ZLF
         tn8kb7NrVwyZAJsL5jlEo9x40Nlfb7GNVsNK/Iptj6+Hm3BSeR94AsgKqPhE9LS5KAis
         hcPOSZQ4MQ//VYvKRoarhYGvkZR9VFbklNcdDZk38sI//HjxnvU8WguqadxpIZpsspHA
         vsKU5S+znaWQk/UR/SfkLhdFBnGiFEIPzPUez9Nu6MYdtKpjLxY4YioEmEU2/Ob8VGeB
         BdGCwVsHJ0KK73zTjpzb/hV8P6Vt7VSBabAVjOYwEBvUi6ZOOsGKL4u1hkLY8etNKlmM
         Q5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=RcbR6HMJahH8S+8hPGsQFh+2INPfSPu+4YZ/KRZS6sc=;
        b=PLChGhSP4x0QGDgGUvy7vxfkLnYdeFjhdsA4BZg/dJR9It6LoazLNusg94sRlEx6Hg
         gCPH05DigCtofpDYUabw9lmeGDpB+mywupuaEKXZXRSWRJLdAEl8DCJCzqt2zzTkfR40
         deImQcXSFbrp73rucBPqVRuwiFxSQyEqxFaAc0dk2mKqg/BuCm1vknjpn28vwKnDuJFU
         hg4WORahYRtS1bs2JHmHuFZRTcifeKm9pBKVbo+9aTBd4F+VPIC3UTj/ceCP3thhv8Mp
         xfIdq2Ep0owf7iya0FxMHZYctD8SQ0z/Wx+FxJt9DG8Bqpu/AP7PNSCBBAe/rGeSuj8r
         aPlQ==
X-Gm-Message-State: APjAAAXNHO61wfqUpjUyMIHoSUgfhb7AIs7N16ru0vC9YyMd25CrYGUu
        xv3E/fssaHQ3qO8eo01VWDGNM2cG
X-Google-Smtp-Source: APXvYqyf7BFjJeVIhudzGmIllqrc631Mp0eGF/xU1YsvnCTBdydP3AMHy/pk9b7X/Iat7YpnE1b3kQ==
X-Received: by 2002:aa7:8ad3:: with SMTP id b19mr2525433pfd.134.1575451360171;
        Wed, 04 Dec 2019 01:22:40 -0800 (PST)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id k21sm6482914pgt.22.2019.12.04.01.22.37
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 04 Dec 2019 01:22:39 -0800 (PST)
From:   Baolin Wang <baolin.wang7@gmail.com>
To:     agross@kernel.org, ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     baolin.wang7@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] hwspinlock: qcom: Remove redundant PM runtime functions
Date:   Wed,  4 Dec 2019 17:21:56 +0800
Message-Id: <c75efc82fa27f191e53e8938045ce954745a4052.1575450802.git.baolin.wang7@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1575450802.git.baolin.wang7@gmail.com>
References: <cover.1575450802.git.baolin.wang7@gmail.com>
In-Reply-To: <cover.1575450802.git.baolin.wang7@gmail.com>
References: <cover.1575450802.git.baolin.wang7@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since the hwspinlock core has changed the PM runtime to be optional, and
the Qualcomm hardware spinlock has no pm runtime requirement, thus remove
these redundant PM runtime functions.

Signed-off-by: Baolin Wang <baolin.wang7@gmail.com>
---
 drivers/hwspinlock/qcom_hwspinlock.c |   13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 6da7447..5a736b0 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -12,7 +12,6 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include "hwspinlock_internal.h"
@@ -122,14 +121,8 @@ static int qcom_hwspinlock_probe(struct platform_device *pdev)
 							     regmap, field);
 	}
 
-	pm_runtime_enable(&pdev->dev);
-
-	ret = hwspin_lock_register(bank, &pdev->dev, &qcom_hwspinlock_ops,
-				   0, QCOM_MUTEX_NUM_LOCKS);
-	if (ret)
-		pm_runtime_disable(&pdev->dev);
-
-	return ret;
+	return hwspin_lock_register(bank, &pdev->dev, &qcom_hwspinlock_ops,
+				    0, QCOM_MUTEX_NUM_LOCKS);
 }
 
 static int qcom_hwspinlock_remove(struct platform_device *pdev)
@@ -143,8 +136,6 @@ static int qcom_hwspinlock_remove(struct platform_device *pdev)
 		return ret;
 	}
 
-	pm_runtime_disable(&pdev->dev);
-
 	return 0;
 }
 
-- 
1.7.9.5

