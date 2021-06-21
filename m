Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAB273AF4B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 20:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233469AbhFUSR5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 14:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232405AbhFUSRF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 14:17:05 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8408C08ED8A
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 10:56:36 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id b5so4129198ilc.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 10:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=US5bOn0Zhlz2K4BSfH9yYaNsj8Mc3bOQWak9F9GKcgw=;
        b=WrDJqP5lgdxNpkzDUnPUfstO+IkZYtIgLW7BE8ULRmECf4egUcKe+QpKaaaGTrqIYa
         bRI6C4h0ryOEcdDstpfLMhFT3KH7zx/RzSSmvmMBnpWcw1wUAchILYsrjmIr1PR9VfAa
         pd1LoQRt4N2t/8vlhPGZEK8DiRP8mlwyjZ7zV9fN2RyBSEJM1PNe5VAPY8IvdoU25s2h
         ofqSo1O2fxWXcNa4AYLPl2Ca1vIwLkHSG88TRF1lzxV0yrG++xY6xi9zxJR+Mq/19tgc
         Eo9TBfPK5a5tPlrkeNnx33f/7DITSX7fzhxGpPAd93u44A0q5qJgT2lLPcd/Dkz700hS
         Eomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=US5bOn0Zhlz2K4BSfH9yYaNsj8Mc3bOQWak9F9GKcgw=;
        b=PPNW8gMbj4c7T0ERwEj0AiaIC2CF7JwCbGX9k/AWwUTRNzNfjw7gLblZUxPzgDF48i
         5fgO4qXdZ/hfGYmCGSSDv8tUxDWCYSOc7rjR2Z3WdhrBGM3jRuBSQRqDSnrn+U+rg6G/
         1tVL3oSIeMJfX9JOJNhklnHMIQWZagMPQjCYRdSeSJ/fsqziXnRVcQkd4A35M/kOLW5t
         t/yL31qUASMuNO6frVzOaNiX4JcXhG5S1tGxFyTcKlkuKHj4yfa3BcoPCAkp2yOWfSAM
         o328LdCgiWnLU7+QLKbRs4P32cutVwkFSCwRMcGIBHraoKodEGEQ2fWxmxhvD78ULcnj
         3YeA==
X-Gm-Message-State: AOAM5312wiDOennw4XxQpXXZeq0/nIEMLZ/g+P9jqR0ki9nXx5n1XOBL
        cCi1Xet5wvqx+fXeU/RMRmcOEg==
X-Google-Smtp-Source: ABdhPJzdv3BH3fL4HdAOQyQHjdPgtxJ+7ZhvCHkAzg68RkQ1VMQtujxM0RYLG73tbZlALQEdJBcgBg==
X-Received: by 2002:a92:3302:: with SMTP id a2mr18866126ilf.62.1624298195944;
        Mon, 21 Jun 2021 10:56:35 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id m13sm6259264iob.35.2021.06.21.10.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 10:56:35 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        jamipkettunen@gmail.com, bjorn.andersson@linaro.org,
        agross@kernel.org, elder@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 5/6] net: ipa: introduce gsi_ring_setup()
Date:   Mon, 21 Jun 2021 12:56:26 -0500
Message-Id: <20210621175627.238474-6-elder@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210621175627.238474-1-elder@linaro.org>
References: <20210621175627.238474-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Prior to IPA v3.5.1, there is no HW_PARAM_2 GSI register, which we
use to determine the number of channels and endpoints per execution
environment.  In that case, we will just assume the number supported
is the maximum supported by the driver.

Introduce gsi_ring_setup() to encapsulate the code that determines
the number of channels and endpoints.

Update GSI_EVT_RING_COUNT_MAX so it is big enough to handle any
available channel for all supported hardware (IPA v4.9 can have 23
channels and 24 event rings).

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/gsi.c | 77 ++++++++++++++++++++++++++++---------------
 drivers/net/ipa/gsi.h |  2 +-
 2 files changed, 51 insertions(+), 28 deletions(-)

diff --git a/drivers/net/ipa/gsi.c b/drivers/net/ipa/gsi.c
index efd826e508bce..427c68b2ad8f3 100644
--- a/drivers/net/ipa/gsi.c
+++ b/drivers/net/ipa/gsi.c
@@ -224,6 +224,51 @@ static void gsi_irq_setup(struct gsi *gsi)
 	iowrite32(0, gsi->virt + GSI_CNTXT_GSI_IRQ_EN_OFFSET);
 }
 
+/* Get # supported channel and event rings; there is no gsi_ring_teardown() */
+static int gsi_ring_setup(struct gsi *gsi)
+{
+	struct device *dev = gsi->dev;
+	u32 count;
+	u32 val;
+
+	if (gsi->version < IPA_VERSION_3_5_1) {
+		/* No HW_PARAM_2 register prior to IPA v3.5.1, assume the max */
+		gsi->channel_count = GSI_CHANNEL_COUNT_MAX;
+		gsi->evt_ring_count = GSI_EVT_RING_COUNT_MAX;
+
+		return 0;
+	}
+
+	val = ioread32(gsi->virt + GSI_GSI_HW_PARAM_2_OFFSET);
+
+	count = u32_get_bits(val, NUM_CH_PER_EE_FMASK);
+	if (!count) {
+		dev_err(dev, "GSI reports zero channels supported\n");
+		return -EINVAL;
+	}
+	if (count > GSI_CHANNEL_COUNT_MAX) {
+		dev_warn(dev, "limiting to %u channels; hardware supports %u\n",
+			 GSI_CHANNEL_COUNT_MAX, count);
+		count = GSI_CHANNEL_COUNT_MAX;
+	}
+	gsi->channel_count = count;
+
+	count = u32_get_bits(val, NUM_EV_PER_EE_FMASK);
+	if (!count) {
+		dev_err(dev, "GSI reports zero event rings supported\n");
+		return -EINVAL;
+	}
+	if (count > GSI_EVT_RING_COUNT_MAX) {
+		dev_warn(dev,
+			 "limiting to %u event rings; hardware supports %u\n",
+			 GSI_EVT_RING_COUNT_MAX, count);
+		count = GSI_EVT_RING_COUNT_MAX;
+	}
+	gsi->evt_ring_count = count;
+
+	return 0;
+}
+
 /* Event ring commands are performed one at a time.  Their completion
  * is signaled by the event ring control GSI interrupt type, which is
  * only enabled when we issue an event ring command.  Only the event
@@ -1834,43 +1879,21 @@ static void gsi_channel_teardown(struct gsi *gsi)
 /* Setup function for GSI.  GSI firmware must be loaded and initialized */
 int gsi_setup(struct gsi *gsi)
 {
-	struct device *dev = gsi->dev;
 	u32 val;
+	int ret;
 
 	/* Here is where we first touch the GSI hardware */
 	val = ioread32(gsi->virt + GSI_GSI_STATUS_OFFSET);
 	if (!(val & ENABLED_FMASK)) {
-		dev_err(dev, "GSI has not been enabled\n");
+		dev_err(gsi->dev, "GSI has not been enabled\n");
 		return -EIO;
 	}
 
 	gsi_irq_setup(gsi);		/* No matching teardown required */
 
-	val = ioread32(gsi->virt + GSI_GSI_HW_PARAM_2_OFFSET);
-
-	gsi->channel_count = u32_get_bits(val, NUM_CH_PER_EE_FMASK);
-	if (!gsi->channel_count) {
-		dev_err(dev, "GSI reports zero channels supported\n");
-		return -EINVAL;
-	}
-	if (gsi->channel_count > GSI_CHANNEL_COUNT_MAX) {
-		dev_warn(dev,
-			 "limiting to %u channels; hardware supports %u\n",
-			 GSI_CHANNEL_COUNT_MAX, gsi->channel_count);
-		gsi->channel_count = GSI_CHANNEL_COUNT_MAX;
-	}
-
-	gsi->evt_ring_count = u32_get_bits(val, NUM_EV_PER_EE_FMASK);
-	if (!gsi->evt_ring_count) {
-		dev_err(dev, "GSI reports zero event rings supported\n");
-		return -EINVAL;
-	}
-	if (gsi->evt_ring_count > GSI_EVT_RING_COUNT_MAX) {
-		dev_warn(dev,
-			 "limiting to %u event rings; hardware supports %u\n",
-			 GSI_EVT_RING_COUNT_MAX, gsi->evt_ring_count);
-		gsi->evt_ring_count = GSI_EVT_RING_COUNT_MAX;
-	}
+	ret = gsi_ring_setup(gsi);	/* No matching teardown required */
+	if (ret)
+		return ret;
 
 	/* Initialize the error log */
 	iowrite32(0, gsi->virt + GSI_ERROR_LOG_OFFSET);
diff --git a/drivers/net/ipa/gsi.h b/drivers/net/ipa/gsi.h
index d5996bdb20ef5..81cd7b07f6e14 100644
--- a/drivers/net/ipa/gsi.h
+++ b/drivers/net/ipa/gsi.h
@@ -17,7 +17,7 @@
 
 /* Maximum number of channels and event rings supported by the driver */
 #define GSI_CHANNEL_COUNT_MAX	23
-#define GSI_EVT_RING_COUNT_MAX	20
+#define GSI_EVT_RING_COUNT_MAX	24
 
 /* Maximum TLV FIFO size for a channel; 64 here is arbitrary (and high) */
 #define GSI_TLV_MAX		64
-- 
2.27.0

