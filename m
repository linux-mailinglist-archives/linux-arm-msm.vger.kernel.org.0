Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 880EF2067A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 00:49:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389328AbgFWWth (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 18:49:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388735AbgFWWs0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 18:48:26 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3775AC061795;
        Tue, 23 Jun 2020 15:48:26 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id a6so264602wrm.4;
        Tue, 23 Jun 2020 15:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l20ghDaBITcWUJdBjFantj3la1r6idQ6rjpXrXpW8d0=;
        b=RvFA4QkqTNG0dxdYdv6lQRlfayAkQ8HyDjjrl/3ISJuwAYmKaudQL5JQWApkekFh/N
         BZ1mXfGbcY3HjYOP8NsYDUnamfoE/A0T8lBWNlVsIIf4zFbzbU6zayYZCzEt+5Qfpy49
         Elal8nPLSKcMnrnD35LxMv4WpdLf2zNe16fDiD+GzjSvS0lhNVrWOfgjeL7ae5rQdgXL
         TavZOtXUk8unm9EXxZSlRxpUVi76RF7qFzVlHZ76VocXIj0KcF2JS1C7hvuCqSYrfrcd
         aExtPXQJCkmLu9MU2BFRqfyNuJOUaProlMsbt1lO5Xqa8OT/wz8keNOHTzF0kKk+WzT/
         CWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l20ghDaBITcWUJdBjFantj3la1r6idQ6rjpXrXpW8d0=;
        b=J9bV9BQFRYXM7GHhx/cRPd1rBAkZyzMlf1743PeU9TX204C5MBd3yNKhrOEz5VS0cq
         86bQe7f3abBaFdcPTJddvYnzt9hMHitZ1eGuUu+bcIy4VJCqQHM9y44b+AKwfHWJ0lFT
         mSghHO0ZlunOjPhrXBf1TgssMUKQW3MuxR3IT5yhN7EQrqOuY1xbHnb4znRMjcJm4lyW
         DcZdAul3fvbRAE6/KsrzZQB+LkbVM1AgvocJIWbL2IHzWXwC8XtGfHETdtRBjsSaWA8K
         HZpUi+IuPAYPCrm7ATbyfDUkeZKpRlnErhXqlGgsnaAepQkEOxsgCFIiV/QZnWxACYUz
         epQw==
X-Gm-Message-State: AOAM531Bde80YQx3btIDnv5agaTD+n4muThxJHmjk6RYZndQtpfbnsT3
        of0wDReL+lbjCJALVwFXVEs=
X-Google-Smtp-Source: ABdhPJySH3tmQbbmZq5YUNPFZUGN1wGTVYZXEp4zoRr4SmpAXJD1aXVMQQeB/UzGRvYv2TnkUWiUpQ==
X-Received: by 2002:adf:828b:: with SMTP id 11mr29481518wrc.58.1592952504987;
        Tue, 23 Jun 2020 15:48:24 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id g144sm5671179wme.2.2020.06.23.15.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 15:48:24 -0700 (PDT)
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
Subject: [PATCH v2 03/12] arm64: dts: qcom: msm8994: Add a proper CPU map
Date:   Wed, 24 Jun 2020 00:48:02 +0200
Message-Id: <20200623224813.297077-4-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623224813.297077-1-konradybcio@gmail.com>
References: <20200623224813.297077-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a proper CPU map to enable the use of all 8 cores.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 112 +++++++++++++++++++++++---
 1 file changed, 102 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 23e50c30669b..e7f4b06eb12c 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -28,24 +28,116 @@ sleep_clk: sleep_clk {
 	};
 
 	cpus {
-		#address-cells = <1>;
+		#address-cells = <2>;
 		#size-cells = <0>;
+
+		CPU0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+			L2_0: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+			};
+		};
+
+		CPU1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x1>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+		};
+
+		CPU2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x2>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+		};
+
+		CPU3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x3>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+		};
+
+		CPU4: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57";
+			reg = <0x0 0x100>;
+			enable-method = "psci";
+			next-level-cache = <&L2_1>;
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
+			enable-method = "psci";
+			next-level-cache = <&L2_1>;
+		};
+
+		CPU6: cpu@102 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57";
+			reg = <0x0 0x101>;
+			enable-method = "psci";
+			next-level-cache = <&L2_1>;
+		};
+
+		CPU7: cpu@103 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57";
+			reg = <0x0 0x101>;
+			enable-method = "psci";
+			next-level-cache = <&L2_1>;
+		};
+
 		cpu-map {
 			cluster0 {
 				core0 {
 					cpu = <&CPU0>;
 				};
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
 			};
-		};
 
-		CPU0: cpu@0 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a53";
-			reg = <0x0>;
-			next-level-cache = <&L2_0>;
-			L2_0: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
+			cluster1 {
+				core0 {
+					cpu = <&CPU4>;
+				};
+
+				core1 {
+					cpu = <&CPU5>;
+				};
+
+				core2 {
+					cpu = <&CPU6>;
+				};
+
+				core3 {
+					cpu = <&CPU7>;
+				};
 			};
 		};
 	};
-- 
2.27.0

