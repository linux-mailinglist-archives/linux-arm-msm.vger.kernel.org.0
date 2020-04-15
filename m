Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D20D31AAEFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 19:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410594AbgDORA4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 13:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410591AbgDORAy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 13:00:54 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5144AC061A0F
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 10:00:53 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id a22so97527pjk.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 10:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0zz7rP3DWvUJ/VdB/uYLN17A7qtq95b2KZVxc0CNxN8=;
        b=nMScmT1YfkHnp5d9ktcd27MszVIt1dzN6BZYoV9+sCpGotbOhmNHMTymZ/mgfEzo2/
         XQFEjXL/GcQz3TOQgZwOJMDQoP0vJrYGaQg6Dy9WRYnzJXT529pfOdBeFcnv5eO59T8j
         Uo1C6C+kEOvLzXqU9/EmZjhlh3ApbvGerYBKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0zz7rP3DWvUJ/VdB/uYLN17A7qtq95b2KZVxc0CNxN8=;
        b=FzR6oAk26lnkXgmZPYY99sWsksOVK615iHegu9YSo9Rjle//jU1Rn9zsKKGN8mKHpq
         XDQKgN16iN0xPfO+H3C2t3VqjceI1TPvEa8S2ZonRkjKGj2/aa/mQfG8gYuESXad3Ncw
         tUgAbRrhO4hMulm46TyDEvbEg9qtY1SzcBBGrHPFLsJgeqPLIFShH7D0A/Ctru9D8Qwi
         CkxnbIWPpSjDETu6fKwgflrlTAY/3pB6dTwBfI1fNa+VyVHRWJPcCxeL7BMePohDnsIk
         jXcpTxUMLd6Ytf+22YRQXSnBj1IpOROBbitiXN13hqHtNSLVh2fchgeEYbPVhv/ktJcA
         CjNw==
X-Gm-Message-State: AGi0PuYp0UdnFpwo2KjYBiREe++NPGaj26c02ko9V3HFaMFXK1RkGa8N
        VnrOqFIds4Vm6bBeTCVp7ZrQeQ==
X-Google-Smtp-Source: APiQypK1ORgUTaF7VYeYwPYtOrt7RLRDn4vD2dSwdFXifV0CT+TvS60cSUMWkcYK9mJmXcjE8bGlKg==
X-Received: by 2002:a17:902:322:: with SMTP id 31mr5876290pld.103.1586970049865;
        Wed, 15 Apr 2020 10:00:49 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id i187sm14203509pfg.33.2020.04.15.10.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 10:00:49 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mkshah@codeaurora.org, mka@chromium.org, joe@perches.com,
        swboyd@chromium.org, evgreen@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] soc: qcom: rpmh-rsc: Factor "tcs_reg_addr" and "tcs_cmd_addr" calculation
Date:   Wed, 15 Apr 2020 10:00:27 -0700
Message-Id: <20200415095953.v3.1.Ic70288f256ff0be65cac6a600367212dfe39f6c9@changeid>
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
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---

Changes in v3: None
Changes in v2:
- Make drv parameter const.

 drivers/soc/qcom/rpmh-rsc.c | 41 +++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index a9e15699f55f..ce39d8399312 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -137,36 +137,47 @@
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

