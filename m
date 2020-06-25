Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A68AE20A493
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 20:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407039AbgFYSNY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 14:13:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407035AbgFYSNV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 14:13:21 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F170CC08C5C1;
        Thu, 25 Jun 2020 11:13:20 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id a1so6830094ejg.12;
        Thu, 25 Jun 2020 11:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E1zhLYEqArTvX5TyY6+f2Fc5O6tcITlmkaFCap3K1yg=;
        b=mv3THLIpoLjF534rSmDf3PLVaLQ+6vAoGKPBvZA10jyckTqZBeKIJxau/fLRkQLwdW
         APdyFjre0dkJTQvR0a0vXd5k8j9DshkZvsIGQZYyZUt8d7apQe6EHRzFqtbP519UyrNc
         pfuMoKYLR39KSRpyzdf8BZoMbjM6Vw3DqsuVMWkQ0jwpOLB82zSb8d7qWp0RiIREBwqX
         rQ4gEKsJi2VEXxNcbszMqfXC7PVsIwTtSHRiADXNZjWSe6Fxpx+xTTB3SULnzAKv87pU
         7SRt6B1CnrgYqnN/CPokF6/wdyfE44EWBuSyw0wdWz0z0gcWlcarEdTuFtcLGANqroiu
         McoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E1zhLYEqArTvX5TyY6+f2Fc5O6tcITlmkaFCap3K1yg=;
        b=Cz5Btegv5y7j29yGkU1fix4Hv/Z0SGXmoQ1G1bbrok38BpP1BDj/CNPFLA+/Vawt7a
         /cggrisTULW7A6yqmy/ioJQCHq2kEvk+iquR2jcohrRNG+65HNEhHmuDXfnmW5e2uyKi
         vJz1FqjORaYLKuy7EAI/xpTtcfF54zxEZEjGero4Ig0ygOVwg1L3k4w+u5JpNteas8c7
         5J7z9qlhreT4LuHPAWRQtWoLADFOcaMxi39DdOg6BnLXzkTRmF4dm6cQAEEPC7uEYCfG
         3w/OPoz6ojksQSUui/yMXx4PRp6uSw/uuwriMdwEf/hCzaDoUo+IDO0U62OWA71e1TzQ
         z2gA==
X-Gm-Message-State: AOAM531nXfmQWCEFxzzbKhrE6k2SsGvDXuAqjMEOt6pCw+7yk+mmEaf0
        gbi1cLXyzRGTPMcrUmEtuX0=
X-Google-Smtp-Source: ABdhPJwJb2OnAYejiFiv9dYpyhSph1WjI4pyVnwa3WCqDawP7+aJO1qJU0cDZ7SBYdBqFS7a7zrpGg==
X-Received: by 2002:a17:906:7693:: with SMTP id o19mr29262515ejm.295.1593108799745;
        Thu, 25 Jun 2020 11:13:19 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id p4sm19511112edj.64.2020.06.25.11.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 11:13:19 -0700 (PDT)
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
Subject: [PATCH v2 05/13] arm64: dts: Add a proper CPU map for MSM8992
Date:   Thu, 25 Jun 2020 20:12:53 +0200
Message-Id: <20200625181303.129874-6-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625181303.129874-1-konradybcio@gmail.com>
References: <20200625181303.129874-1-konradybcio@gmail.com>
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

