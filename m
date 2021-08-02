Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 577253DDC84
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Aug 2021 17:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234148AbhHBPfT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 11:35:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233939AbhHBPfT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 11:35:19 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7C74C06175F
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Aug 2021 08:35:09 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id o7-20020a05600c5107b0290257f956e02dso7653272wms.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Aug 2021 08:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CqRphvdIf2WgJ/qGVLo1HnyggKC4dKCtnyTo5bfmkDg=;
        b=S2wd+Sg6KnZacgFEJ99whDtJYm28ysMWAFRPDZnWCPrvAl808RIJveY7Ml+fCI4BqM
         RZ/OiA+tFq/6ZXDJxq3VqKbIekBZ+zHqs75mlRvRXgF+P1or058BxyEqCuSQksOh1LvY
         mw45tSpx9K+bAo5qQhVLK4U8d2R0VAxKjA3sLKJo9Apf78bCi+Kyph57iiorSMMzkogO
         TRQhRJqhpZh/X28iIyQC0xXzw/EJX1rei777rKEOimcYc04biqLFOYezxTMH0gLPAS+S
         OHqGQjmBmDqT4li9/5iflcwK2JKiuZUXboFvPvyS2G9lNb5eHkZyiIL22tBlsEmt7Vn1
         W7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CqRphvdIf2WgJ/qGVLo1HnyggKC4dKCtnyTo5bfmkDg=;
        b=mBNALU7fguI1yyS7p/sDZDB+2SXAaLdA/QP3Kh0BscEcFWJ9iIQAaalA54W4aUcE6M
         gsClw/2nyw7ZZY03hsixtkG+4Cz5MdRR/wCW8mxu8mNXSDx09G0WvqM4bt2sZj3dItjL
         V2Z1LbiLLGMoBZcpPuqswnTdW4wOf8W9K4pB35HVg8MeyWc2ZeYhH8QevcWCIqd8JNxR
         3b7dAvmaeg5u3bmnxzv4r+NFGFP2/ZW3cW25VYXivj5IVohJglAEoDPLLdCpTsEpjHQx
         1B3nA0P2U+SFSnN646fn6tYL8vqW8Fm3JSEIt1+PsY0nDq+JU9nfsJfq5CxEVjGlHuSm
         /CFA==
X-Gm-Message-State: AOAM532JAUdcAvycUM2i3UlE5/WRJv4U8scPQxhMRNT2S4Gjb73hUHKJ
        CIDi/O+BAgSPCvmQM4OMfeeR5w==
X-Google-Smtp-Source: ABdhPJx5UCETfS+POdnWM9sbDJAE0uL/EJRjQqRJqZXZMwaTsZaYu3148gfTZ4dIxyhaIyEFijdBpA==
X-Received: by 2002:a05:600c:1ca4:: with SMTP id k36mr2801409wms.107.1627918508326;
        Mon, 02 Aug 2021 08:35:08 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d15sm4685413wri.96.2021.08.02.08.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 08:35:07 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH] clk: qcom: clk-smd-rpm: Fix invalid RPM_SMD_PCNOC_A_CLK entry
Date:   Mon,  2 Aug 2021 16:36:57 +0100
Message-Id: <20210802153657.879499-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8936 and MSM8939 both share the same RPMCC clock tree, I've been testing
on MSM8939 and I've found that RPM_SMD_PCNOC_A_CLK is currently invalid.

RPM_SMD_PCNOC_A_CLK should point to msm8916_pcnoc_a_clk not to
msm8916_pcnoc_clk.

Fixes: a0384ecfe2aa8 ("clk: qcom: smd-rpm: De-duplicate identical entries")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 800b2fef1887f..b2c142f3a649e 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -467,7 +467,7 @@ DEFINE_CLK_SMD_RPM(msm8936, sysmmnoc_clk, sysmmnoc_a_clk, QCOM_SMD_RPM_BUS_CLK,
 
 static struct clk_smd_rpm *msm8936_clks[] = {
 	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
-	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
 	[RPM_SMD_SNOC_CLK]		= &msm8916_snoc_clk,
 	[RPM_SMD_SNOC_A_CLK]		= &msm8916_snoc_a_clk,
 	[RPM_SMD_BIMC_CLK]		= &msm8916_bimc_clk,
-- 
2.30.1

