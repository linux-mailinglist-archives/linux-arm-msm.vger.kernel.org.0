Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C462AECC37
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2019 01:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727798AbfKBAQg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Nov 2019 20:16:36 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41768 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727880AbfKBAQg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Nov 2019 20:16:36 -0400
Received: by mail-pf1-f194.google.com with SMTP id p26so8084399pfq.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Nov 2019 17:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jcFx68gFVeXHdVBwzZXTkZrB0QDgMIqTKWMux+ooRs8=;
        b=UfM6G2Gl8WH+AYz02r39xAIYWNUDoihkgPCGzFZN0CPZc/rTNvv7I0DhHMk9S2ZN4C
         cdaTpMy5lTjpEQ/uzsoC8Sgvgbv6PyD7qmmAwbPTf82rrbmmlWHK7uEk0OzSyH1oLf4A
         xY7s7MZYXrZyZ7HAdE4hqvu7KRKynfnFKi/9UCED2aKHAGhAQzC5iT/Icpb0QUlTetuA
         S3JcVGZU7Dk3G+yhjWVBPXaQ00Mf4JOS+F9gKReG0WmtUbgyNBUU4wOB9F07pPQm2seu
         GHaRzSSVXZkfUrk9W6bgPWMGXgBlfTAcBlb0qdCyVjNP8rqaBXAngV1Vf2CXrLQ+EQBB
         8chQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jcFx68gFVeXHdVBwzZXTkZrB0QDgMIqTKWMux+ooRs8=;
        b=oprSw1B4f/KeYVjw8ZzRRJLStcRItjKekCeDnQWFVBeNupWhJZgZSSRvW8MxbUiayK
         UUquiDJV5btNt1cDF2amtvwizZEk/nrPvEx9lbRcqAQ3zsdal+Jvc1Gsfj8sUNLADkRN
         hHrOQdVSmusUibOSY62TkLGk4mCmWPUqXppBgwzFhee3EB0VPDLh9TThk+2RYQegXanK
         TcEg4EOU8x4eqRXqmC0Ev2nZqEhU71rc2d1sYNNlmp9AU3Bymhg4EyLj5X6g0g1xmtv7
         cQKbNtOrfarhpa9FwCW4me3Og7LyMxbgXRiVUD+5k1iFRaqtxvsWxWgmbgGIrA5tGA/o
         HJyA==
X-Gm-Message-State: APjAAAVpvAqbiYl38rgLqykKryM6xKVyWPrASHYRWZAZPFVqbchg4WBh
        OPPjdbkUMyvQJ6lXK18TiAXPsJJF/eE=
X-Google-Smtp-Source: APXvYqwxZcLsF0q9Fc8LDGj+EyhAVJrNvRb1omSIPEuI9LoRmXdCIGqKoGl1YCTQMlQjkKKK6+sScQ==
X-Received: by 2002:a17:90a:3b0d:: with SMTP id d13mr7137017pjc.86.1572653795266;
        Fri, 01 Nov 2019 17:16:35 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j11sm7876250pgk.3.2019.11.01.17.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 17:16:34 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 2/5] phy: qcom-qmp: Increase PHY ready timeout
Date:   Fri,  1 Nov 2019 17:16:25 -0700
Message-Id: <20191102001628.4090861-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191102001628.4090861-1-bjorn.andersson@linaro.org>
References: <20191102001628.4090861-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It's typical for the QHP PHY to take slightly above 1ms to initialize,
so increase the timeout of the PHY ready check to 10ms - as already done
in the downstream PCIe driver.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- New patch

 drivers/phy/qualcomm/phy-qcom-qmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 091e20303a14..66f91726b8b2 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -66,7 +66,7 @@
 /* QPHY_V3_PCS_MISC_CLAMP_ENABLE register bits */
 #define CLAMP_EN				BIT(0) /* enables i/o clamp_n */
 
-#define PHY_INIT_COMPLETE_TIMEOUT		1000
+#define PHY_INIT_COMPLETE_TIMEOUT		10000
 #define POWER_DOWN_DELAY_US_MIN			10
 #define POWER_DOWN_DELAY_US_MAX			11
 
-- 
2.23.0

