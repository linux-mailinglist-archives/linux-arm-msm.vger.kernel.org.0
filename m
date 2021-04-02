Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF460352963
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 12:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234779AbhDBKFk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 06:05:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234868AbhDBKFf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 06:05:35 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76594C061794
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 03:05:32 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id b9so4302747wrt.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 03:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TpEdR2IV3OYZgpVzePZ+eNmYK6P9QMXJzc4TaX/ELQk=;
        b=X0DWWLLKc2F+bRVX6HmEEm/ze5bEgsc0OnnHssty+AIW/Hj/0PYJ85KH1rKj2yT5nr
         ulUkv96arIo7iFiaFyEULoYYdv2DocrCqtskMfMYCbxS5lUMmnM9Gzd9WXlT8tby62y0
         MWpNgUCpW1SlcqRRvHxQxgQLhGF6XBeuSH0AhEz6YJatct80WoHVAg6I90C5mDPY01DR
         OmhpROsubbAZnV8n+YmtUrh1nnE6k97/rEF+GFSMhtEozpZ6RPe1DRA8SCqwusowCqJK
         0bDsl6Ia/1EYu1ZUmdwuguYO47TKhYtRvI+bXCaZUfyCdmKOa1a22Iu+MDEsEX85pupq
         +xug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TpEdR2IV3OYZgpVzePZ+eNmYK6P9QMXJzc4TaX/ELQk=;
        b=dmhA1UMcOBKn3tKcibejZxOSKfFKQRLWfUBL8rJBlH/288z3P6EVuis6G/xBS6DtQs
         Dw36bQfb/gC1nS7AMiy2Ti/8WemXIXMbHhvG8hhtlEH4r56gfsp1aU+wqJn5cDpjV6sc
         17/n7PnrG16t33rrYY7SOoE7+JZHR8wItB1YPNmefxlJp3wAsq6yci2ogUzEmvYdHlku
         PXxIYG1VVvkMmd+T+mAWGhhUJ6X1NvnXdmbIZxF9lqT4+LGpLLL+3LTy1ipkVmzBCXmz
         oraIXl9sd0IhcF2OiHmal7sRBVUrc/IVtl82gPnBjnhDWyILmr5EpNTyRWgNq6JnVznW
         NlgQ==
X-Gm-Message-State: AOAM530AcUoFsHEQxK+n9Y6TxJhA7J9YceY+QbO2YakifPr6iZFslLn9
        bXNeEaUhF/6RjwyDJ0l8GRhEDA==
X-Google-Smtp-Source: ABdhPJx6zuju6c6vErH4WLDmvrZPl4ipTPT5k608owgLv8y+rUa463X0GcBz5NC1soIfPn/+QjHLQw==
X-Received: by 2002:a5d:58ce:: with SMTP id o14mr14743393wrf.4.1617357931225;
        Fri, 02 Apr 2021 03:05:31 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v18sm15466618wrf.41.2021.04.02.03.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:05:30 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v3 14/25] media: venus: hfi: Read WRAPPER_TZ_CPU_STATUS_V6 on 6xx
Date:   Fri,  2 Apr 2021 11:06:37 +0100
Message-Id: <20210402100648.1815854-15-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
References: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6xx we should read wrapper cpu status from the wrapper TZ register set.

Co-developed-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Co-developed-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 09fc81da0645..dabff8654f97 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1472,10 +1472,14 @@ static int venus_suspend_1xx(struct venus_core *core)
 static bool venus_cpu_and_video_core_idle(struct venus_hfi_device *hdev)
 {
 	void __iomem *wrapper_base = hdev->core->wrapper_base;
+	void __iomem *wrapper_tz_base = hdev->core->wrapper_tz_base;
 	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
 	u32 ctrl_status, cpu_status;
 
-	cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
+	if (IS_V6(hdev->core))
+		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
+	else
+		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
 	ctrl_status = readl(cpu_cs_base + CPU_CS_SCIACMDARG0);
 
 	if (cpu_status & WRAPPER_CPU_STATUS_WFI &&
@@ -1488,10 +1492,14 @@ static bool venus_cpu_and_video_core_idle(struct venus_hfi_device *hdev)
 static bool venus_cpu_idle_and_pc_ready(struct venus_hfi_device *hdev)
 {
 	void __iomem *wrapper_base = hdev->core->wrapper_base;
+	void __iomem *wrapper_tz_base = hdev->core->wrapper_tz_base;
 	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
 	u32 ctrl_status, cpu_status;
 
-	cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
+	if (IS_V6(hdev->core))
+		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
+	else
+		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
 	ctrl_status = readl(cpu_cs_base + CPU_CS_SCIACMDARG0);
 
 	if (cpu_status & WRAPPER_CPU_STATUS_WFI &&
-- 
2.30.1

