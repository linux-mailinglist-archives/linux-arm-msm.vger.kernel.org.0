Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD9218AC61
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2020 06:40:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727178AbgCSFkw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Mar 2020 01:40:52 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45036 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727150AbgCSFkv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Mar 2020 01:40:51 -0400
Received: by mail-pl1-f194.google.com with SMTP id h11so558287plr.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2020 22:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DwffIuMpvk4MGqf+N9hfygy8Mho+4EUVsVCSokGeAQw=;
        b=X53gtvJLmWBUrskrgljJXYHsNsA8qA7LLIjZjGx/ddYmqslDXrqXaEZJCj2qZWkTb9
         CpypERtzO85ih/v5b6/6ZC+0zhqOSCD3I9UNaFZiwwIdNffhPq1cAT7nPidTHZOMyHKT
         WM7vJFaWjdnwV/0PgMs89NSnqn/Jb5jiSe9inOaXf80SsfP/kDso2RyiF+HHEoCEm1k7
         ywpPjIP4fMNCeiBWJ1u/C4foUCnOjKSO4XcU9u4WqY+Y2Pfc6N7BOI9koVnOVy6c0yEq
         wCrkeqOSVgWTtRJMziShLlsQbPuoqXSdmizzw/+wlhCC3V4VRNKB0QM1E4o9O/6tLw8K
         V5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DwffIuMpvk4MGqf+N9hfygy8Mho+4EUVsVCSokGeAQw=;
        b=J1c+lS29zfYhzruj2Uz4RGzWn6yd1Vr99ICcX2oO1ejDdEXbxLP8WydOu9/q6l9i3G
         ql//F36RE5lKolRnpCeuC9C5hHKcKfXlQrtx2xiCNWaZTw1OO8BF9VXSaHzkzv3pcnAs
         WJunLDvf8MPWUZtl5i3OIQs/c9M07PM+5VgWPZeaClpxrA+xTUTLHhGeA1WnaSjjFWoq
         uWjDp0pQE1SSZqHYm3Adxc+Sfbx56PVczx5IEzTO04yu7azu7uxCill15AXbWttRdzqT
         Dq655LM/tuEOXlXzpP8psZzrk0wbzFB8eNTglNVzOjqDmQ/DDVh90phuJQR5euSrSGnB
         qD0Q==
X-Gm-Message-State: ANhLgQ2erx4ZEtYyTTxg//N5xPexQbkKTAYt9ZUOobmsSIsMLKnb7fqs
        6jeaHHvkLpx+VIaxBBK5GD6xDQ==
X-Google-Smtp-Source: ADFU+vu9i8jbX+n972WNpB0F25HnwNcSfJC5HNFNCANPQazM0JhMj0i565gk6eYk+vMAwS88xlSXpQ==
X-Received: by 2002:a17:90a:1954:: with SMTP id 20mr2110292pjh.106.1584596445739;
        Wed, 18 Mar 2020 22:40:45 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l125sm229126pgl.57.2020.03.18.22.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 22:40:44 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>
Subject: [PATCH 3/4] arm64: dts: qcom: db820c: Add s2 regulator in pmi8994
Date:   Wed, 18 Mar 2020 22:39:01 -0700
Message-Id: <20200319053902.3415984-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200319053902.3415984-1-bjorn.andersson@linaro.org>
References: <20200319053902.3415984-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rajendra Nayak <rnayak@codeaurora.org>

Add the SPMI regulator node in the PMI8994, use it to give us VDD_GX
at a fixed max nominal voltage for the db820c and specify this as supply
for the MMSS GPU_GX GDSC.

With the introduction of CPR support the range for VDD_GX should be
expanded.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
[bjorn: Split between pmi8994 and db820c, changed voltage, rewrote commit message]
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/pmi8994.dtsi        |  6 ++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index 4692b7ad16b7..075cebaec3f3 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -251,6 +251,10 @@ &mdss {
 	status = "okay";
 };
 
+&mmcc {
+	vdd_gfx-supply = <&vdd_gfx>;
+};
+
 &msmgpio {
 	gpio-line-names =
 		"[SPI0_DOUT]", /* GPIO_0, BLSP1_SPI_MOSI, LSEC pin 14 */
@@ -688,6 +692,16 @@ pinconf {
 	};
 };
 
+
+&pmi8994_spmi_regulators {
+	vdd_gfx: s2@1700 {
+		reg = <0x1700 0x100>;
+		regulator-name = "VDD_GFX";
+		regulator-min-microvolt = <980000>;
+		regulator-max-microvolt = <980000>;
+	};
+};
+
 &rpm_requests {
 	pm8994-regulators {
 		compatible = "qcom,rpm-pm8994-regulators";
diff --git a/arch/arm64/boot/dts/qcom/pmi8994.dtsi b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
index 21e05215abe4..e5ed28ab9b2d 100644
--- a/arch/arm64/boot/dts/qcom/pmi8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
@@ -26,5 +26,11 @@ pmic@3 {
 		reg = <0x3 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		pmi8994_spmi_regulators: regulators {
+			compatible = "qcom,pmi8994-regulators";
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
 	};
 };
-- 
2.24.0

