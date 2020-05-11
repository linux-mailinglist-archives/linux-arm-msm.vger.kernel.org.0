Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D90FE1CD9A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 14:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729849AbgEKMZ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 08:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729897AbgEKMZ4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 08:25:56 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60BE9C061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 05:25:56 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ms17so7711331pjb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 05:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DfMcNqWTArL4Y5FjXhFztmuSx2FHQp5TnoxNceakMXk=;
        b=n7rXPswqzvaAQL8MJXEd+EHpWvH4A0CJYgK4ai+PXMpJUyvSTDHmBs58x3bD6ThfTo
         XsRDVktgXnzv1aChERUpor/0iWAH9aNvJPwU02MEDjZCXunynB9xChlEPF1D/n6jBfB9
         HjUAjXkOBiTDlQfZuuTBvbCkmltaO6YEofuLkF94Isei/16A86EKWsxsaDPFiAAbx0cP
         kZXAoOe3YHqxLhumKw/ki3oiCe19ki/2PjlS25LJcCZSSVbejXKzzbcuP8sBTDy82Pv3
         0S0ZPmbRaBPC7GHUMJlqwnIQHsyYHR6D32/CWy+nuLkQkDthLSEYyaKs03tfdzVS6zu4
         Z89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DfMcNqWTArL4Y5FjXhFztmuSx2FHQp5TnoxNceakMXk=;
        b=SkO3Owx4fVdbP0G8d8E70COj8oM9tRL90B7fcXq/YhUnVO4bRZGOAzCTew6Bt5axAM
         fgpkXmlhnAQON2xG7fJ2NeQfoV/rJskxD7YXSRRJiw7VV5wqgkzppgpT0ZVy34DLv1wu
         8leqOStnDw2DooenjrX9z9sAARAEyIvCP6YZ79/1XB1ARmQJVmFhvyQBX4zHLYQhK3Pm
         bZme6KQj0a9fBckNMLIWFjQmzCNvGykMaSrPFs7hJQ9Br50MPIpE/z2X3qBAuO51Tl0c
         ljLVpriU2DpJn+jvHhoQtFgsuiM+cLqSfv4IRYTNnQ1162eMpb/ObtFNPWeQYPNuaq0A
         Dbug==
X-Gm-Message-State: AGi0PuZL7nsJMs0VTXUOQbO2SQmrrljsvyqPGxPcv1whtcdhuORMEhjD
        5zG6h0hHUpdBoWQ5mUfOonHEl+3Z7tI=
X-Google-Smtp-Source: APiQypITHNfYkaL28do7g3be0G1XRhK/SouBrI17eY+WKs5pJJeTBqBv8FaNTHb9f9amRhYbxzFJBQ==
X-Received: by 2002:a17:90a:1f4b:: with SMTP id y11mr22693865pjy.136.1589199955901;
        Mon, 11 May 2020 05:25:55 -0700 (PDT)
Received: from localhost ([45.127.45.102])
        by smtp.gmail.com with ESMTPSA id go21sm10316726pjb.45.2020.05.11.05.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 05:25:55 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Javi Merino <javi.merino@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org
Subject: [PATCH 06/14] thermal/drivers/thermal_hwmon: Include export.h
Date:   Mon, 11 May 2020 17:54:54 +0530
Message-Id: <f542962494a8441fdc8e550a11d0e535b92362a0.1589199124.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1589199124.git.amit.kucheria@linaro.org>
References: <cover.1589199124.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It is preferable to include export.h when you are using EXPORT_SYMBOL
family of macros.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 drivers/thermal/thermal_hwmon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/thermal_hwmon.c b/drivers/thermal/thermal_hwmon.c
index e43ae551592d..8b92e00ff236 100644
--- a/drivers/thermal/thermal_hwmon.c
+++ b/drivers/thermal/thermal_hwmon.c
@@ -11,6 +11,7 @@
  *  Copyright (C) 2013 Eduardo Valentin <eduardo.valentin@ti.com>
  */
 #include <linux/err.h>
+#include <linux/export.h>
 #include <linux/hwmon.h>
 #include <linux/slab.h>
 #include <linux/thermal.h>
-- 
2.20.1

