Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 954C46C4992
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 12:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230372AbjCVLrT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 07:47:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbjCVLqz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 07:46:55 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC5060D6E
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 04:46:23 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id qe8-20020a17090b4f8800b0023f07253a2cso18841761pjb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 04:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679485582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGb3BIQsyUNL1+BgFa8yu/K6OVQSXWMJMp42ClXNo3w=;
        b=qivrf3cVu8WgCYcV3RRjSXa3JDpbSbJwgsIyAGATk1QVxCl+JdpHhfMVBAsQi/JHbP
         Gsc38pRrGVopn+W5jf62e6KcU30cTBbra+Z7fdqrcSqf+Hb2l3TY7YMGm3D8L4FmE9NM
         QM5VUpA0j9LtQJjuLrbtl+iMW9I+pQWgyyRSSfubRfV5rPXxwESd0hYO8IS+uVcucpG9
         DYeaiXkKuKDlibTuhSXf9Ty0IRbX5yaz2b3A8o3t5qHSmap5SJ6eppyotTxO7/QHnWFo
         I0BbunXYQyfnyowMIywHHuDp/1/60s343dY+DVmKaSUVu347mTMRNf9RkIABjGLy7B37
         BGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679485582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dGb3BIQsyUNL1+BgFa8yu/K6OVQSXWMJMp42ClXNo3w=;
        b=s4bP4EiDiF0gAhezyIPZr2xy+/+L3RkeFYjeJfNrwwvZc5ZiMHiYPtFmi7eBKjkFBl
         U0U3QNpHDJrEPoVYhlYKzulxGDKYMcJHhOkhvDLiohVu6HDw3pblGGVKBHO0kPkd8uv7
         BZprEInU6RlUb7Pwi/affAWCIhs4NXlXEOQG7g7NQjdtWvNsea7hjC4NwJJ7QZ2ITbqV
         3TJaIzfIQQ5pjl2sdSj0eD/ygiIIFavYmBgy8AOGliSaU+ZkJOV/QzZKOCnV9yzLXxTF
         ovTn4Dxy2nXTOnNk3ncVA+8jqd8aW8Vah5pefQP9EuPSXx60UJx2njxqLAldswxMiigC
         zIfQ==
X-Gm-Message-State: AO0yUKX5ubgfRdUhUM2Vl8e8u9iVzQby+8OJ/KK2vAeTUwi8xjHHQM0B
        es/LMvZU6bc83SoyA6r4U22JNRjv1GOGpfACUvg=
X-Google-Smtp-Source: AK7set9KvFvCmxihb0yEPnk5v2IjyDopshZ1tR4NTJsWxnuXPlvyg5TXwVG6e/KkXEs+jGsHaiOisw==
X-Received: by 2002:a17:903:27c4:b0:19e:8088:b852 with SMTP id km4-20020a17090327c400b0019e8088b852mr2282952plb.10.1679485582557;
        Wed, 22 Mar 2023 04:46:22 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:d4c3:8671:83c0:33ae:5a96])
        by smtp.gmail.com with ESMTPSA id jd1-20020a170903260100b0019b0afc24e8sm10386649plb.250.2023.03.22.04.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 04:46:22 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org, neil.armstrong@linaro.org
Subject: [PATCH v2 10/10] arm64: dts: qcom: sm8450: add crypto nodes
Date:   Wed, 22 Mar 2023 17:15:19 +0530
Message-Id: <20230322114519.3412469-11-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230322114519.3412469-1-bhupesh.sharma@linaro.org>
References: <20230322114519.3412469-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
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
index 7c1d1464a1f8..c2b6c163ee6b 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4084,6 +4084,34 @@ ufs_mem_phy_lanes: phy@1d87400 {
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

