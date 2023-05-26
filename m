Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6557C712D58
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 21:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236289AbjEZTYz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 15:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243985AbjEZTYW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 15:24:22 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E205B171F
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 12:24:00 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-64d18d772bdso1539710b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 12:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685129018; x=1687721018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1njn0X79ZVa4bpFpIROGKaYXKaM1KuhMVkxwXfg7gOQ=;
        b=HrGYDfvG0Xsp/A/zedL8nS5rkVVlhkW+JEy5OlneDMG/FgpWWoHBL4qqfR3sqNrAHw
         N02hyr2pY/kCoaFrrLZW33UmvPQ96h3Xx5/ILcF1jisy/CHOfgOd86RxzB14dsdsmfsd
         eKLq79NclssCpBvvUwCSydAK6IKdT8VxPP7g9gzsBStvgk4tyIfza7M3D8fc7wAggdPf
         NpZTMewKyelWDwdU0FWZf8Aij6Okk5N92xuX+jn8UEZosrGxQh7eKUknyIh0iOoVe34t
         gh5vOcoAvxV7xexxHfH0dX3T0kFUTBdWel+49SZ64pQtbnZJELkjGVSMB6ovUEBHh98t
         bRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685129018; x=1687721018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1njn0X79ZVa4bpFpIROGKaYXKaM1KuhMVkxwXfg7gOQ=;
        b=YJ2POrrfAD4frzmy79AoujJtDvZ+FJOrDyoquvOPgHMX3wrWrSbVLaN46zqPKNXdHv
         NRw5yTE9dEYGdtTmf4go4JPR5PA4cEKJcoyjvqwDNWFoKkOKirZhfZk7vUvxYF9XFJNM
         yvC3rheLn58sSOPVlEAxgPQZeJ5JoLxU3Qgsa+rq4ebnBckKCYDDmnnt7VGeQ7e+FC2l
         4c0oPiI4IygDZC1yHm1tVyWERfVOsk8bVOJvRQKUiPzz69I6TMaJIGywQ1vh1qKEhhw8
         Ifd0kot1ZZn9wCkG92DStEqKGpV+EzxrgXaKdkkXKHoR5K0ojqIpt1Fr0BDd5M/TQ3Kt
         pp2g==
X-Gm-Message-State: AC+VfDwIbdyacZ6kHIm4XGGpI8nEmczD2w53to2BMeofNMc3V7pnv/06
        d+geC+mk+kH7dhhQisioBsFZy7OS+WKIS0Zhs3w=
X-Google-Smtp-Source: ACHHUZ5x/8y9Vqs+MmpKmGon+S9SqikwtMNf3bIFaTila4wvgIZ2XbYAzpTfJLOZHFc47WEEg9bC1A==
X-Received: by 2002:a05:6a20:d493:b0:10d:3134:10d7 with SMTP id im19-20020a056a20d49300b0010d313410d7mr437546pzb.27.1685129018344;
        Fri, 26 May 2023 12:23:38 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f3a:6990:1a5c:b29f:f8cf:923c])
        by smtp.gmail.com with ESMTPSA id q18-20020a17090311d200b001b008b3dee2sm1955079plh.287.2023.05.26.12.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 12:23:38 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org, neil.armstrong@linaro.org, djakov@kernel.org,
        stephan@gerhold.net, Anders Roxell <anders.roxell@linaro.org>,
        Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH v8 11/11] arm64: dts: qcom: sm8450: add crypto nodes
Date:   Sat, 27 May 2023 00:52:10 +0530
Message-Id: <20230526192210.3146896-12-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230526192210.3146896-1-bhupesh.sharma@linaro.org>
References: <20230526192210.3146896-1-bhupesh.sharma@linaro.org>
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

From: Neil Armstrong <neil.armstrong@linaro.org>

Add crypto engine (CE) and CE BAM related nodes and definitions
for the SM8450 SoC.

Tested-by: Anders Roxell <anders.roxell@linaro.org>
Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
[Bhupesh: Corrected the compatible list]
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 7f193802a7c4..1642daea9624 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4173,6 +4173,34 @@ ufs_mem_phy_lanes: phy@1d87400 {
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

