Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25B6E789D50
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 13:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbjH0Lpt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Aug 2023 07:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbjH0Lp3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Aug 2023 07:45:29 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4119B132
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 04:45:26 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4ff09632194so3692736e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 04:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693136724; x=1693741524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aa3H2iefcQlYYWOvTv26OeJQbCdCn/zWrEM8kKvHomY=;
        b=eHY14BrrVoJsqDZDlPmLXbfPcayLOiTnqDAlXbHg7ehMmSIOWMz1H27x6kgwhpWZVC
         vQfyfuO3Zsp3HGy6YGd4c2geiNp8b2Qh2pQifShJIk3rMFtYo7hpcsS2/a7hM8NNup3g
         OF8emR+k8et2vMDOu9msuvc5YBA2IuCGLh7GnIj9zvsH4Js/AwP/6p9ghqrv0GeYHs0Y
         7nZVo6OZ3sh3Hw5vSO59rMCSBucuC5mehw3KvVWHsKAA7FjaTxc71RnPsG1f1kBK/C/i
         ZGQvewGK+W60IS8jBZ7ZmtdhQjQ9mMVrhu4wwaXgCqWaALjIxYESrvVJ2P8MF1bouyB+
         3x9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693136724; x=1693741524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aa3H2iefcQlYYWOvTv26OeJQbCdCn/zWrEM8kKvHomY=;
        b=KSWGWRPW/j6CskGRs88GLtYi5k24pH1Owu96wE6ePPOQQ6I1thHka5CRKJZrN6PzIA
         OWbqd1W3On7eWRGcsfuVpFUO48Da8p2b9cSBEYTdDUhin48KPLmQQMtKHjKDMZ/0yuis
         2jWuPtzC9afFmP6FFhr7fb37ZEYULHmWYETzjsFXFA0sKdiSOj4JGUtoZu5mN2gEVPwm
         hwKE1wxOONR62whWTfWqL5koG42NkuCtudNgtXgV+8L+NeQtvU0Zw83iIkphwHiARlkg
         ZuHxIbMqC1uWA2uNB/6EfduABWRF/qgTDMSH6HNq2Tfw9bxjTkIgjRzYiyhDz/EDNyVA
         U5jw==
X-Gm-Message-State: AOJu0YzMqNqiBrDoYzeFOzQFw/02STNug5zTNTYzJ0D5zfnX/uXSNJhh
        PTJ74ZBJU9YPFHgJpKHDEuCzdQ==
X-Google-Smtp-Source: AGHT+IGwC58vPd6gVaZ2rZzjpBpbfeahrxbw4hICOCqX+x4aGvq7mANdbs1Ik/uE29QdPQiIlixvYg==
X-Received: by 2002:a05:6512:304f:b0:500:b890:fb38 with SMTP id b15-20020a056512304f00b00500b890fb38mr554588lfb.24.1693136724245;
        Sun, 27 Aug 2023 04:45:24 -0700 (PDT)
Received: from krzk-bin.. ([77.252.47.225])
        by smtp.gmail.com with ESMTPSA id m15-20020a50ef0f000000b005254b41f507sm3239024eds.32.2023.08.27.04.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 04:45:23 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ARM: dts: qcom: sdx65: add missing GCC clocks
Date:   Sun, 27 Aug 2023 13:45:19 +0200
Message-Id: <20230827114519.48797-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230827114519.48797-1-krzysztof.kozlowski@linaro.org>
References: <20230827114519.48797-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SDX65 GCC clock controller expects two required clocks:
pcie_pipe_clk and usb3_phy_wrapper_gcc_usb30_pipe_clk.  The first one is
provided by existing phy node, but second is not yet implemented.

  qcom-sdx65-mtp.dtb: clock-controller@100000: clocks: [[11, 0], [11, 1], [12]] is too short
  qcom-sdx65-mtp.dtb: clock-controller@100000: clock-names: ['bi_tcxo', 'bi_tcxo_ao', 'sleep_clk'] is too short

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi b/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
index 93c6c80dc379..58635bbc1123 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
@@ -204,8 +204,16 @@ soc: soc {
 		gcc: clock-controller@100000 {
 			compatible = "qcom,gcc-sdx65";
 			reg = <0x00100000 0x001f7400>;
-			clocks = <&rpmhcc RPMH_CXO_CLK>, <&rpmhcc RPMH_CXO_CLK_A>, <&sleep_clk>;
-			clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>,
+				 <&pcie_phy>,
+				 <0>;
+			clock-names = "bi_tcxo",
+				      "bi_tcxo_ao",
+				      "sleep_clk",
+				      "pcie_pipe_clk",
+				      "usb3_phy_wrapper_gcc_usb30_pipe_clk";
 			#power-domain-cells = <1>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
-- 
2.34.1

