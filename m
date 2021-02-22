Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7845C321C15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Feb 2021 17:03:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbhBVQDH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Feb 2021 11:03:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231148AbhBVQDD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Feb 2021 11:03:03 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F7A6C0617A9
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 08:01:43 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id t15so19566556wrx.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 08:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UrnDNLmIZ9amd8uYJ0fitha5/syx30AseXKWJabgDEI=;
        b=ZV3HgtIMmq9etFHIfp7kr64m2waskSw3aJyNav1/44hcMLZHg61gbM4TAYqn6v/RE4
         pirqiL6jS6oXZd7aBQ1HGpJFaDUfwZpz47V2d5//DTG83zyFNRyWxKMOqYy8HXG9stWS
         zlwK6mgh7rh+s+Zd55KVK7LmbWMa4inInukVpfFyrMbViABJ038wcZy/WMGy+BXtPcDA
         nJQ7w6ofj0ZC9Q9r8weVC+v53piH516R2zXGZAcCEJDHZXRjNyzJp+4FJ6ISf0iXjc0a
         WR/oCJGVJ2SI/NBRn9rBqPp/4a00cI+RIauRLRtquZrzeiibihaxNy3gzTiX/TSYU93Y
         HqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UrnDNLmIZ9amd8uYJ0fitha5/syx30AseXKWJabgDEI=;
        b=hAnV4U5E73e4oWgrbk4nlrAj2gqZVupwqvUB1de246kE1c6Vk/bVEU4lIqQiunYlXd
         e4+Ol6f/SK/oyrIuVQ4iHgth6XxPdjf/tmbWpt7qQ3RYixeySNtNjQks7zMn/KGPfLae
         zU74hy+e2ZXEjhijrM/9XPWXQo+B/rIQMHOYPywOWTb6R3CQskW/yyvdQ/UbkB/6IDoK
         v/Xe+gqlQgR2J273NCfChR3w+Chh3BVFYFcESjP2PdxtQFHJsNYxu9Y4y+P7m6RI+s5B
         Vv5gXGi/GyxBQAd6nT73YCqOr4DsLem7CvvIlz/IkU2mPkW3R34bMfo5r28QzbUUAhAw
         q3PA==
X-Gm-Message-State: AOAM531/czvJ2ZpfL5KbnmSNfzv1zLwLioY6cEM2iit9e50cs26/kUdW
        bUNKJCYGTnN8hlLKkdjhLYtIVA==
X-Google-Smtp-Source: ABdhPJwe3MQtxvpkfRv4AHlgaJ3D2gvkb24AEZIkbVm3zf46bPcz6S6A9hctaLiEqi+xCjbVAEqpdw==
X-Received: by 2002:a05:6000:1ca:: with SMTP id t10mr22178254wrx.45.1614009702077;
        Mon, 22 Feb 2021 08:01:42 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c3sm7373697wrw.80.2021.02.22.08.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:01:41 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH 05/25] media: venus: core: Add io base variables for each block
Date:   Mon, 22 Feb 2021 16:02:40 +0000
Message-Id: <20210222160300.1811121-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

New silicon means that the pre-determined offsets we have been using
in this driver no longer hold. Existing blocks of registers can exist at
different offsets relative to the IO base address.

This commit adds a routine to assign the IO base hooks a subsequent commit
will convert from absolute to relative addressing.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 12 ++++++++++++
 drivers/media/platform/qcom/venus/core.h | 10 ++++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 67676f1632ab..01c1828830c7 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -22,6 +22,7 @@
 #include "core.h"
 #include "firmware.h"
 #include "pm_helpers.h"
+#include "hfi_venus_io.h"
 
 static void venus_coredump(struct venus_core *core)
 {
@@ -206,6 +207,15 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type)
 	return ret;
 }
 
+static void venus_assign_register_offsets(struct venus_core *core)
+{
+	core->vbif_base = core->base + VBIF_BASE;
+	core->cpu_base = core->base + CPU_BASE;
+	core->cpu_cs_base = core->base + CPU_CS_BASE;
+	core->cpu_ic_base = core->base + CPU_IC_BASE;
+	core->wrapper_base = core->base + WRAPPER_BASE;
+}
+
 static int venus_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -272,6 +282,8 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_core_put;
 
+	venus_assign_register_offsets(core);
+
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
 		goto err_core_deinit;
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 771f5bb0981e..1be73c707d21 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -90,6 +90,11 @@ struct venus_format {
  * struct venus_core - holds core parameters valid for all instances
  *
  * @base:	IO memory base address
+ * @vbif_base	IO memory vbif base address
+ * @cpu_base	IO memory cpu base address
+ * @cpu_cs_base	IO memory cpu_cs base address
+ * @cpu_ic_base	IO memory cpu_ic base address
+ * @wrapper_base	IO memory wrapper base address
  * @irq:		Venus irq
  * @clks:	an array of struct clk pointers
  * @vcodec0_clks: an array of vcodec0 struct clk pointers
@@ -122,6 +127,11 @@ struct venus_format {
  */
 struct venus_core {
 	void __iomem *base;
+	void __iomem *vbif_base;
+	void __iomem *cpu_base;
+	void __iomem *cpu_cs_base;
+	void __iomem *cpu_ic_base;
+	void __iomem *wrapper_base;
 	int irq;
 	struct clk *clks[VIDC_CLKS_NUM_MAX];
 	struct clk *vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
-- 
2.29.2

