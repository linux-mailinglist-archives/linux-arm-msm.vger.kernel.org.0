Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC5961F6C2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 15:56:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232634AbiKGOz6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 09:55:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232584AbiKGOzy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 09:55:54 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 890511DDD6
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 06:55:33 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id a67so17940949edf.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 06:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dldDZ70y+b7MDohQcfrDCQaQZYKlYYCAp1iwtrwncm4=;
        b=c8LaljHJTFpjiwPHR5pIY/tnWXKbry/2yhYp8PA1JzTGOrVz2kGQt4oK1Qpd23dvx1
         oXVII7AAo/+UeVMuyswE9pIvuwB8yBX+0gw61WPJUjG7l9ZpOtmrgxZ/BzLxMTeyo5G8
         cCNUsjCLjrCXuTqT6LAN3HwnvWliMgr49n5XI+ba+RnXLj8OflaI5Sv7mQYF7T1oS3mt
         jXXiuep+NK1OConxgiqNRaTLaLh/da/UCAXgoIn1KVJZ9RZsv2wORFzKKp2F7lWRFsKC
         7HvbYdHvv8Ile1kOUEKsO+7KC/uFQ6fpUDicMie7nLtKs1F06PtNJijQfPNIB87La2EW
         amSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dldDZ70y+b7MDohQcfrDCQaQZYKlYYCAp1iwtrwncm4=;
        b=lztXza03+B7BXVdz1yFVlR3X7sjJVng0DXkJ6vuKiOV6TFobhCVgFaiqGVYPh9bsy5
         dLDzG4gyebMmXoX6DCEjBVJDE1k+C5BrBTQulhAZYjdQuEA8+YavU4hgHKp6YPxf1WCr
         1qyZAUBN7rByA1RrTk/sHKoX72psfqXM5c0CbRlK5RDcNVytjy3Yg2mYXTgYTxtG08g3
         IF6NGHfG+2T7sBznvI9A62cpQ6Q8N+26KPUdck/qGe2d31dpM4gUk3+MqDAXXvh/s3qh
         wnh2Cg5UBRBFIz8fcU2J91hnJIt5WdVSnu1RWtZWeVuTkCa4GFKNW82qUNlvfLMnTQbu
         qj7g==
X-Gm-Message-State: ACrzQf3tAnPA4C1kjrbkIPWR+3gLXSLBktBmz2x3EIhGUYZNVkv5kOb5
        2R7SlrUkRheihxcsSgAVnYuSODpEBuEpOg1g
X-Google-Smtp-Source: AMsMyM7GgFItfIygRdsrLmX45sXTgEQvDsF/o1ZbLxFCJZ/6P8S2koOYrWwPfusQdTSxZ8l/vaqx/Q==
X-Received: by 2002:aa7:d710:0:b0:463:bd7b:2b44 with SMTP id t16-20020aa7d710000000b00463bd7b2b44mr34682459edq.385.1667832931798;
        Mon, 07 Nov 2022 06:55:31 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id d1-20020a1709067f0100b0078907275a44sm3503049ejr.42.2022.11.07.06.55.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Nov 2022 06:55:31 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 03/11] arm64: dts: qcom: msm8953: Fix up comments
Date:   Mon,  7 Nov 2022 15:55:13 +0100
Message-Id: <20221107145522.6706-4-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20221107145522.6706-1-konrad.dybcio@linaro.org>
References: <20221107145522.6706-1-konrad.dybcio@linaro.org>
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

Switch '//' comments to C-style /* */ and fix up the contents of some.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index f2ff18ac9141..32349174c4bd 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -948,21 +948,21 @@ apps_iommu: iommu@1e00000 {
 			#iommu-cells = <1>;
 			#size-cells = <1>;
 
-			// vfe
+			/* VFE */
 			iommu-ctx@14000 {
 				compatible = "qcom,msm-iommu-v1-ns";
 				reg = <0x14000 0x1000>;
 				interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			// mdp_0
+			/* MDP_0 */
 			iommu-ctx@15000 {
 				compatible = "qcom,msm-iommu-v1-ns";
 				reg = <0x15000 0x1000>;
 				interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			// venus_ns
+			/* VENUS_NS */
 			iommu-ctx@16000 {
 				compatible = "qcom,msm-iommu-v1-ns";
 				reg = <0x16000 0x1000>;
-- 
2.38.1

