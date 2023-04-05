Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F00CA6D7595
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 09:32:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237237AbjDEHcQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Apr 2023 03:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237168AbjDEHbr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Apr 2023 03:31:47 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B1F659DD
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Apr 2023 00:31:24 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id f6-20020a17090ac28600b0023b9bf9eb63so36422151pjt.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Apr 2023 00:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680679884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PuEDYxPh1iqRLp/0Giai1ZnY3ruEMo64qCfhktsCtAU=;
        b=ElPO4X4VI6hM3TLE2EKMn0hQnqxOq5LnXCJzh/eljphQ7I0O659V/gE47hUOQih6xG
         /0Q7tWMa2VEyuOd+Qa6NyDazjs/jrasx5a9bFXnR7BLFGayV2zn4Cwx43WxCSeQp9o9I
         VncHVpVDvSrXpnOHCdqlWm/dEN7lJL9bncJUBzjZ4jTwJKnTy898QFafyHM+P2U4O6FP
         fU+5yhJkv33XEAjfw+WgDugLQ4KbUj0aMxyH5BZG+8NetNuJmrrB+23e4ZUVoBUwPZEy
         MYiDOimhwl6Xawau8UjLZP0o1bojBJdSLH8CF9ycDs3DEV8NFVdjFotNENwbUYL+1U0/
         8Rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680679884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PuEDYxPh1iqRLp/0Giai1ZnY3ruEMo64qCfhktsCtAU=;
        b=AYUKBLtgTc7+hhp5D/LvA/LoQgPP/YGNOPKuLo5vRZnBzVe1KZISNMmvRa7cI5ie3b
         pemoJU2nYq2MyJkSVc7dM+LHmN+WZlppoWwVukz+OxtAdUBGs82JJ96zQmpE0WVplQ2K
         NcR1JYyDRXMNVZo1oxfrAGeSo+ryAOmV1DNwu59NKF1hOqj98myWgKhy3kOYoChgAsAZ
         qQ+kY7TmtkN9D46LTHwAlTpYawNmDLWRQwfD1N3WFQ04IwXgm3Js7UTJPy440aNOMRuq
         xNws9MkPji8lyBswxVjqZN5qq5YQmfu7cY9dTY2pv9WC2Z8/P4YJXtrgH4YgmbLvrCfH
         zJ7g==
X-Gm-Message-State: AAQBX9fELxlEYgjziM19kzWubHTrg/PRqRh7bUPLzg/t4DOeOyC8zxjX
        gIOAtVeZmpu6FszfYnzGnRdzb67usML3e60xkeI=
X-Google-Smtp-Source: AKy350ZcHpzY1yXapJf+wMlLTyTCZKOePfEB0tdTncnTXjBfoyo3qDlfpuKw+JsUV1N4O07I+yAz0A==
X-Received: by 2002:a05:6a20:811a:b0:d6:8c70:85ce with SMTP id g26-20020a056a20811a00b000d68c7085cemr4102017pza.54.1680679883953;
        Wed, 05 Apr 2023 00:31:23 -0700 (PDT)
Received: from localhost.localdomain ([223.233.67.41])
        by smtp.gmail.com with ESMTPSA id l7-20020a635b47000000b004facdf070d6sm8781507pgm.39.2023.04.05.00.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 00:31:23 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org, neil.armstrong@linaro.org, djakov@kernel.org
Subject: [PATCH v6 07/11] arm64: dts: qcom: sm6115: Add Crypto Engine support
Date:   Wed,  5 Apr 2023 12:58:32 +0530
Message-Id: <20230405072836.1690248-8-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405072836.1690248-1-bhupesh.sharma@linaro.org>
References: <20230405072836.1690248-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add crypto engine (CE) and CE BAM related nodes and definitions to
'sm6115.dtsi'.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 2a51c938bbcb..ebac026b4cc7 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -650,6 +650,28 @@ usb_hsphy: phy@1613000 {
 			status = "disabled";
 		};
 
+		cryptobam: dma-controller@1b04000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0x0 0x01b04000 0x0 0x24000>;
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			num-channels = <8>;
+			qcom,num-ees = <2>;
+			iommus = <&apps_smmu 0x94 0x11>,
+				 <&apps_smmu 0x96 0x11>;
+		};
+
+		crypto: crypto@1b3a000 {
+			compatible = "qcom,sm6115-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0x0 0x01b3a000 0x0 0x6000>;
+			dmas = <&cryptobam 6>, <&cryptobam 7>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x94 0x11>,
+				 <&apps_smmu 0x96 0x11>;
+		};
+
 		qfprom@1b40000 {
 			compatible = "qcom,sm6115-qfprom", "qcom,qfprom";
 			reg = <0x0 0x01b40000 0x0 0x7000>;
-- 
2.38.1

