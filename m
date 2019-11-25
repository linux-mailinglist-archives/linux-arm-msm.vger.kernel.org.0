Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A48F108FDE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2019 15:25:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728104AbfKYOZo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Nov 2019 09:25:44 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37749 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728068AbfKYOZh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Nov 2019 09:25:37 -0500
Received: by mail-lj1-f195.google.com with SMTP id d5so16097941ljl.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2019 06:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tGGMdMAZ+2UKR5jWaE6SPzu4SHFqOnBiMLG+eD+sTeM=;
        b=ba7qmsftTBZ210RBrcuF9OufjGwHudDAhyeTULabinMb46u7NPBdRE/UR0a4e5t011
         DjwM4yVXqlpbSyxhgN1KpjHVhVzZ6FuEeFYtTMkNbHj3VeQVZYQvX+w/3D/qeTmMiCfi
         obIMRuYTj9lEw0DK7spiL6D4ug3fvvVZKVPIxGmhprwz2JFjzCJJdo+oHyP5k2q7eyCg
         /frAdotCY62B1BU14VQmRiyQDoTv4fxRegESPxE4VcbZmukHrnjNGttpieYlyzo06+jX
         gkJgSjNEv9KhfUn376i3qzTVb8lJ/mTyFQdjtihgi89xHO33N8pNP4DY/3h19BmwV4mW
         bMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tGGMdMAZ+2UKR5jWaE6SPzu4SHFqOnBiMLG+eD+sTeM=;
        b=c/XCT/h122IeXA6tvqNDf1GFdXo+klHNmR+GpuC9AvPn17nPNjvpWCMwGuTC0wlwjk
         1DII5P5v8NyYPKjegiuKH1LNp3L9GqVcv9tWv5uDKhv6k+eK0oPaucdOa8XiCLs6g+57
         +xbOdvgYNN7riFLzJBJGRsYXbljdatvD42Jn3p67ygyz0P2b/ShM2vcJNsDwtp+cYqpQ
         ghEkMNz/mnTZO2eFSny5aPUvkCU0ZjwMgtyqLGy52k9k0L15q+/3ePOJM94CcfBtSuTs
         B0/8OqwusK0GGueAOUeTwaWu89iimV/ATQ0/g8XFYTWczHOY3KFOuogaXl3VSUye/opn
         GUAg==
X-Gm-Message-State: APjAAAUxHbugErGzvOR/D8qIabWtqMNk3vqR9xqW20lt64RjfBdnF7OY
        TJ/jPhHUGNxGaxofOM5aBn4Dng==
X-Google-Smtp-Source: APXvYqyGtWRbBy6a2xjbGTzIU68+1R5oObGLLfsEfvSZGCj/WM8ZCF7WiKHbwCGYFMQM87oZ7tMzHQ==
X-Received: by 2002:a2e:6c0c:: with SMTP id h12mr23194224ljc.24.1574691933856;
        Mon, 25 Nov 2019 06:25:33 -0800 (PST)
Received: from centauri.lan (ua-84-217-220-205.bbcust.telenor.se. [84.217.220.205])
        by smtp.gmail.com with ESMTPSA id 15sm4016640ljq.62.2019.11.25.06.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 06:25:33 -0800 (PST)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: qcom: qcs404: Add DVFS support
Date:   Mon, 25 Nov 2019 15:25:09 +0100
Message-Id: <20191125142511.681149-5-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191125142511.681149-1-niklas.cassel@linaro.org>
References: <20191125142511.681149-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Support dynamic voltage and frequency scaling on qcs404.

CPUFreq will soon be superseded by Core Power Reduction (CPR, a form
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
Changes since v1:
-Removed incorrect newline in the middle of the cpu0 DT node.
(This extra newline must have been added by mistake, since no other
cpuX node in the same cluster had this extra newline added.)

 arch/arm64/boot/dts/qcom/qcs404.dtsi | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index ee5ecf413664..03aa80f2814a 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -42,6 +42,9 @@
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			next-level-cache = <&L2_0>;
 			#cooling-cells = <2>;
+			clocks = <&apcs_glb>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-supply = <&pms405_s3>;
 		};
 
 		CPU1: cpu@101 {
@@ -52,6 +55,9 @@
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			next-level-cache = <&L2_0>;
 			#cooling-cells = <2>;
+			clocks = <&apcs_glb>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-supply = <&pms405_s3>;
 		};
 
 		CPU2: cpu@102 {
@@ -62,6 +68,9 @@
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			next-level-cache = <&L2_0>;
 			#cooling-cells = <2>;
+			clocks = <&apcs_glb>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-supply = <&pms405_s3>;
 		};
 
 		CPU3: cpu@103 {
@@ -72,6 +81,9 @@
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			next-level-cache = <&L2_0>;
 			#cooling-cells = <2>;
+			clocks = <&apcs_glb>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-supply = <&pms405_s3>;
 		};
 
 		L2_0: l2-cache {
@@ -94,6 +106,24 @@
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
2.23.0

