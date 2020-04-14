Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3FC1A8BF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 22:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505445AbgDNUKu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 16:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730118AbgDNUKs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 16:10:48 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 021DFC03C1A7
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 13:10:47 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id b72so431036pfb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 13:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T+HbRhlvMIy8BtU4nbArvVaIdClKnKmx3fk08M3A1Tw=;
        b=hWzfu5ASeq+x9poLZFbihzZcfvSnpNkS+Mz8exkiNPYNVn4CB0LRIMoQ8XVMmx/MDX
         f0Gdn/FI8JmEvsP5vjMIWV/y1KjMxPL5cmGSwUrr+F+HlheXIU/a3C4Y5gqOM414QDia
         fzXT/xQQueQmZJOZ4N4QWVV9GQtc/iJcngSXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T+HbRhlvMIy8BtU4nbArvVaIdClKnKmx3fk08M3A1Tw=;
        b=m22XFAE09G2utPHeUmf5/IW3m+1oPXJW128HKaQbhEBqat6gZv8xMeFW+8HrI+dpI8
         R4p8pIAD0w0IcJhRV8ZLhaJD3YIz23hAFFeQSrx2o5q/th4cW2pkfkYiWR2hGbjAinCG
         OhfVKDeUZ0lUGhDUC5x8iGWyOdFBSs5dzyWzSfLh8ECoMc4BYfAafhIzGZnQURQIUI1h
         yI5p9T+eL/Ew9IxQA8IAV1kUWIYJa+FMt8eTwS+5YyJCG67yHeCzeHrN4vY8zqpk6cs1
         IyknLsl87IG6mh019EXjg6vk+2TdWS979N6zN+IF2ZkqjJBSFUH2hwrXjHKIwTnuQLA2
         jfOA==
X-Gm-Message-State: AGi0PubCcREWisuWgLyg2jA8NGwvfsX8qRLp1nriQ1Iw5xFUOaUYwBzV
        9F+oywFjbh6xKviZIpXU9TXsZg==
X-Google-Smtp-Source: APiQypL57AogodJ/QRvyi59rvr6fP+Vcz3T49k0rmzFDNnw/tjrJwbmpCI3GG7bsGOIeV3OfL3GYcg==
X-Received: by 2002:a62:160b:: with SMTP id 11mr25627935pfw.189.1586895047051;
        Tue, 14 Apr 2020 13:10:47 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id 135sm12189805pfu.207.2020.04.14.13.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 13:10:46 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mkshah@codeaurora.org, joe@perches.com, swboyd@chromium.org,
        mka@chromium.org, evgreen@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] soc: qcom: rpmh-rsc: Factor "tcs_reg_addr" and "tcs_cmd_addr" calculation
Date:   Tue, 14 Apr 2020 13:10:15 -0700
Message-Id: <20200414131010.v2.1.Ic70288f256ff0be65cac6a600367212dfe39f6c9@changeid>
X-Mailer: git-send-email 2.26.0.110.g2183baf09c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We can make some of the register access functions more readable by
factoring out the calculations a little bit.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Make drv parameter const.

 drivers/soc/qcom/rpmh-rsc.c | 41 +++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 732316bb67dc..f988e9cc2c30 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -136,36 +136,47 @@
  *  +---------------------------------------------------+
  */
 
-static u32 read_tcs_cmd(struct rsc_drv *drv, int reg, int tcs_id, int cmd_id)
+static inline void __iomem *
+tcs_reg_addr(const struct rsc_drv *drv, int reg, int tcs_id)
 {
-	return readl_relaxed(drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg +
-			     RSC_DRV_CMD_OFFSET * cmd_id);
+	return drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg;
 }
 
-static u32 read_tcs_reg(struct rsc_drv *drv, int reg, int tcs_id)
+static inline void __iomem *
+tcs_cmd_addr(const struct rsc_drv *drv, int reg, int tcs_id, int cmd_id)
 {
-	return readl_relaxed(drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg);
+	return tcs_reg_addr(drv, reg, tcs_id) + RSC_DRV_CMD_OFFSET * cmd_id;
 }
 
-static void write_tcs_cmd(struct rsc_drv *drv, int reg, int tcs_id, int cmd_id,
-			  u32 data)
+static u32 read_tcs_cmd(const struct rsc_drv *drv, int reg, int tcs_id,
+			int cmd_id)
+{
+	return readl_relaxed(tcs_cmd_addr(drv, reg, tcs_id, cmd_id));
+}
+
+static u32 read_tcs_reg(const struct rsc_drv *drv, int reg, int tcs_id)
 {
-	writel_relaxed(data, drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg +
-		       RSC_DRV_CMD_OFFSET * cmd_id);
+	return readl_relaxed(tcs_reg_addr(drv, reg, tcs_id));
 }
 
-static void write_tcs_reg(struct rsc_drv *drv, int reg, int tcs_id, u32 data)
+static void write_tcs_cmd(const struct rsc_drv *drv, int reg, int tcs_id,
+			  int cmd_id, u32 data)
+{
+	writel_relaxed(data, tcs_cmd_addr(drv, reg, tcs_id, cmd_id));
+}
+
+static void write_tcs_reg(const struct rsc_drv *drv, int reg, int tcs_id,
+			  u32 data)
 {
-	writel_relaxed(data, drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg);
+	writel_relaxed(data, tcs_reg_addr(drv, reg, tcs_id));
 }
 
-static void write_tcs_reg_sync(struct rsc_drv *drv, int reg, int tcs_id,
+static void write_tcs_reg_sync(const struct rsc_drv *drv, int reg, int tcs_id,
 			       u32 data)
 {
-	writel(data, drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg);
+	writel(data, tcs_reg_addr(drv, reg, tcs_id));
 	for (;;) {
-		if (data == readl(drv->tcs_base + reg +
-				  RSC_DRV_TCS_OFFSET * tcs_id))
+		if (data == readl(tcs_reg_addr(drv, reg, tcs_id)))
 			break;
 		udelay(1);
 	}
-- 
2.26.0.110.g2183baf09c-goog

