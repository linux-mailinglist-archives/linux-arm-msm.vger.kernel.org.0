Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50E5EF597E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 22:15:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732164AbfKHVPY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 16:15:24 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:35274 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731743AbfKHVPY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 16:15:24 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B9D536146F; Fri,  8 Nov 2019 21:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573247723;
        bh=NtCjd02v1Yds9AVIHvham7yjJZsxN1d2DMJTV0OeTJY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=E6RDJQz/Iz2rXlNIER8tWf5prgdkcAg5XxJtBuLd7wO+3UL7MXgnTXh1zGvt9p4IA
         /I5cTIioSMsf+QsXFUw2mwYski2nLn5nMm4eHsZVd0VDEnRiaRvOrfgpHFmQ3o3Fur
         mcnpZxeYBb7jObWyjPTcQhQdbKte+q9U+NoAQA3w=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jhugo-perf-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3CC8661275;
        Fri,  8 Nov 2019 21:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573247720;
        bh=NtCjd02v1Yds9AVIHvham7yjJZsxN1d2DMJTV0OeTJY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O3u/QHiVtXN1/TRGGxZsCGWrvgJQ7Ex9JTHmriYpljoD1XxwgLF/+PlsHm2wWeV8g
         egyJi7C/JIBtgNQTu/IlcRUg+w1qiEF4hIXH2ROsC8ItHjhuNSN+2Pk7/tEO2kOnZz
         iEfkIbWuTzPF5Z/pTpUPRpI7YzTJLXdOhkwPDY50=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3CC8661275
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     marc.w.gonzalez@free.fr, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v7 6/6] arm64: dts: qcom: msm8998: Add mmcc node
Date:   Fri,  8 Nov 2019 14:15:10 -0700
Message-Id: <1573247710-21035-1-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1573247450-19738-1-git-send-email-jhugo@codeaurora.org>
References: <1573247450-19738-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add MSM8998 Multimedia Clock Controller DT node.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 28 +++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 2f0d4366724b..1d2e8357fb01 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -3,6 +3,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-msm8998.h>
+#include <dt-bindings/clock/qcom,mmcc-msm8998.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -1758,6 +1759,33 @@
 			#size-cells = <0>;
 		};
 
+		mmcc: clock-controller@c8c0000 {
+			compatible = "qcom,mmcc-msm8998";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			reg = <0x0c8c0000 0x40000>;
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&gcc GPLL0_OUT_MAIN>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "xo",
+				      "gpll0",
+				      "dsi0dsi",
+				      "dsi0byte",
+				      "dsi1dsi",
+				      "dsi1byte",
+				      "hdmipll",
+				      "dpvco",
+				      "dplink";
+		};
+
 		apcs_glb: mailbox@17911000 {
 			compatible = "qcom,msm8998-apcs-hmss-global";
 			reg = <0x17911000 0x1000>;
-- 
2.17.1

