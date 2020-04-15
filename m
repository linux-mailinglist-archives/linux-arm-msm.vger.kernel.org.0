Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B2911AAEFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 19:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410591AbgDORA5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 13:00:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404593AbgDORAx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 13:00:53 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 393DCC061A0E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 10:00:53 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id o1so100199pjs.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 10:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wjox1MgPvdJXUGATfEXxAcxxbZg3uJFLLwCAqSjIesE=;
        b=cQu4bNLsv8clRV7vbm6yX8Vcr0WT6P2ddMJwlbMXwObS0A0xmm0ittvqdSO5Yf1bOr
         sFasgytkTHpQGqOStpC1iFZ4uUdX+5l5cXqSrhw5KghlbYt4eKDVLyAWc/PmCwYfaDlN
         td4R3YoyzOKkRacu2dOnBGm5KU+bqlK4dPVDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wjox1MgPvdJXUGATfEXxAcxxbZg3uJFLLwCAqSjIesE=;
        b=iy9OFlp86PIALEONKDGI0jWvMkhylaP2/GNTcs2rL6lWQ8ScAWjkChs8FOHqnOBoYN
         Zom/j75Fu7soN7mDjeee3i13j55qK03iBItSCN8w4e+A9p1PvDPAnKlxEgLVzH/MOYv4
         KOxpOLnTu4zVsAqJGciR70cumpYhLaXYf8/9znw4NQtlb97IIge8S9Awra11tsdyk/m3
         1FZfKlJP20m/DEZY6chTwbnAtGhHdmovhoaHnbhMC2wyeJXAeBGbzsy35KtFQtU/iUYQ
         C/UlXCeeTO1cgXsuI3vf+8QdsqcI2s18WOo/8KNbCgdCm09Mx5BUXUZmO6rnETd4WsOt
         yBGQ==
X-Gm-Message-State: AGi0PuYJJF4KugwMb2PsWFpfqVNJQEkxkxRxdGo7a+Aqt+9Cww3s2VB2
        HhV99vYRv0qM8ywFTWJq+46Tvg==
X-Google-Smtp-Source: APiQypIDdUZs+k3p3rTEJpAVtzMK9wPZX2UvdbCzePjqh/cIER11MPgatnADAqs9QL2vDdNfzuL1Pw==
X-Received: by 2002:a17:902:6945:: with SMTP id k5mr5717586plt.8.1586970051536;
        Wed, 15 Apr 2020 10:00:51 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id i187sm14203509pfg.33.2020.04.15.10.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 10:00:51 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mkshah@codeaurora.org, mka@chromium.org, joe@perches.com,
        swboyd@chromium.org, evgreen@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] soc: qcom: rpmh-rsc: Timeout after 1 second in write_tcs_reg_sync()
Date:   Wed, 15 Apr 2020 10:00:28 -0700
Message-Id: <20200415095953.v3.2.I8550512081c89ec7a545018a7d2d9418a27c1a7a@changeid>
X-Mailer: git-send-email 2.26.0.110.g2183baf09c-goog
In-Reply-To: <20200415095953.v3.1.Ic70288f256ff0be65cac6a600367212dfe39f6c9@changeid>
References: <20200415095953.v3.1.Ic70288f256ff0be65cac6a600367212dfe39f6c9@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If our data still isn't there after 1 second, shout and give up.

Reported-by: Joe Perches <joe@perches.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---

Changes in v3:
- The register should be hex.

Changes in v2:
- Patch ("Timeout after 1 second") new for v2.

 drivers/soc/qcom/rpmh-rsc.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index ce39d8399312..e09d1ada0cd2 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/module.h>
@@ -175,12 +176,13 @@ static void write_tcs_reg(const struct rsc_drv *drv, int reg, int tcs_id,
 static void write_tcs_reg_sync(const struct rsc_drv *drv, int reg, int tcs_id,
 			       u32 data)
 {
+	u32 new_data;
+
 	writel(data, tcs_reg_addr(drv, reg, tcs_id));
-	for (;;) {
-		if (data == readl(tcs_reg_addr(drv, reg, tcs_id)))
-			break;
-		udelay(1);
-	}
+	if (readl_poll_timeout_atomic(tcs_reg_addr(drv, reg, tcs_id), new_data,
+				      new_data == data, 1, USEC_PER_SEC))
+		pr_err("%s: error writing %#x to %d:%#x\n", drv->name,
+		       data, tcs_id, reg);
 }
 
 /**
-- 
2.26.0.110.g2183baf09c-goog

