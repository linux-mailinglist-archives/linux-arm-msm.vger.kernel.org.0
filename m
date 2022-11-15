Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94387629650
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 11:51:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238101AbiKOKvk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 05:51:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238363AbiKOKvD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 05:51:03 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BF822611D
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 02:50:49 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id d20so16949768ljc.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 02:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sSBSF/sLpzI/Q4uji6qv4fnRpsWHHEYH7VX7xCQV1hQ=;
        b=HYK9HvRbP60CIuuRaLIDzaSSks6Wu1g4XI1qLGK9+HilOmiHWsnl7nylhQgtvjjuEM
         W60kGGA16/FydnJgRFu9snDzo5zvqk756QsRKMd1b4s5SHcojLHQDT/LacJvNNmeC/2P
         yXKzAoR3R3PnSsQ3BEGWuF3hhJ9uay8VJArf5jCzTN1KJOOHTtiBqiJulmotfFwYi5aU
         S4wgsvZzw/K/MsB7riUf/+U7z1wKQ/0CYATzRCQgajPiDd2WwgudFabccAQ58I9P6wAy
         ldsXbTmjmODj0tsfj9ucuUxK2T/V56Bx/M1HlAic4owoTJOfpavKebVmbb/iEgL0WurC
         wWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sSBSF/sLpzI/Q4uji6qv4fnRpsWHHEYH7VX7xCQV1hQ=;
        b=Q5YIIurIqTk/VGfw2YuDIIGqDHx7KURYlz8V7J8OhgDY/kYaXa1C2HssYqNDYfytkk
         bBQO0OnNY920lnxBqfUgkP/VPdnayQwTnR/fLq8JgcHUlE489sjwADdXf1VjfY8kv+PG
         04JBF0LeVwbUVjVXHd+luhLPvBOAxhsNWmnnL7LyueG4+dx6siXATVsac7OBb7wgjB+a
         GQVMXR/mFedKshdgVbtOSOA/xlymvlXLv5wdrxb91D0O//quvmttNFytPNgDX16XyGoi
         1MMa9jEBUOT32e2PjUAy2z6LEA7PZealrrRTaPLiE3sLJBbn70qT9MkZYmpOjcyHywMt
         +c5A==
X-Gm-Message-State: ANoB5pmB763f1jW5ujYsg/HctrjxUJVsCvk6OhLktzPvEf+PFfLlTEt+
        vDfPjv5AtpSTajP1s0SW1Kp8Cw==
X-Google-Smtp-Source: AA0mqf6g1sH4Ba+C806ZOBv8EX46tw1RtamEfRi0Kslwl39+IvyurKavAULu4iR8NnmYNpHV/SOF8Q==
X-Received: by 2002:a2e:9d0a:0:b0:277:7c4:6c49 with SMTP id t10-20020a2e9d0a000000b0027707c46c49mr6156444lji.276.1668509447492;
        Tue, 15 Nov 2022 02:50:47 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f5-20020a05651c03c500b002777a07f48esm2469418ljp.12.2022.11.15.02.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 02:50:47 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: trim addresses to 8 digits
Date:   Tue, 15 Nov 2022 11:50:46 +0100
Message-Id: <20221115105046.95254-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Hex numbers in addresses and sizes should be rather eight digits, not
nine.  Drop leading zeros.  No functional change (same DTB).

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 552c0da3c479..49db223a0777 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2222,7 +2222,7 @@ compute-cb@3 {
 
 		cdsp: remoteproc@98900000 {
 			compatible = "qcom,sm8350-cdsp-pas";
-			reg = <0 0x098900000 0 0x1400000>;
+			reg = <0 0x98900000 0 0x1400000>;
 
 			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_LEVEL_HIGH>,
 					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 19a0f5033cc9..f20db5456765 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2091,7 +2091,7 @@ compute-cb@3 {
 
 		remoteproc_adsp: remoteproc@30000000 {
 			compatible = "qcom,sm8450-adsp-pas";
-			reg = <0 0x030000000 0 0x100>;
+			reg = <0 0x30000000 0 0x100>;
 
 			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
@@ -2157,7 +2157,7 @@ compute-cb@5 {
 
 		remoteproc_cdsp: remoteproc@32300000 {
 			compatible = "qcom,sm8450-cdsp-pas";
-			reg = <0 0x032300000 0 0x1400000>;
+			reg = <0 0x32300000 0 0x1400000>;
 
 			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
-- 
2.34.1

