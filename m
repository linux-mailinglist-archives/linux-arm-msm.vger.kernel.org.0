Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 061EB72CE40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 20:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238230AbjFLSZ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 14:25:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237925AbjFLSZC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 14:25:02 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46EC210C2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 11:25:00 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f61735676fso5634066e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 11:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686594298; x=1689186298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eHA+43B3syu0x2pUChrYAxljP6/us7hNfim2x8e+Qms=;
        b=NfKrzpunMVdpWMjPG9voSJeMucexL04h+BduTpiCgT1+Zullm2/uL1Mb4m+46lZhtn
         6XMX4qXMA8KA5dgrnMfi0zOMX7WcnKbF8/fuu2g8VcHcCo4H+I2trCAjaDD0JA9/bMJa
         35u5/qMcIMyb5xYuEJAWJpT0lG5J605IusXXlBcaTFYVWIrrxdA2nugMgShaXj4hCW51
         27ZDUtuP3mfgpWTmpz0YsGU+iSNFqhJxX28pjWzWXAD1wPHrwjFrmygwMTCSqkzz4YrS
         GWT3Ink//XdE/yVMdjG7EGPQ6sjFNVTqF1yEU2+pywwQuwD64EHmqvf/6E+Gv0ZTYAMe
         kNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686594298; x=1689186298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHA+43B3syu0x2pUChrYAxljP6/us7hNfim2x8e+Qms=;
        b=OdrfPgDpF3UheJUsjyt60CtEemEGUmQxwVsLZwFpWWOSAj2ltm764v3s3PPzXJemZY
         xe6gsH4xpXwgAzGk+i8EbLZubpKRG2l5gU8OUCAetFC5iqfydqFkkXyzrKDg5u8EwxrJ
         hISMjImKfkDHm0idxwZv36s+fs+/dUlT4GYw4TM1AQw24+mzAVHwOscDRkiQRuGXMWJW
         4DRtdiM+Q2laquFzDFintcdUPUX0tJVo3nlDYbe3Ep/TFipkrA8kgiGW43kTKp5Ez1k4
         x6koCHN4k9Y1EPxLW2is25PNBg0vGlj3LDlvLFjQf6vQtsFpfS3PB5nKewFyJD0R5X9Q
         t6Hw==
X-Gm-Message-State: AC+VfDwQvCWFhUxRvhaCzplhLdSCit+KVIYhvfA2rqaahjcdEOkirEw6
        I12CeHRulWq7BalXiWLO8mPWBw==
X-Google-Smtp-Source: ACHHUZ7fw+vOLrzZksInuc1Lvn05bR2q5rVrbRuUQWMPbtMGOaDnF3P4qacIZVu2bvgnUx1b4IZtFw==
X-Received: by 2002:a19:ab01:0:b0:4f3:aa09:5566 with SMTP id u1-20020a19ab01000000b004f3aa095566mr4439806lfe.65.1686594298549;
        Mon, 12 Jun 2023 11:24:58 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id v24-20020ac25938000000b004f64073a252sm1502035lfi.96.2023.06.12.11.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 11:24:58 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 12 Jun 2023 20:24:32 +0200
Subject: [PATCH v3 15/23] interconnect: qcom: msm8939: Hook up RPM bus clk
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v3-15-5fb7d39b874f@linaro.org>
References: <20230526-topic-smd_icc-v3-0-5fb7d39b874f@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v3-0-5fb7d39b874f@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686594276; l=1734;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=1B8WtVx3wEojfY5dydOVxe8YjeFJXTMa40iYBVHPUpQ=;
 b=9IILqMRi23Bstk6wlqfTWuZtWda1m9Lj1xzdDTC/WaKfvRaX+YgXn4P8vKd97L/pcYu8RoNNw
 P0uj+LCNi4UBoMn2PMQh2Sun2+1Eq+YjfqIKcvvt1Rz4zDY8kj3k8wU
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Assign the necessary definitions to migrate to the new bus clock
handling mechanism.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/msm8939.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/interconnect/qcom/msm8939.c b/drivers/interconnect/qcom/msm8939.c
index 639566dce45a..94b11b590a8e 100644
--- a/drivers/interconnect/qcom/msm8939.c
+++ b/drivers/interconnect/qcom/msm8939.c
@@ -1284,6 +1284,7 @@ static const struct qcom_icc_desc msm8939_snoc = {
 	.type = QCOM_ICC_NOC,
 	.nodes = msm8939_snoc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8939_snoc_nodes),
+	.bus_clk_desc = &bus_1_clk,
 	.regmap_cfg = &msm8939_snoc_regmap_config,
 	.qos_offset = 0x7000,
 };
@@ -1304,6 +1305,7 @@ static const struct qcom_icc_desc msm8939_snoc_mm = {
 	.type = QCOM_ICC_NOC,
 	.nodes = msm8939_snoc_mm_nodes,
 	.num_nodes = ARRAY_SIZE(msm8939_snoc_mm_nodes),
+	.bus_clk_desc = &bus_2_clk,
 	.regmap_cfg = &msm8939_snoc_regmap_config,
 	.qos_offset = 0x7000,
 };
@@ -1332,6 +1334,7 @@ static const struct qcom_icc_desc msm8939_bimc = {
 	.type = QCOM_ICC_BIMC,
 	.nodes = msm8939_bimc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8939_bimc_nodes),
+	.bus_clk_desc = &bimc_clk,
 	.regmap_cfg = &msm8939_bimc_regmap_config,
 	.qos_offset = 0x8000,
 };
@@ -1403,6 +1406,7 @@ static const struct qcom_icc_desc msm8939_pcnoc = {
 	.type = QCOM_ICC_NOC,
 	.nodes = msm8939_pcnoc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8939_pcnoc_nodes),
+	.bus_clk_desc = &bus_0_clk,
 	.regmap_cfg = &msm8939_pcnoc_regmap_config,
 	.qos_offset = 0x7000,
 };

-- 
2.41.0

