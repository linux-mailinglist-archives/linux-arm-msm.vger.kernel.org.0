Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD207CE6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2019 22:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730809AbfGaU37 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Jul 2019 16:29:59 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38671 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730797AbfGaU36 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Jul 2019 16:29:58 -0400
Received: by mail-wr1-f65.google.com with SMTP id g17so71076649wrr.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2019 13:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vLHpcezXZ0AucQ4kaXez+YbIiKuQyU24LjFhyj/OAXk=;
        b=eQCRVeZXchD4s8hmdDQVCG2ogRRuvj7EZRHIJo8ykw1oW4wZjt5+SSYbjFeaaDGZrn
         0xucuH8wa2pRXz8qrOuZd277mjyUL3L5ZPsNLTCKCbtjGyssAb8BsI6U8vYAbloKvvQq
         BzPMZsouAsHmIoBCrcs8qJ+ORAVV59dnHr7FHlAmO+BlwJ9bU47J59hcapNE/S59FV/D
         PM7skxmpOrJWnu8rn5hPnCsbol0kRPf0yNonBqqOUvKl8Z92HutL3oW4KrUxJDyoMWhE
         7PJwcZRXOfMvIyFy8KqnbU2v9/W1kKg0FqfYYX3XUt+aWsEeSnSRKoWHDibpSE9niNy0
         PnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vLHpcezXZ0AucQ4kaXez+YbIiKuQyU24LjFhyj/OAXk=;
        b=obTKYGncdReZVyP3N3cnX9yciO7GUqZKiGqFBKsaw0hb51IpiKtusBwiNn2hCb7jDB
         /c+IFpbfU9JxhMWCQwFp3Q/NOAbR5mbnD6aWrnAqWYAO7iQ3ZJK3SMOkkQU4wfder+V5
         Gthokbfi/tNnF2KggOhJTHvHOsJmDDpw733qfeEYM4jj5V2hL9WiQLq/VHjz6jgAeOdu
         NVKHKrQVauXu+4SPgik59Adrmbw6CkeRvxzQGe7PETdyEqG7zM4zG3e2UWfDfcbBd726
         9yqJsvu0YaxI2zAR8uLYf7kcrqo3xxk5Q2WRI5KOxq7zzC8DFsb2QP+SMWKa0WIea14u
         KQRg==
X-Gm-Message-State: APjAAAW1Gx5V8ev/m3GqZdLiTIRGOa5hJd5fWJYqe/oadAjy3+BPesHi
        elMi3RjonyW+PsX6y6GWXGRq1g==
X-Google-Smtp-Source: APXvYqxVk5jRAEbzCMTnd8pf764yjjCzhBWZjHtBQ5AptGqXRtwGwFJmiylZu++Ijy4DW1dMhmdbjw==
X-Received: by 2002:a05:6000:187:: with SMTP id p7mr12658657wrx.189.1564604996721;
        Wed, 31 Jul 2019 13:29:56 -0700 (PDT)
Received: from localhost.localdomain (19.red-176-86-136.dynamicip.rima-tde.net. [176.86.136.19])
        by smtp.gmail.com with ESMTPSA id i18sm91905591wrp.91.2019.07.31.13.29.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 31 Jul 2019 13:29:56 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org,
        sboyd@kernel.org, david.brown@linaro.org, jassisinghbrar@gmail.com,
        mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org,
        will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au,
        heiko@sntech.de, sibis@codeaurora.org,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net
Cc:     vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: [PATCH v4 12/13] arm64: dts: qcom: qcs404: Add DVFS support
Date:   Wed, 31 Jul 2019 22:29:28 +0200
Message-Id: <20190731202929.16443-13-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731202929.16443-1-jorge.ramirez-ortiz@linaro.org>
References: <20190731202929.16443-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Support dynamic voltage and frequency scaling on qcs404.

CPUFreq will soon be superseeded by Core Power Reduction (CPR, a form
of Adaptive Voltage Scaling found on some Qualcomm SoCs like the
qcs404). 

Due to the CPR upstreaming already being in progress - and some
commits already merged -  the following commit will need to be
reverted to enable CPUFreq support 

   Author: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
   Date:   Thu Jul 25 12:41:36 2019 +0200
       cpufreq: Add qcs404 to cpufreq-dt-platdev blacklist

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 5b7d6258e9bf..8cce4a224de2 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -36,6 +36,10 @@
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			next-level-cache = <&L2_0>;
 			#cooling-cells = <2>;
+			clocks = <&apcs_glb>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-supply = <&pms405_s3>;
+
 		};
 
 		CPU1: cpu@101 {
@@ -46,6 +50,9 @@
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			next-level-cache = <&L2_0>;
 			#cooling-cells = <2>;
+			clocks = <&apcs_glb>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-supply = <&pms405_s3>;
 		};
 
 		CPU2: cpu@102 {
@@ -56,6 +63,9 @@
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			next-level-cache = <&L2_0>;
 			#cooling-cells = <2>;
+			clocks = <&apcs_glb>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-supply = <&pms405_s3>;
 		};
 
 		CPU3: cpu@103 {
@@ -66,6 +76,9 @@
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			next-level-cache = <&L2_0>;
 			#cooling-cells = <2>;
+			clocks = <&apcs_glb>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-supply = <&pms405_s3>;
 		};
 
 		L2_0: l2-cache {
@@ -88,6 +101,24 @@
 		};
 	};
 
+	cpu_opp_table: cpu-opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-1094400000 {
+			opp-hz = /bits/ 64 <1094400000>;
+			opp-microvolt = <1224000 1224000 1224000>;
+		};
+		opp-1248000000 {
+			opp-hz = /bits/ 64 <1248000000>;
+			opp-microvolt = <1288000 1288000 1288000>;
+		};
+		opp-1401600000 {
+			opp-hz = /bits/ 64 <1401600000>;
+			opp-microvolt = <1384000 1384000 1384000>;
+		};
+	};
+
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-qcs404", "qcom,scm";
-- 
2.22.0

