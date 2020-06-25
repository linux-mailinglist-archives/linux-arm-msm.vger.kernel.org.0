Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88A8720A4B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 20:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403863AbgFYSVo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 14:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403793AbgFYSVh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 14:21:37 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D82DFC08C5C1;
        Thu, 25 Jun 2020 11:21:36 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id e15so4963384edr.2;
        Thu, 25 Jun 2020 11:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E1zhLYEqArTvX5TyY6+f2Fc5O6tcITlmkaFCap3K1yg=;
        b=XVFEKEfI5/JyhSN1pIGLJWDKWIsLQ+rzRLJNIVJ8wZjiKZTH/X4YVtDOoYJhOjmoMx
         FQbE/rXFpH+8mLWIu8+SYPHxnqakNDqNIL27HSPHCGGuFsEQzp0vYLVpImcSWpbsqoVK
         iaG2ZAWlN+QVgftukPKo+89w1Ifj2vAkuvgqCQ5YlQzJxXwioXWkYXTk2jKOVCMoPRfw
         WA1dTFFy8CWXBIwq3UuWpfXW9wUUWvsFQRQ28bDTrR+B9RD8mZCOfF+oyvS4x60Muc5b
         u4Jc/Td1SxjFg90cDxi/ReYn1NqW0vBI6r0Jn7LO4J1rSyOFR3wsM81S7uBOQGriuEYU
         AkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E1zhLYEqArTvX5TyY6+f2Fc5O6tcITlmkaFCap3K1yg=;
        b=tuQSlP09bEZdBi54solH+FKLApPm1knDDlbyd1W7ENMZGekPeit9DeZMuPxMnr+uuS
         Y6jYG6EaFr4AE8QZGHyxtA+O/5o5Rk8ifOVhRtq+fPYxvpZIn1wg+L5sOYMWhSgKpdfA
         r5+6wb00Tzp/McNf5iO2jmtuQTaHmrYp1yfbHkxjs0PDhOToAPzk/tQqLZbDoqAGIyJt
         KUZCHUiqRE/kr5Y8TNySilJnToUbNO3dPfBgKksULf9qdCKYxH2J+fBg17SSBR0qOu+M
         u7qdLzrigOIfr3qmEyIdRxFm43b7fU38bHul2RiOyPSaSVGE1XV8Wtmk84DO1igzA+Xt
         FvGQ==
X-Gm-Message-State: AOAM5323aOShE0szhonoEaWRO87Kffpdaie3ck4g+OB30Ycfk97sNrHt
        jtfUP7TUcZIXwpX1Jufwc/s=
X-Google-Smtp-Source: ABdhPJzM2TfP+1U/C/hpE3rNLYkk6lYWjjdKEhfpWIdtZWTfckxi3onEGNyFB3mhAAuH1gVVvmraVg==
X-Received: by 2002:a05:6402:741:: with SMTP id p1mr8160283edy.222.1593109295659;
        Thu, 25 Jun 2020 11:21:35 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id lm22sm1523448ejb.109.2020.06.25.11.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 11:21:35 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/13] arm64: dts: qcom: msm8992: Add a proper CPU map
Date:   Thu, 25 Jun 2020 20:21:09 +0200
Message-Id: <20200625182118.131476-6-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625182118.131476-1-konradybcio@gmail.com>
References: <20200625182118.131476-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit adds cpu nodes for all 6 cores
present on this SoC and the cpu-map.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 82 ++++++++++++++++++++++++---
 1 file changed, 75 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index 8ef1cb8ba8ef..f780cd39ded6 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -16,24 +16,92 @@ / {
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
-		cpu-map {
-			cluster0 {
-				core0 {
-					cpu = <&CPU0>;
-				};
-			};
-		};
 
 		CPU0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x0>;
 			next-level-cache = <&L2_0>;
+			enable-method = "psci";
 			L2_0: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 			};
 		};
+
+		CPU1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x1>;
+			next-level-cache = <&L2_0>;
+			enable-method = "psci";
+		};
+
+		CPU2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x2>;
+			next-level-cache = <&L2_0>;
+			enable-method = "psci";
+		};
+
+		CPU3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x3>;
+			next-level-cache = <&L2_0>;
+			enable-method = "psci";
+		};
+
+		CPU4: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57";
+			reg = <0x0 0x100>;
+			next-level-cache = <&L2_1>;
+			enable-method = "psci";
+			L2_1: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+			};
+		};
+
+		CPU5: cpu@101 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57";
+			reg = <0x0 0x101>;
+			next-level-cache = <&L2_1>;
+			enable-method = "psci";
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&CPU0>;
+				};
+
+				core1 {
+					cpu = <&CPU1>;
+				};
+
+				core2 {
+					cpu = <&CPU2>;
+				};
+
+				core3 {
+					cpu = <&CPU3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&CPU4>;
+				};
+
+				core1 {
+					cpu = <&CPU5>;
+				};
+			};
+		};
 	};
 
 	clocks {
-- 
2.27.0

