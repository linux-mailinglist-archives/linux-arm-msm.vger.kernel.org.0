Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1863230735
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2019 05:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbfEaDyY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 May 2019 23:54:24 -0400
Received: from mail-it1-f169.google.com ([209.85.166.169]:55216 "EHLO
        mail-it1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727007AbfEaDyR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 May 2019 23:54:17 -0400
Received: by mail-it1-f169.google.com with SMTP id h20so13557883itk.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2019 20:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kagssQd3QuWugHezIJ6doapoPYga+HnLQRv+8NMyX9g=;
        b=aVaU2Uk/PSvFOR2ZTUEkpLv50UR082xEm5HsKlrw7QgZckzEHtXA7yO/Wn/WOBbJvJ
         Dc+RwCg9LLpK+kEt8JnxklzRSCovp7PitZw296lYP8Jd1UwgpjL6wVVrUTMb+9Bc9n+N
         t3Maw5oZUPapO1nFVOsnDqMKzA6i4fmK+kL1wanbzG8ogV628MK9QBHGEZKqK77sc8Wg
         gEHiQzbr0xcVtCqK6elbQQ1PkYtX5ZPymVlQtCfCogAJWOQT7ZhIg+V/xQd8Q9pgDbYZ
         zifSkJyuzPAChGKjgwm6JomDh11WZ8yM0/5ykVmjJzQLsMFc391cvHSKIpBnUCPJl/x6
         CBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kagssQd3QuWugHezIJ6doapoPYga+HnLQRv+8NMyX9g=;
        b=TNN8/ZPsyu6EVkid95T640Q9lpa1d86AHnphyZQ+uKYBVVGg9MA2924K9Hw8SIyAjx
         ldmJbUYiC8MyGjsc0YkYV4hG5pqjsTXhUmXXMERy1EgKqvs6qv3AHQ0DjXSetNNoc5TI
         5TsfbdsjmwQ2TpVNPC6jw6e7D6NS+mCXyz4ZYpkmWaEarRxv0pN9k6bdOqzOFJGn8woQ
         vsJ/SJXa9YcPKeYO6/0S1cchIb+IsxEMTJYDqUyjYJQ8hPwDwuqyM3NJ4uvqKFTdRPWE
         3LC7tcw1PRXvCP1GzLTavFDtB6+iymprvAvgAhcX2UMBnPx8T7p6nRw+Shcst1O4+aWH
         3rmg==
X-Gm-Message-State: APjAAAWRNQyiRhv+DfiesE1o5Wx8OqRUHzY3YEJ9OYsufGW2dhKggVIX
        bK1CSDR1OjmahnOr3P5nf8Xokw==
X-Google-Smtp-Source: APXvYqwU/ZRoDGo6axXL+D8tg1NufQkmrF7bSAtLkJC7p296STpfjSogYdgLZwKpdUbt2XAzDoRcpA==
X-Received: by 2002:a24:5095:: with SMTP id m143mr5427071itb.68.1559274856806;
        Thu, 30 May 2019 20:54:16 -0700 (PDT)
Received: from localhost.localdomain (c-71-195-29-92.hsd1.mn.comcast.net. [71.195.29.92])
        by smtp.gmail.com with ESMTPSA id q15sm1626947ioi.15.2019.05.30.20.54.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 20:54:16 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, arnd@arndb.de, bjorn.andersson@linaro.org,
        ilias.apalodimas@linaro.org
Cc:     evgreen@chromium.org, benchan@google.com, ejcaruso@google.com,
        cpratapa@codeaurora.org, syadagir@codeaurora.org,
        subashab@codeaurora.org, abhishek.esse@gmail.com,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 16/17] arm64: dts: sdm845: add IPA information
Date:   Thu, 30 May 2019 22:53:47 -0500
Message-Id: <20190531035348.7194-17-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190531035348.7194-1-elder@linaro.org>
References: <20190531035348.7194-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add IPA-related nodes and definitions to "sdm845.dtsi".

Signed-off-by: Alex Elder <elder@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 51 ++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index fcb93300ca62..985479925af8 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -20,6 +20,7 @@
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/clock/qcom,gcc-sdm845.h>
 #include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/interconnect/qcom,sdm845.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -517,6 +518,17 @@
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		ipa_smp2p_out: ipa-ap-to-modem {
+			qcom,entry-name = "ipa";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		ipa_smp2p_in: ipa-modem-to-ap {
+			qcom,entry-name = "ipa";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	smp2p-slpi {
@@ -1268,6 +1280,45 @@
 			};
 		};
 
+		ipa@1e40000 {
+			compatible = "qcom,sdm845-ipa";
+
+			modem-init;
+
+			reg = <0 0x1e40000 0 0x7000>,
+			      <0 0x1e47000 0 0x2000>,
+			      <0 0x1e04000 0 0x2c000>;
+			reg-names = "ipa-reg",
+				    "ipa-shared",
+				    "gsi";
+
+			interrupts-extended =
+					<&intc 0 311 IRQ_TYPE_EDGE_RISING>,
+					<&intc 0 432 IRQ_TYPE_LEVEL_HIGH>,
+					<&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					<&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ipa",
+					  "gsi",
+					  "ipa-clock-query",
+					  "ipa-setup-ready";
+
+			clocks = <&rpmhcc RPMH_IPA_CLK>;
+			clock-names = "core";
+
+			interconnects =
+				<&rsc_hlos MASTER_IPA &rsc_hlos SLAVE_EBI1>,
+				<&rsc_hlos MASTER_IPA &rsc_hlos SLAVE_IMEM>,
+				<&rsc_hlos MASTER_APPSS_PROC &rsc_hlos SLAVE_IPA_CFG>;
+			interconnect-names = "memory",
+					     "imem",
+					     "config";
+
+			qcom,smem-states = <&ipa_smp2p_out 0>,
+					   <&ipa_smp2p_out 1>;
+			qcom,smem-state-names = "ipa-clock-enabled-valid",
+						"ipa-clock-enabled";
+		};
+
 		tcsr_mutex_regs: syscon@1f40000 {
 			compatible = "syscon";
 			reg = <0 0x01f40000 0 0x40000>;
-- 
2.20.1

