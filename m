Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62A599A8F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2019 09:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390331AbfHWHe6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Aug 2019 03:34:58 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41511 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388420AbfHWHe6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Aug 2019 03:34:58 -0400
Received: by mail-lj1-f194.google.com with SMTP id m24so7931984ljg.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2019 00:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tWhyqZI+RyxZp+FLk4Dgae8z/RXq1pkybZ7Bwrb+ZCM=;
        b=iZWqkN2xUIjsY5VbuNfnpVbnLrR2fvQe/6iNNcrdauqIWg8r7Lk9WFj1khRph5byLA
         6RwOND0kiZNLX9/QXicq6PnTD0NyE7i2/icCnxLNy9dEW/MBWvqtrsMUWqYAXDaau8Ee
         McR3meUDHDe+NB+ZypD2E0zMsvAH2BYeZRjT86W6EtOyasq0OyPz1Hzj0u8s/2flH8gb
         TYakAXyFno2/OQgZMgVPPaNaDw+db76oJBcTJC9J+Q5lF88aKm6W0dktNQ4AtSgeeaZH
         IdMwt0tQzKHa7611JHWfdn40qS8MRaCeVqMtrDxRolM1hawqxFWbc6MT7SiIp+a9Srnx
         7Rzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tWhyqZI+RyxZp+FLk4Dgae8z/RXq1pkybZ7Bwrb+ZCM=;
        b=r5jvnQywEx6c7GyN5w3oqXTl6hABl3aCx6yirYINNFMEqIyzeltSQBs2pS9RqPD38u
         ibYGrN53QDGYnXgqN1Z4rYxEGtcjWh4dJ0E9h4HnjJUmz58SGkifsf+JJBo7DsNBJHMm
         4zqnio8Jf0vpQHT6zw+0jFdTL3ZpCtRp8XeUH2QwHCzJM4efeKEDiGi35P5p2S/2q6zn
         L4PjdjHJZuUXYCSLBqTXgUQZtldGZxdkEJKnIqjHXJXnvSySS1gGOSITusHFehl6W0Gj
         D0ZfCnFUO+zgOzwViMY9HYrH5WcrXOef96F6YbamCQ2ICm7gnOOOzyW+EjmpmbWwcsNW
         dCjw==
X-Gm-Message-State: APjAAAVXmex7kdNnbxDC4qIyMJpc9mpIeAIey9/iwN3pdkuFo+fiqHsE
        lpPXqmt1/D9FY8TSTFxFb09A+w==
X-Google-Smtp-Source: APXvYqwE7u2Cs/tTCozVbGiGnJ7iMpM+OrgYgkUfeZIdWWR0fNMzgWHa/Qd+FYH1ykVSS4a9eQpqHA==
X-Received: by 2002:a2e:914c:: with SMTP id q12mr2052131ljg.34.1566545696789;
        Fri, 23 Aug 2019 00:34:56 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id n7sm483780ljh.2.2019.08.23.00.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2019 00:34:55 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Brian Masney <masneyb@onstation.org>
Subject: [PATCH 2/6 v2] drm/msm/dsi: Drop unused GPIO includes
Date:   Fri, 23 Aug 2019 09:34:44 +0200
Message-Id: <20190823073448.8385-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190823073448.8385-1-linus.walleij@linaro.org>
References: <20190823073448.8385-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This DSI driver uses the new descriptor API so these old
GPIO API includes are surplus.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Reviewed-by: Brian Masney <masneyb@onstation.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Rebased on v5.3-rc1
- Collected review tag
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index aa35d18ab43c..4b6f62138390 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -6,11 +6,9 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/err.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/of_device.h>
-#include <linux/of_gpio.h>
 #include <linux/of_irq.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/of_graph.h>
-- 
2.21.0

