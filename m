Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EADB75CBF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jul 2023 17:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232095AbjGUPge (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jul 2023 11:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232064AbjGUPgb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jul 2023 11:36:31 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3656D3A92
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jul 2023 08:36:18 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fb5bcb9a28so3429482e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jul 2023 08:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689953776; x=1690558576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pIlHw2ogZ0XgpyT5a2fQLp9T4Ff6liHxHgKRmU9UO68=;
        b=zy50hu4y+HXxueSAWqaioPZ/HFVq9tak5ikmr/0sSrA+Rq7AVZIzMyzn9qscOMoQqw
         zAFvVgiee9jeBgQoXpm5O0HPCLJzAFUcSOZo0z9dWjrze0gJbVdxGsUdzRmeKEK0nxZ5
         dG0POU+Ua2mBA1fCF5m9wmAJBnUfh7zURSmBoyn2A0HHCU2kfFZIAQyFl7yZ4x0EYHNk
         B8eRaHV1r7t+4Ztl9FxQzJNENo/UNoTycthj+JOKLyynaK8ocardD9swvkVahbyAcKCh
         pfkID7HYWMtOkcpyFrFd6/WYHfviDNRbfIRKMa+3EKs6DmNE7t+6oyBKPMPUfeJeleQb
         Sdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689953776; x=1690558576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIlHw2ogZ0XgpyT5a2fQLp9T4Ff6liHxHgKRmU9UO68=;
        b=Qz+ToNMlKmDIflHX1CfGaBjAk4In85Y7GxQLCHXGcCSokJsZ5BQdtjD8YWbWiIfjkC
         GDzarPM4iHHS3jTNfQcA156izQnU3xmBk2j2bShVwtoD/arR1YfSO1IlYKmIHNWxlmtS
         YSYDHv/M1V0dpeY7PDW9J1NFarYuPrSAlzstfgFsvyB9U/rGm50qtHxJQIoADW2l0m0Z
         MV/Q1eROVlT2iUOCYIAgxGHZQdcW//QrrlV/1cSrjaDG+P+OttDVY16ZTwR0HG1Ji+jV
         VKVHa4i1/ybChQtoqavnpN203s6VFIQLETZOd0oLGZv8YO0q2BYWgpBOgc1bGrWuR7Yd
         /NSw==
X-Gm-Message-State: ABy/qLaIrZ3kPPDK+JqVR6zQY7sJiaoQx1bMVIqllXmlmIs3Oa/XEQiW
        8tEYTE8+YiLk32kbdgvDF80iWA==
X-Google-Smtp-Source: APBJJlG8xBryGK8/dGCwSMOVdi4y4DI4csUl0P+xY1wCqYPrAZHxrxgxRinev+6MibVUv7J4PLPy9w==
X-Received: by 2002:a05:6512:3603:b0:4fb:8574:a9c6 with SMTP id f3-20020a056512360300b004fb8574a9c6mr1443838lfs.10.1689953776279;
        Fri, 21 Jul 2023 08:36:16 -0700 (PDT)
Received: from [192.168.1.101] (abyj181.neoplus.adsl.tpnet.pl. [83.9.29.181])
        by smtp.gmail.com with ESMTPSA id t9-20020a19ad09000000b004fba1278e6dsm782535lfc.107.2023.07.21.08.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 08:36:16 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 21 Jul 2023 17:36:07 +0200
Subject: [PATCH 04/11] arm64: dts: qcom: sdm630: Drop RPM bus clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230721-topic-rpm_clk_cleanup-v1-4-cf6cd5c621d5@linaro.org>
References: <20230721-topic-rpm_clk_cleanup-v1-0-cf6cd5c621d5@linaro.org>
In-Reply-To: <20230721-topic-rpm_clk_cleanup-v1-0-cf6cd5c621d5@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689953767; l=2861;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=x5jUKaqsfGb3BGvxA5arDndONjNA8AMW5HZIIU236+s=;
 b=i1jiSPly79RK6N25LvtFawjoXWgSozuAiQ8RdGoVUcl54Qspj5vQRhhzy/1arkek4JIHsfQuj
 c7iiqgymNtuCg7nHYgC4qlsgQT8RKPTJC+c4fktay7gFsWJNMFSactu
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These clocks are now handled from within the icc framework and are
no longer registered from within the CCF. Remove them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 29 ++++-------------------------
 1 file changed, 4 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 83afce56a7b0..5403e34c6cdd 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -605,9 +605,6 @@ bimc: interconnect@1008000 {
 			compatible = "qcom,sdm660-bimc";
 			reg = <0x01008000 0x78000>;
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
-				 <&rpmcc RPM_SMD_BIMC_A_CLK>;
 		};
 
 		restart@10ac000 {
@@ -619,18 +616,12 @@ cnoc: interconnect@1500000 {
 			compatible = "qcom,sdm660-cnoc";
 			reg = <0x01500000 0x10000>;
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_CNOC_CLK>,
-				 <&rpmcc RPM_SMD_CNOC_A_CLK>;
 		};
 
 		snoc: interconnect@1626000 {
 			compatible = "qcom,sdm660-snoc";
 			reg = <0x01626000 0x7090>;
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
-				 <&rpmcc RPM_SMD_SNOC_A_CLK>;
 		};
 
 		anoc2_smmu: iommu@16c0000 {
@@ -685,16 +676,12 @@ a2noc: interconnect@1704000 {
 			compatible = "qcom,sdm660-a2noc";
 			reg = <0x01704000 0xc100>;
 			#interconnect-cells = <1>;
-			clock-names = "bus",
-				      "bus_a",
-				      "ipa",
+			clock-names = "ipa",
 				      "ufs_axi",
 				      "aggre2_ufs_axi",
 				      "aggre2_usb3_axi",
 				      "cfg_noc_usb2_axi";
-			clocks = <&rpmcc RPM_SMD_AGGR2_NOC_CLK>,
-				 <&rpmcc RPM_SMD_AGGR2_NOC_A_CLK>,
-				 <&rpmcc RPM_SMD_IPA_CLK>,
+			clocks = <&rpmcc RPM_SMD_IPA_CLK>,
 				 <&gcc GCC_UFS_AXI_CLK>,
 				 <&gcc GCC_AGGRE2_UFS_AXI_CLK>,
 				 <&gcc GCC_AGGRE2_USB3_AXI_CLK>,
@@ -705,10 +692,8 @@ mnoc: interconnect@1745000 {
 			compatible = "qcom,sdm660-mnoc";
 			reg = <0x01745000 0xa010>;
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a", "iface";
-			clocks = <&rpmcc RPM_SMD_MMSSNOC_AXI_CLK>,
-				 <&rpmcc RPM_SMD_MMSSNOC_AXI_CLK_A>,
-				 <&mmcc AHB_CLK_SRC>;
+			clock-names = "iface";
+			clocks = <&mmcc AHB_CLK_SRC>;
 		};
 
 		tsens: thermal-sensor@10ae000 {
@@ -2264,12 +2249,6 @@ gnoc: interconnect@17900000 {
 			compatible = "qcom,sdm660-gnoc";
 			reg = <0x17900000 0xe000>;
 			#interconnect-cells = <1>;
-			/*
-			 * This one apparently features no clocks,
-			 * so let's not mess with the driver needlessly
-			 */
-			clock-names = "bus", "bus_a";
-			clocks = <&xo_board>, <&xo_board>;
 		};
 
 		apcs_glb: mailbox@17911000 {

-- 
2.41.0

