Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 826DC351DED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 20:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235387AbhDASc4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 14:32:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237431AbhDASXE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 14:23:04 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 167B4C0613BB
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 10:41:26 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id o16so2646363wrn.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 10:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0ZgsNptth5FfPKBSZvQ+tJje7mvJfg0p78cr8chWRLw=;
        b=tf9o30F6MYnry0VrC5y31+tuZSGrucir66iUnwJ2Dc/znhhvRqVeoQWJY0iKYWCqEd
         zwxIRpss7aGcRpqMrahvIr8RRlX31peXJ6ZkzctDToHgUFvn98EkjivJha9BH3ncD7mU
         QpFzeRg1E8Eb6BG649+BGwgWoRYzJ7YS4SylmJORN/Y7/ojKBxZ/Hr0UXI79YCNEaYVE
         frT8URiYcshpG9WoiqGzEIuUC8NnuGuI9VxH05VXXpYNKEdKl59+oXvhaRGpPI2LqDBI
         JkJPGdizoqGl7jAZbacCV7dp5FDN7obMc7YZgH8d0nzHRV+0B1g/I7H8qYPTMnuHlGoX
         A+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0ZgsNptth5FfPKBSZvQ+tJje7mvJfg0p78cr8chWRLw=;
        b=WImX+7SbOAHkobrwCwe3AVvBUbLQBhYTSbpmixsdGsAjH2RyPFTNxWzXucEOKvUi+T
         ceYL9W6YLyNTbih/le5NazJjmuIWfRX91UvJM9fyEA2dkJa0t3MAe4Iauvtypu3EIF1i
         loi1KgWh8Zg7EmjFnRlyFMvTc+2PEsz5bt0qokQGQOKsX87Jdu5U9Miu0Ytz4Fmr1Ujy
         evwBJipQaFyAXfr/3pGq19RFDIOZBheGQJRjsCY2KUlupuf2TA7FanRPDbbFleNHxRz/
         1qRkMgEtGQPLakpIjrGaZ/I1a747Iux3KCiktlAMe6oZ6vWewmWSxg2ERfs0hPJPhcQq
         ig4g==
X-Gm-Message-State: AOAM531Ga/KRrHlWm8vRWkAS967gRBAjXKtMsZKCDQk2bOdu7gbr1hpc
        fU4HX8em/LOTU2tkLg8JtxoDtg==
X-Google-Smtp-Source: ABdhPJxkUMuDtiGWXylziNsNByMeDGM1dmOoSlMlLuTHvuYMwOZllTaHpJP7NZ7Mwj+pkbRHyLyaRw==
X-Received: by 2002:a5d:4e43:: with SMTP id r3mr10918675wrt.280.1617298885288;
        Thu, 01 Apr 2021 10:41:25 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o8sm9070242wmr.28.2021.04.01.10.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 10:41:24 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, jonathan@marek.ca,
        dikshita@codeaurora.org, dmitry.baryshkov@linaro.org,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Subject: [PATCH v3 2/2] arm64: dts: qcom: sm8250: Add venus DT node
Date:   Thu,  1 Apr 2021 18:42:56 +0100
Message-Id: <20210401174256.1810044-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210401174256.1810044-1-bryan.odonoghue@linaro.org>
References: <20210401174256.1810044-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add DT entries for the sm8250 venus encoder/decoder.

Co-developed-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Co-developed-by: Dikshita Agarwal <dikshita@qti.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita@qti.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 59 ++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 23fb9a0e32b9..cf602e8c40a7 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2323,6 +2323,65 @@ usb_2_dwc3: dwc3@a800000 {
 			};
 		};
 
+		venus: video-codec@aa00000 {
+			compatible = "qcom,sm8250-venus";
+			reg = <0 0x0aa00000 0 0x100000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&videocc MVS0C_GDSC>,
+					<&videocc MVS0_GDSC>,
+					<&rpmhpd SM8250_MX>;
+			power-domain-names = "venus", "vcodec0", "mx";
+			operating-points-v2 = <&venus_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface", "core", "vcodec0_core";
+
+			interconnects = <&gem_noc MASTER_AMPSS_M0 &config_noc SLAVE_VENUS_CFG>,
+					<&mmss_noc MASTER_VIDEO_P0 &mc_virt SLAVE_EBI_CH0>;
+			interconnect-names = "cpu-cfg", "video-mem";
+
+			iommus = <&apps_smmu 0x2100 0x0400>;
+			memory-region = <&video_mem>;
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
+			reset-names = "bus", "core";
+
+			video-decoder {
+				compatible = "venus-decoder";
+			};
+
+			video-encoder {
+				compatible = "venus-encoder";
+			};
+
+			venus_opp_table: venus-opp-table {
+				compatible = "operating-points-v2";
+
+				opp-720000000 {
+					opp-hz = /bits/ 64 <720000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-1014000000 {
+					opp-hz = /bits/ 64 <1014000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-1098000000 {
+					opp-hz = /bits/ 64 <1098000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-1332000000 {
+					opp-hz = /bits/ 64 <1332000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
 		videocc: clock-controller@abf0000 {
 			compatible = "qcom,sm8250-videocc";
 			reg = <0 0x0abf0000 0 0x10000>;
-- 
2.30.1

