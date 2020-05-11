Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63B841CD99D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 14:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbgEKMZl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 08:25:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729563AbgEKMZk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 08:25:40 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BC33C061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 05:25:40 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id u5so1883636pgn.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 05:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kdgxJAfo8UlOucy5NbULhDRr0uCqBFbRyMqqRo+7u8o=;
        b=msnddFvTNtREqRm1El3S+W4nTTsmznmrMM8BRZnGmgRRKKCpgTeN+txsF0X/hMWJX/
         UqTVTj5Pef0yCJ3QfSE1xhvLaHRTrNwVQU6N6VbVqj8shMvwdYqlNGPCCRgZc3IS8oby
         xpeF7qKWEwPHKMNpFwfPDmuL5H1ylxizE6U8NyipfpXoO8xKcCFAjyqD4iRriULgLxJV
         uOiJu/bPq34/DiTf6IR34VkDxUGnUovvj7Y8zLKdkkQPlTGJzZEWvJCfRfoGeRIGq+Im
         PBs4nWgbVC+wspgBwfuxwB6lV5oiftjrnnViI8EbunEnXvsp59JcpOlrbqcCtqGJHCRK
         6qsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kdgxJAfo8UlOucy5NbULhDRr0uCqBFbRyMqqRo+7u8o=;
        b=ADuKRqf6UopufFWrkeg0y96O7NCZHZKAjws5Lf8o8TAxQrIBkHduUcfvtEC9wlGA/g
         gwl+3YfHsbO45yKAiJDDLWxmG/d4jalvdODMtyTWE+Z5k3xzrnwXFgarmnSZosOkl0bZ
         qUz266T9lR49AMkBHFyRy5XPPtzT2Kx7MMp5jly/5F9D6y74umaFDFD2dxo3Z2FbbOqJ
         qMnQEuY++4bqq+WuzdjNvZxHhL94BADwB8LK9uUcu6RLy/UtVcHcl4E4VMMD4Tw8un0R
         7+KEp55D1+4GNnFLpxWjrAOnZjsq00VW1hruWzeW46vUNk7QDmLcb3BX62m4MruBSpI5
         7qPw==
X-Gm-Message-State: AGi0PuanXZxMmScsnABo+0+ima8j0N9al6QPqkNE5PXggNDokPihgZX5
        xg3V9plqYJ3Y2sDAQIkuUmIl9A==
X-Google-Smtp-Source: APiQypIK/SJv2BvkXBQiXCCg/PqqSZRvMjBVTYP8zmpY8DlH8pIJgGgLmuJJ3RVi1ndH5W+cXRRa0g==
X-Received: by 2002:a63:4c1d:: with SMTP id z29mr14019205pga.243.1589199939763;
        Mon, 11 May 2020 05:25:39 -0700 (PDT)
Received: from localhost ([45.127.45.102])
        by smtp.gmail.com with ESMTPSA id s136sm9344242pfc.29.2020.05.11.05.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 05:25:39 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Javi Merino <javi.merino@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org
Subject: [PATCH 02/14] thermal/core: Replace module.h with export.h
Date:   Mon, 11 May 2020 17:54:50 +0530
Message-Id: <33af23406dcdb0c62dae1e6401446b997ccb449f.1589199124.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1589199124.git.amit.kucheria@linaro.org>
References: <cover.1589199124.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thermal core cannot be modular, remove the unnecessary module.h include
and replace with export.h to handle EXPORT_SYMBOL family of macros.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 drivers/thermal/thermal_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
index 286920e06277..bed4a7bea7bb 100644
--- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -9,9 +9,9 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/module.h>
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/kdev_t.h>
 #include <linux/idr.h>
-- 
2.20.1

