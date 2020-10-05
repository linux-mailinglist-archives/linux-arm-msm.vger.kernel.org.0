Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B95AE2838D4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 17:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgJEPDv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 11:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726613AbgJEPDt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 11:03:49 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BA0AC0613A9;
        Mon,  5 Oct 2020 08:03:49 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id k18so9152239wmj.5;
        Mon, 05 Oct 2020 08:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xdEIf4swPA5ngVXxi+caNdJkQwYsCJ+A4EXpJWpReGI=;
        b=lkET0CuS9omYW1jeSoQICJ6UqWsxsCbRfRR+lzUiq7yLeKFcwR6wUpIKKKrgACxB0r
         OBKLa1adthru6QpUbl5o1q4/OlTxWEKtwjWT3Q3jlPcZe2WVksw2qoS7WMz3XC2ex71T
         LBTSmZoa/pTyhtgV4bceO0QvxdBzeclNCGWenNjwzZJlA7H3cy/1AwUyHkAs7FlqVKOa
         z3Rlxg/XGMbcRL5Vtrh30QXxaRUiwl3Iyt7pzmIf+B7xN2Hjn3oyebB8sJWRB5kMNJrN
         1fQxp2VNQrbk+TX9jnGsvi9rKty8sl8rbHLzBuTDCPSxBj6D0CvVktA7wKYoZqDPVz3I
         zWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xdEIf4swPA5ngVXxi+caNdJkQwYsCJ+A4EXpJWpReGI=;
        b=uGLFkUKiiS8VxiZvMz8Q7wIMpByLLH5wcgHCBqUHKpafRHzx9iS79CEbcNEjfbXA/B
         n1PQpkboYgsiuXuNtmILP1Xz0P5cDtguJbpoNlP9VVrXwIMPQwXYnpY+qHxj2s8/yPRT
         fjKdegjNgHF3Ctv4jVp4apLUNx3BUYwjEI1wiHpkYmaVqMdfXAgDM2MxZZ85rlZl7aWQ
         FKDM7fZjtsXnbvwdB5ZvpxVAeHJ0+Mb0xZdIdNn2Af9AYpXvOPXibwU3cxzJj/02Kk9L
         S5nZlLARtpQre1X2ttsxVcZs0PLnsLYRVYvMJrflgqghMBle5Zlak5tFqdQsK9fkzYZk
         cVIg==
X-Gm-Message-State: AOAM532FBgVjJes+ByBJWr6i78w7W3o2LiOh2waZmtU7zey1PscMjEdW
        NhB/ZRzsTKixynTl4q1FU/U=
X-Google-Smtp-Source: ABdhPJxvmZ4qG83DPEypH4P1LcpvrxDi9BLF8WPJZ8t0A3j1b5PO9n4zpg88lKH2SrSpRZayDyN65g==
X-Received: by 2002:a1c:4b13:: with SMTP id y19mr16192wma.33.1601910228103;
        Mon, 05 Oct 2020 08:03:48 -0700 (PDT)
Received: from localhost.localdomain (abab191.neoplus.adsl.tpnet.pl. [83.6.165.191])
        by smtp.googlemail.com with ESMTPSA id c132sm4662wmf.25.2020.10.05.08.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 08:03:47 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] arm64: dts: qcom: msm8992: Add USB support
Date:   Mon,  5 Oct 2020 17:03:10 +0200
Message-Id: <20201005150313.149754-11-konradybcio@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005150313.149754-1-konradybcio@gmail.com>
References: <20201005150313.149754-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a very basic dwc3 configuration (no PHYs yet),
but it works.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 31 +++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index 81426577f2bd..0c422af47917 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -242,6 +242,37 @@ frame@f9028000 {
 			};
 		};
 
+		usb3: usb@f92f8800 {
+			compatible = "qcom,msm8996-dwc3", "qcom,dwc3";
+			reg = <0xf92f8800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			clocks = <&gcc GCC_USB30_MASTER_CLK>,
+				 <&gcc GCC_SYS_NOC_USB3_AXI_CLK>,
+				 <&gcc GCC_USB30_SLEEP_CLK>,
+				 <&gcc GCC_USB30_MOCK_UTMI_CLK>;
+			clock-names = "core", "iface", "sleep", "mock_utmi", "ref", "xo";
+
+			assigned-clocks = <&gcc GCC_USB30_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <120000000>;
+
+			power-domains = <&gcc USB30_GDSC>;
+			qcom,select-utmi-as-pipe-clk;
+
+			dwc3@f9200000 {
+				compatible = "snps,dwc3";
+				reg = <0xf9200000 0xcc00>;
+				interrupts = <0 131 IRQ_TYPE_LEVEL_HIGH>;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_enblslpm_quirk;
+				maximum-speed = "high-speed";
+				dr_mode = "peripheral";
+			};
+		};
+
 		sdhc_1: sdhci@f9824900 {
 			compatible = "qcom,sdhci-msm-v4";
 			reg = <0xf9824900 0x1a0>, <0xf9824000 0x800>;
-- 
2.28.0

