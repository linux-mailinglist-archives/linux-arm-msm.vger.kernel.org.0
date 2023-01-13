Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4965D6696A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 13:13:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231671AbjAMMNr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 07:13:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232671AbjAMMM4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 07:12:56 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43A9C8098E
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 04:07:19 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id g13so32845503lfv.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 04:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3EjEKvcykQA4uyk5ga1WESuVjINo+zSzb0UWVoBWmHk=;
        b=BZK4NU3eyNehga7ckN9Xxqkj1ewsyCp2fpv1yOaylwV2qg/EYlwE/IA4Aloy48XHQI
         sZ05KUCbD3imqgtQ/iTSzYpzgkMcTydvKcNp2ekzzpmjtVG7HhGpe+cxX1es56kCcHGp
         2hiGtlcU2KY1u+EClSTZk3CFtA/F3HUNNrV6Hk/ZnF1yeMhqWz4o5Zvr1DyMYuzuI6zX
         vtbER/pPXwKQIq7rFP0uWq1CSgtAY2gj+6TkoZJvq+E9F3mPmR3LN/0csE3oupvD/txP
         PhZ5/hCYX8kVv+jN0EvRdA1sffk/ib+VyNeryT/y5zaiWgOC4rby0gJ0I0OPZMp2vx7j
         VtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3EjEKvcykQA4uyk5ga1WESuVjINo+zSzb0UWVoBWmHk=;
        b=qMsW0/HfPXxYUtlbDl6LKiuSQy/nk2X+XH3AvgGIVBbe04jkKwu6jjWioNc8mdWxjt
         lOr9MwCZ8XWySU+VmLA3TNPgXTvnDwjgOEz26FxNJu40TMBON6bkNYDFWZOeJlBEaOPi
         Wpv0sejMe5vqNOKA6nkpgX9pLeMBdPEBp0Pm6Mf93d1U7pHz2TMQLGUWjGiA/cjcToqX
         N0R6ThG1Ir7taKk0naKyzk5sj5UFaCHbu+EEI2I4aAlRnNK9Sawy9PgkwCdSTXWG3o1N
         8DeMXa11bwL0R4VWq0y1rwNGN9EZkuRL+IAmuEOV4gC+bbaIADMiUzY9s/Ir/tuXj3oW
         hCVg==
X-Gm-Message-State: AFqh2ko7G5VSckQs9ux617eE+LlO6qfzDNRijn52MLAdx8TFXnx9x+Xn
        bvAaQbC4p3mIUWTSbFY3gjXj63Do/zW9nVAx/34F2Q==
X-Google-Smtp-Source: AMrXdXvNNEWDF8QUVrckhJNBTbwfedEJq5e5lyrtj3Yb0fZDwYg+x3gwbklxezUkUHg67uW5e8tj5w==
X-Received: by 2002:a05:6512:3191:b0:4d0:90f0:f81f with SMTP id i17-20020a056512319100b004d090f0f81fmr723771lfe.31.1673611638820;
        Fri, 13 Jan 2023 04:07:18 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.170.82.205])
        by smtp.gmail.com with ESMTPSA id i7-20020ac25227000000b004ac6a444b26sm3806290lfl.141.2023.01.13.04.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 04:07:18 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 11/14] clk: qcom: cpu-8996: fix ACD initialization
Date:   Fri, 13 Jan 2023 14:05:41 +0200
Message-Id: <20230113120544.59320-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
References: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
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

The vendor kernel applies different order while programming SSSCTL and
L2ACDCR registers on power and performance clusters. However it was
demonstrated that doing this upstream results in the board reset. Make
both clusters use the same sequence, which fixes the reset.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index 07d59bca741e..c471c6836c63 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -475,9 +475,9 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
 	return ret;
 }
 
-#define CPU_AFINITY_MASK 0xFFF
-#define PWRCL_CPU_REG_MASK 0x3
-#define PERFCL_CPU_REG_MASK 0x103
+#define CPU_CLUSTER_AFFINITY_MASK 0xf00
+#define PWRCL_AFFINITY_MASK 0x000
+#define PERFCL_AFFINITY_MASK 0x100
 
 #define L2ACDCR_REG 0x580ULL
 #define L2ACDTD_REG 0x581ULL
@@ -498,21 +498,17 @@ static void qcom_cpu_clk_msm8996_acd_init(struct regmap *regmap)
 	if (val == 0x00006a11)
 		goto out;
 
-	hwid = read_cpuid_mpidr() & CPU_AFINITY_MASK;
-
 	kryo_l2_set_indirect_reg(L2ACDTD_REG, 0x00006a11);
 	kryo_l2_set_indirect_reg(L2ACDDVMRC_REG, 0x000e0f0f);
 	kryo_l2_set_indirect_reg(L2ACDSSCR_REG, 0x00000601);
 
-	if (PWRCL_CPU_REG_MASK == (hwid | PWRCL_CPU_REG_MASK)) {
-		regmap_write(regmap, PWRCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
-		kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
-	}
+	kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
 
-	if (PERFCL_CPU_REG_MASK == (hwid | PERFCL_CPU_REG_MASK)) {
-		kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
+	hwid = read_cpuid_mpidr();
+	if ((hwid & CPU_CLUSTER_AFFINITY_MASK) == PWRCL_AFFINITY_MASK)
+		regmap_write(regmap, PWRCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
+	else
 		regmap_write(regmap, PERFCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
-	}
 
 out:
 	spin_unlock_irqrestore(&qcom_clk_acd_lock, flags);
-- 
2.39.0

