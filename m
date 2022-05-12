Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D657525870
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 01:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359577AbiELXhB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 19:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359578AbiELXgy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 19:36:54 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99ECE65D1D
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 16:36:53 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id y19so8375452ljd.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 16:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u1F2z8vf2EByZAfH4u3WGQEipah84mZvdDX5pars+Lg=;
        b=Mk2VfKZZ6R7OctyvCPkgGOBI/U1hayeu4pN7zh5/7W9kgGMeGwNNbpzcZr9vkNCLNl
         jQEjnmdSH/DwV+Xxos18+jrkLfq4w6kvFkGYzUcYXFOResHQypMk/X20BZ8nEzACayor
         +AtArSP+Jlt9of4d2ZnF8imTGtGQENabrMJXrsPnhYMZX71D8tVcAMa0+Yr0+3XkqzV2
         y/9ErQUQQwLpG3SOk2wOarFa6iodoH9m7I4vWhLgEaSWyp46BTCQ/5B+9XyuAr/Cll+Q
         g+tBHoQOGqIYNndlHP51XcnWaJwFZCAamv+huGtfmrFeO0n3lnZUvlYMAuSYBVAb3HJu
         vm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u1F2z8vf2EByZAfH4u3WGQEipah84mZvdDX5pars+Lg=;
        b=Grmr+GwUIb3zQuMF2IOR1CdAxE/3iaoghP76jfI419Lkz6Lw8SF8/H7o1+KKVMICq5
         ejBQlmAsil+55dvkSrG3PK3Oh2YiYK7SzRV0e/4iFcHqk+P0p/wVWfzOfblDTlxVbOT3
         r6GKs6ZIg2nVlrdxjyDYyiG3B7aerLCVT4XMpznfeBfRUtP5e+wwUNlMjiFM5f7qxGJN
         48dp3ubl6J4WiK659nLDWB26PHrAYSJQm5Wm1zOlPmb8s2gstD+kwP7Gua5oEuAbpv3P
         8069i8AiisXsiaVu4MOQXueyCtSuvKdhLaMTLSfIWRpMXfbn3nSz36Ylx2cuP7AjLZPB
         wvjA==
X-Gm-Message-State: AOAM533V1Dx2QQCvk1NupU5t9vRJtsdjC4JByI+BlfEf5+7Lkp43S3Fd
        gHa3e3EL3ct/C4NjkHiJ2mci4g==
X-Google-Smtp-Source: ABdhPJyS1EQIkEYnhYZq1tZT/pbc7avQmoLJT1K66vxZyU3+hriDNRai4aURGT3TvCAgw8FuazI6Fw==
X-Received: by 2002:a2e:3112:0:b0:24f:132a:fd71 with SMTP id x18-20020a2e3112000000b0024f132afd71mr1445200ljx.522.1652398611840;
        Thu, 12 May 2022 16:36:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p13-20020a19f00d000000b0047255d211c1sm127937lfc.240.2022.05.12.16.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 16:36:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 5/8] arm64: dts: qcom: sdm630: add second (HS) USB host support
Date:   Fri, 13 May 2022 02:36:44 +0300
Message-Id: <20220512233647.2672813-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512233647.2672813-1-dmitry.baryshkov@linaro.org>
References: <20220512233647.2672813-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add DT entries for the second DWC3 USB host, which is limited to the
USB2.0 (HighSpeed), and the corresponding QUSB PHY.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 55 ++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index cca56f2fad96..17a1877587cf 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1270,6 +1270,20 @@ qusb2phy: phy@c012000 {
 			status = "disabled";
 		};
 
+		qusb2phy1: phy@c014000 {
+			compatible = "qcom,sdm660-qusb2-phy";
+			reg = <0x0c014000 0x180>;
+			#phy-cells = <0>;
+
+			clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
+				<&gcc GCC_RX1_USB2_CLKREF_CLK>;
+			clock-names = "cfg_ahb", "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
+			nvmem-cells = <&qusb2_hstx_trim>;
+			status = "disabled";
+		};
+
 		sdhc_2: sdhci@c084000 {
 			compatible = "qcom,sdm630-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0x0c084000 0x1000>;
@@ -1375,6 +1389,47 @@ opp-384000000 {
 			};
 		};
 
+		usb2: usb@c2f8800 {
+			compatible = "qcom,sdm660-dwc3", "qcom,dwc3";
+			reg = <0x0c2f8800 0x400>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			clocks = <&gcc GCC_CFG_NOC_USB2_AXI_CLK>,
+				 <&gcc GCC_USB20_MASTER_CLK>,
+				 <&gcc GCC_USB20_MOCK_UTMI_CLK>,
+				 <&gcc GCC_USB20_SLEEP_CLK>;
+			clock-names = "cfg_noc", "core",
+				      "mock_utmi", "sleep";
+
+			assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB20_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <60000000>;
+
+			interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hs_phy_irq";
+
+			qcom,select-utmi-as-pipe-clk;
+
+			resets = <&gcc GCC_USB_20_BCR>;
+
+			usb2_dwc3: usb@c200000 {
+				compatible = "snps,dwc3";
+				reg = <0x0c200000 0xc8d0>;
+				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_enblslpm_quirk;
+
+				/* This is the HS-only host */
+				maximum-speed = "high-speed";
+				phys = <&qusb2phy1>;
+				phy-names = "usb2-phy";
+				snps,hird-threshold = /bits/ 8 <0>;
+			};
+		};
+
 		mmcc: clock-controller@c8c0000 {
 			compatible = "qcom,mmcc-sdm630";
 			reg = <0x0c8c0000 0x40000>;
-- 
2.35.1

