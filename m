Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0BA56BB40
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jul 2022 15:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237997AbiGHNy4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jul 2022 09:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238357AbiGHNyz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jul 2022 09:54:55 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C1052A43D
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jul 2022 06:54:54 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id m18so18009988lfg.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jul 2022 06:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IjR+2F8VDVzWZtZbL2H5UO7CpeJEqxrSNDvsv43xJOY=;
        b=tllR9CHKoo+1RaUDvcQwzF7LiqVYGALP3A/a/+Asc6x59lxzNkw5PlKJjIfbvWPAWW
         9CXmwKDcCfaPJiRqylRUxSywesFV5OQNxe7npy51hKnx45vQavBCLzyiRTpaCkErrz0P
         HfoAj7Ldxkz7UlDrza0GGMKyJbBaM3d4jB6V08jecF3hw5nDP85nxNzxop3CkYcG21O5
         eyLoP2ozjmLaTavfx4PT7YoowAPO3sOsbQQQzRxqqQgeROH0n07V6Mwa0Zwl4/gueiGO
         uMST0a8iIkM5g9jq+m2aeX0cjsYoTZHk28gKiDQ4D4Bp2hEvNOOFLb/08I/9OcieqO6O
         X2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IjR+2F8VDVzWZtZbL2H5UO7CpeJEqxrSNDvsv43xJOY=;
        b=CjkE/3/p87BfbRdnUKjmYgG+IVlFz63UTtTuLk5joGdaJ36po0WlNP5p+akM2HMki5
         3mFXAUqy95hJ0RwqWv0nYgU97jiTMD1CEYrg3WPot3P/s0WtduSTPKB7j1+rcCMGkftZ
         2JrLpwJM41vyosyUi3otmLzE0xCAPyXA8xYYrrbljOoBv3aKDeGhJW3+FE0ak5Nhm13u
         02yZOQZc6qsxP3oHmhA7ndmqPj9SZR2BOp5DD0XCdtK5CAA7jDOwCcLh8cBZVQGCuyMN
         oNKnOiC0XVOEZhH2oPXb7JdrvRJNnmFpvd5TsZHQflCHdRaqbqpHchP0setHLJrhMojV
         Ytdw==
X-Gm-Message-State: AJIora98I0+wgol+Rnyve8nYilkakGMBNJFPrtOMgUiRjmHCTEgGxJoR
        MEMIKrxnH0t1P2pi6U/NWUlNUdO2L4Vayg==
X-Google-Smtp-Source: AGRyM1ueiCl2TJwWKsZU0JOxrMmww4iJVFJmo5yk2nZiJigX7CiUL+rANkwFfa0/dKx/t7m5rW6kcw==
X-Received: by 2002:a05:6512:228d:b0:489:2309:fd63 with SMTP id f13-20020a056512228d00b004892309fd63mr2682898lfu.232.1657288492993;
        Fri, 08 Jul 2022 06:54:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y9-20020ac24e69000000b0047f647414efsm7428352lfs.190.2022.07.08.06.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 06:54:52 -0700 (PDT)
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
Subject: [PATCH v3 1/3] clk: asm9260: use new helper for fixed rate clock creation
Date:   Fri,  8 Jul 2022 16:54:48 +0300
Message-Id: <20220708135450.2845810-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220708135450.2845810-1-dmitry.baryshkov@linaro.org>
References: <20220708135450.2845810-1-dmitry.baryshkov@linaro.org>
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

