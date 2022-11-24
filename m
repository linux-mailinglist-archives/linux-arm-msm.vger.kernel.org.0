Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78AB1637F12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Nov 2022 19:43:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbiKXSnt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Nov 2022 13:43:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbiKXSns (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Nov 2022 13:43:48 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EE5DF8840
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 10:43:47 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id b3so3706136lfv.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 10:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7fAfdGZJ4QQ0eAIGZU6uPWE4+p29HD6e1RtlTmr/Hk=;
        b=KwaG+BwTeIrxnQVvMPAylzBNcKGaHh2obrbXAQfyROv8ySuEeR1leKfufof4yzbKBZ
         cv6P8aIYOdD+I8uZiKyVEZXMaE2rvMgeNLuR/nQNRAa4ledJ2JWYdiBaZThgmS1u7nQb
         mZ6Wbz7mNt+TtQ58tpGQZeuY0tzmQncevopsdcTKVk6yRX2IBiE/yPk/ZCu6vHGF9P0Z
         o1Wq/haHociLwqBMtth8Q8WyLI3wA/lI32yJHdIsJsAqLM7T2CUoIQlMpRBJ7TPnF1SF
         nBbgdFQMZQQ2S59ex5qe9yjMbqmzhzBTKF+FDdqsOqw9ox9e41XRCqhuOUzFFdn6NRN5
         yHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7fAfdGZJ4QQ0eAIGZU6uPWE4+p29HD6e1RtlTmr/Hk=;
        b=qn3k904dIZ2VG+2Rtws93FJVvjeli6Yl/gCGFbk5ovHPzI/n3LpOYfORwKEj2QKG2y
         Gs7B9oSic3zWEw9Z4Mco+ompIFgNZWjvu/eaEIrb2rIVUfZQsw3stgWl/zJXQfW8jF+V
         numDAWXgcr2Gor4b0mT58kYPOAghqia+lLM931xsbqYXZvxT5vlhTfge3PVTeO+E1bIm
         vBSGSLdtWC+hEonwVoxEPeNmqySZIITBoxbrs+w5vu8bx55/pe7qZoNFleFsrIluiWF2
         YahXw4XZrXm7o+kUX0SO0T0rjgMHCBCxyFJfhLCBEEZtAK38P3dnF/a2maIJh1K7gFzd
         H0dw==
X-Gm-Message-State: ANoB5pn6I3yKivQZDLI7txyPHERvbqkO3oPJWh0HXRpfAO98G7I3zfkG
        hPSI8QDQJte5mnhhFNOCjQHi1DycJ3mPgeEO
X-Google-Smtp-Source: AA0mqf4n6MC+K6mEwOwYA68QWwZSJvaV1aQhiNG9r04ux2Jbn/LZYoRnb0/wyh92uuRu6jaZUOOZ6w==
X-Received: by 2002:ac2:47ec:0:b0:4a7:8b6b:2320 with SMTP id b12-20020ac247ec000000b004a78b6b2320mr4818704lfp.267.1669315425554;
        Thu, 24 Nov 2022 10:43:45 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v7-20020a2ea607000000b0026e0434eb1esm159098ljp.67.2022.11.24.10.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 10:43:45 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 02/15] arm64: dts: qcom: qcs404: align CDSP PAS node with bindings
Date:   Thu, 24 Nov 2022 19:43:20 +0100
Message-Id: <20221124184333.133911-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221124184333.133911-1-krzysztof.kozlowski@linaro.org>
References: <20221124184333.133911-1-krzysztof.kozlowski@linaro.org>
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

The QCS404 CDSP remote processor can be brought to life using two
different bindings:
1. qcom,qcs404-cdsp-pas - currently used in DTSI.
2. qcom,qcs404-cdsp-pil.

Comment out the properties related to qcom,qcs404-cdsp-pil
(qcom,halt-regs, resets and additional clocks), to silence DT schema
warnings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v2:
1. New patch.
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 46 +++++++++++++++-------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index a5324eecb50a..78a8ab29a0a9 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -485,27 +485,31 @@ remoteproc_cdsp: remoteproc@b00000 {
 			interrupt-names = "wdog", "fatal", "ready",
 					  "handover", "stop-ack";
 
-			clocks = <&xo_board>,
-				 <&gcc GCC_CDSP_CFG_AHB_CLK>,
-				 <&gcc GCC_CDSP_TBU_CLK>,
-				 <&gcc GCC_BIMC_CDSP_CLK>,
-				 <&turingcc TURING_WRAPPER_AON_CLK>,
-				 <&turingcc TURING_Q6SS_AHBS_AON_CLK>,
-				 <&turingcc TURING_Q6SS_AHBM_AON_CLK>,
-				 <&turingcc TURING_Q6SS_Q6_AXIM_CLK>;
-			clock-names = "xo",
-				      "sway",
-				      "tbu",
-				      "bimc",
-				      "ahb_aon",
-				      "q6ss_slave",
-				      "q6ss_master",
-				      "q6_axim";
-
-			resets = <&gcc GCC_CDSP_RESTART>;
-			reset-names = "restart";
-
-			qcom,halt-regs = <&tcsr 0x19004>;
+			clocks = <&xo_board>;
+			clock-names = "xo";
+
+			/*
+			 * If the node was using the PIL binding, then include properties:
+			 * clocks = <&xo_board>,
+			 *          <&gcc GCC_CDSP_CFG_AHB_CLK>,
+			 *          <&gcc GCC_CDSP_TBU_CLK>,
+			 *          <&gcc GCC_BIMC_CDSP_CLK>,
+			 *          <&turingcc TURING_WRAPPER_AON_CLK>,
+			 *          <&turingcc TURING_Q6SS_AHBS_AON_CLK>,
+			 *          <&turingcc TURING_Q6SS_AHBM_AON_CLK>,
+			 *          <&turingcc TURING_Q6SS_Q6_AXIM_CLK>;
+			 * clock-names = "xo",
+			 *               "sway",
+			 *               "tbu",
+			 *               "bimc",
+			 *               "ahb_aon",
+			 *               "q6ss_slave",
+			 *               "q6ss_master",
+			 *               "q6_axim";
+			 * resets = <&gcc GCC_CDSP_RESTART>;
+			 * reset-names = "restart";
+			 * qcom,halt-regs = <&tcsr 0x19004>;
+			 */
 
 			memory-region = <&cdsp_fw_mem>;
 
-- 
2.34.1

