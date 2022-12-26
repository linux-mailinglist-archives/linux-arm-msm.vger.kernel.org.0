Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF49A655FD9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Dec 2022 05:22:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231631AbiLZEWX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Dec 2022 23:22:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231640AbiLZEWJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Dec 2022 23:22:09 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A9392DEE
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 20:22:05 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id z26so14684735lfu.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 20:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83ljR628GMOo2KYTso3qbZ9GKZWBVlBN2pNQ+FKekz8=;
        b=Tf4EO1USYGxBH0DQXO/BBddmsourIV604KoNr8sA+KU6ddOtNCZnb5aUI6gvgF9Dwt
         Xg0luC2V/FnqGheWyW6fciPo7oc8muEajoGAZwry6F+8wKHhG+tHJBRSAQjO9ZRW79El
         ixJxLO8XvyD+vL9rz1jQaerKESD1VSCJOKQWPv4dOrgq7EffChZsyd81ughN+buN3JE8
         aBHWNMaqqXO84Uiap1pG/Drh0VoGuV6OAOcdLFUwRB0K+9IMSxcetP4H6zxc7yN++/Cs
         NaLk4ZNlsevPSWSnPGw5IEQAgUVpKWcX3pe9wEC9Z8+LbV3jNScaAaIe8YyZbOA0FliK
         k/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=83ljR628GMOo2KYTso3qbZ9GKZWBVlBN2pNQ+FKekz8=;
        b=qs7rR3T524si5hvvK42HXrAmg/4spM7Qx1Wr+ydh/WqqDipvFBGdvEyLJKNOTwqG6x
         NOqIpG/1rnWA5ntAGMCB28AUOMeaeUxHvKvCclMyhnd90tT4/cpfotry4Y+TnGLfrE42
         vggOhJL4kdrUgOiLHYYVZ3VsJ0GN84p76ev+ulPo80xsD/yH823ZtiM3G4prtT7WvsgF
         CDLdGLvIDEcxcA8cfAjXQdrWFlkhimAyAMvvxiXbfGu3TnrZR5SPsFrVM2a7SHR/M0ww
         nf/qoD6RbEsShf4L3lHZP+k/EQCXsxBJfM+kMkerxBnKyBCmNsnkRDnsgRGOM4R62ajk
         aT1Q==
X-Gm-Message-State: AFqh2kpsojfygFQhjMMvcZatVs/AeJ5XWE95S3JDgOPHJw79My3fDmq1
        vS2i55NoUrZDxgyx/7VcxGND1Q==
X-Google-Smtp-Source: AMrXdXtxDYdagGxb5aSzdZcXz5UTYghzUvUWF9muCvcRAyVZKzak2F6b6EtRCqpIo5gyUAKE1cKXeA==
X-Received: by 2002:ac2:431a:0:b0:4c8:ae6b:ea8d with SMTP id l26-20020ac2431a000000b004c8ae6bea8dmr4350823lfh.8.1672028523746;
        Sun, 25 Dec 2022 20:22:03 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o9-20020ac25e29000000b004b4b5da5f80sm1641129lfg.219.2022.12.25.20.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 20:22:03 -0800 (PST)
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
Subject: [PATCH v2 12/16] clk: qcom: gcc-qcs404: add support for GDSCs
Date:   Mon, 26 Dec 2022 06:21:50 +0200
Message-Id: <20221226042154.2666748-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
References: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
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

Add support for two GDSCs provided by this clock controller.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index fa2adf242648..5f58dd82d3fe 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -19,6 +19,7 @@
 #include "clk-rcg.h"
 #include "clk-regmap.h"
 #include "common.h"
+#include "gdsc.h"
 #include "reset.h"
 
 enum {
@@ -2591,6 +2592,22 @@ static struct clk_branch gcc_wdsp_q6ss_axim_clk = {
 	},
 };
 
+static struct gdsc mdss_gdsc = {
+	.gdscr = 0x4d078,
+	.pd = {
+		.name = "mdss",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc oxili_gdsc = {
+	.gdscr = 0x5901c,
+	.pd = {
+		.name = "oxili",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
 static struct clk_hw *gcc_qcs404_hws[] = {
 	&cxo.hw,
 };
@@ -2741,6 +2758,11 @@ static struct clk_regmap *gcc_qcs404_clocks[] = {
 
 };
 
+static struct gdsc *gcc_qcs404_gdscs[] = {
+	[MDSS_GDSC] = &mdss_gdsc,
+	[OXILI_GDSC] = &oxili_gdsc,
+};
+
 static const struct qcom_reset_map gcc_qcs404_resets[] = {
 	[GCC_GENI_IR_BCR] = { 0x0F000 },
 	[GCC_CDSP_RESTART] = { 0x18000 },
@@ -2783,6 +2805,8 @@ static const struct qcom_cc_desc gcc_qcs404_desc = {
 	.num_resets = ARRAY_SIZE(gcc_qcs404_resets),
 	.clk_hws = gcc_qcs404_hws,
 	.num_clk_hws = ARRAY_SIZE(gcc_qcs404_hws),
+	.gdscs = gcc_qcs404_gdscs,
+	.num_gdscs = ARRAY_SIZE(gcc_qcs404_gdscs),
 };
 
 static const struct of_device_id gcc_qcs404_match_table[] = {
-- 
2.35.1

