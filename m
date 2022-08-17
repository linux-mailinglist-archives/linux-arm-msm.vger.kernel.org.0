Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2951A596F1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 15:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239562AbiHQNFh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 09:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239556AbiHQNEj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 09:04:39 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDD9B3ED4E
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 06:04:09 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id u6so13499185ljk.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 06:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=uPnkJ9CZ7fbXWgaAUcfcWBXaeXKUW7FCT3L0V3onDIA=;
        b=Fc//ghCPlI2grror3k/gdiB3O/cjHqZyRs6QSvO/7x2zSS9OHfw8PAr62PzduFmqKy
         8tFTKsMuhsxltwVTa3VkJlfRoP8v5W3/rDoUSXV7BVYsRdCEcumL2FYRr16R6bYV6LVl
         Zcflciwi81vjk1JVEMAuBeWY+f7AHICRyqyjqgh4d0uutrhHNMGwX3z98sbR+pwg/5NU
         GJsUUI1d49xWFqRI7krlV8INsAy7gz5Qsun4CZuOA7vnlFeuUKQVXBYZiXHyYesNO2Qx
         XiLFgvDYmrB08z4MEa+x75hajHfqIdsioU9d3wDXZEAmsoyLveg4pcfCYcEjHfYtz1xM
         RJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=uPnkJ9CZ7fbXWgaAUcfcWBXaeXKUW7FCT3L0V3onDIA=;
        b=vhlipUS7WZs+D9/X92ftnClo8BYg88hwESpQZ1mmZVleFH9Pf4uJivWTlwk6gsNGpw
         8sNsC2kJDiQqFxPWSDu0DL7Abuz+9Aqn9W793Bh2QA1PEcRYaKwqPHoi9bfkpxCanOiY
         RcJV7td/4nHkpUx0YREpD3p3mbHry6WFxSHtHHwgID8huj+ZlNP6mtUVR+2/JZHZFxB4
         atB3qYpFmk06MmJHzCN2dKUxkEH9KHFy7RDWK/YC/XtXIQiIWko+Tlm1b1zTAtSMxDQK
         xizZKetoZgETVbx/ynthoi2uq1xf8d7Nm2RS+Bml9H9Q/K+BBgg6WIxGtyrHHtK/eBGS
         b+uA==
X-Gm-Message-State: ACgBeo00CDGmuZgaFvmUT0VUp3mQ4lOPkd187kGX9kSWRVP7ZlnUIfp7
        0QglgTSo/sgdj6v4OdF6mp4bqQ==
X-Google-Smtp-Source: AA6agR6istx8JavCEXk3I5CtWbuvh0/no8XYd5sNH5SDdsxtdJ/jifPTQYUQdXQdDn3fvceLZTjHqw==
X-Received: by 2002:a2e:7d08:0:b0:25e:c66f:2bc4 with SMTP id y8-20020a2e7d08000000b0025ec66f2bc4mr7530960ljc.22.1660741446898;
        Wed, 17 Aug 2022 06:04:06 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id v1-20020ac25601000000b0048b3768d2ecsm1683243lfd.174.2022.08.17.06.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 06:04:06 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH v2 12/14] arm64: dts: qcom: qcs404: switch TCSR mutex to MMIO
Date:   Wed, 17 Aug 2022 16:03:40 +0300
Message-Id: <20220817130342.568396-13-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817130342.568396-1-krzysztof.kozlowski@linaro.org>
References: <20220817130342.568396-1-krzysztof.kozlowski@linaro.org>
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

The TCSR mutex bindings allow device to be described only with address
space (so it uses MMIO, not syscon regmap).  This seems reasonable as
TCSR mutex is actually a dedicated IO address space and it also fixes DT
schema checks:

  qcom/qcs404-evb-4000.dtb: hwlock: 'reg' is a required property
  qcom/qcs404-evb-4000.dtb: hwlock: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 9ab990061522..3a94eb2cc448 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -295,12 +295,6 @@ smem {
 		hwlocks = <&tcsr_mutex 3>;
 	};
 
-	tcsr_mutex: hwlock {
-		compatible = "qcom,tcsr-mutex";
-		syscon = <&tcsr_mutex_regs 0 0x1000>;
-		#hwlock-cells = <1>;
-	};
-
 	soc: soc@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -726,9 +720,10 @@ gcc: clock-controller@1800000 {
 			assigned-clock-rates = <19200000>;
 		};
 
-		tcsr_mutex_regs: syscon@1905000 {
-			compatible = "syscon";
+		tcsr_mutex: hwlock@1905000 {
+			compatible = "qcom,tcsr-mutex";
 			reg = <0x01905000 0x20000>;
+			#hwlock-cells = <1>;
 		};
 
 		tcsr: syscon@1937000 {
-- 
2.34.1

