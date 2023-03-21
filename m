Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66C966C39BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 20:02:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbjCUTCR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 15:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbjCUTCG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 15:02:06 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5244F5615E
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 12:01:52 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id w4so8994659plg.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 12:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679425311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRSyezpsA/5MPMXpkL0qmxlQpxlVtCBZd4yM2HAk9OA=;
        b=XdWS0wBdxLITpiS+chZm91jPxIc6HduEnOERlKtXXabZiNKLX5wZCWg75H/R4Ipt2G
         OCTDDPD6szBHEJjUefEGvyofsrm8rNANbHB8b9XpbsSBrZ3XebAcQ+gpqgc2M15ylFce
         XtWBMwQSb2uzqLI4/N6UZ6grcZdAkh283RChSLi+9aVF9m7iFN0ExYS9hfOmMq/qf0jZ
         dc64CtkDqlZ1n8qTmFLBlxVczdx0ZUno6W8RjC+z3TbUZ+oxH3IY7BxWale7V6+ZRHTK
         le5kbsG0qhGZqNvTNRkY7TYt/uwO/evsm/YrozLFKbkkWr8TbuVaRGSONGoNgI33Dnkh
         t8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679425311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRSyezpsA/5MPMXpkL0qmxlQpxlVtCBZd4yM2HAk9OA=;
        b=EB+8IvWCAwbxa699IJvU7d3vYGGrypGgICEqdHOgxpIkVmSWJmJAvRQbFcniedJ17q
         7ttnunsb9fzxDVXYQ5q7EAGONYCDbQ1wI6odCxXi5uX8M4z4kpJ4U/mwvZYlPCnqmNLJ
         rDe3DEqlkvdgWYK2T42Ukdx9E7gAINKPjA2TndYcusQoHP3etLB/7FEORqA8rcTxhcrG
         hNzyAakX/k0xpno6qmZCFzALGG1fwjILvaKpgggxjdW1HrjbDb3Ojs6QaB1y63S4x5lM
         I4UQ3iKzlRSKjg3PpEgWY4xVk5dsYIdcOSYmPvqJs27OiFwPgXjjnaXQlt8GHA+n0i7u
         kSDg==
X-Gm-Message-State: AO0yUKUyP/VBivMcaGtligZxhQ6+yREnl7BI4IiZZFNafz7pOk+01ffp
        4D24O+DEqeGdSyQ649/HqRBNhyZoguWxzKEkKwA=
X-Google-Smtp-Source: AK7set92lLEuVEiMisk8/j/vcnrmnGYW+efsTxYStkvNp4Edk3lJBjAX0H8nxnNqVImR+2fj93nfuQ==
X-Received: by 2002:a17:90b:3b84:b0:23f:63d5:c10f with SMTP id pc4-20020a17090b3b8400b0023f63d5c10fmr660178pjb.25.1679425310756;
        Tue, 21 Mar 2023 12:01:50 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:d4c3:8671:83c0:33ae:5a96])
        by smtp.gmail.com with ESMTPSA id v9-20020a1709028d8900b001964c8164aasm9043453plo.129.2023.03.21.12.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 12:01:50 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org
Subject: [PATCH 5/5] arm64: dts: qcom: sm8350: Add Crypto Engine support
Date:   Wed, 22 Mar 2023 00:31:18 +0530
Message-Id: <20230321190118.3327360-6-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230321190118.3327360-1-bhupesh.sharma@linaro.org>
References: <20230321190118.3327360-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add crypto engine (CE) and CE BAM related nodes and definitions to
'sm8350.dtsi'.

Co-developed-by and Signed-off-by: Robert Foss <rfoss@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index b2f1ea4b671e..d017a0a11fcb 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1730,6 +1730,32 @@ ufs_mem_phy_lanes: phy@1d87400 {
 			};
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0 0x01dc4000 0 0x24000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			iommus = <&apps_smmu 0x584 0x0011>,
+				 <&apps_smmu 0x586 0x0011>,
+				 <&apps_smmu 0x594 0x0011>,
+				 <&apps_smmu 0x596 0x0011>;
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,sm8350-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0 0x01dfa000 0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x584 0x0011>,
+				 <&apps_smmu 0x586 0x0011>,
+				 <&apps_smmu 0x594 0x0011>,
+				 <&apps_smmu 0x596 0x0011>;
+			interconnects = <&aggre2_noc MASTER_CRYPTO &mc_virt SLAVE_EBI1>;
+			interconnect-names = "memory";
+		};
+
 		ipa: ipa@1e40000 {
 			compatible = "qcom,sm8350-ipa";
 
-- 
2.38.1

