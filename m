Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36C1479D22D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 15:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235602AbjILNb4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Sep 2023 09:31:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235560AbjILNbz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Sep 2023 09:31:55 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52C2610D7
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Sep 2023 06:31:51 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-501bd7711e8so9742585e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Sep 2023 06:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694525509; x=1695130309; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/toa9pS9T5AtU2jODTxKlfzL37CYz7xztaxR3Kuerg=;
        b=YV5yyIKC8hN+BRA44ecdJTgtjnKOGo9U+oHjNu3u/YLzQvfIxG2mXnSP2XDV2DKybw
         uEeWXKF3tpUGf2RtHWYSEi8BTjG0XZicGZc2gmAQuiD7GsKuSF4elM4Xsi1uBk1lIamY
         SvPJOQ2NSIpO6oHJHlvKcooDW0MwLzQ8pI0Fxt4vRyrg2raDQ14L3Me6Jd93tZ4glKVd
         bSKxlr1iOc/jztozEv8irqOTU2lQqbmhHDC/ysZ82b4UZvDRqpnkpu9EPeYAal0h91ND
         CxcwAgla52RqSPZENDwbWZcGj8OORtm0IUr0G789NYPAB4MdsTMtuXUciXySA2iGOYds
         R1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694525509; x=1695130309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/toa9pS9T5AtU2jODTxKlfzL37CYz7xztaxR3Kuerg=;
        b=JkML1ZEoJQPsTQ77ltqH3VoCLrH9bzJcs3k2b3C1r+PUZ0mLytO0jfojE25G6v2DB0
         nL97N1OCzX9IkZNNI1KckQyvvlOf26rPlRdf6O6aoLrLNlDW65Gm2O1uP+FbYpCOHitw
         WlOHM+RIBms6tl3FYJDYH8MHiZdjGF1Szj7GULcoSUc8wADfpUJVVLeBOqRhMZcPoLKW
         vu9FBsra6GwIyKbM3dLlVMV5Vtf/nhqe7TK0Yv8jtzaC8bTevIS6nZDqhrv1CGJGU+nT
         LGqS3CP6uxUB3pLrXPQqzPGAvTBT+Ow+Yb8X+ZQXxj1wt+lMrTwpvUKtV3+vKctA4OFF
         yRRA==
X-Gm-Message-State: AOJu0YwyBAixXjDFNuoan4rvUDT2fcscsqzPjWKD0DEpgqe6R2RBq/I+
        WoeH9w3CHJKj0t3HUsGoJeYIaA==
X-Google-Smtp-Source: AGHT+IGn8hTha+KLDCRi6ZfKI5RJ1YE47a+fLOj8mHGCxT1o72cv98Iy58UWxa0GJ4fskuE95obAFw==
X-Received: by 2002:ac2:4bd1:0:b0:4f8:71cc:2b6e with SMTP id o17-20020ac24bd1000000b004f871cc2b6emr10936412lfq.33.1694525509563;
        Tue, 12 Sep 2023 06:31:49 -0700 (PDT)
Received: from [10.167.154.1] (178235177248.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.248])
        by smtp.gmail.com with ESMTPSA id j2-20020aa7ca42000000b0052a401d8ef6sm5983830edt.71.2023.09.12.06.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:31:49 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 12 Sep 2023 15:31:40 +0200
Subject: [PATCH v2 02/14] arm64: dts: qcom: msm8996: Drop RPM bus clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230721-topic-rpm_clk_cleanup-v2-2-1e506593b1bd@linaro.org>
References: <20230721-topic-rpm_clk_cleanup-v2-0-1e506593b1bd@linaro.org>
In-Reply-To: <20230721-topic-rpm_clk_cleanup-v2-0-1e506593b1bd@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694525501; l=2848;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=KJS+g8imvlGvy+iOWWG+njdWWumPc4ZACNA8m5X6Spw=;
 b=Vz1i6p0hf9j2AZfyi0h6+asFnDXhLuTcVphpFHzsboKbmh43+Q3f97QVxAybhbiljZYkaVDv7
 qiu98Vd34ljDH5BRsx07Tkl03XAfchJAmv5vyIew+Cd4D4i6tdRn3q/
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These clocks are now handled from within the icc framework and are
no longer registered from within the CCF. Remove them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index c8e0986425ab..acef67ab0581 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -798,9 +798,6 @@ bimc: interconnect@408000 {
 			compatible = "qcom,msm8996-bimc";
 			reg = <0x00408000 0x5a000>;
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
-				 <&rpmcc RPM_SMD_BIMC_A_CLK>;
 		};
 
 		tsens0: thermal-sensor@4a9000 {
@@ -851,18 +848,12 @@ cnoc: interconnect@500000 {
 			compatible = "qcom,msm8996-cnoc";
 			reg = <0x00500000 0x1000>;
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_CNOC_CLK>,
-				 <&rpmcc RPM_SMD_CNOC_A_CLK>;
 		};
 
 		snoc: interconnect@524000 {
 			compatible = "qcom,msm8996-snoc";
 			reg = <0x00524000 0x1c000>;
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
-				 <&rpmcc RPM_SMD_SNOC_A_CLK>;
 		};
 
 		a0noc: interconnect@543000 {
@@ -882,19 +873,14 @@ a1noc: interconnect@562000 {
 			compatible = "qcom,msm8996-a1noc";
 			reg = <0x00562000 0x5000>;
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_AGGR1_NOC_CLK>,
-				 <&rpmcc RPM_SMD_AGGR1_NOC_A_CLK>;
 		};
 
 		a2noc: interconnect@583000 {
 			compatible = "qcom,msm8996-a2noc";
 			reg = <0x00583000 0x7000>;
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a", "aggre2_ufs_axi", "ufs_axi";
-			clocks = <&rpmcc RPM_SMD_AGGR2_NOC_CLK>,
-				 <&rpmcc RPM_SMD_AGGR2_NOC_A_CLK>,
-				 <&gcc GCC_AGGRE2_UFS_AXI_CLK>,
+			clock-names = "aggre2_ufs_axi", "ufs_axi";
+			clocks = <&gcc GCC_AGGRE2_UFS_AXI_CLK>,
 				 <&gcc GCC_UFS_AXI_CLK>;
 		};
 
@@ -902,19 +888,14 @@ mnoc: interconnect@5a4000 {
 			compatible = "qcom,msm8996-mnoc";
 			reg = <0x005a4000 0x1c000>;
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a", "iface";
-			clocks = <&rpmcc RPM_SMD_MMAXI_CLK>,
-				 <&rpmcc RPM_SMD_MMAXI_A_CLK>,
-				 <&mmcc AHB_CLK_SRC>;
+			clock-names = "iface";
+			clocks = <&mmcc AHB_CLK_SRC>;
 		};
 
 		pnoc: interconnect@5c0000 {
 			compatible = "qcom,msm8996-pnoc";
 			reg = <0x005c0000 0x3000>;
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_PCNOC_CLK>,
-				 <&rpmcc RPM_SMD_PCNOC_A_CLK>;
 		};
 
 		tcsr_mutex: hwlock@740000 {

-- 
2.42.0

