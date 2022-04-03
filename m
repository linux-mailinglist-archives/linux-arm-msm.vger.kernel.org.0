Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19D5B4F0A3D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Apr 2022 16:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355446AbiDCOoA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Apr 2022 10:44:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357786AbiDCOn7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Apr 2022 10:43:59 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EBC3396B2
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Apr 2022 07:42:04 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id ch16-20020a17090af41000b001ca867ef52bso1012306pjb.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Apr 2022 07:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DTFsT7dEwoi7K0k55Pe2rGT/iuFbtKCMNxN/OhAKY4g=;
        b=jXaEiNp+ImOy7BmBxxShQp2bL79dDM34z+6fZUcmjmc61+wgLNRs1ha+WUEdZ4YTgI
         jnVPTQL9xXKDkBavUdRkxpb5baKoNapWKwIgEPgVtommsmvvJ+hQQWtCI3e3TCOnkfwh
         hNz3ZX0gvjjzCIkTcGH5TVsqAARyrClXw/X3v6KKqwXQpK3aX5GUt1c0AjdrLRYJ4fdd
         WVpgPjfYp0f7XL7w4S7Z1W9yvr4SAv9hKNgNuFa3HaI9UKuww9InvC9lBsTWIB7l5EcN
         dYLZ0x3yscuPL4VJ9IcVV9j2C0g++u7LqFm3ZYm9QUUvOWPGuNLFDeN7TiV8T6NB8nPb
         Ap7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DTFsT7dEwoi7K0k55Pe2rGT/iuFbtKCMNxN/OhAKY4g=;
        b=qOVZgubVFO7W8FmxtB3GFoq0YzWXcY+XFKNoKAwmeD7tbv5gjlFXNFV5cxfRHtCFkq
         k1A7dB/Le95O2Aed7B7t4rRMmPsXuAN6SZ9EaD5WRSGPJCVZMgQtqdlL2pyaViMoI2pw
         QaYTp4KjzHA6fDiAXPQ2pdmBjwe7EjVzjpGCGSBAk4bMomXpQc/Vqzh2Yog7Fmeokuqa
         k/cwRzkhh7YSbXXg32JRzoQ+WskBxSdqL7UIrET+Exi7MEquKkAJn2PKr7tU9O5+n+lq
         E/M1pwqwVYZQASlS0exe6/swr0wtCtS5zInRE68gRC2lVnYlpeC0UL/KmGkoF5MaONdZ
         fG0A==
X-Gm-Message-State: AOAM532Rp3W/TSVhG6uFktZXeXpt1hoV991d6xB/vGbBIwUfYIzJ/e2R
        J4VGAghxLKwcNmcXswRuEI2hYlswtizEqQ==
X-Google-Smtp-Source: ABdhPJwcG6r9XXsFKF/HuR8iFR9IgBzpC+1Ovc1e5pxJ3wuWsPNUvO5mNlidHAx5DJJ3qr8TpSN9Yw==
X-Received: by 2002:a17:90a:8595:b0:1bb:fbfd:bfbf with SMTP id m21-20020a17090a859500b001bbfbfdbfbfmr21649872pjn.125.1648996923533;
        Sun, 03 Apr 2022 07:42:03 -0700 (PDT)
Received: from localhost.localdomain ([223.233.64.251])
        by smtp.gmail.com with ESMTPSA id 124-20020a621682000000b004f6a2e59a4dsm8815075pfw.121.2022.04.03.07.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 07:42:03 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, Rob Herring <robh@kernel.org>
Subject: [PATCH 1/2] arm64: dts: qcom: sm8150: Add support for SDC2
Date:   Sun,  3 Apr 2022 20:11:50 +0530
Message-Id: <20220403144151.92572-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220403144151.92572-1-bhupesh.sharma@linaro.org>
References: <20220403144151.92572-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for SDC2 which can be used to interface uSD card.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 45 ++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 15f3bf2e7ea0..7206ff7619df 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3270,6 +3270,51 @@ usb_2_ssphy: phy@88eb200 {
 			};
 		};
 
+		sdhc_2: sdhci@8804000 {
+			compatible = "qcom,sm8150-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0 0x08804000 0 0x1000>;
+
+			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface", "core", "xo";
+			iommus = <&apps_smmu 0x4a0 0x0>;
+			qcom,dll-config = <0x0007642c>;
+			qcom,ddr-config = <0x80040868>;
+			power-domains = <&rpmhpd 0>;
+			operating-points-v2 = <&sdhc2_opp_table>;
+
+			status = "disabled";
+
+			sdhc2_opp_table: sdhc2-opp-table {
+				compatible = "operating-points-v2";
+
+				opp-19200000 {
+					opp-hz = /bits/ 64 <19200000>;
+					required-opps = <&rpmhpd_opp_min_svs>;
+				};
+
+				opp-50000000 {
+					opp-hz = /bits/ 64 <50000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-202000000 {
+					opp-hz = /bits/ 64 <202000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+			};
+		};
+
 		dc_noc: interconnect@9160000 {
 			compatible = "qcom,sm8150-dc-noc";
 			reg = <0 0x09160000 0 0x3200>;
-- 
2.35.1

