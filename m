Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BC403073DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 11:39:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbhA1Khc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jan 2021 05:37:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbhA1KhW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jan 2021 05:37:22 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 738D0C061573;
        Thu, 28 Jan 2021 02:36:41 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id w1so6943918ejf.11;
        Thu, 28 Jan 2021 02:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WliAbs0AXbBON4RTolMaPpk8w9g9sLeQ3AynxGb88hg=;
        b=DR3polTTyai5gaK3RUCFc9J2VW/iVlkeS1q/SgWa0kUurctF4oLZTBu4tJSj31SSL6
         Ps8/RfqXjMS6mr5t+MmOyTNvfklzzcxzm0wWgm7g39+YfiRzX0O6wnQZSLHFc8sz/bai
         n6Vxf5RBdYCQtZGGoq9ulMRPYoUHnu1Q/xEhywNAiGgwkebcTP1XQ4snQUSl/zhhui6p
         hlW38HlDSTfyx99JUpsf7RThJcrZkVJa0aVkusIxj4pXygK0sWpc6V0YmBsxDA6qR4iO
         RlbR4iSpdXQlsVh8tAcEDQ0zYOvQHOGJowszBBIDQJzqQ5w4qKsSh41c6Ux0/OL07w6N
         8uAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WliAbs0AXbBON4RTolMaPpk8w9g9sLeQ3AynxGb88hg=;
        b=bULeWzsu+iq1iZFpv0aHtgWYC3O2pm2kmbOYhFG3hIsQgB8Gy9nRkhEn1+FgE0BvO/
         ttH54K/pRKbjoBHAuWeuhiGYq/YBiUc+JWYAeGFj7toAgBeyyFzyfZREKLTjtLMuF1l2
         toYzod05Jikyy1hwd/dwFw/WXMFOj0bSmcYORWZwoqs55TvJMirg6rRQ2bwY7KqO+N1w
         WSz0XYSG07V8RdJ8vbgWpr3u8Phd3y0Bry1cCUV6JpMD2XB6045DDwE4ZNitaT7x3cRg
         q9PPrPMHZX+hFqTbJHWo40ov3nVphWlH64ANAjUEokiL7yEncB0RrWDGfwjyEGDYl6nQ
         cfjA==
X-Gm-Message-State: AOAM530KWdxL3HKdRh5nCiiZE+lg9fiR9EzIzHylVv2BoYZbCssjLN9s
        KPjubcqcSSBsJ6tnALGS9UU=
X-Google-Smtp-Source: ABdhPJyCACLmBTxT+XTF4RW7KFXzXOkIiuEyvQv5TH4jGeGI1Pc35lRzfZjGX4HnhMIgnB5+khxOig==
X-Received: by 2002:a17:906:58d3:: with SMTP id e19mr1556863ejs.373.1611830200260;
        Thu, 28 Jan 2021 02:36:40 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id q2sm2783991edn.91.2021.01.28.02.36.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 02:36:39 -0800 (PST)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Samuel Pascua <pascua.samuel.14@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Brian Masney <masneyb@onstation.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v4 1/4] ARM: dts: qcom: msm8974: add gpu support
Date:   Thu, 28 Jan 2021 12:36:28 +0200
Message-Id: <20210128103632.1723952-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Brian Masney <masneyb@onstation.org>

Add support for the a3xx GPU. opp_table is chosen to include lower
frequencies common to all different msm8974 variants.

Also correctly set gpu compat string on msm8974 and msm8974pro.

Signed-off-by: Brian Masney <masneyb@onstation.org>
[iskren.chernev@gmail.com: change after v1]
Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
Changes in v4:
- change adreno compat string to 330.1 in msm8974 and 330.2 in msm8974pro
- put opp_table node inside gpu node (similar to msm8916)
- fix tabs-whenever-possible lint warning

v3: https://lkml.org/lkml/2021/1/25/398
v2: https://lkml.org/lkml/2021/1/24/142
v1: https://lkml.org/lkml/2020/12/30/322

 arch/arm/boot/dts/qcom-msm8974.dtsi    | 43 ++++++++++++++++++++++++++
 arch/arm/boot/dts/qcom-msm8974pro.dtsi |  5 +++
 2 files changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 51f5f904f9eb9..bae9ea3a3b871 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1399,6 +1399,49 @@ cnoc: interconnect@fc480000 {
 			         <&rpmcc RPM_SMD_CNOC_A_CLK>;
 		};

+		gpu: adreno@fdb00000 {
+			status = "disabled";
+
+			compatible = "qcom,adreno-330.1",
+				     "qcom,adreno";
+			reg = <0xfdb00000 0x10000>;
+			reg-names = "kgsl_3d0_reg_memory";
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "kgsl_3d0_irq";
+			clock-names = "core",
+				      "iface",
+				      "mem_iface";
+			clocks = <&mmcc OXILI_GFX3D_CLK>,
+				 <&mmcc OXILICX_AHB_CLK>,
+				 <&mmcc OXILICX_AXI_CLK>;
+			sram = <&gmu_sram>;
+			power-domains = <&mmcc OXILICX_GDSC>;
+			operating-points-v2 = <&gpu_opp_table>;
+
+			interconnects = <&mmssnoc MNOC_MAS_GRAPHICS_3D &bimc BIMC_SLV_EBI_CH0>,
+					<&ocmemnoc OCMEM_VNOC_MAS_GFX3D &ocmemnoc OCMEM_SLV_OCMEM>;
+			interconnect-names = "gfx-mem",
+					     "ocmem";
+
+			// iommus = <&gpu_iommu 0>;
+
+			gpu_opp_table: opp_table {
+				compatible = "operating-points-v2";
+
+				opp-320000000 {
+					opp-hz = /bits/ 64 <320000000>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+				};
+
+				opp-27000000 {
+					opp-hz = /bits/ 64 <27000000>;
+				};
+			};
+		};
+
 		mdss: mdss@fd900000 {
 			status = "disabled";

diff --git a/arch/arm/boot/dts/qcom-msm8974pro.dtsi b/arch/arm/boot/dts/qcom-msm8974pro.dtsi
index 6740a4cb7da8d..b87de3c3f461a 100644
--- a/arch/arm/boot/dts/qcom-msm8974pro.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974pro.dtsi
@@ -14,5 +14,10 @@ sdhci@f9824900 {
 		clock-controller@fc400000 {
 				compatible = "qcom,gcc-msm8974pro";
 		};
+
+		adreno@fdb00000 {
+			compatible = "qcom,adreno-330.2",
+				     "qcom,adreno";
+		};
 	};
 };

base-commit: 226871e2eda4832d94c3239add7e52ad17b81ce5
--
2.30.0

