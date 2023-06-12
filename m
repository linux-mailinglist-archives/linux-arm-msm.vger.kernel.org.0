Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF00472CE3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 20:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238237AbjFLSZ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 14:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237981AbjFLSZE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 14:25:04 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B97FE6F
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 11:25:03 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f642a24555so5628027e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 11:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686594301; x=1689186301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o0XnmH13ivRPPHGJLER9uxu6PJxvQI4F3jOrAVZw55g=;
        b=xWUnJglbfMZ3rGAv4MqERD3xkoTFovYVULogIGddo4rqrnYrZ3CQo2pzIvvixci7ZF
         cvyZiGSZNclBDpIO/6nnnAUkchkfgtAvY0KJMTFCe0FM3HcWR7oiIG+UPE88Ke2y8kdT
         ZGZAo5ZszB6fr36DHkEQpVhlHuYPXtkGD/ZULQIkKV2WyTix7j17zyOj+uU6jaaN/WH0
         f8mK2tNmAVyrJ0o6GdiR0oIVtBjcwC3xqJvOdlXphVDatRLU8W2b/AFyQSIgYlQMfRET
         dqEMYl6pfRD7W4/Fpm2e4fMNFadl7huGo9CJXqWWix/uGXisUj8PHUUd25awOPEkkynR
         s5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686594301; x=1689186301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0XnmH13ivRPPHGJLER9uxu6PJxvQI4F3jOrAVZw55g=;
        b=S7GG+TY8YzzSxfldZc4JjDp89WmP5S2qwKpWh3I4yOkWGiqlsnbfzHrEcE+yEy5Lef
         YTNylpSQQVAeK5ePTzvDku1pAKdRYhBNmFHbUNyCjZun0JmV/faDI05qc/blIrVj62nG
         OFYn0+S6oihubwnRmQKTjfkKtJHxU9WkfZtyhFqGwk1TxPE1I1yaZJQ8cUqj4VUxFqzH
         VqDOsemHqqISLQB9T+1J5c1pnSLugFb6MFE3CICHMRA3flBc3eLrzC9T7WZk/xeTc/YU
         hhNcCA1eevwdEjncdmDetUeNQpblcDuydhLU2OYnu1VHMd0vZ9OdAGWvZuZ+YarYgKHv
         xqHA==
X-Gm-Message-State: AC+VfDzOFesd7SDSsKDb1fqROwh++/DekWXypWVIrRDJgPOvtFufncOW
        BjyjsMmBbg9IkpoJLz+Z3YirFg==
X-Google-Smtp-Source: ACHHUZ5YGWB1Pz0JWAq0pXlivYyEghhPm8aOujYRyTmM+uFNGWbgmOp2Lw7l6BMUqAeWy944BNJl/g==
X-Received: by 2002:a19:671a:0:b0:4f1:458c:c4c with SMTP id b26-20020a19671a000000b004f1458c0c4cmr4275294lfc.43.1686594301435;
        Mon, 12 Jun 2023 11:25:01 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id v24-20020ac25938000000b004f64073a252sm1502035lfi.96.2023.06.12.11.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 11:25:01 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 12 Jun 2023 20:24:34 +0200
Subject: [PATCH v3 17/23] interconnect: qcom: qcm2290: Hook up RPM bus clk
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v3-17-5fb7d39b874f@linaro.org>
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
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686594276; l=2388;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=tSBMAPt7cmsb0YEEInMBYypPFAnegUdevAoSi5GlaYA=;
 b=j3W8fpt5zJJ9oVdPgFxRoSq13t7pBvjjzWlle1WJxmfiI9hlpvAlSXDXLRgCqdSPcavaI0zec
 lmxSOhAtaxsB82oAZy8+HDTap9uMpOfS7mykGamlmTqy1qjtzGM0Edv
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Assign the necessary definitions to migrate to the new bus clock
handling mechanism.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/qcm2290.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/interconnect/qcom/qcm2290.c b/drivers/interconnect/qcom/qcm2290.c
index cb636e67a5a4..2c7a76fab83c 100644
--- a/drivers/interconnect/qcom/qcm2290.c
+++ b/drivers/interconnect/qcom/qcm2290.c
@@ -1196,6 +1196,7 @@ static const struct qcom_icc_desc qcm2290_bimc = {
 	.type = QCOM_ICC_BIMC,
 	.nodes = qcm2290_bimc_nodes,
 	.num_nodes = ARRAY_SIZE(qcm2290_bimc_nodes),
+	.bus_clk_desc = &bimc_clk,
 	.regmap_cfg = &qcm2290_bimc_regmap_config,
 	/* M_REG_BASE() in vendor msm_bus_bimc_adhoc driver */
 	.qos_offset = 0x8000,
@@ -1251,6 +1252,7 @@ static const struct qcom_icc_desc qcm2290_cnoc = {
 	.type = QCOM_ICC_NOC,
 	.nodes = qcm2290_cnoc_nodes,
 	.num_nodes = ARRAY_SIZE(qcm2290_cnoc_nodes),
+	.bus_clk_desc = &bus_1_clk,
 	.regmap_cfg = &qcm2290_cnoc_regmap_config,
 };
 
@@ -1292,6 +1294,7 @@ static const struct qcom_icc_desc qcm2290_snoc = {
 	.type = QCOM_ICC_QNOC,
 	.nodes = qcm2290_snoc_nodes,
 	.num_nodes = ARRAY_SIZE(qcm2290_snoc_nodes),
+	.bus_clk_desc = &bus_2_clk,
 	.regmap_cfg = &qcm2290_snoc_regmap_config,
 	/* Vendor DT node fab-sys_noc property 'qcom,base-offset' */
 	.qos_offset = 0x15000,
@@ -1306,6 +1309,7 @@ static const struct qcom_icc_desc qcm2290_qup_virt = {
 	.type = QCOM_ICC_QNOC,
 	.nodes = qcm2290_qup_virt_nodes,
 	.num_nodes = ARRAY_SIZE(qcm2290_qup_virt_nodes),
+	.bus_clk_desc = &qup_clk,
 };
 
 static struct qcom_icc_node * const qcm2290_mmnrt_virt_nodes[] = {
@@ -1319,6 +1323,7 @@ static const struct qcom_icc_desc qcm2290_mmnrt_virt = {
 	.type = QCOM_ICC_QNOC,
 	.nodes = qcm2290_mmnrt_virt_nodes,
 	.num_nodes = ARRAY_SIZE(qcm2290_mmnrt_virt_nodes),
+	.bus_clk_desc = &mmaxi_0_clk,
 	.regmap_cfg = &qcm2290_snoc_regmap_config,
 	.qos_offset = 0x15000,
 };
@@ -1333,6 +1338,7 @@ static const struct qcom_icc_desc qcm2290_mmrt_virt = {
 	.type = QCOM_ICC_QNOC,
 	.nodes = qcm2290_mmrt_virt_nodes,
 	.num_nodes = ARRAY_SIZE(qcm2290_mmrt_virt_nodes),
+	.bus_clk_desc = &mmaxi_1_clk,
 	.regmap_cfg = &qcm2290_snoc_regmap_config,
 	.qos_offset = 0x15000,
 };

-- 
2.41.0

