Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94527710C14
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 May 2023 14:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241091AbjEYM34 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 May 2023 08:29:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241145AbjEYM3w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 May 2023 08:29:52 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB163183
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 May 2023 05:29:50 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3063433fa66so1426540f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 May 2023 05:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685017789; x=1687609789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJsCP5eAukhRRhN8wNftC7pCTKUCCN0FeNvEngr8YsI=;
        b=ORhM7dDRxsRP2rCm+NpguoZtR6c+ZIqhx8hiJ0JtEwbJpLnmofOvtVln3aE0ReFJnN
         1MwjTOkft1jHmTOVrAVFoHa+vjjhSWw08n4iwjn5S6TzXih1A+5TJojWqYZyChSPrpmR
         A0KnLjmROPGfyorXmwcfNBqYc98ePCCwfv2mthk7DlT076wOF0G/9UXTG/Fb7aQtvr+j
         5toTcRSA0VOpVsAOLXR3MYHD1/pHK+vL5SGAYAlmpo3dtNdg7qoRcd7JIcHZYZfsrQ3s
         C7T/FW5lAd3FeglO2aKPrISkC5ZPR3kS3uWu6mWH5do1BflZruoi8Vht2M9YczgcSIcr
         ie8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685017789; x=1687609789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJsCP5eAukhRRhN8wNftC7pCTKUCCN0FeNvEngr8YsI=;
        b=VsV9AmrGXpShIMP0g7HO35YBUSrJYFyPLbGVYWy1ZhmSIzUgsOP/rg80AvBmOWqWw6
         QlCjfvQiXunjKP4ZaDZWUPC7hxRGJIb2lBdrthFlegYc4u25c9mmitx9qLvzOP1px8cO
         abbhSy14/yT0yu4XYzOOSjDENYGe6Srbf8Tq/7DjB6X6DT5zRRu/V06j5y3pjOPeLn8G
         xzB7gfppdCtObK8Hq/z9CRUNRuIWuJj3MNCBOPZUpA00LtlpiLsRbK613NcizQLAzAxA
         izz/EJ5Sysxe+HOkMOzwqEWZKEYZ7qGuYB+zIyBaJ+tl2gogf26LFk4mOpGJhr7VsmH7
         JDqA==
X-Gm-Message-State: AC+VfDxfz8kHiknEN9ti8G+P1TnzBgZtz9XI83SOYQG9excIBrF9dN/V
        UPxeConaTgmYaWXKQoO8LY4adQ==
X-Google-Smtp-Source: ACHHUZ4vMqeUCwGb2uVCp+SVxuBY9+XTrYC5axsN8N1ITSaFrjffj/2AHApiEb9E1m5041bOjWZQBw==
X-Received: by 2002:adf:f84c:0:b0:309:45b0:e7f7 with SMTP id d12-20020adff84c000000b0030945b0e7f7mr2373279wrq.52.1685017789535;
        Thu, 25 May 2023 05:29:49 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id k7-20020adfe3c7000000b003062b2c5255sm1700227wrm.40.2023.05.25.05.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 05:29:48 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     johan+linaro@kernel.org, agross@kernel.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 4/6] clk: qcom: Add lpass audio clock controller driver for SC8280XP
Date:   Thu, 25 May 2023 13:29:28 +0100
Message-Id: <20230525122930.17141-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525122930.17141-1-srinivas.kandagatla@linaro.org>
References: <20230525122930.17141-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the lpass audio clock controller found on SC8280XP based
devices. This would allow lpass peripheral loader drivers to control the
clocks and bring the subsystems out of reset.

Currently this patch only supports resets as the Q6DSP is in control of
LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
channel.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/clk/qcom/lpasscc-sc8280xp.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/clk/qcom/lpasscc-sc8280xp.c b/drivers/clk/qcom/lpasscc-sc8280xp.c
index 547f15d41a9d..60cc3c98d03d 100644
--- a/drivers/clk/qcom/lpasscc-sc8280xp.c
+++ b/drivers/clk/qcom/lpasscc-sc8280xp.c
@@ -14,6 +14,26 @@
 #include "common.h"
 #include "reset.h"
 
+static const struct qcom_reset_map lpass_audiocc_sc8280xp_resets[] = {
+	[LPASS_AUDIO_SWR_RX_CGCR] =  { 0xa0, 1 },
+	[LPASS_AUDIO_SWR_WSA_CGCR] = { 0xb0, 1 },
+	[LPASS_AUDIO_SWR_WSA2_CGCR] =  { 0xd8, 1 },
+};
+
+static struct regmap_config lpass_audiocc_sc8280xp_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.name = "lpass-audio-csr",
+	.max_register = 0x1000,
+};
+
+static const struct qcom_cc_desc lpass_audiocc_reset_sc8280xp_desc = {
+	.config = &lpass_audiocc_sc8280xp_regmap_config,
+	.resets = lpass_audiocc_sc8280xp_resets,
+	.num_resets = ARRAY_SIZE(lpass_audiocc_sc8280xp_resets),
+};
+
 static const struct qcom_reset_map lpasscc_sc8280xp_resets[] = {
 	[LPASS_AUDIO_SWR_TX_CGCR] = { 0xc010, 1 },
 };
@@ -34,6 +54,9 @@ static const struct qcom_cc_desc lpasscc_reset_sc8280xp_desc = {
 
 static const struct of_device_id lpasscc_sc8280xp_match_table[] = {
 	{
+		.compatible = "qcom,sc8280xp-lpassaudiocc",
+		.data = &lpass_audiocc_reset_sc8280xp_desc,
+	}, {
 		.compatible = "qcom,sc8280xp-lpasscc",
 		.data = &lpasscc_reset_sc8280xp_desc,
 	},
-- 
2.21.0

