Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF1013394DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 18:30:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232768AbhCLR35 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 12:29:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232797AbhCLR3b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 12:29:31 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D0EC061761
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 09:29:31 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id o16so2206325wrn.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 09:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=igIfstulndJUDaEydUX1L/UHdeNF+qcRikxpyKWA0c4=;
        b=CCg5Z+aWawW5CS+zYkb+0/PlVx3P/GQoS+JTCL6s3SDDYzYL9eU9pji03oc4esfeIY
         75wf2ikW78ytoTJIfTodlVERmgkMVmoW0cObgT9Vvb7gD74OCZy/uPxomaGqzd9RNItx
         HlFSokszZb3ATFHdhpo/b7Lbx587GyOnXbx0vWbGTRQm41kAtg3vbuUWoBrmNwX3ojf2
         Z0rA1azyVGZWvjHHkKbqKxnznRifApTiLcH1G4Z6M3aErVwoifWfqDle/Pb2TQOmBARv
         dRSEKIO4ZQyA1j3s/ULpxdZew6UOn7n/M06J80EzHQXW9KNu3qmuj5Y7L5asaofL/E7V
         EGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=igIfstulndJUDaEydUX1L/UHdeNF+qcRikxpyKWA0c4=;
        b=X8GvHzh0EhfbOVHhwE8LMoSEYRdDCvyNzk8V8BIBUHSZZ7HjjKk7IIHT4eXcOUHZgB
         s0CuGvFgHIb9Jt5hlIvk52ruIgfhnY6+ksKj7vnyLkPGSHpYppMh/B8kwOonw8Ht7SrX
         l8Pm/3nmJi4nnoPw8pHIhmNiYsT/+Z02ziOa86OiYUBj3KBkQybpyPTPNAWIVdI0EMxj
         47wyNkMWU9cRqb7X1k4Y2Re11vFWs/h1gaH8GUEEXWuLBBHmcsFxzl3iHjPF1f0qNFrb
         K7MW0SuQ7deN3pgkoB2E2xD4ka6KqIgkVc3EIVbPaivhdhlpGBhVGvmCmWspehz3qMX+
         uU7Q==
X-Gm-Message-State: AOAM531u/NPkE1bG3d/dPFesfR30NMdMTISgtg0S61wtPvqsPYYNz7eE
        KlArnmlUV3ovMpeimj1OLy+NQA==
X-Google-Smtp-Source: ABdhPJyax0ojiE9GFA7Q3DZCH5U2b/lbzWtpwBKZfdPGonRz9TcOj06PYi6xUBuIsI863UeC3BtbrA==
X-Received: by 2002:adf:b1c9:: with SMTP id r9mr15498127wra.51.1615570169732;
        Fri, 12 Mar 2021 09:29:29 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 18sm2876375wmj.21.2021.03.12.09.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:29:29 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v2 18/25] media: venus: hfi: Add 6xx AXI halt logic
Date:   Fri, 12 Mar 2021 17:30:32 +0000
Message-Id: <20210312173039.1387617-19-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
References: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

This patch takes the downstream AXI halt routine and applies it when
IS_V6() is true.

bod: Converted to readl_poll_timeout()
     Removed poll timeout for LPI register, testing showed the value
     would always timeout and work, so the polling did nothing of value.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Co-developed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 24cf20f76e7f..cebb20cf371f 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -541,10 +541,42 @@ static int venus_halt_axi(struct venus_hfi_device *hdev)
 {
 	void __iomem *wrapper_base = hdev->core->wrapper_base;
 	void __iomem *vbif_base = hdev->core->vbif_base;
+	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
+	void __iomem *aon_base = hdev->core->aon_base;
 	struct device *dev = hdev->core->dev;
 	u32 val;
+	u32 mask_val;
 	int ret;
 
+	if (IS_V6(hdev->core)) {
+		writel(0x3, cpu_cs_base + CPU_CS_X2RPMH_V6);
+
+		writel(0x1, aon_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+		ret = readl_poll_timeout(aon_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
+					 val,
+					 val & BIT(0),
+					 POLL_INTERVAL_US,
+					 VBIF_AXI_HALT_ACK_TIMEOUT_US);
+		if (ret)
+			return -ETIMEDOUT;
+
+		mask_val = (BIT(2) | BIT(1) | BIT(0));
+		writel(mask_val, wrapper_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL_V6);
+
+		writel(0x00, wrapper_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL_V6);
+		ret = readl_poll_timeout(wrapper_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS_V6,
+					 val,
+					 val == 0,
+					 POLL_INTERVAL_US,
+					 VBIF_AXI_HALT_ACK_TIMEOUT_US);
+
+		if (ret) {
+			dev_err(dev, "DBLP Release: lpi_status %x\n", val);
+			return -ETIMEDOUT;
+		}
+		return 0;
+	}
+
 	if (IS_V4(hdev->core)) {
 		val = readl(wrapper_base + WRAPPER_CPU_AXI_HALT);
 		val |= WRAPPER_CPU_AXI_HALT_HALT;
-- 
2.30.1

