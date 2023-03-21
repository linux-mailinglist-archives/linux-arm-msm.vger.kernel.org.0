Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE67D6C39AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 20:01:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbjCUTBn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 15:01:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230316AbjCUTBk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 15:01:40 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F271456152
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 12:01:37 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id j3-20020a17090adc8300b0023d09aea4a6so21314903pjv.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 12:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679425297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/f1KlYJ1sj6omoytOxModx8WTmRbKolqwyODRJBsN4=;
        b=YZB6+Kx7qsGOCcFh4UhaD0KElckR9bAVGI388CvWoghfHmg7uTUverbSwhR2WbnDwl
         kEvptIV3V3RZRTyN6WJZa7Pk8ReVUwYBrkLUpB5Mms9gd+Lgug3h72GJxiXyoGLAQPb3
         qzAgWEofeVB1v0HqCtL0a0lNypQM3eIlOJTFJZDkpLdU+NE1BzCFoY5lLbQewd+cPL/f
         IaXLHTkv01KlLw5VchxNzCttFd2snWUTX9nrp2rQToqyzu87w0vmRrypt2MPR5zfKOw2
         wZ4qeXBjjfCAx+qS2+aeSznsu2nsVHnul4Dhihf7mafo7M23iMtl8xGvby+xVtafyHJq
         G2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679425297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/f1KlYJ1sj6omoytOxModx8WTmRbKolqwyODRJBsN4=;
        b=gYyxYmea9wCcNAbpe8z9ItMbAduCHwJ4EmYJdTG6ftnKwW03WlWI9G7HG0msgFAPLM
         BAJsgrORt4JrC/Sh8zepIJ8cANaRnMsEM9Xv8MZ7S0JzpJTBv3Y4X4vy/TB1hnNoVFdr
         +aXuLmQOJXPgYrXZR0eR5h1rs/A+cXYUxr1eZ69SezBg9FNOy5GptWbsQ0hjXWaIDmnM
         zswtn5kjSiN25uVuUnSsOe1ic/ZqUXxMAtodOnw0pzr/UeDww+qYz6qHsv7uuA5AwXDO
         mkbvBme3z+twPffv4nRBicgDyxJZLFluS42tMp/HKzDlaD6p/u3M6njIxe3fA/WD2lCb
         pPZw==
X-Gm-Message-State: AO0yUKV+qhoLVvkIze+NXxn5U+HHpuagvoCquaXINNjjAkD/xMQmJjzo
        tcMGHqn1qns1xMI246EeGpSFenbjLG0RX2IDNl8=
X-Google-Smtp-Source: AK7set9t/MBtRLcrC+6D/IIJpj1Fg8yNrqriHbRkqTTwBQAYbbILtPA18Wls9NXh8FR9zd21ZHrzKA==
X-Received: by 2002:a17:902:e881:b0:1a0:67b1:a777 with SMTP id w1-20020a170902e88100b001a067b1a777mr104894plg.61.1679425297304;
        Tue, 21 Mar 2023 12:01:37 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:d4c3:8671:83c0:33ae:5a96])
        by smtp.gmail.com with ESMTPSA id v9-20020a1709028d8900b001964c8164aasm9043453plo.129.2023.03.21.12.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 12:01:37 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org
Subject: [PATCH 2/5] arm64: dts: qcom: sm6115: Add Crypto Engine support
Date:   Wed, 22 Mar 2023 00:31:15 +0530
Message-Id: <20230321190118.3327360-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230321190118.3327360-1-bhupesh.sharma@linaro.org>
References: <20230321190118.3327360-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add crypto engine (CE) and CE BAM related nodes and definitions to
'sm6115.dtsi'.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index c56738633431..b2d2cdde41fa 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -664,6 +664,32 @@ usb_1_hsphy: phy@1613000 {
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
+			iommus = <&apps_smmu 0x84 0x11>,
+				 <&apps_smmu 0x86 0x11>,
+				 <&apps_smmu 0x94 0x11>,
+				 <&apps_smmu 0x96 0x11>;
+		};
+
+		crypto: crypto@1b3a000 {
+			compatible = "qcom,sm6115-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0x0 0x01b3a000 0x0 0x6000>;
+			dmas = <&cryptobam 6>, <&cryptobam 7>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x84 0x11>,
+				 <&apps_smmu 0x86 0x11>,
+				 <&apps_smmu 0x94 0x11>,
+				 <&apps_smmu 0x96 0x11>;
+		};
+
 		qfprom@1b40000 {
 			compatible = "qcom,sm6115-qfprom", "qcom,qfprom";
 			reg = <0x0 0x01b40000 0x0 0x7000>;
-- 
2.38.1

