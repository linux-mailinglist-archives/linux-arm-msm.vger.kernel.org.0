Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 319A1352961
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 12:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234984AbhDBKFk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 06:05:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234779AbhDBKFc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 06:05:32 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 702D3C061788
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 03:05:27 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id i18so844867wrm.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 03:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7R+42MHtLVjz5D1+bPy8QR3kBlUIryDw6BfwYHtrXnI=;
        b=E+D8wYKgfKbboUDP058OCuC/Ni3y9Gauzr7vGXM/qJQOskSVL/y/cqQ6hyf6uOK/In
         QTRWcqcs971RQL2fNsiBe6/g7B2C61nMG9xOh+p3a3NhXqEdluS0oZkrq1TBIeQ8JY0p
         bjgR/YSRt8beXs6OmF2ot13QzCU1/7w1guq2sTsjbUVm/Xj+vvObp8b8tu/6WEcC/ukf
         UD0sXWP52aAG+9WJes54M3l2DlM8KyKfpaJuPH/K+Is27hAsB6T0rTVa463wH7vAwIu0
         pV12cY3H2AxqP5WnVa1s+3RNQzBz/dAwzZKkG6lDNyLcaxUg3BpIWCi0gNstX3WfyBKF
         FFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7R+42MHtLVjz5D1+bPy8QR3kBlUIryDw6BfwYHtrXnI=;
        b=X98WO115jOW5NpJ9u/K9tZAOC2oAale27sXIwvPq8RIslvSIc7HnpOrKVpkjciHbVV
         DpvTR1HDAsfk1SGdRpWntna3r0QKwG9JDV+l2SVwJXU8L32rw8EhVHjKGxPpydR8q5R/
         OYJkXpI9xGPLzXdIAy2pFQLKMzLclv8JR+ly9q8rxkQlcMQrHFEQBJCQgMx0MwgOeUtU
         ZVjhQbNMuJpqWjCR9/0pPSe2xoAPHmhPR1tkBiNps/H64OYKnESEgpCvD2m24qPtEaMU
         lMUI5PdVPNbzO85OgGjaQ7sFOMJJXy6cisyac7BqOFOQmyx3njqgOJKZr13KJDQGZDKC
         Hzng==
X-Gm-Message-State: AOAM530kdjvvK5WsuJsdCAsYGI9BRM6t3DYRUBv4bf/LqheNyHY+lSJP
        iFKEATuQqlE9e3RGKbJHk5eQTg==
X-Google-Smtp-Source: ABdhPJxyig7jM7Kn4kClS9i8YydNKtcAeG8wdqOqW/oytaNoyKu8aadEiuJobzr+B3OBct150eWnZA==
X-Received: by 2002:a5d:604b:: with SMTP id j11mr14256113wrt.424.1617357926185;
        Fri, 02 Apr 2021 03:05:26 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v18sm15466618wrf.41.2021.04.02.03.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:05:25 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v3 09/25] media: venus: core: Add an io base for TZ wrapper regs
Date:   Fri,  2 Apr 2021 11:06:32 +0100
Message-Id: <20210402100648.1815854-10-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
References: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

6xx silicon needs to access registers from a wrapper trust-zone base
address range.
This commit defines the necessary variable for later use.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 1 +
 drivers/media/platform/qcom/venus/core.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7124d9111001..cf2aa83c4378 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -215,6 +215,7 @@ static void venus_assign_register_offsets(struct venus_core *core)
 	core->cpu_cs_base = core->base + CPU_CS_BASE;
 	core->cpu_ic_base = core->base + CPU_IC_BASE;
 	core->wrapper_base = core->base + WRAPPER_BASE;
+	core->wrapper_tz_base = 0;
 }
 
 static int venus_probe(struct platform_device *pdev)
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 85047806142f..0c519211fac3 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -95,6 +95,7 @@ struct venus_format {
  * @cpu_cs_base	IO memory cpu_cs base address
  * @cpu_ic_base	IO memory cpu_ic base address
  * @wrapper_base	IO memory wrapper base address
+ * @wrapper_base	IO memory wrapper TZ base address
  * @irq:		Venus irq
  * @clks:	an array of struct clk pointers
  * @vcodec0_clks: an array of vcodec0 struct clk pointers
@@ -132,6 +133,7 @@ struct venus_core {
 	void __iomem *cpu_cs_base;
 	void __iomem *cpu_ic_base;
 	void __iomem *wrapper_base;
+	void __iomem *wrapper_tz_base;
 	int irq;
 	struct clk *clks[VIDC_CLKS_NUM_MAX];
 	struct clk *vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
-- 
2.30.1

