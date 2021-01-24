Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEA1C301C6A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jan 2021 14:57:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbhAXN5j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jan 2021 08:57:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726117AbhAXN5e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jan 2021 08:57:34 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 714EAC061786;
        Sun, 24 Jan 2021 05:56:43 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id g12so14216493ejf.8;
        Sun, 24 Jan 2021 05:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oYZGFRrNRJohp3t9IqS0qYQQf/UrbKkxJuhh4Cbw970=;
        b=iw3mLRFleJw4bB8R1WKx/al6CEdyjMHtjujBhS+18jvwbmf1RXS5phJOZQvYPwSr6z
         //yN9cw0Llv9YKu2+gA2/zNyLSpXhwGosg13TRnVXC0fq3BfnKaIrVC2p8Qi/E2PbvOk
         su1ysBxBiUVEerNWIiXrJMTxnpzffxOm8THMGwt0EMYNZ62/uZX9Ubym2far409AaGJN
         56Dnf6jA9zfZpslv8cSzMtiPVWMkVBP3eTwusv9bYRG1F5n5KNDky94/0E724EVhPRbO
         LBRruitoopt6fH4qXCtvtt1XIpmwfNRtwchYToqsk9BeFtT8XNgs0dwiLghLT4walN8x
         NuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oYZGFRrNRJohp3t9IqS0qYQQf/UrbKkxJuhh4Cbw970=;
        b=D4ObLitlIEIuB+rQg5U7IK1wZq2TvlMzjaeuavtakRtYNYZS9UGKqWYDQ6pXgybPsj
         tXbwUKAg8c/GXEwJTSRaqjKrtR/M1RP6vVb/JvCv5Uf7MjvtoSOUzbBraJKStl7wGkrq
         v4Ni31JfbV9BRFduc7jtM1rHz9wU5NWYiBgE2mQO4iFveRjYIpO9QLp2ZI1puvz8u53+
         qiKzGmRYOMqb2JPgJAapPWibvzr5z8USlyW29BaEuxQq34xtFE0OR0wvgN9ztvb+x2uD
         fzcOda1fkCcrfzfvdAWUAoH42/IILkB2xQaUz9A1okhwi7DGhFhfICEr6Ce66O1LwxR0
         jn9g==
X-Gm-Message-State: AOAM533dhUK6koqnKhtIcXbp9FlSMB61LxvQjQ/isOrehXQAfx/SoJKw
        QJW1NJo0Gy9GpomeHoRfCok=
X-Google-Smtp-Source: ABdhPJxlzW561c7H++Y/tLImi5j+0079Jz6AhnPdyAzuq0w6CYKp5EASSC42NnyG1uzMcmcZeAl8Ww==
X-Received: by 2002:a17:906:ae9b:: with SMTP id md27mr893120ejb.357.1611496602189;
        Sun, 24 Jan 2021 05:56:42 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id g25sm6995049ejf.15.2021.01.24.05.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Jan 2021 05:56:41 -0800 (PST)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Samuel Pascua <pascua.samuel.14@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Brian Masney <masneyb@onstation.org>
Subject: [PATCH 1/4] ARM: dts: qcom: msm8974: add gpu support
Date:   Sun, 24 Jan 2021 15:56:07 +0200
Message-Id: <20210124135610.1779295-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Brian Masney <masneyb@onstation.org>

Add support for the a3xx GPU

Signed-off-by: Brian Masney <masneyb@onstation.org>
Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
Tested-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
Reviewed-by: Brian Masney <masneyb@onstation.org>
---
Changes in v2:
- base set to next-20210122
- add tags from v1 replies
- add Signed-off-by: me on first three patches
- add commit message to 2nd patch

v1: https://lkml.org/lkml/2020/12/30/322

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
 

base-commit: 226871e2eda4832d94c3239add7e52ad17b81ce5
-- 
2.30.0

