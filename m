Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25AE23394D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 18:30:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231906AbhCLR3z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 12:29:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232554AbhCLR3Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 12:29:24 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BAEFC061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 09:29:24 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id v11so2204475wro.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 09:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+sHQO6SUFe3dMQJllaoiys6MK+T2Abm1Bipqo6ivlBQ=;
        b=Zz89aFmyWy2T2QK8LJsjyyKZWLjSYWQP8Ct+B4q+GEpF85vJwQ+ydcE2+f4mtnUOwm
         MXV6uqA45Yu1lNk0RZXOngho0cW2m+GCFH8tFqu2mXerPEF/PF9tR34bx87sVpD0WuNZ
         xNjWNnrBHLoRG/dh7dnjZHiketW4Yz8214co0KHFPxThWvdEND9N4MLkSeE3k1FIO3FQ
         RQeJPjgujneqvCmUYK1WeBOPN/23KfoU0wzcb0/f3kksfHnq7ShkPBXL98ZOJYG6rmXk
         lEKEYwJ4m+Zbnwno++bKq8H0tjM8GVsT6vv64PTXGSKp7rdAVv0UFD3eQ5sFXJK20i8J
         2/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+sHQO6SUFe3dMQJllaoiys6MK+T2Abm1Bipqo6ivlBQ=;
        b=ezYEp8VwYadkkeiYTrRDH+jZkfHacFl+6pJ6yo5HuV8YwuMOf4SS9qBGFZnF0K7nu7
         BaAXQ1Ox1FiJavJFQsrW8fOA1sSHtl1n7U2UbEPCCCcPW0NHpsU4llddo5LV1GAkLdr3
         gnODIbw08IQuwZECZxRMznj0JIhj1SJMC9BX7JcLAXJNUwswPbZuUmA2dWd5104lFaTu
         ACitGSzqI/xLnqAkuxJGAULIHHLgkSEQj7FPsSgjjY49ppW+yEkHHRzmgspcGPmUKcvw
         J4rsaJZNgfFaaFVJYEHExnWQTUHY/nssEolaT53nBG2OdkJIJ0xerk1ABDhZuEQY5KjA
         wIug==
X-Gm-Message-State: AOAM531xzXoXKUbNo0hflVCPgce28yFuLX3U/j60Fk9lWvST5vuCEBN+
        DqrjJLBUXC7H7bCL2WsUKTxzQg==
X-Google-Smtp-Source: ABdhPJy6kNu+PheIrInHuAuvx7htqq9056jMS2d+MwyBEWpEjOLXx6Vc8IYOYb1UJrKfU30lN968Gg==
X-Received: by 2002:a5d:4bcd:: with SMTP id l13mr15347909wrt.56.1615570163009;
        Fri, 12 Mar 2021 09:29:23 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 18sm2876375wmj.21.2021.03.12.09.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:29:22 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v2 11/25] media: venus: core: Hook to V6 base registers when appropriate
Date:   Fri, 12 Mar 2021 17:30:25 +0000
Message-Id: <20210312173039.1387617-12-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
References: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit points the IO base registers 6xx offsets when probing for 6xx
hardware.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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

