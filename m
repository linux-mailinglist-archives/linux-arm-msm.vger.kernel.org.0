Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 451D861205C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 07:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbiJ2FPW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Oct 2022 01:15:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbiJ2FPU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Oct 2022 01:15:20 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 187DD642C9
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 22:15:15 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id c2so6521603plz.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 22:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cVB8ZRCzWlgKeD0n1G3uLPw7pOjhEAhkxGK/vJbReQA=;
        b=hhzv9coqb1SWZ5BX3K1uBbMDMv/vTikIAjMoPV6AZJIkz4yozy0vX3/P02D0JzTlkP
         zuppyO85dmxrp8k8bLn8fGYTeU5EpFDh6e1zX+FnocOx1t83DqmpSFwwj8e0rq6NXZLR
         D2lQPRWcV19B+7g1cCScQ+MVqu0eX4L0x46A7pnLXMYxZ6UW0WUeyLQ4d8SD3vLySLpj
         zBePLQrQf2Lcz1urdcSNEr7JhkVI3R1yiUVmpl8qG5iubU5fgWsyK9L+pKp/KQRnfoPi
         D2HNKV1fY2EgVU3zT1qY/3+neAm+7avSLpQFR7mxJGMdjjKi4ckh4bb8qGCAqgsvx/VB
         iqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cVB8ZRCzWlgKeD0n1G3uLPw7pOjhEAhkxGK/vJbReQA=;
        b=tJaHHJcFLDqvjz7KoVDqxbmrjgm7wxe/RTJFSN4gwPuOUaeJQ00i7eSu8deIhEg6px
         bDR4098934BrxF4QKW2/330bjD+nSHrIHP/HwZ1f9yLEjZEsTcQjalyeMu7wwS1AfU6F
         3Dby34xBjdYogoiiOem/wjdIyIaxyIswsi3G6ZUmLRzYjQFSV02LaodIDmwaNXKUGgeM
         A9qnvd19HQWwydzoZs9auhWGaJzDPpFxLoDYSQy1Z09hMZY9/iUC100d4ZqNPJDhzPr2
         /7F3/fgcEoTMRlyRQoGeSWc3NxhKnOIKGM/RhdC1tXEYhSo9e/paII9kLX57b80cLW6h
         178Q==
X-Gm-Message-State: ACrzQf0UssOvHpvci9opKLOSKkYZxJCvOzgvnePCrb+BmAFhBwoGkGcE
        orpz64QtlUhBdg9LJUSy4e/s
X-Google-Smtp-Source: AMsMyM6/pni7fcCZNdvmUjib7QZ+29/ps8NpbcPPvqcnaMOQKOl+qEukd/IO2ObeDW5yVTWXDqOCMA==
X-Received: by 2002:a17:90b:3d8b:b0:20d:3e7f:32d3 with SMTP id pq11-20020a17090b3d8b00b0020d3e7f32d3mr2956900pjb.22.1667020514542;
        Fri, 28 Oct 2022 22:15:14 -0700 (PDT)
Received: from localhost.localdomain ([59.92.103.167])
        by smtp.gmail.com with ESMTPSA id f5-20020a170902ce8500b0017e9b820a1asm363150plg.100.2022.10.28.22.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 22:15:13 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 02/12] arm64: dts: qcom: sc8280xp-pmics: Add temp alarm for PM8280_{1/2} PMICs
Date:   Sat, 29 Oct 2022 10:44:39 +0530
Message-Id: <20221029051449.30678-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221029051449.30678-1-manivannan.sadhasivam@linaro.org>
References: <20221029051449.30678-1-manivannan.sadhasivam@linaro.org>
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

Add support for temperature alarm feature in the PM8280_{1/2} PMICs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
index 24836b6b9bbc..5de47b1434a4 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
@@ -33,6 +33,13 @@ pmc8280_1: pmic@1 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pm8280_1_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
 		pmc8280_1_gpios: gpio@8800 {
 			compatible = "qcom,pm8350-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
@@ -78,6 +85,13 @@ pmc8280_2: pmic@3 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pm8280_2_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
 		pmc8280_2_gpios: gpio@8800 {
 			compatible = "qcom,pm8350-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
-- 
2.25.1

