Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A10035295C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 12:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234763AbhDBKFc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 06:05:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234724AbhDBKFb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 06:05:31 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81523C0613E6
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 03:05:29 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id b9so4302663wrt.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 03:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GbTus800fSTOksYEwkbJrdqyW6ivt71bJB27ZzzIRJ8=;
        b=q/wyJhbOb0+UCSHO7LeubkmR7b1kraZBsvn/DYJpG5GTwzZaTmxAfPm2OCe3UAx5R7
         GjHqv8E7xqRDkr2AkhHkxQe4BB3HmMZ7VE1slCmT+7R8GjN3hwbbLhy5Vz+/u/rlM6D5
         WoV+wjnatQbBl7x4d+wmxp21fe08qwkz2oKRC0b4JYmgmxyY8yZ2koF8ovrUQPnzSulL
         /NqSMpGgN5zoLdE9wTRFyKeygl6kYACmI/IW7D0F0ld+FKm+Jw/NDTWXRi+QlckzBiee
         1CTPJ+89qwilar2pm8yk/iUnvZ4B1LSlprcPdqkMqAAhA59F1NKBUALDJMJ9FNo06fmI
         yYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GbTus800fSTOksYEwkbJrdqyW6ivt71bJB27ZzzIRJ8=;
        b=LYPSXmukBVVmbrdCkCac5iVs1261ha18rcSFl+RAsMFt4zNvKvf4HnEX4CQWj2Yr9L
         MElPCCdDy56S7UUB3nLZ6AXa7A8FuKEeVCuM7w32Jmd9W7/hN0/AJgLeI53DxZ+s11En
         SO8DPfyH7gzwE7+TuJ8U2/bka2aC0bYgJ46pcMBkGLfk7n4lxHCNExJnjZxSmC1EiGBc
         Cju43g8rTlOVLWUmfcA052GgvJ0WZqF5n6c/IRVktKgJ+krJ2WEi1APUVkLwd1AjbR5V
         ss21/zBtbWINmAl0K1y5/T1sr9kX5ldqk/+f1MJxHvuwuA9hOw2EdP6Qf7qI17By8ta1
         a97g==
X-Gm-Message-State: AOAM532qFO8kF0/LOElULMKLlUOyx0yDcts4SBRrcUg9dG1ZVtF/6eDr
        u4C0aVXs6Sr43oSCw8cC1TOidw==
X-Google-Smtp-Source: ABdhPJwGTk5TOETVZuQw4RYczPs0HMZACnLCWCEpKM44NuBD0F4gb+riaZxIgKUI0juzLNj9v90yCA==
X-Received: by 2002:a05:6000:1acd:: with SMTP id i13mr14377486wry.48.1617357928303;
        Fri, 02 Apr 2021 03:05:28 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v18sm15466618wrf.41.2021.04.02.03.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:05:27 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v3 11/25] media: venus: core: Hook to V6 base registers when appropriate
Date:   Fri,  2 Apr 2021 11:06:34 +0100
Message-Id: <20210402100648.1815854-12-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
References: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit points the IO base registers 6xx offsets when probing for 6xx
hardware.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index b6f9ef6b6dcd..bef582470fa2 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -210,13 +210,23 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type)
 
 static void venus_assign_register_offsets(struct venus_core *core)
 {
-	core->vbif_base = core->base + VBIF_BASE;
-	core->cpu_base = core->base + CPU_BASE;
-	core->cpu_cs_base = core->base + CPU_CS_BASE;
-	core->cpu_ic_base = core->base + CPU_IC_BASE;
-	core->wrapper_base = core->base + WRAPPER_BASE;
-	core->wrapper_tz_base = 0;
-	core->aon_base = 0;
+	if (IS_V6(core)) {
+		core->vbif_base = core->base + VBIF_BASE;
+		core->cpu_base = core->base + CPU_BASE_V6;
+		core->cpu_cs_base = core->base + CPU_CS_BASE_V6;
+		core->cpu_ic_base = core->base + CPU_IC_BASE_V6;
+		core->wrapper_base = core->base + WRAPPER_BASE_V6;
+		core->wrapper_tz_base = core->base + WRAPPER_TZ_BASE_V6;
+		core->aon_base = core->base + AON_BASE_V6;
+	} else {
+		core->vbif_base = core->base + VBIF_BASE;
+		core->cpu_base = core->base + CPU_BASE;
+		core->cpu_cs_base = core->base + CPU_CS_BASE;
+		core->cpu_ic_base = core->base + CPU_IC_BASE;
+		core->wrapper_base = core->base + WRAPPER_BASE;
+		core->wrapper_tz_base = 0;
+		core->aon_base = 0;
+	}
 }
 
 static int venus_probe(struct platform_device *pdev)
-- 
2.30.1

