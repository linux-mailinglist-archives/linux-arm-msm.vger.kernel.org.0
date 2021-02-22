Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC688321C25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Feb 2021 17:04:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbhBVQD3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Feb 2021 11:03:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231217AbhBVQDV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Feb 2021 11:03:21 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66B49C0611C1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 08:01:49 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id l12so19632697wry.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 08:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X/puQRm1/H6m4WNnTmXYDqGRONSIKPTs3nt8rX8xbO0=;
        b=JsrPjvI48UCnUWcuP6kDjhPGcfchsyx3j+jgOtVjCPp1dJ45HDghmtj7qRY1nD0M0r
         fmP0dYUnZNY40WqEzedI9HkHlTo8vrDtTZsrA7Epd7oZPPXTKRhm8Q2T2vmYN+gZZ1d9
         WaQspRKS+U3iZr/JV3wCFTbf7792BfDO39Xowbny/SPHjePPZPkuDKRhoKgeuv9WGQj6
         3hskL28NJV1l+uxuMp7Y8sh5mB8012eXBW/AfqFy4VDemlmFsAgil0gF31CONM5jIcAF
         V0hNer9rspphBWafHp9k9ex7C3posdCXaQoUt2g31G2unR6CfN0LNnaK7mHrXhFqe0EV
         RK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X/puQRm1/H6m4WNnTmXYDqGRONSIKPTs3nt8rX8xbO0=;
        b=ORyrdaN62d6QAASwmnZohtvsmCCyCzuuo4IBsdHHF4qLXCBKv0rxO7z8aVrlm5rtU7
         5S36OssPINbol4FpVPkew4u2mVsKZXMlUADaU7RNAXY90H0hnkyp7BgZ1I3t82J0ElCy
         bMNbw14OPCRdV6uNy58CAchh6MuC9aE/24dz3XRyfvyLe/C5TgGa0dwkVuW3MUMwVVIw
         hFcgwB+JklRKuqh+fQS/5sQ3gXz3hs31dBWy29pTWaGLm1bvjkznPW5Xf92/9QG5Ro7p
         w/bgdTku/1/cNzGzvqFWfnAWc9GzeU0ALEkqTXaZhK/2D+Qtx2JRL8Mwc8GI39vIkAyj
         Z3OQ==
X-Gm-Message-State: AOAM533LSE60jfleA2pvnzfREsfEM6F18+3/t0q5GmU57pgMlLdaD+at
        wGhHgTFRj398BEjnbSFYm56NaQ==
X-Google-Smtp-Source: ABdhPJybu35JgJQhoZCTUtY+dXw8VjDCzpt9wbA+AYewBujd4tJjdUalMjbzl+yoEElrEloq6dH0Nw==
X-Received: by 2002:adf:fb8a:: with SMTP id a10mr22035980wrr.365.1614009708206;
        Mon, 22 Feb 2021 08:01:48 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c3sm7373697wrw.80.2021.02.22.08.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:01:47 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH 11/25] media: venus: core: Add an io base for AON regs
Date:   Mon, 22 Feb 2021 16:02:46 +0000
Message-Id: <20210222160300.1811121-12-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

6xx silicon needs to access registers from a AON base address range.
This commit defines the necessary variable for later use.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 1 +
 drivers/media/platform/qcom/venus/core.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 35a8956fe969..dad597617961 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -215,6 +215,7 @@ static void venus_assign_register_offsets(struct venus_core *core)
 	core->cpu_ic_base = core->base + CPU_IC_BASE;
 	core->wrapper_base = core->base + WRAPPER_BASE;
 	core->wrapper_tz_base = 0;
+	core->aon_base = 0;
 }
 
 static int venus_probe(struct platform_device *pdev)
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 54e6cd89b30a..8328f7210d6c 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -96,6 +96,7 @@ struct venus_format {
  * @cpu_ic_base	IO memory cpu_ic base address
  * @wrapper_base	IO memory wrapper base address
  * @wrapper_base	IO memory wrapper TZ base address
+ * @aon_base	AON base address
  * @irq:		Venus irq
  * @clks:	an array of struct clk pointers
  * @vcodec0_clks: an array of vcodec0 struct clk pointers
@@ -134,6 +135,7 @@ struct venus_core {
 	void __iomem *cpu_ic_base;
 	void __iomem *wrapper_base;
 	void __iomem *wrapper_tz_base;
+	void __iomem *aon_base;
 	int irq;
 	struct clk *clks[VIDC_CLKS_NUM_MAX];
 	struct clk *vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
-- 
2.29.2

