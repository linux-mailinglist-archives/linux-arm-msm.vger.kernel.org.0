Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17C7F321C43
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Feb 2021 17:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbhBVQFF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Feb 2021 11:05:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231438AbhBVQD6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Feb 2021 11:03:58 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67139C0611BC
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 08:01:51 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id l30so3948659wrb.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 08:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jfi93nFRMIEbqzHdYrViv9hk2pcCCjRBia6kkKbplN8=;
        b=k4mt+/CkI0yvDUHJI5esU/1596Y7r5+y5rSLw0s0YDXm9RrCOxLtykT3PXpXm1/AA+
         TZ6gDjjtpDlsMzgN0JgNvt/gRjqdVBovSPLXWwPzOOFm4ntmBF8wuihira7J/SaS6hpi
         hGbYSQ6BBX0+g6bVUBVOVBfPV5GnMZinC+vPN4sejkMFVwKjVCAJ9AJb+9/rxhnDXeSB
         lCVDQppjHt5kdWZdTpj1aYuw5l3u3soxXpD7Jk1m0yt/OYbmA8KOS/BJSbMxCpclZZQq
         DWVVu3rmLNiudW7kmK3tKI4TmlRxSVzhWLahApabKGQmWB1ObvAA8bHHC3YfPTntXGUu
         mJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jfi93nFRMIEbqzHdYrViv9hk2pcCCjRBia6kkKbplN8=;
        b=PX8vYZ2Nzy5oE891DUeXjSr4qNRDKmsN0KozPesXCPgthMoThpsP6njrnPvcxnGHiV
         KHNgC7bv65OWfBo6odDMo1/N6FwvEUksEstMgARc2Zs0PmVWXuqjPP1j3T+nqmqwO6lo
         J878rAmJi5T41yBbm1+Iuv9EZU47rY84MVYcnz6ejEkuPuxGiAJm6b+Bd75E6hpAlnDF
         eF9O6AqLFav6DKHmxFNYx+E4UvFtwv5tKG39QaqMp25nuV7jPUehAfD8B5ipeGugjUSP
         PDu4x5N1CQT5aXV5qOykXp/V2N293NV4XBxqD3KGprpGJ9lXwLzkkl+GGcMiGxHyxl1q
         A81w==
X-Gm-Message-State: AOAM531TKRu5Jo6VAq9chJGGZV11iOIMwHWEhdsQOX3N9ploDvdipAlc
        rwvHkcbEnp4m9BnEXzfHKUJc3g==
X-Google-Smtp-Source: ABdhPJzDOPMpBsXXzRoujYsFyJdzVsTgdSmP7tS6Sex6+tmAxztCbuVpsPLOHpTBB1nAp3ffiPd4ng==
X-Received: by 2002:adf:dcd2:: with SMTP id x18mr22031726wrm.355.1614009710240;
        Mon, 22 Feb 2021 08:01:50 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c3sm7373697wrw.80.2021.02.22.08.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:01:49 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH 13/25] media: venus: hfi: Add a 6xx boot logic
Date:   Mon, 22 Feb 2021 16:02:48 +0000
Message-Id: <20210222160300.1811121-14-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

This patch adds a 6xx specific boot logic. The goal is to share as much
code as possible between 3xx, 4xx and 6xx silicon.

We need to do a different write to WRAPPER_INTR_MASK with an additional
write to CPU_CS_H2XSOFTINTEN_V6 and CPU_CS_X2RPMh_V6.

The other writes are the same for 6xx and non-6xx silicon albeit at
different absolute relative locations to the base of the venus address
space.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index f95cdd3d530c..5f9c8aa84cd0 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -442,14 +442,21 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
 {
 	struct device *dev = hdev->core->dev;
 	static const unsigned int max_tries = 100;
-	u32 ctrl_status = 0;
+	u32 ctrl_status = 0, mask_val;
 	unsigned int count = 0;
 	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
 	void __iomem *wrapper_base = hdev->core->wrapper_base;
 	int ret = 0;
 
 	writel(BIT(VIDC_CTRL_INIT_CTRL_SHIFT), cpu_cs_base + VIDC_CTRL_INIT);
-	writel(WRAPPER_INTR_MASK_A2HVCODEC_MASK, wrapper_base + WRAPPER_INTR_MASK);
+	if (IS_V6(hdev->core)) {
+		mask_val = readl(wrapper_base + WRAPPER_INTR_MASK);
+		mask_val &= ~(WRAPPER_INTR_MASK_A2HWD_BASK_V6 |
+			      WRAPPER_INTR_MASK_A2HCPU_MASK);
+	} else {
+		mask_val = WRAPPER_INTR_MASK_A2HVCODEC_MASK;
+	}
+	writel(mask_val, wrapper_base + WRAPPER_INTR_MASK);
 	writel(1, cpu_cs_base + CPU_CS_SCIACMDARG3);
 
 	while (!ctrl_status && count < max_tries) {
@@ -467,6 +474,9 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
 	if (count >= max_tries)
 		ret = -ETIMEDOUT;
 
+	if (IS_V6(hdev->core))
+		writel(0x0, cpu_cs_base + CPU_CS_X2RPMH_V6);
+
 	return ret;
 }
 
-- 
2.29.2

