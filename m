Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4258B665B63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 13:30:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232469AbjAKMan (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 07:30:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232976AbjAKMa2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 07:30:28 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEBE13895
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 04:30:26 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id y5so11288125pfe.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 04:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUBhq6gDwIZT95NIs8306ERf1NfWP566N/5jgccgjik=;
        b=gpkiR1z4I+KOuHdaHilhRu5VCtC51kivd5GKp//dSEGu5DwZiH4SAFcM7NzqrIh1JF
         Z/ArtivzRkvhOVxaXS1VSZ8HBpMjHz/KQF0EWbFUCwYhAGaxy1jgByeZUWH7TfwFXAyd
         FOMJ+ImDvD5Vv+a4mrvm1jvtv+gjptCASHJpOZ5G1oQmb945slLCChIZBc4v/pPmBvIe
         uG6yC/nKHZ0C6N0/HecAf+fxgjk2UejEH1lqcTGXJVvEsTE8Mura07pRZVJdvMl7wX6E
         yJEUp8pA6o5KXZ0fSE7nB1e12AaH+AjpC6XUHpZ1bOc4qIZ8Pa5xy4VKNlosnV3n6uxJ
         jjww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUBhq6gDwIZT95NIs8306ERf1NfWP566N/5jgccgjik=;
        b=u58ViOK7Xmlei2xm+wmD0WpyawMwuVSCBE2sTX5EBuhCM2473b0t3MlMtQ9A8rBNXO
         1psM80SrDWjuyvqcn91nc9rYJAST5Li+zrJ9bGQY3zcN1DQOFhL0FX6weUCjqGX2/kDR
         lcUQu37l43Vh1F60LBkxrBjKKK96Mk5iH9dOMKaz5BCmX6jWnZvBuToNk1ZQH9GLFF5P
         VmDdCzzpxBVJUWPFu9Ri+za9/TTECPBtc1IBSj1YPm09x2wqfbiq3lMnaLZzyxRD1f0V
         vi7/M6DQzREbVZgB2AN8GXA6hhb1zFe9Beld+qg7hjhKyd9DaIPlsVmO8NH37ccjXBCi
         lMdg==
X-Gm-Message-State: AFqh2kpiTNHSGgHMR+N05vWHW2mdhugQwAj31IPaGaTlRgTdewMeXdBF
        rAyXr7ACH9xB6y1Chg/HKsXg
X-Google-Smtp-Source: AMrXdXuk2tFmgf8IGHH8e6xsf8DemGt04XaOt1fpa8Kz8SzpJugkztdcodDwZgpBv6K3oXTrSW0GZg==
X-Received: by 2002:a62:6001:0:b0:582:33b4:4c57 with SMTP id u1-20020a626001000000b0058233b44c57mr2062856pfb.33.1673440226258;
        Wed, 11 Jan 2023 04:30:26 -0800 (PST)
Received: from localhost.localdomain ([117.217.177.1])
        by smtp.gmail.com with ESMTPSA id c15-20020aa7952f000000b005747b59fc54sm8719594pfp.172.2023.01.11.04.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 04:30:25 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     bhelgaas@google.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        lpieralisi@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH 2/2] arm64: dts: qcom: sm8450: Allow both GIC-ITS and internal MSI controller
Date:   Wed, 11 Jan 2023 18:00:04 +0530
Message-Id: <20230111123004.21048-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230111123004.21048-1-manivannan.sadhasivam@linaro.org>
References: <20230111123004.21048-1-manivannan.sadhasivam@linaro.org>
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

The devicetree should specify both MSI implementations and the OS/driver
should choose the one based on the platform requirements. Currently, Linux
DWC driver will choose GIC-ITS over the internal MSI controller.

Fixes: a11bbf6adef4 ("arm64: dts: qcom: sm8450: Use GIC-ITS for PCIe0 and PCIe1")
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index c4dd5838fac6..442b7be10858 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -1740,6 +1740,9 @@ pcie0: pci@1c00000 {
 			msi-map = <0x0 &gic_its 0x5981 0x1>,
 				  <0x100 &gic_its 0x5980 0x1>;
 			msi-map-mask = <0xff00>;
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi";
+			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
 			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
 					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
@@ -1853,6 +1856,9 @@ pcie1: pci@1c08000 {
 			msi-map = <0x0 &gic_its 0x5a01 0x1>,
 				  <0x100 &gic_its 0x5a00 0x1>;
 			msi-map-mask = <0xff00>;
+			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi";
+			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
 			interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
 					<0 0 0 2 &intc 0 0 0 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-- 
2.25.1

