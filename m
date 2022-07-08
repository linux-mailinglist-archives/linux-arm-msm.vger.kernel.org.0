Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE5356BA6A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jul 2022 15:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237981AbiGHNNk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jul 2022 09:13:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237612AbiGHNNj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jul 2022 09:13:39 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79470248F5
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jul 2022 06:13:37 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id n15so25866481ljg.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jul 2022 06:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IjR+2F8VDVzWZtZbL2H5UO7CpeJEqxrSNDvsv43xJOY=;
        b=I0msIR1xHsrK427ROpYty93HRV1Cf5ngV2kxkvQkzAOxgzph0oKhs9P+bDanaafDLZ
         H0XsGEMCv7ljW1RXECph6U9flE4iF1S7+BehA1PsEdQBVth996KZ31klFnJhQtGMBGym
         gZ4pqEmQU99IpsBtLL7Rd0eebCucU/ERWyP3yoT/iZkZ02SVD4J4n0RXu4Z9zMC0IFoL
         M/RHb34qu0cWPhxkgMV92AGLwvbwLovkIE90g1Lk+B3iyyM3uDreLi5LUPCzegERyUH+
         GmGUxUGPvYj5M1vCTsanDd1UCZb5tM3Ir/ttI38F2MjmrAOBRfl6WHGdazXNcYVcAHhX
         hYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IjR+2F8VDVzWZtZbL2H5UO7CpeJEqxrSNDvsv43xJOY=;
        b=aj4Jfs52co3ps9gP3bfdUHvpbEnLtbcNb9oLXXLR2o1mCCDyiGSu5u3OJE+x9fImZ0
         IAEUSsFkjGqqclQ1aiVwuJpWUjCmOk2d/UgH6IfuNg49kYd+5eUBRf5qTLih4YY0H13F
         q7E8qAgfnyoyQYdHCLz9k+a4bCqh9zUgPbCkVJg6Ul5XevAhkV1t0Q39BHRnQxtYyNqi
         u154eZosvhm/X1io80p2mafBe2IYcPcbpQlJOnBUKR7s7UDlGvPe3Te9AjhNVRPdIH6t
         Tzlj6y9aq1XPUTubyRuzBSPOr3x0Wo4eczBkMiFeEz8AMRgjuhVBAMdTY9rJJhIjfU/v
         p/DA==
X-Gm-Message-State: AJIora81MKDToBju9L9Y04vNCQEgeXKpb9vSRhD930Xi62ZxbpCALka3
        bwGk1jW6yiDOLFs2G4dtwINNsw==
X-Google-Smtp-Source: AGRyM1vS4wofuQbXsdOj4XwEHt7DCrtCFNOpkaD2vtOzu4vM+8vBWRpkAEjkfAI0qItm3zkqMesnhQ==
X-Received: by 2002:a2e:a54d:0:b0:25d:4fc6:7b4d with SMTP id e13-20020a2ea54d000000b0025d4fc67b4dmr1859128ljn.11.1657286015648;
        Fri, 08 Jul 2022 06:13:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bu35-20020a05651216a300b0047255d211b9sm7410844lfb.232.2022.07.08.06.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 06:13:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-phy@lists.infradead.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 1/3] clk: asm9260: use new helper for fixed rate clock creation
Date:   Fri,  8 Jul 2022 16:13:31 +0300
Message-Id: <20220708131333.2836900-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220708131333.2836900-1-dmitry.baryshkov@linaro.org>
References: <20220708131333.2836900-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The __clk_hw_register_fixed_rate() is an internal API, which is better
not to be called directly. Add new helper to create fixed rate clocks
using parent clock accuracy.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/clk-asm9260.c    |  6 ++----
 include/linux/clk-provider.h | 14 ++++++++++++++
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-asm9260.c b/drivers/clk/clk-asm9260.c
index bacebd457e6f..0609b661ff5a 100644
--- a/drivers/clk/clk-asm9260.c
+++ b/drivers/clk/clk-asm9260.c
@@ -276,10 +276,8 @@ static void __init asm9260_acc_init(struct device_node *np)
 
 	/* TODO: Convert to DT parent scheme */
 	ref_clk = of_clk_get_parent_name(np, 0);
-	hw = __clk_hw_register_fixed_rate(NULL, NULL, pll_clk,
-			ref_clk, NULL, NULL, 0, rate, 0,
-			CLK_FIXED_RATE_PARENT_ACCURACY);
-
+	hw = clk_hw_register_fixed_rate_parent_accuracy(NULL, pll_clk, ref_clk,
+							0, rate);
 	if (IS_ERR(hw))
 		panic("%pOFn: can't register REFCLK. Check DT!", np);
 
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 72d937c03a3e..659ef5a77246 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -439,6 +439,20 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
 	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, NULL,	      \
 				     (parent_data), NULL, (flags),	      \
 				     (fixed_rate), (fixed_accuracy), 0)
+/**
+ * clk_hw_register_fixed_rate_parent_accuracy - register fixed-rate clock with
+ * the clock framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_name: name of clock's parent
+ * @flags: framework-specific flags
+ * @fixed_rate: non-adjustable clock rate
+ */
+#define clk_hw_register_fixed_rate_parent_accuracy(dev, name, parent_name,    \
+						   flags, fixed_rate)	      \
+	__clk_hw_register_fixed_rate((dev), NULL, (name), (parent_name),      \
+				     NULL, NULL, (flags), (fixed_rate), 0,    \
+				     CLK_FIXED_RATE_PARENT_ACCURACY)
 
 void clk_unregister_fixed_rate(struct clk *clk);
 void clk_hw_unregister_fixed_rate(struct clk_hw *hw);
-- 
2.35.1

