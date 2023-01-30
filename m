Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19606681513
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jan 2023 16:33:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236884AbjA3PdM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Jan 2023 10:33:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237210AbjA3PdI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Jan 2023 10:33:08 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4826F3CE36
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 07:33:07 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id mf7so14109632ejc.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 07:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZ+Opwm6jcHi17rVDvjxU6dDxEIV55VJ/74LTubqrB0=;
        b=IIsKysQyfCEF6p8MD7eRzgo1qyjPHfvIoZIZD20jvXGEqHunHJgD+iefDncyUoDLDL
         Xilf0NPG2xYwQB/LMJpet6CBbmQISUxlLxsn+3BfC0t6WSQfEkh/iZkI/MU2tE2DsyDS
         g/fuiM6QIAJ8nlCWWSvWAuwaNj/vByor50sU6f82ewwupm7rBmLUBroQ7nARX9NRpYA8
         gos/iWhl2ZzEv8ET7VXpXkF7FWgGdMe7trjQl7Wb6XwbeaqPeHjfiNlIUfvz1+2VoikS
         maGu+P0ccozlCBOGjbnHKwhgkp5DQ+VBx6Hska4gzUywJczogaAU3HykW79KCrqBFUPg
         7pEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZ+Opwm6jcHi17rVDvjxU6dDxEIV55VJ/74LTubqrB0=;
        b=u8Q3j1rOIdQAOFzp40OJpjmpRnFtF1zvmX+gzkn/upmIbTrhCorB7Ys9lOkV3+tf8g
         xldIB/ASlhcvxJKZw0vfNVL2NQTRjTQj1GwbbP3pQi5aCGqXDDKpveYqGRskUjLjKvir
         C600moROHqlIGA64d7mWyO2r8j9Y5ccEdLne7jZvbuIen6uILEI9MinXJBlNvw69sT0P
         pPhuRlj4/7qdTISDeHMXpk7w2GdK5rrWGBnkM6SOpc+E8r8AKKhHYzU/tU01S5pS6grB
         B4Wg/9zapVaxqeaDUz20cePxhEMvvRmwmqSnO8C7IdBzQM3EDbQVW3l2TcTb+Wk95j4a
         /s3g==
X-Gm-Message-State: AFqh2kpHyyMJsG8zc9Y6dZaPnMVvZeMVjb8qGStLaQ3tcYbID9rgW8nm
        wA4izDE4p/Pxpi3RrlHH0d6dz7U1vQWfHEN2
X-Google-Smtp-Source: AMrXdXv27LWMAuhyic7dKtXBukIAkn9o3CCikAJH885uC/dOHah7SGrpccYqvG3LkXJne3LMQ0LrFA==
X-Received: by 2002:a17:906:a058:b0:84d:4e9b:ace5 with SMTP id bg24-20020a170906a05800b0084d4e9bace5mr48508058ejb.67.1675092785563;
        Mon, 30 Jan 2023 07:33:05 -0800 (PST)
Received: from localhost.localdomain (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id k7-20020a170906054700b00878769f1e6bsm6805773eja.55.2023.01.30.07.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 07:33:05 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/8] clk: qcom: branch: Add helper functions for setting retain bits
Date:   Mon, 30 Jan 2023 16:32:45 +0100
Message-Id: <20230130153252.2310882-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130153252.2310882-1-konrad.dybcio@linaro.org>
References: <20230130153252.2310882-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Most Qualcomm branch clocks come with a pretty usual set of bits that
can enable memory retention by means of not turning off parts of the
memory logic. Add them to the common header file and introduce helper
functions for setting them instead of using magic writes.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v2 -> v3:

- New patch

 drivers/clk/qcom/clk-branch.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
index 17a58119165e..d8fc7b93ef6d 100644
--- a/drivers/clk/qcom/clk-branch.h
+++ b/drivers/clk/qcom/clk-branch.h
@@ -37,6 +37,29 @@ struct clk_branch {
 	struct clk_regmap clkr;
 };
 
+/* Branch clock common bits for HLOS-owned clocks */
+#define CBCR_FORCE_MEM_CORE_ON		BIT(14)
+#define CBCR_FORCE_MEM_PERIPH_ON	BIT(13)
+#define CBCR_FORCE_MEM_PERIPH_OFF	BIT(12)
+
+static inline void qcom_branch_set_force_mem_core(struct regmap *regmap, u32 reg, bool on)
+{
+	regmap_update_bits(regmap, reg, CBCR_FORCE_MEM_CORE_ON,
+			   on ? CBCR_FORCE_MEM_CORE_ON : 0);
+}
+
+static inline void qcom_branch_set_force_periph_on(struct regmap *regmap, u32 reg, bool on)
+{
+	regmap_update_bits(regmap, reg, CBCR_FORCE_MEM_PERIPH_ON,
+			   on ? CBCR_FORCE_MEM_PERIPH_ON : 0);
+}
+
+static inline void qcom_branch_set_force_periph_off(struct regmap *regmap, u32 reg, bool on)
+{
+	regmap_update_bits(regmap, reg, CBCR_FORCE_MEM_PERIPH_OFF,
+			   on ? CBCR_FORCE_MEM_PERIPH_OFF : 0);
+}
+
 extern const struct clk_ops clk_branch_ops;
 extern const struct clk_ops clk_branch2_ops;
 extern const struct clk_ops clk_branch_simple_ops;
-- 
2.39.1

