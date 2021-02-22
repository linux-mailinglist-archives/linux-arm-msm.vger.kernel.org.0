Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4D20321C40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Feb 2021 17:07:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231343AbhBVQE6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Feb 2021 11:04:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbhBVQD6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Feb 2021 11:03:58 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B982C0611BE
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 08:01:52 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id b3so19624293wrj.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 08:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q8MTGQpZlIaQDClaUfWSOZMS2MTg1prNaQUdzKKuVqI=;
        b=byVk8oB+fJuThD+BDZ+PEaC7NNxKvaGpM0TMKPfd6eMVslRbDJWgVCseMnQFIHpbOq
         9ueIB/MQa2ElP6jWZidyEABdZof7z1Pfcd3qrNfz86O0w4YROit5cz8pjm3m8KqnmbvZ
         HViL6YXc1/HvZyiyE0HmU6RfJexyJrGwlxwx6KGWejzQrOL0pCCaiMpjEruLnpZGHl/M
         YBNHmaUbRXM3ddgQ4joIVvG5vvqMX31WgsX/OXdFVTm8K8iFJBWZ8ONi72BIhi/Z5BUh
         BmOoAzxnz4hJA/z7/8FKVz0sViVu01QpLgowbdmYXpIvPjKCfOM6S5VOR5F8Qt0xFpZG
         cXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q8MTGQpZlIaQDClaUfWSOZMS2MTg1prNaQUdzKKuVqI=;
        b=ePxqM46xxnj7It0wXW1L3YwMyrCxwu/AQRfFd1enGADlBN1K8hoNF7R69ixeSRWXAh
         ZWNnMZehjXdnYKeUu01jraaBo9wz83Z80VsSMtx81pZNlUDt0n3iCdBMsWmil64jZM3Y
         Grsz05BqzQ8ciXZqes7pTvIWKrMhInQWWVIwpUa5UzxbrHlIPKVGi+MW1NpYEzPhUdBZ
         ecHNTJBubKeol0qtforBbypg93HrbiYrTbsT5r6cnm/fpgZm6sausQjAG+HDwnzeStcq
         lqS4Xt1+bxfE8m+6LOxocYD7G3xGL1QZjdcesStKEhKBxjoYo3N4GLA41YMYG+LYKnFr
         OWGA==
X-Gm-Message-State: AOAM533JH1fYdtp6X9tbTEqtf8xAoacIoi6H+MQPA3xDaujNVulkePqc
        3NSbDM/DY1cE3TwF4nh/Pjgjdg==
X-Google-Smtp-Source: ABdhPJxqcPsW96Th1eC1aqUbK1Tlov3na1EQ/ubUHbuIvKD+oNzRN43WffonoYBtyfd/2F7tWM6pSA==
X-Received: by 2002:a5d:4848:: with SMTP id n8mr5522851wrs.241.1614009711183;
        Mon, 22 Feb 2021 08:01:51 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c3sm7373697wrw.80.2021.02.22.08.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:01:50 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH 14/25] media: venus: hfi: Add 6xx interrupt support
Date:   Mon, 22 Feb 2021 16:02:49 +0000
Message-Id: <20210222160300.1811121-15-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

This commit adds 6xx specific interrupt support, some register offsets and
bitmasks differ from 4xx, which we account for in this commit.

[bod: Added commit log. Moved register definition into commit]

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Co-developed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 32 +++++++++++++------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 5f9c8aa84cd0..09fc81da0645 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -359,8 +359,14 @@ static void venus_set_registers(struct venus_hfi_device *hdev)
 static void venus_soft_int(struct venus_hfi_device *hdev)
 {
 	void __iomem *cpu_ic_base = hdev->core->cpu_ic_base;
+	u32 clear_bit;
 
-	writel(BIT(CPU_IC_SOFTINT_H2A_SHIFT), cpu_ic_base + CPU_IC_SOFTINT);
+	if (IS_V6(hdev->core))
+		clear_bit = BIT(CPU_IC_SOFTINT_H2A_SHIFT_V6);
+	else
+		clear_bit = BIT(CPU_IC_SOFTINT_H2A_SHIFT);
+
+	writel(clear_bit, cpu_ic_base + CPU_IC_SOFTINT);
 }
 
 static int venus_iface_cmdq_write_nolock(struct venus_hfi_device *hdev,
@@ -474,8 +480,10 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
 	if (count >= max_tries)
 		ret = -ETIMEDOUT;
 
-	if (IS_V6(hdev->core))
+	if (IS_V6(hdev->core)) {
+		writel(0x1, cpu_cs_base + CPU_CS_H2XSOFTINTEN_V6);
 		writel(0x0, cpu_cs_base + CPU_CS_X2RPMH_V6);
+	}
 
 	return ret;
 }
@@ -1061,14 +1069,20 @@ static irqreturn_t venus_isr(struct venus_core *core)
 		return IRQ_NONE;
 
 	status = readl(wrapper_base + WRAPPER_INTR_STATUS);
-
-	if (status & WRAPPER_INTR_STATUS_A2H_MASK ||
-	    status & WRAPPER_INTR_STATUS_A2HWD_MASK ||
-	    status & CPU_CS_SCIACMDARG0_INIT_IDLE_MSG_MASK)
-		hdev->irq_status = status;
-
+	if (IS_V6(core)) {
+		if (status & WRAPPER_INTR_STATUS_A2H_MASK ||
+		    status & WRAPPER_INTR_STATUS_A2HWD_MASK_V6 ||
+		    status & CPU_CS_SCIACMDARG0_INIT_IDLE_MSG_MASK)
+			hdev->irq_status = status;
+	} else {
+		if (status & WRAPPER_INTR_STATUS_A2H_MASK ||
+		    status & WRAPPER_INTR_STATUS_A2HWD_MASK ||
+		    status & CPU_CS_SCIACMDARG0_INIT_IDLE_MSG_MASK)
+			hdev->irq_status = status;
+	}
 	writel(1, cpu_cs_base + CPU_CS_A2HSOFTINTCLR);
-	writel(status, wrapper_base + WRAPPER_INTR_CLEAR);
+	if (!IS_V6(core))
+		writel(status, wrapper_base + WRAPPER_INTR_CLEAR);
 
 	return IRQ_WAKE_THREAD;
 }
-- 
2.29.2

