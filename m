Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33CFD230962
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 14:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729276AbgG1MBV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 08:01:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729368AbgG1MBG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 08:01:06 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93ECFC0619D2;
        Tue, 28 Jul 2020 05:01:04 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id qc22so5569161ejb.4;
        Tue, 28 Jul 2020 05:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HfR71JevxYRyz0TRhP/dP0bQAGuhE76yoGQG/3ujNjQ=;
        b=rUS1XigATbQzlYoDZ4DMzRa2eedYzedsRIypiiqP7f/fnUKF99lpxJ8VTvukHmhG0h
         wYhf78pgkya+la2MOhznXTgk7doC4/z2pRUQG/LmQafuk5ciSE/dBSrJWunTbi/OtZ+r
         ko0Lv80L5A5M8D3SmuKzWAvdZMqMFSnKg3Cz76lBw0G1tibT16N0xQJqcs+JoGBNpkG7
         fEThFrEWAuduDh5NTnc47DOXkLBYe4Zd7YLYCGpJV+vCrachsYBlvyjwQXIdomup/tE/
         K70681gUN3nLqbit2WLHYrqTVONxjZaZ4CDSirpk+ZgTbH8b+BSwQ0uZQLtPhA4vSf8X
         Gixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HfR71JevxYRyz0TRhP/dP0bQAGuhE76yoGQG/3ujNjQ=;
        b=PH2KTLlKQEbp4pOOOKeveCnPHhRX7d9xK5TAXXUqpw0YXvt3y7OVPLjV2yqrf05KlV
         c/8iP7UG+aWpxi3RmcD0qE/p6HXpO/1BwbDcsrPYIhNEmhgdbcRTaGzkTOsp+zV2TB8H
         VmROBZIPwECcsJVI6om4a8wgzc1x2BfiGYMxKpor9jyt96RDSVnE5MzFeoow07/2CKR/
         Y5GYbqcwy4/9+6bnay4uuDnFrJzc4IlTojoiBTR+hhua1f7hJ+hJ1mSIfIl7wf/tCeby
         /0rPKnetmvJUMthPYnfQHMopUfEF6y1EC2drhJZMdg+dzV/6+jfG1IyKf4dxncU2E1F3
         +sHg==
X-Gm-Message-State: AOAM530pJOx56TYLkmbE5fT+9TD6ZN7lYnPRPn9TtG3DYxZ9fp8gYaID
        H6YDvqM4RsPKWoWgvR6c6fA=
X-Google-Smtp-Source: ABdhPJzzgN/P5HqbMMWm6YUVLp/mYOXfnGat7YNAI+P/+MYBvKeNGmLwSpq2mv5x1FTwxhRoz9MCzg==
X-Received: by 2002:a17:906:5f8a:: with SMTP id a10mr10029577eju.379.1595937663374;
        Tue, 28 Jul 2020 05:01:03 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl. [83.6.167.207])
        by smtp.googlemail.com with ESMTPSA id m20sm9066959ejk.90.2020.07.28.05.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 05:01:02 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     lauren.kelly@msn.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 4/9] arm64: dts: qcom: msm8994: Add USB support
Date:   Tue, 28 Jul 2020 14:00:43 +0200
Message-Id: <20200728120049.90632-5-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200728120049.90632-1-konradybcio@gmail.com>
References: <20200728120049.90632-1-konradybcio@gmail.com>
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

