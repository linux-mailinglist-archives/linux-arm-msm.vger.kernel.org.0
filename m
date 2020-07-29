Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC241231DEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 14:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726868AbgG2MBO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jul 2020 08:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbgG2MBN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jul 2020 08:01:13 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB215C061794;
        Wed, 29 Jul 2020 05:01:12 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id k8so2677266wma.2;
        Wed, 29 Jul 2020 05:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HfR71JevxYRyz0TRhP/dP0bQAGuhE76yoGQG/3ujNjQ=;
        b=LfVOtMH3sBJN99EAmx1CqBPQSoeD0BP8Qkkf14hpg/Y+khqVhN4xrHy25gYYkEit2A
         YdlP3O1vvVHs9Qjawv1czwPDiZazu26Fsi0pVFmGwlLalUVFFqpBR9vUJjCZY/hYKLvw
         N0n2JEy4JleafGiQSScfsUcMbpWqGbaIpckIDDtbL3J4ccbB43VMFyN6XzoEQ3pWQoaD
         /Ce0i8Bugj3arqtV+3CtQ+MjC6Tmpl/AcE3yCwMGWWLg7Un0rjVAXjx3+aUdmDSSh7si
         +7GL/oONmebjVU7Czy57uzBUVgRul8ULG6IMNv5W4aZr8HRdDAxgATI6J4/wCf0Y/tWQ
         +xNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HfR71JevxYRyz0TRhP/dP0bQAGuhE76yoGQG/3ujNjQ=;
        b=uQIWaYkt0wLAW6NDsKeKBVwxZrhZN/25v0TCx/jrQIKuRakDNgJPsHvTjyDwc/zRe3
         XsXG8Wb94KLbGfGk6zjFwc0ABkoWUNHP6qqfVZknhaV+hDIxK+tuSI+qa/yft1gsJ8Ms
         6HL0M6gJdaD9GKar+WXg19C1W8BGge/UMew84BK7dsVjHQnjGacKezO3tuDxyaoQMIji
         GXi6ggjCHseub42UQEZrGtJjODeEyjIVcWUpW0F/tf0UFZmJ1FpFTg/RcSbT3bpsDnxB
         K9TahnVP/SoqBqauSMs2B93DuetlKYCFxln635o2znjijWMvW/zfXZqHSjVVwNx/LxoQ
         0unw==
X-Gm-Message-State: AOAM530I2h8FM2SPD7m7rfPTDOewpL+bsmxcoBbo+X0swcYe0f4lP7gJ
        Z9T76KVeG04/NEZEK0mJvD4=
X-Google-Smtp-Source: ABdhPJxM4uQjcmKppyYpQ2M4qoEYN3Y60qmLKVVdIINwdBWCDwkmMSrUNb4MzX5voCBjJtfuQf0VYQ==
X-Received: by 2002:a1c:67d4:: with SMTP id b203mr8352608wmc.8.1596024071547;
        Wed, 29 Jul 2020 05:01:11 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl. [83.6.167.207])
        by smtp.googlemail.com with ESMTPSA id l67sm5426000wml.13.2020.07.29.05.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 05:01:11 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     lauren.kelly@msn.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 04/10] arm64: dts: qcom: msm8994: Add USB support
Date:   Wed, 29 Jul 2020 14:00:50 +0200
Message-Id: <20200729120057.35079-5-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200729120057.35079-1-konradybcio@gmail.com>
References: <20200729120057.35079-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a very basic dwc3 configuration (no PHYs yet),
but it works.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 31 +++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 6707f898607f..69c99a4cd817 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -282,6 +282,37 @@ frame@f9028000 {
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
 		sdhc1: sdhci@f9824900 {
 			compatible = "qcom,sdhci-msm-v4";
 			reg = <0xf9824900 0x1a0>, <0xf9824000 0x800>;
-- 
2.27.0

