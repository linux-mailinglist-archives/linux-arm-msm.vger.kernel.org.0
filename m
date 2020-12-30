Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6B522E7AB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Dec 2020 16:52:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbgL3PwX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Dec 2020 10:52:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbgL3PwX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Dec 2020 10:52:23 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEC3EC06179B;
        Wed, 30 Dec 2020 07:51:42 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id lt17so22391855ejb.3;
        Wed, 30 Dec 2020 07:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kXDPufsV/CJlhPK091V+/kgxs0loRtpY8e0jDMSC9UU=;
        b=U9fVpPIwoEg5IMxL7DQjkJxhIbf7p13gmiST+pWTqUE379YZJA93O6agfMpYqoCFMs
         QqSwthaLzb06et0jj4mXT0rMIO+MWoue5IqCSJbC7KiNtLckt3la+KWVfLQ+m+UAHgGb
         ZJk3xncARWvGSBNWh4yvYf7/1pX0rIZLcny4KMtHcEQtgN+XdIrSkTOBDW9wGyYDipUM
         3ZeVvQoyx1rr3opPS+DuUhT/2pkc/pu4Fa8wxEccXiexOAvnlmVfIKl+gOEYqHX2LhEV
         0f60P//6bJBBS2NLBPlM2uq4ZPDDh0DmfdFzIuFUB7gLfF+HQ8GDLUWysssKA/BHlKqU
         eH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kXDPufsV/CJlhPK091V+/kgxs0loRtpY8e0jDMSC9UU=;
        b=a5jeeAZWkccv3dezlHWgsU5uAEhWI9Vg7kf9Kl6fHzixpFKoIEbOghPzzQDwcuRQOy
         kYD+vDSzlnfofxmSrXnCKcpeB9ZlSZAj5qgobbAsZxZcZAQUXbTbugPWEPwuvN+IncHq
         tsz5G5Hs2/PojfvNeYUHR4xoWj9TaIQofvfGDEDWWS2o+tcnjcILJOc6wOdbzPy4VkhU
         tytqifAAqH79iU0M8Z0ridV7UAi3XbUY0YgH5nFwNQW5+yaCG1Bn1q1cT5GbabB4xDvw
         WzphX1n9whypwbvB5hAEicIMzgp4Kbg7OXFHV6yPQBB5itdGJuozz7wzPab3QNkyF/7E
         Z1Ug==
X-Gm-Message-State: AOAM533r3WCVyhun8zGQGUoVImICcIingrb6AozYWS80HzVzYfNrTHh/
        FQ017GmLjcY1ruTc0KmC+3w=
X-Google-Smtp-Source: ABdhPJy6NpVN8AMBKK45PHRfNCxHZXoWSu6SVHE2UoWggd+lqZ/Ai3gzAewYypvjRfZtZvaE1vuSGQ==
X-Received: by 2002:a17:906:e18:: with SMTP id l24mr48340138eji.434.1609343501664;
        Wed, 30 Dec 2020 07:51:41 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id u9sm38183530edd.54.2020.12.30.07.51.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Dec 2020 07:51:41 -0800 (PST)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Brian Masney <masneyb@onstation.org>
Subject: [PATCH 1/4] ARM: dts: qcom: msm8974: add gpu support
Date:   Wed, 30 Dec 2020 17:51:29 +0200
Message-Id: <20201230155132.3661292-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Brian Masney <masneyb@onstation.org>

Add support for the a3xx GPU

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 45 +++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 51f5f904f9eb9..c399446d8154e 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1399,6 +1399,51 @@ cnoc: interconnect@fc480000 {
 			         <&rpmcc RPM_SMD_CNOC_A_CLK>;
 		};
 
+		gpu_opp_table: opp_table {
+			status = "disabled";
+
+			compatible = "operating-points-v2";
+
+			opp-800000000 {
+				opp-hz = /bits/ 64 <800000000>;
+			};
+
+			opp-500000000 {
+				opp-hz = /bits/ 64 <500000000>;
+			};
+
+			opp-275000000 {
+				opp-hz = /bits/ 64 <275000000>;
+			};
+		};
+
+		gpu: adreno@fdb00000 {
+			status = "disabled";
+
+			compatible = "qcom,adreno-330.2",
+			             "qcom,adreno";
+			reg = <0xfdb00000 0x10000>;
+			reg-names = "kgsl_3d0_reg_memory";
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "kgsl_3d0_irq";
+			clock-names = "core",
+			              "iface",
+			              "mem_iface";
+			clocks = <&mmcc OXILI_GFX3D_CLK>,
+			         <&mmcc OXILICX_AHB_CLK>,
+			         <&mmcc OXILICX_AXI_CLK>;
+			sram = <&gmu_sram>;
+			power-domains = <&mmcc OXILICX_GDSC>;
+			operating-points-v2 = <&gpu_opp_table>;
+
+			interconnects = <&mmssnoc MNOC_MAS_GRAPHICS_3D &bimc BIMC_SLV_EBI_CH0>,
+			                <&ocmemnoc OCMEM_VNOC_MAS_GFX3D &ocmemnoc OCMEM_SLV_OCMEM>;
+			interconnect-names = "gfx-mem",
+			                     "ocmem";
+
+			// iommus = <&gpu_iommu 0>;
+		};
+
 		mdss: mdss@fd900000 {
 			status = "disabled";
 

base-commit: d7a03a44a5e93f39ece70ec75d25c6088caa0fdb
prerequisite-patch-id: aba6f684932cab35d98457c21e4ff7a5ac75c753
prerequisite-patch-id: 4884d57df1bd197896b69e115d9002d6c26ae2e2
prerequisite-patch-id: 4f1aba3c3675236b18578eedbe71b0cdca01ed77
prerequisite-patch-id: cbfe6ccfebb142370baff15bbdf3cf2f34ee77df
-- 
2.29.2

