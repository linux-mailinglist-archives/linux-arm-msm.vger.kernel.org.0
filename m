Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE9CB6D261C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 18:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232970AbjCaQrH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Mar 2023 12:47:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232119AbjCaQq1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Mar 2023 12:46:27 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F530236B2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 09:44:28 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id iw3so21771440plb.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 09:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680281064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9oFHBwDflAuoBx3nAvQZJqLFUNje4jYksqgr3MUJ8Rg=;
        b=il3cTrMbr5JNkWMDf/06GZqg3tgIq0sGJwg2KvEEbljX+AQ0HVXtv+TmdGc9Ez4Tcl
         SRpgTWmfSEcz9F9gONJV43wEI+M7i5eJDK/SGFKUwzGz7fIyhJ2z5E6Bx2PVLT6fGHE5
         90ZGyGe8uFxDDws8xQx5mfFFBzSfjuOrWWAOGvKA9gAcaTAFuQ2SQt/2jv++uGt1O+DZ
         sn13tRafhaqPlvhCJPVX3nwLM1kEQqkO6Y45OXgNrduoYgrNZfRVEAK3pHUdonbtyHvY
         aLPkVwxudSj3zXVR4fgY4JMMZlvN/GIWSiWA6lo+noRv/zeKLxdVqCUZ2ZlkZkOMUe/i
         aBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680281064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9oFHBwDflAuoBx3nAvQZJqLFUNje4jYksqgr3MUJ8Rg=;
        b=W9WwnN2o2fSbSm0hgBNhh5UOIn19ov7tYphjtmzuefvz/EOe7ONzy3hEgukuomqU0/
         IkLocaM3Wcdj9prNiXepM+AZL+7lHDDd1hBmbmw4WnPOZ+/rcHI4835ARJK9hjhQOuwl
         XwKSuYGbkRK5Hzt19kA+EGdKG+cOv0UOfTbC8YjOv4qH2XRE8tzuKfqyAm8xWn3vCHrY
         M9OwGRbeh3lAmI33Totxh+tR/OrWlADuaQR8eFNqDrhY3etu34+0EWjMm9kbdBfPNNi4
         BpjoVzRMOHTZrlBae++VAwm85d1G0BxWmsGhM4v8C8+qn3kqL+Ea/qSVse45KP5dbChI
         MJAg==
X-Gm-Message-State: AAQBX9f8aM7BeAU33mRKbFMEDJ4DcCfAtyluuri83xJjR9JbPGHej5lb
        azT4HapzBh5sgGjcDckVaK6bVTXyHF2/wxfQatE=
X-Google-Smtp-Source: AKy350az2m8ukvlx0xv24TkXLrJ+E8amqHcOA4VfZ/exIUOmE+EYOKV0M/EQ2yRGMgccir6UdTTSKA==
X-Received: by 2002:a17:902:f983:b0:1a0:50bd:31aa with SMTP id ky3-20020a170902f98300b001a050bd31aamr23244015plb.66.1680281064724;
        Fri, 31 Mar 2023 09:44:24 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c5e:53ce:1f39:30a5:d20f:f205])
        by smtp.gmail.com with ESMTPSA id x13-20020a170902b40d00b0019b089bc8d7sm1798767plr.78.2023.03.31.09.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 09:44:24 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org, neil.armstrong@linaro.org
Subject: [PATCH v4 11/11] arm64: dts: qcom: sm8450: add crypto nodes
Date:   Fri, 31 Mar 2023 22:13:23 +0530
Message-Id: <20230331164323.729093-12-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230331164323.729093-1-bhupesh.sharma@linaro.org>
References: <20230331164323.729093-1-bhupesh.sharma@linaro.org>
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

