Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D172F19B4D7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2020 19:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732368AbgDARrF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Apr 2020 13:47:05 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40219 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732328AbgDARrE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Apr 2020 13:47:04 -0400
Received: by mail-wr1-f65.google.com with SMTP id u10so1095373wro.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2020 10:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=W2oQ9hPMrcsBKS7dSFlTLxuPz1aNPGKqUjE98fzZQWY=;
        b=dJusUEEF2cg+i3OBLnik6DngOnDq5pM40My5RiCA+hNoRlwoi2liK0I16AoiA3rp+E
         Xwys0n9UmiFadqGCbjGB6ozCVdJT+sK1lCiKBbdi4iP/AjpEV3OrrUH37/zMx2L945I1
         b8AyzzqukyXoNNxaXOIclu4SzzNn3bdWyDsf+3Z8LUhiw4WtEYv8sRw6/ugc633iXPMz
         tIJE3l7pOTK2MSVBv+Xx9mia+oT5xuoCEi06XZ1UkHGwrgjV9iwJ8E7RiM0BduQO59AS
         h/XDFkWwLOtHLasqKzaRW4/jtXzxnNFXwzgorSt9VUinCREcE3BqeRPzNbhMrD6kPZPz
         2vHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=W2oQ9hPMrcsBKS7dSFlTLxuPz1aNPGKqUjE98fzZQWY=;
        b=VstQPYwPV7aFWDYxTe/iXkjSW7Ru5exDj0+I+S1JiDB4OdMHeh/0KESYBC8rNlARDV
         zOAHpqfNgP/dIXFwMp9zAnJb3bIp0n+ocLkfJy2NJPE2lHq2vGe/l6AG0jXjDt+GKHpG
         hadGpa2uZorfactk/h5kkVU5q74QUYeHA8REQHAnvEgt8khduxi6eCzaDW0H1IhPANLx
         qcEgfvPaut5ut4WRTbCVlyeWqmDZc0OUH9p9qhdL43sZcdpBU++sVt2+Rf5DFRMMDfaS
         mIAH9NVizYk5d9mxStSyMVa3T7wzJjSULDReJsETAwIvt0ze/876/gJxzKlqBh9vYhzO
         67fg==
X-Gm-Message-State: ANhLgQ1JmPy7eQStuQIvkRVSkvZ6U2lY2FCO6nDDkvBFrEzkCDdOjCTr
        cSKQBJcFDKvaYh9EsXD6Ikm0ig==
X-Google-Smtp-Source: ADFU+vu7NWnQ3RupG13syE9TsO401tn8jTzVU7/jI8QW96IDZKVfwIjf6D/Em45K1ICfbXc/S1qXLw==
X-Received: by 2002:a5d:510d:: with SMTP id s13mr26523908wrt.110.1585763222180;
        Wed, 01 Apr 2020 10:47:02 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id 5sm4062143wrs.20.2020.04.01.10.47.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 01 Apr 2020 10:47:01 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] arch: arm64: dts: apq8016-dbc: Add missing cpu opps
Date:   Wed,  1 Apr 2020 19:50:59 +0200
Message-Id: <1585763459-21484-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The highest cpu frequency opps have been dropped because CPR is not
supported. However, we can simply specify operating voltage so that
they match the max corner voltages for each freq. With that, we can
support up to 1.36Ghz. Ideally, msm8916 CPR should be implemented to
fine tune operating voltages and optimize power consumption.

This patch:
- Adds missing opps and corresponding target voltages to msm8916.dtsi.
- Adds cpu-supply to apq8016-sbc.dtsi (board level info).
- Adds pm8916 spmi regulator node to pm8916.dtsi.

Tested with a dragonboard-410c.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 24 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi     | 24 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8916.dtsi      |  6 ++++++
 3 files changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 037e26b..f1c1216 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -560,6 +560,30 @@
 	qcom,mbhc-vthreshold-high = <75 150 237 450 500>;
 };
 
+&spm_regulators {
+	vdd_cpu: s2 {
+		regulator-always-on;
+		regulator-min-microvolt = <1050000>;
+		regulator-max-microvolt = <1350000>;
+	};
+};
+
+&CPU0 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&CPU1 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&CPU2 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&CPU3 {
+	cpu-supply = <&vdd_cpu>;
+};
+
 &smd_rpm_regulators {
 	vdd_l1_l2_l3-supply = <&pm8916_s3>;
 	vdd_l5-supply = <&pm8916_s3>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 9f31064..9805af0 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -342,15 +342,39 @@
 
 		opp-200000000 {
 			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <1050000>;
 		};
 		opp-400000000 {
 			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <1050000>;
+		};
+		opp-533330000 {
+			opp-hz = /bits/ 64 <533330000>;
+			opp-microvolt = <1150000>;
 		};
 		opp-800000000 {
 			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <1150000>;
 		};
 		opp-998400000 {
 			opp-hz = /bits/ 64 <998400000>;
+			opp-microvolt = <1350000>;
+		};
+		opp-1094400000 {
+			opp-hz = /bits/ 64 <1094400000>;
+			opp-microvolt = <1350000>;
+		};
+		opp-1152000000 {
+			opp-hz = /bits/ 64 <1152000000>;
+			opp-microvolt = <1350000>;
+		};
+		opp-1209600000 {
+			opp-hz = /bits/ 64 <1209600000>;
+			opp-microvolt = <1350000>;
+		};
+		opp-1363200000 {
+			opp-hz = /bits/ 64 <1363200000>;
+			opp-microvolt = <1350000>;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
index 0bcdf04..c9b9c4f 100644
--- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
@@ -157,5 +157,11 @@
 			vdd-micbias-supply = <&pm8916_l13>;
 			#sound-dai-cells = <1>;
 		};
+
+		spm_regulators: spm_regulators  {
+			compatible = "qcom,pm8916-regulators";
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
 	};
 };
-- 
2.7.4

