Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 129696B142D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 22:36:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbjCHVg5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 16:36:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbjCHVgX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 16:36:23 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B33EAD30B5
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 13:35:58 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id i9so23108177lfc.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 13:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678311356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4XnwTKK+r/ENEsY5xL5W4CAtIX7vncEORsdYqk3zz8=;
        b=gX777jL/5l6kIjI27QmqsyX79SF8nW8A0qVANxM9lSgrvA8+n6GoLs/Yv5v0fxKza+
         0MP40fOz85b2O+zV1XDcRsBXKqL8MH2QhoSYNWwyS6DU2nEsoRhpSiLQu8TzK5fxUt8z
         jvYebb9QXjQ5m2e80f7aRscvKrspADRTmI0iRXPdhs8Tnm3Dkpp998ZsV5tYMjbTzTKo
         r0oZR/UvRX5lZBAMNO+xJjhrwc2Co1YG1384CWujXk+ZTEvCeXemwCafgZAv8BAsxiTE
         NBixBt2VTokQiO3QMXgzP7PQV1kxX2JkP28T6Dkh8D0AUeSrSar8rGAqgiY4wnfYqp2L
         fflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678311356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D4XnwTKK+r/ENEsY5xL5W4CAtIX7vncEORsdYqk3zz8=;
        b=1zZ1yB8xSETssu/Q+JTfyDoPKI/WiBTvW8zWSkO1R7zPfEgu8mpziNse4rEa1rF+hp
         36bxku3dMgxMJo4ySuCIx1tFJUPEUXjFKBfM1me5jmFGK0wdktFeYr3LURrXO2UpKjWd
         Z4Z55yJB6NnTdm4cZy4o2SWdpWqrBtZruEK9D4Fm0Be+bTTYL475uy7OJE7lIZKhi3eL
         Ykoad9jtVuCDWcKho7JzkVVYAPaxjhhU2OSIixDNdkSQJxBILvYWOSDb+GYzFHcP1to8
         pIXFPRnp/cDhkcvc/jSfsKoygIvbU4sc+GOzkDrZebfII+QEISkzyuPOhxgMpDI7I4TQ
         mnYw==
X-Gm-Message-State: AO0yUKXS9lQLVo7rHaIfG47bwraTFX0QosbJM/ZNLo5Ulv8yCRArlxGn
        rDkELpqMb/WYW1mW8eDpmErVcg==
X-Google-Smtp-Source: AK7set+LiU1LGn6kjvZ8TOavZQwSLWsnj3ZSJWqAQ5ozQw6k0x5p7VRZoONoQjyaQkuDHYzdmnKmfw==
X-Received: by 2002:ac2:5a45:0:b0:4cc:8682:ec5c with SMTP id r5-20020ac25a45000000b004cc8682ec5cmr5076161lfn.34.1678311356522;
        Wed, 08 Mar 2023 13:35:56 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id u7-20020ac243c7000000b004dc4d26c324sm2467479lfl.143.2023.03.08.13.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 13:35:56 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 08 Mar 2023 22:35:28 +0100
Subject: [PATCH RFT v2 12/14] clk: qcom: smd-rpm: Hook up CNoC_1 and SNoC_2
 keep_alive
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-rpmcc_sleep-v2-12-ae80a325fe94@linaro.org>
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678311334; l=4801;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=bvsdJLy7tgag7pJIG/YhqythrBFn4s7xKZ0bdeefut8=;
 b=J7M28LAzUYEMYIao58B7D+APzztZRI1TsQUe1Yors/2XpeGwGjVfdXjMHBiYHvyvbLpjaLGKin5g
 lGpXKd06B4R8gu/XE9vn+KOlp5fJ1ZS1P/6FK2MWGQOr2N9+4kFD
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

4 of our 18 supported platforms need an active keepalive vote on
CNoC_1 and SNoC_2 so as not to cause havoc on the entire SoC.
Guarantee that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index a44b52bd0c83..ef3157fd29d5 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -507,7 +507,9 @@ DEFINE_CLK_SMD_RPM_BUS(cnoc, 2);
 DEFINE_CLK_SMD_RPM_BUS(mmssnoc_ahb, 3);
 DEFINE_CLK_SMD_RPM_BUS(snoc_periph, 0);
 DEFINE_CLK_SMD_RPM_BUS(cnoc, 1);
+DEFINE_CLK_SMD_RPM_BUS_KEEP_ALIVE(cnoc, 1);
 DEFINE_CLK_SMD_RPM_BUS(snoc, 2);
+DEFINE_CLK_SMD_RPM_BUS_KEEP_ALIVE(snoc, 2);
 DEFINE_CLK_SMD_RPM_BUS(snoc_lpass, 5);
 
 DEFINE_CLK_SMD_RPM(bimc, QCOM_SMD_RPM_MEM_CLK, 0);
@@ -1111,7 +1113,7 @@ static struct clk_smd_rpm *sm6125_clks[] = {
 	[RPM_SMD_XO_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo,
 	[RPM_SMD_XO_A_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo_a,
 	[RPM_SMD_SNOC_CLK] = &clk_smd_rpm_bus_2_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &clk_smd_rpm_bus_2_snoc_a_clk,
+	[RPM_SMD_SNOC_A_CLK] = &clk_smd_rpm_bus_2_snoc_a_keep_alive_clk,
 	[RPM_SMD_BIMC_CLK] = &clk_smd_rpm_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK] = &clk_smd_rpm_bimc_a_clk,
 	[RPM_SMD_QDSS_CLK] = &clk_smd_rpm_branch_qdss_clk,
@@ -1121,7 +1123,7 @@ static struct clk_smd_rpm *sm6125_clks[] = {
 	[RPM_SMD_RF_CLK2] = &clk_smd_rpm_rf_clk2,
 	[RPM_SMD_RF_CLK2_A] = &clk_smd_rpm_rf_clk2_a,
 	[RPM_SMD_CNOC_CLK] = &clk_smd_rpm_bus_1_cnoc_clk,
-	[RPM_SMD_CNOC_A_CLK] = &clk_smd_rpm_bus_1_cnoc_a_clk,
+	[RPM_SMD_CNOC_A_CLK] = &clk_smd_rpm_bus_1_cnoc_a_keep_alive_clk,
 	[RPM_SMD_IPA_CLK] = &clk_smd_rpm_ipa_clk,
 	[RPM_SMD_IPA_A_CLK] = &clk_smd_rpm_ipa_a_clk,
 	[RPM_SMD_CE1_CLK] = &clk_smd_rpm_ce1_clk,
@@ -1154,7 +1156,7 @@ static struct clk_smd_rpm *sm6115_clks[] = {
 	[RPM_SMD_XO_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo,
 	[RPM_SMD_XO_A_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo_a,
 	[RPM_SMD_SNOC_CLK] = &clk_smd_rpm_bus_2_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &clk_smd_rpm_bus_2_snoc_a_clk,
+	[RPM_SMD_SNOC_A_CLK] = &clk_smd_rpm_bus_2_snoc_a_keep_alive_clk,
 	[RPM_SMD_BIMC_CLK] = &clk_smd_rpm_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK] = &clk_smd_rpm_bimc_a_clk,
 	[RPM_SMD_QDSS_CLK] = &clk_smd_rpm_branch_qdss_clk,
@@ -1164,7 +1166,7 @@ static struct clk_smd_rpm *sm6115_clks[] = {
 	[RPM_SMD_RF_CLK2] = &clk_smd_rpm_rf_clk2,
 	[RPM_SMD_RF_CLK2_A] = &clk_smd_rpm_rf_clk2_a,
 	[RPM_SMD_CNOC_CLK] = &clk_smd_rpm_bus_1_cnoc_clk,
-	[RPM_SMD_CNOC_A_CLK] = &clk_smd_rpm_bus_1_cnoc_a_clk,
+	[RPM_SMD_CNOC_A_CLK] = &clk_smd_rpm_bus_1_cnoc_a_keep_alive_clk,
 	[RPM_SMD_IPA_CLK] = &clk_smd_rpm_ipa_clk,
 	[RPM_SMD_IPA_A_CLK] = &clk_smd_rpm_ipa_a_clk,
 	[RPM_SMD_CE1_CLK] = &clk_smd_rpm_ce1_clk,
@@ -1194,13 +1196,13 @@ static struct clk_smd_rpm *sm6375_clks[] = {
 	[RPM_SMD_XO_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo,
 	[RPM_SMD_XO_A_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo_a,
 	[RPM_SMD_SNOC_CLK] = &clk_smd_rpm_bus_2_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &clk_smd_rpm_bus_2_snoc_a_clk,
+	[RPM_SMD_SNOC_A_CLK] = &clk_smd_rpm_bus_2_snoc_a_keep_alive_clk,
 	[RPM_SMD_BIMC_CLK] = &clk_smd_rpm_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK] = &clk_smd_rpm_bimc_a_clk,
 	[RPM_SMD_QDSS_CLK] = &clk_smd_rpm_branch_qdss_clk,
 	[RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_branch_qdss_a_clk,
 	[RPM_SMD_CNOC_CLK] = &clk_smd_rpm_bus_1_cnoc_clk,
-	[RPM_SMD_CNOC_A_CLK] = &clk_smd_rpm_bus_1_cnoc_a_clk,
+	[RPM_SMD_CNOC_A_CLK] = &clk_smd_rpm_bus_1_cnoc_a_keep_alive_clk,
 	[RPM_SMD_IPA_CLK] = &clk_smd_rpm_ipa_clk,
 	[RPM_SMD_IPA_A_CLK] = &clk_smd_rpm_ipa_a_clk,
 	[RPM_SMD_QUP_CLK] = &clk_smd_rpm_qup_clk,
@@ -1231,7 +1233,7 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
 	[RPM_SMD_XO_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo,
 	[RPM_SMD_XO_A_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo_a,
 	[RPM_SMD_SNOC_CLK] = &clk_smd_rpm_bus_2_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &clk_smd_rpm_bus_2_snoc_a_clk,
+	[RPM_SMD_SNOC_A_CLK] = &clk_smd_rpm_bus_2_snoc_a_keep_alive_clk,
 	[RPM_SMD_BIMC_CLK] = &clk_smd_rpm_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK] = &clk_smd_rpm_bimc_a_clk,
 	[RPM_SMD_QDSS_CLK] = &clk_smd_rpm_branch_qdss_clk,
@@ -1241,7 +1243,7 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
 	[RPM_SMD_RF_CLK3] = &clk_smd_rpm_38m4_rf_clk3,
 	[RPM_SMD_RF_CLK3_A] = &clk_smd_rpm_38m4_rf_clk3_a,
 	[RPM_SMD_CNOC_CLK] = &clk_smd_rpm_bus_1_cnoc_clk,
-	[RPM_SMD_CNOC_A_CLK] = &clk_smd_rpm_bus_1_cnoc_a_clk,
+	[RPM_SMD_CNOC_A_CLK] = &clk_smd_rpm_bus_1_cnoc_a_keep_alive_clk,
 	[RPM_SMD_IPA_CLK] = &clk_smd_rpm_ipa_clk,
 	[RPM_SMD_IPA_A_CLK] = &clk_smd_rpm_ipa_a_clk,
 	[RPM_SMD_QUP_CLK] = &clk_smd_rpm_qup_clk,

-- 
2.39.2

