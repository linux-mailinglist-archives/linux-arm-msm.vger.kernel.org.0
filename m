Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B059B1CD9B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 14:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgEKM0I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 08:26:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729955AbgEKM0G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 08:26:06 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05266C061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 05:26:05 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id f6so4494528pgm.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 05:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jAOdTLiRF08BUGeoQQ1jSCIZohHvIFy/T0eMMRKNkxU=;
        b=v5REeB1awFWWiZJIHs+HLAiK9bYOBbBuQpiUTIqqwxpvkMO1MgmR+4SKDJVW76qhSx
         K7eSzt4rGMus/hn4a+7NbaOPBUksJyD7ZbjD7ZCJFUX11tiYXVxXWv2Uxa1Mm8BpjrQq
         /1CchWZ5kwaGLYxmr4QJwnHnE4raFD+NWF2U4FTCwMz3aquotGpzaCwzn9Q6Uvn4hRUy
         7mZGfJzCO8Pb5ndWrTC6Z6adunwD+43NALhyA7MHb+yYGsIBFTE1dDbR5xVO9zRbZqb1
         naGbX8HAylwK2maSE9h79X+9DEnUhCUPw7XxNfYMieYaXeukN6Ob2Q+rXavCwcBp5G1d
         vEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jAOdTLiRF08BUGeoQQ1jSCIZohHvIFy/T0eMMRKNkxU=;
        b=Q5K+XxCQvox23ytdXhxM3RCMWQUrzZhPG/g0tFdD+BPE0OFBNm2V6ACixBhCSvgTYf
         wlScJC+8Dlg0BUs69JI+TTdfB7U5hTECKIGMnxzM/F/5sVMjPU9oNOMJ2Y6bCqIAOEF5
         cS9gkP8ZTRy8AMHMn7G2jRjCbAm28/8dt/w8TyUhU7b2roX2zUqIX3jX67M9xx2KYRH8
         6zSUczA010XYIjCk+lURhlW42why+yqdSdelIp9JMuhkiIJyEPEun1Khcs6zzrqH6kDB
         4d4j1dwFmDHeVCVLgU0Y5a3We8j2wUFVDxZn7UqnU2DkrFxdzoaMpX8HNqR6mMzmRvCo
         VCTQ==
X-Gm-Message-State: AGi0PuYgxRoNmU4mOYVJCPtmoQiHDStelqwXk21ruQIXagggaqVn/UGB
        MCxV3D1cRA+reUycv6jdCck9/A==
X-Google-Smtp-Source: APiQypKSroADbKGwHiCUkmx+QfJra7jTrOyksev3CxoHSSW87/DHYXa1AdvxPdBZTV2QARSMXREDPg==
X-Received: by 2002:a62:6807:: with SMTP id d7mr16211381pfc.296.1589199964522;
        Mon, 11 May 2020 05:26:04 -0700 (PDT)
Received: from localhost ([45.127.45.102])
        by smtp.gmail.com with ESMTPSA id 78sm4687636pgd.33.2020.05.11.05.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 05:26:03 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Javi Merino <javi.merino@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org
Subject: [PATCH 08/14] thermal/drivers/clock_cooling: Include export.h
Date:   Mon, 11 May 2020 17:54:56 +0530
Message-Id: <25f16415ab7b7587a052f1bce4133da318d58192.1589199124.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1589199124.git.amit.kucheria@linaro.org>
References: <cover.1589199124.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It is preferrable to include export.h when you are using EXPORT_SYMBOL
family of macros.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 drivers/thermal/clock_cooling.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/clock_cooling.c b/drivers/thermal/clock_cooling.c
index fd6bc6eefc88..56cb1f46a428 100644
--- a/drivers/thermal/clock_cooling.c
+++ b/drivers/thermal/clock_cooling.c
@@ -16,6 +16,7 @@
 #include <linux/cpufreq.h>
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/export.h>
 #include <linux/idr.h>
 #include <linux/mutex.h>
 #include <linux/pm_opp.h>
-- 
2.20.1

