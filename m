Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04680302998
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jan 2021 19:07:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730973AbhAYSF5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jan 2021 13:05:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729481AbhAYSFo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 13:05:44 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B42C1C06174A;
        Mon, 25 Jan 2021 10:05:02 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id n6so16545403edt.10;
        Mon, 25 Jan 2021 10:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UDJrM+VObhQM/htR7xUxXEq8/3SNBalypsfeL4EmF2w=;
        b=pLxYuLaVuy9i9RrCOeTt+Ra3ac0FztbvVloblfhJa4KR0vf+aRF/AGcPVs8eLWXEAT
         xAAsSVzYrNjygz8Jxo+IaWXyXOU9r0qXIRgQEYsQM1ZlS6iYFeBDyFi702OHMuKtJTTw
         5lv1VG/r3+PtnAmeXzyDN5XfuiCIxecaBj/nEMeKr3zyHdkHCEd2WKr174UgOhbOMbWY
         5I5ul7scP8Tne+Bshl84snibgjyTkNNZ/l/hk6zGbpeVwjKTGJN/FL0Tm9OnqJadgCKJ
         o3u116RB3tQJADnZRZ4DfLMXCm55zA7JfMrcdFZRNRoqMJ2+tW1T/IkKelNz6ZJCzKnl
         dU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UDJrM+VObhQM/htR7xUxXEq8/3SNBalypsfeL4EmF2w=;
        b=TsowLmgzojYlLt4VldgzoIlEiCMhMThRxn2oVFXw+gMxx0F2B8HBgjGgRBd7mP19Bp
         rrsmfoINfJF6+PPT39oHsGduBI36BECHmIP4i51DeYU4jWNwjJYne1soacDl4bVgN4ie
         0oa1u1NntCPJmd2uJoYsz2pBW4UEoNf+uMNVVLWPaO+5PutyFdETT0H5sKYNQa1/8mMi
         WsW36kPUGtghReFJuludnvG260VoW5gUT6VKJJLJT8A5A4WdFa+ybMFKJiy4C9Dm2udD
         elGcXMlOuUrbH3pUAMfNX3w6BFDSK4KDtF6R2qhu443q7R1aIPexucGVlDxCe+SKRk25
         /2cg==
X-Gm-Message-State: AOAM532dGeBc2U/sJ7DQr9sqGGPcUcCq+RiVNuwYZoIWpjr1z3UHX/Ea
        PElOMGUT8xD8rozVXM1tZuA=
X-Google-Smtp-Source: ABdhPJyprG2pZ2VHd1B+QLdm2O8aTju8TlntahMjrmU4U0TiTm5jEK4KNLZuCxKXkv3STAbF1mTg7Q==
X-Received: by 2002:a05:6402:1701:: with SMTP id y1mr1446570edu.251.1611597901034;
        Mon, 25 Jan 2021 10:05:01 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id gb13sm5590778ejc.81.2021.01.25.10.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jan 2021 10:04:59 -0800 (PST)
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
Subject: [PATCH v3 1/4] ARM: dts: qcom: msm8974: add gpu support
Date:   Mon, 25 Jan 2021 20:04:24 +0200
Message-Id: <20210125180427.3109269-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Brian Masney <masneyb@onstation.org>

Add support for the a3xx GPU. opp_table is chosen to include lower
frequencies common to all different msm8974 variants.

Signed-off-by: Brian Masney <masneyb@onstation.org>
[iskren.chernev@gmail.com: change opp-table values in v3]
Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
Changes in v3:
- change opp-table as suggested by Konrad Dybcio
- remove tested-by/reviewed-by because of code changes

v2: https://lkml.org/lkml/2021/1/24/142
v1: https://lkml.org/lkml/2020/12/30/322

 arch/arm/boot/dts/qcom-msm8974.dtsi | 45 +++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 51f5f904f9eb9..683622d6c8954 100644
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
+			opp-320000000 {
+				opp-hz = /bits/ 64 <320000000>;
+			};
+
+			opp-200000000 {
+				opp-hz = /bits/ 64 <200000000>;
+			};
+
+			opp-27000000 {
+				opp-hz = /bits/ 64 <27000000>;
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

