Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C14E624564
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 16:18:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231334AbiKJPSB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 10:18:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231373AbiKJPR5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 10:17:57 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4A7130F4D
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 07:17:52 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id l12so3855410lfp.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 07:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDlxhalLaPohTMht0sA6QtRq47J10Uk/KVFrQ+ly9+c=;
        b=ye+2+N3oa1WOQLv1C3P3U+LuFkPW9IVUm4owQLVVQk6s9yIFUNwUHvRl0l6yEJrEB8
         LAa6gfo1NnyQmqS0fcn5zQqHhAU9HIgXDy+5jEnvfg7OXnSz5pVIUKT4jbbI3auQOzkz
         MAJlJWn3PomljlYbC59xJfsz3D30fITK09lAP0xXbWfWQWUL7weEPCRYamMqsphay4nq
         uXAJXvfgK3VU/PNwQW65lkDl+upbpKyfps+gBuQaLaShY+bXLSudEj7m20sBWme/6JrX
         9TsubmYZJeG0YbIuDSBIzX9Lg3+mZTjiFfTtCjE3cArz/W3O1ThcLXyJ9CCnb++MlxM8
         +mfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDlxhalLaPohTMht0sA6QtRq47J10Uk/KVFrQ+ly9+c=;
        b=On5IK2iNoNV/TvXM2+dhN9ToG/FWP1E1e2OaOaAZDByIL8p0UMMMWDfiGXorrmln1A
         Uffwp+hQdFkhwdY0MF0ongpDQuDwS4GHUWjqfbl+H28WMUg768lkPNcj9g6Rl+mnXIyd
         lkmdv/3LyJ1cUMBugh/LTUGzdI1Vd8/WoLc0UovWZJMrD2U96Hodb4KtLQeq9SgI6gY6
         VbygAWp/HKC3dN5ZmUap7jJheD630KzMNwSPxaO6JUl5HKnVI9DYpATCjint2luntaah
         2kqBsxz57DF+AljWxo3xLPh8DKooDtQjOo2TUpCE55JLH4fD5OduK5x7NrtDb995Q4fy
         HSdA==
X-Gm-Message-State: ACrzQf0jeg2W7gs63yJUO2nSKKMADj5HgKCHoF9bJtnEBFfvHRZCcnRs
        Uz1XuLoDXQQS1EZZwBYD9JAWEQ==
X-Google-Smtp-Source: AMsMyM5gF9sOQzOK81pQsLi3deVaccBBNhqAi5ATkXpxk3J6Auyv6jEzOjHQv1qFh9txKIHKdMtPNQ==
X-Received: by 2002:a19:f006:0:b0:4ab:faae:693b with SMTP id p6-20020a19f006000000b004abfaae693bmr1692441lfc.597.1668093471171;
        Thu, 10 Nov 2022 07:17:51 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p22-20020a2eb7d6000000b002774e7267a7sm2719591ljo.25.2022.11.10.07.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 07:17:50 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: [PATCH v7 3/4] arm64: dts: qcom: sm8450: fix gcc clocks order to follow the schema
Date:   Thu, 10 Nov 2022 18:17:47 +0300
Message-Id: <20221110151748.795767-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221110151748.795767-1-dmitry.baryshkov@linaro.org>
References: <20221110151748.795767-1-dmitry.baryshkov@linaro.org>
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

Move the sleep_clk to make sure the gcc device node follows the schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index d32f08df743d..efb01fefe9c7 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -720,13 +720,13 @@ gcc: clock-controller@100000 {
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&sleep_clk>,
 				 <&pcie0_lane>,
-				 <&pcie1_lane>,
-				 <&sleep_clk>;
+				 <&pcie1_lane>;
 			clock-names = "bi_tcxo",
+				      "sleep_clk",
 				      "pcie_0_pipe_clk",
-				      "pcie_1_pipe_clk",
-				      "sleep_clk";
+				      "pcie_1_pipe_clk";
 		};
 
 		gpi_dma2: dma-controller@800000 {
-- 
2.35.1

