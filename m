Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0C61326BF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 13:52:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727559AbgAGMwu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 07:52:50 -0500
Received: from mail-wr1-f51.google.com ([209.85.221.51]:42481 "EHLO
        mail-wr1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727722AbgAGMwu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 07:52:50 -0500
Received: by mail-wr1-f51.google.com with SMTP id q6so53706794wro.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2020 04:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=wO1+g1mg57P7Aien0G/84fUUvWqYfRx70m9TeyeqY6M=;
        b=gPnHzSfeNiPybZ+k6imtZlCabNL94NUKg+yNm4NYqVgZV54DT4l0KL9U3yfE3HxeFS
         nIpDW0H/B+d82WidGR/FqZNriTg0yap7Mu52GeUigFpoX6i651zva7uqqhVrxrkqe160
         NykveaI0sa05ZbzrTx4DWF7aC+IscPdfgTWzk0sJf5YQ/96hVSBgyBLt91sPej3mMUSZ
         NrUt68T/GQszaJ5uRLHU16ihRbckK+0+oNublLUB1WXk2hhGRTuFa2ltNX8V5R6hkZhB
         nqsr0DO863MFqrTf9TebTB7Ei2PNDaKAXdMu9e834591l/kz50k3Fax4yr0Q7yZpxahq
         TBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wO1+g1mg57P7Aien0G/84fUUvWqYfRx70m9TeyeqY6M=;
        b=QCQGoeiiC+PsPEucfk6Nj5iiAtdO/ivSY1wypsECVJ80BFJ8+5tAg+p12gQd3D4VKv
         F5AGaN01nTt0dEasdqmrbpR7VXEmUOxD0o5Z0bpq4XXrAxIPuBjCX60F2sfiFN4tezxG
         g9NlUvex7RzRyUk7fsjfrWrp6IaIGwS6ReMmG5ZwJPgJkq+GjTxtvDSjbN5Rp2C48xhx
         /BbTvOmh0189371pPGto2XQgHE5aE/mEpo1v1vaN0AnUp9zpbL16NkpJiZzfWd8V6L5u
         k8Q/73KEGl1i/XKATZ79OD+JVlhDuVgGO0Vell0JoBiDmHF1aSzI1ADAnqt8VgA+HNs7
         sx4Q==
X-Gm-Message-State: APjAAAVvwF+9H8EVsgi1bRQgz4bChejDfffQ3ZbAKXacPq3I4+mVNbpH
        FpKPumaayCZEiELTdbFTlE8w0Q==
X-Google-Smtp-Source: APXvYqymUO0g2nZQZoR6kjYI8Fsgas6UXWjPcIaO3GIhiFkZUg31XdqSdNvqkQIm3uKd1EZf3uBf0A==
X-Received: by 2002:a5d:4b4e:: with SMTP id w14mr106034516wrs.187.1578401567946;
        Tue, 07 Jan 2020 04:52:47 -0800 (PST)
Received: from lpoulain-ThinkPad-T470p.home (anice-653-1-427-122.w83-201.abo.wanadoo.fr. [83.201.163.122])
        by smtp.gmail.com with ESMTPSA id i10sm77148972wru.16.2020.01.07.04.52.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 07 Jan 2020 04:52:47 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2] arm64: dts: apq8096-db820c: Fix VDD core voltage
Date:   Tue,  7 Jan 2020 13:55:55 +0100
Message-Id: <1578401755-26211-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

APQ8096 has its VDD APC (Power for quad Kryo applications
microprocessors) powered by PM8996 PMIC S9, S10, S11 tri-phase
regulators (gang). The bootloader may have configured these
regulators with non sustainable default values, leading to sporadic
hangs under CPU stress tests (cpufreq-bench). Ideally we should enable
voltage scaling along with frequency scaling, but for now just set the
regulator gang value to a sane voltage, capable of supporting highest
frequencies (turbo).

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: Move pm8994_spmi_regulators node to pm8994 dtsi
     Move syscon to msm8996 dtsi
     lower case for addresses

 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi        |  5 +++++
 arch/arm64/boot/dts/qcom/pm8994.dtsi         |  4 ++++
 3 files changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index dba3488..89c7b19 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -669,6 +669,22 @@
 	};
 };
 
+&pm8994_spmi_regulators {
+	qcom,saw-reg = <&saw3>;
+	s9 {
+		qcom,saw-slave;
+	};
+	s10 {
+		qcom,saw-slave;
+	};
+	s11 {
+		qcom,saw-leader;
+		regulator-always-on;
+		regulator-min-microvolt = <1230000>;
+		regulator-max-microvolt = <1230000>;
+	};
+};
+
 &spmi_bus {
 	pmic@0 {
 		pon@800 {
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 4ca2e7b..715f26e 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -611,6 +611,11 @@
 			reg = <0x7a0000 0x18000>;
 		};
 
+		saw3: syscon@9a10000 {
+			compatible = "syscon";
+			reg = <0x09a10000 0x1000>;
+		};
+
 		intc: interrupt-controller@9bc0000 {
 			compatible = "qcom,msm8996-gic-v3", "arm,gic-v3";
 			#interrupt-cells = <3>;
diff --git a/arch/arm64/boot/dts/qcom/pm8994.dtsi b/arch/arm64/boot/dts/qcom/pm8994.dtsi
index 76b5a3e..7e4f777 100644
--- a/arch/arm64/boot/dts/qcom/pm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8994.dtsi
@@ -85,5 +85,9 @@
 		reg = <0x1 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		pm8994_spmi_regulators: regulators {
+			compatible = "qcom,pm8994-regulators";
+		};
 	};
 };
-- 
2.7.4

