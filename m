Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFAA97306CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 20:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240530AbjFNSFa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 14:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240820AbjFNSFC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 14:05:02 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11ABE269F
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 11:04:57 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f764e92931so1737228e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 11:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686765895; x=1689357895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSfPNWyiQLrjAB0czC11oTpbsDGKiNFbaeuQIkEjCow=;
        b=HvBWWY+/HlzjknLWa5HvxKUQeCiGy/YOMhx5xc54cn2tLIBMBXD36tuq9BCiV8Tdkq
         obo4I+Lk9hQY7rznljz4ze5SoEiqpS94REtIXwjNwCJIrL42Hc1Cp/1VasBF33b+hJyR
         rgANW/v+C1vV0EhAtm+xGsCV8DSwl2EOuVvu1AKfJIK9/vLhnIdYCDBfSR1QXOUeVsph
         CrndO4z7hWH26yg0p6dO8YMcxHHdi33Wfk4lw9oWKDT3irklp0scN4Hz4xRFagOylUkI
         NaQpbx/O3sV31DEjHwO9mk778zDvPsXas1pwk5hzkCy5q6dyfutk5kez4wB+SuxGG6/u
         SaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686765895; x=1689357895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSfPNWyiQLrjAB0czC11oTpbsDGKiNFbaeuQIkEjCow=;
        b=Iat9LrNNC8Qhtg4E/bYWInoP+2KtbRqbXx6pulNIM4rZWrU1sYTuNGlsx3MWFRukdZ
         ekcKiwIVHstK2qhKX03mYrpGPfwYf2d3TtDJTj8Z8KjcAx+EBKJVRjOzoo/Zt1Eipyq8
         i0c4ogqahzKg9FCqWOgENDZSSvCmOWSP0borqGuiRGfJUeANX1ox38xxeTzAbSZe0OBg
         njANbDnvoZDCVoPoI9P6MEualTRa+eHkFJpOnIp7QXXGZn0yugoi3FHCGhB+ujT+SVpA
         Z4jL9r7bRTB6WlImo9mdV1fbS//Elh8pnIiqNMNrFHn3VFfN4TI9kw/+jLhvMI2ksDuE
         J71g==
X-Gm-Message-State: AC+VfDwP2bObFWo6MjUCfpTM4b267XAATu8YCb5dReapTG3m5qLLOAH1
        2rakuDNjnUaxJtmdSSY+CwtNNw==
X-Google-Smtp-Source: ACHHUZ4GIII34ty0ViBahS0gjNN29+tcbBSiGWCqQhmeI21a+n3skTMwh/qm4H6/m/sQD6Y5K/fj0Q==
X-Received: by 2002:a19:5f11:0:b0:4eb:c85:bdc2 with SMTP id t17-20020a195f11000000b004eb0c85bdc2mr8172808lfb.2.1686765895207;
        Wed, 14 Jun 2023 11:04:55 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id l18-20020a19c212000000b004eff1f7f206sm2224053lfc.9.2023.06.14.11.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 11:04:54 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 14 Jun 2023 20:04:33 +0200
Subject: [PATCH v6 14/22] interconnect: qcom: msm8939: Hook up RPM bus clk
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v6-14-263283111e66@linaro.org>
References: <20230526-topic-smd_icc-v6-0-263283111e66@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v6-0-263283111e66@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686765872; l=1734;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ptXNaQOaty1z4TDLkDcxe3GA9UIR7yqJkXzhnEP9xnw=;
 b=zW7ImhAlheC//FuwEf4n0YToyLVvVx+0R5GHfoYXlaiG0pIf/XLFlz2zpFeYNEBn8b8nKAz+B
 LLu5dSXNePHAYEmBqGh4QucTkyzi3l+8caBBqGqcvU61bow7MrjQbj9
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
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
index b1005dee4e38..6732eeeb8158 100644
--- a/drivers/interconnect/qcom/msm8939.c
+++ b/drivers/interconnect/qcom/msm8939.c
@@ -1283,6 +1283,7 @@ static const struct qcom_icc_desc msm8939_snoc = {
 	.type = QCOM_ICC_NOC,
 	.nodes = msm8939_snoc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8939_snoc_nodes),
+	.bus_clk_desc = &bus_1_clk,
 	.regmap_cfg = &msm8939_snoc_regmap_config,
 	.qos_offset = 0x7000,
 };
@@ -1303,6 +1304,7 @@ static const struct qcom_icc_desc msm8939_snoc_mm = {
 	.type = QCOM_ICC_NOC,
 	.nodes = msm8939_snoc_mm_nodes,
 	.num_nodes = ARRAY_SIZE(msm8939_snoc_mm_nodes),
+	.bus_clk_desc = &bus_2_clk,
 	.regmap_cfg = &msm8939_snoc_regmap_config,
 	.qos_offset = 0x7000,
 };
@@ -1331,6 +1333,7 @@ static const struct qcom_icc_desc msm8939_bimc = {
 	.type = QCOM_ICC_BIMC,
 	.nodes = msm8939_bimc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8939_bimc_nodes),
+	.bus_clk_desc = &bimc_clk,
 	.regmap_cfg = &msm8939_bimc_regmap_config,
 	.qos_offset = 0x8000,
 };
@@ -1402,6 +1405,7 @@ static const struct qcom_icc_desc msm8939_pcnoc = {
 	.type = QCOM_ICC_NOC,
 	.nodes = msm8939_pcnoc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8939_pcnoc_nodes),
+	.bus_clk_desc = &bus_0_clk,
 	.regmap_cfg = &msm8939_pcnoc_regmap_config,
 	.qos_offset = 0x7000,
 };

-- 
2.41.0

