Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB97B13396E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 04:09:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbgAHDJx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 22:09:53 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37901 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbgAHDJw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 22:09:52 -0500
Received: by mail-pf1-f194.google.com with SMTP id x185so868158pfc.5;
        Tue, 07 Jan 2020 19:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=RcbR6HMJahH8S+8hPGsQFh+2INPfSPu+4YZ/KRZS6sc=;
        b=ulKXQbtk+t8XB6gLF/Zmv9Mm7i7wCNKwFB5T/XGWM9AvACYQm/cJ0YYFe9etDzPGSS
         Eb3sVDFd+UmtABt1Py1aoYqN1/SAFABUqvxYnQ58VwK+fu5dRgnMJSisbz6rcNIi5TuD
         2oocoYv1mF0fKnP62uYLl6vTBadn4l77gACj3oR+fPgqbcuI+Xg/hxlQYy8C52nrNloA
         md5f5bUJAPHpIF1Y+nR+nh/G6S5p4NkFM7kHIE9U9IpEBF9LzazeBymgoTYVvQJ3cTWL
         wimOEhZfx1XsXuyPKrVADRza5adGm+KUm+0rt5gaN6ZohrK3NSZJ8fS4xRkQRZ0nek61
         h9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=RcbR6HMJahH8S+8hPGsQFh+2INPfSPu+4YZ/KRZS6sc=;
        b=fXh5bDpBphOkzDLNPMfwJogmuza452Lrd+qIPrtAav9LevlaZiWNn4Z9rPMykMBf40
         Kg1vEX+7d5+pLMEdYIQ4zjjKbdi5X+dWg+K2O79ik3jpSNPKACAy57tvoDf54WVv+eTl
         wPPkiclb7gpWoICo/9dMt8LXa2UZE6HrA5Z+pU9H2F12dKRqJNpVvApsfqhpqfH/HHE0
         FRj5iUoLTNGEyVtEANCDNfkZTMbtjSJ7qVKFpG8/dU9CVke85r0sZjGEJURy9jtlhMGr
         8g1D/uWY/1/WI4a8x3nOK5BBkbNG4VBwWucDhuVtfff9cfxPHrwgyoxgHvdUZdG6RSur
         p4Cw==
X-Gm-Message-State: APjAAAVLgsrIw3yvhaYZQEQNIzCNBsA5gafahuWbd9QDMV8mUmOAa9M5
        /TTqnD51R7DyzUcUN+x4cQY=
X-Google-Smtp-Source: APXvYqzIITygVqcsJnMx10npadcd03iO3OaNin1dHDbrW8XmdcDQ/S8g3YNJ2Mmr1hO0PukoPb1m0w==
X-Received: by 2002:aa7:8191:: with SMTP id g17mr2803828pfi.25.1578452992158;
        Tue, 07 Jan 2020 19:09:52 -0800 (PST)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id l8sm946980pjy.24.2020.01.07.19.09.49
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 07 Jan 2020 19:09:51 -0800 (PST)
From:   Baolin Wang <baolin.wang7@gmail.com>
To:     agross@kernel.org, ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     baolin.wang7@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 1/2] hwspinlock: qcom: Remove redundant PM runtime functions
Date:   Wed,  8 Jan 2020 11:09:10 +0800
Message-Id: <e0bb751feb7af709f92e52a07d0e8ebcf1ee44ff.1578452735.git.baolin.wang7@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1578452735.git.baolin.wang7@gmail.com>
References: <cover.1578452735.git.baolin.wang7@gmail.com>
In-Reply-To: <cover.1578452735.git.baolin.wang7@gmail.com>
References: <cover.1578452735.git.baolin.wang7@gmail.com>
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

