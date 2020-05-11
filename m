Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7551CD9C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 14:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730006AbgEKM0Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 08:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730025AbgEKM0W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 08:26:22 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAF48C061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 05:26:21 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id f7so4669853pfa.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 05:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a6qQPRYkkqKyAG6TLaEJB/cXToLWZ6lQEL1jR4ff/IE=;
        b=X+M5qnS54NsxisnIx7GWnpMoWDWn3S2xQWIGyp3UWhsDJYDkZoiNsvjCajD6xx8AuQ
         6mOWP09lgMi99nLfIw805FbWRAgJv6s45+jM0CbnOCyl3V/xqGnqi27nzDsb2mwlXfAA
         XJ47NejW5B4bMduwJJwqauCx9wS0XpxT+By53oU2vUu872hKmotTLcAS8RKKKdqlxE+q
         R5k259oNqmf7ex6OJunBi2f/dH6P7waZekWGNgAJptbSmOEUuS7eikiChC7J4X3aH0g/
         nE2Ha6gc9xTR6Nerie4w88IVyFzTw5E+MtNxlclal4M/RklF4pXg2jJItR7e9POgsDuu
         hBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a6qQPRYkkqKyAG6TLaEJB/cXToLWZ6lQEL1jR4ff/IE=;
        b=G1He2FNENWbJN1JS3rtMk7u9bS5YSyLLHt5nbZLb79mQAV/rk36/T4p3uwNvBj6pm/
         z9NV9echNryZv/OZum1uTMe/Et+MMO2KZsxxuQerQ+utRCfl42K2lvmaJwgAeRacRPn4
         Ar+oLzAOZYqVsJmfqT/JeQmyzMTUkMlDwFy4SHSPAE7xYI0ErIat08TAVoAMarUlsUw1
         1jPIUGuyRCKLa602cHoBlPMyYXB96VCAjZKgbPkRK1gcNjIpLH5osnaf9aO+ZGm4g5ex
         VqGvRp0M0ofwCV+V27E9SaKVKGQgs2Fd3eIiC1iEbdx2bm0U/pJpkLfglZxVlysv1igE
         BXBg==
X-Gm-Message-State: AGi0PuZFYplWDOCEiJayPLfxCQAmnkdeencGMjLc+ICu+/7esO/1S+FU
        hoG5ja39haKpJ8utYr3NxdCozg==
X-Google-Smtp-Source: APiQypLL4nvhq334zGg7iTbU1aDby51pF04VFXV0ASs9Ytw4L7wGG6wQYPS0Ri4lhijGPjC5YU88PA==
X-Received: by 2002:a63:9558:: with SMTP id t24mr8618037pgn.48.1589199981320;
        Mon, 11 May 2020 05:26:21 -0700 (PDT)
Received: from localhost ([45.127.45.102])
        by smtp.gmail.com with ESMTPSA id y7sm9229481pfq.21.2020.05.11.05.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 05:26:20 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Javi Merino <javi.merino@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org
Subject: [PATCH 12/14] thermal/drivers/user_space: Sort headers alphabetically
Date:   Mon, 11 May 2020 17:55:00 +0530
Message-Id: <406d0c7c961e997b42e25adf4e432fe4f57b315a.1589199124.git.amit.kucheria@linaro.org>
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
 drivers/thermal/user_space.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/user_space.c b/drivers/thermal/user_space.c
index 293cffd9c8ad..82a7198bbe71 100644
--- a/drivers/thermal/user_space.c
+++ b/drivers/thermal/user_space.c
@@ -10,8 +10,8 @@
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
 
-#include <linux/thermal.h>
 #include <linux/slab.h>
+#include <linux/thermal.h>
 
 #include "thermal_core.h"
 
-- 
2.20.1

