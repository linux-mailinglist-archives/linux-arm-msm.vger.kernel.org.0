Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 803D4658BB6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 11:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232967AbiL2KcT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 05:32:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232749AbiL2KcS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 05:32:18 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A43AF95A3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 02:32:17 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 1so26965422lfz.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 02:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qjoW8U49t0MENbj+T08nhJ9chgSRAiBnlKUnJphbMdo=;
        b=Szgo241JMMmrAzd+ZeXQ3nqtyB/LkaZdbVAVyNiKThaG4REZRdvFcrotRSVRAltFvY
         O/CTiJznC6GaWA30ykgrD+xWB8/h4K5Cvbvbfhwor7292buyK9rKvzIjkOTuJ947hLch
         oEDbIGyGKbdHRLSfN4yHmfCmBuPSFXOiXm0fBL+WqNQLeGPtcxU4an8jIR4Afsc3fghZ
         VPFQ2w81zQiiPxBnQdY70dqKxhiVnK+j9FdVon+pJ3kXouifkwQdPC6f8TXKuljfDCEn
         naiJgueBA17GkPGkm9QMGe/1Aszkf3ou7SLnNrY9u2A+WTmuF3rZK4Dp2whn9XDvvkSK
         WMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qjoW8U49t0MENbj+T08nhJ9chgSRAiBnlKUnJphbMdo=;
        b=HN1qOwMMOls23uG/rLRzzi96xAA34TJP5rMBULDYrJtKF7mInUNj2iJGTyhnSccQc9
         lj+w47WinJ9LvGwqz1ZCCyC/J/0wRbvBBabf0O0I/iMOLr7OejgEmAJLLqjDH3iREmtw
         NH1M34zvl3BGod2Jpw9cXS8MRcYi5AeE+OvzINCmYugMgkeHfi+zp2HXlHk2YvO5PNFr
         NbqejcuFTiFnSc2vEAqXWGbXG65dYGPHgmxO8iSi5VGihBjCOMiGBistHB5NB+wpiEOJ
         xUnzlQVLfZtdxQDO3xfGnfMb1hjHZlemIJFEEKmKEbVzqPSvoOPsj/7Vw3DiiHlOw/AU
         bhVg==
X-Gm-Message-State: AFqh2kpfx/fza+0X0RRDhs0gzKBqScZSxr8wk6+KnOq9p9EnXjVxwpyT
        ch8o5eS9zXy55mqmit5gO/R9ikirBUKrfDuc
X-Google-Smtp-Source: AMrXdXsBeG33ksyx7B4mMZnu32t/Tctr7VcZlHsIPF/KpdmaLijkyawcxzzmYxi1T2mqhDhOR3MfDA==
X-Received: by 2002:a05:6512:3d9e:b0:4b5:5efe:966e with SMTP id k30-20020a0565123d9e00b004b55efe966emr10416789lfv.15.1672309935791;
        Thu, 29 Dec 2022 02:32:15 -0800 (PST)
Received: from localhost.localdomain (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id m1-20020a056512114100b004a478c2f4desm2993526lfg.163.2022.12.29.02.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 02:32:15 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] arm64: dts: qcom: sm8450: add spmi node
Date:   Thu, 29 Dec 2022 11:32:06 +0100
Message-Id: <20221229103212.984324-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
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

From: Vinod Koul <vkoul@kernel.org>

Add the spmi bus as found in the SM8450 SoC

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
[Konrad: 0x0 -> 0, move #cells down, make reg-names a vertical list]
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v1 -> v2:
No changes

 arch/arm64/boot/dts/qcom/sm8450.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 570475040d95..b9b59c5223eb 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2715,6 +2715,28 @@ aoss_qmp: power-controller@c300000 {
 			#clock-cells = <0>;
 		};
 
+		spmi_bus: spmi@c42d000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0 0x0c400000 0 0x00003000>,
+			      <0 0x0c500000 0 0x00400000>,
+			      <0 0x0c440000 0 0x00080000>,
+			      <0 0x0c4c0000 0 0x00010000>,
+			      <0 0x0c42d000 0 0x00010000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr",
+				    "intr",
+				    "cnfg";
+			interrupt-names = "periph_irq";
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		ipcc: mailbox@ed18000 {
 			compatible = "qcom,sm8450-ipcc", "qcom,ipcc";
 			reg = <0 0x0ed18000 0 0x1000>;
-- 
2.39.0

