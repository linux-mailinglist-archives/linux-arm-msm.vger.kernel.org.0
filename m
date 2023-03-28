Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA3AE6CBADF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Mar 2023 11:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232893AbjC1Jap (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 05:30:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232844AbjC1JaD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 05:30:03 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D9656A66
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 02:29:08 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id z10so6798798pgr.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 02:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679995747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9oFHBwDflAuoBx3nAvQZJqLFUNje4jYksqgr3MUJ8Rg=;
        b=StsbH33A0Z//LD07mPIP8zFLStHzWcZyoorzQYE4OzFziUz5oL9ZOpoedu+0PiAAiH
         EjAadapaZFYB1gfC+2mOoTix9LKyhg8E4Clrdwi6CjVjg6dr3rAJzxP0j5wZtdeujy9z
         OwJO5gR0n4dgsfLmI2sA+ySKVv3XQYoxUPTcc98HsN/4CLCqI9t65qqMsVkHmQ16syvS
         aBmgFUmDUSIdtsJZWE518O5gniNkVzkyi88XnxuslaQgiIZsPcG7AbFP/h3fIrz+KZ24
         y/OcGXDUSX9y4efG5dLn6z9pxEygzfgFGqAs5PJsaQ7Cb9BcT6roucQ2yPLj6hz36pBL
         PyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679995747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9oFHBwDflAuoBx3nAvQZJqLFUNje4jYksqgr3MUJ8Rg=;
        b=Nxw2kATEqLNg6qGuI0DIUmtd+6m+801TlyTUaaaHVw8zRuS8xld1XUE/kU0FoK8ep9
         oDGOBjV+U3J3c8O4lLH5fNhxhCbFpPmy255JlVepy9VuwIfjeBB6ZaUZC8Hp4n0D4Qhu
         Aou9up7LagLJzU7FlWfvEB0rMPX9DZsFannn8QjWiFXmKKivdii062aEDeumXXO+UWbp
         A8GrMdrtkYadJKKDPx/Ausd91yYybZnKRFRrIZ0AhOmmRcrS9fSbbzO2U/PhKqSk72PM
         0eJs2+7QhQzZjUa86gyj/WcRtrNZW9X3vCGefTJ8c1a+b5BZjG7OnpreBS/4bCYacDRD
         kGjA==
X-Gm-Message-State: AAQBX9dQDQtOgOQX/uVfZCVC/iKuIs1JmnDrAIW8ag0ek8Xsj4yoA/pa
        P1WUY3owy1zegUJAwI+GTfTVobHfCNZ41d7swMo=
X-Google-Smtp-Source: AKy350aa3V6HXe2gvRLn5hs80i9QJDxGwIBrCU0AW1gwNvwpm/+xdIz0ON0Ao1HnOMhqZAf5lkxdPw==
X-Received: by 2002:aa7:99d2:0:b0:626:7c43:7cb8 with SMTP id v18-20020aa799d2000000b006267c437cb8mr14611382pfi.20.1679995747407;
        Tue, 28 Mar 2023 02:29:07 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c61:449a:10df:e7c1:9bdd:74f0])
        by smtp.gmail.com with ESMTPSA id a24-20020aa78658000000b005a8bc11d259sm21261518pfo.141.2023.03.28.02.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 02:29:07 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org, neil.armstrong@linaro.org
Subject: [PATCH v3 9/9] arm64: dts: qcom: sm8450: add crypto nodes
Date:   Tue, 28 Mar 2023 14:58:15 +0530
Message-Id: <20230328092815.292665-10-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230328092815.292665-1-bhupesh.sharma@linaro.org>
References: <20230328092815.292665-1-bhupesh.sharma@linaro.org>
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

From: Neil Armstrong <neil.armstrong@linaro.org>

Add crypto engine (CE) and CE BAM related nodes and definitions
for the SM8450 SoC.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
[Bhupesh: Corrected the compatible list]
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 31877f18dce2..d7a28cac4f47 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4146,6 +4146,34 @@ ufs_mem_phy_lanes: phy@1d87400 {
 			};
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0 0x01dc4000 0 0x28000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			iommus = <&apps_smmu 0x584 0x11>,
+				 <&apps_smmu 0x588 0x0>,
+				 <&apps_smmu 0x598 0x5>,
+				 <&apps_smmu 0x59a 0x0>,
+				 <&apps_smmu 0x59f 0x0>;
+		};
+
+		crypto: crypto@1de0000 {
+			compatible = "qcom,sm8450-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0 0x01dfa000 0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x584 0x11>,
+				 <&apps_smmu 0x588 0x0>,
+				 <&apps_smmu 0x598 0x5>,
+				 <&apps_smmu 0x59a 0x0>,
+				 <&apps_smmu 0x59f 0x0>;
+			interconnects = <&aggre2_noc MASTER_CRYPTO 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "memory";
+		};
+
 		sdhc_2: mmc@8804000 {
 			compatible = "qcom,sm8450-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0 0x08804000 0 0x1000>;
-- 
2.38.1

