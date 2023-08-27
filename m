Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD3B3789D84
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 13:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbjH0LvR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Aug 2023 07:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbjH0Lu5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Aug 2023 07:50:57 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E59BCC4
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 04:50:48 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5007c8308c3so3625514e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 04:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693137047; x=1693741847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNgy+1kOBvDlpkUgg/7RVOK6q0mi/Y5ybYzwxVC6iZ8=;
        b=EAErSifRGyNKlv9rORxPH6lTzaPnvhp/VOI47XAjcHpno2huSHvnJ2OOtVGLNBFG1Q
         jZ0+IjRDgxFxbOS+N+n+1mgZxcSM5AcaXBzE/l3XBuImmOBqaefn/YOmMgQkHk6t5HO2
         6Pd08H6BgZZYvmlNbDovUkLlOB5tcD+WMLujqYMgKzuonLkkn0WVYcUw0gTHol2K/VUw
         FhImzj6B52NFA3MErp/NkX6VJz+18E3Rtff0XHmoEIKR4C949fOxTZi+NdRgVUBXi8lc
         rlEugGwIhGKBiGwgAC4/1QFg9cG4lP3rJPW9caQE62GVFaCt/7xPUKa2wDpr1yCyNYvk
         xzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693137047; x=1693741847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lNgy+1kOBvDlpkUgg/7RVOK6q0mi/Y5ybYzwxVC6iZ8=;
        b=EgDPc6MIGMiL3emfQHASOG8E6uPk2AXSOjWZh+0itUXVsCn0ttAJs7XxKOJ7gtnPMU
         QdZqn42fXW9fSgmoQe5zPDsBKLuHDBcNPgk9agmFCHzot0avrdXDYU+Oao856lRjGDg5
         SB0tgyp6xHES1aEcgRc8LOcjDT2R1vV7YUDCnKVSAPxE/1BOBSTjq53FHOOxEQRvrOqH
         k5skEksGkmsc2NHzz42SCVvuiEPcYTF7fniWoJPlE+I+jw2a5etb/ryJMwEc9n/dpEY4
         97h4F81HUqPKVcrJ5w4MqeP2wZTgPnLJDXCWHJJ3buQqvQSplJEQvtnb3XUlB0kFsb1V
         ic7A==
X-Gm-Message-State: AOJu0YyoG42EcZwBxp4ok5mL2fbhnI91f68y2lCUBCshNlNLTwaUX8EO
        9k5+HomDnUPrzUhqk0KFpzSRnw==
X-Google-Smtp-Source: AGHT+IFOUuEs2+5V+8gsH1thwMWdka3F0S7ngE1D4jTdGG2M2mHZMZPDCWIMV585xdCa2/n/ri92AQ==
X-Received: by 2002:a05:6512:3d8b:b0:4ff:80d4:e12f with SMTP id k11-20020a0565123d8b00b004ff80d4e12fmr18410281lfv.60.1693137047307;
        Sun, 27 Aug 2023 04:50:47 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a8-20020a19f808000000b004ff9f88b86esm1114770lff.308.2023.08.27.04.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 04:50:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v4 15/23] ARM: dts: qcom: apq8064: add Krait clock controller
Date:   Sun, 27 Aug 2023 14:50:25 +0300
Message-Id: <20230827115033.935089-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
References: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device node for the clock controller for the CPU cores and L2
clocks. It will be further used by the L2 and by the CPUfreq nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index ba7d5ef8de17..a05e64bff07f 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -213,6 +213,32 @@ sleep_clk: sleep_clk {
 		};
 	};
 
+	kraitcc: clock-controller {
+		compatible = "qcom,krait-cc-v1";
+		clocks = <&gcc PLL9>,
+			 <&gcc PLL10>,
+			 <&gcc PLL16>,
+			 <&gcc PLL17>,
+			 <&gcc PLL12>,
+			 <&acc0>,
+			 <&acc1>,
+			 <&acc2>,
+			 <&acc3>,
+			 <&l2cc>;
+		clock-names = "hfpll0",
+			      "hfpll1",
+			      "hfpll2",
+			      "hfpll3",
+			      "hfpll_l2",
+			      "acpu0_aux",
+			      "acpu1_aux",
+			      "acpu2_aux",
+			      "acpu3_aux",
+			      "acpu_l2_aux";
+		#clock-cells = <1>;
+		#interconnect-cells = <1>;
+	};
+
 	sfpb_mutex: hwmutex {
 		compatible = "qcom,sfpb-mutex";
 		syscon = <&sfpb_wrapper_mutex 0x604 0x4>;
-- 
2.39.2

