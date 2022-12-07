Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C53364501A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 01:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbiLGAPJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 19:15:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiLGAPI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 19:15:08 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 618674B990
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 16:15:07 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id l8so19067988ljh.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 16:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOcXBHzPaQhy0fwsmnckvcizCAWhntI4mIBoXMhytOw=;
        b=WpDsur3btGOj4DHDNyCmFOhUeUMKvdUHEm6q6KNw31cCREY2lXkepPe8t7ofDBi/Vs
         shACs6lAM0aTg8kj/6mS7GoZay30LQPhfGfx+VfoC/YoiSiIZi0q5nbAh1OCiMvNGX0y
         H1VqZyhv/WqQF4Zj1Hq/b6hiaGSYHHnKG13lQZMBkQxLIhRk8LCA62QIXD0XI/RjPOkJ
         DYJAbkm0V4VkS+nITMZEBT2yX5sNcbz9LvWeWKe4WgGFHmFZFzHQmoBv76X+406vw1rL
         WtxNMRpNn9T/q3g+QufBAg8kGwQhGFC/hslcDHSlTS1rlPWwanMbC/7tl/yLcCDXqb1r
         Ulnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOcXBHzPaQhy0fwsmnckvcizCAWhntI4mIBoXMhytOw=;
        b=ehgnu3/CS89XZwK1ZTxj3mHpfhTZJRq9wfI+Q0Rp39s9UJ2yUh2XjoYGSIFvk6KSef
         iQwNWfCagzUZ46i9fhQx1dzV+loOxCZ2DktdFI7ZHJstgvfL0cMbvlIpAw5iRRd8r50/
         VlhGTYyzcGfHldT++lC6EQt0lMQeqJQkWPvt2wCAJpmwbVucXi2301hLFepJDRLzjhSi
         K2FT3/Wzq8vvo+j7KAjqYF5BRIsHCxkEayh7giVDdoNSL6+1VvP53YojoXCANT875LFp
         /QA/i0K5bIS/mNrJ65JA9uc0ShQWQZY3GalTSjJIm1jGASJxxMcyxIqhN4vkk2IDzhLu
         9Hxw==
X-Gm-Message-State: ANoB5plseBx3ooFM791uystvVjZKm/q/j4itW/+SpOccgkzxVwIXNY6Z
        J2MCEoN6ByxZ2z9aIMV9QhM+UqgS/KGWCZ0CB6/iHsY/
X-Google-Smtp-Source: AA0mqf5JCCvehDiSp88ITyyaEadczHeySAJXPQ7sLnSsu/r6QGsuGVxUjSfh9z8aq2hhYLCguPisAw==
X-Received: by 2002:a2e:9b4b:0:b0:27a:b66:aa7b with SMTP id o11-20020a2e9b4b000000b0027a0b66aa7bmr2011746ljj.246.1670372105760;
        Tue, 06 Dec 2022 16:15:05 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 16-20020ac25f50000000b004b53eb60e3csm2308555lfz.256.2022.12.06.16.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 16:15:05 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 02/18] clk: qcom: smd-rpm: enable pin-controlled ln_bb_clk clocks on qcs404
Date:   Wed,  7 Dec 2022 02:14:47 +0200
Message-Id: <20221207001503.93790-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
References: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The commit eaeee28db289 ("clk: qcom: smd: Add support for QCS404 rpm
clocks") defined the pin-controlled ln_bb_clk clocks, but didn't add
them to the qcs404_clks array. Add them to make these clocks usable to
platform devices.

Fixes: eaeee28db289 ("clk: qcom: smd: Add support for QCS404 rpm clocks")
Reviewed-by: Alex Elder <elder@linaro.org?
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c         | 2 ++
 include/dt-bindings/clock/qcom,rpmcc.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 4947d5eab591..ccc54913eca5 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -843,6 +843,8 @@ static struct clk_smd_rpm *qcs404_clks[] = {
 	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
 	[RPM_SMD_LN_BB_CLK] = &msm8992_ln_bb_clk,
 	[RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
+	[RPM_SMD_LN_BB_CLK_PIN] = &qcs404_ln_bb_clk_pin,
+	[RPM_SMD_LN_BB_A_CLK_PIN] = &qcs404_ln_bb_clk_a_pin,
 };
 
 static const struct rpm_smd_clk_desc rpm_clk_qcs404 = {
diff --git a/include/dt-bindings/clock/qcom,rpmcc.h b/include/dt-bindings/clock/qcom,rpmcc.h
index c0ad624e930e..46309c9953b2 100644
--- a/include/dt-bindings/clock/qcom,rpmcc.h
+++ b/include/dt-bindings/clock/qcom,rpmcc.h
@@ -168,5 +168,7 @@
 #define RPM_SMD_MSS_CFG_AHB_CLK		122
 #define RPM_SMD_MSS_CFG_AHB_A_CLK		123
 #define RPM_SMD_BIMC_FREQ_LOG			124
+#define RPM_SMD_LN_BB_CLK_PIN			125
+#define RPM_SMD_LN_BB_A_CLK_PIN			126
 
 #endif
-- 
2.35.1

