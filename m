Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B29E422030
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 10:11:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232761AbhJEIM7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 04:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232942AbhJEIM6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 04:12:58 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3667DC06174E
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 01:11:08 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id bm13so24926715edb.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 01:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5aa4vZiuIFSCPHF4dxekm5eLMC5HcT+Pb9Hlo0UAubI=;
        b=JYzfxac7W+813vz3g6oISyCSz1sLUD4TZXUQfbe+Ap5PzbUCz8pDjLyYvazAS9erlY
         z3K037RE8QB+HZ06Sx1KP5VYA3uMLdY0lVEwCZ6ldhl56L4hZ83AuoJe1MF/JL6P0fWD
         Z0jgWVbjUB/K9WrR7rDiJ7+W+p12mI6/Z4WfeQLMeQUw7JoaR1C5WmOitJJLH39zviF4
         rb6k5R+5hRqp7cDpsRqIgyRwmb1eSxOjrD1F2ofrkbv4IPj9lI90PPbTORFgOzRvZNeG
         ADejhdeUFvn6QQWdkOy52Yva9v9+FJgvUiXUmHRD9UCKGxJTlL2ClW4TWOar75Mia6Jj
         XHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5aa4vZiuIFSCPHF4dxekm5eLMC5HcT+Pb9Hlo0UAubI=;
        b=VhbB7+XhXvRXAxTf6IF24rS1Q7+Xjxmk1emAUmSuXTfSfZ3yhHdtBo5ru2zjb4nvo+
         Di7hXivtvE9/joyu6mxy5/UUrNobZs990ArK7dRb8h/WZX4BbHWHOmua6t5xjIKJwa4i
         FjpCOJopd063MnEXcFAHBWE4Bs6+chAR8Qkt5NPP5H/1fkSjV9+dvnII8hbBMfVF8Ef7
         AeMhP3F2RTv6E0WiTBr2GS2ecq477OIMTQJ51MsHXieKeyNdyMh4IgmHT8nqshQsbKuj
         i5IkdWuSvd4YadOo+f8gm9tQNFmWdoOoCYC8rh/HC22HQNGOT5i72Iaj9IZ2upvXYvQQ
         OSSg==
X-Gm-Message-State: AOAM533Zau+tlY6Q7PBu5kMK/pxfRCtqmevDruUNwykW/kSkSj79B/Yo
        VF9ebAgFhJHFitododjwPENOVg==
X-Google-Smtp-Source: ABdhPJyNuhS5/OGQl3GyNzyK2Qf/kZaKWCLVmzcZORm7DqQ8n6orub/P2fkp4YteNMOvh/Ssi7bouQ==
X-Received: by 2002:a17:906:aed1:: with SMTP id me17mr23060476ejb.474.1633421466458;
        Tue, 05 Oct 2021 01:11:06 -0700 (PDT)
Received: from localhost.localdomain ([84.238.208.199])
        by smtp.gmail.com with ESMTPSA id f1sm3096258edz.47.2021.10.05.01.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 01:11:06 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v5 1/7] venus: firmware: enable no tz fw loading for sc7280
Date:   Tue,  5 Oct 2021 11:10:42 +0300
Message-Id: <20211005081048.3095252-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005081048.3095252-1-stanimir.varbanov@linaro.org>
References: <20211005081048.3095252-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

Enable no tz FW loading and add routine to reset XTSS.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/firmware.c  | 42 ++++++++++++++-----
 .../media/platform/qcom/venus/hfi_venus_io.h  |  2 +
 2 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 227bd3b3f84c..14b6f1d05991 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -27,7 +27,12 @@
 static void venus_reset_cpu(struct venus_core *core)
 {
 	u32 fw_size = core->fw.mapped_mem_size;
-	void __iomem *wrapper_base = core->wrapper_base;
+	void __iomem *wrapper_base;
+
+	if (IS_V6(core))
+		wrapper_base = core->wrapper_tz_base;
+	else
+		wrapper_base = core->wrapper_base;
 
 	writel(0, wrapper_base + WRAPPER_FW_START_ADDR);
 	writel(fw_size, wrapper_base + WRAPPER_FW_END_ADDR);
@@ -35,11 +40,17 @@ static void venus_reset_cpu(struct venus_core *core)
 	writel(fw_size, wrapper_base + WRAPPER_CPA_END_ADDR);
 	writel(fw_size, wrapper_base + WRAPPER_NONPIX_START_ADDR);
 	writel(fw_size, wrapper_base + WRAPPER_NONPIX_END_ADDR);
-	writel(0x0, wrapper_base + WRAPPER_CPU_CGC_DIS);
-	writel(0x0, wrapper_base + WRAPPER_CPU_CLOCK_CONFIG);
 
-	/* Bring ARM9 out of reset */
-	writel(0, wrapper_base + WRAPPER_A9SS_SW_RESET);
+	if (IS_V6(core)) {
+		/* Bring XTSS out of reset */
+		writel(0, wrapper_base + WRAPPER_TZ_XTSS_SW_RESET);
+	} else {
+		writel(0x0, wrapper_base + WRAPPER_CPU_CGC_DIS);
+		writel(0x0, wrapper_base + WRAPPER_CPU_CLOCK_CONFIG);
+
+		/* Bring ARM9 out of reset */
+		writel(0, wrapper_base + WRAPPER_A9SS_SW_RESET);
+	}
 }
 
 int venus_set_hw_state(struct venus_core *core, bool resume)
@@ -56,7 +67,9 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
 	if (resume) {
 		venus_reset_cpu(core);
 	} else {
-		if (!IS_V6(core))
+		if (IS_V6(core))
+			writel(1, core->wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
+		else
 			writel(1, core->wrapper_base + WRAPPER_A9SS_SW_RESET);
 	}
 
@@ -162,12 +175,19 @@ static int venus_shutdown_no_tz(struct venus_core *core)
 	u32 reg;
 	struct device *dev = core->fw.dev;
 	void __iomem *wrapper_base = core->wrapper_base;
+	void __iomem *wrapper_tz_base = core->wrapper_tz_base;
 
-	/* Assert the reset to ARM9 */
-	reg = readl_relaxed(wrapper_base + WRAPPER_A9SS_SW_RESET);
-	reg |= WRAPPER_A9SS_SW_RESET_BIT;
-	writel_relaxed(reg, wrapper_base + WRAPPER_A9SS_SW_RESET);
-
+	if (IS_V6(core)) {
+		/* Assert the reset to XTSS */
+		reg = readl_relaxed(wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
+		reg |= WRAPPER_XTSS_SW_RESET_BIT;
+		writel_relaxed(reg, wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
+	} else {
+		/* Assert the reset to ARM9 */
+		reg = readl_relaxed(wrapper_base + WRAPPER_A9SS_SW_RESET);
+		reg |= WRAPPER_A9SS_SW_RESET_BIT;
+		writel_relaxed(reg, wrapper_base + WRAPPER_A9SS_SW_RESET);
+	}
 	/* Make sure reset is asserted before the mapping is removed */
 	mb();
 
diff --git a/drivers/media/platform/qcom/venus/hfi_venus_io.h b/drivers/media/platform/qcom/venus/hfi_venus_io.h
index 300c6e47e72f..9735a246ce36 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus_io.h
+++ b/drivers/media/platform/qcom/venus/hfi_venus_io.h
@@ -149,6 +149,8 @@
 /* Wrapper TZ 6xx */
 #define WRAPPER_TZ_BASE_V6			0x000c0000
 #define WRAPPER_TZ_CPU_STATUS_V6		0x10
+#define WRAPPER_TZ_XTSS_SW_RESET		0x1000
+#define WRAPPER_XTSS_SW_RESET_BIT		BIT(0)
 
 /* Venus AON */
 #define AON_BASE_V6				0x000e0000
-- 
2.25.1

