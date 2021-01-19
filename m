Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A9FC2FBA35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jan 2021 15:56:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391021AbhASOqM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jan 2021 09:46:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731968AbhASLls (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jan 2021 06:41:48 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57BB9C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jan 2021 03:39:32 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id c128so1675630wme.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jan 2021 03:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qA6i77Zlz4mMSdNqaeglUYnAY+zKEB2RYdwGdqj1Hu8=;
        b=kTkmB779suE0zVUtNy89lKEksOACmWYww8w/nXhzz5gL3GkmhNcmT0K2196fgCSK15
         jIGk/fIp1Y4LM/kcwH5ygTdj3UA7fRmjryBNAjwRkCCx6pwr4BfmvPx//SJvyzlrydnR
         DIoiQYkeXn+j7vdpact8ln2/+BXSIEu1kQq4ZtTEsyOUB3eHDAlLcpmNzTD52+xux9PP
         PSiuFiOQh8LNgG56RFho91KyamTbtwMnVs4tN2OYCC1KfjWiEK8l8PLNciyaURbtmc8z
         Hmi+CQPuQgSloUqQtOoQUta1cFNe5I5PtlnlByVlvISQwKE7irqY1QxJLXg4Pf7lxzXr
         6uqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qA6i77Zlz4mMSdNqaeglUYnAY+zKEB2RYdwGdqj1Hu8=;
        b=je2O6RBLU/8FxHDQ1tChNKwh0VBaNGlKkV5k208uzI8aDOkUg/TS6Tn3LEREdMYrOr
         uR5fSHCWFdtoc6To2xRris/ji9zHl8vUO5FVp9Rk8LIanTaR/TXiDyfXSNVQxX10L3WI
         tpbkI4eYAbunifvIysESMdOrbkolOwz2zg1I/WLZAblxGXHK4Y+ElH159OBLYVL3kjGo
         Z9fQk8IonyRxOt9QPIz3ZahKnBIF6guJBLzYV+gMli1Lu1cZ116Z3vYnNQb0W4bjcsYg
         +9q9MP5095C1i+o+9Qd4lLTQ5MVDq40zPmjKqvktE9c2pHxrJudhUcCbP8MtaORBzG67
         xKxw==
X-Gm-Message-State: AOAM530Ilj2Seh1JVMqDfiZ7EU74+errs5NtKRImGvtwmoAVtpvMNslf
        x2uuNFRWHKcY7XqvfMBz4FPKow==
X-Google-Smtp-Source: ABdhPJxQpSmKO6gL4URxiQemGdBj51cfDFusBapseewlYboYRHMLywsPzMsuvuYMJeYcBq780DdVFg==
X-Received: by 2002:a7b:c41a:: with SMTP id k26mr3705989wmi.1.1611056370810;
        Tue, 19 Jan 2021 03:39:30 -0800 (PST)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id g192sm4450237wmg.18.2021.01.19.03.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 03:39:30 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     sboyd@kernel.org
Cc:     mturquette@baylibre.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] clk: qcom: gfm-mux: fix clk mask
Date:   Tue, 19 Jan 2021 11:38:51 +0000
Message-Id: <20210119113851.18946-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For some reason global GFM_MASK ended up with bit 1 instead of bit 0.
Remove the global GFM_MASK and reuse mux_mask field.

Fixes: a2d8f507803e ("clk: qcom: Add support to LPASS AUDIO_CC Glitch Free Mux clocks")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/clk/qcom/lpass-gfm-sm8250.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/lpass-gfm-sm8250.c b/drivers/clk/qcom/lpass-gfm-sm8250.c
index d366c7c2abc7..f5e31e692b9b 100644
--- a/drivers/clk/qcom/lpass-gfm-sm8250.c
+++ b/drivers/clk/qcom/lpass-gfm-sm8250.c
@@ -33,14 +33,13 @@ struct clk_gfm {
 	void __iomem *gfm_mux;
 };
 
-#define GFM_MASK	BIT(1)
 #define to_clk_gfm(_hw) container_of(_hw, struct clk_gfm, hw)
 
 static u8 clk_gfm_get_parent(struct clk_hw *hw)
 {
 	struct clk_gfm *clk = to_clk_gfm(hw);
 
-	return readl(clk->gfm_mux) & GFM_MASK;
+	return readl(clk->gfm_mux) & clk->mux_mask;
 }
 
 static int clk_gfm_set_parent(struct clk_hw *hw, u8 index)
@@ -51,9 +50,10 @@ static int clk_gfm_set_parent(struct clk_hw *hw, u8 index)
 	val = readl(clk->gfm_mux);
 
 	if (index)
-		val |= GFM_MASK;
+		val |= clk->mux_mask;
 	else
-		val &= ~GFM_MASK;
+		val &= ~clk->mux_mask;
+
 
 	writel(val, clk->gfm_mux);
 
-- 
2.21.0

