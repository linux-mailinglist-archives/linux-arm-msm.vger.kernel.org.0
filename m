Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B84B440C7B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Oct 2021 03:07:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232081AbhJaCKC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Oct 2021 22:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232065AbhJaCKB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Oct 2021 22:10:01 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79E60C061714
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Oct 2021 19:07:30 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id y14-20020a17090a2b4e00b001a5824f4918so6774533pjc.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Oct 2021 19:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lZj1Wo7snHpxaiqNZlxW9ksc5HcIv7ZuWTTzFxW+1bI=;
        b=pbmfnxpfPtOKoMzAn7qKdkruLD1kcNxMzZ6P/FAlIn/L7esgIAj4FNvbM4+bv/N4Kd
         wF3UM/Dz25rwpRqUMllSCRnXZW10Dqi7npw6bR+0PLGxD36lr0qsVeg4gRBF21YdZt1G
         SRj2PZudbCab6s8hT3kNS+wZtTdiVNCpHcTVQp8Onxug+CpM1r5qgArHkPjGzuCoywJl
         91Frkv0k87sbuZhJgqSLJUBdW96CW5oXW6XtDGQozZl9kQ0tbI9ZyhyQZvMQWAtUtYX0
         is2OvyS4iaMQbFFrLHmpXKZ2xVMfJi2XiZD9hcPRZW8nnXHk6+ry4PLJXtJAaswxoM5x
         Ibrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lZj1Wo7snHpxaiqNZlxW9ksc5HcIv7ZuWTTzFxW+1bI=;
        b=WXQ86Fp1PbGanAi10BrpmVlxHoX5ton8GsFYcqgp+p7eBrGg80CYUCprs3jCYdhbCF
         cYrgrm5mQ7sHP8ERKSKhFiHfNAdevT7nlPeX+rxSd9yDo6F4XlvziEUJ30VCDDVfEZ5l
         yXSHvx8NEwffpCkbE1rpydB77mbLM12b5e4EYCoS0PKPPzg0ASjYwFGNrodr4DKACeSm
         J8mOD0nWF7MH5FwKbjYOjI1iEtZbEhWyh4gN8yOUzWE8cm/+gh4ra6JuVHnEBYAPj+NF
         mxSY9L/tVdOolLVsCj1bFzcrKShp0M6VdkKzKZ91pUHDc3jPJcpH5G29KTT1+Uwxa5IF
         nlIw==
X-Gm-Message-State: AOAM531J5GqH2b/c9TPlKBHGpwYoClDdNsKTfUeDM5hhDMtwB0ktx9Gg
        zB+5uuHTSxrIow6eBN7b24B3xw==
X-Google-Smtp-Source: ABdhPJzyoT75DeamHu27XxiLxgVbbshM7+vSrdQz4CyU+abVHVmncVJItOQIezOQIqKAIyqHJoIdpw==
X-Received: by 2002:a17:902:8a90:b0:13f:ee6e:cc59 with SMTP id p16-20020a1709028a9000b0013fee6ecc59mr17826390plo.75.1635646050040;
        Sat, 30 Oct 2021 19:07:30 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id p9sm10748986pfn.7.2021.10.30.19.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 19:07:29 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 1/3] clk: qcom: smd-rpm: Drop MFD qcom-rpm reference
Date:   Sun, 31 Oct 2021 10:07:13 +0800
Message-Id: <20211031020715.21636-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211031020715.21636-1-shawn.guo@linaro.org>
References: <20211031020715.21636-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MFD qcom-rpm interface is not used by this driver.  Drop the 'struct
qcom_rpm' reference and include of <dt-bindings/mfd/qcom-rpm.h>.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 5776d85a1e5c..a27c0e740ab7 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -17,7 +17,6 @@
 #include <linux/soc/qcom/smd-rpm.h>
 
 #include <dt-bindings/clock/qcom,rpmcc.h>
-#include <dt-bindings/mfd/qcom-rpm.h>
 
 #define QCOM_RPM_KEY_SOFTWARE_ENABLE			0x6e657773
 #define QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY	0x62636370
@@ -152,7 +151,6 @@ struct clk_smd_rpm_req {
 };
 
 struct rpm_cc {
-	struct qcom_rpm *rpm;
 	struct clk_smd_rpm **clks;
 	size_t num_clks;
 };
-- 
2.17.1

