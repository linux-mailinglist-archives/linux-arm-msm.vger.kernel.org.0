Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 955D7321C3A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Feb 2021 17:07:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbhBVQEk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Feb 2021 11:04:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231392AbhBVQDp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Feb 2021 11:03:45 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A9B8C061225
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 08:01:48 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id l12so19632630wry.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 08:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lciWFaVyAjUGcLf/UXnkqFKZDeRxBKQIFgTCiBjIihg=;
        b=x21gKUiShumnIsW0N1K6FqDGgoTHb28vRGO5NbR2gEdgzRI3RTjXCL2S1BXl1qXpkl
         nn7qgB8Ll3nDv1OLT0nfjtQSzLgvaaPB+tT9fI6j++1XwOxKyJ/VTelh11WFq/KPz4Q+
         TElcOKUHsPBaV2pB3KCb9TQpYT7NWVhlWONkpFi3jxG61HjZoObVCzjxu5DC0lw23oak
         tfQtu0UWDF9UazhVAg/Kdat/MEtY20MRNZ0GCxRKBOOweHHvzH/++O395OWusfrydH7K
         ElxjsylMBAB2ecvSH7gex4Vz/SD2ktNbRRKX9FSxvsdoWbpNxXQMODx2G70SXExa9ZvI
         7VMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lciWFaVyAjUGcLf/UXnkqFKZDeRxBKQIFgTCiBjIihg=;
        b=jCg9xPyefhtYVnLH9+F+b2xCZsjf4Trdb8BX6aacSwmONCpTcA5GIdBbcyg0gV2Uiy
         RdJ7Gs+UWQkZsJUsXrhaxeW+qCS4yjpIBJkkT20EiiVTokBOGGraDUqRfB4z86IewrEG
         UV2hCyXLZYjV1OCr8Y86Y6A8sULLsCGrTXW6o1PmOZwQdznADGJNaV76alYULW2J3/C0
         pWq0FHfu0Er0ONaFS5f5h1foUhRtbDmw9NnBDM9IGqRH/QVciiyNV8vZER5wsm0AribX
         1vMWh6ARt26vtvs/IThyPbPAm0Q/baeuHSTZvHLoD5C9U5qKyOHd41ij/wQkKftJvEfp
         zttQ==
X-Gm-Message-State: AOAM532vefywqWdZ030Utvb5/sDLglOdbyhelf1dQcMxVcNQ7HDNVjMF
        jl97hz5AURruY0mkU8J+A2mPpQ==
X-Google-Smtp-Source: ABdhPJxy5pHTIIPM54uC4wPwcOk9vl1R1/68tILtLKtwGJuqTbJCegj/f9tpPs7lhwtvj2xq5xqwaQ==
X-Received: by 2002:a5d:52c2:: with SMTP id r2mr2461371wrv.40.1614009707193;
        Mon, 22 Feb 2021 08:01:47 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c3sm7373697wrw.80.2021.02.22.08.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:01:46 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH 10/25] media: venus: core: Add an io base for TZ wrapper regs
Date:   Mon, 22 Feb 2021 16:02:45 +0000
Message-Id: <20210222160300.1811121-11-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

6xx silicon needs to access registers from a wrapper trust-zone base
address range.
This commit defines the necessary variable for later use.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 1 +
 drivers/media/platform/qcom/venus/core.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 01c1828830c7..35a8956fe969 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -214,6 +214,7 @@ static void venus_assign_register_offsets(struct venus_core *core)
 	core->cpu_cs_base = core->base + CPU_CS_BASE;
 	core->cpu_ic_base = core->base + CPU_IC_BASE;
 	core->wrapper_base = core->base + WRAPPER_BASE;
+	core->wrapper_tz_base = 0;
 }
 
 static int venus_probe(struct platform_device *pdev)
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 0c90f48323f2..54e6cd89b30a 100644
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
2.29.2

