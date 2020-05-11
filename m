Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3D8E1CD9BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 14:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727019AbgEKM0U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 08:26:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730002AbgEKM0R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 08:26:17 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADBB4C061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 05:26:17 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id s20so3875212plp.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 05:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hF8S2ow201STm9wEzkJ199uzwJVbP1aLvlH6u2KlxKw=;
        b=ZoTOvG7sdBo8g0iLE80nyWqdc/DOAUWNi627jdhPSIh4oMCTzEkY39BHGhuS9Q6Smg
         vIj+Ye4GVk6LoJF8h2ZgA4Qfe1scI/dnskcEnzYzelau/d2cV6YEvdvvxeKD1KeCnlCq
         DwWC6vV5J5N9ADddZxK/p6cEtZHf0P4gO5QgVYhFkgzG0BH40A4+xeP4BcqFL38mVukf
         2MDwSYX/Td2bIGmIfEjXlWPKS29gtrkYLwvMFJ+DCjBikf8N4MaBoTYKZBxTYsSUpkB/
         fmN+cOhIklGuufiuQ2vFSeZfYSjPm+R+GQyyjTxEPW/sOQW4qz/+JNrvnP6//6D71lKx
         oTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hF8S2ow201STm9wEzkJ199uzwJVbP1aLvlH6u2KlxKw=;
        b=hHhQRvYbXTaLNbiiIXBjP1/So7sw0uRG4oTBJi25LZHTnNrXnnABBuwBJjxs9iCVUa
         SDdFpdcnSvC1emXnVFPwK+zmJP+HH4sV+7VbQyrKKpv9Hzp7zJ1VPjNEPdaFLu2fKep7
         Re/Z/E6bYTPkMRvngw25NiUZLs782v4WQCTmkPxjqz6/xaVLGEDaDUZ4P8wj6wuCqERU
         AQC8ZRtG3RbTghS1Kb2noOWmJK7VeQRcVZJ6EymmrHXzHslo3XoKJv7KzChsOIaQOR9R
         K3CBV8DxCYFXauzGxRpi4lwY9mOvX0i0qLxTuORd+VyNF3Lt2QTk+XLcFvpijZaV1lk1
         SVMg==
X-Gm-Message-State: AGi0PuZn+7melDGcA3wQKXtIxMc3tNb6BWOn7mwVnMvb9++fXWCl2uFW
        rGEEW0hgpAjLtvcrau9rlnlz+w==
X-Google-Smtp-Source: APiQypJatB+Ym6YLZS8IFfrGHFQFr///5CfFtcokbVGanuM03QlrrHzyaaQkUDCy0ui2HFE8tM7u9g==
X-Received: by 2002:a17:902:8697:: with SMTP id g23mr14694952plo.306.1589199977199;
        Mon, 11 May 2020 05:26:17 -0700 (PDT)
Received: from localhost ([45.127.45.102])
        by smtp.gmail.com with ESMTPSA id gz19sm9928726pjb.7.2020.05.11.05.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 05:26:16 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Javi Merino <javi.merino@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org
Subject: [PATCH 11/14] thermal/drivers/of-thermal: Sort headers alphabetically
Date:   Mon, 11 May 2020 17:54:59 +0530
Message-Id: <f9f9d8117f1659872114ba65bbfa9ed4b813128f.1589199124.git.amit.kucheria@linaro.org>
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
 drivers/thermal/of-thermal.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/of-thermal.c b/drivers/thermal/of-thermal.c
index 874a47d6923f..ddf88dbe7ba2 100644
--- a/drivers/thermal/of-thermal.c
+++ b/drivers/thermal/of-thermal.c
@@ -8,13 +8,13 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/thermal.h>
-#include <linux/slab.h>
-#include <linux/types.h>
-#include <linux/of_device.h>
-#include <linux/of_platform.h>
 #include <linux/err.h>
 #include <linux/export.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/slab.h>
+#include <linux/thermal.h>
+#include <linux/types.h>
 #include <linux/string.h>
 
 #include "thermal_core.h"
-- 
2.20.1

